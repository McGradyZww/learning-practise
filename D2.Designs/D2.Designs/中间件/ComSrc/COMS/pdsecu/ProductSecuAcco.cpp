﻿#include <Include/ld_db_interface.h>
#include <Include/modules_id.h>
#include <Include/tag_def.h>
#include <Include/ts_subcall_interface.h>
#include <Include/fastmsg_factory_interface.h>
#include <Include/subpub_interface.h>

#include <Include/comexport.h>
#include <Include/biz_tag_def.h>
#include <pub/ldstring.h>
#include <pub/lddate.h>
#include <math.h>

ITS_Subcall_interface* glpTSSubcallSerives = NULL;
IFastmsgFactory_Interface* glpFastMsgFactory = NULL;
IPubSub_interface* glpPubSub_Interface = NULL;

int LD_CALL_MODE fnFunc0(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc1(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc2(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc3(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc4(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc5(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc6(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc7(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc8(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc9(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc10(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc11(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc12(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc13(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc14(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc15(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc16(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc17(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc18(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc19(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc20(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc21(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc22(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc23(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc24(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);

API_EXPORT void LD_CALL_MODE Onload(char*, Icontainer_interface* lpContainer)
{
    IUnKnown* lpProcessor = lpContainer->GetMouleByName(MODULE_PROCESSOR);
    IUnKnown* lpTSSubcallSerives = NULL;
    lpProcessor->QueryInterface(TS_SUBCALL_INTERFACE, &lpTSSubcallSerives);
    glpTSSubcallSerives = (ITS_Subcall_interface*)lpTSSubcallSerives;
    glpFastMsgFactory = (IFastmsgFactory_Interface*)lpContainer->GetMouleByName(MODULE_FASTMSG);

    IUnKnown* lpPubSubInt = NULL;
    IUnKnown* lpPubSubSvr = lpContainer->GetMouleByName(MODULE_PUBSUBSVR);
    if(lpPubSubSvr)
    {
        lpPubSubSvr->QueryInterface(MODULE_PUBSUBINT, &lpPubSubInt);
        glpPubSub_Interface=(IPubSub_interface*)lpPubSubInt;
    }

    return;
}
API_EXPORT void LD_CALL_MODE Onunload()
{

    return;
}

API_EXPORT void LD_CALL_MODE Onstart()
{
    return;
}

API_EXPORT void LD_CALL_MODE Onstop()
{
    return;
}

API_EXPORT int LD_CALL_MODE QueryInterface(int iFunIndex, LPBIZ_FUNC_INFO bizFuncInfo)
{
    int nRet = 0;
    if (iFunIndex==0)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.1");
        bizFuncInfo->lpFunc = fnFunc0;
    }
    else if (iFunIndex==1)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.2");
        bizFuncInfo->lpFunc = fnFunc1;
    }
    else if (iFunIndex==2)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.40");
        bizFuncInfo->lpFunc = fnFunc2;
    }
    else if (iFunIndex==3)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.41");
        bizFuncInfo->lpFunc = fnFunc3;
    }
    else if (iFunIndex==4)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.42");
        bizFuncInfo->lpFunc = fnFunc4;
    }
    else if (iFunIndex==5)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.43");
        bizFuncInfo->lpFunc = fnFunc5;
    }
    else if (iFunIndex==6)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.44");
        bizFuncInfo->lpFunc = fnFunc6;
    }
    else if (iFunIndex==7)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.45");
        bizFuncInfo->lpFunc = fnFunc7;
    }
    else if (iFunIndex==8)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.46");
        bizFuncInfo->lpFunc = fnFunc8;
    }
    else if (iFunIndex==9)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.47");
        bizFuncInfo->lpFunc = fnFunc9;
    }
    else if (iFunIndex==10)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.48");
        bizFuncInfo->lpFunc = fnFunc10;
    }
    else if (iFunIndex==11)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.49");
        bizFuncInfo->lpFunc = fnFunc11;
    }
    else if (iFunIndex==12)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.51");
        bizFuncInfo->lpFunc = fnFunc12;
    }
    else if (iFunIndex==13)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.61");
        bizFuncInfo->lpFunc = fnFunc13;
    }
    else if (iFunIndex==14)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.62");
        bizFuncInfo->lpFunc = fnFunc14;
    }
    else if (iFunIndex==15)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.63");
        bizFuncInfo->lpFunc = fnFunc15;
    }
    else if (iFunIndex==16)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.64");
        bizFuncInfo->lpFunc = fnFunc16;
    }
    else if (iFunIndex==17)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.501");
        bizFuncInfo->lpFunc = fnFunc17;
    }
    else if (iFunIndex==18)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.71");
        bizFuncInfo->lpFunc = fnFunc18;
    }
    else if (iFunIndex==19)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.72");
        bizFuncInfo->lpFunc = fnFunc19;
    }
    else if (iFunIndex==20)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.73");
        bizFuncInfo->lpFunc = fnFunc20;
    }
    else if (iFunIndex==21)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.74");
        bizFuncInfo->lpFunc = fnFunc21;
    }
    else if (iFunIndex==22)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.75");
        bizFuncInfo->lpFunc = fnFunc22;
    }
    else if (iFunIndex==23)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.76");
        bizFuncInfo->lpFunc = fnFunc23;
    }
    else if (iFunIndex==24)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.1.77");
        bizFuncInfo->lpFunc = fnFunc24;
    }
    else
    {
        strcpy(bizFuncInfo->szFuncName, "");
        bizFuncInfo->lpFunc = NULL;
        nRet = -1;
    }
    return nRet;
}

API_EXPORT const char* LD_CALL_MODE GetLibVersion()
{
    return "20190719";
}

//逻辑_产品证券_账户_授权开立交易中台账户
int LD_CALL_MODE fnFunc0(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_co_no;
    char v_out_acco[33];
    char v_trade_pwd[65];
    char v_comm_pwd[65];
    char v_sh_stock_acco[17];
    char v_sz_stock_acco[17];
    double v_acco_amt;
    double v_commis_ratio;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_pd_no;
    int v_asset_acco_no;
    int v_exch_group_no;
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_pd_qty_max;
    int v_max_acco_count;
    int v_opor_qty_max;
    char v_pd_code[33];
    char v_pd_name[65];
    char v_pd_flname[256];
    char v_pd_manager[33];
    char v_fund_reg_code[17];
    int v_pd_type;
    char v_apply_currency[4];
    char v_crncy_type[4];
    double v_first_asset;
    double v_first_amt;
    double v_pd_all_share;
    double v_pre_share;
    double v_his_max_per_nav;
    double v_pre_nav;
    char v_coust_full_name[256];
    char v_coust_acco[17];
    char v_coust_acco_name[65];
    char v_remark_info[256];
    int v_cost_calc_type;
    char v_allow_exch[65];
    char v_allow_stock_type[2049];
    int v_comm_appr_oper;
    double v_market_price_ratio;
    char v_forbid_order_dir[65];
    double v_comm_no_limit_price_ratio;
    double v_curr_share;
    char v_registration_agency[33];
    double v_warn_posi_value;
    double v_close_posi_value;
    double v_target_posi_ratio;
    double v_beta_coeffi;
    int v_index_value;
    char v_custom_pd_class[256];
    char v_busi_config_str[65];
    int v_pd_cost_calc_type;
    char v_pd_status[3];
    int v_asac_update_times;
    char v_pd_apply_currency[4];
    char v_pd_crncy_type[4];
    double v_pd_first_asset;
    double v_pd_curr_share;
    double v_pd_pre_share;
    double v_pd_his_max_per_nav;
    double v_pd_pre_nav;
    int v_update_times;
    double v_pd_market_price_ratio;
    double v_pd_comm_no_limit_price_ratio;
    int v_target_opor_no;
    char v_oper_remark_info[256];
    char v_exch_group_code[33];
    char v_exch_group_name[65];
    int v_default_group_flag;
    int v_futu_default_group_flag;
    int v_fina_loan_default_group_flag;
    double v_exch_group_dist_pd_amt;
    double v_exch_group_pd_share;
    char v_exch_group_status[3];
    double v_exch_group_begin_NAV;
    char v_asset_acco[17];
    char v_asset_acco_name[65];
    int v_asset_acco_type;
    char v_split_fee_typr_str[65];
    char v_busi_limit_str[2049];
    int v_exter_comm_flag;
    int v_sh_hk_trader_type;
    int v_sz_hk_trader_type;
    char v_busi_depart[256];
    int v_syn_update_cost_amt;
    char v_stock_acco_name[65];
    char v_stock_acco_apoint_status[3];
    int v_exch_no;
    char v_stock_acco[17];
    int v_stock_acco_no;
    double v_occur_amt;
    int64 v_asac_cash_id;
    double v_asac_begin_amt;
    double v_asac_curr_amt;
    double v_asac_frozen_amt;
    double v_asac_unfroz_amt;
    double v_asac_pre_settle_amt;
    double v_asac_shsz_avail_change_amt;
    double v_asac_hk_avail_change_amt;
    double v_asac_amt_check_diff;
    double v_asac_T_hk_buy_total_amt;
    double v_asac_T_hk_sell_total_amt;
    double v_asac_T1_hk_buy_total_amt;
    double v_asac_T1_hk_sell_total_amt;
    double v_asac_total_rece_amt;
    double v_asac_total_payab_amt;
    double v_asac_realize_pandl;
    double v_asac_intrst_rate;
    double v_asac_intrst_base_amt;
    double v_asac_pre_entry_intrst_amt;
    int64 v_exgp_cash_id;
    double v_exgp_begin_amt;
    double v_exgp_curr_amt;
    double v_exgp_frozen_amt;
    double v_exgp_unfroz_amt;
    double v_exgp_pre_settle_amt;
    double v_exgp_shsz_avail_change_amt;
    double v_exgp_hk_avail_change_amt;
    double v_exgp_amt_check_diff;
    double v_exgp_T_hk_buy_total_amt;
    double v_exgp_T_hk_sell_total_amt;
    double v_exgp_T1_hk_buy_total_amt;
    double v_exgp_T1_hk_sell_total_amt;
    double v_exch_group_total_rece_amt;
    double v_exch_group_total_payab_amt;
    double v_exgp_realize_pandl;
    double v_exch_group_intrst_rate;
    double v_exch_group_intrst_base_amt;
    double v_exch_group_pre_entry_intrst_amt;
    char v_log_error_code[33];
    char v_log_error_info[256];


IFastMessage* lpPubMsg = NULL;
int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_co_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_trade_pwd, " ");
    strcpy(v_comm_pwd, " ");
    strcpy(v_sh_stock_acco, " ");
    strcpy(v_sz_stock_acco, " ");
    v_acco_amt=0;
    v_commis_ratio=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_pd_no=0;
    v_asset_acco_no=0;
    v_exch_group_no=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_pd_qty_max=0;
    v_max_acco_count=0;
    v_opor_qty_max=0;
    strcpy(v_pd_code, " ");
    strcpy(v_pd_name, " ");
    strcpy(v_pd_flname, " ");
    strcpy(v_pd_manager, " ");
    strcpy(v_fund_reg_code, " ");
    v_pd_type=0;
    strcpy(v_apply_currency, "CNY");
    strcpy(v_crncy_type, "CNY");
    v_first_asset=0;
    v_first_amt=0;
    v_pd_all_share=0;
    v_pre_share=0;
    v_his_max_per_nav=0;
    v_pre_nav=0;
    strcpy(v_coust_full_name, " ");
    strcpy(v_coust_acco, " ");
    strcpy(v_coust_acco_name, " ");
    strcpy(v_remark_info, " ");
    v_cost_calc_type=0;
    strcpy(v_allow_exch, " ");
    strcpy(v_allow_stock_type, " ");
    v_comm_appr_oper=0;
    v_market_price_ratio=0;
    strcpy(v_forbid_order_dir, " ");
    v_comm_no_limit_price_ratio=0;
    v_curr_share=0;
    strcpy(v_registration_agency, " ");
    v_warn_posi_value=0;
    v_close_posi_value=0;
    v_target_posi_ratio=0;
    v_beta_coeffi=0;
    v_index_value=0;
    strcpy(v_custom_pd_class, " ");
    strcpy(v_busi_config_str, " ");
    v_pd_cost_calc_type=0;
    strcpy(v_pd_status, "0");
    v_asac_update_times=0;
    strcpy(v_pd_apply_currency, "CNY");
    strcpy(v_pd_crncy_type, "CNY");
    v_pd_first_asset=0;
    v_pd_curr_share=0;
    v_pd_pre_share=0;
    v_pd_his_max_per_nav=0;
    v_pd_pre_nav=0;
    v_update_times=1;
    v_pd_market_price_ratio=0;
    v_pd_comm_no_limit_price_ratio=0;
    v_target_opor_no=0;
    strcpy(v_oper_remark_info, " ");
    strcpy(v_exch_group_code, " ");
    strcpy(v_exch_group_name, " ");
    v_default_group_flag=0;
    v_futu_default_group_flag=0;
    v_fina_loan_default_group_flag=0;
    v_exch_group_dist_pd_amt=0;
    v_exch_group_pd_share=0;
    strcpy(v_exch_group_status, "0");
    v_exch_group_begin_NAV=0;
    strcpy(v_asset_acco, " ");
    strcpy(v_asset_acco_name, " ");
    v_asset_acco_type=0;
    strcpy(v_split_fee_typr_str, " ");
    strcpy(v_busi_limit_str, " ");
    v_exter_comm_flag=0;
    v_sh_hk_trader_type=0;
    v_sz_hk_trader_type=0;
    strcpy(v_busi_depart, " ");
    v_syn_update_cost_amt=0;
    strcpy(v_stock_acco_name, " ");
    strcpy(v_stock_acco_apoint_status, "0");
    v_exch_no=0;
    strcpy(v_stock_acco, " ");
    v_stock_acco_no=0;
    v_occur_amt=0;
    v_asac_cash_id=0;
    v_asac_begin_amt=0;
    v_asac_curr_amt=0;
    v_asac_frozen_amt=0;
    v_asac_unfroz_amt=0;
    v_asac_pre_settle_amt=0;
    v_asac_shsz_avail_change_amt=0;
    v_asac_hk_avail_change_amt=0;
    v_asac_amt_check_diff=0;
    v_asac_T_hk_buy_total_amt=0;
    v_asac_T_hk_sell_total_amt=0;
    v_asac_T1_hk_buy_total_amt=0;
    v_asac_T1_hk_sell_total_amt=0;
    v_asac_total_rece_amt=0;
    v_asac_total_payab_amt=0;
    v_asac_realize_pandl=0;
    v_asac_intrst_rate=0;
    v_asac_intrst_base_amt=0;
    v_asac_pre_entry_intrst_amt=0;
    v_exgp_cash_id=0;
    v_exgp_begin_amt=0;
    v_exgp_curr_amt=0;
    v_exgp_frozen_amt=0;
    v_exgp_unfroz_amt=0;
    v_exgp_pre_settle_amt=0;
    v_exgp_shsz_avail_change_amt=0;
    v_exgp_hk_avail_change_amt=0;
    v_exgp_amt_check_diff=0;
    v_exgp_T_hk_buy_total_amt=0;
    v_exgp_T_hk_sell_total_amt=0;
    v_exgp_T1_hk_buy_total_amt=0;
    v_exgp_T1_hk_sell_total_amt=0;
    v_exch_group_total_rece_amt=0;
    v_exch_group_total_payab_amt=0;
    v_exgp_realize_pandl=0;
    v_exch_group_intrst_rate=0;
    v_exch_group_intrst_base_amt=0;
    v_exch_group_pre_entry_intrst_amt=0;
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    strncpy(v_out_acco, lpInBizMsg->GetString(LDBIZ_OUT_ACCO_STR),32);
    v_out_acco[32] = '\0';
    strncpy(v_trade_pwd, lpInBizMsg->GetString(LDBIZ_TRADE_PWD_STR),64);
    v_trade_pwd[64] = '\0';
    strncpy(v_comm_pwd, lpInBizMsg->GetString(LDBIZ_COMM_PWD_STR),64);
    v_comm_pwd[64] = '\0';
    strncpy(v_sh_stock_acco, lpInBizMsg->GetString(LDBIZ_SH_STOCK_ACCO_STR),16);
    v_sh_stock_acco[16] = '\0';
    strncpy(v_sz_stock_acco, lpInBizMsg->GetString(LDBIZ_SZ_STOCK_ACCO_STR),16);
    v_sz_stock_acco[16] = '\0';
    v_acco_amt = lpInBizMsg->GetDouble(LDBIZ_ACCO_AMT_FLOAT);
    v_commis_ratio = lpInBizMsg->GetDouble(LDBIZ_COMMIS_RATIO_FLOAT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;
    IFastMessage* lpTSCall1Req3 = NULL;
    IFastMessage* lpTSCall1Ans3 = NULL;
    IFastMessage* lpTSCall1Req4 = NULL;
    IFastMessage* lpTSCall1Ans4 = NULL;
    IFastMessage* lpTSCall1Req5 = NULL;
    IFastMessage* lpTSCall1Ans5 = NULL;
    IFastMessage* lpTSCall1Req6 = NULL;
    IFastMessage* lpTSCall1Ans6 = NULL;
    IFastMessage* lpTSCall1Req7 = NULL;
    IFastMessage* lpTSCall1Ans7 = NULL;
    IFastMessage* lpTSCall1Req8 = NULL;
    IFastMessage* lpTSCall1Ans8 = NULL;
    IFastMessage* lpTSCall1Req9 = NULL;
    IFastMessage* lpTSCall1Ans9 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份获取数量上限]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.14", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.14]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));
    v_pd_qty_max = lpTSCall1Ans0->GetInt32(LDBIZ_PD_QTY_MAX_INT);
    v_max_acco_count = lpTSCall1Ans0->GetInt32(LDBIZ_MAX_ACCO_COUNT_INT);
    v_opor_qty_max = lpTSCall1Ans0->GetInt32(LDBIZ_OPOR_QTY_MAX_INT);


    // set @产品编码#=@外部账号#;
    strcpy(v_pd_code,v_out_acco);

    // set @产品名称#=@外部账号#;
    strcpy(v_pd_name,v_out_acco);

    // set @产品全称#=@外部账号#;
    strcpy(v_pd_flname,v_out_acco);

    // set @产品管理人#=@外部账号#;
    strcpy(v_pd_manager,v_out_acco);

    // set @基金备案编号#=" ";
    strcpy(v_fund_reg_code," ");

    // set @产品类型#=1;
    v_pd_type=1;

    // set @募集币种#="CNY";
    strcpy(v_apply_currency,"CNY");

    // set @本币币种#="CNY";
    strcpy(v_crncy_type,"CNY");

    // set @原始资产#=@账户金额#;
    v_first_asset=v_acco_amt;

    // set @原始金额#=@账户金额#;
    v_first_amt=v_acco_amt;

    // set @产品总份额#=@账户金额#;
    v_pd_all_share=v_acco_amt;

    // set @昨日份额#=@账户金额#;
    v_pre_share=v_acco_amt;

    // set @历史最高单位净值#=@账户金额#;
    v_his_max_per_nav=v_acco_amt;

    // set @昨日净值#=@账户金额#;
    v_pre_nav=v_acco_amt;

    // set @境内托管人全名#=" ";
    strcpy(v_coust_full_name," ");

    // set @境内托管账户#=" ";
    strcpy(v_coust_acco," ");

    // set @境内托管账户名#=" ";
    strcpy(v_coust_acco_name," ");

    // set @备注信息#="交易中台开户 !";
    strcpy(v_remark_info,"交易中台开户 !");

    // set @成本计算方式#=1;
    v_cost_calc_type=1;

    // set @允许投资市场#="1;2;3;4;5;11;12;13;14;101;102;103;104;105;106;107;108";
    strcpy(v_allow_exch,"1;2;3;4;5;11;12;13;14;101;102;103;104;105;106;107;108");

    // set @允许操作证券类型#="301;302;311;312;313;314;315;316;331;332;333;341;351;352;401;402;403;404;405;406;407;408;409;410;431;432;433;434;435;436;501;502;503;504;505;506;507;508;509;510;511;512;513;514;515;516;517;518;601;602;603;631;632;1;2;3;4;5;6;7;8;21;22;23;24;25;26;27;28;29;30;31;32;33;34;35;36;37;38;39;40;41;42;43;44;45;51;52;53;54;55;56;57;58;59;60;61;62;63;64;71;72;73;74;101;102;81";
    strcpy(v_allow_stock_type,"301;302;311;312;313;314;315;316;331;332;333;341;351;352;401;402;403;404;405;406;407;408;409;410;431;432;433;434;435;436;501;502;503;504;505;506;507;508;509;510;511;512;513;514;515;516;517;518;601;602;603;631;632;1;2;3;4;5;6;7;8;21;22;23;24;25;26;27;28;29;30;31;32;33;34;35;36;37;38;39;40;41;42;43;44;45;51;52;53;54;55;56;57;58;59;60;61;62;63;64;71;72;73;74;101;102;81");

    // set @指令审批操作员#=0;
    v_comm_appr_oper=0;

    // set @市价冻结浮动比例#=0;
    v_market_price_ratio=0;

    // set @禁止订单方向#=" ";
    strcpy(v_forbid_order_dir," ");

    // set @指令不限价浮动比例#=0;
    v_comm_no_limit_price_ratio=0;

    // set @当前份额# = @产品总份额#;
    v_curr_share = v_pd_all_share;

    // set @登记机构# = "0";
    strcpy(v_registration_agency,"0");

    // set @预警线# = 0;
    v_warn_posi_value = 0;

    // set @平仓线# = 0;
    v_close_posi_value = 0;

    // set @目标仓位# = 0;
    v_target_posi_ratio = 0;

    // set @beta系数# = 0;
    v_beta_coeffi = 0;

    // set @索引值# = 0;
    v_index_value = 0;

    // set @自定义产品分类# =" ";
    strcpy(v_custom_pd_class," ");

    // set @业务控制配置串# = @机构业务控制配置串#;
    strcpy(v_busi_config_str,v_co_busi_config_str);
    //调用过程[事务_产品_公共接口_新增产品信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.6.36", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_PD_CODE_STR,v_pd_code);
    lpTSCall1Req1->SetString(LDBIZ_PD_NAME_STR,v_pd_name);
    lpTSCall1Req1->SetString(LDBIZ_PD_FLNAME_STR,v_pd_flname);
    lpTSCall1Req1->SetString(LDBIZ_FUND_REG_CODE_STR,v_fund_reg_code);
    lpTSCall1Req1->SetString(LDBIZ_PD_MANAGER_STR,v_pd_manager);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_TYPE_INT,v_pd_type);
    lpTSCall1Req1->SetString(LDBIZ_APPLY_CURRENCY_STR,v_apply_currency);
    lpTSCall1Req1->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req1->SetDouble(LDBIZ_FIRST_ASSET_FLOAT,v_first_asset);
    lpTSCall1Req1->SetDouble(LDBIZ_FIRST_AMT_FLOAT,v_first_amt);
    lpTSCall1Req1->SetDouble(LDBIZ_PD_ALL_SHARE_FLOAT,v_pd_all_share);
    lpTSCall1Req1->SetDouble(LDBIZ_CURR_SHARE_FLOAT,v_curr_share);
    lpTSCall1Req1->SetDouble(LDBIZ_PRE_SHARE_FLOAT,v_pre_share);
    lpTSCall1Req1->SetDouble(LDBIZ_HIS_MAX_PER_NAV_FLOAT,v_his_max_per_nav);
    lpTSCall1Req1->SetDouble(LDBIZ_PRE_NAV_FLOAT,v_pre_nav);
    lpTSCall1Req1->SetString(LDBIZ_COUST_FULL_NAME_STR,v_coust_full_name);
    lpTSCall1Req1->SetString(LDBIZ_COUST_ACCO_STR,v_coust_acco);
    lpTSCall1Req1->SetString(LDBIZ_COUST_ACCO_NAME_STR,v_coust_acco_name);
    lpTSCall1Req1->SetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT,v_warn_posi_value);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT,v_close_posi_value);
    lpTSCall1Req1->SetDouble(LDBIZ_TARGET_POSI_RATIO_FLOAT,v_target_posi_ratio);
    lpTSCall1Req1->SetDouble(LDBIZ_BETA_COEFFI_FLOAT,v_beta_coeffi);
    lpTSCall1Req1->SetString(LDBIZ_CUSTOM_PD_CLASS_STR,v_custom_pd_class);
    lpTSCall1Req1->SetInt32(LDBIZ_INDEX_VALUE_INT,v_index_value);
    lpTSCall1Req1->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    lpTSCall1Req1->SetInt32(LDBIZ_COST_CALC_TYPE_INT,v_cost_calc_type);
    lpTSCall1Req1->SetString(LDBIZ_ALLOW_EXCH_STR,v_allow_exch);
    lpTSCall1Req1->SetString(LDBIZ_ALLOW_STOCK_TYPE_STR,v_allow_stock_type);
    lpTSCall1Req1->SetString(LDBIZ_BUSI_CONFIG_STR_STR,v_busi_config_str);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_APPR_OPER_INT,v_comm_appr_oper);
    lpTSCall1Req1->SetDouble(LDBIZ_MARKET_PRICE_RATIO_FLOAT,v_market_price_ratio);
    lpTSCall1Req1->SetString(LDBIZ_FORBID_ORDER_DIR_STR,v_forbid_order_dir);
    lpTSCall1Req1->SetDouble(LDBIZ_COMM_NO_LIMIT_PRICE_RATIO_FLOAT,v_comm_no_limit_price_ratio);
    lpTSCall1Req1->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_QTY_MAX_INT,v_pd_qty_max);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.36]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    v_pd_cost_calc_type = lpTSCall1Ans1->GetInt32(LDBIZ_PD_COST_CALC_TYPE_INT);
    strcpy(v_pd_status, lpTSCall1Ans1->GetString(LDBIZ_PD_STATUS_STR));
    v_asac_update_times = lpTSCall1Ans1->GetInt32(LDBIZ_ASAC_UPDATE_TIMES_INT);


    // set @产品募集币种# = @募集币种#;
    strcpy(v_pd_apply_currency,v_apply_currency);

    // set @产品本币币种# = @本币币种#;
    strcpy(v_pd_crncy_type,v_crncy_type);

    // set @产品原始资产# = @原始资产#;
    v_pd_first_asset = v_first_asset;
    //产品总份额已有

    // set @产品当前份额# = @当前份额#;
    v_pd_curr_share = v_curr_share;

    // set @产品昨日份额# = @昨日份额#;
    v_pd_pre_share = v_pre_share;

    // set @产品历史最高单位净值# = @历史最高单位净值#;
    v_pd_his_max_per_nav = v_his_max_per_nav;

    // set @产品昨日净值# = @昨日净值#;
    v_pd_pre_nav = v_pre_nav;

    // set @更新次数# = 1;
    v_update_times = 1;

    // [主动推送][prod.prod][产品主推_产品_产品信息主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.180", 0);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetString(LDBIZ_PD_CODE_STR,v_pd_code);
    lpPubMsg->SetString(LDBIZ_PD_NAME_STR,v_pd_name);
    lpPubMsg->SetInt32(LDBIZ_PD_TYPE_INT,v_pd_type);
    lpPubMsg->SetString(LDBIZ_PD_APPLY_CURRENCY_STR,v_pd_apply_currency);
    lpPubMsg->SetString(LDBIZ_PD_CRNCY_TYPE_STR,v_pd_crncy_type);
    lpPubMsg->SetDouble(LDBIZ_PD_FIRST_ASSET_FLOAT,v_pd_first_asset);
    lpPubMsg->SetDouble(LDBIZ_PD_ALL_SHARE_FLOAT,v_pd_all_share);
    lpPubMsg->SetDouble(LDBIZ_PD_CURR_SHARE_FLOAT,v_pd_curr_share);
    lpPubMsg->SetDouble(LDBIZ_PD_PRE_SHARE_FLOAT,v_pd_pre_share);
    lpPubMsg->SetDouble(LDBIZ_PD_HIS_MAX_PER_NAV_FLOAT,v_pd_his_max_per_nav);
    lpPubMsg->SetDouble(LDBIZ_PD_PRE_NAV_FLOAT,v_pd_pre_nav);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("prod.prod", lpPubMsg);


    // set @产品成本计算方式# = @成本计算方式#;
    v_pd_cost_calc_type = v_cost_calc_type;

    // set @产品市价冻结浮动比例# = @市价冻结浮动比例#;
    v_pd_market_price_ratio = v_market_price_ratio;

    // set @产品指令不限价浮动比例# = @指令不限价浮动比例#;
    v_pd_comm_no_limit_price_ratio = v_comm_no_limit_price_ratio;

    // set @产品状态# = 《产品状态-正常》;
    strcpy(v_pd_status,"1");

    // [主动推送][prod.prodlimit][产品主推_产品_产品限制信息主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.181", 0);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_PD_COST_CALC_TYPE_INT,v_pd_cost_calc_type);
    lpPubMsg->SetDouble(LDBIZ_PD_MARKET_PRICE_RATIO_FLOAT,v_pd_market_price_ratio);
    lpPubMsg->SetDouble(LDBIZ_PD_COMM_NO_LIMIT_PRICE_RATIO_FLOAT,v_pd_comm_no_limit_price_ratio);
    lpPubMsg->SetString(LDBIZ_PD_STATUS_STR,v_pd_status);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("prod.prodlimit", lpPubMsg);


    // set @目标操作员编号# = @操作员编号#;
    v_target_opor_no = v_opor_no;

    // set @操作备注# = "新增产品信息";
    strcpy(v_oper_remark_info,"新增产品信息");
    //调用过程[事务_公共_公共接口_新增操作员可操作产品]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.45", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req2->SetInt32(LDBIZ_TARGET_OPOR_NO_INT,v_target_opor_no);
    lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_REMARK_INFO_STR,v_oper_remark_info);
    lpTSCall1Req2->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.45]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans2->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));


    // set @交易组编码# = @产品编码#;
    strcpy(v_exch_group_code,v_pd_code);

    // set @交易组名称# = @产品名称#;
    strcpy(v_exch_group_name,v_pd_name);

    // set @默认组标志# = 《默认组标志-是》;
    v_default_group_flag = 1;

    // set @期货默认组标志# = 《期货默认组标志-是》;
    v_futu_default_group_flag = 1;

    // set @融资融券默认组标志# = 《融资融券默认组标志-是》;
    v_fina_loan_default_group_flag = 1;

    // set @分配产品资金# = 0;
    v_exch_group_dist_pd_amt = 0;

    // set @交易组产品份额# = @当前份额#;
    v_exch_group_pd_share = v_curr_share;
    //允许投资市场、允许操作证券类型、业务控制配置串、市价冻结浮动比例都取产品的入参;
    //调用过程[事务_公共_公共接口_新增交易组信息]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.24.51", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req3->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req3->SetString(LDBIZ_EXCH_GROUP_CODE_STR,v_exch_group_code);
    lpTSCall1Req3->SetString(LDBIZ_EXCH_GROUP_NAME_STR,v_exch_group_name);
    lpTSCall1Req3->SetInt32(LDBIZ_DEFAULT_GROUP_FLAG_INT,v_default_group_flag);
    lpTSCall1Req3->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req3->SetDouble(LDBIZ_FIRST_ASSET_FLOAT,v_first_asset);
    lpTSCall1Req3->SetDouble(LDBIZ_EXCH_GROUP_DIST_PD_AMT_FLOAT,v_exch_group_dist_pd_amt);
    lpTSCall1Req3->SetDouble(LDBIZ_EXCH_GROUP_PD_SHARE_FLOAT,v_exch_group_pd_share);
    lpTSCall1Req3->SetString(LDBIZ_ALLOW_EXCH_STR,v_allow_exch);
    lpTSCall1Req3->SetString(LDBIZ_ALLOW_STOCK_TYPE_STR,v_allow_stock_type);
    lpTSCall1Req3->SetString(LDBIZ_BUSI_CONFIG_STR_STR,v_busi_config_str);
    lpTSCall1Req3->SetDouble(LDBIZ_MARKET_PRICE_RATIO_FLOAT,v_market_price_ratio);
    lpTSCall1Req3->SetString(LDBIZ_FORBID_ORDER_DIR_STR,v_forbid_order_dir);
    lpTSCall1Req3->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    lpTSCall1Req3->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req3->SetInt32(LDBIZ_FUTU_DEFAULT_GROUP_FLAG_INT,v_futu_default_group_flag);
    lpTSCall1Req3->SetInt32(LDBIZ_FINA_LOAN_DEFAULT_GROUP_FLAG_INT,v_fina_loan_default_group_flag);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.51]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans3->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans3->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans3->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
    v_exch_group_no = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);

    //交易组编号 已有

    // set @交易组状态# = 《交易组状态-正常》;
    strcpy(v_exch_group_status,"1");

    // set @交易组期初净资产# = 0;
    v_exch_group_begin_NAV = 0;

    // set @更新次数# =1;
    v_update_times =1;

    // [主动推送][user.exchgroup][用户主推_用户_交易组信息主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.200", 0);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetString(LDBIZ_EXCH_GROUP_CODE_STR,v_exch_group_code);
    lpPubMsg->SetString(LDBIZ_EXCH_GROUP_NAME_STR,v_exch_group_name);
    lpPubMsg->SetString(LDBIZ_EXCH_GROUP_STATUS_STR,v_exch_group_status);
    lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_BEGIN_NAV_FLOAT,v_exch_group_begin_NAV);
    lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_PD_SHARE_FLOAT,v_exch_group_pd_share);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("user.exchgroup", lpPubMsg);


    // set @资产账户#=@外部账号#;
    strcpy(v_asset_acco,v_out_acco);

    // set @资产账户名称#=@外部账号#;
    strcpy(v_asset_acco_name,v_out_acco);
    //将资产账户类型设置为A股

    // set @资产账户类型#=1;
    v_asset_acco_type=1;

    // set @外部账号#=@外部账号#;
    strcpy(v_out_acco,v_out_acco);

    // set @分笔费用类型串#=" ";
    strcpy(v_split_fee_typr_str," ");

    // set @业务限制串#=" ";
    strcpy(v_busi_limit_str," ");
    //体外指令标志置为:体外 ; 沪港通和深港通交易方式都设置为体内 ; 持仓同步是否更新成本金额都为否

    // set @体外指令标志#=《体外指令标志-体外》;
    v_exter_comm_flag=2;

    // set @沪港通交易方式#=1;
    v_sh_hk_trader_type=1;

    // set @深港通交易方式#=1;
    v_sz_hk_trader_type=1;

    // set @营业部#=" ";
    strcpy(v_busi_depart," ");

    // set @持仓同步是否更新成本金额#=2;
    v_syn_update_cost_amt=2;
    //调用过程[事务_产品_公共接口_新增资产账户信息]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("prodT.6.37", 0);
    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req4->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req4->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req4->SetString(LDBIZ_ASSET_ACCO_STR,v_asset_acco);
    lpTSCall1Req4->SetString(LDBIZ_ASSET_ACCO_NAME_STR,v_asset_acco_name);
    lpTSCall1Req4->SetInt32(LDBIZ_ASSET_ACCO_TYPE_INT,v_asset_acco_type);
    lpTSCall1Req4->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req4->SetString(LDBIZ_TRADE_PWD_STR,v_trade_pwd);
    lpTSCall1Req4->SetString(LDBIZ_COMM_PWD_STR,v_comm_pwd);
    lpTSCall1Req4->SetDouble(LDBIZ_MARKET_PRICE_RATIO_FLOAT,v_market_price_ratio);
    lpTSCall1Req4->SetString(LDBIZ_ALLOW_EXCH_STR,v_allow_exch);
    lpTSCall1Req4->SetString(LDBIZ_ALLOW_STOCK_TYPE_STR,v_allow_stock_type);
    lpTSCall1Req4->SetString(LDBIZ_SPLIT_FEE_TYPR_STR_STR,v_split_fee_typr_str);
    lpTSCall1Req4->SetString(LDBIZ_BUSI_LIMIT_STR_STR,v_busi_limit_str);
    lpTSCall1Req4->SetInt32(LDBIZ_EXTER_COMM_FLAG_INT,v_exter_comm_flag);
    lpTSCall1Req4->SetInt32(LDBIZ_SH_HK_TRADER_TYPE_INT,v_sh_hk_trader_type);
    lpTSCall1Req4->SetInt32(LDBIZ_SZ_HK_TRADER_TYPE_INT,v_sz_hk_trader_type);
    lpTSCall1Req4->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    lpTSCall1Req4->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req4->SetInt32(LDBIZ_MAX_ACCO_COUNT_INT,v_max_acco_count);
    lpTSCall1Req4->SetString(LDBIZ_BUSI_DEPART_STR,v_busi_depart);
    lpTSCall1Req4->SetInt32(LDBIZ_SYN_UPDATE_COST_AMT_INT,v_syn_update_cost_amt);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.37]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans4->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans4->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans4->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans4->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans4->GetString(LDBIZ_ERROR_INFO_STR));
    v_asset_acco_no = lpTSCall1Ans4->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);


    // set @股东代码名称#=@外部账号#;
    strcpy(v_stock_acco_name,v_out_acco);

    // set @股东指定状态#=1;
    strcpy(v_stock_acco_apoint_status,"1");

    // if @上海股东代码# <> " " then
    if (strcmp(v_sh_stock_acco , " ")!=0)
    {

        // set @市场编号#=1;
        v_exch_no=1;

        // set @股东代码#=@上海股东代码#;
        strcpy(v_stock_acco,v_sh_stock_acco);
        //调用过程[事务_产品证券_账户_新增证券账户信息]
        //组织事务请求
        if(lpTSCall1Ans5)
        {
          lpTSCall1Ans5->FreeMsg();
          lpTSCall1Ans5=NULL;
        }
        lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.41", 0);
        lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req5->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req5->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req5->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpTSCall1Req5->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req5->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req5->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
        lpTSCall1Req5->SetString(LDBIZ_STOCK_ACCO_NAME_STR,v_stock_acco_name);
        lpTSCall1Req5->SetString(LDBIZ_STOCK_ACCO_APOINT_STATUS_STR,v_stock_acco_apoint_status);
        lpTSCall1Req5->SetString(LDBIZ_ALLOW_STOCK_TYPE_STR,v_allow_stock_type);
        lpTSCall1Req5->SetString(LDBIZ_BUSI_LIMIT_STR_STR,v_busi_limit_str);
        lpTSCall1Req5->SetString(LDBIZ_REGISTRATION_AGENCY_STR,v_registration_agency);
        lpTSCall1Req5->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        lpTSCall1Req5->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
        if(!lpTSCall1Ans5)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.41]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans5->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans5->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans5->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans5->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans5->GetString(LDBIZ_ERROR_INFO_STR));
        v_stock_acco_no = lpTSCall1Ans5->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);

    // end if;
    }


    // if @深圳股东代码# <> " " then
    if (strcmp(v_sz_stock_acco , " ")!=0)
    {

        // set @市场编号#=2;
        v_exch_no=2;

        // set @股东代码#=@深圳股东代码#;
        strcpy(v_stock_acco,v_sz_stock_acco);
        //调用过程[事务_产品证券_账户_新增证券账户信息]
        //组织事务请求
        if(lpTSCall1Ans6)
        {
          lpTSCall1Ans6->FreeMsg();
          lpTSCall1Ans6=NULL;
        }
        lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.41", 0);
        lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req6->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req6->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req6->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpTSCall1Req6->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req6->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req6->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
        lpTSCall1Req6->SetString(LDBIZ_STOCK_ACCO_NAME_STR,v_stock_acco_name);
        lpTSCall1Req6->SetString(LDBIZ_STOCK_ACCO_APOINT_STATUS_STR,v_stock_acco_apoint_status);
        lpTSCall1Req6->SetString(LDBIZ_ALLOW_STOCK_TYPE_STR,v_allow_stock_type);
        lpTSCall1Req6->SetString(LDBIZ_BUSI_LIMIT_STR_STR,v_busi_limit_str);
        lpTSCall1Req6->SetString(LDBIZ_REGISTRATION_AGENCY_STR,v_registration_agency);
        lpTSCall1Req6->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        lpTSCall1Req6->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
        if(!lpTSCall1Ans6)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.41]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans6->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans6->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans6->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans6->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans6->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans6->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans6->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans6->GetString(LDBIZ_ERROR_INFO_STR));
        v_stock_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);

    // end if;
    }


    // set @变动金额#=@账户金额#;
    v_occur_amt=v_acco_amt;
    //调用过程[事务_产品证券_资金_分配产品资金]
    //组织事务请求
    if(lpTSCall1Ans7)
    {
      lpTSCall1Ans7->FreeMsg();
      lpTSCall1Ans7=NULL;
    }
    lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("pdsecuT.2.8", 0);
    lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req7->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req7->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req7->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req7->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req7->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req7->SetDouble(LDBIZ_OCCUR_AMT_FLOAT,v_occur_amt);
    lpTSCall1Req7->SetString(LDBIZ_OPER_REMARK_INFO_STR,v_oper_remark_info);
    lpTSCall1Req7->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
    if(!lpTSCall1Ans7)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.2.8]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans7->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans7->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans7->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans7->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans7->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans7->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans7->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans7->GetString(LDBIZ_ERROR_INFO_STR));
    v_asac_cash_id = lpTSCall1Ans7->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
    v_asac_begin_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_BEGIN_AMT_FLOAT);
    v_asac_curr_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_CURR_AMT_FLOAT);
    v_asac_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
    v_asac_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
    v_asac_pre_settle_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_PRE_SETTLE_AMT_FLOAT);
    v_asac_shsz_avail_change_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_SHSZ_AVAIL_CHANGE_AMT_FLOAT);
    v_asac_hk_avail_change_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_HK_AVAIL_CHANGE_AMT_FLOAT);
    v_asac_amt_check_diff = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_AMT_CHECK_DIFF_FLOAT);
    v_asac_T_hk_buy_total_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_T_HK_BUY_TOTAL_AMT_FLOAT);
    v_asac_T_hk_sell_total_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_T_HK_SELL_TOTAL_AMT_FLOAT);
    v_asac_T1_hk_buy_total_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_T1_HK_BUY_TOTAL_AMT_FLOAT);
    v_asac_T1_hk_sell_total_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_T1_HK_SELL_TOTAL_AMT_FLOAT);
    v_asac_total_rece_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TOTAL_RECE_AMT_FLOAT);
    v_asac_total_payab_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TOTAL_PAYAB_AMT_FLOAT);
    v_asac_realize_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
    v_asac_intrst_rate = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_INTRST_RATE_FLOAT);
    v_asac_intrst_base_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_INTRST_BASE_AMT_FLOAT);
    v_asac_pre_entry_intrst_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_PRE_ENTRY_INTRST_AMT_FLOAT);
    v_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_UPDATE_TIMES_INT);

    //调用过程[事务_产品证券_资金_授权产品资金]
    //组织事务请求
    if(lpTSCall1Ans8)
    {
      lpTSCall1Ans8->FreeMsg();
      lpTSCall1Ans8=NULL;
    }
    lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("pdsecuT.2.10", 0);
    lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req8->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req8->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req8->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req8->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req8->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req8->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req8->SetDouble(LDBIZ_OCCUR_AMT_FLOAT,v_occur_amt);
    lpTSCall1Req8->SetString(LDBIZ_OPER_REMARK_INFO_STR,v_oper_remark_info);
    lpTSCall1Req8->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
    if(!lpTSCall1Ans8)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.2.10]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans8->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans8->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans8->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans8->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans8->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans8->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans8->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans8->GetString(LDBIZ_ERROR_INFO_STR));
    v_exgp_cash_id = lpTSCall1Ans8->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
    v_exgp_begin_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT);
    v_exgp_curr_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT);
    v_exgp_frozen_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
    v_exgp_unfroz_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
    v_exgp_pre_settle_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_PRE_SETTLE_AMT_FLOAT);
    v_exgp_shsz_avail_change_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_SHSZ_AVAIL_CHANGE_AMT_FLOAT);
    v_exgp_hk_avail_change_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_HK_AVAIL_CHANGE_AMT_FLOAT);
    v_exgp_amt_check_diff = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_AMT_CHECK_DIFF_FLOAT);
    v_exgp_T_hk_buy_total_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_T_HK_BUY_TOTAL_AMT_FLOAT);
    v_exgp_T_hk_sell_total_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_T_HK_SELL_TOTAL_AMT_FLOAT);
    v_exgp_T1_hk_buy_total_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_T1_HK_BUY_TOTAL_AMT_FLOAT);
    v_exgp_T1_hk_sell_total_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_T1_HK_SELL_TOTAL_AMT_FLOAT);
    v_exch_group_total_rece_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXCH_GROUP_TOTAL_RECE_AMT_FLOAT);
    v_exch_group_total_payab_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXCH_GROUP_TOTAL_PAYAB_AMT_FLOAT);
    v_exgp_realize_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
    v_exch_group_intrst_rate = lpTSCall1Ans8->GetDouble(LDBIZ_EXCH_GROUP_INTRST_RATE_FLOAT);
    v_exch_group_intrst_base_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXCH_GROUP_INTRST_BASE_AMT_FLOAT);
    v_exch_group_pre_entry_intrst_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXCH_GROUP_PRE_ENTRY_INTRST_AMT_FLOAT);
    v_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_UPDATE_TIMES_INT);

    //还缺少一个关联费用模板

END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans9)
        {
          lpTSCall1Ans9->FreeMsg();
          lpTSCall1Ans9=NULL;
        }
        lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req9->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req9->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
        if (lpTSCall1Ans9)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans9->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans9->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans9->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans9->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans9->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
    lpOutBizMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpOutBizMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpOutBizMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    if(lpTSCall1Ans3)
        lpTSCall1Ans3->FreeMsg();
    if(lpTSCall1Ans4)
        lpTSCall1Ans4->FreeMsg();
    if(lpTSCall1Ans5)
        lpTSCall1Ans5->FreeMsg();
    if(lpTSCall1Ans6)
        lpTSCall1Ans6->FreeMsg();
    if(lpTSCall1Ans7)
        lpTSCall1Ans7->FreeMsg();
    if(lpTSCall1Ans8)
        lpTSCall1Ans8->FreeMsg();
    if(lpTSCall1Ans9)
        lpTSCall1Ans9->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_检查开立交易中台资产单元
int LD_CALL_MODE fnFunc1(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_co_no;
    char v_combo_code[33];
    char v_out_acco[33];
    int v_asset_acco_no;
    double v_acco_amt;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_pd_no;
    int v_exch_group_no;
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_default_exch_group_no;
    double v_curr_share;
    double v_first_asset;
    char v_allow_exch[65];
    char v_allow_stock_type[2049];
    char v_busi_config_str[65];
    double v_market_price_ratio;
    char v_exch_group_code[33];
    char v_exch_group_name[65];
    int v_default_group_flag;
    int v_futu_default_group_flag;
    int v_fina_loan_default_group_flag;
    char v_forbid_order_dir[65];
    double v_exch_group_dist_pd_amt;
    double v_exch_group_pd_share;
    char v_remark_info[256];
    int v_target_exch_group_no;
    double v_occur_amt;
    char v_oper_remark_info[256];
    int64 v_exgp_cash_id;
    double v_exgp_begin_amt;
    double v_exgp_curr_amt;
    double v_exgp_frozen_amt;
    double v_exgp_unfroz_amt;
    double v_exgp_pre_settle_amt;
    double v_exgp_shsz_avail_change_amt;
    double v_exgp_hk_avail_change_amt;
    double v_exgp_amt_check_diff;
    double v_exgp_T_hk_buy_total_amt;
    double v_exgp_T_hk_sell_total_amt;
    double v_exgp_T1_hk_buy_total_amt;
    double v_exgp_T1_hk_sell_total_amt;
    double v_exch_group_total_rece_amt;
    double v_exch_group_total_payab_amt;
    double v_exgp_realize_pandl;
    double v_exch_group_intrst_rate;
    double v_exch_group_intrst_base_amt;
    double v_exch_group_pre_entry_intrst_amt;
    int v_exch_group_update_times;
    char v_crncy_type[4];
    int64 v_row_id;
    double v_begin_amt;
    double v_curr_amt;
    double v_frozen_amt;
    double v_unfroz_amt;
    double v_pre_settle_amt;
    double v_shsz_avail_change_amt;
    double v_hk_avail_change_amt;
    double v_amt_check_diff;
    double v_T_hk_buy_total_amt;
    double v_T_hk_sell_total_amt;
    double v_T1_hk_buy_total_amt;
    double v_T1_hk_sell_total_amt;
    double v_total_rece_amt;
    double v_total_payab_amt;
    double v_realize_pandl;
    double v_intrst_rate;
    double v_intrst_base_amt;
    double v_pre_entry_intrst_amt;
    int v_update_times;
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_co_no=0;
    strcpy(v_combo_code, " ");
    strcpy(v_out_acco, " ");
    v_asset_acco_no=0;
    v_acco_amt=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_pd_no=0;
    v_exch_group_no=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_default_exch_group_no=0;
    v_curr_share=0;
    v_first_asset=0;
    strcpy(v_allow_exch, " ");
    strcpy(v_allow_stock_type, " ");
    strcpy(v_busi_config_str, " ");
    v_market_price_ratio=0;
    strcpy(v_exch_group_code, " ");
    strcpy(v_exch_group_name, " ");
    v_default_group_flag=0;
    v_futu_default_group_flag=0;
    v_fina_loan_default_group_flag=0;
    strcpy(v_forbid_order_dir, " ");
    v_exch_group_dist_pd_amt=0;
    v_exch_group_pd_share=0;
    strcpy(v_remark_info, " ");
    v_target_exch_group_no=0;
    v_occur_amt=0;
    strcpy(v_oper_remark_info, " ");
    v_exgp_cash_id=0;
    v_exgp_begin_amt=0;
    v_exgp_curr_amt=0;
    v_exgp_frozen_amt=0;
    v_exgp_unfroz_amt=0;
    v_exgp_pre_settle_amt=0;
    v_exgp_shsz_avail_change_amt=0;
    v_exgp_hk_avail_change_amt=0;
    v_exgp_amt_check_diff=0;
    v_exgp_T_hk_buy_total_amt=0;
    v_exgp_T_hk_sell_total_amt=0;
    v_exgp_T1_hk_buy_total_amt=0;
    v_exgp_T1_hk_sell_total_amt=0;
    v_exch_group_total_rece_amt=0;
    v_exch_group_total_payab_amt=0;
    v_exgp_realize_pandl=0;
    v_exch_group_intrst_rate=0;
    v_exch_group_intrst_base_amt=0;
    v_exch_group_pre_entry_intrst_amt=0;
    v_exch_group_update_times=0;
    strcpy(v_crncy_type, "CNY");
    v_row_id=0;
    v_begin_amt=0;
    v_curr_amt=0;
    v_frozen_amt=0;
    v_unfroz_amt=0;
    v_pre_settle_amt=0;
    v_shsz_avail_change_amt=0;
    v_hk_avail_change_amt=0;
    v_amt_check_diff=0;
    v_T_hk_buy_total_amt=0;
    v_T_hk_sell_total_amt=0;
    v_T1_hk_buy_total_amt=0;
    v_T1_hk_sell_total_amt=0;
    v_total_rece_amt=0;
    v_total_payab_amt=0;
    v_realize_pandl=0;
    v_intrst_rate=0;
    v_intrst_base_amt=0;
    v_pre_entry_intrst_amt=0;
    v_update_times=1;
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    strncpy(v_combo_code, lpInBizMsg->GetString(LDBIZ_COMBO_CODE_STR),32);
    v_combo_code[32] = '\0';
    strncpy(v_out_acco, lpInBizMsg->GetString(LDBIZ_OUT_ACCO_STR),32);
    v_out_acco[32] = '\0';
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_acco_amt = lpInBizMsg->GetDouble(LDBIZ_ACCO_AMT_FLOAT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;
    IFastMessage* lpTSCall1Req3 = NULL;
    IFastMessage* lpTSCall1Ans3 = NULL;
    IFastMessage* lpTSCall1Req4 = NULL;
    IFastMessage* lpTSCall1Ans4 = NULL;
    IFastMessage* lpTSCall1Req5 = NULL;
    IFastMessage* lpTSCall1Ans5 = NULL;
    IFastMessage* lpTSCall1Req6 = NULL;
    IFastMessage* lpTSCall1Ans6 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));

    //调用过程[事务_产品证券_账户_检查组合对应交易组存在]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.65", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.65]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
    v_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);

    //交易组编号为0,说明没有对应的交易组记录,需要去新建一个对应的交易组

    // if @交易组编号#=0 then
    if (v_exch_group_no==0)
    {
        //调用过程[事务_公共_公共接口_获取产品默认交易组编号]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.52", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.52]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans2->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
        v_exch_group_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);


        // set @默认交易组编号#=@交易组编号#;
        v_default_exch_group_no=v_exch_group_no;
        //调用过程[事务_产品_公共接口_外部账号获取产品信息]
        //组织事务请求
        if(lpTSCall1Ans3)
        {
          lpTSCall1Ans3->FreeMsg();
          lpTSCall1Ans3=NULL;
        }
        lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("prodT.6.38", 0);
        lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req3->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req3->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
        glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
        if(!lpTSCall1Ans3)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.38]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans3->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans3->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans3->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
        v_pd_no = lpTSCall1Ans3->GetInt32(LDBIZ_PD_NO_INT);
        v_asset_acco_no = lpTSCall1Ans3->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_curr_share = lpTSCall1Ans3->GetDouble(LDBIZ_CURR_SHARE_FLOAT);
        v_first_asset = lpTSCall1Ans3->GetDouble(LDBIZ_FIRST_ASSET_FLOAT);
        strcpy(v_allow_exch, lpTSCall1Ans3->GetString(LDBIZ_ALLOW_EXCH_STR));
        strcpy(v_allow_stock_type, lpTSCall1Ans3->GetString(LDBIZ_ALLOW_STOCK_TYPE_STR));
        strcpy(v_busi_config_str, lpTSCall1Ans3->GetString(LDBIZ_BUSI_CONFIG_STR_STR));
        v_market_price_ratio = lpTSCall1Ans3->GetDouble(LDBIZ_MARKET_PRICE_RATIO_FLOAT);


        // set @交易组编码#=@外部账号#;
        strcpy(v_exch_group_code,v_out_acco);

        // set @交易组名称#=@外部账号#;
        strcpy(v_exch_group_name,v_out_acco);

        // set @默认组标志# = 《默认组标志-否》;
        v_default_group_flag = 2;

        // set @期货默认组标志# = 《期货默认组标志-否》;
        v_futu_default_group_flag = 2;

        // set @融资融券默认组标志# = 《融资融券默认组标志-否》;
        v_fina_loan_default_group_flag = 2;

        // set @禁止订单方向#=" ";
        strcpy(v_forbid_order_dir," ");

        // set @分配产品资金#=0;
        v_exch_group_dist_pd_amt=0;

        // set @交易组产品份额#=@当前份额#;
        v_exch_group_pd_share=v_curr_share;

        // set @备注信息#="检查交易中台业务新增交易组";
        strcpy(v_remark_info,"检查交易中台业务新增交易组");
        //调用过程[事务_公共_公共接口_新增交易组信息]
        //组织事务请求
        if(lpTSCall1Ans4)
        {
          lpTSCall1Ans4->FreeMsg();
          lpTSCall1Ans4=NULL;
        }
        lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pubT.24.51", 0);
        lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req4->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req4->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req4->SetString(LDBIZ_EXCH_GROUP_CODE_STR,v_exch_group_code);
        lpTSCall1Req4->SetString(LDBIZ_EXCH_GROUP_NAME_STR,v_exch_group_name);
        lpTSCall1Req4->SetInt32(LDBIZ_DEFAULT_GROUP_FLAG_INT,v_default_group_flag);
        lpTSCall1Req4->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpTSCall1Req4->SetDouble(LDBIZ_FIRST_ASSET_FLOAT,v_first_asset);
        lpTSCall1Req4->SetDouble(LDBIZ_EXCH_GROUP_DIST_PD_AMT_FLOAT,v_exch_group_dist_pd_amt);
        lpTSCall1Req4->SetDouble(LDBIZ_EXCH_GROUP_PD_SHARE_FLOAT,v_exch_group_pd_share);
        lpTSCall1Req4->SetString(LDBIZ_ALLOW_EXCH_STR,v_allow_exch);
        lpTSCall1Req4->SetString(LDBIZ_ALLOW_STOCK_TYPE_STR,v_allow_stock_type);
        lpTSCall1Req4->SetString(LDBIZ_BUSI_CONFIG_STR_STR,v_busi_config_str);
        lpTSCall1Req4->SetDouble(LDBIZ_MARKET_PRICE_RATIO_FLOAT,v_market_price_ratio);
        lpTSCall1Req4->SetString(LDBIZ_FORBID_ORDER_DIR_STR,v_forbid_order_dir);
        lpTSCall1Req4->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        lpTSCall1Req4->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
        lpTSCall1Req4->SetInt32(LDBIZ_FUTU_DEFAULT_GROUP_FLAG_INT,v_futu_default_group_flag);
        lpTSCall1Req4->SetInt32(LDBIZ_FINA_LOAN_DEFAULT_GROUP_FLAG_INT,v_fina_loan_default_group_flag);
        glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
        if(!lpTSCall1Ans4)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.51]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans4->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans4->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans4->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans4->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans4->GetString(LDBIZ_ERROR_INFO_STR));
        v_exch_group_no = lpTSCall1Ans4->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);


        // set @目标交易组编号#=@交易组编号#;
        v_target_exch_group_no=v_exch_group_no;

        // set @交易组编号#=@默认交易组编号#;
        v_exch_group_no=v_default_exch_group_no;

        // set @变动金额#=@账户金额#;
        v_occur_amt=v_acco_amt;

        // set @操作备注#="检查交易中台业务划转交易组资金";
        strcpy(v_oper_remark_info,"检查交易中台业务划转交易组资金");
        //调用过程[事务_产品证券_资金_交易组资金划转]
        //组织事务请求
        if(lpTSCall1Ans5)
        {
          lpTSCall1Ans5->FreeMsg();
          lpTSCall1Ans5=NULL;
        }
        lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pdsecuT.2.262", 0);
        lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req5->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req5->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpTSCall1Req5->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpTSCall1Req5->SetInt32(LDBIZ_TARGET_EXCH_GROUP_NO_INT,v_target_exch_group_no);
        lpTSCall1Req5->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req5->SetDouble(LDBIZ_OCCUR_AMT_FLOAT,v_occur_amt);
        lpTSCall1Req5->SetString(LDBIZ_OPER_REMARK_INFO_STR,v_oper_remark_info);
        lpTSCall1Req5->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
        if(!lpTSCall1Ans5)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.2.262]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans5->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans5->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans5->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans5->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans5->GetString(LDBIZ_ERROR_INFO_STR));
        v_exgp_cash_id = lpTSCall1Ans5->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
        v_exgp_begin_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT);
        v_exgp_curr_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT);
        v_exgp_frozen_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
        v_exgp_unfroz_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
        v_exgp_pre_settle_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_PRE_SETTLE_AMT_FLOAT);
        v_exgp_shsz_avail_change_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_SHSZ_AVAIL_CHANGE_AMT_FLOAT);
        v_exgp_hk_avail_change_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_HK_AVAIL_CHANGE_AMT_FLOAT);
        v_exgp_amt_check_diff = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_AMT_CHECK_DIFF_FLOAT);
        v_exgp_T_hk_buy_total_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_T_HK_BUY_TOTAL_AMT_FLOAT);
        v_exgp_T_hk_sell_total_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_T_HK_SELL_TOTAL_AMT_FLOAT);
        v_exgp_T1_hk_buy_total_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_T1_HK_BUY_TOTAL_AMT_FLOAT);
        v_exgp_T1_hk_sell_total_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_T1_HK_SELL_TOTAL_AMT_FLOAT);
        v_exch_group_total_rece_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXCH_GROUP_TOTAL_RECE_AMT_FLOAT);
        v_exch_group_total_payab_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXCH_GROUP_TOTAL_PAYAB_AMT_FLOAT);
        v_exgp_realize_pandl = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
        v_exch_group_intrst_rate = lpTSCall1Ans5->GetDouble(LDBIZ_EXCH_GROUP_INTRST_RATE_FLOAT);
        v_exch_group_intrst_base_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXCH_GROUP_INTRST_BASE_AMT_FLOAT);
        v_exch_group_pre_entry_intrst_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXCH_GROUP_PRE_ENTRY_INTRST_AMT_FLOAT);
        v_exch_group_update_times = lpTSCall1Ans5->GetInt32(LDBIZ_EXCH_GROUP_UPDATE_TIMES_INT);
        v_co_no = lpTSCall1Ans5->GetInt32(LDBIZ_CO_NO_INT);
        strcpy(v_crncy_type, lpTSCall1Ans5->GetString(LDBIZ_CRNCY_TYPE_STR));
        v_row_id = lpTSCall1Ans5->GetInt64(LDBIZ_ROW_ID_INT64);
        v_begin_amt = lpTSCall1Ans5->GetDouble(LDBIZ_BEGIN_AMT_FLOAT);
        v_curr_amt = lpTSCall1Ans5->GetDouble(LDBIZ_CURR_AMT_FLOAT);
        v_frozen_amt = lpTSCall1Ans5->GetDouble(LDBIZ_FROZEN_AMT_FLOAT);
        v_unfroz_amt = lpTSCall1Ans5->GetDouble(LDBIZ_UNFROZ_AMT_FLOAT);
        v_pre_settle_amt = lpTSCall1Ans5->GetDouble(LDBIZ_PRE_SETTLE_AMT_FLOAT);
        v_shsz_avail_change_amt = lpTSCall1Ans5->GetDouble(LDBIZ_SHSZ_AVAIL_CHANGE_AMT_FLOAT);
        v_hk_avail_change_amt = lpTSCall1Ans5->GetDouble(LDBIZ_HK_AVAIL_CHANGE_AMT_FLOAT);
        v_amt_check_diff = lpTSCall1Ans5->GetDouble(LDBIZ_AMT_CHECK_DIFF_FLOAT);
        v_T_hk_buy_total_amt = lpTSCall1Ans5->GetDouble(LDBIZ_T_HK_BUY_TOTAL_AMT_FLOAT);
        v_T_hk_sell_total_amt = lpTSCall1Ans5->GetDouble(LDBIZ_T_HK_SELL_TOTAL_AMT_FLOAT);
        v_T1_hk_buy_total_amt = lpTSCall1Ans5->GetDouble(LDBIZ_T1_HK_BUY_TOTAL_AMT_FLOAT);
        v_T1_hk_sell_total_amt = lpTSCall1Ans5->GetDouble(LDBIZ_T1_HK_SELL_TOTAL_AMT_FLOAT);
        v_total_rece_amt = lpTSCall1Ans5->GetDouble(LDBIZ_TOTAL_RECE_AMT_FLOAT);
        v_total_payab_amt = lpTSCall1Ans5->GetDouble(LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
        v_realize_pandl = lpTSCall1Ans5->GetDouble(LDBIZ_REALIZE_PANDL_FLOAT);
        v_intrst_rate = lpTSCall1Ans5->GetDouble(LDBIZ_INTRST_RATE_FLOAT);
        v_intrst_base_amt = lpTSCall1Ans5->GetDouble(LDBIZ_INTRST_BASE_AMT_FLOAT);
        v_pre_entry_intrst_amt = lpTSCall1Ans5->GetDouble(LDBIZ_PRE_ENTRY_INTRST_AMT_FLOAT);
        v_update_times = lpTSCall1Ans5->GetInt32(LDBIZ_UPDATE_TIMES_INT);

    // end if;
    }


END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans6)
        {
          lpTSCall1Ans6->FreeMsg();
          lpTSCall1Ans6=NULL;
        }
        lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req6->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req6->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
        if (lpTSCall1Ans6)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans6->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans6->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans6->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans6->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans6->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
    lpOutBizMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpOutBizMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    if(lpTSCall1Ans3)
        lpTSCall1Ans3->FreeMsg();
    if(lpTSCall1Ans4)
        lpTSCall1Ans4->FreeMsg();
    if(lpTSCall1Ans5)
        lpTSCall1Ans5->FreeMsg();
    if(lpTSCall1Ans6)
        lpTSCall1Ans6->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_检查证券账户存在
int LD_CALL_MODE fnFunc2(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_asset_acco_no;
    int v_exch_no;
    char v_stock_acco[17];
    char v_registration_agency[33];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_asset_acco_no=0;
    v_exch_no=0;
    strcpy(v_stock_acco, " ");
    strcpy(v_registration_agency, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    strncpy(v_stock_acco, lpInBizMsg->GetString(LDBIZ_STOCK_ACCO_STR),16);
    v_stock_acco[16] = '\0';
    strncpy(v_registration_agency, lpInBizMsg->GetString(LDBIZ_REGISTRATION_AGENCY_STR),32);
    v_registration_agency[32] = '\0';

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));

    //调用过程[事务_产品证券_账户_检查证券账户存在]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.40", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
    lpTSCall1Req1->SetString(LDBIZ_REGISTRATION_AGENCY_STR,v_registration_agency);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.40]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));


END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if (lpTSCall1Ans2)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans2->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans2->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans2->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_新增证券账户信息
int LD_CALL_MODE fnFunc3(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_pd_no;
    int v_asset_acco_no;
    int v_exch_no;
    char v_stock_acco[17];
    char v_stock_acco_name[65];
    char v_stock_acco_apoint_status[3];
    char v_allow_stock_type[2049];
    char v_busi_limit_str[2049];
    char v_registration_agency[33];
    char v_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_stock_acco_no;
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_asset_acco_status[3];
    int v_co_no;
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_pd_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    strcpy(v_stock_acco, " ");
    strcpy(v_stock_acco_name, " ");
    strcpy(v_stock_acco_apoint_status, "0");
    strcpy(v_allow_stock_type, " ");
    strcpy(v_busi_limit_str, " ");
    strcpy(v_registration_agency, " ");
    strcpy(v_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_stock_acco_no=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_asset_acco_status, "0");
    v_co_no=0;
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    strncpy(v_stock_acco, lpInBizMsg->GetString(LDBIZ_STOCK_ACCO_STR),16);
    v_stock_acco[16] = '\0';
    strncpy(v_stock_acco_name, lpInBizMsg->GetString(LDBIZ_STOCK_ACCO_NAME_STR),64);
    v_stock_acco_name[64] = '\0';
    strncpy(v_stock_acco_apoint_status, lpInBizMsg->GetString(LDBIZ_STOCK_ACCO_APOINT_STATUS_STR),2);
    v_stock_acco_apoint_status[2] = '\0';
    strncpy(v_allow_stock_type, lpInBizMsg->GetString(LDBIZ_ALLOW_STOCK_TYPE_STR),2048);
    v_allow_stock_type[2048] = '\0';
    strncpy(v_busi_limit_str, lpInBizMsg->GetString(LDBIZ_BUSI_LIMIT_STR_STR),2048);
    v_busi_limit_str[2048] = '\0';
    strncpy(v_registration_agency, lpInBizMsg->GetString(LDBIZ_REGISTRATION_AGENCY_STR),32);
    v_registration_agency[32] = '\0';
    strncpy(v_remark_info, lpInBizMsg->GetString(LDBIZ_REMARK_INFO_STR),255);
    v_remark_info[255] = '\0';

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;
    IFastMessage* lpTSCall1Req3 = NULL;
    IFastMessage* lpTSCall1Ans3 = NULL;
    IFastMessage* lpTSCall1Req4 = NULL;
    IFastMessage* lpTSCall1Ans4 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));


    // set @资产账户状态# = 0;
    strcpy(v_asset_acco_status,"0");
    //调用过程[事务_产品_公共接口_检查资产账户状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.6.2", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_ACCO_STATUS_STR,v_asset_acco_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.2]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);


    // [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#]
    if (v_co_no != v_opor_co_no)
    {
        strcpy(v_error_code, "pdsecuL.1.41.50");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","机构编号=",v_co_no,"产品编号=",v_pd_no);
        iRet = -1;
        goto END;
    }

    //调用过程[事务_产品证券_账户_新增证券账户信息]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.41", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_ACCO_NAME_STR,v_stock_acco_name);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_ACCO_APOINT_STATUS_STR,v_stock_acco_apoint_status);
    lpTSCall1Req2->SetString(LDBIZ_ALLOW_STOCK_TYPE_STR,v_allow_stock_type);
    lpTSCall1Req2->SetString(LDBIZ_BUSI_LIMIT_STR_STR,v_busi_limit_str);
    lpTSCall1Req2->SetString(LDBIZ_REGISTRATION_AGENCY_STR,v_registration_agency);
    lpTSCall1Req2->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    lpTSCall1Req2->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.41]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans2->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
    v_stock_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);


    // if @市场编号# = 《市场编号-沪港通证券交易所》  or @市场编号# = 《市场编号-深港通证券交易所》 then
    if (v_exch_no == 3  || v_exch_no == 4)
    {

         // set @备注信息# ="该账户需配置港股";
         strcpy(v_remark_info,"该账户需配置港股");
         //调用过程[事务_产品_公共接口_更新资产账户通道备注信息]
         //组织事务请求
         if(lpTSCall1Ans3)
         {
           lpTSCall1Ans3->FreeMsg();
           lpTSCall1Ans3=NULL;
         }
         lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("prodT.6.46", 0);
         lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
         lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
         lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
         lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
         lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
         lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
         lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
         lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
         lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
         lpTSCall1Req3->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
         glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
         if(!lpTSCall1Ans3)  //  超时错误
         {
             lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
             lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.46]subcall timed out!");
             iRet=-2;
             goto ENDSYS;
         }
         else if(lpTSCall1Ans3->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
         {
             lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans3->GetInt32(LDTAG_ERRORNO));
             lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans3->GetString(LDTAG_ERRORINFO));
             iRet=-2;
             goto ENDSYS;
         }
         else if(strcmp(lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
         {
             strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
             strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
             iRet=-1;
             goto END;
         }
         //获取输出参数值
         strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
         strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));

    // end if;
    }


END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans4)
        {
          lpTSCall1Ans4->FreeMsg();
          lpTSCall1Ans4=NULL;
        }
        lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req4->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req4->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
        if (lpTSCall1Ans4)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans4->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans4->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans4->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans4->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
    lpOutBizMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    if(lpTSCall1Ans3)
        lpTSCall1Ans3->FreeMsg();
    if(lpTSCall1Ans4)
        lpTSCall1Ans4->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_修改证券账户信息
int LD_CALL_MODE fnFunc4(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_pd_no;
    int v_asset_acco_no;
    int v_stock_acco_no;
    int v_exch_no;
    char v_stock_acco_name[65];
    char v_stock_acco_apoint_status[3];
    char v_allow_stock_type[2049];
    char v_busi_limit_str[2049];
    char v_registration_agency[33];
    char v_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_asset_acco_status[3];
    int v_co_no;
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_pd_no=0;
    v_asset_acco_no=0;
    v_stock_acco_no=0;
    v_exch_no=0;
    strcpy(v_stock_acco_name, " ");
    strcpy(v_stock_acco_apoint_status, "0");
    strcpy(v_allow_stock_type, " ");
    strcpy(v_busi_limit_str, " ");
    strcpy(v_registration_agency, " ");
    strcpy(v_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_asset_acco_status, "0");
    v_co_no=0;
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    strncpy(v_stock_acco_name, lpInBizMsg->GetString(LDBIZ_STOCK_ACCO_NAME_STR),64);
    v_stock_acco_name[64] = '\0';
    strncpy(v_stock_acco_apoint_status, lpInBizMsg->GetString(LDBIZ_STOCK_ACCO_APOINT_STATUS_STR),2);
    v_stock_acco_apoint_status[2] = '\0';
    strncpy(v_allow_stock_type, lpInBizMsg->GetString(LDBIZ_ALLOW_STOCK_TYPE_STR),2048);
    v_allow_stock_type[2048] = '\0';
    strncpy(v_busi_limit_str, lpInBizMsg->GetString(LDBIZ_BUSI_LIMIT_STR_STR),2048);
    v_busi_limit_str[2048] = '\0';
    strncpy(v_registration_agency, lpInBizMsg->GetString(LDBIZ_REGISTRATION_AGENCY_STR),32);
    v_registration_agency[32] = '\0';
    strncpy(v_remark_info, lpInBizMsg->GetString(LDBIZ_REMARK_INFO_STR),255);
    v_remark_info[255] = '\0';

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;
    IFastMessage* lpTSCall1Req3 = NULL;
    IFastMessage* lpTSCall1Ans3 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));


    // set @资产账户状态# = 0;
    strcpy(v_asset_acco_status,"0");
    //调用过程[事务_产品_公共接口_检查资产账户状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.6.2", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_ACCO_STATUS_STR,v_asset_acco_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.2]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);


    // [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#]
    if (v_co_no != v_opor_co_no)
    {
        strcpy(v_error_code, "pdsecuL.1.42.50");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","机构编号=",v_co_no,"产品编号=",v_pd_no);
        iRet = -1;
        goto END;
    }

    //调用过程[事务_产品证券_账户_修改证券账户信息]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.42", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_ACCO_NAME_STR,v_stock_acco_name);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_ACCO_APOINT_STATUS_STR,v_stock_acco_apoint_status);
    lpTSCall1Req2->SetString(LDBIZ_ALLOW_STOCK_TYPE_STR,v_allow_stock_type);
    lpTSCall1Req2->SetString(LDBIZ_BUSI_LIMIT_STR_STR,v_busi_limit_str);
    lpTSCall1Req2->SetString(LDBIZ_REGISTRATION_AGENCY_STR,v_registration_agency);
    lpTSCall1Req2->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    lpTSCall1Req2->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.42]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans2->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));


END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans3)
        {
          lpTSCall1Ans3->FreeMsg();
          lpTSCall1Ans3=NULL;
        }
        lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req3->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req3->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
        if (lpTSCall1Ans3)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans3->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans3->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans3->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    if(lpTSCall1Ans3)
        lpTSCall1Ans3->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_删除证券账户信息
int LD_CALL_MODE fnFunc5(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_pd_no;
    int v_asset_acco_no;
    int v_stock_acco_no;
    char v_oper_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_asset_acco_status[3];
    int v_co_no;
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_pd_no=0;
    v_asset_acco_no=0;
    v_stock_acco_no=0;
    strcpy(v_oper_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_asset_acco_status, "0");
    v_co_no=0;
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strncpy(v_oper_remark_info, lpInBizMsg->GetString(LDBIZ_OPER_REMARK_INFO_STR),255);
    v_oper_remark_info[255] = '\0';

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;
    IFastMessage* lpTSCall1Req3 = NULL;
    IFastMessage* lpTSCall1Ans3 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));


    // set @资产账户状态# = 0;
    strcpy(v_asset_acco_status,"0");
    //调用过程[事务_产品_公共接口_检查资产账户状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.6.2", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_ACCO_STATUS_STR,v_asset_acco_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.2]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);


    // [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#]
    if (v_co_no != v_opor_co_no)
    {
        strcpy(v_error_code, "pdsecuL.1.43.50");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","机构编号=",v_co_no,"产品编号=",v_pd_no);
        iRet = -1;
        goto END;
    }

    //调用过程[事务_产品证券_账户_删除证券账户信息]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.43", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_REMARK_INFO_STR,v_oper_remark_info);
    lpTSCall1Req2->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.43]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans2->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));


END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans3)
        {
          lpTSCall1Ans3->FreeMsg();
          lpTSCall1Ans3=NULL;
        }
        lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req3->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req3->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
        if (lpTSCall1Ans3)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans3->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans3->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans3->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    if(lpTSCall1Ans3)
        lpTSCall1Ans3->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_查询证券账户信息
int LD_CALL_MODE fnFunc6(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_pd_no;
    int v_asset_acco_no;
    int v_stock_acco_no;
    char v_exch_no_str[2049];
    char v_stock_acco_status_str[65];
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_create_date;
    int v_create_time;
    int v_update_date;
    int v_update_time;
    int v_co_no;
    int v_exch_no;
    char v_stock_acco[17];
    char v_stock_acco_name[65];
    char v_stock_acco_status[3];
    char v_stock_acco_apoint_status[3];
    char v_allow_stock_type[2049];
    char v_busi_limit_str[2049];
    char v_registration_agency[33];
    char v_remark_info[256];
    char v_busi_ctrl_str[65];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_co_no_rights_str[2049];
    char v_pd_no_rights_str[2049];
    char v_exch_group_no_rights_str[2049];
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_pd_no=0;
    v_asset_acco_no=0;
    v_stock_acco_no=0;
    strcpy(v_exch_no_str, " ");
    strcpy(v_stock_acco_status_str, " ");
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_create_date=0;
    v_create_time=0;
    v_update_date=0;
    v_update_time=0;
    v_co_no=0;
    v_exch_no=0;
    strcpy(v_stock_acco, " ");
    strcpy(v_stock_acco_name, " ");
    strcpy(v_stock_acco_status, "0");
    strcpy(v_stock_acco_apoint_status, "0");
    strcpy(v_allow_stock_type, " ");
    strcpy(v_busi_limit_str, " ");
    strcpy(v_registration_agency, " ");
    strcpy(v_remark_info, " ");
    strcpy(v_busi_ctrl_str, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_co_no_rights_str, " ");
    strcpy(v_pd_no_rights_str, " ");
    strcpy(v_exch_group_no_rights_str, " ");
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    strncpy(v_stock_acco_status_str, lpInBizMsg->GetString(LDBIZ_STOCK_ACCO_STATUS_STR_STR),64);
    v_stock_acco_status_str[64] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;


    // set @业务控制串# = "010";
    strcpy(v_busi_ctrl_str,"010");
    //调用过程[事务_公共_公共接口_检查系统状态权限身份获取操作员权限串]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.3", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_BUSI_CTRL_STR_STR,v_busi_ctrl_str);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.3]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));
    strcpy(v_co_no_rights_str, lpTSCall1Ans0->GetString(LDBIZ_CO_NO_RIGHTS_STR_STR));
    strcpy(v_pd_no_rights_str, lpTSCall1Ans0->GetString(LDBIZ_PD_NO_RIGHTS_STR_STR));
    strcpy(v_exch_group_no_rights_str, lpTSCall1Ans0->GetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR));


    // set @机构编号# = @操作员机构编号#;
    v_co_no = v_opor_co_no;
    //调用过程[事务_产品证券_账户_查询证券账户信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.44", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_ACCO_STATUS_STR_STR,v_stock_acco_status_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.44]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));


    lpOutBizMsg->FillWithAnotherMsg(lpTSCall1Ans1);
END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if (lpTSCall1Ans2)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans2->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans2->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans2->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_查询证券账户信息流水
int LD_CALL_MODE fnFunc7(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_pd_no;
    int v_asset_acco_no;
    int v_stock_acco_no;
    char v_exch_no_str[2049];
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_create_date;
    int v_create_time;
    int v_update_date;
    int v_update_time;
    int v_oper_menu_no;
    char v_oper_func_code[17];
    int v_init_date;
    int v_co_no;
    int v_exch_no;
    char v_jour_occur_field[2049];
    char v_jour_after_occur_info[2049];
    char v_oper_remark_info[256];
    char v_co_busi_config_str[65];
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_pd_no=0;
    v_asset_acco_no=0;
    v_stock_acco_no=0;
    strcpy(v_exch_no_str, " ");
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_create_date=0;
    v_create_time=0;
    v_update_date=0;
    v_update_time=0;
    v_oper_menu_no=0;
    strcpy(v_oper_func_code, " ");
    v_init_date=0;
    v_co_no=0;
    v_exch_no=0;
    strcpy(v_jour_occur_field, " ");
    strcpy(v_jour_after_occur_info, " ");
    strcpy(v_oper_remark_info, " ");
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));


    // set @机构编号# = @操作员机构编号#;
    v_co_no = v_opor_co_no;
    //调用过程[事务_产品证券_账户_查询证券账户信息流水]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.45", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.45]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));


    lpOutBizMsg->FillWithAnotherMsg(lpTSCall1Ans1);
END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if (lpTSCall1Ans2)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans2->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans2->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans2->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_查询历史证券账户信息流水
int LD_CALL_MODE fnFunc8(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_begin_date;
    int v_end_date;
    int v_pd_no;
    int v_asset_acco_no;
    int v_stock_acco_no;
    char v_exch_no_str[2049];
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_create_date;
    int v_create_time;
    int v_update_date;
    int v_update_time;
    int v_oper_menu_no;
    char v_oper_func_code[17];
    int v_init_date;
    int v_co_no;
    int v_exch_no;
    char v_jour_occur_field[2049];
    char v_jour_after_occur_info[2049];
    char v_oper_remark_info[256];
    int v_record_count;
    char v_co_busi_config_str[65];
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_begin_date=0;
    v_end_date=0;
    v_pd_no=0;
    v_asset_acco_no=0;
    v_stock_acco_no=0;
    strcpy(v_exch_no_str, " ");
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_create_date=0;
    v_create_time=0;
    v_update_date=0;
    v_update_time=0;
    v_oper_menu_no=0;
    strcpy(v_oper_func_code, " ");
    v_init_date=0;
    v_co_no=0;
    v_exch_no=0;
    strcpy(v_jour_occur_field, " ");
    strcpy(v_jour_after_occur_info, " ");
    strcpy(v_oper_remark_info, " ");
    v_record_count=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_begin_date = lpInBizMsg->GetInt32(LDBIZ_BEGIN_DATE_INT);
    v_end_date = lpInBizMsg->GetInt32(LDBIZ_END_DATE_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;


    // [检查报错返回][@开始日期#>@结束日期#][254][@开始日期#,@结束日期#]
    if (v_begin_date>v_end_date)
    {
        strcpy(v_error_code, "pdsecuL.1.46.254");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","开始日期=",v_begin_date,"结束日期=",v_end_date);
        iRet = -1;
        goto END;
    }


    // [获取日期差值][@开始日期#][@结束日期#][@记录个数#]
    v_record_count = DiffDays(v_begin_date,v_end_date);


    // [检查报错返回][@记录个数#>30][255][@开始日期#,@结束日期#]
    if (v_record_count>30)
    {
        strcpy(v_error_code, "pdsecuL.1.46.255");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","开始日期=",v_begin_date,"结束日期=",v_end_date);
        iRet = -1;
        goto END;
    }

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));


    // set @机构编号# = @操作员机构编号#;
    v_co_no = v_opor_co_no;
    //调用过程[事务_产品证券_账户_查询历史证券账户信息流水]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.46", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_BEGIN_DATE_INT,v_begin_date);
    lpTSCall1Req1->SetInt32(LDBIZ_END_DATE_INT,v_end_date);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.46]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));


    lpOutBizMsg->FillWithAnotherMsg(lpTSCall1Ans1);
END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if (lpTSCall1Ans2)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans2->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans2->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans2->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_冻结证券账户
int LD_CALL_MODE fnFunc9(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_pd_no;
    int v_asset_acco_no;
    int v_stock_acco_no;
    char v_registration_agency[33];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_asset_acco_status[3];
    int v_co_no;
    char v_stock_acco_status[3];
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_pd_no=0;
    v_asset_acco_no=0;
    v_stock_acco_no=0;
    strcpy(v_registration_agency, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_asset_acco_status, "0");
    v_co_no=0;
    strcpy(v_stock_acco_status, "0");
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strncpy(v_registration_agency, lpInBizMsg->GetString(LDBIZ_REGISTRATION_AGENCY_STR),32);
    v_registration_agency[32] = '\0';

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;
    IFastMessage* lpTSCall1Req3 = NULL;
    IFastMessage* lpTSCall1Ans3 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));


    // set @资产账户状态# = 0;
    strcpy(v_asset_acco_status,"0");
    //调用过程[事务_产品_公共接口_检查资产账户状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.6.2", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_ACCO_STATUS_STR,v_asset_acco_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.2]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);


    // [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#]
    if (v_co_no != v_opor_co_no)
    {
        strcpy(v_error_code, "pdsecuL.1.47.50");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","机构编号=",v_co_no,"产品编号=",v_pd_no);
        iRet = -1;
        goto END;
    }


    // set @股东代码状态# = 《股东代码状态-冻结》;
    strcpy(v_stock_acco_status,"2");
    //调用过程[事务_产品证券_账户_更新证券账户状态]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.47", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_ACCO_STATUS_STR,v_stock_acco_status);
    lpTSCall1Req2->SetString(LDBIZ_REGISTRATION_AGENCY_STR,v_registration_agency);
    lpTSCall1Req2->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.47]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans2->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));


END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans3)
        {
          lpTSCall1Ans3->FreeMsg();
          lpTSCall1Ans3=NULL;
        }
        lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req3->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req3->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
        if (lpTSCall1Ans3)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans3->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans3->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans3->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    if(lpTSCall1Ans3)
        lpTSCall1Ans3->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_恢复证券账户
int LD_CALL_MODE fnFunc10(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_pd_no;
    int v_asset_acco_no;
    int v_stock_acco_no;
    char v_registration_agency[33];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_asset_acco_status[3];
    int v_co_no;
    char v_stock_acco_status[3];
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_pd_no=0;
    v_asset_acco_no=0;
    v_stock_acco_no=0;
    strcpy(v_registration_agency, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_asset_acco_status, "0");
    v_co_no=0;
    strcpy(v_stock_acco_status, "0");
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strncpy(v_registration_agency, lpInBizMsg->GetString(LDBIZ_REGISTRATION_AGENCY_STR),32);
    v_registration_agency[32] = '\0';

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;
    IFastMessage* lpTSCall1Req3 = NULL;
    IFastMessage* lpTSCall1Ans3 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));


    // set @资产账户状态# = 0;
    strcpy(v_asset_acco_status,"0");
    //调用过程[事务_产品_公共接口_检查资产账户状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.6.2", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_ACCO_STATUS_STR,v_asset_acco_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.2]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);


    // [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#]
    if (v_co_no != v_opor_co_no)
    {
        strcpy(v_error_code, "pdsecuL.1.48.50");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","机构编号=",v_co_no,"产品编号=",v_pd_no);
        iRet = -1;
        goto END;
    }


    // set @股东代码状态# = 《股东代码状态-正常》;
    strcpy(v_stock_acco_status,"1");
    //调用过程[事务_产品证券_账户_更新证券账户状态]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.47", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_ACCO_STATUS_STR,v_stock_acco_status);
    lpTSCall1Req2->SetString(LDBIZ_REGISTRATION_AGENCY_STR,v_registration_agency);
    lpTSCall1Req2->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.47]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans2->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));


END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans3)
        {
          lpTSCall1Ans3->FreeMsg();
          lpTSCall1Ans3=NULL;
        }
        lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req3->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req3->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
        if (lpTSCall1Ans3)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans3->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans3->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans3->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    if(lpTSCall1Ans3)
        lpTSCall1Ans3->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_注销证券账户
int LD_CALL_MODE fnFunc11(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_pd_no;
    int v_asset_acco_no;
    int v_stock_acco_no;
    char v_registration_agency[33];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_asset_acco_status[3];
    int v_co_no;
    int v_record_count;
    char v_stock_acco_status[3];
    int64 v_exgp_posi_id;
    int v_exch_group_no;
    int v_exch_no;
    int v_stock_code_no;
    int v_exch_group_stock_type;
    int v_exch_group_asset_type;
    int v_exgp_invest_type;
    double v_exch_group_begin_qty;
    double v_exgp_curr_qty;
    double v_exgp_pre_settle_qty;
    double v_exgp_frozen_qty;
    double v_exgp_unfroz_qty;
    double v_exgp_posi_qty_check_diff;
    double v_exgp_cost_amt;
    double v_exgp_realize_pandl;
    double v_exgp_intrst_cost_amt;
    double v_exgp_intrst_pandl;
    int v_update_times;
    char v_asset_acco_str[2049];
    int64 v_asac_posi_id;
    int v_asac_stock_type;
    int v_asac_asset_type;
    int v_asac_invest_type;
    double v_asac_begin_qty;
    double v_asac_curr_qty;
    double v_asac_pre_settle_qty;
    double v_asac_frozen_qty;
    double v_asac_unfroz_qty;
    double v_asac_posi_qty_check_diff;
    double v_asac_cost_amt;
    double v_asac_realize_pandl;
    double v_asac_intrst_cost_amt;
    double v_asac_intrst_pandl;
    int64 v_posi_id;
    double v_strike_qty;
    double v_strike_price;
    double v_fair_price;
    int v_strike_date;
    int v_release_date;
    char v_log_error_code[33];
    char v_log_error_info[256];

    IGroup* lpMainMsg1=NULL;
    int iRecordCount = 0;
    IGroup* lpMainMsg2=NULL;
    IGroup* lpMainMsg3=NULL;

IFastMessage* lpPubMsg = NULL;
int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_pd_no=0;
    v_asset_acco_no=0;
    v_stock_acco_no=0;
    strcpy(v_registration_agency, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_asset_acco_status, "0");
    v_co_no=0;
    v_record_count=0;
    strcpy(v_stock_acco_status, "0");
    v_exgp_posi_id=0;
    v_exch_group_no=0;
    v_exch_no=0;
    v_stock_code_no=0;
    v_exch_group_stock_type=0;
    v_exch_group_asset_type=0;
    v_exgp_invest_type=0;
    v_exch_group_begin_qty=0;
    v_exgp_curr_qty=0;
    v_exgp_pre_settle_qty=0;
    v_exgp_frozen_qty=0;
    v_exgp_unfroz_qty=0;
    v_exgp_posi_qty_check_diff=0;
    v_exgp_cost_amt=0;
    v_exgp_realize_pandl=0;
    v_exgp_intrst_cost_amt=0;
    v_exgp_intrst_pandl=0;
    v_update_times=1;
    strcpy(v_asset_acco_str, " ");
    v_asac_posi_id=0;
    v_asac_stock_type=0;
    v_asac_asset_type=0;
    v_asac_invest_type=0;
    v_asac_begin_qty=0;
    v_asac_curr_qty=0;
    v_asac_pre_settle_qty=0;
    v_asac_frozen_qty=0;
    v_asac_unfroz_qty=0;
    v_asac_posi_qty_check_diff=0;
    v_asac_cost_amt=0;
    v_asac_realize_pandl=0;
    v_asac_intrst_cost_amt=0;
    v_asac_intrst_pandl=0;
    v_posi_id=0;
    v_strike_qty=0;
    v_strike_price=0;
    v_fair_price=0;
    v_strike_date=0;
    v_release_date=0;
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strncpy(v_registration_agency, lpInBizMsg->GetString(LDBIZ_REGISTRATION_AGENCY_STR),32);
    v_registration_agency[32] = '\0';

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;
    IFastMessage* lpTSCall1Req3 = NULL;
    IFastMessage* lpTSCall1Ans3 = NULL;
    IFastMessage* lpTSCall1Req4 = NULL;
    IFastMessage* lpTSCall1Ans4 = NULL;
    IFastMessage* lpTSCall1Req5 = NULL;
    IFastMessage* lpTSCall1Ans5 = NULL;
    IFastMessage* lpTSCall1Req6 = NULL;
    IFastMessage* lpTSCall1Ans6 = NULL;
    IFastMessage* lpTSCall1Req7 = NULL;
    IFastMessage* lpTSCall1Ans7 = NULL;
    IFastMessage* lpTSCall1Req8 = NULL;
    IFastMessage* lpTSCall1Ans8 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));


    // set @资产账户状态# = 0;
    strcpy(v_asset_acco_status,"0");
    //调用过程[事务_产品_公共接口_检查资产账户状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.6.2", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_ACCO_STATUS_STR,v_asset_acco_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.2]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);


    // [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#]
    if (v_co_no != v_opor_co_no)
    {
        strcpy(v_error_code, "pdsecuL.1.49.50");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","机构编号=",v_co_no,"产品编号=",v_pd_no);
        iRet = -1;
        goto END;
    }

    //调用过程[事务_产品证券_账户_判断股东代码能否注销]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.80", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.80]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans2->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
    v_record_count = lpTSCall1Ans2->GetInt32(LDBIZ_RECORD_COUNT_INT);


    // [检查报错返回][@记录个数#>0][88][@资产账户编号#,@股东代码编号#]
    if (v_record_count>0)
    {
        strcpy(v_error_code, "pdsecuL.1.49.88");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","资产账户编号=",v_asset_acco_no,"股东代码编号=",v_stock_acco_no);
        iRet = -1;
        goto END;
    }

    //调用过程[事务_产品证券_账户_注销股东代码回退持仓]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.81", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req3->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req3->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.81]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans3->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans3->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans3->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));


    // set @股东代码状态# = 《股东代码状态-注销》;
    strcpy(v_stock_acco_status,"3");
    //调用过程[事务_产品证券_账户_更新证券账户状态]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.47", 0);
    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req4->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req4->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req4->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req4->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req4->SetString(LDBIZ_STOCK_ACCO_STATUS_STR,v_stock_acco_status);
    lpTSCall1Req4->SetString(LDBIZ_REGISTRATION_AGENCY_STR,v_registration_agency);
    lpTSCall1Req4->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.47]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans4->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans4->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans4->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans4->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans4->GetString(LDBIZ_ERROR_INFO_STR));

    //主推利用资产账户查询接口，将资产账户下所有股东代码的持仓都主推一遍。
    //调用过程[事务_产品证券_账户_查询资产账户下所有交易组持仓]
    //组织事务请求
    if(lpTSCall1Ans5)
    {
      lpTSCall1Ans5->FreeMsg();
      lpTSCall1Ans5=NULL;
    }
    lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.76", 0);
    lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req5->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req5->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req5->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
    if(!lpTSCall1Ans5)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.76]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans5->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans5->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans5->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans5->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans5->GetString(LDBIZ_ERROR_INFO_STR));


    // [获取结果集][lpMainMsg1]
    lpMainMsg1=lpTSCall1Ans5->GetGroup(LDTAG_NO_RESULTSET);


    // [遍历结果集开始][lpMainMsg1]
    iRecordCount = lpMainMsg1->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpMainMsg1->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            v_exgp_posi_id = lpRecord->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
            v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
            v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
            v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
            v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
            v_exch_group_stock_type = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT);
            v_exch_group_asset_type = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT);
            v_exgp_invest_type = lpRecord->GetInt32(LDBIZ_EXGP_INVEST_TYPE_INT);
            v_exch_group_begin_qty = lpRecord->GetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT);
            v_exgp_curr_qty = lpRecord->GetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT);
            v_exgp_pre_settle_qty = lpRecord->GetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT);
            v_exgp_frozen_qty = lpRecord->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
            v_exgp_unfroz_qty = lpRecord->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
            v_exgp_posi_qty_check_diff = lpRecord->GetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT);
            v_exgp_cost_amt = lpRecord->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
            v_exgp_realize_pandl = lpRecord->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
            v_exgp_intrst_cost_amt = lpRecord->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
            v_exgp_intrst_pandl = lpRecord->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


         // [主动推送][secu.pdexgpposi][证券主推_产品持仓_交易组持仓主推消息]
         lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.80", 0);
         lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
         lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
         lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
         lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
         lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
         lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
         lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
         lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
         lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT,v_exch_group_stock_type);
         lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT,v_exch_group_asset_type);
         lpPubMsg->SetInt32(LDBIZ_EXGP_INVEST_TYPE_INT,v_exgp_invest_type);
         lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT,v_exch_group_begin_qty);
         lpPubMsg->SetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT,v_exgp_curr_qty);
         lpPubMsg->SetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT,v_exgp_pre_settle_qty);
         lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
         lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
         lpPubMsg->SetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT,v_exgp_posi_qty_check_diff);
         lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
         lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
         lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
         lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
         lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
         glpPubSub_Interface->PubTopics("secu.pdexgpposi", lpPubMsg);


    // [遍历结果集结束][lpMainMsg1]
        }
    }


    // set @资产账户串# = concat(";",@资产账户编号#,";");
    snprintf(v_asset_acco_str,sizeof(v_asset_acco_str),"%s%d%s",";",v_asset_acco_no,";");
    //调用过程[事务_产品证券_公共接口_查询资产账户持仓信息]
    //组织事务请求
    if(lpTSCall1Ans6)
    {
      lpTSCall1Ans6->FreeMsg();
      lpTSCall1Ans6=NULL;
    }
    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("pdsecuT.4.112", 0);
    lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req6->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req6->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req6->SetString(LDBIZ_ASSET_ACCO_STR_STR,v_asset_acco_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
    if(!lpTSCall1Ans6)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.4.112]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans6->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans6->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans6->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans6->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans6->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans6->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans6->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans6->GetString(LDBIZ_ERROR_INFO_STR));


    // [获取结果集][lpMainMsg2]
    lpMainMsg2=lpTSCall1Ans6->GetGroup(LDTAG_NO_RESULTSET);


    // [遍历结果集开始][lpMainMsg2]
    iRecordCount = lpMainMsg2->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpMainMsg2->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            v_asac_posi_id = lpRecord->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
            v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
            v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
            v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
            v_asac_stock_type = lpRecord->GetInt32(LDBIZ_ASAC_STOCK_TYPE_INT);
            v_asac_asset_type = lpRecord->GetInt32(LDBIZ_ASAC_ASSET_TYPE_INT);
            v_asac_invest_type = lpRecord->GetInt32(LDBIZ_ASAC_INVEST_TYPE_INT);
            v_asac_begin_qty = lpRecord->GetDouble(LDBIZ_ASAC_BEGIN_QTY_FLOAT);
            v_asac_curr_qty = lpRecord->GetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT);
            v_asac_pre_settle_qty = lpRecord->GetDouble(LDBIZ_ASAC_PRE_SETTLE_QTY_FLOAT);
            v_asac_frozen_qty = lpRecord->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
            v_asac_unfroz_qty = lpRecord->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
            v_asac_posi_qty_check_diff = lpRecord->GetDouble(LDBIZ_ASAC_POSI_QTY_CHECK_DIFF_FLOAT);
            v_asac_cost_amt = lpRecord->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
            v_asac_realize_pandl = lpRecord->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
            v_asac_intrst_cost_amt = lpRecord->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
            v_asac_intrst_pandl = lpRecord->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


         // [主动推送][secu.pdasacposi][证券主推_产品持仓_资产账户持仓主推消息]
         lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.81", 0);
         lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
         lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
         lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
         lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
         lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
         lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
         lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
         lpPubMsg->SetInt32(LDBIZ_ASAC_STOCK_TYPE_INT,v_asac_stock_type);
         lpPubMsg->SetInt32(LDBIZ_ASAC_ASSET_TYPE_INT,v_asac_asset_type);
         lpPubMsg->SetInt32(LDBIZ_ASAC_INVEST_TYPE_INT,v_asac_invest_type);
         lpPubMsg->SetDouble(LDBIZ_ASAC_BEGIN_QTY_FLOAT,v_asac_begin_qty);
         lpPubMsg->SetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT,v_asac_curr_qty);
         lpPubMsg->SetDouble(LDBIZ_ASAC_PRE_SETTLE_QTY_FLOAT,v_asac_pre_settle_qty);
         lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
         lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
         lpPubMsg->SetDouble(LDBIZ_ASAC_POSI_QTY_CHECK_DIFF_FLOAT,v_asac_posi_qty_check_diff);
         lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
         lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
         lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
         lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
         lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
         glpPubSub_Interface->PubTopics("secu.pdasacposi", lpPubMsg);


    // [遍历结果集结束][lpMainMsg2]
        }
    }

    //调用过程[事务_产品证券_账户_查询资产账户下所有大宗交易持仓]
    //组织事务请求
    if(lpTSCall1Ans7)
    {
      lpTSCall1Ans7->FreeMsg();
      lpTSCall1Ans7=NULL;
    }
    lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.77", 0);
    lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req7->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req7->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req7->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
    if(!lpTSCall1Ans7)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.77]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans7->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans7->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans7->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans7->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans7->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans7->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans7->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans7->GetString(LDBIZ_ERROR_INFO_STR));


    // [获取结果集][lpMainMsg3]
    lpMainMsg3=lpTSCall1Ans7->GetGroup(LDTAG_NO_RESULTSET);


    // [遍历结果集开始][lpMainMsg3]
    iRecordCount = lpMainMsg3->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpMainMsg3->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            v_posi_id = lpRecord->GetInt64(LDBIZ_POSI_ID_INT64);
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
            v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
            v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
            v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
            v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
            v_strike_qty = lpRecord->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
            v_strike_price = lpRecord->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
            v_fair_price = lpRecord->GetDouble(LDBIZ_FAIR_PRICE_FLOAT);
            v_strike_date = lpRecord->GetInt32(LDBIZ_STRIKE_DATE_INT);
            v_release_date = lpRecord->GetInt32(LDBIZ_RELEASE_DATE_INT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


         // [主动推送][secu.pdblocktradeposi][证券主推_产品持仓_大宗交易持仓主推消息]
         lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.83", 0);
         lpPubMsg->SetInt64(LDBIZ_POSI_ID_INT64,v_posi_id);
         lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
         lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
         lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
         lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
         lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
         lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
         lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
         lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
         lpPubMsg->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
         lpPubMsg->SetDouble(LDBIZ_FAIR_PRICE_FLOAT,v_fair_price);
         lpPubMsg->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
         lpPubMsg->SetInt32(LDBIZ_RELEASE_DATE_INT,v_release_date);
         lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
         glpPubSub_Interface->PubTopics("secu.pdblocktradeposi", lpPubMsg);


    // [遍历结果集结束][lpMainMsg3]
        }
    }


END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans8)
        {
          lpTSCall1Ans8->FreeMsg();
          lpTSCall1Ans8=NULL;
        }
        lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req8->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req8->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
        if (lpTSCall1Ans8)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans8->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans8->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans8->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans8->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans8->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    if(lpTSCall1Ans3)
        lpTSCall1Ans3->FreeMsg();
    if(lpTSCall1Ans4)
        lpTSCall1Ans4->FreeMsg();
    if(lpTSCall1Ans5)
        lpTSCall1Ans5->FreeMsg();
    if(lpTSCall1Ans6)
        lpTSCall1Ans6->FreeMsg();
    if(lpTSCall1Ans7)
        lpTSCall1Ans7->FreeMsg();
    if(lpTSCall1Ans8)
        lpTSCall1Ans8->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_查询证券账户列表
int LD_CALL_MODE fnFunc12(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_co_no;
    int v_pd_no;
    int v_asset_acco_no;
    int v_stock_acco_no;
    int v_exch_no;
    char v_stock_acco[17];
    char v_stock_acco_name[65];
    char v_stock_acco_status[3];
    char v_stock_acco_apoint_status[3];
    char v_registration_agency[33];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_co_no=0;
    v_pd_no=0;
    v_asset_acco_no=0;
    v_stock_acco_no=0;
    v_exch_no=0;
    strcpy(v_stock_acco, " ");
    strcpy(v_stock_acco_name, " ");
    strcpy(v_stock_acco_status, "0");
    strcpy(v_stock_acco_apoint_status, "0");
    strcpy(v_registration_agency, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));

    //调用过程[事务_产品证券_账户_查询证券账户列表]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.51", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.51]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));


    lpOutBizMsg->FillWithAnotherMsg(lpTSCall1Ans1);
END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if (lpTSCall1Ans2)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans2->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans2->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans2->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_新增证券账户自动打新配置
int LD_CALL_MODE fnFunc13(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_pd_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_acco_no;
    int v_target_opor_no;
    int v_begin_time;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_asset_acco_status[3];
    int v_co_no;
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_pd_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_target_opor_no=0;
    v_begin_time=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_asset_acco_status, "0");
    v_co_no=0;
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_target_opor_no = lpInBizMsg->GetInt32(LDBIZ_TARGET_OPOR_NO_INT);
    v_begin_time = lpInBizMsg->GetInt32(LDBIZ_BEGIN_TIME_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;
    IFastMessage* lpTSCall1Req3 = NULL;
    IFastMessage* lpTSCall1Ans3 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));


    // set @资产账户状态# = 0;
    strcpy(v_asset_acco_status,"0");
    //调用过程[事务_产品_公共接口_检查资产账户状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.6.2", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_ACCO_STATUS_STR,v_asset_acco_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.2]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);


    // [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#]
    if (v_co_no != v_opor_co_no)
    {
        strcpy(v_error_code, "pdsecuL.1.61.50");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","机构编号=",v_co_no,"产品编号=",v_pd_no);
        iRet = -1;
        goto END;
    }

    //调用过程[事务_产品证券_账户_新增证券账户自动打新配置]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.61", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req2->SetInt32(LDBIZ_TARGET_OPOR_NO_INT,v_target_opor_no);
    lpTSCall1Req2->SetInt32(LDBIZ_BEGIN_TIME_INT,v_begin_time);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.61]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans2->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));


END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans3)
        {
          lpTSCall1Ans3->FreeMsg();
          lpTSCall1Ans3=NULL;
        }
        lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req3->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req3->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
        if (lpTSCall1Ans3)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans3->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans3->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans3->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    if(lpTSCall1Ans3)
        lpTSCall1Ans3->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_修改证券账户自动打新配置
int LD_CALL_MODE fnFunc14(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_pd_no;
    int v_asset_acco_no;
    int v_stock_acco_no;
    int v_target_opor_no;
    int v_begin_time;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_pd_no=0;
    v_asset_acco_no=0;
    v_stock_acco_no=0;
    v_target_opor_no=0;
    v_begin_time=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_target_opor_no = lpInBizMsg->GetInt32(LDBIZ_TARGET_OPOR_NO_INT);
    v_begin_time = lpInBizMsg->GetInt32(LDBIZ_BEGIN_TIME_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));

    //调用过程[事务_产品证券_账户_更新证券账户自动打新配置]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.62", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_TARGET_OPOR_NO_INT,v_target_opor_no);
    lpTSCall1Req1->SetInt32(LDBIZ_BEGIN_TIME_INT,v_begin_time);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.62]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));


    // set @开始时间# = 0;
    v_begin_time = 0;

END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if (lpTSCall1Ans2)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans2->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans2->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans2->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_删除证券账户自动打新配置
int LD_CALL_MODE fnFunc15(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_pd_no;
    int v_asset_acco_no;
    int v_stock_acco_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_pd_no=0;
    v_asset_acco_no=0;
    v_stock_acco_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));

    //调用过程[事务_产品证券_账户_删除证券账户自动打新配置]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.63", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.63]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));


END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if (lpTSCall1Ans2)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans2->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans2->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans2->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_查询证券账户自动打新配置
int LD_CALL_MODE fnFunc16(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_pd_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_acco_no;
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_co_no;
    int v_begin_time;
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_pd_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_co_no=0;
    v_begin_time=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));


    // set @机构编号# = @操作员机构编号#;
    v_co_no = v_opor_co_no;
    //调用过程[事务_产品证券_账户_查询证券账户自动打新配置]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.64", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.64]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));


    lpOutBizMsg->FillWithAnotherMsg(lpTSCall1Ans1);
END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if (lpTSCall1Ans2)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans2->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans2->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans2->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_查询报盘所需资产账户证券账户信息
int LD_CALL_MODE fnFunc17(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_pass_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_asset_acco_no;
    char v_asset_acco[17];
    char v_out_acco[33];
    int v_stock_acco_no;
    int v_exch_no;
    char v_stock_acco[17];
    char v_comm_pwd[65];
    char v_trade_pwd[65];
    char v_config_str[2049];
    char v_asac_busi_config_str[65];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_asset_acco_no_str[2049];
    char v_log_error_code[33];
    char v_log_error_info[256];

    IGroup* lpMainMsg=NULL;
    IGroup* lpMinorMsg=NULL;
    IGroup* lpOutGroup=NULL;

int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_pass_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_asset_acco_no=0;
    strcpy(v_asset_acco, " ");
    strcpy(v_out_acco, " ");
    v_stock_acco_no=0;
    v_exch_no=0;
    strcpy(v_stock_acco, " ");
    strcpy(v_comm_pwd, " ");
    strcpy(v_trade_pwd, " ");
    strcpy(v_config_str, " ");
    strcpy(v_asac_busi_config_str, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_asset_acco_no_str, " ");
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;
    IFastMessage* lpTSCall1Req3 = NULL;
    IFastMessage* lpTSCall1Ans3 = NULL;
    IFastMessage* lpTSCall1Req4 = NULL;
    IFastMessage* lpTSCall1Ans4 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));

    //调用过程[事务_产品_公共接口_获取通道资产账户编号串]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.6.21", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.21]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
    strcpy(v_asset_acco_no_str, lpTSCall1Ans1->GetString(LDBIZ_ASSET_ACCO_NO_STR_STR));


    // [检查正常返回][@资产账户编号串# = " "]
    if (strcmp(v_asset_acco_no_str , " ")==0)
    {
        strcpy(v_error_code, "0");
        strcpy(v_error_info, " ");
        goto END;
    }

    //调用过程[事务_产品证券_账户_查询报盘所需证券账户信息]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.501", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetString(LDBIZ_ASSET_ACCO_NO_STR_STR,v_asset_acco_no_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.501]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans2->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));


    // [获取结果集][lpMainMsg]
    lpMainMsg=lpTSCall1Ans2->GetGroup(LDTAG_NO_RESULTSET);

    //调用过程[事务_产品_公共接口_查询报盘所需资产账户信息]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("prodT.6.501", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req3->SetString(LDBIZ_ASSET_ACCO_NO_STR_STR,v_asset_acco_no_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.501]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans3->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans3->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans3->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));


    // [获取结果集][lpMinorMsg]
    lpMinorMsg=lpTSCall1Ans3->GetGroup(LDTAG_NO_RESULTSET);


    // [两个结果集合并输出][lpMainMsg][lpMinorMsg][{资产账户编号}]
    int iFieldsIDs[1];
    iFieldsIDs[0]=LDBIZ_ASSET_ACCO_NO_INT;
    lpMainMsg->SortbyFields(1, iFieldsIDs);
    lpMinorMsg->SortbyFields(1, iFieldsIDs);
    lpOutGroup=lpOutBizMsg->SetGroup(LDTAG_NO_RESULTSET);
    lpOutGroup->JoinTwoResultByFields(lpMainMsg, lpMinorMsg, 1, iFieldsIDs);


END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans4)
        {
          lpTSCall1Ans4->FreeMsg();
          lpTSCall1Ans4=NULL;
        }
        lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req4->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req4->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
        if (lpTSCall1Ans4)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans4->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans4->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans4->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans4->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    if(lpTSCall1Ans3)
        lpTSCall1Ans3->FreeMsg();
    if(lpTSCall1Ans4)
        lpTSCall1Ans4->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_更新资产账户股东信息
int LD_CALL_MODE fnFunc18(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_pass_no;
    char v_out_acco[33];
    int v_exch_no;
    char v_stock_acco[17];
    char v_stock_acco_name[65];
    char v_stock_acco_status[3];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_co_no;
    int v_pd_no;
    int v_asset_acco_no;
    char v_allow_stock_type[2049];
    char v_busi_limit_str[2049];
    char v_registration_agency[33];
    char v_stock_acco_apoint_status[3];
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    strcpy(v_stock_acco, " ");
    strcpy(v_stock_acco_name, " ");
    strcpy(v_stock_acco_status, "0");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_co_no=0;
    v_pd_no=0;
    v_asset_acco_no=0;
    strcpy(v_allow_stock_type, " ");
    strcpy(v_busi_limit_str, " ");
    strcpy(v_registration_agency, " ");
    strcpy(v_stock_acco_apoint_status, "0");
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    strncpy(v_out_acco, lpInBizMsg->GetString(LDBIZ_OUT_ACCO_STR),32);
    v_out_acco[32] = '\0';
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    strncpy(v_stock_acco, lpInBizMsg->GetString(LDBIZ_STOCK_ACCO_STR),16);
    v_stock_acco[16] = '\0';
    strncpy(v_stock_acco_name, lpInBizMsg->GetString(LDBIZ_STOCK_ACCO_NAME_STR),64);
    v_stock_acco_name[64] = '\0';
    strncpy(v_stock_acco_status, lpInBizMsg->GetString(LDBIZ_STOCK_ACCO_STATUS_STR),2);
    v_stock_acco_status[2] = '\0';

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;
    IFastMessage* lpTSCall1Req3 = NULL;
    IFastMessage* lpTSCall1Ans3 = NULL;

    //[事务_公共_公共接口_检查系统状态]
    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));

    //调用过程[事务_产品_公共接口_外部账号获取资产账户信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.6.43", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.43]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strcpy(v_allow_stock_type, lpTSCall1Ans1->GetString(LDBIZ_ALLOW_STOCK_TYPE_STR));
    strcpy(v_busi_limit_str, lpTSCall1Ans1->GetString(LDBIZ_BUSI_LIMIT_STR_STR));


    // set @登记机构#=" ";
    strcpy(v_registration_agency," ");

    // set @股东指定状态#="1";
    strcpy(v_stock_acco_apoint_status,"1");
    //调用过程[事务_产品证券_账户_更新资产账户股东信息]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.71", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_ACCO_NAME_STR,v_stock_acco_name);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_ACCO_STATUS_STR,v_stock_acco_status);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_ACCO_APOINT_STATUS_STR,v_stock_acco_apoint_status);
    lpTSCall1Req2->SetString(LDBIZ_ALLOW_STOCK_TYPE_STR,v_allow_stock_type);
    lpTSCall1Req2->SetString(LDBIZ_BUSI_LIMIT_STR_STR,v_busi_limit_str);
    lpTSCall1Req2->SetString(LDBIZ_REGISTRATION_AGENCY_STR,v_registration_agency);
    lpTSCall1Req2->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.71]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans2->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));


END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans3)
        {
          lpTSCall1Ans3->FreeMsg();
          lpTSCall1Ans3=NULL;
        }
        lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req3->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req3->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
        if (lpTSCall1Ans3)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans3->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans3->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans3->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
    lpOutBizMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpOutBizMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    if(lpTSCall1Ans3)
        lpTSCall1Ans3->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_注销资产账户和证券账户
int LD_CALL_MODE fnFunc19(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_pd_no;
    int v_asset_acco_no;
    char v_oper_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_asset_acco_status[3];
    int v_co_no;
    int v_record_count;
    char v_crncy_type[4];
    double v_curr_amt;
    double v_amt_check_diff;
    double v_total_rece_amt;
    double v_total_payab_amt;
    double v_total_change_amt;
    int64 v_pd_cash_id;
    double v_pd_first_amt;
    double v_pd_curr_amt;
    double v_pd_dist_amt;
    double v_pd_auth_amt;
    double v_pd_amt_check_diff;
    double v_pd_pre_settle_amt;
    double v_pd_total_cash_divide;
    double v_pd_total_pre_fee;
    double v_pd_total_rece_amt;
    double v_pd_total_payab_amt;
    double v_pd_intrst_cacl_amt;
    double v_pd_pre_entry_intrst_amt;
    int v_pd_update_times;
    char v_stock_acco_status[3];
    int v_update_times;
    int64 v_exgp_cash_id;
    int v_exch_group_no;
    double v_exgp_begin_amt;
    double v_exgp_curr_amt;
    double v_exgp_frozen_amt;
    double v_exgp_unfroz_amt;
    double v_exgp_pre_settle_amt;
    double v_exgp_shsz_avail_change_amt;
    double v_exgp_hk_avail_change_amt;
    double v_exgp_amt_check_diff;
    double v_exgp_T_hk_buy_total_amt;
    double v_exgp_T_hk_sell_total_amt;
    double v_exgp_T1_hk_buy_total_amt;
    double v_exgp_T1_hk_sell_total_amt;
    double v_exch_group_total_rece_amt;
    double v_exch_group_total_payab_amt;
    double v_exgp_realize_pandl;
    double v_exch_group_intrst_rate;
    double v_exch_group_intrst_base_amt;
    double v_exch_group_pre_entry_intrst_amt;
    int64 v_exgp_posi_id;
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    int v_exch_group_stock_type;
    int v_exch_group_asset_type;
    int v_exgp_invest_type;
    double v_exch_group_begin_qty;
    double v_exgp_curr_qty;
    double v_exgp_pre_settle_qty;
    double v_exgp_frozen_qty;
    double v_exgp_unfroz_qty;
    double v_exgp_posi_qty_check_diff;
    double v_exgp_cost_amt;
    double v_exgp_intrst_cost_amt;
    double v_exgp_intrst_pandl;
    char v_asset_acco_str[2049];
    int64 v_asac_cash_id;
    double v_asac_begin_amt;
    double v_asac_curr_amt;
    double v_asac_frozen_amt;
    double v_asac_unfroz_amt;
    double v_asac_pre_settle_amt;
    double v_asac_shsz_avail_change_amt;
    double v_asac_hk_avail_change_amt;
    double v_asac_amt_check_diff;
    double v_asac_T_hk_buy_total_amt;
    double v_asac_T_hk_sell_total_amt;
    double v_asac_T1_hk_buy_total_amt;
    double v_asac_T1_hk_sell_total_amt;
    double v_asac_total_rece_amt;
    double v_asac_total_payab_amt;
    double v_asac_realize_pandl;
    double v_asac_intrst_rate;
    double v_asac_intrst_base_amt;
    double v_asac_pre_entry_intrst_amt;
    int64 v_asac_posi_id;
    int v_asac_stock_type;
    int v_asac_asset_type;
    int v_asac_invest_type;
    double v_asac_begin_qty;
    double v_asac_curr_qty;
    double v_asac_pre_settle_qty;
    double v_asac_frozen_qty;
    double v_asac_unfroz_qty;
    double v_asac_posi_qty_check_diff;
    double v_asac_cost_amt;
    double v_asac_intrst_cost_amt;
    double v_asac_intrst_pandl;
    int64 v_posi_id;
    double v_strike_qty;
    double v_strike_price;
    double v_fair_price;
    int v_strike_date;
    int v_release_date;
    char v_log_error_code[33];
    char v_log_error_info[256];

    IGroup* lpMainMsg1=NULL;
    int iRecordCount = 0;
    IGroup* lpMainMsg2=NULL;
    IGroup* lpMainMsg3=NULL;
    IGroup* lpMainMsg4=NULL;
    IGroup* lpMainMsg5=NULL;

IFastMessage* lpPubMsg = NULL;
int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_pd_no=0;
    v_asset_acco_no=0;
    strcpy(v_oper_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_asset_acco_status, "0");
    v_co_no=0;
    v_record_count=0;
    strcpy(v_crncy_type, "CNY");
    v_curr_amt=0;
    v_amt_check_diff=0;
    v_total_rece_amt=0;
    v_total_payab_amt=0;
    v_total_change_amt=0;
    v_pd_cash_id=0;
    v_pd_first_amt=0;
    v_pd_curr_amt=0;
    v_pd_dist_amt=0;
    v_pd_auth_amt=0;
    v_pd_amt_check_diff=0;
    v_pd_pre_settle_amt=0;
    v_pd_total_cash_divide=0;
    v_pd_total_pre_fee=0;
    v_pd_total_rece_amt=0;
    v_pd_total_payab_amt=0;
    v_pd_intrst_cacl_amt=0;
    v_pd_pre_entry_intrst_amt=0;
    v_pd_update_times=0;
    strcpy(v_stock_acco_status, "0");
    v_update_times=1;
    v_exgp_cash_id=0;
    v_exch_group_no=0;
    v_exgp_begin_amt=0;
    v_exgp_curr_amt=0;
    v_exgp_frozen_amt=0;
    v_exgp_unfroz_amt=0;
    v_exgp_pre_settle_amt=0;
    v_exgp_shsz_avail_change_amt=0;
    v_exgp_hk_avail_change_amt=0;
    v_exgp_amt_check_diff=0;
    v_exgp_T_hk_buy_total_amt=0;
    v_exgp_T_hk_sell_total_amt=0;
    v_exgp_T1_hk_buy_total_amt=0;
    v_exgp_T1_hk_sell_total_amt=0;
    v_exch_group_total_rece_amt=0;
    v_exch_group_total_payab_amt=0;
    v_exgp_realize_pandl=0;
    v_exch_group_intrst_rate=0;
    v_exch_group_intrst_base_amt=0;
    v_exch_group_pre_entry_intrst_amt=0;
    v_exgp_posi_id=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_exch_group_stock_type=0;
    v_exch_group_asset_type=0;
    v_exgp_invest_type=0;
    v_exch_group_begin_qty=0;
    v_exgp_curr_qty=0;
    v_exgp_pre_settle_qty=0;
    v_exgp_frozen_qty=0;
    v_exgp_unfroz_qty=0;
    v_exgp_posi_qty_check_diff=0;
    v_exgp_cost_amt=0;
    v_exgp_intrst_cost_amt=0;
    v_exgp_intrst_pandl=0;
    strcpy(v_asset_acco_str, " ");
    v_asac_cash_id=0;
    v_asac_begin_amt=0;
    v_asac_curr_amt=0;
    v_asac_frozen_amt=0;
    v_asac_unfroz_amt=0;
    v_asac_pre_settle_amt=0;
    v_asac_shsz_avail_change_amt=0;
    v_asac_hk_avail_change_amt=0;
    v_asac_amt_check_diff=0;
    v_asac_T_hk_buy_total_amt=0;
    v_asac_T_hk_sell_total_amt=0;
    v_asac_T1_hk_buy_total_amt=0;
    v_asac_T1_hk_sell_total_amt=0;
    v_asac_total_rece_amt=0;
    v_asac_total_payab_amt=0;
    v_asac_realize_pandl=0;
    v_asac_intrst_rate=0;
    v_asac_intrst_base_amt=0;
    v_asac_pre_entry_intrst_amt=0;
    v_asac_posi_id=0;
    v_asac_stock_type=0;
    v_asac_asset_type=0;
    v_asac_invest_type=0;
    v_asac_begin_qty=0;
    v_asac_curr_qty=0;
    v_asac_pre_settle_qty=0;
    v_asac_frozen_qty=0;
    v_asac_unfroz_qty=0;
    v_asac_posi_qty_check_diff=0;
    v_asac_cost_amt=0;
    v_asac_intrst_cost_amt=0;
    v_asac_intrst_pandl=0;
    v_posi_id=0;
    v_strike_qty=0;
    v_strike_price=0;
    v_fair_price=0;
    v_strike_date=0;
    v_release_date=0;
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strncpy(v_oper_remark_info, lpInBizMsg->GetString(LDBIZ_OPER_REMARK_INFO_STR),255);
    v_oper_remark_info[255] = '\0';

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;
    IFastMessage* lpTSCall1Req3 = NULL;
    IFastMessage* lpTSCall1Ans3 = NULL;
    IFastMessage* lpTSCall1Req4 = NULL;
    IFastMessage* lpTSCall1Ans4 = NULL;
    IFastMessage* lpTSCall1Req5 = NULL;
    IFastMessage* lpTSCall1Ans5 = NULL;
    IFastMessage* lpTSCall1Req6 = NULL;
    IFastMessage* lpTSCall1Ans6 = NULL;
    IFastMessage* lpTSCall1Req7 = NULL;
    IFastMessage* lpTSCall1Ans7 = NULL;
    IFastMessage* lpTSCall1Req8 = NULL;
    IFastMessage* lpTSCall1Ans8 = NULL;
    IFastMessage* lpTSCall1Req9 = NULL;
    IFastMessage* lpTSCall1Ans9 = NULL;
    IFastMessage* lpTSCall1Req10 = NULL;
    IFastMessage* lpTSCall1Ans10 = NULL;
    IFastMessage* lpTSCall1Req11 = NULL;
    IFastMessage* lpTSCall1Ans11 = NULL;
    IFastMessage* lpTSCall1Req12 = NULL;
    IFastMessage* lpTSCall1Ans12 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));


    // set @资产账户状态# = 0;
    strcpy(v_asset_acco_status,"0");
    //调用过程[事务_产品_公共接口_检查资产账户状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.6.2", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_ACCO_STATUS_STR,v_asset_acco_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.2]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);


    // [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#]
    if (v_co_no != v_opor_co_no)
    {
        strcpy(v_error_code, "pdsecuL.1.72.50");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","机构编号=",v_co_no,"产品编号=",v_pd_no);
        iRet = -1;
        goto END;
    }

    //调用过程[事务_产品证券_账户_判断资产账户能否注销]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.73", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.73]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans2->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
    v_record_count = lpTSCall1Ans2->GetInt32(LDBIZ_RECORD_COUNT_INT);


    // [检查报错返回][@记录个数#>0][87][@资产账户编号#]
    if (v_record_count>0)
    {
        strcpy(v_error_code, "pdsecuL.1.72.87");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d","资产账户编号=",v_asset_acco_no);
        iRet = -1;
        goto END;
    }


    // set @本币币种# = "CNY";
    strcpy(v_crncy_type,"CNY");
    //调用过程[事务_产品证券_账户_注销资产账户回退资金持仓]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.74", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req3->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req3->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.74]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans3->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans3->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans3->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
    v_curr_amt = lpTSCall1Ans3->GetDouble(LDBIZ_CURR_AMT_FLOAT);
    v_amt_check_diff = lpTSCall1Ans3->GetDouble(LDBIZ_AMT_CHECK_DIFF_FLOAT);
    v_total_rece_amt = lpTSCall1Ans3->GetDouble(LDBIZ_TOTAL_RECE_AMT_FLOAT);
    v_total_payab_amt = lpTSCall1Ans3->GetDouble(LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
    v_total_change_amt = lpTSCall1Ans3->GetDouble(LDBIZ_TOTAL_CHANGE_AMT_FLOAT);

    //调用过程[事务_产品_公共接口_注销回退产品资金]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("prodT.6.45", 0);
    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req4->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req4->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req4->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req4->SetDouble(LDBIZ_CURR_AMT_FLOAT,v_curr_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_AMT_CHECK_DIFF_FLOAT,v_amt_check_diff);
    lpTSCall1Req4->SetDouble(LDBIZ_TOTAL_RECE_AMT_FLOAT,v_total_rece_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_TOTAL_PAYAB_AMT_FLOAT,v_total_payab_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_TOTAL_CHANGE_AMT_FLOAT,v_total_change_amt);
    lpTSCall1Req4->SetString(LDBIZ_OPER_REMARK_INFO_STR,v_oper_remark_info);
    lpTSCall1Req4->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.45]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans4->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans4->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans4->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans4->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans4->GetString(LDBIZ_ERROR_INFO_STR));
    v_pd_cash_id = lpTSCall1Ans4->GetInt64(LDBIZ_PD_CASH_ID_INT64);
    v_pd_first_amt = lpTSCall1Ans4->GetDouble(LDBIZ_PD_FIRST_AMT_FLOAT);
    v_pd_curr_amt = lpTSCall1Ans4->GetDouble(LDBIZ_PD_CURR_AMT_FLOAT);
    v_pd_dist_amt = lpTSCall1Ans4->GetDouble(LDBIZ_PD_DIST_AMT_FLOAT);
    v_pd_auth_amt = lpTSCall1Ans4->GetDouble(LDBIZ_PD_AUTH_AMT_FLOAT);
    v_pd_amt_check_diff = lpTSCall1Ans4->GetDouble(LDBIZ_PD_AMT_CHECK_DIFF_FLOAT);
    v_pd_pre_settle_amt = lpTSCall1Ans4->GetDouble(LDBIZ_PD_PRE_SETTLE_AMT_FLOAT);
    v_pd_total_cash_divide = lpTSCall1Ans4->GetDouble(LDBIZ_PD_TOTAL_CASH_DIVIDE_FLOAT);
    v_pd_total_pre_fee = lpTSCall1Ans4->GetDouble(LDBIZ_PD_TOTAL_PRE_FEE_FLOAT);
    v_pd_total_rece_amt = lpTSCall1Ans4->GetDouble(LDBIZ_PD_TOTAL_RECE_AMT_FLOAT);
    v_pd_total_payab_amt = lpTSCall1Ans4->GetDouble(LDBIZ_PD_TOTAL_PAYAB_AMT_FLOAT);
    v_pd_intrst_cacl_amt = lpTSCall1Ans4->GetDouble(LDBIZ_PD_INTRST_CACL_AMT_FLOAT);
    v_pd_pre_entry_intrst_amt = lpTSCall1Ans4->GetDouble(LDBIZ_PD_PRE_ENTRY_INTRST_AMT_FLOAT);
    v_pd_update_times = lpTSCall1Ans4->GetInt32(LDBIZ_PD_UPDATE_TIMES_INT);


    // set @资产账户状态# = 《资产账户状态-注销》;
    strcpy(v_asset_acco_status,"3");
    //调用过程[事务_产品_公共接口_更新资产账户状态]
    //组织事务请求
    if(lpTSCall1Ans5)
    {
      lpTSCall1Ans5->FreeMsg();
      lpTSCall1Ans5=NULL;
    }
    lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("prodT.6.44", 0);
    lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req5->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req5->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req5->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req5->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req5->SetString(LDBIZ_ASSET_ACCO_STATUS_STR,v_asset_acco_status);
    lpTSCall1Req5->SetString(LDBIZ_OPER_REMARK_INFO_STR,v_oper_remark_info);
    lpTSCall1Req5->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
    if(!lpTSCall1Ans5)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.44]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans5->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans5->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans5->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans5->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans5->GetString(LDBIZ_ERROR_INFO_STR));


    // set @股东代码状态# = 《股东代码状态-注销》;
    strcpy(v_stock_acco_status,"3");
    //联动，对资产账户下的所有股东代码注销。
    //调用过程[事务_产品证券_账户_更新证券账户股东状态]
    //组织事务请求
    if(lpTSCall1Ans6)
    {
      lpTSCall1Ans6->FreeMsg();
      lpTSCall1Ans6=NULL;
    }
    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.72", 0);
    lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req6->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req6->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req6->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req6->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req6->SetString(LDBIZ_STOCK_ACCO_STATUS_STR,v_stock_acco_status);
    lpTSCall1Req6->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
    if(!lpTSCall1Ans6)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.72]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans6->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans6->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans6->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans6->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans6->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans6->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans6->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans6->GetString(LDBIZ_ERROR_INFO_STR));


    // set @更新次数# = @产品更新次数#;
    v_update_times = v_pd_update_times;

    // [主动推送][prod.prodcapital][产品主推_产品资金_产品资金主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.190", 0);
    lpPubMsg->SetInt64(LDBIZ_PD_CASH_ID_INT64,v_pd_cash_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpPubMsg->SetDouble(LDBIZ_PD_FIRST_AMT_FLOAT,v_pd_first_amt);
    lpPubMsg->SetDouble(LDBIZ_PD_CURR_AMT_FLOAT,v_pd_curr_amt);
    lpPubMsg->SetDouble(LDBIZ_PD_DIST_AMT_FLOAT,v_pd_dist_amt);
    lpPubMsg->SetDouble(LDBIZ_PD_AUTH_AMT_FLOAT,v_pd_auth_amt);
    lpPubMsg->SetDouble(LDBIZ_PD_AMT_CHECK_DIFF_FLOAT,v_pd_amt_check_diff);
    lpPubMsg->SetDouble(LDBIZ_PD_PRE_SETTLE_AMT_FLOAT,v_pd_pre_settle_amt);
    lpPubMsg->SetDouble(LDBIZ_PD_TOTAL_CASH_DIVIDE_FLOAT,v_pd_total_cash_divide);
    lpPubMsg->SetDouble(LDBIZ_PD_TOTAL_PRE_FEE_FLOAT,v_pd_total_pre_fee);
    lpPubMsg->SetDouble(LDBIZ_PD_TOTAL_RECE_AMT_FLOAT,v_pd_total_rece_amt);
    lpPubMsg->SetDouble(LDBIZ_PD_TOTAL_PAYAB_AMT_FLOAT,v_pd_total_payab_amt);
    lpPubMsg->SetDouble(LDBIZ_PD_INTRST_CACL_AMT_FLOAT,v_pd_intrst_cacl_amt);
    lpPubMsg->SetDouble(LDBIZ_PD_PRE_ENTRY_INTRST_AMT_FLOAT,v_pd_pre_entry_intrst_amt);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("prod.prodcapital", lpPubMsg);

    //调用过程[事务_产品证券_账户_查询资产账户下所有交易组资金]
    //组织事务请求
    if(lpTSCall1Ans7)
    {
      lpTSCall1Ans7->FreeMsg();
      lpTSCall1Ans7=NULL;
    }
    lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.75", 0);
    lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req7->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req7->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req7->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req7->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
    if(!lpTSCall1Ans7)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.75]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans7->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans7->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans7->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans7->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans7->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans7->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans7->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans7->GetString(LDBIZ_ERROR_INFO_STR));


    // [获取结果集][lpMainMsg1]
    lpMainMsg1=lpTSCall1Ans7->GetGroup(LDTAG_NO_RESULTSET);


    // [遍历结果集开始][lpMainMsg1]
    iRecordCount = lpMainMsg1->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpMainMsg1->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            v_exgp_cash_id = lpRecord->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
            v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
            v_exgp_begin_amt = lpRecord->GetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT);
            v_exgp_curr_amt = lpRecord->GetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT);
            v_exgp_frozen_amt = lpRecord->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
            v_exgp_unfroz_amt = lpRecord->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
            v_exgp_pre_settle_amt = lpRecord->GetDouble(LDBIZ_EXGP_PRE_SETTLE_AMT_FLOAT);
            v_exgp_shsz_avail_change_amt = lpRecord->GetDouble(LDBIZ_EXGP_SHSZ_AVAIL_CHANGE_AMT_FLOAT);
            v_exgp_hk_avail_change_amt = lpRecord->GetDouble(LDBIZ_EXGP_HK_AVAIL_CHANGE_AMT_FLOAT);
            v_exgp_amt_check_diff = lpRecord->GetDouble(LDBIZ_EXGP_AMT_CHECK_DIFF_FLOAT);
            v_exgp_T_hk_buy_total_amt = lpRecord->GetDouble(LDBIZ_EXGP_T_HK_BUY_TOTAL_AMT_FLOAT);
            v_exgp_T_hk_sell_total_amt = lpRecord->GetDouble(LDBIZ_EXGP_T_HK_SELL_TOTAL_AMT_FLOAT);
            v_exgp_T1_hk_buy_total_amt = lpRecord->GetDouble(LDBIZ_EXGP_T1_HK_BUY_TOTAL_AMT_FLOAT);
            v_exgp_T1_hk_sell_total_amt = lpRecord->GetDouble(LDBIZ_EXGP_T1_HK_SELL_TOTAL_AMT_FLOAT);
            v_exch_group_total_rece_amt = lpRecord->GetDouble(LDBIZ_EXCH_GROUP_TOTAL_RECE_AMT_FLOAT);
            v_exch_group_total_payab_amt = lpRecord->GetDouble(LDBIZ_EXCH_GROUP_TOTAL_PAYAB_AMT_FLOAT);
            v_exgp_realize_pandl = lpRecord->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
            v_exch_group_intrst_rate = lpRecord->GetDouble(LDBIZ_EXCH_GROUP_INTRST_RATE_FLOAT);
            v_exch_group_intrst_base_amt = lpRecord->GetDouble(LDBIZ_EXCH_GROUP_INTRST_BASE_AMT_FLOAT);
            v_exch_group_pre_entry_intrst_amt = lpRecord->GetDouble(LDBIZ_EXCH_GROUP_PRE_ENTRY_INTRST_AMT_FLOAT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


         // [主动推送][secu.pdexgpcapital][证券主推_产品资金_交易组资金主推消息]
         lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.70", 0);
         lpPubMsg->SetInt64(LDBIZ_EXGP_CASH_ID_INT64,v_exgp_cash_id);
         lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
         lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
         lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
         lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
         lpPubMsg->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
         lpPubMsg->SetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT,v_exgp_begin_amt);
         lpPubMsg->SetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT,v_exgp_curr_amt);
         lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
         lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
         lpPubMsg->SetDouble(LDBIZ_EXGP_PRE_SETTLE_AMT_FLOAT,v_exgp_pre_settle_amt);
         lpPubMsg->SetDouble(LDBIZ_EXGP_SHSZ_AVAIL_CHANGE_AMT_FLOAT,v_exgp_shsz_avail_change_amt);
         lpPubMsg->SetDouble(LDBIZ_EXGP_HK_AVAIL_CHANGE_AMT_FLOAT,v_exgp_hk_avail_change_amt);
         lpPubMsg->SetDouble(LDBIZ_EXGP_AMT_CHECK_DIFF_FLOAT,v_exgp_amt_check_diff);
         lpPubMsg->SetDouble(LDBIZ_EXGP_T_HK_BUY_TOTAL_AMT_FLOAT,v_exgp_T_hk_buy_total_amt);
         lpPubMsg->SetDouble(LDBIZ_EXGP_T_HK_SELL_TOTAL_AMT_FLOAT,v_exgp_T_hk_sell_total_amt);
         lpPubMsg->SetDouble(LDBIZ_EXGP_T1_HK_BUY_TOTAL_AMT_FLOAT,v_exgp_T1_hk_buy_total_amt);
         lpPubMsg->SetDouble(LDBIZ_EXGP_T1_HK_SELL_TOTAL_AMT_FLOAT,v_exgp_T1_hk_sell_total_amt);
         lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_TOTAL_RECE_AMT_FLOAT,v_exch_group_total_rece_amt);
         lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_TOTAL_PAYAB_AMT_FLOAT,v_exch_group_total_payab_amt);
         lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
         lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_INTRST_RATE_FLOAT,v_exch_group_intrst_rate);
         lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_INTRST_BASE_AMT_FLOAT,v_exch_group_intrst_base_amt);
         lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_PRE_ENTRY_INTRST_AMT_FLOAT,v_exch_group_pre_entry_intrst_amt);
         lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
         glpPubSub_Interface->PubTopics("secu.pdexgpcapital", lpPubMsg);


    // [遍历结果集结束][lpMainMsg1]
        }
    }

    //调用过程[事务_产品证券_账户_查询资产账户下所有交易组持仓]
    //组织事务请求
    if(lpTSCall1Ans8)
    {
      lpTSCall1Ans8->FreeMsg();
      lpTSCall1Ans8=NULL;
    }
    lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.76", 0);
    lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req8->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req8->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req8->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
    if(!lpTSCall1Ans8)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.76]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans8->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans8->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans8->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans8->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans8->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans8->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans8->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans8->GetString(LDBIZ_ERROR_INFO_STR));


    // [获取结果集][lpMainMsg2]
    lpMainMsg2=lpTSCall1Ans8->GetGroup(LDTAG_NO_RESULTSET);


    // [遍历结果集开始][lpMainMsg2]
    iRecordCount = lpMainMsg2->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpMainMsg2->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            v_exgp_posi_id = lpRecord->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
            v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
            v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
            v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
            v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
            v_exch_group_stock_type = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT);
            v_exch_group_asset_type = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT);
            v_exgp_invest_type = lpRecord->GetInt32(LDBIZ_EXGP_INVEST_TYPE_INT);
            v_exch_group_begin_qty = lpRecord->GetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT);
            v_exgp_curr_qty = lpRecord->GetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT);
            v_exgp_pre_settle_qty = lpRecord->GetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT);
            v_exgp_frozen_qty = lpRecord->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
            v_exgp_unfroz_qty = lpRecord->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
            v_exgp_posi_qty_check_diff = lpRecord->GetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT);
            v_exgp_cost_amt = lpRecord->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
            v_exgp_realize_pandl = lpRecord->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
            v_exgp_intrst_cost_amt = lpRecord->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
            v_exgp_intrst_pandl = lpRecord->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


         // [主动推送][secu.pdexgpposi][证券主推_产品持仓_交易组持仓主推消息]
         lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.80", 0);
         lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
         lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
         lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
         lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
         lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
         lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
         lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
         lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
         lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT,v_exch_group_stock_type);
         lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT,v_exch_group_asset_type);
         lpPubMsg->SetInt32(LDBIZ_EXGP_INVEST_TYPE_INT,v_exgp_invest_type);
         lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT,v_exch_group_begin_qty);
         lpPubMsg->SetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT,v_exgp_curr_qty);
         lpPubMsg->SetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT,v_exgp_pre_settle_qty);
         lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
         lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
         lpPubMsg->SetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT,v_exgp_posi_qty_check_diff);
         lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
         lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
         lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
         lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
         lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
         glpPubSub_Interface->PubTopics("secu.pdexgpposi", lpPubMsg);


    // [遍历结果集结束][lpMainMsg2]
        }
    }


    // set @资产账户串# = concat(";",@资产账户编号#,";");
    snprintf(v_asset_acco_str,sizeof(v_asset_acco_str),"%s%d%s",";",v_asset_acco_no,";");
    //调用过程[事务_产品证券_公共接口_查询资产账户资金信息]
    //组织事务请求
    if(lpTSCall1Ans9)
    {
      lpTSCall1Ans9->FreeMsg();
      lpTSCall1Ans9=NULL;
    }
    lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("pdsecuT.4.111", 0);
    lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req9->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req9->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req9->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req9->SetString(LDBIZ_ASSET_ACCO_STR_STR,v_asset_acco_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
    if(!lpTSCall1Ans9)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.4.111]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans9->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans9->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans9->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans9->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans9->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans9->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans9->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans9->GetString(LDBIZ_ERROR_INFO_STR));


    // [获取结果集][lpMainMsg3]
    lpMainMsg3=lpTSCall1Ans9->GetGroup(LDTAG_NO_RESULTSET);


    // [遍历结果集开始][lpMainMsg3]
    iRecordCount = lpMainMsg3->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpMainMsg3->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            v_asac_cash_id = lpRecord->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
            v_asac_begin_amt = lpRecord->GetDouble(LDBIZ_ASAC_BEGIN_AMT_FLOAT);
            v_asac_curr_amt = lpRecord->GetDouble(LDBIZ_ASAC_CURR_AMT_FLOAT);
            v_asac_frozen_amt = lpRecord->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
            v_asac_unfroz_amt = lpRecord->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
            v_asac_pre_settle_amt = lpRecord->GetDouble(LDBIZ_ASAC_PRE_SETTLE_AMT_FLOAT);
            v_asac_shsz_avail_change_amt = lpRecord->GetDouble(LDBIZ_ASAC_SHSZ_AVAIL_CHANGE_AMT_FLOAT);
            v_asac_hk_avail_change_amt = lpRecord->GetDouble(LDBIZ_ASAC_HK_AVAIL_CHANGE_AMT_FLOAT);
            v_asac_amt_check_diff = lpRecord->GetDouble(LDBIZ_ASAC_AMT_CHECK_DIFF_FLOAT);
            v_asac_T_hk_buy_total_amt = lpRecord->GetDouble(LDBIZ_ASAC_T_HK_BUY_TOTAL_AMT_FLOAT);
            v_asac_T_hk_sell_total_amt = lpRecord->GetDouble(LDBIZ_ASAC_T_HK_SELL_TOTAL_AMT_FLOAT);
            v_asac_T1_hk_buy_total_amt = lpRecord->GetDouble(LDBIZ_ASAC_T1_HK_BUY_TOTAL_AMT_FLOAT);
            v_asac_T1_hk_sell_total_amt = lpRecord->GetDouble(LDBIZ_ASAC_T1_HK_SELL_TOTAL_AMT_FLOAT);
            v_asac_total_rece_amt = lpRecord->GetDouble(LDBIZ_ASAC_TOTAL_RECE_AMT_FLOAT);
            v_asac_total_payab_amt = lpRecord->GetDouble(LDBIZ_ASAC_TOTAL_PAYAB_AMT_FLOAT);
            v_asac_realize_pandl = lpRecord->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
            v_asac_intrst_rate = lpRecord->GetDouble(LDBIZ_ASAC_INTRST_RATE_FLOAT);
            v_asac_intrst_base_amt = lpRecord->GetDouble(LDBIZ_ASAC_INTRST_BASE_AMT_FLOAT);
            v_asac_pre_entry_intrst_amt = lpRecord->GetDouble(LDBIZ_ASAC_PRE_ENTRY_INTRST_AMT_FLOAT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


         // [主动推送][secu.pdasaccapital][证券主推_产品资金_资产账户资金主推消息]
         lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.71", 0);
         lpPubMsg->SetInt64(LDBIZ_ASAC_CASH_ID_INT64,v_asac_cash_id);
         lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
         lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
         lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
         lpPubMsg->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
         lpPubMsg->SetDouble(LDBIZ_ASAC_BEGIN_AMT_FLOAT,v_asac_begin_amt);
         lpPubMsg->SetDouble(LDBIZ_ASAC_CURR_AMT_FLOAT,v_asac_curr_amt);
         lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT,v_asac_frozen_amt);
         lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT,v_asac_unfroz_amt);
         lpPubMsg->SetDouble(LDBIZ_ASAC_PRE_SETTLE_AMT_FLOAT,v_asac_pre_settle_amt);
         lpPubMsg->SetDouble(LDBIZ_ASAC_SHSZ_AVAIL_CHANGE_AMT_FLOAT,v_asac_shsz_avail_change_amt);
         lpPubMsg->SetDouble(LDBIZ_ASAC_HK_AVAIL_CHANGE_AMT_FLOAT,v_asac_hk_avail_change_amt);
         lpPubMsg->SetDouble(LDBIZ_ASAC_AMT_CHECK_DIFF_FLOAT,v_asac_amt_check_diff);
         lpPubMsg->SetDouble(LDBIZ_ASAC_T_HK_BUY_TOTAL_AMT_FLOAT,v_asac_T_hk_buy_total_amt);
         lpPubMsg->SetDouble(LDBIZ_ASAC_T_HK_SELL_TOTAL_AMT_FLOAT,v_asac_T_hk_sell_total_amt);
         lpPubMsg->SetDouble(LDBIZ_ASAC_T1_HK_BUY_TOTAL_AMT_FLOAT,v_asac_T1_hk_buy_total_amt);
         lpPubMsg->SetDouble(LDBIZ_ASAC_T1_HK_SELL_TOTAL_AMT_FLOAT,v_asac_T1_hk_sell_total_amt);
         lpPubMsg->SetDouble(LDBIZ_ASAC_TOTAL_RECE_AMT_FLOAT,v_asac_total_rece_amt);
         lpPubMsg->SetDouble(LDBIZ_ASAC_TOTAL_PAYAB_AMT_FLOAT,v_asac_total_payab_amt);
         lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
         lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_RATE_FLOAT,v_asac_intrst_rate);
         lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_BASE_AMT_FLOAT,v_asac_intrst_base_amt);
         lpPubMsg->SetDouble(LDBIZ_ASAC_PRE_ENTRY_INTRST_AMT_FLOAT,v_asac_pre_entry_intrst_amt);
         lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
         glpPubSub_Interface->PubTopics("secu.pdasaccapital", lpPubMsg);


    // [遍历结果集结束][lpMainMsg3]
        }
    }

    //调用过程[事务_产品证券_公共接口_查询资产账户持仓信息]
    //组织事务请求
    if(lpTSCall1Ans10)
    {
      lpTSCall1Ans10->FreeMsg();
      lpTSCall1Ans10=NULL;
    }
    lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("pdsecuT.4.112", 0);
    lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req10->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req10->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req10->SetString(LDBIZ_ASSET_ACCO_STR_STR,v_asset_acco_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
    if(!lpTSCall1Ans10)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.4.112]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans10->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans10->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans10->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans10->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans10->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans10->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans10->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans10->GetString(LDBIZ_ERROR_INFO_STR));


    // [获取结果集][lpMainMsg4]
    lpMainMsg4=lpTSCall1Ans10->GetGroup(LDTAG_NO_RESULTSET);


    // [遍历结果集开始][lpMainMsg4]
    iRecordCount = lpMainMsg4->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpMainMsg4->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            v_asac_posi_id = lpRecord->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
            v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
            v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
            v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
            v_asac_stock_type = lpRecord->GetInt32(LDBIZ_ASAC_STOCK_TYPE_INT);
            v_asac_asset_type = lpRecord->GetInt32(LDBIZ_ASAC_ASSET_TYPE_INT);
            v_asac_invest_type = lpRecord->GetInt32(LDBIZ_ASAC_INVEST_TYPE_INT);
            v_asac_begin_qty = lpRecord->GetDouble(LDBIZ_ASAC_BEGIN_QTY_FLOAT);
            v_asac_curr_qty = lpRecord->GetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT);
            v_asac_pre_settle_qty = lpRecord->GetDouble(LDBIZ_ASAC_PRE_SETTLE_QTY_FLOAT);
            v_asac_frozen_qty = lpRecord->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
            v_asac_unfroz_qty = lpRecord->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
            v_asac_posi_qty_check_diff = lpRecord->GetDouble(LDBIZ_ASAC_POSI_QTY_CHECK_DIFF_FLOAT);
            v_asac_cost_amt = lpRecord->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
            v_asac_realize_pandl = lpRecord->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
            v_asac_intrst_cost_amt = lpRecord->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
            v_asac_intrst_pandl = lpRecord->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


         // [主动推送][secu.pdasacposi][证券主推_产品持仓_资产账户持仓主推消息]
         lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.81", 0);
         lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
         lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
         lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
         lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
         lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
         lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
         lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
         lpPubMsg->SetInt32(LDBIZ_ASAC_STOCK_TYPE_INT,v_asac_stock_type);
         lpPubMsg->SetInt32(LDBIZ_ASAC_ASSET_TYPE_INT,v_asac_asset_type);
         lpPubMsg->SetInt32(LDBIZ_ASAC_INVEST_TYPE_INT,v_asac_invest_type);
         lpPubMsg->SetDouble(LDBIZ_ASAC_BEGIN_QTY_FLOAT,v_asac_begin_qty);
         lpPubMsg->SetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT,v_asac_curr_qty);
         lpPubMsg->SetDouble(LDBIZ_ASAC_PRE_SETTLE_QTY_FLOAT,v_asac_pre_settle_qty);
         lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
         lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
         lpPubMsg->SetDouble(LDBIZ_ASAC_POSI_QTY_CHECK_DIFF_FLOAT,v_asac_posi_qty_check_diff);
         lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
         lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
         lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
         lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
         lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
         glpPubSub_Interface->PubTopics("secu.pdasacposi", lpPubMsg);


    // [遍历结果集结束][lpMainMsg4]
        }
    }

    //调用过程[事务_产品证券_账户_查询资产账户下所有大宗交易持仓]
    //组织事务请求
    if(lpTSCall1Ans11)
    {
      lpTSCall1Ans11->FreeMsg();
      lpTSCall1Ans11=NULL;
    }
    lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.77", 0);
    lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req11->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req11->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req11->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
    if(!lpTSCall1Ans11)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.77]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans11->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans11->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans11->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans11->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans11->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans11->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans11->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans11->GetString(LDBIZ_ERROR_INFO_STR));


    // [获取结果集][lpMainMsg5]
    lpMainMsg5=lpTSCall1Ans11->GetGroup(LDTAG_NO_RESULTSET);


    // [遍历结果集开始][lpMainMsg5]
    iRecordCount = lpMainMsg5->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpMainMsg5->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            v_posi_id = lpRecord->GetInt64(LDBIZ_POSI_ID_INT64);
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
            v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
            v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
            v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
            v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
            v_strike_qty = lpRecord->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
            v_strike_price = lpRecord->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
            v_fair_price = lpRecord->GetDouble(LDBIZ_FAIR_PRICE_FLOAT);
            v_strike_date = lpRecord->GetInt32(LDBIZ_STRIKE_DATE_INT);
            v_release_date = lpRecord->GetInt32(LDBIZ_RELEASE_DATE_INT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


         // [主动推送][secu.pdblocktradeposi][证券主推_产品持仓_大宗交易持仓主推消息]
         lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.83", 0);
         lpPubMsg->SetInt64(LDBIZ_POSI_ID_INT64,v_posi_id);
         lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
         lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
         lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
         lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
         lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
         lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
         lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
         lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
         lpPubMsg->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
         lpPubMsg->SetDouble(LDBIZ_FAIR_PRICE_FLOAT,v_fair_price);
         lpPubMsg->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
         lpPubMsg->SetInt32(LDBIZ_RELEASE_DATE_INT,v_release_date);
         lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
         glpPubSub_Interface->PubTopics("secu.pdblocktradeposi", lpPubMsg);


    // [遍历结果集结束][lpMainMsg5]
        }
    }


END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans12)
        {
          lpTSCall1Ans12->FreeMsg();
          lpTSCall1Ans12=NULL;
        }
        lpTSCall1Req12=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req12->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req12->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req12->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req12->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req12->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req12->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req12->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req12->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req12->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req12->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req12, &lpTSCall1Ans12, 5000);
        if (lpTSCall1Ans12)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans12->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans12->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans12->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans12->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans12->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    if(lpTSCall1Ans3)
        lpTSCall1Ans3->FreeMsg();
    if(lpTSCall1Ans4)
        lpTSCall1Ans4->FreeMsg();
    if(lpTSCall1Ans5)
        lpTSCall1Ans5->FreeMsg();
    if(lpTSCall1Ans6)
        lpTSCall1Ans6->FreeMsg();
    if(lpTSCall1Ans7)
        lpTSCall1Ans7->FreeMsg();
    if(lpTSCall1Ans8)
        lpTSCall1Ans8->FreeMsg();
    if(lpTSCall1Ans9)
        lpTSCall1Ans9->FreeMsg();
    if(lpTSCall1Ans10)
        lpTSCall1Ans10->FreeMsg();
    if(lpTSCall1Ans11)
        lpTSCall1Ans11->FreeMsg();
    if(lpTSCall1Ans12)
        lpTSCall1Ans12->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_新增证券账户自动逆回购配置
int LD_CALL_MODE fnFunc20(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_code_no;
    int v_target_opor_no;
    int v_begin_time;
    double v_avail_cash;
    double v_intrst_ratio;
    int v_mul_acco_trd_qty;
    int v_exec_price_type;
    char v_task_status[3];
    int v_order_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_asset_acco_status[3];
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_code_no=0;
    v_target_opor_no=0;
    v_begin_time=0;
    v_avail_cash=0;
    v_intrst_ratio=0;
    v_mul_acco_trd_qty=0;
    v_exec_price_type=0;
    strcpy(v_task_status, "0");
    v_order_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_asset_acco_status, "0");
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_target_opor_no = lpInBizMsg->GetInt32(LDBIZ_TARGET_OPOR_NO_INT);
    v_begin_time = lpInBizMsg->GetInt32(LDBIZ_BEGIN_TIME_INT);
    v_avail_cash = lpInBizMsg->GetDouble(LDBIZ_AVAIL_CASH_FLOAT);
    v_intrst_ratio = lpInBizMsg->GetDouble(LDBIZ_INTRST_RATIO_FLOAT);
    v_mul_acco_trd_qty = lpInBizMsg->GetInt32(LDBIZ_MUL_ACCO_TRD_QTY_INT);
    v_exec_price_type = lpInBizMsg->GetInt32(LDBIZ_EXEC_PRICE_TYPE_INT);
    strncpy(v_task_status, lpInBizMsg->GetString(LDBIZ_TASK_STATUS_STR),2);
    v_task_status[2] = '\0';
    v_order_no = lpInBizMsg->GetInt32(LDBIZ_ORDER_NO_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;
    IFastMessage* lpTSCall1Req3 = NULL;
    IFastMessage* lpTSCall1Ans3 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));


    // set @资产账户状态# = 0;
    strcpy(v_asset_acco_status,"0");
    //调用过程[事务_产品_公共接口_检查资产账户状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.6.2", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_ACCO_STATUS_STR,v_asset_acco_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.2]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);


    // [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#]
    if (v_co_no != v_opor_co_no)
    {
        strcpy(v_error_code, "pdsecuL.1.73.50");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","机构编号=",v_co_no,"产品编号=",v_pd_no);
        iRet = -1;
        goto END;
    }

    //调用过程[事务_产品证券_账户_新增证券账户自动逆回购配置]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.82", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req2->SetInt32(LDBIZ_TARGET_OPOR_NO_INT,v_target_opor_no);
    lpTSCall1Req2->SetInt32(LDBIZ_BEGIN_TIME_INT,v_begin_time);
    lpTSCall1Req2->SetDouble(LDBIZ_AVAIL_CASH_FLOAT,v_avail_cash);
    lpTSCall1Req2->SetDouble(LDBIZ_INTRST_RATIO_FLOAT,v_intrst_ratio);
    lpTSCall1Req2->SetInt32(LDBIZ_MUL_ACCO_TRD_QTY_INT,v_mul_acco_trd_qty);
    lpTSCall1Req2->SetInt32(LDBIZ_EXEC_PRICE_TYPE_INT,v_exec_price_type);
    lpTSCall1Req2->SetString(LDBIZ_TASK_STATUS_STR,v_task_status);
    lpTSCall1Req2->SetInt32(LDBIZ_ORDER_NO_INT,v_order_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.82]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans2->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));


END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans3)
        {
          lpTSCall1Ans3->FreeMsg();
          lpTSCall1Ans3=NULL;
        }
        lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req3->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req3->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
        if (lpTSCall1Ans3)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans3->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans3->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans3->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    if(lpTSCall1Ans3)
        lpTSCall1Ans3->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_修改证券账户自动逆回购配置
int LD_CALL_MODE fnFunc21(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_code_no;
    int v_target_opor_no;
    int v_begin_time;
    double v_avail_cash;
    double v_intrst_ratio;
    int v_mul_acco_trd_qty;
    int v_exec_price_type;
    char v_task_status[3];
    int v_order_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_asset_acco_status[3];
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_code_no=0;
    v_target_opor_no=0;
    v_begin_time=0;
    v_avail_cash=0;
    v_intrst_ratio=0;
    v_mul_acco_trd_qty=0;
    v_exec_price_type=0;
    strcpy(v_task_status, "0");
    v_order_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_asset_acco_status, "0");
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_target_opor_no = lpInBizMsg->GetInt32(LDBIZ_TARGET_OPOR_NO_INT);
    v_begin_time = lpInBizMsg->GetInt32(LDBIZ_BEGIN_TIME_INT);
    v_avail_cash = lpInBizMsg->GetDouble(LDBIZ_AVAIL_CASH_FLOAT);
    v_intrst_ratio = lpInBizMsg->GetDouble(LDBIZ_INTRST_RATIO_FLOAT);
    v_mul_acco_trd_qty = lpInBizMsg->GetInt32(LDBIZ_MUL_ACCO_TRD_QTY_INT);
    v_exec_price_type = lpInBizMsg->GetInt32(LDBIZ_EXEC_PRICE_TYPE_INT);
    strncpy(v_task_status, lpInBizMsg->GetString(LDBIZ_TASK_STATUS_STR),2);
    v_task_status[2] = '\0';
    v_order_no = lpInBizMsg->GetInt32(LDBIZ_ORDER_NO_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;
    IFastMessage* lpTSCall1Req3 = NULL;
    IFastMessage* lpTSCall1Ans3 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));


    // set @资产账户状态# = 0;
    strcpy(v_asset_acco_status,"0");
    //调用过程[事务_产品_公共接口_检查资产账户状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.6.2", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_ACCO_STATUS_STR,v_asset_acco_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.2]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);


    // [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#]
    if (v_co_no != v_opor_co_no)
    {
        strcpy(v_error_code, "pdsecuL.1.74.50");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","机构编号=",v_co_no,"产品编号=",v_pd_no);
        iRet = -1;
        goto END;
    }

    //调用过程[事务_产品证券_账户_修改证券账户自动逆回购配置]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.83", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req2->SetInt32(LDBIZ_TARGET_OPOR_NO_INT,v_target_opor_no);
    lpTSCall1Req2->SetInt32(LDBIZ_BEGIN_TIME_INT,v_begin_time);
    lpTSCall1Req2->SetDouble(LDBIZ_AVAIL_CASH_FLOAT,v_avail_cash);
    lpTSCall1Req2->SetDouble(LDBIZ_INTRST_RATIO_FLOAT,v_intrst_ratio);
    lpTSCall1Req2->SetInt32(LDBIZ_MUL_ACCO_TRD_QTY_INT,v_mul_acco_trd_qty);
    lpTSCall1Req2->SetInt32(LDBIZ_EXEC_PRICE_TYPE_INT,v_exec_price_type);
    lpTSCall1Req2->SetString(LDBIZ_TASK_STATUS_STR,v_task_status);
    lpTSCall1Req2->SetInt32(LDBIZ_ORDER_NO_INT,v_order_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.83]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans2->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));


END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans3)
        {
          lpTSCall1Ans3->FreeMsg();
          lpTSCall1Ans3=NULL;
        }
        lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req3->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req3->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
        if (lpTSCall1Ans3)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans3->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans3->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans3->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    if(lpTSCall1Ans3)
        lpTSCall1Ans3->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_删除证券账户自动逆回购配置
int LD_CALL_MODE fnFunc22(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_code_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_code_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));


    // [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#]
    if (v_co_no != v_opor_co_no)
    {
        strcpy(v_error_code, "pdsecuL.1.75.50");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","机构编号=",v_co_no,"产品编号=",v_pd_no);
        iRet = -1;
        goto END;
    }

    //调用过程[事务_产品证券_账户_删除证券账户自动逆回购配置]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.84", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.84]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));


END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if (lpTSCall1Ans2)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans2->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans2->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans2->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_查询证券账户自动逆回购配置
int LD_CALL_MODE fnFunc23(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_code_no;
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_begin_time;
    double v_avail_cash;
    double v_intrst_ratio;
    int v_mul_acco_trd_qty;
    int v_exec_price_type;
    char v_task_status[3];
    int v_order_no;
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_log_error_code[33];
    char v_log_error_info[256];


int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_code_no=0;
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_begin_time=0;
    v_avail_cash=0;
    v_intrst_ratio=0;
    v_mul_acco_trd_qty=0;
    v_exec_price_type=0;
    strcpy(v_task_status, "0");
    v_order_no=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));

    //调用过程[事务_产品证券_账户_查询证券账户自动逆回购配置]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.85", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.85]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));


    lpOutBizMsg->FillWithAnotherMsg(lpTSCall1Ans1);
END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req2->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if (lpTSCall1Ans2)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans2->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans2->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans2->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    return iRet;
}

//逻辑_产品证券_账户_修改默认交易组转移资金持仓
int LD_CALL_MODE fnFunc24(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{
    int iRet=0;
    //先声明内部变量，包括输入参数，调用的过程的输出参数，以供内部各过程使用
    int v_opor_co_no;
    int v_opor_no;
    char v_opor_pwd[65];
    char v_oper_mac[33];
    char v_oper_ip_addr[33];
    char v_oper_info[1025];
    char v_oper_way[3];
    int v_menu_no;
    char v_func_code[17];
    int v_asset_acco_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_is_transfer_capital_posi;
    char v_oper_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_co_no;
    int v_tmp_co_no;
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_tmp_exch_group_no;
    int v_default_exch_group_no;
    int v_record_count;
    int64 v_posi_id;
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    double v_strike_qty;
    double v_strike_price;
    double v_fair_price;
    int v_strike_date;
    int v_release_date;
    int v_update_times;
    char v_crncy_type[4];
    int64 v_exgp_cash_id;
    double v_exgp_begin_amt;
    double v_exgp_curr_amt;
    double v_exgp_frozen_amt;
    double v_exgp_unfroz_amt;
    double v_exgp_pre_settle_amt;
    double v_exgp_shsz_avail_change_amt;
    double v_exgp_hk_avail_change_amt;
    double v_exgp_amt_check_diff;
    double v_exgp_T_hk_buy_total_amt;
    double v_exgp_T_hk_sell_total_amt;
    double v_exgp_T1_hk_buy_total_amt;
    double v_exgp_T1_hk_sell_total_amt;
    double v_exch_group_total_rece_amt;
    double v_exch_group_total_payab_amt;
    double v_exgp_realize_pandl;
    double v_exch_group_intrst_rate;
    double v_exch_group_intrst_base_amt;
    double v_exch_group_pre_entry_intrst_amt;
    int64 v_exgp_posi_id;
    int v_exch_group_stock_type;
    int v_exch_group_asset_type;
    int v_exgp_invest_type;
    double v_exch_group_begin_qty;
    double v_exgp_curr_qty;
    double v_exgp_pre_settle_qty;
    double v_exgp_frozen_qty;
    double v_exgp_unfroz_qty;
    double v_exgp_posi_qty_check_diff;
    double v_exgp_cost_amt;
    double v_exgp_intrst_cost_amt;
    double v_exgp_intrst_pandl;
    char v_log_error_code[33];
    char v_log_error_info[256];

    IGroup* lpMainMsg1=NULL;
    int iRecordCount = 0;
    IGroup* lpMainMsg2=NULL;
    IGroup* lpMainMsg3=NULL;
    IGroup* lpMainMsg4=NULL;
    IGroup* lpMainMsg5=NULL;
    IGroup* lpMainMsg6=NULL;

IFastMessage* lpPubMsg = NULL;
int iPriority=lpInBizMsg->GetInt32(LDTAG_PRIORITY);

    //初始化内部变量值
    v_opor_co_no=0;
    v_opor_no=0;
    strcpy(v_opor_pwd, " ");
    strcpy(v_oper_mac, " ");
    strcpy(v_oper_ip_addr, " ");
    strcpy(v_oper_info, " ");
    strcpy(v_oper_way, "0");
    v_menu_no=0;
    strcpy(v_func_code, " ");
    v_asset_acco_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_is_transfer_capital_posi=0;
    strcpy(v_oper_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_co_no=0;
    v_tmp_co_no=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_tmp_exch_group_no=0;
    v_default_exch_group_no=0;
    v_record_count=0;
    v_posi_id=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_strike_qty=0;
    v_strike_price=0;
    v_fair_price=0;
    v_strike_date=0;
    v_release_date=0;
    v_update_times=1;
    strcpy(v_crncy_type, "CNY");
    v_exgp_cash_id=0;
    v_exgp_begin_amt=0;
    v_exgp_curr_amt=0;
    v_exgp_frozen_amt=0;
    v_exgp_unfroz_amt=0;
    v_exgp_pre_settle_amt=0;
    v_exgp_shsz_avail_change_amt=0;
    v_exgp_hk_avail_change_amt=0;
    v_exgp_amt_check_diff=0;
    v_exgp_T_hk_buy_total_amt=0;
    v_exgp_T_hk_sell_total_amt=0;
    v_exgp_T1_hk_buy_total_amt=0;
    v_exgp_T1_hk_sell_total_amt=0;
    v_exch_group_total_rece_amt=0;
    v_exch_group_total_payab_amt=0;
    v_exgp_realize_pandl=0;
    v_exch_group_intrst_rate=0;
    v_exch_group_intrst_base_amt=0;
    v_exch_group_pre_entry_intrst_amt=0;
    v_exgp_posi_id=0;
    v_exch_group_stock_type=0;
    v_exch_group_asset_type=0;
    v_exgp_invest_type=0;
    v_exch_group_begin_qty=0;
    v_exgp_curr_qty=0;
    v_exgp_pre_settle_qty=0;
    v_exgp_frozen_qty=0;
    v_exgp_unfroz_qty=0;
    v_exgp_posi_qty_check_diff=0;
    v_exgp_cost_amt=0;
    v_exgp_intrst_cost_amt=0;
    v_exgp_intrst_pandl=0;
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

    //获取输入参数值
    v_opor_co_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_CO_NO_INT);
    v_opor_no = lpInBizMsg->GetInt32(LDBIZ_OPOR_NO_INT);
    strncpy(v_opor_pwd, lpInBizMsg->GetString(LDBIZ_OPOR_PWD_STR),64);
    v_opor_pwd[64] = '\0';
    strncpy(v_oper_mac, lpInBizMsg->GetString(LDBIZ_OPER_MAC_STR),32);
    v_oper_mac[32] = '\0';
    strncpy(v_oper_ip_addr, lpInBizMsg->GetString(LDBIZ_OPER_IP_ADDR_STR),32);
    v_oper_ip_addr[32] = '\0';
    strncpy(v_oper_info, lpInBizMsg->GetString(LDBIZ_OPER_INFO_STR),1024);
    v_oper_info[1024] = '\0';
    strncpy(v_oper_way, lpInBizMsg->GetString(LDBIZ_OPER_WAY_STR),2);
    v_oper_way[2] = '\0';
    v_menu_no = lpInBizMsg->GetInt32(LDBIZ_MENU_NO_INT);
    strncpy(v_func_code, lpInBizMsg->GetString(LDBIZ_FUNC_CODE_STR),16);
    v_func_code[16] = '\0';
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_is_transfer_capital_posi = lpInBizMsg->GetInt32(LDBIZ_IS_TRANSFER_CAPITAL_POSI_INT);
    strncpy(v_oper_remark_info, lpInBizMsg->GetString(LDBIZ_OPER_REMARK_INFO_STR),255);
    v_oper_remark_info[255] = '\0';

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;
    IFastMessage* lpTSCall1Req3 = NULL;
    IFastMessage* lpTSCall1Ans3 = NULL;
    IFastMessage* lpTSCall1Req4 = NULL;
    IFastMessage* lpTSCall1Ans4 = NULL;
    IFastMessage* lpTSCall1Req5 = NULL;
    IFastMessage* lpTSCall1Ans5 = NULL;
    IFastMessage* lpTSCall1Req6 = NULL;
    IFastMessage* lpTSCall1Ans6 = NULL;
    IFastMessage* lpTSCall1Req7 = NULL;
    IFastMessage* lpTSCall1Ans7 = NULL;
    IFastMessage* lpTSCall1Req8 = NULL;
    IFastMessage* lpTSCall1Ans8 = NULL;
    IFastMessage* lpTSCall1Req9 = NULL;
    IFastMessage* lpTSCall1Ans9 = NULL;
    IFastMessage* lpTSCall1Req10 = NULL;
    IFastMessage* lpTSCall1Ans10 = NULL;
    IFastMessage* lpTSCall1Req11 = NULL;
    IFastMessage* lpTSCall1Ans11 = NULL;


    // set @机构编号# = @操作员机构编号#;
    v_co_no = v_opor_co_no;

    // set @临时_机构编号# = @交易组编号# / 10000;
    v_tmp_co_no = v_exch_group_no / 10000;

    // [检查报错返回][@临时_机构编号# <> @操作员机构编号#][50][@交易组编号#]
    if (v_tmp_co_no != v_opor_co_no)
    {
        strcpy(v_error_code, "pdsecuL.1.77.50");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d","交易组编号=",v_exch_group_no);
        iRet = -1;
        goto END;
    }

    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans0->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans0->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans0->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans0->GetString(LDBIZ_ERROR_INFO_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));


    // set @临时_交易组编号# = @交易组编号#;
    v_tmp_exch_group_no = v_exch_group_no;
    //调用过程[事务_产品_公共接口_获取资产账户默认交易组编号不报错]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.6.58", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.58]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans1->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans1->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
    v_default_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_DEFAULT_EXCH_GROUP_NO_INT);


    // if (@是否转移资金持仓#=1 and @默认交易组编号# <>0) then
    if ((v_is_transfer_capital_posi==1 && v_default_exch_group_no !=0))
    {
       //先判断该交易组是否有待交收金额、待交收数量以及是否还有正逆回购,记录个数为0表示允许转移该交易组,否则不允许

       // set @交易组编号# = @默认交易组编号#;
       v_exch_group_no = v_default_exch_group_no;
       //调用过程[事务_产品证券_公共接口_判断交易组在途业务]
       //组织事务请求
       if(lpTSCall1Ans2)
       {
         lpTSCall1Ans2->FreeMsg();
         lpTSCall1Ans2=NULL;
       }
       lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.4.120", 0);
       lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
       lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
       lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
       lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
       lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
       lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
       lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
       lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
       lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
       lpTSCall1Req2->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
       lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
       lpTSCall1Req2->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
       glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
       if(!lpTSCall1Ans2)  //  超时错误
       {
           lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
           lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.4.120]subcall timed out!");
           iRet=-2;
           goto ENDSYS;
       }
       else if(lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
       {
           lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans2->GetInt32(LDTAG_ERRORNO));
           lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans2->GetString(LDTAG_ERRORINFO));
           iRet=-2;
           goto ENDSYS;
       }
       else if(strcmp(lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
       {
           strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
           strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
           iRet=-1;
           goto END;
       }
       //获取输出参数值
       strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
       strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
       v_record_count = lpTSCall1Ans2->GetInt32(LDBIZ_RECORD_COUNT_INT);


       // [检查报错返回][@记录个数#>0][90][@默认交易组编号#]
       if (v_record_count>0)
       {
           strcpy(v_error_code, "pdsecuL.1.77.90");
           snprintf(v_error_info, sizeof(v_error_info), "%s%d","默认交易组编号=",v_default_exch_group_no);
           iRet = -1;
           goto END;
       }


       // set @交易组编号# = @临时_交易组编号#;
       v_exch_group_no = v_tmp_exch_group_no;
       //判断是否将资金持仓转移至新默认交易组
    // end if;
    }

    //判断完没有在途业务再修改默认交易组。
    //调用过程[事务_产品_公共接口_设置资产账户默认交易组关系]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("prodT.6.57", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req3->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req3->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.57]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans3->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans3->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans3->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));


    // if (@是否转移资金持仓#=1 and @默认交易组编号# <>0) then
    if ((v_is_transfer_capital_posi==1 && v_default_exch_group_no !=0))
    {
      //资金转移,持仓转移
      //调用过程[事务_产品证券_公共接口_转移交易组资金持仓]
      //组织事务请求
      if(lpTSCall1Ans4)
      {
        lpTSCall1Ans4->FreeMsg();
        lpTSCall1Ans4=NULL;
      }
      lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pdsecuT.4.121", 0);
      lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
      lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
      lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
      lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
      lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
      lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
      lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
      lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
      lpTSCall1Req4->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
      lpTSCall1Req4->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpTSCall1Req4->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpTSCall1Req4->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpTSCall1Req4->SetInt32(LDBIZ_DEFAULT_EXCH_GROUP_NO_INT,v_default_exch_group_no);
      lpTSCall1Req4->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
      lpTSCall1Req4->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
      glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
      if(!lpTSCall1Ans4)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.4.121]subcall timed out!");
          iRet=-2;
          goto ENDSYS;
      }
      else if(lpTSCall1Ans4->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans4->GetInt32(LDTAG_ERRORNO));
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans4->GetString(LDTAG_ERRORINFO));
          iRet=-2;
          goto ENDSYS;
      }
      else if(strcmp(lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
      {
          strcpy(v_error_code, lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR));
          strcpy(v_error_info, lpTSCall1Ans4->GetString(LDBIZ_ERROR_INFO_STR));
          iRet=-1;
          goto END;
      }
      //获取输出参数值
      strcpy(v_error_code, lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR));
      strcpy(v_error_info, lpTSCall1Ans4->GetString(LDBIZ_ERROR_INFO_STR));

    // end if;
    }


    // if (@是否转移资金持仓#=1 and @默认交易组编号# <>0) then
    if ((v_is_transfer_capital_posi==1 && v_default_exch_group_no !=0))
    {
        //调用过程[事务_产品证券_公共接口_查询交易组大宗持仓]
        //组织事务请求
        if(lpTSCall1Ans5)
        {
          lpTSCall1Ans5->FreeMsg();
          lpTSCall1Ans5=NULL;
        }
        lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pdsecuT.4.113", 0);
        lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req5->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req5->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpTSCall1Req5->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
        if(!lpTSCall1Ans5)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.4.113]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans5->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans5->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans5->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans5->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans5->GetString(LDBIZ_ERROR_INFO_STR));


        // [获取结果集][lpMainMsg1]
        lpMainMsg1=lpTSCall1Ans5->GetGroup(LDTAG_NO_RESULTSET);


        // [遍历结果集开始][lpMainMsg1]
        iRecordCount = lpMainMsg1->GetRecordCount();
        for (int i = 0; i < iRecordCount;i++) 
        {
            IRecord* lpRecord =lpMainMsg1->GetRecord(i);
            if(lpRecord)
            {

                //获取记录字段值
                v_posi_id = lpRecord->GetInt64(LDBIZ_POSI_ID_INT64);
                v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
                v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
                v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
                v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
                v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
                v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
                v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
                v_strike_qty = lpRecord->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
                v_strike_price = lpRecord->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
                v_fair_price = lpRecord->GetDouble(LDBIZ_FAIR_PRICE_FLOAT);
                v_strike_date = lpRecord->GetInt32(LDBIZ_STRIKE_DATE_INT);
                v_release_date = lpRecord->GetInt32(LDBIZ_RELEASE_DATE_INT);
                v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


             // [主动推送][secu.pdblocktradeposi][证券主推_产品持仓_大宗交易持仓主推消息]
             lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.83", 0);
             lpPubMsg->SetInt64(LDBIZ_POSI_ID_INT64,v_posi_id);
             lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
             lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
             lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
             lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
             lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
             lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
             lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
             lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
             lpPubMsg->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
             lpPubMsg->SetDouble(LDBIZ_FAIR_PRICE_FLOAT,v_fair_price);
             lpPubMsg->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
             lpPubMsg->SetInt32(LDBIZ_RELEASE_DATE_INT,v_release_date);
             lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
             glpPubSub_Interface->PubTopics("secu.pdblocktradeposi", lpPubMsg);


        // [遍历结果集结束][lpMainMsg1]
            }
        }


        // set @交易组编号# = @默认交易组编号#;
        v_exch_group_no = v_default_exch_group_no;
        //调用过程[事务_产品证券_公共接口_查询交易组大宗持仓]
        //组织事务请求
        if(lpTSCall1Ans6)
        {
          lpTSCall1Ans6->FreeMsg();
          lpTSCall1Ans6=NULL;
        }
        lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("pdsecuT.4.113", 0);
        lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req6->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req6->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpTSCall1Req6->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
        if(!lpTSCall1Ans6)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.4.113]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans6->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans6->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans6->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans6->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans6->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans6->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans6->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans6->GetString(LDBIZ_ERROR_INFO_STR));


        // [获取结果集][lpMainMsg2]
        lpMainMsg2=lpTSCall1Ans6->GetGroup(LDTAG_NO_RESULTSET);


        // [遍历结果集开始][lpMainMsg2]
        iRecordCount = lpMainMsg2->GetRecordCount();
        for (int i = 0; i < iRecordCount;i++) 
        {
            IRecord* lpRecord =lpMainMsg2->GetRecord(i);
            if(lpRecord)
            {

                //获取记录字段值
                v_posi_id = lpRecord->GetInt64(LDBIZ_POSI_ID_INT64);
                v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
                v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
                v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
                v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
                v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
                v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
                v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
                v_strike_qty = lpRecord->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
                v_strike_price = lpRecord->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
                v_fair_price = lpRecord->GetDouble(LDBIZ_FAIR_PRICE_FLOAT);
                v_strike_date = lpRecord->GetInt32(LDBIZ_STRIKE_DATE_INT);
                v_release_date = lpRecord->GetInt32(LDBIZ_RELEASE_DATE_INT);
                v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


             // [主动推送][secu.pdblocktradeposi][证券主推_产品持仓_大宗交易持仓主推消息]
             lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.83", 0);
             lpPubMsg->SetInt64(LDBIZ_POSI_ID_INT64,v_posi_id);
             lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
             lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
             lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
             lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
             lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
             lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
             lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
             lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
             lpPubMsg->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
             lpPubMsg->SetDouble(LDBIZ_FAIR_PRICE_FLOAT,v_fair_price);
             lpPubMsg->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
             lpPubMsg->SetInt32(LDBIZ_RELEASE_DATE_INT,v_release_date);
             lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
             glpPubSub_Interface->PubTopics("secu.pdblocktradeposi", lpPubMsg);


        // [遍历结果集结束][lpMainMsg2]
            }
        }

    //交易组资金主推、交易组持仓主推。

         // set @本币币种# = "CNY";
         strcpy(v_crncy_type,"CNY");
         //交易组转移涉及到的资帐资金。

         // set @交易组编号# = @临时_交易组编号#;
         v_exch_group_no = v_tmp_exch_group_no;
         //调用过程[事务_产品证券_公共接口_查询交易组资金信息]
         //组织事务请求
         if(lpTSCall1Ans7)
         {
           lpTSCall1Ans7->FreeMsg();
           lpTSCall1Ans7=NULL;
         }
         lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("pdsecuT.4.109", 0);
         lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
         lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
         lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
         lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
         lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
         lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
         lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
         lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
         lpTSCall1Req7->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
         lpTSCall1Req7->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
         lpTSCall1Req7->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
         lpTSCall1Req7->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
         glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
         if(!lpTSCall1Ans7)  //  超时错误
         {
             lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
             lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.4.109]subcall timed out!");
             iRet=-2;
             goto ENDSYS;
         }
         else if(lpTSCall1Ans7->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
         {
             lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans7->GetInt32(LDTAG_ERRORNO));
             lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans7->GetString(LDTAG_ERRORINFO));
             iRet=-2;
             goto ENDSYS;
         }
         else if(strcmp(lpTSCall1Ans7->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
         {
             strcpy(v_error_code, lpTSCall1Ans7->GetString(LDBIZ_ERROR_CODE_STR));
             strcpy(v_error_info, lpTSCall1Ans7->GetString(LDBIZ_ERROR_INFO_STR));
             iRet=-1;
             goto END;
         }
         //获取输出参数值
         strcpy(v_error_code, lpTSCall1Ans7->GetString(LDBIZ_ERROR_CODE_STR));
         strcpy(v_error_info, lpTSCall1Ans7->GetString(LDBIZ_ERROR_INFO_STR));


         // [获取结果集][lpMainMsg3]
         lpMainMsg3=lpTSCall1Ans7->GetGroup(LDTAG_NO_RESULTSET);


         // [遍历结果集开始][lpMainMsg3]
         iRecordCount = lpMainMsg3->GetRecordCount();
         for (int i = 0; i < iRecordCount;i++) 
         {
             IRecord* lpRecord =lpMainMsg3->GetRecord(i);
             if(lpRecord)
             {

                 //获取记录字段值
                 v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
                 v_exgp_cash_id = lpRecord->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
                 v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
                 v_exgp_begin_amt = lpRecord->GetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT);
                 v_exgp_curr_amt = lpRecord->GetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT);
                 v_exgp_frozen_amt = lpRecord->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
                 v_exgp_unfroz_amt = lpRecord->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
                 v_exgp_pre_settle_amt = lpRecord->GetDouble(LDBIZ_EXGP_PRE_SETTLE_AMT_FLOAT);
                 v_exgp_shsz_avail_change_amt = lpRecord->GetDouble(LDBIZ_EXGP_SHSZ_AVAIL_CHANGE_AMT_FLOAT);
                 v_exgp_hk_avail_change_amt = lpRecord->GetDouble(LDBIZ_EXGP_HK_AVAIL_CHANGE_AMT_FLOAT);
                 v_exgp_amt_check_diff = lpRecord->GetDouble(LDBIZ_EXGP_AMT_CHECK_DIFF_FLOAT);
                 v_exgp_T_hk_buy_total_amt = lpRecord->GetDouble(LDBIZ_EXGP_T_HK_BUY_TOTAL_AMT_FLOAT);
                 v_exgp_T_hk_sell_total_amt = lpRecord->GetDouble(LDBIZ_EXGP_T_HK_SELL_TOTAL_AMT_FLOAT);
                 v_exgp_T1_hk_buy_total_amt = lpRecord->GetDouble(LDBIZ_EXGP_T1_HK_BUY_TOTAL_AMT_FLOAT);
                 v_exgp_T1_hk_sell_total_amt = lpRecord->GetDouble(LDBIZ_EXGP_T1_HK_SELL_TOTAL_AMT_FLOAT);
                 v_exch_group_total_rece_amt = lpRecord->GetDouble(LDBIZ_EXCH_GROUP_TOTAL_RECE_AMT_FLOAT);
                 v_exch_group_total_payab_amt = lpRecord->GetDouble(LDBIZ_EXCH_GROUP_TOTAL_PAYAB_AMT_FLOAT);
                 v_exgp_realize_pandl = lpRecord->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
                 v_exch_group_intrst_rate = lpRecord->GetDouble(LDBIZ_EXCH_GROUP_INTRST_RATE_FLOAT);
                 v_exch_group_intrst_base_amt = lpRecord->GetDouble(LDBIZ_EXCH_GROUP_INTRST_BASE_AMT_FLOAT);
                 v_exch_group_pre_entry_intrst_amt = lpRecord->GetDouble(LDBIZ_EXCH_GROUP_PRE_ENTRY_INTRST_AMT_FLOAT);
                 v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


             // [主动推送][secu.pdexgpcapital][证券主推_产品资金_交易组资金主推消息]
             lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.70", 0);
             lpPubMsg->SetInt64(LDBIZ_EXGP_CASH_ID_INT64,v_exgp_cash_id);
             lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
             lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
             lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
             lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
             lpPubMsg->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
             lpPubMsg->SetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT,v_exgp_begin_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT,v_exgp_curr_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_PRE_SETTLE_AMT_FLOAT,v_exgp_pre_settle_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_SHSZ_AVAIL_CHANGE_AMT_FLOAT,v_exgp_shsz_avail_change_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_HK_AVAIL_CHANGE_AMT_FLOAT,v_exgp_hk_avail_change_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_AMT_CHECK_DIFF_FLOAT,v_exgp_amt_check_diff);
             lpPubMsg->SetDouble(LDBIZ_EXGP_T_HK_BUY_TOTAL_AMT_FLOAT,v_exgp_T_hk_buy_total_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_T_HK_SELL_TOTAL_AMT_FLOAT,v_exgp_T_hk_sell_total_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_T1_HK_BUY_TOTAL_AMT_FLOAT,v_exgp_T1_hk_buy_total_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_T1_HK_SELL_TOTAL_AMT_FLOAT,v_exgp_T1_hk_sell_total_amt);
             lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_TOTAL_RECE_AMT_FLOAT,v_exch_group_total_rece_amt);
             lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_TOTAL_PAYAB_AMT_FLOAT,v_exch_group_total_payab_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
             lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_INTRST_RATE_FLOAT,v_exch_group_intrst_rate);
             lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_INTRST_BASE_AMT_FLOAT,v_exch_group_intrst_base_amt);
             lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_PRE_ENTRY_INTRST_AMT_FLOAT,v_exch_group_pre_entry_intrst_amt);
             lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
             glpPubSub_Interface->PubTopics("secu.pdexgpcapital", lpPubMsg);


         // [遍历结果集结束][lpMainMsg3]
             }
         }


         // set @交易组编号# = @默认交易组编号#;
         v_exch_group_no = v_default_exch_group_no;
         //调用过程[事务_产品证券_公共接口_查询交易组资金信息]
         //组织事务请求
         if(lpTSCall1Ans8)
         {
           lpTSCall1Ans8->FreeMsg();
           lpTSCall1Ans8=NULL;
         }
         lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("pdsecuT.4.109", 0);
         lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
         lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
         lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
         lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
         lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
         lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
         lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
         lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
         lpTSCall1Req8->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
         lpTSCall1Req8->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
         lpTSCall1Req8->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
         lpTSCall1Req8->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
         glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
         if(!lpTSCall1Ans8)  //  超时错误
         {
             lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
             lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.4.109]subcall timed out!");
             iRet=-2;
             goto ENDSYS;
         }
         else if(lpTSCall1Ans8->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
         {
             lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans8->GetInt32(LDTAG_ERRORNO));
             lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans8->GetString(LDTAG_ERRORINFO));
             iRet=-2;
             goto ENDSYS;
         }
         else if(strcmp(lpTSCall1Ans8->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
         {
             strcpy(v_error_code, lpTSCall1Ans8->GetString(LDBIZ_ERROR_CODE_STR));
             strcpy(v_error_info, lpTSCall1Ans8->GetString(LDBIZ_ERROR_INFO_STR));
             iRet=-1;
             goto END;
         }
         //获取输出参数值
         strcpy(v_error_code, lpTSCall1Ans8->GetString(LDBIZ_ERROR_CODE_STR));
         strcpy(v_error_info, lpTSCall1Ans8->GetString(LDBIZ_ERROR_INFO_STR));


         // [获取结果集][lpMainMsg4]
         lpMainMsg4=lpTSCall1Ans8->GetGroup(LDTAG_NO_RESULTSET);


         // [遍历结果集开始][lpMainMsg4]
         iRecordCount = lpMainMsg4->GetRecordCount();
         for (int i = 0; i < iRecordCount;i++) 
         {
             IRecord* lpRecord =lpMainMsg4->GetRecord(i);
             if(lpRecord)
             {

                 //获取记录字段值
                 v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
                 v_exgp_cash_id = lpRecord->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
                 v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
                 v_exgp_begin_amt = lpRecord->GetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT);
                 v_exgp_curr_amt = lpRecord->GetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT);
                 v_exgp_frozen_amt = lpRecord->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
                 v_exgp_unfroz_amt = lpRecord->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
                 v_exgp_pre_settle_amt = lpRecord->GetDouble(LDBIZ_EXGP_PRE_SETTLE_AMT_FLOAT);
                 v_exgp_shsz_avail_change_amt = lpRecord->GetDouble(LDBIZ_EXGP_SHSZ_AVAIL_CHANGE_AMT_FLOAT);
                 v_exgp_hk_avail_change_amt = lpRecord->GetDouble(LDBIZ_EXGP_HK_AVAIL_CHANGE_AMT_FLOAT);
                 v_exgp_amt_check_diff = lpRecord->GetDouble(LDBIZ_EXGP_AMT_CHECK_DIFF_FLOAT);
                 v_exgp_T_hk_buy_total_amt = lpRecord->GetDouble(LDBIZ_EXGP_T_HK_BUY_TOTAL_AMT_FLOAT);
                 v_exgp_T_hk_sell_total_amt = lpRecord->GetDouble(LDBIZ_EXGP_T_HK_SELL_TOTAL_AMT_FLOAT);
                 v_exgp_T1_hk_buy_total_amt = lpRecord->GetDouble(LDBIZ_EXGP_T1_HK_BUY_TOTAL_AMT_FLOAT);
                 v_exgp_T1_hk_sell_total_amt = lpRecord->GetDouble(LDBIZ_EXGP_T1_HK_SELL_TOTAL_AMT_FLOAT);
                 v_exch_group_total_rece_amt = lpRecord->GetDouble(LDBIZ_EXCH_GROUP_TOTAL_RECE_AMT_FLOAT);
                 v_exch_group_total_payab_amt = lpRecord->GetDouble(LDBIZ_EXCH_GROUP_TOTAL_PAYAB_AMT_FLOAT);
                 v_exgp_realize_pandl = lpRecord->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
                 v_exch_group_intrst_rate = lpRecord->GetDouble(LDBIZ_EXCH_GROUP_INTRST_RATE_FLOAT);
                 v_exch_group_intrst_base_amt = lpRecord->GetDouble(LDBIZ_EXCH_GROUP_INTRST_BASE_AMT_FLOAT);
                 v_exch_group_pre_entry_intrst_amt = lpRecord->GetDouble(LDBIZ_EXCH_GROUP_PRE_ENTRY_INTRST_AMT_FLOAT);
                 v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


             // [主动推送][secu.pdexgpcapital][证券主推_产品资金_交易组资金主推消息]
             lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.70", 0);
             lpPubMsg->SetInt64(LDBIZ_EXGP_CASH_ID_INT64,v_exgp_cash_id);
             lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
             lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
             lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
             lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
             lpPubMsg->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
             lpPubMsg->SetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT,v_exgp_begin_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT,v_exgp_curr_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_PRE_SETTLE_AMT_FLOAT,v_exgp_pre_settle_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_SHSZ_AVAIL_CHANGE_AMT_FLOAT,v_exgp_shsz_avail_change_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_HK_AVAIL_CHANGE_AMT_FLOAT,v_exgp_hk_avail_change_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_AMT_CHECK_DIFF_FLOAT,v_exgp_amt_check_diff);
             lpPubMsg->SetDouble(LDBIZ_EXGP_T_HK_BUY_TOTAL_AMT_FLOAT,v_exgp_T_hk_buy_total_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_T_HK_SELL_TOTAL_AMT_FLOAT,v_exgp_T_hk_sell_total_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_T1_HK_BUY_TOTAL_AMT_FLOAT,v_exgp_T1_hk_buy_total_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_T1_HK_SELL_TOTAL_AMT_FLOAT,v_exgp_T1_hk_sell_total_amt);
             lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_TOTAL_RECE_AMT_FLOAT,v_exch_group_total_rece_amt);
             lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_TOTAL_PAYAB_AMT_FLOAT,v_exch_group_total_payab_amt);
             lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
             lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_INTRST_RATE_FLOAT,v_exch_group_intrst_rate);
             lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_INTRST_BASE_AMT_FLOAT,v_exch_group_intrst_base_amt);
             lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_PRE_ENTRY_INTRST_AMT_FLOAT,v_exch_group_pre_entry_intrst_amt);
             lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
             glpPubSub_Interface->PubTopics("secu.pdexgpcapital", lpPubMsg);


         // [遍历结果集结束][lpMainMsg4]
             }
         }


         // set @交易组编号# = @临时_交易组编号#;
         v_exch_group_no = v_tmp_exch_group_no;
         //调用过程[事务_产品证券_公共接口_查询交易组持仓信息]
         //组织事务请求
         if(lpTSCall1Ans9)
         {
           lpTSCall1Ans9->FreeMsg();
           lpTSCall1Ans9=NULL;
         }
         lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("pdsecuT.4.110", 0);
         lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
         lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
         lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
         lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
         lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
         lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
         lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
         lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
         lpTSCall1Req9->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
         lpTSCall1Req9->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
         lpTSCall1Req9->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
         glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
         if(!lpTSCall1Ans9)  //  超时错误
         {
             lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
             lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.4.110]subcall timed out!");
             iRet=-2;
             goto ENDSYS;
         }
         else if(lpTSCall1Ans9->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
         {
             lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans9->GetInt32(LDTAG_ERRORNO));
             lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans9->GetString(LDTAG_ERRORINFO));
             iRet=-2;
             goto ENDSYS;
         }
         else if(strcmp(lpTSCall1Ans9->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
         {
             strcpy(v_error_code, lpTSCall1Ans9->GetString(LDBIZ_ERROR_CODE_STR));
             strcpy(v_error_info, lpTSCall1Ans9->GetString(LDBIZ_ERROR_INFO_STR));
             iRet=-1;
             goto END;
         }
         //获取输出参数值
         strcpy(v_error_code, lpTSCall1Ans9->GetString(LDBIZ_ERROR_CODE_STR));
         strcpy(v_error_info, lpTSCall1Ans9->GetString(LDBIZ_ERROR_INFO_STR));


         // [获取结果集][lpMainMsg5]
         lpMainMsg5=lpTSCall1Ans9->GetGroup(LDTAG_NO_RESULTSET);


         // [遍历结果集开始][lpMainMsg5]
         iRecordCount = lpMainMsg5->GetRecordCount();
         for (int i = 0; i < iRecordCount;i++) 
         {
             IRecord* lpRecord =lpMainMsg5->GetRecord(i);
             if(lpRecord)
             {

                 //获取记录字段值
                 v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
                 v_exgp_posi_id = lpRecord->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
                 v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
                 v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
                 v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
                 v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
                 v_exch_group_stock_type = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT);
                 v_exch_group_asset_type = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT);
                 v_exgp_invest_type = lpRecord->GetInt32(LDBIZ_EXGP_INVEST_TYPE_INT);
                 v_exch_group_begin_qty = lpRecord->GetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT);
                 v_exgp_curr_qty = lpRecord->GetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT);
                 v_exgp_pre_settle_qty = lpRecord->GetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT);
                 v_exgp_frozen_qty = lpRecord->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
                 v_exgp_unfroz_qty = lpRecord->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
                 v_exgp_posi_qty_check_diff = lpRecord->GetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT);
                 v_exgp_cost_amt = lpRecord->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
                 v_exgp_realize_pandl = lpRecord->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
                 v_exgp_intrst_cost_amt = lpRecord->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
                 v_exgp_intrst_pandl = lpRecord->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
                 v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


              // [主动推送][secu.pdexgpposi][证券主推_产品持仓_交易组持仓主推消息]
              lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.80", 0);
              lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
              lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
              lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
              lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
              lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
              lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
              lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
              lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
              lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT,v_exch_group_stock_type);
              lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT,v_exch_group_asset_type);
              lpPubMsg->SetInt32(LDBIZ_EXGP_INVEST_TYPE_INT,v_exgp_invest_type);
              lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT,v_exch_group_begin_qty);
              lpPubMsg->SetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT,v_exgp_curr_qty);
              lpPubMsg->SetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT,v_exgp_pre_settle_qty);
              lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
              lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
              lpPubMsg->SetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT,v_exgp_posi_qty_check_diff);
              lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
              lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
              lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
              lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
              lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
              glpPubSub_Interface->PubTopics("secu.pdexgpposi", lpPubMsg);


         // [遍历结果集结束][lpMainMsg5]
             }
         }


         // set @交易组编号# = @默认交易组编号#;
         v_exch_group_no = v_default_exch_group_no;
         //调用过程[事务_产品证券_公共接口_查询交易组持仓信息]
         //组织事务请求
         if(lpTSCall1Ans10)
         {
           lpTSCall1Ans10->FreeMsg();
           lpTSCall1Ans10=NULL;
         }
         lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("pdsecuT.4.110", 0);
         lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
         lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
         lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
         lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
         lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
         lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
         lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
         lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
         lpTSCall1Req10->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
         lpTSCall1Req10->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
         lpTSCall1Req10->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
         glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
         if(!lpTSCall1Ans10)  //  超时错误
         {
             lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
             lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.4.110]subcall timed out!");
             iRet=-2;
             goto ENDSYS;
         }
         else if(lpTSCall1Ans10->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
         {
             lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans10->GetInt32(LDTAG_ERRORNO));
             lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans10->GetString(LDTAG_ERRORINFO));
             iRet=-2;
             goto ENDSYS;
         }
         else if(strcmp(lpTSCall1Ans10->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
         {
             strcpy(v_error_code, lpTSCall1Ans10->GetString(LDBIZ_ERROR_CODE_STR));
             strcpy(v_error_info, lpTSCall1Ans10->GetString(LDBIZ_ERROR_INFO_STR));
             iRet=-1;
             goto END;
         }
         //获取输出参数值
         strcpy(v_error_code, lpTSCall1Ans10->GetString(LDBIZ_ERROR_CODE_STR));
         strcpy(v_error_info, lpTSCall1Ans10->GetString(LDBIZ_ERROR_INFO_STR));


         // [获取结果集][lpMainMsg6]
         lpMainMsg6=lpTSCall1Ans10->GetGroup(LDTAG_NO_RESULTSET);


         // [遍历结果集开始][lpMainMsg6]
         iRecordCount = lpMainMsg6->GetRecordCount();
         for (int i = 0; i < iRecordCount;i++) 
         {
             IRecord* lpRecord =lpMainMsg6->GetRecord(i);
             if(lpRecord)
             {

                 //获取记录字段值
                 v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
                 v_exgp_posi_id = lpRecord->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
                 v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
                 v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
                 v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
                 v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
                 v_exch_group_stock_type = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT);
                 v_exch_group_asset_type = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT);
                 v_exgp_invest_type = lpRecord->GetInt32(LDBIZ_EXGP_INVEST_TYPE_INT);
                 v_exch_group_begin_qty = lpRecord->GetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT);
                 v_exgp_curr_qty = lpRecord->GetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT);
                 v_exgp_pre_settle_qty = lpRecord->GetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT);
                 v_exgp_frozen_qty = lpRecord->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
                 v_exgp_unfroz_qty = lpRecord->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
                 v_exgp_posi_qty_check_diff = lpRecord->GetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT);
                 v_exgp_cost_amt = lpRecord->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
                 v_exgp_realize_pandl = lpRecord->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
                 v_exgp_intrst_cost_amt = lpRecord->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
                 v_exgp_intrst_pandl = lpRecord->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
                 v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


              // [主动推送][secu.pdexgpposi][证券主推_产品持仓_交易组持仓主推消息]
              lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.80", 0);
              lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
              lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
              lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
              lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
              lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
              lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
              lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
              lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
              lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT,v_exch_group_stock_type);
              lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT,v_exch_group_asset_type);
              lpPubMsg->SetInt32(LDBIZ_EXGP_INVEST_TYPE_INT,v_exgp_invest_type);
              lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT,v_exch_group_begin_qty);
              lpPubMsg->SetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT,v_exgp_curr_qty);
              lpPubMsg->SetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT,v_exgp_pre_settle_qty);
              lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
              lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
              lpPubMsg->SetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT,v_exgp_posi_qty_check_diff);
              lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
              lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
              lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
              lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
              lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
              glpPubSub_Interface->PubTopics("secu.pdexgpposi", lpPubMsg);


         // [遍历结果集结束][lpMainMsg6]
             }
         }

    // end if;
    }


END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans11)
        {
          lpTSCall1Ans11->FreeMsg();
          lpTSCall1Ans11=NULL;
        }
        lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req11->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req11->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
        if (lpTSCall1Ans11)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans11->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans11->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans11->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans11->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans11->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    if(lpTSCall1Ans3)
        lpTSCall1Ans3->FreeMsg();
    if(lpTSCall1Ans4)
        lpTSCall1Ans4->FreeMsg();
    if(lpTSCall1Ans5)
        lpTSCall1Ans5->FreeMsg();
    if(lpTSCall1Ans6)
        lpTSCall1Ans6->FreeMsg();
    if(lpTSCall1Ans7)
        lpTSCall1Ans7->FreeMsg();
    if(lpTSCall1Ans8)
        lpTSCall1Ans8->FreeMsg();
    if(lpTSCall1Ans9)
        lpTSCall1Ans9->FreeMsg();
    if(lpTSCall1Ans10)
        lpTSCall1Ans10->FreeMsg();
    if(lpTSCall1Ans11)
        lpTSCall1Ans11->FreeMsg();
    return iRet;
}

