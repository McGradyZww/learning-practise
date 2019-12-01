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
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.3.1");
        bizFuncInfo->lpFunc = fnFunc0;
    }
    else if (iFunIndex==1)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.3.2");
        bizFuncInfo->lpFunc = fnFunc1;
    }
    else if (iFunIndex==2)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.3.3");
        bizFuncInfo->lpFunc = fnFunc2;
    }
    else if (iFunIndex==3)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.3.4");
        bizFuncInfo->lpFunc = fnFunc3;
    }
    else if (iFunIndex==4)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.3.5");
        bizFuncInfo->lpFunc = fnFunc4;
    }
    else if (iFunIndex==5)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.3.6");
        bizFuncInfo->lpFunc = fnFunc5;
    }
    else if (iFunIndex==6)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.3.7");
        bizFuncInfo->lpFunc = fnFunc6;
    }
    else if (iFunIndex==7)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.3.8");
        bizFuncInfo->lpFunc = fnFunc7;
    }
    else if (iFunIndex==8)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.3.9");
        bizFuncInfo->lpFunc = fnFunc8;
    }
    else if (iFunIndex==9)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.3.10");
        bizFuncInfo->lpFunc = fnFunc9;
    }
    else if (iFunIndex==10)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.3.11");
        bizFuncInfo->lpFunc = fnFunc10;
    }
    else if (iFunIndex==11)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.3.12");
        bizFuncInfo->lpFunc = fnFunc11;
    }
    else if (iFunIndex==12)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.3.13");
        bizFuncInfo->lpFunc = fnFunc12;
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
    return "20190709";
}

//逻辑_交易期货_指令_新增指令
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
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_exch_no;
    char v_contrc_code[7];
    char v_contrc_name[65];
    int v_contrc_dir;
    int v_hedge_type;
    int v_comm_batch_no;
    int v_comm_executor;
    int v_comm_dir;
    int v_price_kind;
    int v_ctrl_type;
    double v_comm_limit_price;
    double v_limit_actual_price;
    double v_comm_qty;
    double v_comm_amt;
    char v_comm_remark[256];
    int v_comm_begin_date;
    int v_comm_end_date;
    int v_comm_begin_time;
    int v_comm_end_time;
    char v_comm_oper_way[3];
    int64 v_external_no;
    char v_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_comm_id;
    char v_stock_code[7];
    char v_comm_status[3];
    char v_comm_appr_status[3];
    int v_init_date;
    int v_order_dir;
    double v_order_qty;
    int v_price_type;
    int v_stock_type;
    char v_co_busi_config_str[65];
    char v_exgp_busi_config_str[65];
    int v_contrc_code_no;
    int v_contrc_type;
    int v_asset_type;
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    int v_contrc_unit;
    int v_capit_reback_days;
    int v_posi_reback_days;
    int v_co_comm_appr_oper;
    char v_sys_config_str[65];
    char v_busi_config_str[65];
    char v_busi_ctrl_str[65];
    char v_asac_busi_config_str[65];
    char v_split_fee_typr_str[65];
    char v_busi_limit_str[2049];
    int v_comm_appr_oper;
    int v_pass_no;
    char v_out_acco[33];
    int v_exter_comm_flag;
    double v_market_price_ratio;
    double v_comm_no_limit_price_ratio;
    int v_cost_calc_type;
    int v_comm_appr_set;
    int v_appr_allow_order_flag;
    char v_opor_no_str1[2049];
    char v_opor_no_str2[2049];
    char v_opor_no_str3[2049];
    int v_sys_type;
    char v_last_login_ip[33];
    char v_last_login_mac[33];
    int v_last_login_date;
    char v_last_oper_info[256];
    int v_online_status;
    int v_tmp_opor_no;
    double v_pre_settle_price;
    double v_up_limit_price;
    double v_down_limit_price;
    double v_last_price;
    double v_pre_limit_actual_price;
    double v_order_price;
    int v_lngsht_type;
    int v_calc_dir;
    char v_comb_code[7];
    int v_comb_type;
    int v_futu_acco_no;
    char v_futu_acco[17];
    double v_exgp_avail_amt;
    double v_asac_avail_amt;
    double v_exgp_avail_qty;
    double v_asac_avail_qty;
    double v_exgp_long_rece_margin;
    double v_exgp_short_rece_margin;
    double v_asac_long_rece_margin;
    double v_asac_short_rece_margin;
    double v_exgp_long_stock_rece_margin;
    double v_exgp_short_stock_rece_margin;
    double v_rece_margin;
    double v_trade_commis;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_deli_fee;
    double v_other_fee;
    double v_other_commis;
    double v_all_fee;
    int v_margin_pref;
    double v_margin_ratio;
    double v_trade_fee;
    int v_trig_stage_type;
    int64 v_compli_trig_id;
    int v_comm_opor;
    int v_comm_date;
    int v_comm_time;
    int v_comm_comple_date;
    int v_comm_comple_time;
    int v_comm_appr_date;
    int v_comm_appr_time;
    char v_comm_appr_remark[256];
    int v_comm_comple_flag;
    double v_comm_frozen_qty;
    char v_strike_status[3];
    int64 v_order_id;
    int v_order_date;
    int v_order_time;
    int v_order_batch_no;
    char v_order_status[3];
    double v_order_frozen_amt;
    double v_order_frozen_qty;
    char v_order_oper_way[3];
    int v_update_times;
    double v_comm_cancel_qty;
    double v_strike_amt;
    double v_strike_qty;
    int64 v_row_id;
    int v_comm_trd_type;
    int64 v_basket_id;
    char v_basket_name[65];
    double v_futu_qty;
    double v_spot_qty;
    double v_basket_copies;
    double v_remain_copies;
    double v_cash_replace_amt;
    double v_hedging_pankou;
    double v_name_base_diff;
    double v_basket_base_diff;
    double v_track_base_diff;
    int v_record_batch_no;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    double v_wtdraw_qty;
    double v_strike_price;
    char v_rsp_info[256];
    int64 v_exgp_row_id;
    double v_exgp_begin_amt;
    double v_exgp_curr_amt;
    double v_exgp_frozen_amt;
    double v_exgp_unfroz_amt;
    double v_exgp_comm_frozen_amt;
    double v_exgp_comm_unfroz_amt;
    double v_exgp_comm_capt_amt;
    double v_exgp_comm_releas_amt;
    double v_exgp_trade_capt_amt;
    double v_exgp_trade_releas_amt;
    double v_exgp_strike_capt_amt;
    double v_exgp_strike_releas_amt;
    double v_exgp_capt_margin;
    double v_exgp_trade_fee;
    double v_exgp_strike_fee;
    double v_exgp_close_pandl;
    double v_exgp_marked_pandl;
    int v_exgp_cash_update_times;
    int64 v_asac_row_id;
    double v_asac_begin_amt;
    double v_asac_curr_amt;
    double v_asac_frozen_amt;
    double v_asac_unfroz_amt;
    double v_asac_comm_frozen_amt;
    double v_asac_comm_unfroz_amt;
    double v_asac_comm_capt_amt;
    double v_asac_comm_releas_amt;
    double v_asac_trade_capt_amt;
    double v_asac_trade_releas_amt;
    double v_asac_strike_capt_amt;
    double v_asac_strike_releas_amt;
    double v_asac_capt_margin;
    double v_asac_trade_fee;
    double v_asac_strike_fee;
    double v_asac_close_pandl;
    double v_asac_marked_pandl;
    int v_asac_cash_update_times;
    double v_exgp_frozen_qty;
    double v_exgp_unfroz_qty;
    double v_exgp_comm_releas_qty;
    double v_exgp_trade_releas_qty;
    double v_exgp_strike_releas_qty;
    double v_exgp_old_comm_capt_qty;
    double v_exgp_today_comm_capt_qty;
    double v_exgp_old_trade_capt_qty;
    double v_exgp_today_trade_capt_qty;
    double v_exgp_pre_strike_capt_qty;
    double v_exgp_today_strike_capt_qty;
    double v_exgp_rece_margin;
    double v_exgp_realize_pandl;
    double v_exgp_open_amount;
    int v_exgp_posi_update_times;
    double v_asac_frozen_qty;
    double v_asac_unfroz_qty;
    double v_asac_comm_releas_qty;
    double v_asac_trade_releas_qty;
    double v_asac_strike_releas_qty;
    double v_asac_old_comm_capt_qty;
    double v_asac_today_comm_capt_qty;
    double v_asac_old_trade_capt_qty;
    double v_asac_today_trade_capt_qty;
    double v_asac_pre_strike_capt_qty;
    double v_asac_today_strike_capt_qty;
    double v_asac_rece_margin;
    double v_asac_realize_pandl;
    double v_asac_open_amount;
    int v_asac_posi_update_times;
    double v_comm_await_cancel_qty;
    char v_comm_sum_status[3];
    int v_max_comm_comple_date;
    int v_max_comm_comple_time;
    double v_comm_appr_qty;
    char v_comm_sum_approve_status[3];
    double v_buy_order_qty;
    double v_sell_order_qty;
    double v_buy_comm_qty;
    double v_sell_comm_qty;
    double v_buy_strike_qty;
    double v_sell_strike_qty;
    double v_buy_strike_amt;
    double v_sell_strike_amt;
    double v_buy_comm_amt;
    double v_sell_comm_amt;
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
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    strcpy(v_contrc_code, " ");
    strcpy(v_contrc_name, " ");
    v_contrc_dir=0;
    v_hedge_type=0;
    v_comm_batch_no=0;
    v_comm_executor=0;
    v_comm_dir=0;
    v_price_kind=0;
    v_ctrl_type=0;
    v_comm_limit_price=0;
    v_limit_actual_price=0;
    v_comm_qty=0;
    v_comm_amt=0;
    strcpy(v_comm_remark, " ");
    v_comm_begin_date=0;
    v_comm_end_date=0;
    v_comm_begin_time=0;
    v_comm_end_time=0;
    strcpy(v_comm_oper_way, " ");
    v_external_no=0;
    strcpy(v_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_comm_id=0;
    strcpy(v_stock_code, " ");
    strcpy(v_comm_status, "0");
    strcpy(v_comm_appr_status, " ");
    v_init_date=0;
    v_order_dir=0;
    v_order_qty=0;
    v_price_type=0;
    v_stock_type=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_exgp_busi_config_str, " ");
    v_contrc_code_no=0;
    v_contrc_type=0;
    v_asset_type=0;
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_contrc_unit=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    v_co_comm_appr_oper=0;
    strcpy(v_sys_config_str, " ");
    strcpy(v_busi_config_str, " ");
    strcpy(v_busi_ctrl_str, " ");
    strcpy(v_asac_busi_config_str, " ");
    strcpy(v_split_fee_typr_str, " ");
    strcpy(v_busi_limit_str, " ");
    v_comm_appr_oper=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_exter_comm_flag=0;
    v_market_price_ratio=0;
    v_comm_no_limit_price_ratio=0;
    v_cost_calc_type=0;
    v_comm_appr_set=0;
    v_appr_allow_order_flag=0;
    strcpy(v_opor_no_str1, " ");
    strcpy(v_opor_no_str2, " ");
    strcpy(v_opor_no_str3, " ");
    v_sys_type=0;
    strcpy(v_last_login_ip, " ");
    strcpy(v_last_login_mac, " ");
    v_last_login_date=0;
    strcpy(v_last_oper_info, " ");
    v_online_status=0;
    v_tmp_opor_no=0;
    v_pre_settle_price=0;
    v_up_limit_price=0;
    v_down_limit_price=0;
    v_last_price=0;
    v_pre_limit_actual_price=0;
    v_order_price=0;
    v_lngsht_type=0;
    v_calc_dir=1;
    strcpy(v_comb_code, " ");
    v_comb_type=0;
    v_futu_acco_no=0;
    strcpy(v_futu_acco, " ");
    v_exgp_avail_amt=0;
    v_asac_avail_amt=0;
    v_exgp_avail_qty=0;
    v_asac_avail_qty=0;
    v_exgp_long_rece_margin=0;
    v_exgp_short_rece_margin=0;
    v_asac_long_rece_margin=0;
    v_asac_short_rece_margin=0;
    v_exgp_long_stock_rece_margin=0;
    v_exgp_short_stock_rece_margin=0;
    v_rece_margin=0;
    v_trade_commis=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_deli_fee=0;
    v_other_fee=0;
    v_other_commis=0;
    v_all_fee=0;
    v_margin_pref=0;
    v_margin_ratio=0;
    v_trade_fee=0;
    v_trig_stage_type=0;
    v_compli_trig_id=0;
    v_comm_opor=0;
    v_comm_date=0;
    v_comm_time=0;
    v_comm_comple_date=0;
    v_comm_comple_time=0;
    v_comm_appr_date=0;
    v_comm_appr_time=0;
    strcpy(v_comm_appr_remark, " ");
    v_comm_comple_flag=0;
    v_comm_frozen_qty=0;
    strcpy(v_strike_status, "0");
    v_order_id=0;
    v_order_date=0;
    v_order_time=0;
    v_order_batch_no=0;
    strcpy(v_order_status, "0");
    v_order_frozen_amt=0;
    v_order_frozen_qty=0;
    strcpy(v_order_oper_way, " ");
    v_update_times=1;
    v_comm_cancel_qty=0;
    v_strike_amt=0;
    v_strike_qty=0;
    v_row_id=0;
    v_comm_trd_type=0;
    v_basket_id=0;
    strcpy(v_basket_name, " ");
    v_futu_qty=0;
    v_spot_qty=0;
    v_basket_copies=0;
    v_remain_copies=0;
    v_cash_replace_amt=0;
    v_hedging_pankou=0;
    v_name_base_diff=0;
    v_basket_base_diff=0;
    v_track_base_diff=0;
    v_record_batch_no=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_wtdraw_qty=0;
    v_strike_price=0;
    strcpy(v_rsp_info, " ");
    v_exgp_row_id=0;
    v_exgp_begin_amt=0;
    v_exgp_curr_amt=0;
    v_exgp_frozen_amt=0;
    v_exgp_unfroz_amt=0;
    v_exgp_comm_frozen_amt=0;
    v_exgp_comm_unfroz_amt=0;
    v_exgp_comm_capt_amt=0;
    v_exgp_comm_releas_amt=0;
    v_exgp_trade_capt_amt=0;
    v_exgp_trade_releas_amt=0;
    v_exgp_strike_capt_amt=0;
    v_exgp_strike_releas_amt=0;
    v_exgp_capt_margin=0;
    v_exgp_trade_fee=0;
    v_exgp_strike_fee=0;
    v_exgp_close_pandl=0;
    v_exgp_marked_pandl=0;
    v_exgp_cash_update_times=1;
    v_asac_row_id=0;
    v_asac_begin_amt=0;
    v_asac_curr_amt=0;
    v_asac_frozen_amt=0;
    v_asac_unfroz_amt=0;
    v_asac_comm_frozen_amt=0;
    v_asac_comm_unfroz_amt=0;
    v_asac_comm_capt_amt=0;
    v_asac_comm_releas_amt=0;
    v_asac_trade_capt_amt=0;
    v_asac_trade_releas_amt=0;
    v_asac_strike_capt_amt=0;
    v_asac_strike_releas_amt=0;
    v_asac_capt_margin=0;
    v_asac_trade_fee=0;
    v_asac_strike_fee=0;
    v_asac_close_pandl=0;
    v_asac_marked_pandl=0;
    v_asac_cash_update_times=1;
    v_exgp_frozen_qty=0;
    v_exgp_unfroz_qty=0;
    v_exgp_comm_releas_qty=0;
    v_exgp_trade_releas_qty=0;
    v_exgp_strike_releas_qty=0;
    v_exgp_old_comm_capt_qty=0;
    v_exgp_today_comm_capt_qty=0;
    v_exgp_old_trade_capt_qty=0;
    v_exgp_today_trade_capt_qty=0;
    v_exgp_pre_strike_capt_qty=0;
    v_exgp_today_strike_capt_qty=0;
    v_exgp_rece_margin=0;
    v_exgp_realize_pandl=0;
    v_exgp_open_amount=0;
    v_exgp_posi_update_times=1;
    v_asac_frozen_qty=0;
    v_asac_unfroz_qty=0;
    v_asac_comm_releas_qty=0;
    v_asac_trade_releas_qty=0;
    v_asac_strike_releas_qty=0;
    v_asac_old_comm_capt_qty=0;
    v_asac_today_comm_capt_qty=0;
    v_asac_old_trade_capt_qty=0;
    v_asac_today_trade_capt_qty=0;
    v_asac_pre_strike_capt_qty=0;
    v_asac_today_strike_capt_qty=0;
    v_asac_rece_margin=0;
    v_asac_realize_pandl=0;
    v_asac_open_amount=0;
    v_asac_posi_update_times=1;
    v_comm_await_cancel_qty=0;
    strcpy(v_comm_sum_status, "0");
    v_max_comm_comple_date=0;
    v_max_comm_comple_time=0;
    v_comm_appr_qty=0;
    strcpy(v_comm_sum_approve_status, "0");
    v_buy_order_qty=0;
    v_sell_order_qty=0;
    v_buy_comm_qty=0;
    v_sell_comm_qty=0;
    v_buy_strike_qty=0;
    v_sell_strike_qty=0;
    v_buy_strike_amt=0;
    v_sell_strike_amt=0;
    v_buy_comm_amt=0;
    v_sell_comm_amt=0;
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
    strncpy(v_contrc_code, lpInBizMsg->GetString(LDBIZ_CONTRC_CODE_STR),6);
    v_contrc_code[6] = '\0';
    strncpy(v_contrc_name, lpInBizMsg->GetString(LDBIZ_CONTRC_NAME_STR),64);
    v_contrc_name[64] = '\0';
    v_contrc_dir = lpInBizMsg->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpInBizMsg->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_comm_batch_no = lpInBizMsg->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_executor = lpInBizMsg->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_comm_dir = lpInBizMsg->GetInt32(LDBIZ_COMM_DIR_INT);
    v_price_kind = lpInBizMsg->GetInt32(LDBIZ_PRICE_KIND_INT);
    v_ctrl_type = lpInBizMsg->GetInt32(LDBIZ_CTRL_TYPE_INT);
    v_comm_limit_price = lpInBizMsg->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
    v_limit_actual_price = lpInBizMsg->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
    v_comm_qty = lpInBizMsg->GetDouble(LDBIZ_COMM_QTY_FLOAT);
    v_comm_amt = lpInBizMsg->GetDouble(LDBIZ_COMM_AMT_FLOAT);
    strncpy(v_comm_remark, lpInBizMsg->GetString(LDBIZ_COMM_REMARK_STR),255);
    v_comm_remark[255] = '\0';
    v_comm_begin_date = lpInBizMsg->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
    v_comm_end_date = lpInBizMsg->GetInt32(LDBIZ_COMM_END_DATE_INT);
    v_comm_begin_time = lpInBizMsg->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
    v_comm_end_time = lpInBizMsg->GetInt32(LDBIZ_COMM_END_TIME_INT);
    strncpy(v_comm_oper_way, lpInBizMsg->GetString(LDBIZ_COMM_OPER_WAY_STR),2);
    v_comm_oper_way[2] = '\0';
    v_external_no = lpInBizMsg->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
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
    IFastMessage* lpTSCall1Req13 = NULL;
    IFastMessage* lpTSCall1Ans13 = NULL;
    IFastMessage* lpTSCall1Req14 = NULL;
    IFastMessage* lpTSCall1Ans14 = NULL;
    IFastMessage* lpTSCall1Req15 = NULL;
    IFastMessage* lpTSCall1Ans15 = NULL;
    IFastMessage* lpTSCall1Req16 = NULL;
    IFastMessage* lpTSCall1Ans16 = NULL;
    IFastMessage* lpTSCall1Req17 = NULL;
    IFastMessage* lpTSCall1Ans17 = NULL;
    IFastMessage* lpTSCall1Req18 = NULL;
    IFastMessage* lpTSCall1Ans18 = NULL;

    //检查参数合法性

    // [检查报错返回][@指令开始日期# <> 0 and @指令开始日期# < @初始化日期#][601][@指令开始日期#,@初始化日期#]
    if (v_comm_begin_date != 0 && v_comm_begin_date < v_init_date)
    {
        strcpy(v_error_code, "tdfutuL.3.1.601");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","指令开始日期=",v_comm_begin_date,"初始化日期=",v_init_date);
        iRet = -1;
        goto END;
    }


    // [检查报错返回][@指令结束日期# <> 0 and @指令结束日期# < @初始化日期#][602][@指令结束日期#,@初始化日期#]
    if (v_comm_end_date != 0 && v_comm_end_date < v_init_date)
    {
        strcpy(v_error_code, "tdfutuL.3.1.602");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","指令结束日期=",v_comm_end_date,"初始化日期=",v_init_date);
        iRet = -1;
        goto END;
    }


    // [检查报错返回][(@指令开始日期# > 0 or @指令结束日期# > 0) and  @指令开始日期#>@指令结束日期#][621][@指令开始日期#,@指令结束日期#]
    if ((v_comm_begin_date > 0 || v_comm_end_date > 0) &&  v_comm_begin_date>v_comm_end_date)
    {
        strcpy(v_error_code, "tdfutuL.3.1.621");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","指令开始日期=",v_comm_begin_date,"指令结束日期=",v_comm_end_date);
        iRet = -1;
        goto END;
    }


    // [检查报错返回][(@指令开始日期# > 0 or @指令结束日期# > 0) and  @指令开始日期#=@指令结束日期# and @指令开始时间#>@指令结束时间#][622][@指令开始时间#,@指令结束时间#]
    if ((v_comm_begin_date > 0 || v_comm_end_date > 0) &&  v_comm_begin_date==v_comm_end_date && v_comm_begin_time>v_comm_end_time)
    {
        strcpy(v_error_code, "tdfutuL.3.1.622");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","指令开始时间=",v_comm_begin_time,"指令结束时间=",v_comm_end_time);
        iRet = -1;
        goto END;
    }


    // [检查报错返回][@套保标志# <>《套保标志-投机》 and @套保标志# <>《套保标志-套保》 and @套保标志# <>《套保标志-套利》][19][@套保标志#]
    if (v_hedge_type !=1 && v_hedge_type !=2 && v_hedge_type !=3)
    {
        strcpy(v_error_code, "tdfutuL.3.1.19");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d","套保标志=",v_hedge_type);
        iRet = -1;
        goto END;
    }

    //下指令时先计算好全部费用，以便后续审批和直接下单使用
    //根据不同订单方向，检查并计算相关费用，有关业务检查在前面已经检查过了，可用在后面检查

    // set @订单方向# = @指令方向#;
    v_order_dir = v_comm_dir;

    // set @订单数量# = @指令数量#;
    v_order_qty = v_comm_qty;

    // set @价格类型#=0;
    v_price_type=0;

    // set @证券类型#=0;
    v_stock_type=0;
    //调用过程[事务_公共_交易接口_检查期货指令市场状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.25.136", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req0->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req0->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpTSCall1Req0->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpTSCall1Req0->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req0->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req0->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req0->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.136]subcall timed out!");
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
    v_pd_no = lpTSCall1Ans0->GetInt32(LDBIZ_PD_NO_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));
    strcpy(v_exgp_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR));
    v_contrc_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_contrc_type = lpTSCall1Ans0->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_asset_type = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_crncy_type, lpTSCall1Ans0->GetString(LDBIZ_CRNCY_TYPE_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans0->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_contrc_unit = lpTSCall1Ans0->GetInt32(LDBIZ_CONTRC_UNIT_INT);
    v_capit_reback_days = lpTSCall1Ans0->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans0->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    v_co_comm_appr_oper = lpTSCall1Ans0->GetInt32(LDBIZ_CO_COMM_APPR_OPER_INT);
    strcpy(v_sys_config_str, lpTSCall1Ans0->GetString(LDBIZ_SYS_CONFIG_STR_STR));


    // set @业务控制配置串# = @交易组业务控制配置串#;
    strcpy(v_busi_config_str,v_exgp_busi_config_str);
    //产品子系统检查，检查账户状态，获取当前资金等
    //位1 交易组业务控制配置串，2交易组可用资金 3资产账户业务控制配置串 4资产账户可用资金 5通道编号外部账号

    // set @业务控制串# = "11111";
    strcpy(v_busi_ctrl_str,"11111");
    //调用过程[事务_产品_交易接口_检查期货指令产品账户信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.8.109", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req1->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
    lpTSCall1Req1->SetString(LDBIZ_BUSI_CONFIG_STR_STR,v_busi_config_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_COMM_APPR_OPER_INT,v_co_comm_appr_oper);
    lpTSCall1Req1->SetString(LDBIZ_SYS_CONFIG_STR_STR,v_sys_config_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.8.109]subcall timed out!");
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
    strcpy(v_exgp_busi_config_str, lpTSCall1Ans1->GetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR));
    strcpy(v_asac_busi_config_str, lpTSCall1Ans1->GetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR));
    strcpy(v_split_fee_typr_str, lpTSCall1Ans1->GetString(LDBIZ_SPLIT_FEE_TYPR_STR_STR));
    strcpy(v_busi_limit_str, lpTSCall1Ans1->GetString(LDBIZ_BUSI_LIMIT_STR_STR));
    v_comm_appr_oper = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
    v_pass_no = lpTSCall1Ans1->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans1->GetString(LDBIZ_OUT_ACCO_STR));
    v_exter_comm_flag = lpTSCall1Ans1->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_market_price_ratio = lpTSCall1Ans1->GetDouble(LDBIZ_MARKET_PRICE_RATIO_FLOAT);
    v_comm_no_limit_price_ratio = lpTSCall1Ans1->GetDouble(LDBIZ_COMM_NO_LIMIT_PRICE_RATIO_FLOAT);
    v_cost_calc_type = lpTSCall1Ans1->GetInt32(LDBIZ_COST_CALC_TYPE_INT);
    v_comm_appr_set = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_APPR_SET_INT);
    v_appr_allow_order_flag = lpTSCall1Ans1->GetInt32(LDBIZ_APPR_ALLOW_ORDER_FLAG_INT);
    strcpy(v_opor_no_str1, lpTSCall1Ans1->GetString(LDBIZ_OPOR_NO_STR1_STR));
    strcpy(v_opor_no_str2, lpTSCall1Ans1->GetString(LDBIZ_OPOR_NO_STR2_STR));
    strcpy(v_opor_no_str3, lpTSCall1Ans1->GetString(LDBIZ_OPOR_NO_STR3_STR));
    v_sys_type = lpTSCall1Ans1->GetInt32(LDBIZ_SYS_TYPE_INT);

    //如果指令自动审批，需检查自动审批操作员的权限是否

    // if @指令审批设置# = 《指令审批设置-自动审批》 then
    if (v_comm_appr_set == 1)
    {

        // [检查报错返回][@指令审批操作员#=0][66][@指令审批操作员#]
        if (v_comm_appr_oper==0)
        {
            strcpy(v_error_code, "tdfutuL.3.1.66");
            snprintf(v_error_info, sizeof(v_error_info), "%s%d","指令审批操作员=",v_comm_appr_oper);
            iRet = -1;
            goto END;
        }

       //PB系统自动审批获取审批操作员登录信息，审批操作员不在线状态下不能自动审批

       // if @系统类型# = 《系统类型-PB系统》 then
       if (v_sys_type == 1)
       {
            //调用过程[事务_公共_交易接口_获取操作员登录信息]
            //组织事务请求
            if(lpTSCall1Ans2)
            {
              lpTSCall1Ans2->FreeMsg();
              lpTSCall1Ans2=NULL;
            }
            lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.25.233", 0);
            lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
            if(!lpTSCall1Ans2)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.233]subcall timed out!");
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
            strcpy(v_last_login_ip, lpTSCall1Ans2->GetString(LDBIZ_LAST_LOGIN_IP_STR));
            strcpy(v_last_login_mac, lpTSCall1Ans2->GetString(LDBIZ_LAST_LOGIN_MAC_STR));
            v_last_login_date = lpTSCall1Ans2->GetInt32(LDBIZ_LAST_LOGIN_DATE_INT);
            strcpy(v_last_oper_info, lpTSCall1Ans2->GetString(LDBIZ_LAST_OPER_INFO_STR));
            v_online_status = lpTSCall1Ans2->GetInt32(LDBIZ_ONLINE_STATUS_INT);


            // if @在线状态# <>《在线状态-在线》 then
            if (v_online_status !=1)
            {

              // set @指令审批设置# = 《指令审批设置-手工审批》;
              v_comm_appr_set = 2;
            // end if;
            }


           // if @指令执行人#=0 then
           if (v_comm_executor==0)
           {

              // set @指令执行人# = @指令审批操作员#;
              v_comm_executor = v_comm_appr_oper;
           // end if;
           }

        // end if;
        }


        // set @临时_操作员编号#=@操作员编号#;
        v_tmp_opor_no=v_opor_no;

        // set @操作员编号#=@指令审批操作员#;
        v_opor_no=v_comm_appr_oper;
        //调用过程[事务_公共_交易接口_检查操作员身份权限]
        //组织事务请求
        if(lpTSCall1Ans3)
        {
          lpTSCall1Ans3->FreeMsg();
          lpTSCall1Ans3=NULL;
        }
        lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.25.154", 0);
        lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req3->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req3->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req3->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req3->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
        glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
        if(!lpTSCall1Ans3)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.154]subcall timed out!");
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


        // set @操作员编号#=@临时_操作员编号#;
        v_opor_no=v_tmp_opor_no;
        //如果需要自动下单，需要校验指令执行人的权限
        //PB系统不判断

        // if @审批通过自动下单# = 《审批通过自动下单-是》 and @系统类型# <> 《系统类型-PB系统》  then
        if (v_appr_allow_order_flag == 1 && v_sys_type != 1 )
        {

            // [检查报错返回][@指令执行人#=0][634][@指令执行人#]
            if (v_comm_executor==0)
            {
                strcpy(v_error_code, "tdfutuL.3.1.634");
                snprintf(v_error_info, sizeof(v_error_info), "%s%d","指令执行人=",v_comm_executor);
                iRet = -1;
                goto END;
            }


            // set @临时_操作员编号#=@操作员编号#;
            v_tmp_opor_no=v_opor_no;

            // set @操作员编号#=@指令执行人#;
            v_opor_no=v_comm_executor;
            //调用过程[事务_公共_交易接口_检查交易员身份权限]
            //组织事务请求
            if(lpTSCall1Ans4)
            {
              lpTSCall1Ans4->FreeMsg();
              lpTSCall1Ans4=NULL;
            }
            lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pubT.25.151", 0);
            lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req4->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpTSCall1Req4->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
            lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req4->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
            lpTSCall1Req4->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
            glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
            if(!lpTSCall1Ans4)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.151]subcall timed out!");
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
            v_pd_no = lpTSCall1Ans4->GetInt32(LDBIZ_PD_NO_INT);


            // set @操作员编号#=@临时_操作员编号#;
            v_opor_no=v_tmp_opor_no;
        // end if;
        }

    // end if;
    }

    //获取指令实际限价
    //调用过程[事务_公共_公共接口_获取合约编号行情价格]
    //组织事务请求
    if(lpTSCall1Ans5)
    {
      lpTSCall1Ans5->FreeMsg();
      lpTSCall1Ans5=NULL;
    }
    lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pubT.24.501", 0);
    lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req5->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
    if(!lpTSCall1Ans5)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.501]subcall timed out!");
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
    v_pre_settle_price = lpTSCall1Ans5->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
    v_up_limit_price = lpTSCall1Ans5->GetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT);
    v_down_limit_price = lpTSCall1Ans5->GetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
    v_last_price = lpTSCall1Ans5->GetDouble(LDBIZ_LAST_PRICE_FLOAT);

    //调用过程[事务_交易期货_指令_获取指令实际限价]
    //组织事务请求
    if(lpTSCall1Ans6)
    {
      lpTSCall1Ans6->FreeMsg();
      lpTSCall1Ans6=NULL;
    }
    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.15", 0);
    lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req6->SetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT,v_comm_limit_price);
    lpTSCall1Req6->SetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,v_limit_actual_price);
    lpTSCall1Req6->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
    lpTSCall1Req6->SetDouble(LDBIZ_LAST_PRICE_FLOAT,v_last_price);
    lpTSCall1Req6->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpTSCall1Req6->SetDouble(LDBIZ_COMM_NO_LIMIT_PRICE_RATIO_FLOAT,v_comm_no_limit_price_ratio);
    lpTSCall1Req6->SetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT,v_up_limit_price);
    lpTSCall1Req6->SetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT,v_down_limit_price);
    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
    if(!lpTSCall1Ans6)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.15]subcall timed out!");
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
    v_pre_limit_actual_price = lpTSCall1Ans6->GetDouble(LDBIZ_PRE_LIMIT_ACTUAL_PRICE_FLOAT);


    // set @指令实际限价#=@前指令实际限价#;
    v_limit_actual_price=v_pre_limit_actual_price;

    // set @订单价格# = @指令实际限价#;
    v_order_price = v_limit_actual_price;
    //根据订单方向和开平方向确定多空类型
    //调用过程[事务_交易期货_交易_获取多空类型]
    //组织事务请求
    if(lpTSCall1Ans7)
    {
      lpTSCall1Ans7->FreeMsg();
      lpTSCall1Ans7=NULL;
    }
    lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.26", 0);
    lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req7->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req7->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
    if(!lpTSCall1Ans7)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.26]subcall timed out!");
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
    v_lngsht_type = lpTSCall1Ans7->GetInt32(LDBIZ_LNGSHT_TYPE_INT);


    // set @资产类型#=《资产类型-期货》;
    v_asset_type=31;
    //公共子系统检查，检查交易日期时间

    // set @计算方向#=《计算方向-加上》;
    v_calc_dir=1;
    //获取该合约代码对应的组合编码
    //调用过程[事务_公共_公共接口_获取保证金优惠组合编码]
    //组织事务请求
    if(lpTSCall1Ans8)
    {
      lpTSCall1Ans8->FreeMsg();
      lpTSCall1Ans8=NULL;
    }
    lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("pubT.24.256", 0);
    lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req8->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req8->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpTSCall1Req8->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
    if(!lpTSCall1Ans8)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.256]subcall timed out!");
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
    strcpy(v_comb_code, lpTSCall1Ans8->GetString(LDBIZ_COMB_CODE_STR));
    v_comb_type = lpTSCall1Ans8->GetInt32(LDBIZ_COMB_TYPE_INT);

    //从产品期货的持仓表中获得交易组可用数量和资产账户可用
    //调用过程[事务_产品期货_交易接口_检查账户状态获取可用]
    //组织事务请求
    if(lpTSCall1Ans9)
    {
      lpTSCall1Ans9->FreeMsg();
      lpTSCall1Ans9=NULL;
    }
    lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("pdfutuT.6.1", 0);
    lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req9->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req9->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req9->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req9->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req9->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req9->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req9->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
    if(!lpTSCall1Ans9)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.6.1]subcall timed out!");
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
    v_futu_acco_no = lpTSCall1Ans9->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    strcpy(v_futu_acco, lpTSCall1Ans9->GetString(LDBIZ_FUTU_ACCO_STR));
    v_exgp_avail_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_AVAIL_AMT_FLOAT);
    v_asac_avail_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_AVAIL_AMT_FLOAT);
    v_exgp_avail_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT);
    v_asac_avail_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT);
    v_exgp_long_rece_margin = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT);
    v_exgp_short_rece_margin = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT);
    v_asac_long_rece_margin = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT);
    v_asac_short_rece_margin = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT);
    v_exgp_long_stock_rece_margin = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_LONG_STOCK_RECE_MARGIN_FLOAT);
    v_exgp_short_stock_rece_margin = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_SHORT_STOCK_RECE_MARGIN_FLOAT);

    //获取保证金优惠订单费用
    //调用过程[事务_公共_公共接口_获取保证金优惠组合编码订单费用]
    //组织事务请求
    if(lpTSCall1Ans10)
    {
      lpTSCall1Ans10->FreeMsg();
      lpTSCall1Ans10=NULL;
    }
    lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("pubT.24.255", 0);
    lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req10->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req10->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req10->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req10->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req10->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req10->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpTSCall1Req10->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req10->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req10->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req10->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req10->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
    if(!lpTSCall1Ans10)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.255]subcall timed out!");
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
    v_rece_margin = lpTSCall1Ans10->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_trade_commis = lpTSCall1Ans10->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_report_fee = lpTSCall1Ans10->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
    v_wtdraw_fee = lpTSCall1Ans10->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
    v_deli_fee = lpTSCall1Ans10->GetDouble(LDBIZ_DELI_FEE_FLOAT);
    v_other_fee = lpTSCall1Ans10->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
    v_other_commis = lpTSCall1Ans10->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    v_all_fee = lpTSCall1Ans10->GetDouble(LDBIZ_ALL_FEE_FLOAT);
    v_margin_pref = lpTSCall1Ans10->GetInt32(LDBIZ_MARGIN_PREF_INT);
    strcpy(v_comb_code, lpTSCall1Ans10->GetString(LDBIZ_COMB_CODE_STR));
    v_margin_ratio = lpTSCall1Ans10->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);


    // set @交易费用# = @全部费用#;
    v_trade_fee = v_all_fee;
    //检查风控

    // set @触发阶段类型# = 《触发阶段类型-指令端》;
    v_trig_stage_type = 1;
    //调用过程[事务_风控期货_接口_检查客户风险]
    //组织事务请求
    if(lpTSCall1Ans11)
    {
      lpTSCall1Ans11->FreeMsg();
      lpTSCall1Ans11=NULL;
    }
    lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("rkfutuT.5.1", 0);
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
    lpTSCall1Req11->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req11->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req11->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req11->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req11->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpTSCall1Req11->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req11->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req11->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpTSCall1Req11->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req11->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req11->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
    lpTSCall1Req11->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
    lpTSCall1Req11->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req11->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpTSCall1Req11->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req11->SetInt32(LDBIZ_TRIG_STAGE_TYPE_INT,v_trig_stage_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
    if(!lpTSCall1Ans11)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rkfutuT.5.1]subcall timed out!");
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
    v_compli_trig_id = lpTSCall1Ans11->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);


    // if (@指令审批设置# = 《指令审批设置-自动审批》 or @指令审批设置# = 《指令审批设置-不设置》)  and @审批通过自动下单# = 《审批通过自动下单-是》   then
    if ((v_comm_appr_set == 1 || v_comm_appr_set == 3)  && v_appr_allow_order_flag == 1  )
    {

        // set @触发阶段类型# = 《触发阶段类型-交易端》;
        v_trig_stage_type = 2;
        //调用过程[事务_风控期货_接口_检查客户风险]
        //组织事务请求
        if(lpTSCall1Ans12)
        {
          lpTSCall1Ans12->FreeMsg();
          lpTSCall1Ans12=NULL;
        }
        lpTSCall1Req12=glpFastMsgFactory->CreateFastMessage("rkfutuT.5.1", 0);
        lpTSCall1Req12->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req12->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req12->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req12->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req12->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req12->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req12->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req12->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req12->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req12->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpTSCall1Req12->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpTSCall1Req12->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req12->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req12->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
        lpTSCall1Req12->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
        lpTSCall1Req12->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
        lpTSCall1Req12->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
        lpTSCall1Req12->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
        lpTSCall1Req12->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpTSCall1Req12->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
        lpTSCall1Req12->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
        lpTSCall1Req12->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
        lpTSCall1Req12->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpTSCall1Req12->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
        lpTSCall1Req12->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
        lpTSCall1Req12->SetInt32(LDBIZ_TRIG_STAGE_TYPE_INT,v_trig_stage_type);
        glpTSSubcallSerives->SubCall(lpTSCall1Req12, &lpTSCall1Ans12, 5000);
        if(!lpTSCall1Ans12)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rkfutuT.5.1]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans12->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans12->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans12->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans12->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans12->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans12->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans12->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans12->GetString(LDBIZ_ERROR_INFO_STR));
        v_compli_trig_id = lpTSCall1Ans12->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);

    // end if;
    }

    //新增指令

    // set @指令下达人# = @操作员编号#;
    v_comm_opor = v_opor_no;
    //调用过程[事务_交易期货_指令_新增指令]
    //组织事务请求
    if(lpTSCall1Ans13)
    {
      lpTSCall1Ans13->FreeMsg();
      lpTSCall1Ans13=NULL;
    }
    lpTSCall1Req13=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.1", 0);
    lpTSCall1Req13->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req13->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req13->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req13->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req13->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req13->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req13->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req13->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req13->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpTSCall1Req13->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req13->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req13->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req13->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req13->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req13->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req13->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req13->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req13->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpTSCall1Req13->SetString(LDBIZ_FUTU_ACCO_STR,v_futu_acco);
    lpTSCall1Req13->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req13->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req13->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpTSCall1Req13->SetString(LDBIZ_CONTRC_NAME_STR,v_contrc_name);
    lpTSCall1Req13->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req13->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpTSCall1Req13->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpTSCall1Req13->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
    lpTSCall1Req13->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
    lpTSCall1Req13->SetString(LDBIZ_BUSI_LIMIT_STR_STR,v_busi_limit_str);
    lpTSCall1Req13->SetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR,v_exgp_busi_config_str);
    lpTSCall1Req13->SetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR,v_asac_busi_config_str);
    lpTSCall1Req13->SetDouble(LDBIZ_EXGP_AVAIL_AMT_FLOAT,v_exgp_avail_amt);
    lpTSCall1Req13->SetDouble(LDBIZ_ASAC_AVAIL_AMT_FLOAT,v_asac_avail_amt);
    lpTSCall1Req13->SetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT,v_exgp_avail_qty);
    lpTSCall1Req13->SetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT,v_asac_avail_qty);
    lpTSCall1Req13->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpTSCall1Req13->SetInt32(LDBIZ_CALC_DIR_INT,v_calc_dir);
    lpTSCall1Req13->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req13->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req13->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req13->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req13->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
    lpTSCall1Req13->SetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT,v_comm_limit_price);
    lpTSCall1Req13->SetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,v_limit_actual_price);
    lpTSCall1Req13->SetDouble(LDBIZ_COMM_QTY_FLOAT,v_comm_qty);
    lpTSCall1Req13->SetDouble(LDBIZ_REPORT_FEE_FLOAT,v_report_fee);
    lpTSCall1Req13->SetDouble(LDBIZ_WTDRAW_FEE_FLOAT,v_wtdraw_fee);
    lpTSCall1Req13->SetDouble(LDBIZ_TRADE_FEE_FLOAT,v_trade_fee);
    lpTSCall1Req13->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
    lpTSCall1Req13->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
    lpTSCall1Req13->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpTSCall1Req13->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpTSCall1Req13->SetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT,v_up_limit_price);
    lpTSCall1Req13->SetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT,v_down_limit_price);
    lpTSCall1Req13->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
    lpTSCall1Req13->SetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT,v_exgp_long_rece_margin);
    lpTSCall1Req13->SetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT,v_exgp_short_rece_margin);
    lpTSCall1Req13->SetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT,v_asac_long_rece_margin);
    lpTSCall1Req13->SetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT,v_asac_short_rece_margin);
    lpTSCall1Req13->SetInt64(LDBIZ_COMPLI_TRIG_ID_INT64,v_compli_trig_id);
    lpTSCall1Req13->SetInt32(LDBIZ_COMM_BEGIN_DATE_INT,v_comm_begin_date);
    lpTSCall1Req13->SetInt32(LDBIZ_COMM_END_DATE_INT,v_comm_end_date);
    lpTSCall1Req13->SetInt32(LDBIZ_COMM_BEGIN_TIME_INT,v_comm_begin_time);
    lpTSCall1Req13->SetInt32(LDBIZ_COMM_END_TIME_INT,v_comm_end_time);
    lpTSCall1Req13->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
    lpTSCall1Req13->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpTSCall1Req13->SetInt32(LDBIZ_COMM_APPR_OPER_INT,v_comm_appr_oper);
    lpTSCall1Req13->SetDouble(LDBIZ_MARGIN_RATIO_FLOAT,v_margin_ratio);
    lpTSCall1Req13->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    glpTSSubcallSerives->SubCall(lpTSCall1Req13, &lpTSCall1Ans13, 5000);
    if(!lpTSCall1Ans13)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.1]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans13->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans13->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans13->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans13->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans13->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans13->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans13->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans13->GetString(LDBIZ_ERROR_INFO_STR));
    v_comm_id = lpTSCall1Ans13->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_date = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_time = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_TIME_INT);
    strcpy(v_comm_status, lpTSCall1Ans13->GetString(LDBIZ_COMM_STATUS_STR));
    strcpy(v_comm_appr_status, lpTSCall1Ans13->GetString(LDBIZ_COMM_APPR_STATUS_STR));
    v_comm_comple_date = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
    v_comm_comple_time = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
    v_comm_appr_date = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
    v_comm_appr_time = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
    strcpy(v_comm_appr_remark, lpTSCall1Ans13->GetString(LDBIZ_COMM_APPR_REMARK_STR));
    v_comm_comple_flag = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
    v_comm_frozen_qty = lpTSCall1Ans13->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
    strcpy(v_strike_status, lpTSCall1Ans13->GetString(LDBIZ_STRIKE_STATUS_STR));
    v_order_id = lpTSCall1Ans13->GetInt64(LDBIZ_ORDER_ID_INT64);
    v_order_date = lpTSCall1Ans13->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_order_time = lpTSCall1Ans13->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_order_batch_no = lpTSCall1Ans13->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_order_dir = lpTSCall1Ans13->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_order_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_price = lpTSCall1Ans13->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_price_type = lpTSCall1Ans13->GetInt32(LDBIZ_PRICE_TYPE_INT);
    strcpy(v_order_status, lpTSCall1Ans13->GetString(LDBIZ_ORDER_STATUS_STR));
    v_order_frozen_amt = lpTSCall1Ans13->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
    v_order_frozen_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT);
    strcpy(v_order_oper_way, lpTSCall1Ans13->GetString(LDBIZ_ORDER_OPER_WAY_STR));
    v_update_times = lpTSCall1Ans13->GetInt32(LDBIZ_UPDATE_TIMES_INT);
    v_comm_amt = lpTSCall1Ans13->GetDouble(LDBIZ_COMM_AMT_FLOAT);
    v_appr_allow_order_flag = lpTSCall1Ans13->GetInt32(LDBIZ_APPR_ALLOW_ORDER_FLAG_INT);


    // set @指令撤销数量# = 0;
    v_comm_cancel_qty = 0;

    // set @成交金额# = 0;
    v_strike_amt = 0;

    // set @成交数量# = 0;
    v_strike_qty = 0;

    // set @记录序号# = @指令序号#;
    v_row_id = v_comm_id;

    // [主动推送][futu.comm][期货主推_指令_指令主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.92", 0);
    lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpPubMsg->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_TIME_INT,v_comm_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpPubMsg->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpPubMsg->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpPubMsg->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
    lpPubMsg->SetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT,v_comm_limit_price);
    lpPubMsg->SetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,v_limit_actual_price);
    lpPubMsg->SetDouble(LDBIZ_COMM_QTY_FLOAT,v_comm_qty);
    lpPubMsg->SetDouble(LDBIZ_COMM_AMT_FLOAT,v_comm_amt);
    lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpPubMsg->SetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT,v_comm_cancel_qty);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
    lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT,v_comm_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
    lpPubMsg->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
    lpPubMsg->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
    lpPubMsg->SetString(LDBIZ_STRIKE_STATUS_STR,v_strike_status);
    lpPubMsg->SetString(LDBIZ_COMM_STATUS_STR,v_comm_status);
    lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_DATE_INT,v_comm_begin_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_END_DATE_INT,v_comm_end_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_TIME_INT,v_comm_begin_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_END_TIME_INT,v_comm_end_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_DATE_INT,v_comm_comple_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_TIME_INT,v_comm_comple_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_APPR_DATE_INT,v_comm_appr_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_APPR_TIME_INT,v_comm_appr_time);
    lpPubMsg->SetString(LDBIZ_COMM_APPR_STATUS_STR,v_comm_appr_status);
    lpPubMsg->SetInt32(LDBIZ_COMM_APPR_OPER_INT,v_comm_appr_oper);
    lpPubMsg->SetString(LDBIZ_COMM_APPR_REMARK_STR,v_comm_appr_remark);
    lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpPubMsg->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
    lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_FLAG_INT,v_comm_comple_flag);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("futu.comm", lpPubMsg);


    // if @指令批号# > 0 and @审批通过自动下单# = 《审批通过自动下单-是》 and @指令操作方式# = 《指令操作方式-期现对冲指令》 then
    if (v_comm_batch_no > 0 && v_appr_allow_order_flag == 1 && strcmp(v_comm_oper_way , "76")==0)
    {
        //调用过程[事务_公共_公共接口_清空篮子剩余份数]
        //组织事务请求
        if(lpTSCall1Ans14)
        {
          lpTSCall1Ans14->FreeMsg();
          lpTSCall1Ans14=NULL;
        }
        lpTSCall1Req14=glpFastMsgFactory->CreateFastMessage("pubT.24.216", 0);
        lpTSCall1Req14->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req14->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req14->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req14->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req14->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req14->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req14->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req14->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req14->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpTSCall1Req14->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req14->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req14, &lpTSCall1Ans14, 5000);
        if(!lpTSCall1Ans14)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.216]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans14->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans14->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans14->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans14->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans14->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans14->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans14->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans14->GetString(LDBIZ_ERROR_INFO_STR));
        v_row_id = lpTSCall1Ans14->GetInt64(LDBIZ_ROW_ID_INT64);
        v_comm_trd_type = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_TRD_TYPE_INT);
        v_basket_id = lpTSCall1Ans14->GetInt64(LDBIZ_BASKET_ID_INT64);
        strcpy(v_basket_name, lpTSCall1Ans14->GetString(LDBIZ_BASKET_NAME_STR));
        v_futu_qty = lpTSCall1Ans14->GetDouble(LDBIZ_FUTU_QTY_FLOAT);
        v_spot_qty = lpTSCall1Ans14->GetDouble(LDBIZ_SPOT_QTY_FLOAT);
        v_basket_copies = lpTSCall1Ans14->GetDouble(LDBIZ_BASKET_COPIES_FLOAT);
        v_remain_copies = lpTSCall1Ans14->GetDouble(LDBIZ_REMAIN_COPIES_FLOAT);
        v_cash_replace_amt = lpTSCall1Ans14->GetDouble(LDBIZ_CASH_REPLACE_AMT_FLOAT);
        v_hedging_pankou = lpTSCall1Ans14->GetDouble(LDBIZ_HEDGING_PANKOU_FLOAT);
        v_name_base_diff = lpTSCall1Ans14->GetDouble(LDBIZ_NAME_BASE_DIFF_FLOAT);
        v_basket_base_diff = lpTSCall1Ans14->GetDouble(LDBIZ_BASKET_BASE_DIFF_FLOAT);
        v_track_base_diff = lpTSCall1Ans14->GetDouble(LDBIZ_TRACK_BASE_DIFF_FLOAT);
        v_update_times = lpTSCall1Ans14->GetInt32(LDBIZ_UPDATE_TIMES_INT);


        // set @记录批号# = @指令批号#;
        v_record_batch_no = v_comm_batch_no;

        // [主动推送][pub.hedgingbasket][公共主推_指令_对冲篮子信息主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.924", 0);
        lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_RECORD_BATCH_NO_INT,v_record_batch_no);
        lpPubMsg->SetInt32(LDBIZ_COMM_TRD_TYPE_INT,v_comm_trd_type);
        lpPubMsg->SetInt64(LDBIZ_BASKET_ID_INT64,v_basket_id);
        lpPubMsg->SetString(LDBIZ_BASKET_NAME_STR,v_basket_name);
        lpPubMsg->SetDouble(LDBIZ_FUTU_QTY_FLOAT,v_futu_qty);
        lpPubMsg->SetDouble(LDBIZ_SPOT_QTY_FLOAT,v_spot_qty);
        lpPubMsg->SetDouble(LDBIZ_BASKET_COPIES_FLOAT,v_basket_copies);
        lpPubMsg->SetDouble(LDBIZ_CASH_REPLACE_AMT_FLOAT,v_cash_replace_amt);
        lpPubMsg->SetDouble(LDBIZ_HEDGING_PANKOU_FLOAT,v_hedging_pankou);
        lpPubMsg->SetDouble(LDBIZ_NAME_BASE_DIFF_FLOAT,v_name_base_diff);
        lpPubMsg->SetDouble(LDBIZ_BASKET_BASE_DIFF_FLOAT,v_basket_base_diff);
        lpPubMsg->SetDouble(LDBIZ_TRACK_BASE_DIFF_FLOAT,v_track_base_diff);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("pub.hedgingbasket", lpPubMsg);

    // end if;
    }


    // if @订单序号# > 0 then
    if (v_order_id > 0)
    {

        // set @记录序号# = @订单序号#;
        v_row_id = v_order_id;

        // set @申报日期# = 0;
        v_report_date = 0;

        // set @申报时间# = 0;
        v_report_time = 0;

        // set @申报编号# = " ";
        strcpy(v_report_no," ");

        // set @撤单数量# = 0;
        v_wtdraw_qty = 0;

        // set @成交价格# = 0;
        v_strike_price = 0;

        // set @保证金比例# = 0;
        v_margin_ratio = 0;

        // set @回报信息# = " ";
        strcpy(v_rsp_info," ");

        // set @交易费用# = 0;
        v_trade_fee = 0;

        // set @更新次数# = 1;
        v_update_times = 1;
        //订单主推

        // [主动推送][futu.order][期货主推_订单_订单主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.90", 0);
        lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
        lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
        lpPubMsg->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
        lpPubMsg->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
        lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
        lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpPubMsg->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
        lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
        lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
        lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
        lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpPubMsg->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
        lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_TRADE_FEE_FLOAT,v_trade_fee);
        lpPubMsg->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
        lpPubMsg->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
        lpPubMsg->SetDouble(LDBIZ_REPORT_FEE_FLOAT,v_report_fee);
        lpPubMsg->SetDouble(LDBIZ_WTDRAW_FEE_FLOAT,v_wtdraw_fee);
        lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
        lpPubMsg->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
        lpPubMsg->SetDouble(LDBIZ_MARGIN_RATIO_FLOAT,v_margin_ratio);
        lpPubMsg->SetString(LDBIZ_RSP_INFO_STR,v_rsp_info);
        lpPubMsg->SetInt64(LDBIZ_COMPLI_TRIG_ID_INT64,v_compli_trig_id);
        lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
        lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
        lpPubMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
        lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("futu.order", lpPubMsg);

        //报盘订单主推

        // [主动推送][futu.rptorder][期货主推_报盘_订单主推报盘消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.101", 0);
        lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
        lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpPubMsg->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpPubMsg->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpPubMsg->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetString(LDBIZ_FUTU_ACCO_STR,v_futu_acco);
        lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
        lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
        lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
        lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpPubMsg->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
        lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("futu.rptorder", lpPubMsg);

    // end if;
    }

    //主推交易组和资产账户资金
    //调用过程[事务_交易期货_账户_获取交易组资产账户资金]
    //组织事务请求
    if(lpTSCall1Ans15)
    {
      lpTSCall1Ans15->FreeMsg();
      lpTSCall1Ans15=NULL;
    }
    lpTSCall1Req15=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.11", 0);
    lpTSCall1Req15->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req15->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req15->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req15->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req15->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req15->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req15->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req15->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req15->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req15->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req15->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req15, &lpTSCall1Ans15, 5000);
    if(!lpTSCall1Ans15)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.11]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans15->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans15->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans15->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans15->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans15->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans15->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans15->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans15->GetString(LDBIZ_ERROR_INFO_STR));
    v_exgp_row_id = lpTSCall1Ans15->GetInt64(LDBIZ_EXGP_ROW_ID_INT64);
    v_co_no = lpTSCall1Ans15->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans15->GetInt32(LDBIZ_PD_NO_INT);
    v_exgp_begin_amt = lpTSCall1Ans15->GetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT);
    v_exgp_curr_amt = lpTSCall1Ans15->GetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT);
    v_exgp_frozen_amt = lpTSCall1Ans15->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
    v_exgp_unfroz_amt = lpTSCall1Ans15->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
    v_exgp_comm_frozen_amt = lpTSCall1Ans15->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
    v_exgp_comm_unfroz_amt = lpTSCall1Ans15->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
    v_exgp_comm_capt_amt = lpTSCall1Ans15->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
    v_exgp_comm_releas_amt = lpTSCall1Ans15->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
    v_exgp_trade_capt_amt = lpTSCall1Ans15->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
    v_exgp_trade_releas_amt = lpTSCall1Ans15->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
    v_exgp_strike_capt_amt = lpTSCall1Ans15->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
    v_exgp_strike_releas_amt = lpTSCall1Ans15->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
    v_exgp_capt_margin = lpTSCall1Ans15->GetDouble(LDBIZ_EXGP_CAPT_MARGIN_FLOAT);
    v_exgp_trade_fee = lpTSCall1Ans15->GetDouble(LDBIZ_EXGP_TRADE_FEE_FLOAT);
    v_exgp_strike_fee = lpTSCall1Ans15->GetDouble(LDBIZ_EXGP_STRIKE_FEE_FLOAT);
    v_exgp_close_pandl = lpTSCall1Ans15->GetDouble(LDBIZ_EXGP_CLOSE_PANDL_FLOAT);
    v_exgp_marked_pandl = lpTSCall1Ans15->GetDouble(LDBIZ_EXGP_MARKED_PANDL_FLOAT);
    v_exgp_cash_update_times = lpTSCall1Ans15->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
    v_asac_row_id = lpTSCall1Ans15->GetInt64(LDBIZ_ASAC_ROW_ID_INT64);
    v_asac_begin_amt = lpTSCall1Ans15->GetDouble(LDBIZ_ASAC_BEGIN_AMT_FLOAT);
    v_asac_curr_amt = lpTSCall1Ans15->GetDouble(LDBIZ_ASAC_CURR_AMT_FLOAT);
    v_asac_frozen_amt = lpTSCall1Ans15->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
    v_asac_unfroz_amt = lpTSCall1Ans15->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
    v_asac_comm_frozen_amt = lpTSCall1Ans15->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
    v_asac_comm_unfroz_amt = lpTSCall1Ans15->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
    v_asac_comm_capt_amt = lpTSCall1Ans15->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
    v_asac_comm_releas_amt = lpTSCall1Ans15->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
    v_asac_trade_capt_amt = lpTSCall1Ans15->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
    v_asac_trade_releas_amt = lpTSCall1Ans15->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
    v_asac_strike_capt_amt = lpTSCall1Ans15->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
    v_asac_strike_releas_amt = lpTSCall1Ans15->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
    v_asac_capt_margin = lpTSCall1Ans15->GetDouble(LDBIZ_ASAC_CAPT_MARGIN_FLOAT);
    v_asac_trade_fee = lpTSCall1Ans15->GetDouble(LDBIZ_ASAC_TRADE_FEE_FLOAT);
    v_asac_strike_fee = lpTSCall1Ans15->GetDouble(LDBIZ_ASAC_STRIKE_FEE_FLOAT);
    v_asac_close_pandl = lpTSCall1Ans15->GetDouble(LDBIZ_ASAC_CLOSE_PANDL_FLOAT);
    v_asac_marked_pandl = lpTSCall1Ans15->GetDouble(LDBIZ_ASAC_MARKED_PANDL_FLOAT);
    v_asac_cash_update_times = lpTSCall1Ans15->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);


    // [主动推送][futu.exgpcapital][期货主推_资金_交易组资金主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.110", 0);
    lpPubMsg->SetInt64(LDBIZ_EXGP_ROW_ID_INT64,v_exgp_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT,v_exgp_begin_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT,v_exgp_curr_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT,v_exgp_comm_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT,v_exgp_comm_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT,v_exgp_comm_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT,v_exgp_comm_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT,v_exgp_trade_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT,v_exgp_trade_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT,v_exgp_strike_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT,v_exgp_strike_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_CAPT_MARGIN_FLOAT,v_exgp_capt_margin);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FEE_FLOAT,v_exgp_trade_fee);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FEE_FLOAT,v_exgp_strike_fee);
    lpPubMsg->SetDouble(LDBIZ_EXGP_CLOSE_PANDL_FLOAT,v_exgp_close_pandl);
    lpPubMsg->SetDouble(LDBIZ_EXGP_MARKED_PANDL_FLOAT,v_exgp_marked_pandl);
    lpPubMsg->SetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT,v_exgp_cash_update_times);
    glpPubSub_Interface->PubTopics("futu.exgpcapital", lpPubMsg);


    // [主动推送][futu.asaccapital][期货主推_资金_资产账户资金主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.111", 0);
    lpPubMsg->SetInt64(LDBIZ_ASAC_ROW_ID_INT64,v_asac_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetDouble(LDBIZ_ASAC_BEGIN_AMT_FLOAT,v_asac_begin_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CURR_AMT_FLOAT,v_asac_curr_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT,v_asac_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT,v_asac_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT,v_asac_comm_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT,v_asac_comm_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT,v_asac_comm_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT,v_asac_comm_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT,v_asac_trade_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT,v_asac_trade_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT,v_asac_strike_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT,v_asac_strike_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CAPT_MARGIN_FLOAT,v_asac_capt_margin);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FEE_FLOAT,v_asac_trade_fee);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FEE_FLOAT,v_asac_strike_fee);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CLOSE_PANDL_FLOAT,v_asac_close_pandl);
    lpPubMsg->SetDouble(LDBIZ_ASAC_MARKED_PANDL_FLOAT,v_asac_marked_pandl);
    lpPubMsg->SetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT,v_asac_cash_update_times);
    glpPubSub_Interface->PubTopics("futu.asaccapital", lpPubMsg);

    //主推交易组和资产账户持仓
    //调用过程[事务_交易期货_账户_获取交易组资产账户持仓]
    //组织事务请求
    if(lpTSCall1Ans16)
    {
      lpTSCall1Ans16->FreeMsg();
      lpTSCall1Ans16=NULL;
    }
    lpTSCall1Req16=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.12", 0);
    lpTSCall1Req16->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req16->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req16->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req16->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req16->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req16->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req16->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req16->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req16->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req16->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req16->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req16->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req16->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpTSCall1Req16->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req16, &lpTSCall1Ans16, 5000);
    if(!lpTSCall1Ans16)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.12]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans16->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans16->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans16->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans16->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans16->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans16->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans16->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans16->GetString(LDBIZ_ERROR_INFO_STR));
    v_exgp_row_id = lpTSCall1Ans16->GetInt64(LDBIZ_EXGP_ROW_ID_INT64);
    v_co_no = lpTSCall1Ans16->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans16->GetInt32(LDBIZ_PD_NO_INT);
    strcpy(v_exch_crncy_type, lpTSCall1Ans16->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_contrc_type = lpTSCall1Ans16->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_unit = lpTSCall1Ans16->GetInt32(LDBIZ_CONTRC_UNIT_INT);
    strcpy(v_comb_code, lpTSCall1Ans16->GetString(LDBIZ_COMB_CODE_STR));
    v_exgp_frozen_qty = lpTSCall1Ans16->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
    v_exgp_unfroz_qty = lpTSCall1Ans16->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
    v_exgp_comm_releas_qty = lpTSCall1Ans16->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
    v_exgp_trade_releas_qty = lpTSCall1Ans16->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
    v_exgp_strike_releas_qty = lpTSCall1Ans16->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
    v_exgp_old_comm_capt_qty = lpTSCall1Ans16->GetDouble(LDBIZ_EXGP_OLD_COMM_CAPT_QTY_FLOAT);
    v_exgp_today_comm_capt_qty = lpTSCall1Ans16->GetDouble(LDBIZ_EXGP_TODAY_COMM_CAPT_QTY_FLOAT);
    v_exgp_old_trade_capt_qty = lpTSCall1Ans16->GetDouble(LDBIZ_EXGP_OLD_TRADE_CAPT_QTY_FLOAT);
    v_exgp_today_trade_capt_qty = lpTSCall1Ans16->GetDouble(LDBIZ_EXGP_TODAY_TRADE_CAPT_QTY_FLOAT);
    v_exgp_pre_strike_capt_qty = lpTSCall1Ans16->GetDouble(LDBIZ_EXGP_PRE_STRIKE_CAPT_QTY_FLOAT);
    v_exgp_today_strike_capt_qty = lpTSCall1Ans16->GetDouble(LDBIZ_EXGP_TODAY_STRIKE_CAPT_QTY_FLOAT);
    v_exgp_rece_margin = lpTSCall1Ans16->GetDouble(LDBIZ_EXGP_RECE_MARGIN_FLOAT);
    v_pre_settle_price = lpTSCall1Ans16->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
    v_exgp_realize_pandl = lpTSCall1Ans16->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
    v_exgp_open_amount = lpTSCall1Ans16->GetDouble(LDBIZ_EXGP_OPEN_AMOUNT_FLOAT);
    v_exgp_posi_update_times = lpTSCall1Ans16->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
    v_asac_row_id = lpTSCall1Ans16->GetInt64(LDBIZ_ASAC_ROW_ID_INT64);
    v_asac_frozen_qty = lpTSCall1Ans16->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
    v_asac_unfroz_qty = lpTSCall1Ans16->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
    v_asac_comm_releas_qty = lpTSCall1Ans16->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
    v_asac_trade_releas_qty = lpTSCall1Ans16->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
    v_asac_strike_releas_qty = lpTSCall1Ans16->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
    v_asac_old_comm_capt_qty = lpTSCall1Ans16->GetDouble(LDBIZ_ASAC_OLD_COMM_CAPT_QTY_FLOAT);
    v_asac_today_comm_capt_qty = lpTSCall1Ans16->GetDouble(LDBIZ_ASAC_TODAY_COMM_CAPT_QTY_FLOAT);
    v_asac_old_trade_capt_qty = lpTSCall1Ans16->GetDouble(LDBIZ_ASAC_OLD_TRADE_CAPT_QTY_FLOAT);
    v_asac_today_trade_capt_qty = lpTSCall1Ans16->GetDouble(LDBIZ_ASAC_TODAY_TRADE_CAPT_QTY_FLOAT);
    v_asac_pre_strike_capt_qty = lpTSCall1Ans16->GetDouble(LDBIZ_ASAC_PRE_STRIKE_CAPT_QTY_FLOAT);
    v_asac_today_strike_capt_qty = lpTSCall1Ans16->GetDouble(LDBIZ_ASAC_TODAY_STRIKE_CAPT_QTY_FLOAT);
    v_asac_rece_margin = lpTSCall1Ans16->GetDouble(LDBIZ_ASAC_RECE_MARGIN_FLOAT);
    v_asac_realize_pandl = lpTSCall1Ans16->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
    v_asac_open_amount = lpTSCall1Ans16->GetDouble(LDBIZ_ASAC_OPEN_AMOUNT_FLOAT);
    v_asac_posi_update_times = lpTSCall1Ans16->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


    // [主动推送][futu.exgpposi][期货主推_持仓_交易组持仓主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.130", 0);
    lpPubMsg->SetInt64(LDBIZ_EXGP_ROW_ID_INT64,v_exgp_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpPubMsg->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpPubMsg->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_OLD_COMM_CAPT_QTY_FLOAT,v_exgp_old_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TODAY_COMM_CAPT_QTY_FLOAT,v_exgp_today_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_OLD_TRADE_CAPT_QTY_FLOAT,v_exgp_old_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TODAY_TRADE_CAPT_QTY_FLOAT,v_exgp_today_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_PRE_STRIKE_CAPT_QTY_FLOAT,v_exgp_pre_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TODAY_STRIKE_CAPT_QTY_FLOAT,v_exgp_today_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_RECE_MARGIN_FLOAT,v_exgp_rece_margin);
    lpPubMsg->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
    lpPubMsg->SetDouble(LDBIZ_EXGP_OPEN_AMOUNT_FLOAT,v_exgp_open_amount);
    lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
    glpPubSub_Interface->PubTopics("futu.exgpposi", lpPubMsg);


    // [主动推送][futu.asacposi][期货主推_持仓_资产账户持仓主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.131", 0);
    lpPubMsg->SetInt64(LDBIZ_ASAC_ROW_ID_INT64,v_asac_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpPubMsg->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpPubMsg->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_OLD_COMM_CAPT_QTY_FLOAT,v_asac_old_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TODAY_COMM_CAPT_QTY_FLOAT,v_asac_today_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_OLD_TRADE_CAPT_QTY_FLOAT,v_asac_old_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TODAY_TRADE_CAPT_QTY_FLOAT,v_asac_today_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_PRE_STRIKE_CAPT_QTY_FLOAT,v_asac_pre_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TODAY_STRIKE_CAPT_QTY_FLOAT,v_asac_today_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_RECE_MARGIN_FLOAT,v_asac_rece_margin);
    lpPubMsg->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
    lpPubMsg->SetDouble(LDBIZ_ASAC_OPEN_AMOUNT_FLOAT,v_asac_open_amount);
    lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
    glpPubSub_Interface->PubTopics("futu.asacposi", lpPubMsg);

    //汇总会重置条件，所以放到最后推送

    // if @指令批号# > 0 then
    if (v_comm_batch_no > 0)
    {
        //调用过程[事务_交易期货_指令_获取指令汇总]
        //组织事务请求
        if(lpTSCall1Ans17)
        {
          lpTSCall1Ans17->FreeMsg();
          lpTSCall1Ans17=NULL;
        }
        lpTSCall1Req17=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.4", 0);
        lpTSCall1Req17->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req17->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req17->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req17->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req17->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req17->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req17->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req17->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req17->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
        lpTSCall1Req17->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpTSCall1Req17->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req17->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
        glpTSSubcallSerives->SubCall(lpTSCall1Req17, &lpTSCall1Ans17, 5000);
        if(!lpTSCall1Ans17)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.4]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans17->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans17->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans17->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans17->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans17->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans17->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans17->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans17->GetString(LDBIZ_ERROR_INFO_STR));
        v_row_id = lpTSCall1Ans17->GetInt64(LDBIZ_ROW_ID_INT64);
        v_init_date = lpTSCall1Ans17->GetInt32(LDBIZ_INIT_DATE_INT);
        v_pd_no = lpTSCall1Ans17->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans17->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans17->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        strcpy(v_exch_crncy_type, lpTSCall1Ans17->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans17->GetInt32(LDBIZ_EXCH_NO_INT);
        v_futu_acco_no = lpTSCall1Ans17->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
        v_contrc_code_no = lpTSCall1Ans17->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans17->GetString(LDBIZ_CONTRC_CODE_STR));
        v_contrc_type = lpTSCall1Ans17->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_asset_type = lpTSCall1Ans17->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_dir = lpTSCall1Ans17->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans17->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_comm_time = lpTSCall1Ans17->GetInt32(LDBIZ_COMM_TIME_INT);
        v_comm_opor = lpTSCall1Ans17->GetInt32(LDBIZ_COMM_OPOR_INT);
        v_comm_dir = lpTSCall1Ans17->GetInt32(LDBIZ_COMM_DIR_INT);
        v_comm_limit_price = lpTSCall1Ans17->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
        v_limit_actual_price = lpTSCall1Ans17->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
        v_comm_qty = lpTSCall1Ans17->GetDouble(LDBIZ_COMM_QTY_FLOAT);
        v_comm_amt = lpTSCall1Ans17->GetDouble(LDBIZ_COMM_AMT_FLOAT);
        v_order_qty = lpTSCall1Ans17->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_comm_cancel_qty = lpTSCall1Ans17->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
        v_comm_await_cancel_qty = lpTSCall1Ans17->GetDouble(LDBIZ_COMM_AWAIT_CANCEL_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans17->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_strike_qty = lpTSCall1Ans17->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        strcpy(v_strike_status, lpTSCall1Ans17->GetString(LDBIZ_STRIKE_STATUS_STR));
        strcpy(v_comm_sum_status, lpTSCall1Ans17->GetString(LDBIZ_COMM_SUM_STATUS_STR));
        v_comm_begin_date = lpTSCall1Ans17->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
        v_comm_end_date = lpTSCall1Ans17->GetInt32(LDBIZ_COMM_END_DATE_INT);
        v_comm_begin_time = lpTSCall1Ans17->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
        v_comm_end_time = lpTSCall1Ans17->GetInt32(LDBIZ_COMM_END_TIME_INT);
        v_comm_comple_date = lpTSCall1Ans17->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
        v_comm_comple_time = lpTSCall1Ans17->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
        v_max_comm_comple_date = lpTSCall1Ans17->GetInt32(LDBIZ_MAX_COMM_COMPLE_DATE_INT);
        v_max_comm_comple_time = lpTSCall1Ans17->GetInt32(LDBIZ_MAX_COMM_COMPLE_TIME_INT);
        v_comm_appr_date = lpTSCall1Ans17->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
        v_comm_appr_time = lpTSCall1Ans17->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
        v_comm_appr_qty = lpTSCall1Ans17->GetDouble(LDBIZ_COMM_APPR_QTY_FLOAT);
        strcpy(v_comm_sum_approve_status, lpTSCall1Ans17->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
        v_buy_order_qty = lpTSCall1Ans17->GetDouble(LDBIZ_BUY_ORDER_QTY_FLOAT);
        v_sell_order_qty = lpTSCall1Ans17->GetDouble(LDBIZ_SELL_ORDER_QTY_FLOAT);
        v_buy_comm_qty = lpTSCall1Ans17->GetDouble(LDBIZ_BUY_COMM_QTY_FLOAT);
        v_sell_comm_qty = lpTSCall1Ans17->GetDouble(LDBIZ_SELL_COMM_QTY_FLOAT);
        v_buy_strike_qty = lpTSCall1Ans17->GetDouble(LDBIZ_BUY_STRIKE_QTY_FLOAT);
        v_sell_strike_qty = lpTSCall1Ans17->GetDouble(LDBIZ_SELL_STRIKE_QTY_FLOAT);
        v_buy_strike_amt = lpTSCall1Ans17->GetDouble(LDBIZ_BUY_STRIKE_AMT_FLOAT);
        v_sell_strike_amt = lpTSCall1Ans17->GetDouble(LDBIZ_SELL_STRIKE_AMT_FLOAT);
        v_buy_comm_amt = lpTSCall1Ans17->GetDouble(LDBIZ_BUY_COMM_AMT_FLOAT);
        v_sell_comm_amt = lpTSCall1Ans17->GetDouble(LDBIZ_SELL_COMM_AMT_FLOAT);
        v_rece_margin = lpTSCall1Ans17->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_comm_oper_way, lpTSCall1Ans17->GetString(LDBIZ_COMM_OPER_WAY_STR));
        v_update_times = lpTSCall1Ans17->GetInt32(LDBIZ_UPDATE_TIMES_INT);


        // [主动推送][futu.commtotal][期货主推_指令_指令汇总主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.93", 0);
        lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
        lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
        lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
        lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
        lpPubMsg->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_TIME_INT,v_comm_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpPubMsg->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
        lpPubMsg->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
        lpPubMsg->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
        lpPubMsg->SetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT,v_comm_limit_price);
        lpPubMsg->SetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,v_limit_actual_price);
        lpPubMsg->SetDouble(LDBIZ_COMM_QTY_FLOAT,v_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_AMT_FLOAT,v_comm_amt);
        lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT,v_comm_cancel_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_AWAIT_CANCEL_QTY_FLOAT,v_comm_await_cancel_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT,v_comm_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
        lpPubMsg->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
        lpPubMsg->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
        lpPubMsg->SetString(LDBIZ_STRIKE_STATUS_STR,v_strike_status);
        lpPubMsg->SetString(LDBIZ_COMM_SUM_STATUS_STR,v_comm_sum_status);
        lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_DATE_INT,v_comm_begin_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_END_DATE_INT,v_comm_end_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_TIME_INT,v_comm_begin_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_END_TIME_INT,v_comm_end_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_DATE_INT,v_comm_comple_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_TIME_INT,v_comm_comple_time);
        lpPubMsg->SetInt32(LDBIZ_MAX_COMM_COMPLE_DATE_INT,v_max_comm_comple_date);
        lpPubMsg->SetInt32(LDBIZ_MAX_COMM_COMPLE_TIME_INT,v_max_comm_comple_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_APPR_DATE_INT,v_comm_appr_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_APPR_TIME_INT,v_comm_appr_time);
        lpPubMsg->SetDouble(LDBIZ_COMM_APPR_QTY_FLOAT,v_comm_appr_qty);
        lpPubMsg->SetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR,v_comm_sum_approve_status);
        lpPubMsg->SetDouble(LDBIZ_BUY_ORDER_QTY_FLOAT,v_buy_order_qty);
        lpPubMsg->SetDouble(LDBIZ_SELL_ORDER_QTY_FLOAT,v_sell_order_qty);
        lpPubMsg->SetDouble(LDBIZ_BUY_COMM_QTY_FLOAT,v_buy_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_SELL_COMM_QTY_FLOAT,v_sell_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_BUY_STRIKE_QTY_FLOAT,v_buy_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_SELL_STRIKE_QTY_FLOAT,v_sell_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_BUY_STRIKE_AMT_FLOAT,v_buy_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_SELL_STRIKE_AMT_FLOAT,v_sell_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_BUY_COMM_AMT_FLOAT,v_buy_comm_amt);
        lpPubMsg->SetDouble(LDBIZ_SELL_COMM_AMT_FLOAT,v_sell_comm_amt);
        lpPubMsg->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("futu.commtotal", lpPubMsg);

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
        if(lpTSCall1Ans18)
        {
          lpTSCall1Ans18->FreeMsg();
          lpTSCall1Ans18=NULL;
        }
        lpTSCall1Req18=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req18->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req18->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req18->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req18->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req18->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req18->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req18->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req18->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req18->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req18->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req18, &lpTSCall1Ans18, 5000);
        if (lpTSCall1Ans18)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans18->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans18->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans18->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans18->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans18->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
    lpOutBizMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpOutBizMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpOutBizMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpOutBizMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpOutBizMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpOutBizMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpOutBizMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpOutBizMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpOutBizMsg->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
    lpOutBizMsg->SetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT,v_comm_limit_price);
    lpOutBizMsg->SetDouble(LDBIZ_COMM_QTY_FLOAT,v_comm_qty);
    lpOutBizMsg->SetDouble(LDBIZ_COMM_AMT_FLOAT,v_comm_amt);
    lpOutBizMsg->SetString(LDBIZ_COMM_STATUS_STR,v_comm_status);
    lpOutBizMsg->SetString(LDBIZ_COMM_APPR_STATUS_STR,v_comm_appr_status);
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
    if(lpTSCall1Ans13)
        lpTSCall1Ans13->FreeMsg();
    if(lpTSCall1Ans14)
        lpTSCall1Ans14->FreeMsg();
    if(lpTSCall1Ans15)
        lpTSCall1Ans15->FreeMsg();
    if(lpTSCall1Ans16)
        lpTSCall1Ans16->FreeMsg();
    if(lpTSCall1Ans17)
        lpTSCall1Ans17->FreeMsg();
    if(lpTSCall1Ans18)
        lpTSCall1Ans18->FreeMsg();
    return iRet;
}

//逻辑_交易期货_指令_撤销指令
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
    int v_exch_no;
    int64 v_comm_id;
    char v_cancel_info[256];
    int v_is_withdraw;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
    int v_init_date;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    char v_exch_crncy_type[4];
    int v_futu_acco_no;
    int v_contrc_code_no;
    char v_contrc_code[7];
    int v_contrc_type;
    int v_asset_type;
    int v_contrc_dir;
    int v_hedge_type;
    int v_comm_date;
    int v_comm_time;
    int v_comm_batch_no;
    int v_comm_opor;
    int v_comm_executor;
    int v_comm_dir;
    double v_comm_limit_price;
    double v_limit_actual_price;
    double v_comm_qty;
    double v_comm_amt;
    double v_order_qty;
    double v_comm_cancel_qty;
    double v_strike_amt;
    double v_strike_qty;
    double v_comm_frozen_amt;
    double v_comm_frozen_qty;
    double v_rece_margin;
    int v_capit_reback_days;
    int v_posi_reback_days;
    char v_strike_status[3];
    char v_comm_status[3];
    int v_comm_begin_date;
    int v_comm_end_date;
    int v_comm_begin_time;
    int v_comm_end_time;
    int v_comm_comple_date;
    int v_comm_comple_time;
    int v_comm_appr_date;
    int v_comm_appr_time;
    char v_comm_appr_status[3];
    int v_comm_appr_oper_no;
    int v_comm_appr_oper;
    char v_comm_appr_remark[256];
    int64 v_external_no;
    char v_comb_code[7];
    char v_comm_oper_way[3];
    char v_remark_info[256];
    int v_comm_comple_flag;
    int v_update_times;
    int v_order_dir;
    char v_crncy_type[4];
    int v_lngsht_type;
    char v_co_busi_config_str[65];
    char v_futu_acco[17];
    double v_exgp_avail_amt;
    double v_asac_avail_amt;
    double v_exgp_avail_qty;
    double v_asac_avail_qty;
    double v_exgp_long_rece_margin;
    double v_exgp_short_rece_margin;
    double v_asac_long_rece_margin;
    double v_asac_short_rece_margin;
    double v_exgp_long_stock_rece_margin;
    double v_exgp_short_stock_rece_margin;
    double v_pre_settle_price;
    double v_up_limit_price;
    double v_down_limit_price;
    double v_last_price;
    char v_order_id_str[2049];
    char v_wtdraw_id_str[2049];
    int64 v_exgp_row_id;
    double v_exgp_begin_amt;
    double v_exgp_curr_amt;
    double v_exgp_frozen_amt;
    double v_exgp_unfroz_amt;
    double v_exgp_comm_frozen_amt;
    double v_exgp_comm_unfroz_amt;
    double v_exgp_comm_capt_amt;
    double v_exgp_comm_releas_amt;
    double v_exgp_trade_capt_amt;
    double v_exgp_trade_releas_amt;
    double v_exgp_strike_capt_amt;
    double v_exgp_strike_releas_amt;
    double v_exgp_capt_margin;
    double v_exgp_trade_fee;
    double v_exgp_strike_fee;
    double v_exgp_close_pandl;
    double v_exgp_marked_pandl;
    int v_exgp_cash_update_times;
    int64 v_asac_row_id;
    double v_asac_begin_amt;
    double v_asac_curr_amt;
    double v_asac_frozen_amt;
    double v_asac_unfroz_amt;
    double v_asac_comm_frozen_amt;
    double v_asac_comm_unfroz_amt;
    double v_asac_comm_capt_amt;
    double v_asac_comm_releas_amt;
    double v_asac_trade_capt_amt;
    double v_asac_trade_releas_amt;
    double v_asac_strike_capt_amt;
    double v_asac_strike_releas_amt;
    double v_asac_capt_margin;
    double v_asac_trade_fee;
    double v_asac_strike_fee;
    double v_asac_close_pandl;
    double v_asac_marked_pandl;
    int v_asac_cash_update_times;
    int v_contrc_unit;
    double v_exgp_frozen_qty;
    double v_exgp_unfroz_qty;
    double v_exgp_comm_releas_qty;
    double v_exgp_trade_releas_qty;
    double v_exgp_strike_releas_qty;
    double v_exgp_old_comm_capt_qty;
    double v_exgp_today_comm_capt_qty;
    double v_exgp_old_trade_capt_qty;
    double v_exgp_today_trade_capt_qty;
    double v_exgp_pre_strike_capt_qty;
    double v_exgp_today_strike_capt_qty;
    double v_exgp_rece_margin;
    double v_exgp_realize_pandl;
    double v_exgp_open_amount;
    int v_exgp_posi_update_times;
    double v_asac_frozen_qty;
    double v_asac_unfroz_qty;
    double v_asac_comm_releas_qty;
    double v_asac_trade_releas_qty;
    double v_asac_strike_releas_qty;
    double v_asac_old_comm_capt_qty;
    double v_asac_today_comm_capt_qty;
    double v_asac_old_trade_capt_qty;
    double v_asac_today_trade_capt_qty;
    double v_asac_pre_strike_capt_qty;
    double v_asac_today_strike_capt_qty;
    double v_asac_rece_margin;
    double v_asac_realize_pandl;
    double v_asac_open_amount;
    int v_asac_posi_update_times;
    double v_comm_await_cancel_qty;
    char v_comm_sum_status[3];
    int v_max_comm_comple_date;
    int v_max_comm_comple_time;
    double v_comm_appr_qty;
    char v_comm_sum_approve_status[3];
    double v_buy_order_qty;
    double v_sell_order_qty;
    double v_buy_comm_qty;
    double v_sell_comm_qty;
    double v_buy_strike_qty;
    double v_sell_strike_qty;
    double v_buy_strike_amt;
    double v_sell_strike_amt;
    double v_buy_comm_amt;
    double v_sell_comm_amt;
    char v_out_acco[33];
    int v_pass_no;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_batch_no;
    double v_order_price;
    char v_order_status[3];
    double v_wtdraw_qty;
    double v_strike_price;
    double v_trade_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_strike_commis;
    double v_strike_other_commis;
    double v_strike_all_fee;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_trade_occur_amt;
    double v_margin_ratio;
    char v_rsp_info[256];
    int64 v_compli_trig_id;
    char v_order_oper_way[3];
    char v_oper_func_code[17];
    char v_order_sum_status[3];
    double v_waste_qty;
    double v_strike_aver_price;
    int v_wtdraw_batch_no;
    int v_wtdraw_date;
    int v_wtdraw_time;
    int64 v_order_id;
    char v_wtdraw_status[3];
    char v_wtdraw_remark[256];
    char v_log_error_code[33];
    char v_log_error_info[256];

    IGroup* lpMainMsg=NULL;
    int iRecordCount = 0;
    IGroup* lpMainMsg2=NULL;

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
    v_exch_no=0;
    v_comm_id=0;
    strcpy(v_cancel_info, " ");
    v_is_withdraw=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_row_id=0;
    v_init_date=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    strcpy(v_exch_crncy_type, "CNY");
    v_futu_acco_no=0;
    v_contrc_code_no=0;
    strcpy(v_contrc_code, " ");
    v_contrc_type=0;
    v_asset_type=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    v_comm_date=0;
    v_comm_time=0;
    v_comm_batch_no=0;
    v_comm_opor=0;
    v_comm_executor=0;
    v_comm_dir=0;
    v_comm_limit_price=0;
    v_limit_actual_price=0;
    v_comm_qty=0;
    v_comm_amt=0;
    v_order_qty=0;
    v_comm_cancel_qty=0;
    v_strike_amt=0;
    v_strike_qty=0;
    v_comm_frozen_amt=0;
    v_comm_frozen_qty=0;
    v_rece_margin=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    strcpy(v_strike_status, "0");
    strcpy(v_comm_status, "0");
    v_comm_begin_date=0;
    v_comm_end_date=0;
    v_comm_begin_time=0;
    v_comm_end_time=0;
    v_comm_comple_date=0;
    v_comm_comple_time=0;
    v_comm_appr_date=0;
    v_comm_appr_time=0;
    strcpy(v_comm_appr_status, " ");
    v_comm_appr_oper_no=0;
    v_comm_appr_oper=0;
    strcpy(v_comm_appr_remark, " ");
    v_external_no=0;
    strcpy(v_comb_code, " ");
    strcpy(v_comm_oper_way, " ");
    strcpy(v_remark_info, " ");
    v_comm_comple_flag=0;
    v_update_times=1;
    v_order_dir=0;
    strcpy(v_crncy_type, "CNY");
    v_lngsht_type=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_futu_acco, " ");
    v_exgp_avail_amt=0;
    v_asac_avail_amt=0;
    v_exgp_avail_qty=0;
    v_asac_avail_qty=0;
    v_exgp_long_rece_margin=0;
    v_exgp_short_rece_margin=0;
    v_asac_long_rece_margin=0;
    v_asac_short_rece_margin=0;
    v_exgp_long_stock_rece_margin=0;
    v_exgp_short_stock_rece_margin=0;
    v_pre_settle_price=0;
    v_up_limit_price=0;
    v_down_limit_price=0;
    v_last_price=0;
    strcpy(v_order_id_str, " ");
    strcpy(v_wtdraw_id_str, " ");
    v_exgp_row_id=0;
    v_exgp_begin_amt=0;
    v_exgp_curr_amt=0;
    v_exgp_frozen_amt=0;
    v_exgp_unfroz_amt=0;
    v_exgp_comm_frozen_amt=0;
    v_exgp_comm_unfroz_amt=0;
    v_exgp_comm_capt_amt=0;
    v_exgp_comm_releas_amt=0;
    v_exgp_trade_capt_amt=0;
    v_exgp_trade_releas_amt=0;
    v_exgp_strike_capt_amt=0;
    v_exgp_strike_releas_amt=0;
    v_exgp_capt_margin=0;
    v_exgp_trade_fee=0;
    v_exgp_strike_fee=0;
    v_exgp_close_pandl=0;
    v_exgp_marked_pandl=0;
    v_exgp_cash_update_times=1;
    v_asac_row_id=0;
    v_asac_begin_amt=0;
    v_asac_curr_amt=0;
    v_asac_frozen_amt=0;
    v_asac_unfroz_amt=0;
    v_asac_comm_frozen_amt=0;
    v_asac_comm_unfroz_amt=0;
    v_asac_comm_capt_amt=0;
    v_asac_comm_releas_amt=0;
    v_asac_trade_capt_amt=0;
    v_asac_trade_releas_amt=0;
    v_asac_strike_capt_amt=0;
    v_asac_strike_releas_amt=0;
    v_asac_capt_margin=0;
    v_asac_trade_fee=0;
    v_asac_strike_fee=0;
    v_asac_close_pandl=0;
    v_asac_marked_pandl=0;
    v_asac_cash_update_times=1;
    v_contrc_unit=0;
    v_exgp_frozen_qty=0;
    v_exgp_unfroz_qty=0;
    v_exgp_comm_releas_qty=0;
    v_exgp_trade_releas_qty=0;
    v_exgp_strike_releas_qty=0;
    v_exgp_old_comm_capt_qty=0;
    v_exgp_today_comm_capt_qty=0;
    v_exgp_old_trade_capt_qty=0;
    v_exgp_today_trade_capt_qty=0;
    v_exgp_pre_strike_capt_qty=0;
    v_exgp_today_strike_capt_qty=0;
    v_exgp_rece_margin=0;
    v_exgp_realize_pandl=0;
    v_exgp_open_amount=0;
    v_exgp_posi_update_times=1;
    v_asac_frozen_qty=0;
    v_asac_unfroz_qty=0;
    v_asac_comm_releas_qty=0;
    v_asac_trade_releas_qty=0;
    v_asac_strike_releas_qty=0;
    v_asac_old_comm_capt_qty=0;
    v_asac_today_comm_capt_qty=0;
    v_asac_old_trade_capt_qty=0;
    v_asac_today_trade_capt_qty=0;
    v_asac_pre_strike_capt_qty=0;
    v_asac_today_strike_capt_qty=0;
    v_asac_rece_margin=0;
    v_asac_realize_pandl=0;
    v_asac_open_amount=0;
    v_asac_posi_update_times=1;
    v_comm_await_cancel_qty=0;
    strcpy(v_comm_sum_status, "0");
    v_max_comm_comple_date=0;
    v_max_comm_comple_time=0;
    v_comm_appr_qty=0;
    strcpy(v_comm_sum_approve_status, "0");
    v_buy_order_qty=0;
    v_sell_order_qty=0;
    v_buy_comm_qty=0;
    v_sell_comm_qty=0;
    v_buy_strike_qty=0;
    v_sell_strike_qty=0;
    v_buy_strike_amt=0;
    v_sell_strike_amt=0;
    v_buy_comm_amt=0;
    v_sell_comm_amt=0;
    strcpy(v_out_acco, " ");
    v_pass_no=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_batch_no=0;
    v_order_price=0;
    strcpy(v_order_status, "0");
    v_wtdraw_qty=0;
    v_strike_price=0;
    v_trade_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_strike_commis=0;
    v_strike_other_commis=0;
    v_strike_all_fee=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_trade_occur_amt=0;
    v_margin_ratio=0;
    strcpy(v_rsp_info, " ");
    v_compli_trig_id=0;
    strcpy(v_order_oper_way, " ");
    strcpy(v_oper_func_code, " ");
    strcpy(v_order_sum_status, "0");
    v_waste_qty=0;
    v_strike_aver_price=0;
    v_wtdraw_batch_no=0;
    v_wtdraw_date=0;
    v_wtdraw_time=0;
    v_order_id=0;
    strcpy(v_wtdraw_status, "0");
    strcpy(v_wtdraw_remark, " ");
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
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    strncpy(v_cancel_info, lpInBizMsg->GetString(LDBIZ_CANCEL_INFO_STR),255);
    v_cancel_info[255] = '\0';
    v_is_withdraw = lpInBizMsg->GetInt32(LDBIZ_IS_WITHDRAW_INT);

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
    IFastMessage* lpTSCall1Req13 = NULL;
    IFastMessage* lpTSCall1Ans13 = NULL;

    //调用过程[事务_交易期货_指令_获取指令]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.3", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.3]subcall timed out!");
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
    v_row_id = lpTSCall1Ans0->GetInt64(LDBIZ_ROW_ID_INT64);
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    v_co_no = lpTSCall1Ans0->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans0->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strcpy(v_exch_crncy_type, lpTSCall1Ans0->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_exch_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_NO_INT);
    v_futu_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    v_contrc_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strcpy(v_contrc_code, lpTSCall1Ans0->GetString(LDBIZ_CONTRC_CODE_STR));
    v_contrc_type = lpTSCall1Ans0->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_asset_type = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_contrc_dir = lpTSCall1Ans0->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpTSCall1Ans0->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_comm_date = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_time = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_TIME_INT);
    v_comm_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_opor = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_comm_executor = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_comm_dir = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_DIR_INT);
    v_comm_limit_price = lpTSCall1Ans0->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
    v_limit_actual_price = lpTSCall1Ans0->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
    v_comm_qty = lpTSCall1Ans0->GetDouble(LDBIZ_COMM_QTY_FLOAT);
    v_comm_amt = lpTSCall1Ans0->GetDouble(LDBIZ_COMM_AMT_FLOAT);
    v_order_qty = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_comm_cancel_qty = lpTSCall1Ans0->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_qty = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_comm_frozen_amt = lpTSCall1Ans0->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
    v_comm_frozen_qty = lpTSCall1Ans0->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
    v_rece_margin = lpTSCall1Ans0->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_capit_reback_days = lpTSCall1Ans0->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans0->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    strcpy(v_strike_status, lpTSCall1Ans0->GetString(LDBIZ_STRIKE_STATUS_STR));
    strcpy(v_comm_status, lpTSCall1Ans0->GetString(LDBIZ_COMM_STATUS_STR));
    v_comm_begin_date = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
    v_comm_end_date = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_END_DATE_INT);
    v_comm_begin_time = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
    v_comm_end_time = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_END_TIME_INT);
    v_comm_comple_date = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
    v_comm_comple_time = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
    v_comm_appr_date = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
    v_comm_appr_time = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
    strcpy(v_comm_appr_status, lpTSCall1Ans0->GetString(LDBIZ_COMM_APPR_STATUS_STR));
    v_comm_appr_oper_no = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_APPR_OPER_NO_INT);
    v_comm_appr_oper = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
    strcpy(v_comm_appr_remark, lpTSCall1Ans0->GetString(LDBIZ_COMM_APPR_REMARK_STR));
    v_external_no = lpTSCall1Ans0->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    strcpy(v_comb_code, lpTSCall1Ans0->GetString(LDBIZ_COMB_CODE_STR));
    strcpy(v_comm_oper_way, lpTSCall1Ans0->GetString(LDBIZ_COMM_OPER_WAY_STR));
    strcpy(v_remark_info, lpTSCall1Ans0->GetString(LDBIZ_REMARK_INFO_STR));
    v_comm_comple_flag = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
    v_update_times = lpTSCall1Ans0->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // set @订单方向# = @指令方向#;
    v_order_dir = v_comm_dir;

    // set @本币币种# = @交易币种#;
    strcpy(v_crncy_type,v_exch_crncy_type);
    //根据订单方向和开平方向确定多空类型
    //调用过程[事务_交易期货_交易_获取多空类型]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.26", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.26]subcall timed out!");
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
    v_lngsht_type = lpTSCall1Ans1->GetInt32(LDBIZ_LNGSHT_TYPE_INT);

    //公共子系统检查

    // set @机构编号# = @操作员机构编号#;
    v_co_no = v_opor_co_no;
    //调用过程[事务_公共_公共接口_检查系统状态查询权限身份市场]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.38", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.38]subcall timed out!");
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
    v_init_date = lpTSCall1Ans2->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans2->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));

    //从产品期货的持仓表中获得交易组可用数量和资产账户可用
    //调用过程[事务_产品期货_交易接口_检查账户状态获取可用]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdfutuT.6.1", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req3->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req3->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req3->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpTSCall1Req3->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req3->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req3->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req3->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.6.1]subcall timed out!");
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
    v_futu_acco_no = lpTSCall1Ans3->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    strcpy(v_futu_acco, lpTSCall1Ans3->GetString(LDBIZ_FUTU_ACCO_STR));
    v_exgp_avail_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_AVAIL_AMT_FLOAT);
    v_asac_avail_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_AVAIL_AMT_FLOAT);
    v_exgp_avail_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT);
    v_asac_avail_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT);
    v_exgp_long_rece_margin = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT);
    v_exgp_short_rece_margin = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT);
    v_asac_long_rece_margin = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT);
    v_asac_short_rece_margin = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT);
    v_exgp_long_stock_rece_margin = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_LONG_STOCK_RECE_MARGIN_FLOAT);
    v_exgp_short_stock_rece_margin = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_SHORT_STOCK_RECE_MARGIN_FLOAT);

    //平仓需要处理持仓,持仓涉及到昨日收盘价的变化

    // if @开平方向# = 《开平方向-开仓》 then
    if (v_contrc_dir == 1)
    {

      // set @昨结算价#=0;
      v_pre_settle_price=0;
    }
    // else
    else
    {

      //调用过程[事务_公共_公共接口_获取合约编号行情价格]
      //组织事务请求
      if(lpTSCall1Ans4)
      {
        lpTSCall1Ans4->FreeMsg();
        lpTSCall1Ans4=NULL;
      }
      lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pubT.24.501", 0);
      lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
      lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
      lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
      lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
      lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
      lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
      lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
      lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
      lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
      glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
      if(!lpTSCall1Ans4)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.501]subcall timed out!");
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
      v_pre_settle_price = lpTSCall1Ans4->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
      v_up_limit_price = lpTSCall1Ans4->GetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT);
      v_down_limit_price = lpTSCall1Ans4->GetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
      v_last_price = lpTSCall1Ans4->GetDouble(LDBIZ_LAST_PRICE_FLOAT);

    // end if;
    }

    //撤销指令
    //调用过程[事务_交易期货_指令_撤销指令]
    //组织事务请求
    if(lpTSCall1Ans5)
    {
      lpTSCall1Ans5->FreeMsg();
      lpTSCall1Ans5=NULL;
    }
    lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.2", 0);
    lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req5->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req5->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req5->SetString(LDBIZ_CANCEL_INFO_STR,v_cancel_info);
    lpTSCall1Req5->SetInt32(LDBIZ_IS_WITHDRAW_INT,v_is_withdraw);
    lpTSCall1Req5->SetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT,v_exgp_avail_qty);
    lpTSCall1Req5->SetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT,v_asac_avail_qty);
    lpTSCall1Req5->SetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT,v_exgp_long_rece_margin);
    lpTSCall1Req5->SetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT,v_exgp_short_rece_margin);
    lpTSCall1Req5->SetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT,v_asac_long_rece_margin);
    lpTSCall1Req5->SetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT,v_asac_short_rece_margin);
    lpTSCall1Req5->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req5->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
    if(!lpTSCall1Ans5)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.2]subcall timed out!");
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
    v_co_no = lpTSCall1Ans5->GetInt32(LDBIZ_CO_NO_INT);
    v_comm_date = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_batch_no = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_executor = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    strcpy(v_order_id_str, lpTSCall1Ans5->GetString(LDBIZ_ORDER_ID_STR_STR));
    strcpy(v_wtdraw_id_str, lpTSCall1Ans5->GetString(LDBIZ_WTDRAW_ID_STR_STR));

    //主推
    //优化一下，不要再查询
    //调用过程[事务_交易期货_指令_获取指令]
    //组织事务请求
    if(lpTSCall1Ans6)
    {
      lpTSCall1Ans6->FreeMsg();
      lpTSCall1Ans6=NULL;
    }
    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.3", 0);
    lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req6->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
    if(!lpTSCall1Ans6)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.3]subcall timed out!");
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
    v_row_id = lpTSCall1Ans6->GetInt64(LDBIZ_ROW_ID_INT64);
    v_init_date = lpTSCall1Ans6->GetInt32(LDBIZ_INIT_DATE_INT);
    v_co_no = lpTSCall1Ans6->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans6->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans6->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strcpy(v_exch_crncy_type, lpTSCall1Ans6->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_exch_no = lpTSCall1Ans6->GetInt32(LDBIZ_EXCH_NO_INT);
    v_futu_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    v_contrc_code_no = lpTSCall1Ans6->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strcpy(v_contrc_code, lpTSCall1Ans6->GetString(LDBIZ_CONTRC_CODE_STR));
    v_contrc_type = lpTSCall1Ans6->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_asset_type = lpTSCall1Ans6->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_contrc_dir = lpTSCall1Ans6->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpTSCall1Ans6->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_comm_date = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_time = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_TIME_INT);
    v_comm_batch_no = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_opor = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_comm_executor = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_comm_dir = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_DIR_INT);
    v_comm_limit_price = lpTSCall1Ans6->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
    v_limit_actual_price = lpTSCall1Ans6->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
    v_comm_qty = lpTSCall1Ans6->GetDouble(LDBIZ_COMM_QTY_FLOAT);
    v_comm_amt = lpTSCall1Ans6->GetDouble(LDBIZ_COMM_AMT_FLOAT);
    v_order_qty = lpTSCall1Ans6->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_comm_cancel_qty = lpTSCall1Ans6->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans6->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_qty = lpTSCall1Ans6->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_comm_frozen_amt = lpTSCall1Ans6->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
    v_comm_frozen_qty = lpTSCall1Ans6->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
    v_rece_margin = lpTSCall1Ans6->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_capit_reback_days = lpTSCall1Ans6->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans6->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    strcpy(v_strike_status, lpTSCall1Ans6->GetString(LDBIZ_STRIKE_STATUS_STR));
    strcpy(v_comm_status, lpTSCall1Ans6->GetString(LDBIZ_COMM_STATUS_STR));
    v_comm_begin_date = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
    v_comm_end_date = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_END_DATE_INT);
    v_comm_begin_time = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
    v_comm_end_time = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_END_TIME_INT);
    v_comm_comple_date = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
    v_comm_comple_time = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
    v_comm_appr_date = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
    v_comm_appr_time = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
    strcpy(v_comm_appr_status, lpTSCall1Ans6->GetString(LDBIZ_COMM_APPR_STATUS_STR));
    v_comm_appr_oper_no = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_APPR_OPER_NO_INT);
    v_comm_appr_oper = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
    strcpy(v_comm_appr_remark, lpTSCall1Ans6->GetString(LDBIZ_COMM_APPR_REMARK_STR));
    v_external_no = lpTSCall1Ans6->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    strcpy(v_comb_code, lpTSCall1Ans6->GetString(LDBIZ_COMB_CODE_STR));
    strcpy(v_comm_oper_way, lpTSCall1Ans6->GetString(LDBIZ_COMM_OPER_WAY_STR));
    strcpy(v_remark_info, lpTSCall1Ans6->GetString(LDBIZ_REMARK_INFO_STR));
    v_comm_comple_flag = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
    v_update_times = lpTSCall1Ans6->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // [主动推送][futu.comm][期货主推_指令_指令主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.92", 0);
    lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpPubMsg->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_TIME_INT,v_comm_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpPubMsg->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpPubMsg->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpPubMsg->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
    lpPubMsg->SetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT,v_comm_limit_price);
    lpPubMsg->SetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,v_limit_actual_price);
    lpPubMsg->SetDouble(LDBIZ_COMM_QTY_FLOAT,v_comm_qty);
    lpPubMsg->SetDouble(LDBIZ_COMM_AMT_FLOAT,v_comm_amt);
    lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpPubMsg->SetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT,v_comm_cancel_qty);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
    lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT,v_comm_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
    lpPubMsg->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
    lpPubMsg->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
    lpPubMsg->SetString(LDBIZ_STRIKE_STATUS_STR,v_strike_status);
    lpPubMsg->SetString(LDBIZ_COMM_STATUS_STR,v_comm_status);
    lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_DATE_INT,v_comm_begin_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_END_DATE_INT,v_comm_end_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_TIME_INT,v_comm_begin_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_END_TIME_INT,v_comm_end_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_DATE_INT,v_comm_comple_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_TIME_INT,v_comm_comple_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_APPR_DATE_INT,v_comm_appr_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_APPR_TIME_INT,v_comm_appr_time);
    lpPubMsg->SetString(LDBIZ_COMM_APPR_STATUS_STR,v_comm_appr_status);
    lpPubMsg->SetInt32(LDBIZ_COMM_APPR_OPER_INT,v_comm_appr_oper);
    lpPubMsg->SetString(LDBIZ_COMM_APPR_REMARK_STR,v_comm_appr_remark);
    lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpPubMsg->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
    lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_FLAG_INT,v_comm_comple_flag);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("futu.comm", lpPubMsg);

    //主推交易组和资产账户资金
    //调用过程[事务_交易期货_账户_获取交易组资产账户资金]
    //组织事务请求
    if(lpTSCall1Ans7)
    {
      lpTSCall1Ans7->FreeMsg();
      lpTSCall1Ans7=NULL;
    }
    lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.11", 0);
    lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req7->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req7->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req7->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
    if(!lpTSCall1Ans7)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.11]subcall timed out!");
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
    v_exgp_row_id = lpTSCall1Ans7->GetInt64(LDBIZ_EXGP_ROW_ID_INT64);
    v_co_no = lpTSCall1Ans7->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans7->GetInt32(LDBIZ_PD_NO_INT);
    v_exgp_begin_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT);
    v_exgp_curr_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT);
    v_exgp_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
    v_exgp_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
    v_exgp_comm_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
    v_exgp_comm_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
    v_exgp_comm_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
    v_exgp_comm_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
    v_exgp_trade_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
    v_exgp_trade_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
    v_exgp_strike_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
    v_exgp_strike_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
    v_exgp_capt_margin = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_CAPT_MARGIN_FLOAT);
    v_exgp_trade_fee = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_FEE_FLOAT);
    v_exgp_strike_fee = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_STRIKE_FEE_FLOAT);
    v_exgp_close_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_CLOSE_PANDL_FLOAT);
    v_exgp_marked_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_MARKED_PANDL_FLOAT);
    v_exgp_cash_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
    v_asac_row_id = lpTSCall1Ans7->GetInt64(LDBIZ_ASAC_ROW_ID_INT64);
    v_asac_begin_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_BEGIN_AMT_FLOAT);
    v_asac_curr_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_CURR_AMT_FLOAT);
    v_asac_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
    v_asac_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
    v_asac_comm_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
    v_asac_comm_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
    v_asac_comm_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
    v_asac_comm_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
    v_asac_trade_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
    v_asac_trade_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
    v_asac_strike_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
    v_asac_strike_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
    v_asac_capt_margin = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_CAPT_MARGIN_FLOAT);
    v_asac_trade_fee = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_FEE_FLOAT);
    v_asac_strike_fee = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_STRIKE_FEE_FLOAT);
    v_asac_close_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_CLOSE_PANDL_FLOAT);
    v_asac_marked_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_MARKED_PANDL_FLOAT);
    v_asac_cash_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);


    // [主动推送][futu.exgpcapital][期货主推_资金_交易组资金主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.110", 0);
    lpPubMsg->SetInt64(LDBIZ_EXGP_ROW_ID_INT64,v_exgp_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT,v_exgp_begin_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT,v_exgp_curr_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT,v_exgp_comm_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT,v_exgp_comm_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT,v_exgp_comm_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT,v_exgp_comm_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT,v_exgp_trade_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT,v_exgp_trade_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT,v_exgp_strike_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT,v_exgp_strike_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_CAPT_MARGIN_FLOAT,v_exgp_capt_margin);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FEE_FLOAT,v_exgp_trade_fee);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FEE_FLOAT,v_exgp_strike_fee);
    lpPubMsg->SetDouble(LDBIZ_EXGP_CLOSE_PANDL_FLOAT,v_exgp_close_pandl);
    lpPubMsg->SetDouble(LDBIZ_EXGP_MARKED_PANDL_FLOAT,v_exgp_marked_pandl);
    lpPubMsg->SetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT,v_exgp_cash_update_times);
    glpPubSub_Interface->PubTopics("futu.exgpcapital", lpPubMsg);


    // [主动推送][futu.asaccapital][期货主推_资金_资产账户资金主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.111", 0);
    lpPubMsg->SetInt64(LDBIZ_ASAC_ROW_ID_INT64,v_asac_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetDouble(LDBIZ_ASAC_BEGIN_AMT_FLOAT,v_asac_begin_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CURR_AMT_FLOAT,v_asac_curr_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT,v_asac_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT,v_asac_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT,v_asac_comm_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT,v_asac_comm_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT,v_asac_comm_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT,v_asac_comm_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT,v_asac_trade_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT,v_asac_trade_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT,v_asac_strike_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT,v_asac_strike_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CAPT_MARGIN_FLOAT,v_asac_capt_margin);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FEE_FLOAT,v_asac_trade_fee);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FEE_FLOAT,v_asac_strike_fee);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CLOSE_PANDL_FLOAT,v_asac_close_pandl);
    lpPubMsg->SetDouble(LDBIZ_ASAC_MARKED_PANDL_FLOAT,v_asac_marked_pandl);
    lpPubMsg->SetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT,v_asac_cash_update_times);
    glpPubSub_Interface->PubTopics("futu.asaccapital", lpPubMsg);

    //主推交易组和资产账户持仓
    //调用过程[事务_交易期货_账户_获取交易组资产账户持仓]
    //组织事务请求
    if(lpTSCall1Ans8)
    {
      lpTSCall1Ans8->FreeMsg();
      lpTSCall1Ans8=NULL;
    }
    lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.12", 0);
    lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req8->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req8->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req8->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req8->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req8->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpTSCall1Req8->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
    if(!lpTSCall1Ans8)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.12]subcall timed out!");
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
    v_exgp_row_id = lpTSCall1Ans8->GetInt64(LDBIZ_EXGP_ROW_ID_INT64);
    v_co_no = lpTSCall1Ans8->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans8->GetInt32(LDBIZ_PD_NO_INT);
    strcpy(v_exch_crncy_type, lpTSCall1Ans8->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_contrc_type = lpTSCall1Ans8->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_unit = lpTSCall1Ans8->GetInt32(LDBIZ_CONTRC_UNIT_INT);
    strcpy(v_comb_code, lpTSCall1Ans8->GetString(LDBIZ_COMB_CODE_STR));
    v_exgp_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
    v_exgp_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
    v_exgp_comm_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
    v_exgp_trade_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
    v_exgp_strike_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
    v_exgp_old_comm_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_OLD_COMM_CAPT_QTY_FLOAT);
    v_exgp_today_comm_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TODAY_COMM_CAPT_QTY_FLOAT);
    v_exgp_old_trade_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_OLD_TRADE_CAPT_QTY_FLOAT);
    v_exgp_today_trade_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TODAY_TRADE_CAPT_QTY_FLOAT);
    v_exgp_pre_strike_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_PRE_STRIKE_CAPT_QTY_FLOAT);
    v_exgp_today_strike_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TODAY_STRIKE_CAPT_QTY_FLOAT);
    v_exgp_rece_margin = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_RECE_MARGIN_FLOAT);
    v_pre_settle_price = lpTSCall1Ans8->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
    v_exgp_realize_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
    v_exgp_open_amount = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_OPEN_AMOUNT_FLOAT);
    v_exgp_posi_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
    v_asac_row_id = lpTSCall1Ans8->GetInt64(LDBIZ_ASAC_ROW_ID_INT64);
    v_asac_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
    v_asac_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
    v_asac_comm_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
    v_asac_trade_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
    v_asac_strike_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
    v_asac_old_comm_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_OLD_COMM_CAPT_QTY_FLOAT);
    v_asac_today_comm_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TODAY_COMM_CAPT_QTY_FLOAT);
    v_asac_old_trade_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_OLD_TRADE_CAPT_QTY_FLOAT);
    v_asac_today_trade_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TODAY_TRADE_CAPT_QTY_FLOAT);
    v_asac_pre_strike_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_PRE_STRIKE_CAPT_QTY_FLOAT);
    v_asac_today_strike_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TODAY_STRIKE_CAPT_QTY_FLOAT);
    v_asac_rece_margin = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_RECE_MARGIN_FLOAT);
    v_asac_realize_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
    v_asac_open_amount = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_OPEN_AMOUNT_FLOAT);
    v_asac_posi_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


    // [主动推送][futu.exgpposi][期货主推_持仓_交易组持仓主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.130", 0);
    lpPubMsg->SetInt64(LDBIZ_EXGP_ROW_ID_INT64,v_exgp_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpPubMsg->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpPubMsg->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_OLD_COMM_CAPT_QTY_FLOAT,v_exgp_old_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TODAY_COMM_CAPT_QTY_FLOAT,v_exgp_today_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_OLD_TRADE_CAPT_QTY_FLOAT,v_exgp_old_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TODAY_TRADE_CAPT_QTY_FLOAT,v_exgp_today_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_PRE_STRIKE_CAPT_QTY_FLOAT,v_exgp_pre_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TODAY_STRIKE_CAPT_QTY_FLOAT,v_exgp_today_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_RECE_MARGIN_FLOAT,v_exgp_rece_margin);
    lpPubMsg->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
    lpPubMsg->SetDouble(LDBIZ_EXGP_OPEN_AMOUNT_FLOAT,v_exgp_open_amount);
    lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
    glpPubSub_Interface->PubTopics("futu.exgpposi", lpPubMsg);


    // [主动推送][futu.asacposi][期货主推_持仓_资产账户持仓主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.131", 0);
    lpPubMsg->SetInt64(LDBIZ_ASAC_ROW_ID_INT64,v_asac_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpPubMsg->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpPubMsg->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_OLD_COMM_CAPT_QTY_FLOAT,v_asac_old_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TODAY_COMM_CAPT_QTY_FLOAT,v_asac_today_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_OLD_TRADE_CAPT_QTY_FLOAT,v_asac_old_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TODAY_TRADE_CAPT_QTY_FLOAT,v_asac_today_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_PRE_STRIKE_CAPT_QTY_FLOAT,v_asac_pre_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TODAY_STRIKE_CAPT_QTY_FLOAT,v_asac_today_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_RECE_MARGIN_FLOAT,v_asac_rece_margin);
    lpPubMsg->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
    lpPubMsg->SetDouble(LDBIZ_ASAC_OPEN_AMOUNT_FLOAT,v_asac_open_amount);
    lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
    glpPubSub_Interface->PubTopics("futu.asacposi", lpPubMsg);


    // if @指令批号# >0 then
    if (v_comm_batch_no >0)
    {
        //调用过程[事务_交易期货_指令_获取指令汇总]
        //组织事务请求
        if(lpTSCall1Ans9)
        {
          lpTSCall1Ans9->FreeMsg();
          lpTSCall1Ans9=NULL;
        }
        lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.4", 0);
        lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req9->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
        lpTSCall1Req9->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpTSCall1Req9->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req9->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
        glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
        if(!lpTSCall1Ans9)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.4]subcall timed out!");
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
        v_row_id = lpTSCall1Ans9->GetInt64(LDBIZ_ROW_ID_INT64);
        v_init_date = lpTSCall1Ans9->GetInt32(LDBIZ_INIT_DATE_INT);
        v_pd_no = lpTSCall1Ans9->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans9->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans9->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        strcpy(v_exch_crncy_type, lpTSCall1Ans9->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans9->GetInt32(LDBIZ_EXCH_NO_INT);
        v_futu_acco_no = lpTSCall1Ans9->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
        v_contrc_code_no = lpTSCall1Ans9->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans9->GetString(LDBIZ_CONTRC_CODE_STR));
        v_contrc_type = lpTSCall1Ans9->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_asset_type = lpTSCall1Ans9->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_dir = lpTSCall1Ans9->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans9->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_comm_time = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_TIME_INT);
        v_comm_opor = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_OPOR_INT);
        v_comm_dir = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_DIR_INT);
        v_comm_limit_price = lpTSCall1Ans9->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
        v_limit_actual_price = lpTSCall1Ans9->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
        v_comm_qty = lpTSCall1Ans9->GetDouble(LDBIZ_COMM_QTY_FLOAT);
        v_comm_amt = lpTSCall1Ans9->GetDouble(LDBIZ_COMM_AMT_FLOAT);
        v_order_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_comm_cancel_qty = lpTSCall1Ans9->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
        v_comm_await_cancel_qty = lpTSCall1Ans9->GetDouble(LDBIZ_COMM_AWAIT_CANCEL_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans9->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_strike_qty = lpTSCall1Ans9->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        strcpy(v_strike_status, lpTSCall1Ans9->GetString(LDBIZ_STRIKE_STATUS_STR));
        strcpy(v_comm_sum_status, lpTSCall1Ans9->GetString(LDBIZ_COMM_SUM_STATUS_STR));
        v_comm_begin_date = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
        v_comm_end_date = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_END_DATE_INT);
        v_comm_begin_time = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
        v_comm_end_time = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_END_TIME_INT);
        v_comm_comple_date = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
        v_comm_comple_time = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
        v_max_comm_comple_date = lpTSCall1Ans9->GetInt32(LDBIZ_MAX_COMM_COMPLE_DATE_INT);
        v_max_comm_comple_time = lpTSCall1Ans9->GetInt32(LDBIZ_MAX_COMM_COMPLE_TIME_INT);
        v_comm_appr_date = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
        v_comm_appr_time = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
        v_comm_appr_qty = lpTSCall1Ans9->GetDouble(LDBIZ_COMM_APPR_QTY_FLOAT);
        strcpy(v_comm_sum_approve_status, lpTSCall1Ans9->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
        v_buy_order_qty = lpTSCall1Ans9->GetDouble(LDBIZ_BUY_ORDER_QTY_FLOAT);
        v_sell_order_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SELL_ORDER_QTY_FLOAT);
        v_buy_comm_qty = lpTSCall1Ans9->GetDouble(LDBIZ_BUY_COMM_QTY_FLOAT);
        v_sell_comm_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SELL_COMM_QTY_FLOAT);
        v_buy_strike_qty = lpTSCall1Ans9->GetDouble(LDBIZ_BUY_STRIKE_QTY_FLOAT);
        v_sell_strike_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SELL_STRIKE_QTY_FLOAT);
        v_buy_strike_amt = lpTSCall1Ans9->GetDouble(LDBIZ_BUY_STRIKE_AMT_FLOAT);
        v_sell_strike_amt = lpTSCall1Ans9->GetDouble(LDBIZ_SELL_STRIKE_AMT_FLOAT);
        v_buy_comm_amt = lpTSCall1Ans9->GetDouble(LDBIZ_BUY_COMM_AMT_FLOAT);
        v_sell_comm_amt = lpTSCall1Ans9->GetDouble(LDBIZ_SELL_COMM_AMT_FLOAT);
        v_rece_margin = lpTSCall1Ans9->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_comm_oper_way, lpTSCall1Ans9->GetString(LDBIZ_COMM_OPER_WAY_STR));
        v_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_UPDATE_TIMES_INT);


        // [主动推送][futu.commtotal][期货主推_指令_指令汇总主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.93", 0);
        lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
        lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
        lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
        lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
        lpPubMsg->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_TIME_INT,v_comm_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpPubMsg->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
        lpPubMsg->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
        lpPubMsg->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
        lpPubMsg->SetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT,v_comm_limit_price);
        lpPubMsg->SetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,v_limit_actual_price);
        lpPubMsg->SetDouble(LDBIZ_COMM_QTY_FLOAT,v_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_AMT_FLOAT,v_comm_amt);
        lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT,v_comm_cancel_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_AWAIT_CANCEL_QTY_FLOAT,v_comm_await_cancel_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT,v_comm_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
        lpPubMsg->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
        lpPubMsg->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
        lpPubMsg->SetString(LDBIZ_STRIKE_STATUS_STR,v_strike_status);
        lpPubMsg->SetString(LDBIZ_COMM_SUM_STATUS_STR,v_comm_sum_status);
        lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_DATE_INT,v_comm_begin_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_END_DATE_INT,v_comm_end_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_TIME_INT,v_comm_begin_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_END_TIME_INT,v_comm_end_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_DATE_INT,v_comm_comple_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_TIME_INT,v_comm_comple_time);
        lpPubMsg->SetInt32(LDBIZ_MAX_COMM_COMPLE_DATE_INT,v_max_comm_comple_date);
        lpPubMsg->SetInt32(LDBIZ_MAX_COMM_COMPLE_TIME_INT,v_max_comm_comple_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_APPR_DATE_INT,v_comm_appr_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_APPR_TIME_INT,v_comm_appr_time);
        lpPubMsg->SetDouble(LDBIZ_COMM_APPR_QTY_FLOAT,v_comm_appr_qty);
        lpPubMsg->SetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR,v_comm_sum_approve_status);
        lpPubMsg->SetDouble(LDBIZ_BUY_ORDER_QTY_FLOAT,v_buy_order_qty);
        lpPubMsg->SetDouble(LDBIZ_SELL_ORDER_QTY_FLOAT,v_sell_order_qty);
        lpPubMsg->SetDouble(LDBIZ_BUY_COMM_QTY_FLOAT,v_buy_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_SELL_COMM_QTY_FLOAT,v_sell_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_BUY_STRIKE_QTY_FLOAT,v_buy_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_SELL_STRIKE_QTY_FLOAT,v_sell_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_BUY_STRIKE_AMT_FLOAT,v_buy_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_SELL_STRIKE_AMT_FLOAT,v_sell_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_BUY_COMM_AMT_FLOAT,v_buy_comm_amt);
        lpPubMsg->SetDouble(LDBIZ_SELL_COMM_AMT_FLOAT,v_sell_comm_amt);
        lpPubMsg->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("futu.commtotal", lpPubMsg);

    // end if;
    }

    //订单主推

    // if @是否撤单#=《是否撤单-是》 and @订单序号串# <> "" then
    if (v_is_withdraw==1 && strcmp(v_order_id_str , "")!=0)
    {
      //调用过程[事务_交易期货_交易_根据订单序号串查询订单结果集]
      //组织事务请求
      if(lpTSCall1Ans10)
      {
        lpTSCall1Ans10->FreeMsg();
        lpTSCall1Ans10=NULL;
      }
      lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.17", 0);
      lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
      lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
      lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
      lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
      lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
      lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
      lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
      lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
      lpTSCall1Req10->SetString(LDBIZ_ORDER_ID_STR_STR,v_order_id_str);
      glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
      if(!lpTSCall1Ans10)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.17]subcall timed out!");
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


      // [获取结果集][lpMainMsg]
      lpMainMsg=lpTSCall1Ans10->GetGroup(LDTAG_NO_RESULTSET);


      // [遍历结果集开始][lpMainMsg]
      iRecordCount = lpMainMsg->GetRecordCount();
      for (int i = 0; i < iRecordCount;i++) 
      {
          IRecord* lpRecord =lpMainMsg->GetRecord(i);
          if(lpRecord)
          {

              //获取记录字段值
              v_row_id = lpRecord->GetInt64(LDBIZ_ROW_ID_INT64);
              v_opor_co_no = lpRecord->GetInt32(LDBIZ_OPOR_CO_NO_INT);
              v_opor_no = lpRecord->GetInt32(LDBIZ_OPOR_NO_INT);
              strcpy(v_oper_mac, lpRecord->GetString(LDBIZ_OPER_MAC_STR));
              strcpy(v_oper_ip_addr, lpRecord->GetString(LDBIZ_OPER_IP_ADDR_STR));
              strcpy(v_oper_info, lpRecord->GetString(LDBIZ_OPER_INFO_STR));
              strcpy(v_oper_way, lpRecord->GetString(LDBIZ_OPER_WAY_STR));
              v_init_date = lpRecord->GetInt32(LDBIZ_INIT_DATE_INT);
              v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
              v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
              v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
              v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
              strcpy(v_out_acco, lpRecord->GetString(LDBIZ_OUT_ACCO_STR));
              v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
              v_pass_no = lpRecord->GetInt32(LDBIZ_PASS_NO_INT);
              v_futu_acco_no = lpRecord->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
              v_contrc_code_no = lpRecord->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
              v_asset_type = lpRecord->GetInt32(LDBIZ_ASSET_TYPE_INT);
              v_contrc_type = lpRecord->GetInt32(LDBIZ_CONTRC_TYPE_INT);
              v_contrc_unit = lpRecord->GetInt32(LDBIZ_CONTRC_UNIT_INT);
              v_external_no = lpRecord->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
              v_report_date = lpRecord->GetInt32(LDBIZ_REPORT_DATE_INT);
              v_report_time = lpRecord->GetInt32(LDBIZ_REPORT_TIME_INT);
              strcpy(v_report_no, lpRecord->GetString(LDBIZ_REPORT_NO_STR));
              v_order_date = lpRecord->GetInt32(LDBIZ_ORDER_DATE_INT);
              v_order_time = lpRecord->GetInt32(LDBIZ_ORDER_TIME_INT);
              v_order_dir = lpRecord->GetInt32(LDBIZ_ORDER_DIR_INT);
              v_order_batch_no = lpRecord->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
              v_contrc_dir = lpRecord->GetInt32(LDBIZ_CONTRC_DIR_INT);
              v_hedge_type = lpRecord->GetInt32(LDBIZ_HEDGE_TYPE_INT);
              v_order_price = lpRecord->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
              v_order_qty = lpRecord->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
              strcpy(v_order_status, lpRecord->GetString(LDBIZ_ORDER_STATUS_STR));
              v_wtdraw_qty = lpRecord->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
              v_strike_qty = lpRecord->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
              v_strike_price = lpRecord->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
              v_strike_amt = lpRecord->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
              v_trade_fee = lpRecord->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
              v_trade_commis = lpRecord->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
              v_other_commis = lpRecord->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
              v_strike_commis = lpRecord->GetDouble(LDBIZ_STRIKE_COMMIS_FLOAT);
              v_strike_other_commis = lpRecord->GetDouble(LDBIZ_STRIKE_OTHER_COMMIS_FLOAT);
              v_strike_all_fee = lpRecord->GetDouble(LDBIZ_STRIKE_ALL_FEE_FLOAT);
              v_report_fee = lpRecord->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
              v_wtdraw_fee = lpRecord->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
              v_rece_margin = lpRecord->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
              v_trade_occur_amt = lpRecord->GetDouble(LDBIZ_TRADE_OCCUR_AMT_FLOAT);
              strcpy(v_comb_code, lpRecord->GetString(LDBIZ_COMB_CODE_STR));
              v_margin_ratio = lpRecord->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);
              strcpy(v_rsp_info, lpRecord->GetString(LDBIZ_RSP_INFO_STR));
              v_compli_trig_id = lpRecord->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);
              strcpy(v_order_oper_way, lpRecord->GetString(LDBIZ_ORDER_OPER_WAY_STR));
              v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


          // [主动推送][futu.order][期货主推_订单_订单主推消息]
          lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.90", 0);
          lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
          lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
          lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
          lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
          lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
          lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
          lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
          lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
          lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
          lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
          lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
          lpPubMsg->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
          lpPubMsg->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
          lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
          lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
          lpPubMsg->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
          lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
          lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
          lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
          lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
          lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
          lpPubMsg->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
          lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
          lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
          lpPubMsg->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
          lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
          lpPubMsg->SetDouble(LDBIZ_TRADE_FEE_FLOAT,v_trade_fee);
          lpPubMsg->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
          lpPubMsg->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
          lpPubMsg->SetDouble(LDBIZ_REPORT_FEE_FLOAT,v_report_fee);
          lpPubMsg->SetDouble(LDBIZ_WTDRAW_FEE_FLOAT,v_wtdraw_fee);
          lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
          lpPubMsg->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
          lpPubMsg->SetDouble(LDBIZ_MARGIN_RATIO_FLOAT,v_margin_ratio);
          lpPubMsg->SetString(LDBIZ_RSP_INFO_STR,v_rsp_info);
          lpPubMsg->SetInt64(LDBIZ_COMPLI_TRIG_ID_INT64,v_compli_trig_id);
          lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
          lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
          lpPubMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
          lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
          lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
          glpPubSub_Interface->PubTopics("futu.order", lpPubMsg);


          // if   @订单批号# > 0 then
          if (  v_order_batch_no > 0)
          {
              //调用过程[事务_交易期货_交易_获取订单汇总]
              //组织事务请求
              if(lpTSCall1Ans11)
              {
                lpTSCall1Ans11->FreeMsg();
                lpTSCall1Ans11=NULL;
              }
              lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.19", 0);
              lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
              lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
              lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
              lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
              lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
              lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
              lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
              lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
              lpTSCall1Req11->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
              lpTSCall1Req11->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
              lpTSCall1Req11->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
              glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
              if(!lpTSCall1Ans11)  //  超时错误
              {
                  lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                  lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.19]subcall timed out!");
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
              v_row_id = lpTSCall1Ans11->GetInt64(LDBIZ_ROW_ID_INT64);
              strcpy(v_oper_func_code, lpTSCall1Ans11->GetString(LDBIZ_OPER_FUNC_CODE_STR));
              v_init_date = lpTSCall1Ans11->GetInt32(LDBIZ_INIT_DATE_INT);
              v_pd_no = lpTSCall1Ans11->GetInt32(LDBIZ_PD_NO_INT);
              v_exch_group_no = lpTSCall1Ans11->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
              v_asset_acco_no = lpTSCall1Ans11->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
              v_pass_no = lpTSCall1Ans11->GetInt32(LDBIZ_PASS_NO_INT);
              strcpy(v_crncy_type, lpTSCall1Ans11->GetString(LDBIZ_CRNCY_TYPE_STR));
              v_exch_no = lpTSCall1Ans11->GetInt32(LDBIZ_EXCH_NO_INT);
              v_contrc_code_no = lpTSCall1Ans11->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
              strcpy(v_contrc_code, lpTSCall1Ans11->GetString(LDBIZ_CONTRC_CODE_STR));
              v_asset_type = lpTSCall1Ans11->GetInt32(LDBIZ_ASSET_TYPE_INT);
              v_contrc_type = lpTSCall1Ans11->GetInt32(LDBIZ_CONTRC_TYPE_INT);
              v_contrc_unit = lpTSCall1Ans11->GetInt32(LDBIZ_CONTRC_UNIT_INT);
              v_external_no = lpTSCall1Ans11->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
              v_order_dir = lpTSCall1Ans11->GetInt32(LDBIZ_ORDER_DIR_INT);
              v_contrc_dir = lpTSCall1Ans11->GetInt32(LDBIZ_CONTRC_DIR_INT);
              v_hedge_type = lpTSCall1Ans11->GetInt32(LDBIZ_HEDGE_TYPE_INT);
              v_order_price = lpTSCall1Ans11->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
              v_order_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
              strcpy(v_order_sum_status, lpTSCall1Ans11->GetString(LDBIZ_ORDER_SUM_STATUS_STR));
              v_wtdraw_qty = lpTSCall1Ans11->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
              v_waste_qty = lpTSCall1Ans11->GetDouble(LDBIZ_WASTE_QTY_FLOAT);
              v_strike_qty = lpTSCall1Ans11->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
              v_strike_aver_price = lpTSCall1Ans11->GetDouble(LDBIZ_STRIKE_AVER_PRICE_FLOAT);
              v_strike_amt = lpTSCall1Ans11->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
              v_trade_fee = lpTSCall1Ans11->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
              v_trade_commis = lpTSCall1Ans11->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
              v_other_commis = lpTSCall1Ans11->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
              v_strike_commis = lpTSCall1Ans11->GetDouble(LDBIZ_STRIKE_COMMIS_FLOAT);
              v_strike_other_commis = lpTSCall1Ans11->GetDouble(LDBIZ_STRIKE_OTHER_COMMIS_FLOAT);
              v_report_fee = lpTSCall1Ans11->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
              v_wtdraw_fee = lpTSCall1Ans11->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
              v_strike_all_fee = lpTSCall1Ans11->GetDouble(LDBIZ_STRIKE_ALL_FEE_FLOAT);
              v_rece_margin = lpTSCall1Ans11->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
              strcpy(v_order_oper_way, lpTSCall1Ans11->GetString(LDBIZ_ORDER_OPER_WAY_STR));
              v_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_UPDATE_TIMES_INT);


              // [主动推送][futu.ordertotal][期货主推_订单_订单汇总主推消息]
              lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.91", 0);
              lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
              lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
              lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
              lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
              lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
              lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
              lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
              lpPubMsg->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
              lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
              lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
              lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
              lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
              lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
              lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
              lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
              lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
              lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
              lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
              lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
              lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
              lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
              lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
              lpPubMsg->SetString(LDBIZ_ORDER_SUM_STATUS_STR,v_order_sum_status);
              lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
              lpPubMsg->SetDouble(LDBIZ_WASTE_QTY_FLOAT,v_waste_qty);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_AVER_PRICE_FLOAT,v_strike_aver_price);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
              lpPubMsg->SetDouble(LDBIZ_TRADE_FEE_FLOAT,v_trade_fee);
              lpPubMsg->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
              lpPubMsg->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_COMMIS_FLOAT,v_strike_commis);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_OTHER_COMMIS_FLOAT,v_strike_other_commis);
              lpPubMsg->SetDouble(LDBIZ_REPORT_FEE_FLOAT,v_report_fee);
              lpPubMsg->SetDouble(LDBIZ_WTDRAW_FEE_FLOAT,v_wtdraw_fee);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_ALL_FEE_FLOAT,v_strike_all_fee);
              lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
              lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
              lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
              glpPubSub_Interface->PubTopics("futu.ordertotal", lpPubMsg);

          // end if;
          }


      // [遍历结果集结束][lpMainMsg]
          }
      }

    // end if;
    }

    //撤单主推

    // if @是否撤单#=《是否撤单-是》 and @撤单序号串# <> "" then
    if (v_is_withdraw==1 && strcmp(v_wtdraw_id_str , "")!=0)
    {

        // set @订单序号串# = @撤单序号串#;
        strcpy(v_order_id_str,v_wtdraw_id_str);
        //调用过程[事务_交易期货_交易_根据订单序号串查询撤单结果集]
        //组织事务请求
        if(lpTSCall1Ans12)
        {
          lpTSCall1Ans12->FreeMsg();
          lpTSCall1Ans12=NULL;
        }
        lpTSCall1Req12=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.18", 0);
        lpTSCall1Req12->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req12->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req12->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req12->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req12->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req12->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req12->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req12->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req12->SetString(LDBIZ_ORDER_ID_STR_STR,v_order_id_str);
        glpTSSubcallSerives->SubCall(lpTSCall1Req12, &lpTSCall1Ans12, 5000);
        if(!lpTSCall1Ans12)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.18]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans12->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans12->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans12->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans12->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans12->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans12->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans12->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans12->GetString(LDBIZ_ERROR_INFO_STR));


        // [获取结果集][lpMainMsg2]
        lpMainMsg2=lpTSCall1Ans12->GetGroup(LDTAG_NO_RESULTSET);


        // [遍历结果集开始][lpMainMsg2]
        iRecordCount = lpMainMsg2->GetRecordCount();
        for (int i = 0; i < iRecordCount;i++) 
        {
            IRecord* lpRecord =lpMainMsg2->GetRecord(i);
            if(lpRecord)
            {

                //获取记录字段值
                v_row_id = lpRecord->GetInt64(LDBIZ_ROW_ID_INT64);
                v_opor_co_no = lpRecord->GetInt32(LDBIZ_OPOR_CO_NO_INT);
                v_opor_no = lpRecord->GetInt32(LDBIZ_OPOR_NO_INT);
                strcpy(v_oper_mac, lpRecord->GetString(LDBIZ_OPER_MAC_STR));
                strcpy(v_oper_ip_addr, lpRecord->GetString(LDBIZ_OPER_IP_ADDR_STR));
                strcpy(v_oper_info, lpRecord->GetString(LDBIZ_OPER_INFO_STR));
                strcpy(v_oper_way, lpRecord->GetString(LDBIZ_OPER_WAY_STR));
                strcpy(v_oper_func_code, lpRecord->GetString(LDBIZ_OPER_FUNC_CODE_STR));
                v_init_date = lpRecord->GetInt32(LDBIZ_INIT_DATE_INT);
                v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
                v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
                v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
                v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
                v_pass_no = lpRecord->GetInt32(LDBIZ_PASS_NO_INT);
                strcpy(v_out_acco, lpRecord->GetString(LDBIZ_OUT_ACCO_STR));
                strcpy(v_crncy_type, lpRecord->GetString(LDBIZ_CRNCY_TYPE_STR));
                v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
                v_futu_acco_no = lpRecord->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
                strcpy(v_futu_acco, lpRecord->GetString(LDBIZ_FUTU_ACCO_STR));
                v_contrc_code_no = lpRecord->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
                strcpy(v_contrc_code, lpRecord->GetString(LDBIZ_CONTRC_CODE_STR));
                v_external_no = lpRecord->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
                v_wtdraw_batch_no = lpRecord->GetInt32(LDBIZ_WTDRAW_BATCH_NO_INT);
                v_wtdraw_date = lpRecord->GetInt32(LDBIZ_WTDRAW_DATE_INT);
                v_wtdraw_time = lpRecord->GetInt32(LDBIZ_WTDRAW_TIME_INT);
                v_order_date = lpRecord->GetInt32(LDBIZ_ORDER_DATE_INT);
                v_order_id = lpRecord->GetInt64(LDBIZ_ORDER_ID_INT64);
                v_report_date = lpRecord->GetInt32(LDBIZ_REPORT_DATE_INT);
                v_report_time = lpRecord->GetInt32(LDBIZ_REPORT_TIME_INT);
                strcpy(v_report_no, lpRecord->GetString(LDBIZ_REPORT_NO_STR));
                strcpy(v_wtdraw_status, lpRecord->GetString(LDBIZ_WTDRAW_STATUS_STR));
                v_wtdraw_qty = lpRecord->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
                strcpy(v_wtdraw_remark, lpRecord->GetString(LDBIZ_WTDRAW_REMARK_STR));
                v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


            // if @撤单状态# <> 《撤单状态-成功》 then
            if (strcmp(v_wtdraw_status , "3")!=0)
            {

                    // [主动推送][futu.rptwtdraw][期货主推_报盘_撤单主推报盘消息]
                    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.102", 0);
                    lpPubMsg->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                    lpPubMsg->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                    lpPubMsg->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                    lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                    lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
                    lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
                    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                    lpPubMsg->SetString(LDBIZ_FUTU_ACCO_STR,v_futu_acco);
                    lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
                    lpPubMsg->SetInt32(LDBIZ_WTDRAW_DATE_INT,v_wtdraw_date);
                    lpPubMsg->SetInt32(LDBIZ_WTDRAW_TIME_INT,v_wtdraw_time);
                    lpPubMsg->SetString(LDBIZ_WTDRAW_STATUS_STR,v_wtdraw_status);
                    lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
                    lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
                    lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
                    glpPubSub_Interface->PubTopics("futu.rptwtdraw", lpPubMsg);

            // end if;
            }


        // [遍历结果集结束][lpMainMsg2]
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
        if(lpTSCall1Ans13)
        {
          lpTSCall1Ans13->FreeMsg();
          lpTSCall1Ans13=NULL;
        }
        lpTSCall1Req13=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req13->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req13->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req13->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req13->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req13->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req13->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req13->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req13->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req13->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req13->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req13, &lpTSCall1Ans13, 5000);
        if (lpTSCall1Ans13)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans13->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans13->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans13->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans13->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans13->GetString(LDBIZ_ERROR_DEAL_STR));
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
    if(lpTSCall1Ans13)
        lpTSCall1Ans13->FreeMsg();
    return iRet;
}

//逻辑_交易期货_指令_修改指令
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
    int64 v_comm_id;
    double v_comm_limit_price;
    double v_limit_actual_price;
    double v_comm_qty;
    double v_comm_amt;
    int v_comm_begin_date;
    int v_comm_end_date;
    int v_comm_begin_time;
    int v_comm_end_time;
    char v_modi_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    double v_tmp_comm_qty;
    double v_tmp_comm_amt;
    double v_tmp_comm_limit_price;
    double v_tmp_limit_actual_price;
    int v_tmp_comm_begin_date;
    int v_tmp_comm_end_date;
    int v_tmp_comm_begin_time;
    int v_tmp_comm_end_time;
    int64 v_row_id;
    int v_init_date;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    char v_exch_crncy_type[4];
    int v_exch_no;
    int v_futu_acco_no;
    int v_contrc_code_no;
    char v_contrc_code[7];
    int v_contrc_type;
    int v_asset_type;
    int v_contrc_dir;
    int v_hedge_type;
    int v_comm_date;
    int v_comm_time;
    int v_comm_batch_no;
    int v_comm_opor;
    int v_comm_executor;
    int v_comm_dir;
    double v_order_qty;
    double v_comm_cancel_qty;
    double v_strike_amt;
    double v_strike_qty;
    double v_comm_frozen_amt;
    double v_comm_frozen_qty;
    double v_rece_margin;
    int v_capit_reback_days;
    int v_posi_reback_days;
    char v_strike_status[3];
    char v_comm_status[3];
    int v_comm_comple_date;
    int v_comm_comple_time;
    int v_comm_appr_date;
    int v_comm_appr_time;
    char v_comm_appr_status[3];
    int v_comm_appr_oper_no;
    int v_comm_appr_oper;
    char v_comm_appr_remark[256];
    int64 v_external_no;
    char v_comb_code[7];
    char v_comm_oper_way[3];
    char v_remark_info[256];
    int v_comm_comple_flag;
    int v_update_times;
    int v_order_dir;
    int v_lngsht_type;
    double v_comm_occur_qty;
    double v_order_price;
    int v_price_type;
    char v_co_busi_config_str[65];
    char v_exgp_busi_config_str[65];
    char v_crncy_type[4];
    int v_contrc_unit;
    int v_co_comm_appr_oper;
    char v_sys_config_str[65];
    char v_busi_config_str[65];
    char v_busi_ctrl_str[65];
    char v_asac_busi_config_str[65];
    char v_split_fee_typr_str[65];
    char v_busi_limit_str[2049];
    int v_pass_no;
    char v_out_acco[33];
    int v_exter_comm_flag;
    double v_market_price_ratio;
    double v_comm_no_limit_price_ratio;
    int v_cost_calc_type;
    int v_comm_appr_set;
    int v_appr_allow_order_flag;
    char v_opor_no_str1[2049];
    char v_opor_no_str2[2049];
    char v_opor_no_str3[2049];
    int v_sys_type;
    char v_futu_acco[17];
    double v_exgp_avail_amt;
    double v_asac_avail_amt;
    double v_exgp_avail_qty;
    double v_asac_avail_qty;
    double v_exgp_long_rece_margin;
    double v_exgp_short_rece_margin;
    double v_asac_long_rece_margin;
    double v_asac_short_rece_margin;
    double v_exgp_long_stock_rece_margin;
    double v_exgp_short_stock_rece_margin;
    double v_trade_commis;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_deli_fee;
    double v_other_fee;
    double v_other_commis;
    double v_all_fee;
    int v_margin_pref;
    double v_margin_ratio;
    double v_trade_fee;
    double v_pre_settle_price;
    double v_up_limit_price;
    double v_down_limit_price;
    double v_last_price;
    double v_pre_limit_actual_price;
    int v_trig_stage_type;
    int64 v_compli_trig_id;
    double v_comm_occur_amt;
    char v_order_id_str[2049];
    char v_wtdraw_id_str[2049];
    int64 v_exgp_row_id;
    double v_exgp_begin_amt;
    double v_exgp_curr_amt;
    double v_exgp_frozen_amt;
    double v_exgp_unfroz_amt;
    double v_exgp_comm_frozen_amt;
    double v_exgp_comm_unfroz_amt;
    double v_exgp_comm_capt_amt;
    double v_exgp_comm_releas_amt;
    double v_exgp_trade_capt_amt;
    double v_exgp_trade_releas_amt;
    double v_exgp_strike_capt_amt;
    double v_exgp_strike_releas_amt;
    double v_exgp_capt_margin;
    double v_exgp_trade_fee;
    double v_exgp_strike_fee;
    double v_exgp_close_pandl;
    double v_exgp_marked_pandl;
    int v_exgp_cash_update_times;
    int64 v_asac_row_id;
    double v_asac_begin_amt;
    double v_asac_curr_amt;
    double v_asac_frozen_amt;
    double v_asac_unfroz_amt;
    double v_asac_comm_frozen_amt;
    double v_asac_comm_unfroz_amt;
    double v_asac_comm_capt_amt;
    double v_asac_comm_releas_amt;
    double v_asac_trade_capt_amt;
    double v_asac_trade_releas_amt;
    double v_asac_strike_capt_amt;
    double v_asac_strike_releas_amt;
    double v_asac_capt_margin;
    double v_asac_trade_fee;
    double v_asac_strike_fee;
    double v_asac_close_pandl;
    double v_asac_marked_pandl;
    int v_asac_cash_update_times;
    double v_exgp_frozen_qty;
    double v_exgp_unfroz_qty;
    double v_exgp_comm_releas_qty;
    double v_exgp_trade_releas_qty;
    double v_exgp_strike_releas_qty;
    double v_exgp_old_comm_capt_qty;
    double v_exgp_today_comm_capt_qty;
    double v_exgp_old_trade_capt_qty;
    double v_exgp_today_trade_capt_qty;
    double v_exgp_pre_strike_capt_qty;
    double v_exgp_today_strike_capt_qty;
    double v_exgp_rece_margin;
    double v_exgp_realize_pandl;
    double v_exgp_open_amount;
    int v_exgp_posi_update_times;
    double v_asac_frozen_qty;
    double v_asac_unfroz_qty;
    double v_asac_comm_releas_qty;
    double v_asac_trade_releas_qty;
    double v_asac_strike_releas_qty;
    double v_asac_old_comm_capt_qty;
    double v_asac_today_comm_capt_qty;
    double v_asac_old_trade_capt_qty;
    double v_asac_today_trade_capt_qty;
    double v_asac_pre_strike_capt_qty;
    double v_asac_today_strike_capt_qty;
    double v_asac_rece_margin;
    double v_asac_realize_pandl;
    double v_asac_open_amount;
    int v_asac_posi_update_times;
    double v_comm_await_cancel_qty;
    char v_comm_sum_status[3];
    int v_max_comm_comple_date;
    int v_max_comm_comple_time;
    double v_comm_appr_qty;
    char v_comm_sum_approve_status[3];
    double v_buy_order_qty;
    double v_sell_order_qty;
    double v_buy_comm_qty;
    double v_sell_comm_qty;
    double v_buy_strike_qty;
    double v_sell_strike_qty;
    double v_buy_strike_amt;
    double v_sell_strike_amt;
    double v_buy_comm_amt;
    double v_sell_comm_amt;
    int v_is_withdraw;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_batch_no;
    char v_order_status[3];
    double v_wtdraw_qty;
    double v_strike_price;
    double v_strike_commis;
    double v_strike_other_commis;
    double v_strike_all_fee;
    double v_trade_occur_amt;
    char v_rsp_info[256];
    char v_order_oper_way[3];
    char v_oper_func_code[17];
    char v_order_sum_status[3];
    double v_waste_qty;
    double v_strike_aver_price;
    int v_wtdraw_batch_no;
    int v_wtdraw_date;
    int v_wtdraw_time;
    int64 v_order_id;
    char v_wtdraw_status[3];
    char v_wtdraw_remark[256];
    char v_log_error_code[33];
    char v_log_error_info[256];

    IGroup* lpMainMsg=NULL;
    int iRecordCount = 0;
    IGroup* lpMainMsg2=NULL;

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
    v_comm_id=0;
    v_comm_limit_price=0;
    v_limit_actual_price=0;
    v_comm_qty=0;
    v_comm_amt=0;
    v_comm_begin_date=0;
    v_comm_end_date=0;
    v_comm_begin_time=0;
    v_comm_end_time=0;
    strcpy(v_modi_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_tmp_comm_qty=0;
    v_tmp_comm_amt=0;
    v_tmp_comm_limit_price=0;
    v_tmp_limit_actual_price=0;
    v_tmp_comm_begin_date=0;
    v_tmp_comm_end_date=0;
    v_tmp_comm_begin_time=0;
    v_tmp_comm_end_time=0;
    v_row_id=0;
    v_init_date=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    strcpy(v_exch_crncy_type, "CNY");
    v_exch_no=0;
    v_futu_acco_no=0;
    v_contrc_code_no=0;
    strcpy(v_contrc_code, " ");
    v_contrc_type=0;
    v_asset_type=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    v_comm_date=0;
    v_comm_time=0;
    v_comm_batch_no=0;
    v_comm_opor=0;
    v_comm_executor=0;
    v_comm_dir=0;
    v_order_qty=0;
    v_comm_cancel_qty=0;
    v_strike_amt=0;
    v_strike_qty=0;
    v_comm_frozen_amt=0;
    v_comm_frozen_qty=0;
    v_rece_margin=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    strcpy(v_strike_status, "0");
    strcpy(v_comm_status, "0");
    v_comm_comple_date=0;
    v_comm_comple_time=0;
    v_comm_appr_date=0;
    v_comm_appr_time=0;
    strcpy(v_comm_appr_status, " ");
    v_comm_appr_oper_no=0;
    v_comm_appr_oper=0;
    strcpy(v_comm_appr_remark, " ");
    v_external_no=0;
    strcpy(v_comb_code, " ");
    strcpy(v_comm_oper_way, " ");
    strcpy(v_remark_info, " ");
    v_comm_comple_flag=0;
    v_update_times=1;
    v_order_dir=0;
    v_lngsht_type=0;
    v_comm_occur_qty=0;
    v_order_price=0;
    v_price_type=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_exgp_busi_config_str, " ");
    strcpy(v_crncy_type, "CNY");
    v_contrc_unit=0;
    v_co_comm_appr_oper=0;
    strcpy(v_sys_config_str, " ");
    strcpy(v_busi_config_str, " ");
    strcpy(v_busi_ctrl_str, " ");
    strcpy(v_asac_busi_config_str, " ");
    strcpy(v_split_fee_typr_str, " ");
    strcpy(v_busi_limit_str, " ");
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_exter_comm_flag=0;
    v_market_price_ratio=0;
    v_comm_no_limit_price_ratio=0;
    v_cost_calc_type=0;
    v_comm_appr_set=0;
    v_appr_allow_order_flag=0;
    strcpy(v_opor_no_str1, " ");
    strcpy(v_opor_no_str2, " ");
    strcpy(v_opor_no_str3, " ");
    v_sys_type=0;
    strcpy(v_futu_acco, " ");
    v_exgp_avail_amt=0;
    v_asac_avail_amt=0;
    v_exgp_avail_qty=0;
    v_asac_avail_qty=0;
    v_exgp_long_rece_margin=0;
    v_exgp_short_rece_margin=0;
    v_asac_long_rece_margin=0;
    v_asac_short_rece_margin=0;
    v_exgp_long_stock_rece_margin=0;
    v_exgp_short_stock_rece_margin=0;
    v_trade_commis=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_deli_fee=0;
    v_other_fee=0;
    v_other_commis=0;
    v_all_fee=0;
    v_margin_pref=0;
    v_margin_ratio=0;
    v_trade_fee=0;
    v_pre_settle_price=0;
    v_up_limit_price=0;
    v_down_limit_price=0;
    v_last_price=0;
    v_pre_limit_actual_price=0;
    v_trig_stage_type=0;
    v_compli_trig_id=0;
    v_comm_occur_amt=0;
    strcpy(v_order_id_str, " ");
    strcpy(v_wtdraw_id_str, " ");
    v_exgp_row_id=0;
    v_exgp_begin_amt=0;
    v_exgp_curr_amt=0;
    v_exgp_frozen_amt=0;
    v_exgp_unfroz_amt=0;
    v_exgp_comm_frozen_amt=0;
    v_exgp_comm_unfroz_amt=0;
    v_exgp_comm_capt_amt=0;
    v_exgp_comm_releas_amt=0;
    v_exgp_trade_capt_amt=0;
    v_exgp_trade_releas_amt=0;
    v_exgp_strike_capt_amt=0;
    v_exgp_strike_releas_amt=0;
    v_exgp_capt_margin=0;
    v_exgp_trade_fee=0;
    v_exgp_strike_fee=0;
    v_exgp_close_pandl=0;
    v_exgp_marked_pandl=0;
    v_exgp_cash_update_times=1;
    v_asac_row_id=0;
    v_asac_begin_amt=0;
    v_asac_curr_amt=0;
    v_asac_frozen_amt=0;
    v_asac_unfroz_amt=0;
    v_asac_comm_frozen_amt=0;
    v_asac_comm_unfroz_amt=0;
    v_asac_comm_capt_amt=0;
    v_asac_comm_releas_amt=0;
    v_asac_trade_capt_amt=0;
    v_asac_trade_releas_amt=0;
    v_asac_strike_capt_amt=0;
    v_asac_strike_releas_amt=0;
    v_asac_capt_margin=0;
    v_asac_trade_fee=0;
    v_asac_strike_fee=0;
    v_asac_close_pandl=0;
    v_asac_marked_pandl=0;
    v_asac_cash_update_times=1;
    v_exgp_frozen_qty=0;
    v_exgp_unfroz_qty=0;
    v_exgp_comm_releas_qty=0;
    v_exgp_trade_releas_qty=0;
    v_exgp_strike_releas_qty=0;
    v_exgp_old_comm_capt_qty=0;
    v_exgp_today_comm_capt_qty=0;
    v_exgp_old_trade_capt_qty=0;
    v_exgp_today_trade_capt_qty=0;
    v_exgp_pre_strike_capt_qty=0;
    v_exgp_today_strike_capt_qty=0;
    v_exgp_rece_margin=0;
    v_exgp_realize_pandl=0;
    v_exgp_open_amount=0;
    v_exgp_posi_update_times=1;
    v_asac_frozen_qty=0;
    v_asac_unfroz_qty=0;
    v_asac_comm_releas_qty=0;
    v_asac_trade_releas_qty=0;
    v_asac_strike_releas_qty=0;
    v_asac_old_comm_capt_qty=0;
    v_asac_today_comm_capt_qty=0;
    v_asac_old_trade_capt_qty=0;
    v_asac_today_trade_capt_qty=0;
    v_asac_pre_strike_capt_qty=0;
    v_asac_today_strike_capt_qty=0;
    v_asac_rece_margin=0;
    v_asac_realize_pandl=0;
    v_asac_open_amount=0;
    v_asac_posi_update_times=1;
    v_comm_await_cancel_qty=0;
    strcpy(v_comm_sum_status, "0");
    v_max_comm_comple_date=0;
    v_max_comm_comple_time=0;
    v_comm_appr_qty=0;
    strcpy(v_comm_sum_approve_status, "0");
    v_buy_order_qty=0;
    v_sell_order_qty=0;
    v_buy_comm_qty=0;
    v_sell_comm_qty=0;
    v_buy_strike_qty=0;
    v_sell_strike_qty=0;
    v_buy_strike_amt=0;
    v_sell_strike_amt=0;
    v_buy_comm_amt=0;
    v_sell_comm_amt=0;
    v_is_withdraw=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_batch_no=0;
    strcpy(v_order_status, "0");
    v_wtdraw_qty=0;
    v_strike_price=0;
    v_strike_commis=0;
    v_strike_other_commis=0;
    v_strike_all_fee=0;
    v_trade_occur_amt=0;
    strcpy(v_rsp_info, " ");
    strcpy(v_order_oper_way, " ");
    strcpy(v_oper_func_code, " ");
    strcpy(v_order_sum_status, "0");
    v_waste_qty=0;
    v_strike_aver_price=0;
    v_wtdraw_batch_no=0;
    v_wtdraw_date=0;
    v_wtdraw_time=0;
    v_order_id=0;
    strcpy(v_wtdraw_status, "0");
    strcpy(v_wtdraw_remark, " ");
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
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_limit_price = lpInBizMsg->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
    v_limit_actual_price = lpInBizMsg->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
    v_comm_qty = lpInBizMsg->GetDouble(LDBIZ_COMM_QTY_FLOAT);
    v_comm_amt = lpInBizMsg->GetDouble(LDBIZ_COMM_AMT_FLOAT);
    v_comm_begin_date = lpInBizMsg->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
    v_comm_end_date = lpInBizMsg->GetInt32(LDBIZ_COMM_END_DATE_INT);
    v_comm_begin_time = lpInBizMsg->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
    v_comm_end_time = lpInBizMsg->GetInt32(LDBIZ_COMM_END_TIME_INT);
    strncpy(v_modi_info, lpInBizMsg->GetString(LDBIZ_MODI_INFO_STR),255);
    v_modi_info[255] = '\0';

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
    IFastMessage* lpTSCall1Req13 = NULL;
    IFastMessage* lpTSCall1Ans13 = NULL;
    IFastMessage* lpTSCall1Req14 = NULL;
    IFastMessage* lpTSCall1Ans14 = NULL;
    IFastMessage* lpTSCall1Req15 = NULL;
    IFastMessage* lpTSCall1Ans15 = NULL;
    IFastMessage* lpTSCall1Req16 = NULL;
    IFastMessage* lpTSCall1Ans16 = NULL;
    IFastMessage* lpTSCall1Req17 = NULL;
    IFastMessage* lpTSCall1Ans17 = NULL;


    // set @临时_指令数量# = @指令数量#;
    v_tmp_comm_qty = v_comm_qty;

    // set @临时_指令金额# = @指令金额#;
    v_tmp_comm_amt = v_comm_amt;

    // set @临时_指令限价# = @指令限价#;
    v_tmp_comm_limit_price = v_comm_limit_price;

    // set @临时_指令实际限价# = @指令实际限价#;
    v_tmp_limit_actual_price = v_limit_actual_price;

    // set @临时_指令开始日期# = @指令开始日期#;
    v_tmp_comm_begin_date = v_comm_begin_date;

    // set @临时_指令结束日期# = @指令结束日期#;
    v_tmp_comm_end_date = v_comm_end_date;

    // set @临时_指令开始时间# = @指令开始时间#;
    v_tmp_comm_begin_time = v_comm_begin_time;

    // set @临时_指令结束时间# = @指令结束时间#;
    v_tmp_comm_end_time = v_comm_end_time;
    //获取指令
    //调用过程[事务_交易期货_指令_获取指令]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.3", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.3]subcall timed out!");
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
    v_row_id = lpTSCall1Ans0->GetInt64(LDBIZ_ROW_ID_INT64);
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    v_co_no = lpTSCall1Ans0->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans0->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strcpy(v_exch_crncy_type, lpTSCall1Ans0->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_exch_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_NO_INT);
    v_futu_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    v_contrc_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strcpy(v_contrc_code, lpTSCall1Ans0->GetString(LDBIZ_CONTRC_CODE_STR));
    v_contrc_type = lpTSCall1Ans0->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_asset_type = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_contrc_dir = lpTSCall1Ans0->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpTSCall1Ans0->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_comm_date = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_time = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_TIME_INT);
    v_comm_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_opor = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_comm_executor = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_comm_dir = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_DIR_INT);
    v_comm_limit_price = lpTSCall1Ans0->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
    v_limit_actual_price = lpTSCall1Ans0->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
    v_comm_qty = lpTSCall1Ans0->GetDouble(LDBIZ_COMM_QTY_FLOAT);
    v_comm_amt = lpTSCall1Ans0->GetDouble(LDBIZ_COMM_AMT_FLOAT);
    v_order_qty = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_comm_cancel_qty = lpTSCall1Ans0->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_qty = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_comm_frozen_amt = lpTSCall1Ans0->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
    v_comm_frozen_qty = lpTSCall1Ans0->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
    v_rece_margin = lpTSCall1Ans0->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_capit_reback_days = lpTSCall1Ans0->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans0->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    strcpy(v_strike_status, lpTSCall1Ans0->GetString(LDBIZ_STRIKE_STATUS_STR));
    strcpy(v_comm_status, lpTSCall1Ans0->GetString(LDBIZ_COMM_STATUS_STR));
    v_comm_begin_date = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
    v_comm_end_date = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_END_DATE_INT);
    v_comm_begin_time = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
    v_comm_end_time = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_END_TIME_INT);
    v_comm_comple_date = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
    v_comm_comple_time = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
    v_comm_appr_date = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
    v_comm_appr_time = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
    strcpy(v_comm_appr_status, lpTSCall1Ans0->GetString(LDBIZ_COMM_APPR_STATUS_STR));
    v_comm_appr_oper_no = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_APPR_OPER_NO_INT);
    v_comm_appr_oper = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
    strcpy(v_comm_appr_remark, lpTSCall1Ans0->GetString(LDBIZ_COMM_APPR_REMARK_STR));
    v_external_no = lpTSCall1Ans0->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    strcpy(v_comb_code, lpTSCall1Ans0->GetString(LDBIZ_COMB_CODE_STR));
    strcpy(v_comm_oper_way, lpTSCall1Ans0->GetString(LDBIZ_COMM_OPER_WAY_STR));
    strcpy(v_remark_info, lpTSCall1Ans0->GetString(LDBIZ_REMARK_INFO_STR));
    v_comm_comple_flag = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
    v_update_times = lpTSCall1Ans0->GetInt32(LDBIZ_UPDATE_TIMES_INT);

    //根据订单方向和开平方向确定多空类型

    // set @订单方向# = @指令方向#;
    v_order_dir = v_comm_dir;
    //调用过程[事务_交易期货_交易_获取多空类型]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.26", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.26]subcall timed out!");
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
    v_lngsht_type = lpTSCall1Ans1->GetInt32(LDBIZ_LNGSHT_TYPE_INT);


    // set @指令变动数量# = @临时_指令数量# - @指令数量#;
    v_comm_occur_qty = v_tmp_comm_qty - v_comm_qty;

    // set @临时_指令金额# = @指令金额#;
    v_tmp_comm_amt = v_comm_amt;

    // set @指令数量# = @临时_指令数量#;
    v_comm_qty = v_tmp_comm_qty;

    // set @指令限价# = @临时_指令限价#;
    v_comm_limit_price = v_tmp_comm_limit_price;

    // set @指令实际限价# = @临时_指令实际限价#;
    v_limit_actual_price = v_tmp_limit_actual_price;

    // set @指令开始日期# = @临时_指令开始日期#;
    v_comm_begin_date = v_tmp_comm_begin_date;

    // set @指令结束日期# = @临时_指令结束日期#;
    v_comm_end_date = v_tmp_comm_end_date;

    // set @指令开始时间# = @临时_指令开始时间#;
    v_comm_begin_time = v_tmp_comm_begin_time;

    // set @指令结束时间# = @临时_指令结束时间#;
    v_comm_end_time = v_tmp_comm_end_time;

    // set @订单方向# = @指令方向#;
    v_order_dir = v_comm_dir;

    // set @订单数量# = @指令数量#;
    v_order_qty = v_comm_qty;

    // set @订单价格# = @指令实际限价#;
    v_order_price = v_limit_actual_price;

    // set @价格类型#=0;
    v_price_type=0;
    //公共子系统检查
    //调用过程[事务_公共_交易接口_检查期货指令市场状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.25.136", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req2->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpTSCall1Req2->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpTSCall1Req2->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req2->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req2->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req2->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    lpTSCall1Req2->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.136]subcall timed out!");
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
    v_init_date = lpTSCall1Ans2->GetInt32(LDBIZ_INIT_DATE_INT);
    v_pd_no = lpTSCall1Ans2->GetInt32(LDBIZ_PD_NO_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans2->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));
    strcpy(v_exgp_busi_config_str, lpTSCall1Ans2->GetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR));
    v_contrc_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_contrc_type = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_asset_type = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_CRNCY_TYPE_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_contrc_unit = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_UNIT_INT);
    v_capit_reback_days = lpTSCall1Ans2->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans2->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    v_co_comm_appr_oper = lpTSCall1Ans2->GetInt32(LDBIZ_CO_COMM_APPR_OPER_INT);
    strcpy(v_sys_config_str, lpTSCall1Ans2->GetString(LDBIZ_SYS_CONFIG_STR_STR));


    // set @业务控制配置串# = @交易组业务控制配置串#;
    strcpy(v_busi_config_str,v_exgp_busi_config_str);
    //检查参数合法性

    // [检查报错返回][@指令结束日期# <> 0 and @指令结束日期# < @初始化日期#][602][@指令结束日期#,@初始化日期#]
    if (v_comm_end_date != 0 && v_comm_end_date < v_init_date)
    {
        strcpy(v_error_code, "tdfutuL.3.3.602");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","指令结束日期=",v_comm_end_date,"初始化日期=",v_init_date);
        iRet = -1;
        goto END;
    }


    // [检查报错返回][(@指令开始日期# > 0 or @指令结束日期# > 0) and  @指令开始日期# > @指令结束日期#][621][@指令开始日期#,@指令结束日期#]
    if ((v_comm_begin_date > 0 || v_comm_end_date > 0) &&  v_comm_begin_date > v_comm_end_date)
    {
        strcpy(v_error_code, "tdfutuL.3.3.621");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","指令开始日期=",v_comm_begin_date,"指令结束日期=",v_comm_end_date);
        iRet = -1;
        goto END;
    }


    // [检查报错返回][(@指令开始日期# > 0 or @指令结束日期# > 0) and  @指令开始日期# = @指令结束日期# and @指令开始时间# > @指令结束时间#][622][@指令开始时间#,@指令结束时间#]
    if ((v_comm_begin_date > 0 || v_comm_end_date > 0) &&  v_comm_begin_date == v_comm_end_date && v_comm_begin_time > v_comm_end_time)
    {
        strcpy(v_error_code, "tdfutuL.3.3.622");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","指令开始时间=",v_comm_begin_time,"指令结束时间=",v_comm_end_time);
        iRet = -1;
        goto END;
    }

    //产品子系统检查，检查账户状态，获取当前资金等

    // set @订单方向# = @指令方向#;
    v_order_dir = v_comm_dir;

    // set @订单数量# = @指令数量#;
    v_order_qty = v_comm_qty;

    // set @业务控制串# = "11111";
    strcpy(v_busi_ctrl_str,"11111");
    //调用过程[事务_产品_交易接口_检查期货指令产品账户信息]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("prodT.8.109", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req3->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req3->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req3->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req3->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req3->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req3->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
    lpTSCall1Req3->SetString(LDBIZ_BUSI_CONFIG_STR_STR,v_busi_config_str);
    lpTSCall1Req3->SetInt32(LDBIZ_CO_COMM_APPR_OPER_INT,v_co_comm_appr_oper);
    lpTSCall1Req3->SetString(LDBIZ_SYS_CONFIG_STR_STR,v_sys_config_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.8.109]subcall timed out!");
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
    strcpy(v_exgp_busi_config_str, lpTSCall1Ans3->GetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR));
    strcpy(v_asac_busi_config_str, lpTSCall1Ans3->GetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR));
    strcpy(v_split_fee_typr_str, lpTSCall1Ans3->GetString(LDBIZ_SPLIT_FEE_TYPR_STR_STR));
    strcpy(v_busi_limit_str, lpTSCall1Ans3->GetString(LDBIZ_BUSI_LIMIT_STR_STR));
    v_comm_appr_oper = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
    v_pass_no = lpTSCall1Ans3->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans3->GetString(LDBIZ_OUT_ACCO_STR));
    v_exter_comm_flag = lpTSCall1Ans3->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_market_price_ratio = lpTSCall1Ans3->GetDouble(LDBIZ_MARKET_PRICE_RATIO_FLOAT);
    v_comm_no_limit_price_ratio = lpTSCall1Ans3->GetDouble(LDBIZ_COMM_NO_LIMIT_PRICE_RATIO_FLOAT);
    v_cost_calc_type = lpTSCall1Ans3->GetInt32(LDBIZ_COST_CALC_TYPE_INT);
    v_comm_appr_set = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_APPR_SET_INT);
    v_appr_allow_order_flag = lpTSCall1Ans3->GetInt32(LDBIZ_APPR_ALLOW_ORDER_FLAG_INT);
    strcpy(v_opor_no_str1, lpTSCall1Ans3->GetString(LDBIZ_OPOR_NO_STR1_STR));
    strcpy(v_opor_no_str2, lpTSCall1Ans3->GetString(LDBIZ_OPOR_NO_STR2_STR));
    strcpy(v_opor_no_str3, lpTSCall1Ans3->GetString(LDBIZ_OPOR_NO_STR3_STR));
    v_sys_type = lpTSCall1Ans3->GetInt32(LDBIZ_SYS_TYPE_INT);

    //获取可用
    //调用过程[事务_产品期货_交易接口_检查账户状态获取可用]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pdfutuT.6.1", 0);
    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req4->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req4->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req4->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req4->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req4->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.6.1]subcall timed out!");
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
    v_futu_acco_no = lpTSCall1Ans4->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    strcpy(v_futu_acco, lpTSCall1Ans4->GetString(LDBIZ_FUTU_ACCO_STR));
    v_exgp_avail_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_AVAIL_AMT_FLOAT);
    v_asac_avail_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_AVAIL_AMT_FLOAT);
    v_exgp_avail_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT);
    v_asac_avail_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT);
    v_exgp_long_rece_margin = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT);
    v_exgp_short_rece_margin = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT);
    v_asac_long_rece_margin = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT);
    v_asac_short_rece_margin = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT);
    v_exgp_long_stock_rece_margin = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_LONG_STOCK_RECE_MARGIN_FLOAT);
    v_exgp_short_stock_rece_margin = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_SHORT_STOCK_RECE_MARGIN_FLOAT);

    //获取保证金优惠订单费用
    //调用过程[事务_公共_公共接口_获取保证金优惠组合编码订单费用]
    //组织事务请求
    if(lpTSCall1Ans5)
    {
      lpTSCall1Ans5->FreeMsg();
      lpTSCall1Ans5=NULL;
    }
    lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pubT.24.255", 0);
    lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req5->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req5->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req5->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req5->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req5->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req5->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpTSCall1Req5->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req5->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req5->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req5->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req5->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
    if(!lpTSCall1Ans5)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.255]subcall timed out!");
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
    v_rece_margin = lpTSCall1Ans5->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_trade_commis = lpTSCall1Ans5->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_report_fee = lpTSCall1Ans5->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
    v_wtdraw_fee = lpTSCall1Ans5->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
    v_deli_fee = lpTSCall1Ans5->GetDouble(LDBIZ_DELI_FEE_FLOAT);
    v_other_fee = lpTSCall1Ans5->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
    v_other_commis = lpTSCall1Ans5->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    v_all_fee = lpTSCall1Ans5->GetDouble(LDBIZ_ALL_FEE_FLOAT);
    v_margin_pref = lpTSCall1Ans5->GetInt32(LDBIZ_MARGIN_PREF_INT);
    strcpy(v_comb_code, lpTSCall1Ans5->GetString(LDBIZ_COMB_CODE_STR));
    v_margin_ratio = lpTSCall1Ans5->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);


    // set @交易费用# = @全部费用#;
    v_trade_fee = v_all_fee;
    //调用过程[事务_公共_公共接口_获取合约编号行情价格]
    //组织事务请求
    if(lpTSCall1Ans6)
    {
      lpTSCall1Ans6->FreeMsg();
      lpTSCall1Ans6=NULL;
    }
    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("pubT.24.501", 0);
    lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req6->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
    if(!lpTSCall1Ans6)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.501]subcall timed out!");
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
    v_pre_settle_price = lpTSCall1Ans6->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
    v_up_limit_price = lpTSCall1Ans6->GetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT);
    v_down_limit_price = lpTSCall1Ans6->GetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
    v_last_price = lpTSCall1Ans6->GetDouble(LDBIZ_LAST_PRICE_FLOAT);

    //获取指令实际限价
    //调用过程[事务_交易期货_指令_获取指令实际限价]
    //组织事务请求
    if(lpTSCall1Ans7)
    {
      lpTSCall1Ans7->FreeMsg();
      lpTSCall1Ans7=NULL;
    }
    lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.15", 0);
    lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req7->SetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT,v_comm_limit_price);
    lpTSCall1Req7->SetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,v_limit_actual_price);
    lpTSCall1Req7->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
    lpTSCall1Req7->SetDouble(LDBIZ_LAST_PRICE_FLOAT,v_last_price);
    lpTSCall1Req7->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpTSCall1Req7->SetDouble(LDBIZ_COMM_NO_LIMIT_PRICE_RATIO_FLOAT,v_comm_no_limit_price_ratio);
    lpTSCall1Req7->SetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT,v_up_limit_price);
    lpTSCall1Req7->SetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT,v_down_limit_price);
    glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
    if(!lpTSCall1Ans7)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.15]subcall timed out!");
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
    v_pre_limit_actual_price = lpTSCall1Ans7->GetDouble(LDBIZ_PRE_LIMIT_ACTUAL_PRICE_FLOAT);


    // set @指令实际限价# = @前指令实际限价#;
    v_limit_actual_price = v_pre_limit_actual_price;
    //计算指令变动部分，去检查风控
    //set @指令变动金额// = @临时_指令金额// - @指令金额//;

    // set @订单方向# = @指令方向#;
    v_order_dir = v_comm_dir;

    // set @订单数量# = @指令变动数量#;
    v_order_qty = v_comm_occur_qty;

    // if @指令变动数量# <> 0 then
    if (v_comm_occur_qty != 0)
    {

        // set @订单价格# = @前指令实际限价#;
        v_order_price = v_pre_limit_actual_price;

        // set @触发阶段类型# = 《触发阶段类型-指令端》;
        v_trig_stage_type = 1;
        //调用过程[事务_风控期货_接口_检查客户风险]
        //组织事务请求
        if(lpTSCall1Ans8)
        {
          lpTSCall1Ans8->FreeMsg();
          lpTSCall1Ans8=NULL;
        }
        lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("rkfutuT.5.1", 0);
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
        lpTSCall1Req8->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req8->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req8->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
        lpTSCall1Req8->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
        lpTSCall1Req8->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
        lpTSCall1Req8->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
        lpTSCall1Req8->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
        lpTSCall1Req8->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpTSCall1Req8->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
        lpTSCall1Req8->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
        lpTSCall1Req8->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
        lpTSCall1Req8->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpTSCall1Req8->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
        lpTSCall1Req8->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
        lpTSCall1Req8->SetInt32(LDBIZ_TRIG_STAGE_TYPE_INT,v_trig_stage_type);
        glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
        if(!lpTSCall1Ans8)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rkfutuT.5.1]subcall timed out!");
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
        v_compli_trig_id = lpTSCall1Ans8->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);

    // end if;
    }

    //指令修改
    //调用过程[事务_交易期货_指令_修改指令]
    //组织事务请求
    if(lpTSCall1Ans9)
    {
      lpTSCall1Ans9->FreeMsg();
      lpTSCall1Ans9=NULL;
    }
    lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.16", 0);
    lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req9->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req9->SetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT,v_comm_limit_price);
    lpTSCall1Req9->SetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,v_limit_actual_price);
    lpTSCall1Req9->SetDouble(LDBIZ_COMM_QTY_FLOAT,v_comm_qty);
    lpTSCall1Req9->SetDouble(LDBIZ_COMM_AMT_FLOAT,v_comm_amt);
    lpTSCall1Req9->SetInt32(LDBIZ_COMM_BEGIN_DATE_INT,v_comm_begin_date);
    lpTSCall1Req9->SetInt32(LDBIZ_COMM_END_DATE_INT,v_comm_end_date);
    lpTSCall1Req9->SetInt32(LDBIZ_COMM_BEGIN_TIME_INT,v_comm_begin_time);
    lpTSCall1Req9->SetInt32(LDBIZ_COMM_END_TIME_INT,v_comm_end_time);
    lpTSCall1Req9->SetString(LDBIZ_MODI_INFO_STR,v_modi_info);
    lpTSCall1Req9->SetString(LDBIZ_BUSI_LIMIT_STR_STR,v_busi_limit_str);
    lpTSCall1Req9->SetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR,v_exgp_busi_config_str);
    lpTSCall1Req9->SetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR,v_asac_busi_config_str);
    lpTSCall1Req9->SetDouble(LDBIZ_EXGP_AVAIL_AMT_FLOAT,v_exgp_avail_amt);
    lpTSCall1Req9->SetDouble(LDBIZ_ASAC_AVAIL_AMT_FLOAT,v_asac_avail_amt);
    lpTSCall1Req9->SetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT,v_exgp_avail_qty);
    lpTSCall1Req9->SetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT,v_asac_avail_qty);
    lpTSCall1Req9->SetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT,v_exgp_long_rece_margin);
    lpTSCall1Req9->SetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT,v_exgp_short_rece_margin);
    lpTSCall1Req9->SetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT,v_asac_long_rece_margin);
    lpTSCall1Req9->SetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT,v_asac_short_rece_margin);
    lpTSCall1Req9->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req9->SetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT,v_up_limit_price);
    lpTSCall1Req9->SetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT,v_down_limit_price);
    lpTSCall1Req9->SetDouble(LDBIZ_TRADE_FEE_FLOAT,v_trade_fee);
    lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpTSCall1Req9->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpTSCall1Req9->SetDouble(LDBIZ_MARGIN_RATIO_FLOAT,v_margin_ratio);
    glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
    if(!lpTSCall1Ans9)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.16]subcall timed out!");
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
    v_comm_date = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_batch_no = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    strcpy(v_comm_status, lpTSCall1Ans9->GetString(LDBIZ_COMM_STATUS_STR));
    v_comm_opor = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_comm_occur_amt = lpTSCall1Ans9->GetDouble(LDBIZ_COMM_OCCUR_AMT_FLOAT);
    v_comm_occur_qty = lpTSCall1Ans9->GetDouble(LDBIZ_COMM_OCCUR_QTY_FLOAT);
    strcpy(v_order_id_str, lpTSCall1Ans9->GetString(LDBIZ_ORDER_ID_STR_STR));
    strcpy(v_wtdraw_id_str, lpTSCall1Ans9->GetString(LDBIZ_WTDRAW_ID_STR_STR));

    //主推
    //调用过程[事务_交易期货_指令_获取指令]
    //组织事务请求
    if(lpTSCall1Ans10)
    {
      lpTSCall1Ans10->FreeMsg();
      lpTSCall1Ans10=NULL;
    }
    lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.3", 0);
    lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req10->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
    if(!lpTSCall1Ans10)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.3]subcall timed out!");
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
    v_row_id = lpTSCall1Ans10->GetInt64(LDBIZ_ROW_ID_INT64);
    v_init_date = lpTSCall1Ans10->GetInt32(LDBIZ_INIT_DATE_INT);
    v_co_no = lpTSCall1Ans10->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans10->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans10->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans10->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strcpy(v_exch_crncy_type, lpTSCall1Ans10->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_exch_no = lpTSCall1Ans10->GetInt32(LDBIZ_EXCH_NO_INT);
    v_futu_acco_no = lpTSCall1Ans10->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    v_contrc_code_no = lpTSCall1Ans10->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strcpy(v_contrc_code, lpTSCall1Ans10->GetString(LDBIZ_CONTRC_CODE_STR));
    v_contrc_type = lpTSCall1Ans10->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_asset_type = lpTSCall1Ans10->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_contrc_dir = lpTSCall1Ans10->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpTSCall1Ans10->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_comm_date = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_time = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_TIME_INT);
    v_comm_batch_no = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_opor = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_comm_executor = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_comm_dir = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_DIR_INT);
    v_comm_limit_price = lpTSCall1Ans10->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
    v_limit_actual_price = lpTSCall1Ans10->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
    v_comm_qty = lpTSCall1Ans10->GetDouble(LDBIZ_COMM_QTY_FLOAT);
    v_comm_amt = lpTSCall1Ans10->GetDouble(LDBIZ_COMM_AMT_FLOAT);
    v_order_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_comm_cancel_qty = lpTSCall1Ans10->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans10->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_qty = lpTSCall1Ans10->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_comm_frozen_amt = lpTSCall1Ans10->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
    v_comm_frozen_qty = lpTSCall1Ans10->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
    v_rece_margin = lpTSCall1Ans10->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_capit_reback_days = lpTSCall1Ans10->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans10->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    strcpy(v_strike_status, lpTSCall1Ans10->GetString(LDBIZ_STRIKE_STATUS_STR));
    strcpy(v_comm_status, lpTSCall1Ans10->GetString(LDBIZ_COMM_STATUS_STR));
    v_comm_begin_date = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
    v_comm_end_date = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_END_DATE_INT);
    v_comm_begin_time = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
    v_comm_end_time = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_END_TIME_INT);
    v_comm_comple_date = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
    v_comm_comple_time = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
    v_comm_appr_date = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
    v_comm_appr_time = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
    strcpy(v_comm_appr_status, lpTSCall1Ans10->GetString(LDBIZ_COMM_APPR_STATUS_STR));
    v_comm_appr_oper_no = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_APPR_OPER_NO_INT);
    v_comm_appr_oper = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
    strcpy(v_comm_appr_remark, lpTSCall1Ans10->GetString(LDBIZ_COMM_APPR_REMARK_STR));
    v_external_no = lpTSCall1Ans10->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    strcpy(v_comb_code, lpTSCall1Ans10->GetString(LDBIZ_COMB_CODE_STR));
    strcpy(v_comm_oper_way, lpTSCall1Ans10->GetString(LDBIZ_COMM_OPER_WAY_STR));
    strcpy(v_remark_info, lpTSCall1Ans10->GetString(LDBIZ_REMARK_INFO_STR));
    v_comm_comple_flag = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
    v_update_times = lpTSCall1Ans10->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // [主动推送][futu.comm][期货主推_指令_指令主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.92", 0);
    lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpPubMsg->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_TIME_INT,v_comm_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpPubMsg->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpPubMsg->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpPubMsg->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
    lpPubMsg->SetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT,v_comm_limit_price);
    lpPubMsg->SetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,v_limit_actual_price);
    lpPubMsg->SetDouble(LDBIZ_COMM_QTY_FLOAT,v_comm_qty);
    lpPubMsg->SetDouble(LDBIZ_COMM_AMT_FLOAT,v_comm_amt);
    lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpPubMsg->SetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT,v_comm_cancel_qty);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
    lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT,v_comm_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
    lpPubMsg->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
    lpPubMsg->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
    lpPubMsg->SetString(LDBIZ_STRIKE_STATUS_STR,v_strike_status);
    lpPubMsg->SetString(LDBIZ_COMM_STATUS_STR,v_comm_status);
    lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_DATE_INT,v_comm_begin_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_END_DATE_INT,v_comm_end_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_TIME_INT,v_comm_begin_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_END_TIME_INT,v_comm_end_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_DATE_INT,v_comm_comple_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_TIME_INT,v_comm_comple_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_APPR_DATE_INT,v_comm_appr_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_APPR_TIME_INT,v_comm_appr_time);
    lpPubMsg->SetString(LDBIZ_COMM_APPR_STATUS_STR,v_comm_appr_status);
    lpPubMsg->SetInt32(LDBIZ_COMM_APPR_OPER_INT,v_comm_appr_oper);
    lpPubMsg->SetString(LDBIZ_COMM_APPR_REMARK_STR,v_comm_appr_remark);
    lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpPubMsg->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
    lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_FLAG_INT,v_comm_comple_flag);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("futu.comm", lpPubMsg);

    //主推交易组和资产账户资金
    //调用过程[事务_交易期货_账户_获取交易组资产账户资金]
    //组织事务请求
    if(lpTSCall1Ans11)
    {
      lpTSCall1Ans11->FreeMsg();
      lpTSCall1Ans11=NULL;
    }
    lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.11", 0);
    lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req11->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req11->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req11->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
    if(!lpTSCall1Ans11)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.11]subcall timed out!");
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
    v_exgp_row_id = lpTSCall1Ans11->GetInt64(LDBIZ_EXGP_ROW_ID_INT64);
    v_co_no = lpTSCall1Ans11->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans11->GetInt32(LDBIZ_PD_NO_INT);
    v_exgp_begin_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT);
    v_exgp_curr_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT);
    v_exgp_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
    v_exgp_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
    v_exgp_comm_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
    v_exgp_comm_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
    v_exgp_comm_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
    v_exgp_comm_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
    v_exgp_trade_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
    v_exgp_trade_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
    v_exgp_strike_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
    v_exgp_strike_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
    v_exgp_capt_margin = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_CAPT_MARGIN_FLOAT);
    v_exgp_trade_fee = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_FEE_FLOAT);
    v_exgp_strike_fee = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_FEE_FLOAT);
    v_exgp_close_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_CLOSE_PANDL_FLOAT);
    v_exgp_marked_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_MARKED_PANDL_FLOAT);
    v_exgp_cash_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
    v_asac_row_id = lpTSCall1Ans11->GetInt64(LDBIZ_ASAC_ROW_ID_INT64);
    v_asac_begin_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_BEGIN_AMT_FLOAT);
    v_asac_curr_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_CURR_AMT_FLOAT);
    v_asac_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
    v_asac_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
    v_asac_comm_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
    v_asac_comm_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
    v_asac_comm_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
    v_asac_comm_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
    v_asac_trade_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
    v_asac_trade_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
    v_asac_strike_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
    v_asac_strike_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
    v_asac_capt_margin = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_CAPT_MARGIN_FLOAT);
    v_asac_trade_fee = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_FEE_FLOAT);
    v_asac_strike_fee = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_FEE_FLOAT);
    v_asac_close_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_CLOSE_PANDL_FLOAT);
    v_asac_marked_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_MARKED_PANDL_FLOAT);
    v_asac_cash_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);


    // [主动推送][futu.exgpcapital][期货主推_资金_交易组资金主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.110", 0);
    lpPubMsg->SetInt64(LDBIZ_EXGP_ROW_ID_INT64,v_exgp_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT,v_exgp_begin_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT,v_exgp_curr_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT,v_exgp_comm_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT,v_exgp_comm_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT,v_exgp_comm_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT,v_exgp_comm_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT,v_exgp_trade_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT,v_exgp_trade_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT,v_exgp_strike_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT,v_exgp_strike_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_CAPT_MARGIN_FLOAT,v_exgp_capt_margin);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FEE_FLOAT,v_exgp_trade_fee);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FEE_FLOAT,v_exgp_strike_fee);
    lpPubMsg->SetDouble(LDBIZ_EXGP_CLOSE_PANDL_FLOAT,v_exgp_close_pandl);
    lpPubMsg->SetDouble(LDBIZ_EXGP_MARKED_PANDL_FLOAT,v_exgp_marked_pandl);
    lpPubMsg->SetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT,v_exgp_cash_update_times);
    glpPubSub_Interface->PubTopics("futu.exgpcapital", lpPubMsg);


    // [主动推送][futu.asaccapital][期货主推_资金_资产账户资金主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.111", 0);
    lpPubMsg->SetInt64(LDBIZ_ASAC_ROW_ID_INT64,v_asac_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetDouble(LDBIZ_ASAC_BEGIN_AMT_FLOAT,v_asac_begin_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CURR_AMT_FLOAT,v_asac_curr_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT,v_asac_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT,v_asac_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT,v_asac_comm_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT,v_asac_comm_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT,v_asac_comm_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT,v_asac_comm_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT,v_asac_trade_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT,v_asac_trade_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT,v_asac_strike_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT,v_asac_strike_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CAPT_MARGIN_FLOAT,v_asac_capt_margin);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FEE_FLOAT,v_asac_trade_fee);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FEE_FLOAT,v_asac_strike_fee);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CLOSE_PANDL_FLOAT,v_asac_close_pandl);
    lpPubMsg->SetDouble(LDBIZ_ASAC_MARKED_PANDL_FLOAT,v_asac_marked_pandl);
    lpPubMsg->SetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT,v_asac_cash_update_times);
    glpPubSub_Interface->PubTopics("futu.asaccapital", lpPubMsg);

    //主推交易组和资产账户持仓
    //调用过程[事务_交易期货_账户_获取交易组资产账户持仓]
    //组织事务请求
    if(lpTSCall1Ans12)
    {
      lpTSCall1Ans12->FreeMsg();
      lpTSCall1Ans12=NULL;
    }
    lpTSCall1Req12=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.12", 0);
    lpTSCall1Req12->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req12->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req12->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req12->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req12->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req12->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req12->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req12->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req12->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req12->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req12->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req12->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req12->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpTSCall1Req12->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req12, &lpTSCall1Ans12, 5000);
    if(!lpTSCall1Ans12)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.12]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans12->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans12->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans12->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans12->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans12->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans12->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans12->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans12->GetString(LDBIZ_ERROR_INFO_STR));
    v_exgp_row_id = lpTSCall1Ans12->GetInt64(LDBIZ_EXGP_ROW_ID_INT64);
    v_co_no = lpTSCall1Ans12->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans12->GetInt32(LDBIZ_PD_NO_INT);
    strcpy(v_exch_crncy_type, lpTSCall1Ans12->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_contrc_type = lpTSCall1Ans12->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_unit = lpTSCall1Ans12->GetInt32(LDBIZ_CONTRC_UNIT_INT);
    strcpy(v_comb_code, lpTSCall1Ans12->GetString(LDBIZ_COMB_CODE_STR));
    v_exgp_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
    v_exgp_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
    v_exgp_comm_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
    v_exgp_trade_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
    v_exgp_strike_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
    v_exgp_old_comm_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_OLD_COMM_CAPT_QTY_FLOAT);
    v_exgp_today_comm_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TODAY_COMM_CAPT_QTY_FLOAT);
    v_exgp_old_trade_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_OLD_TRADE_CAPT_QTY_FLOAT);
    v_exgp_today_trade_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TODAY_TRADE_CAPT_QTY_FLOAT);
    v_exgp_pre_strike_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_PRE_STRIKE_CAPT_QTY_FLOAT);
    v_exgp_today_strike_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TODAY_STRIKE_CAPT_QTY_FLOAT);
    v_exgp_rece_margin = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_RECE_MARGIN_FLOAT);
    v_pre_settle_price = lpTSCall1Ans12->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
    v_exgp_realize_pandl = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
    v_exgp_open_amount = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_OPEN_AMOUNT_FLOAT);
    v_exgp_posi_update_times = lpTSCall1Ans12->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
    v_asac_row_id = lpTSCall1Ans12->GetInt64(LDBIZ_ASAC_ROW_ID_INT64);
    v_asac_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
    v_asac_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
    v_asac_comm_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
    v_asac_trade_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
    v_asac_strike_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
    v_asac_old_comm_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_OLD_COMM_CAPT_QTY_FLOAT);
    v_asac_today_comm_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TODAY_COMM_CAPT_QTY_FLOAT);
    v_asac_old_trade_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_OLD_TRADE_CAPT_QTY_FLOAT);
    v_asac_today_trade_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TODAY_TRADE_CAPT_QTY_FLOAT);
    v_asac_pre_strike_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_PRE_STRIKE_CAPT_QTY_FLOAT);
    v_asac_today_strike_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TODAY_STRIKE_CAPT_QTY_FLOAT);
    v_asac_rece_margin = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_RECE_MARGIN_FLOAT);
    v_asac_realize_pandl = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
    v_asac_open_amount = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_OPEN_AMOUNT_FLOAT);
    v_asac_posi_update_times = lpTSCall1Ans12->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


    // [主动推送][futu.exgpposi][期货主推_持仓_交易组持仓主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.130", 0);
    lpPubMsg->SetInt64(LDBIZ_EXGP_ROW_ID_INT64,v_exgp_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpPubMsg->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpPubMsg->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_OLD_COMM_CAPT_QTY_FLOAT,v_exgp_old_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TODAY_COMM_CAPT_QTY_FLOAT,v_exgp_today_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_OLD_TRADE_CAPT_QTY_FLOAT,v_exgp_old_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TODAY_TRADE_CAPT_QTY_FLOAT,v_exgp_today_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_PRE_STRIKE_CAPT_QTY_FLOAT,v_exgp_pre_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TODAY_STRIKE_CAPT_QTY_FLOAT,v_exgp_today_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_RECE_MARGIN_FLOAT,v_exgp_rece_margin);
    lpPubMsg->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
    lpPubMsg->SetDouble(LDBIZ_EXGP_OPEN_AMOUNT_FLOAT,v_exgp_open_amount);
    lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
    glpPubSub_Interface->PubTopics("futu.exgpposi", lpPubMsg);


    // [主动推送][futu.asacposi][期货主推_持仓_资产账户持仓主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.131", 0);
    lpPubMsg->SetInt64(LDBIZ_ASAC_ROW_ID_INT64,v_asac_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpPubMsg->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpPubMsg->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_OLD_COMM_CAPT_QTY_FLOAT,v_asac_old_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TODAY_COMM_CAPT_QTY_FLOAT,v_asac_today_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_OLD_TRADE_CAPT_QTY_FLOAT,v_asac_old_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TODAY_TRADE_CAPT_QTY_FLOAT,v_asac_today_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_PRE_STRIKE_CAPT_QTY_FLOAT,v_asac_pre_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TODAY_STRIKE_CAPT_QTY_FLOAT,v_asac_today_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_RECE_MARGIN_FLOAT,v_asac_rece_margin);
    lpPubMsg->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
    lpPubMsg->SetDouble(LDBIZ_ASAC_OPEN_AMOUNT_FLOAT,v_asac_open_amount);
    lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
    glpPubSub_Interface->PubTopics("futu.asacposi", lpPubMsg);


    // if @指令批号# >0 then
    if (v_comm_batch_no >0)
    {
        //调用过程[事务_交易期货_指令_获取指令汇总]
        //组织事务请求
        if(lpTSCall1Ans13)
        {
          lpTSCall1Ans13->FreeMsg();
          lpTSCall1Ans13=NULL;
        }
        lpTSCall1Req13=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.4", 0);
        lpTSCall1Req13->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req13->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req13->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req13->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req13->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req13->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req13->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req13->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req13->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
        lpTSCall1Req13->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpTSCall1Req13->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req13->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
        glpTSSubcallSerives->SubCall(lpTSCall1Req13, &lpTSCall1Ans13, 5000);
        if(!lpTSCall1Ans13)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.4]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans13->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans13->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans13->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans13->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans13->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans13->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans13->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans13->GetString(LDBIZ_ERROR_INFO_STR));
        v_row_id = lpTSCall1Ans13->GetInt64(LDBIZ_ROW_ID_INT64);
        v_init_date = lpTSCall1Ans13->GetInt32(LDBIZ_INIT_DATE_INT);
        v_pd_no = lpTSCall1Ans13->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans13->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans13->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        strcpy(v_exch_crncy_type, lpTSCall1Ans13->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans13->GetInt32(LDBIZ_EXCH_NO_INT);
        v_futu_acco_no = lpTSCall1Ans13->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
        v_contrc_code_no = lpTSCall1Ans13->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans13->GetString(LDBIZ_CONTRC_CODE_STR));
        v_contrc_type = lpTSCall1Ans13->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_asset_type = lpTSCall1Ans13->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_dir = lpTSCall1Ans13->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans13->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_comm_time = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_TIME_INT);
        v_comm_opor = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_OPOR_INT);
        v_comm_dir = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_DIR_INT);
        v_comm_limit_price = lpTSCall1Ans13->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
        v_limit_actual_price = lpTSCall1Ans13->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
        v_comm_qty = lpTSCall1Ans13->GetDouble(LDBIZ_COMM_QTY_FLOAT);
        v_comm_amt = lpTSCall1Ans13->GetDouble(LDBIZ_COMM_AMT_FLOAT);
        v_order_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_comm_cancel_qty = lpTSCall1Ans13->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
        v_comm_await_cancel_qty = lpTSCall1Ans13->GetDouble(LDBIZ_COMM_AWAIT_CANCEL_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans13->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_strike_qty = lpTSCall1Ans13->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        strcpy(v_strike_status, lpTSCall1Ans13->GetString(LDBIZ_STRIKE_STATUS_STR));
        strcpy(v_comm_sum_status, lpTSCall1Ans13->GetString(LDBIZ_COMM_SUM_STATUS_STR));
        v_comm_begin_date = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
        v_comm_end_date = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_END_DATE_INT);
        v_comm_begin_time = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
        v_comm_end_time = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_END_TIME_INT);
        v_comm_comple_date = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
        v_comm_comple_time = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
        v_max_comm_comple_date = lpTSCall1Ans13->GetInt32(LDBIZ_MAX_COMM_COMPLE_DATE_INT);
        v_max_comm_comple_time = lpTSCall1Ans13->GetInt32(LDBIZ_MAX_COMM_COMPLE_TIME_INT);
        v_comm_appr_date = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
        v_comm_appr_time = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
        v_comm_appr_qty = lpTSCall1Ans13->GetDouble(LDBIZ_COMM_APPR_QTY_FLOAT);
        strcpy(v_comm_sum_approve_status, lpTSCall1Ans13->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
        v_buy_order_qty = lpTSCall1Ans13->GetDouble(LDBIZ_BUY_ORDER_QTY_FLOAT);
        v_sell_order_qty = lpTSCall1Ans13->GetDouble(LDBIZ_SELL_ORDER_QTY_FLOAT);
        v_buy_comm_qty = lpTSCall1Ans13->GetDouble(LDBIZ_BUY_COMM_QTY_FLOAT);
        v_sell_comm_qty = lpTSCall1Ans13->GetDouble(LDBIZ_SELL_COMM_QTY_FLOAT);
        v_buy_strike_qty = lpTSCall1Ans13->GetDouble(LDBIZ_BUY_STRIKE_QTY_FLOAT);
        v_sell_strike_qty = lpTSCall1Ans13->GetDouble(LDBIZ_SELL_STRIKE_QTY_FLOAT);
        v_buy_strike_amt = lpTSCall1Ans13->GetDouble(LDBIZ_BUY_STRIKE_AMT_FLOAT);
        v_sell_strike_amt = lpTSCall1Ans13->GetDouble(LDBIZ_SELL_STRIKE_AMT_FLOAT);
        v_buy_comm_amt = lpTSCall1Ans13->GetDouble(LDBIZ_BUY_COMM_AMT_FLOAT);
        v_sell_comm_amt = lpTSCall1Ans13->GetDouble(LDBIZ_SELL_COMM_AMT_FLOAT);
        v_rece_margin = lpTSCall1Ans13->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_comm_oper_way, lpTSCall1Ans13->GetString(LDBIZ_COMM_OPER_WAY_STR));
        v_update_times = lpTSCall1Ans13->GetInt32(LDBIZ_UPDATE_TIMES_INT);


        // [主动推送][futu.commtotal][期货主推_指令_指令汇总主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.93", 0);
        lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
        lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
        lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
        lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
        lpPubMsg->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_TIME_INT,v_comm_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpPubMsg->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
        lpPubMsg->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
        lpPubMsg->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
        lpPubMsg->SetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT,v_comm_limit_price);
        lpPubMsg->SetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,v_limit_actual_price);
        lpPubMsg->SetDouble(LDBIZ_COMM_QTY_FLOAT,v_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_AMT_FLOAT,v_comm_amt);
        lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT,v_comm_cancel_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_AWAIT_CANCEL_QTY_FLOAT,v_comm_await_cancel_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT,v_comm_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
        lpPubMsg->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
        lpPubMsg->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
        lpPubMsg->SetString(LDBIZ_STRIKE_STATUS_STR,v_strike_status);
        lpPubMsg->SetString(LDBIZ_COMM_SUM_STATUS_STR,v_comm_sum_status);
        lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_DATE_INT,v_comm_begin_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_END_DATE_INT,v_comm_end_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_TIME_INT,v_comm_begin_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_END_TIME_INT,v_comm_end_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_DATE_INT,v_comm_comple_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_TIME_INT,v_comm_comple_time);
        lpPubMsg->SetInt32(LDBIZ_MAX_COMM_COMPLE_DATE_INT,v_max_comm_comple_date);
        lpPubMsg->SetInt32(LDBIZ_MAX_COMM_COMPLE_TIME_INT,v_max_comm_comple_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_APPR_DATE_INT,v_comm_appr_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_APPR_TIME_INT,v_comm_appr_time);
        lpPubMsg->SetDouble(LDBIZ_COMM_APPR_QTY_FLOAT,v_comm_appr_qty);
        lpPubMsg->SetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR,v_comm_sum_approve_status);
        lpPubMsg->SetDouble(LDBIZ_BUY_ORDER_QTY_FLOAT,v_buy_order_qty);
        lpPubMsg->SetDouble(LDBIZ_SELL_ORDER_QTY_FLOAT,v_sell_order_qty);
        lpPubMsg->SetDouble(LDBIZ_BUY_COMM_QTY_FLOAT,v_buy_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_SELL_COMM_QTY_FLOAT,v_sell_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_BUY_STRIKE_QTY_FLOAT,v_buy_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_SELL_STRIKE_QTY_FLOAT,v_sell_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_BUY_STRIKE_AMT_FLOAT,v_buy_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_SELL_STRIKE_AMT_FLOAT,v_sell_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_BUY_COMM_AMT_FLOAT,v_buy_comm_amt);
        lpPubMsg->SetDouble(LDBIZ_SELL_COMM_AMT_FLOAT,v_sell_comm_amt);
        lpPubMsg->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("futu.commtotal", lpPubMsg);

    // end if;
    }

    //订单主推

    // if @是否撤单#=《是否撤单-是》 and @订单序号串# <> "" then
    if (v_is_withdraw==1 && strcmp(v_order_id_str , "")!=0)
    {
      //调用过程[事务_交易期货_交易_根据订单序号串查询订单结果集]
      //组织事务请求
      if(lpTSCall1Ans14)
      {
        lpTSCall1Ans14->FreeMsg();
        lpTSCall1Ans14=NULL;
      }
      lpTSCall1Req14=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.17", 0);
      lpTSCall1Req14->SetInt32(LDTAG_PRIORITY, iPriority);
      lpTSCall1Req14->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
      lpTSCall1Req14->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
      lpTSCall1Req14->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
      lpTSCall1Req14->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
      lpTSCall1Req14->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
      lpTSCall1Req14->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
      lpTSCall1Req14->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
      lpTSCall1Req14->SetString(LDBIZ_ORDER_ID_STR_STR,v_order_id_str);
      glpTSSubcallSerives->SubCall(lpTSCall1Req14, &lpTSCall1Ans14, 5000);
      if(!lpTSCall1Ans14)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.17]subcall timed out!");
          iRet=-2;
          goto ENDSYS;
      }
      else if(lpTSCall1Ans14->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans14->GetInt32(LDTAG_ERRORNO));
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans14->GetString(LDTAG_ERRORINFO));
          iRet=-2;
          goto ENDSYS;
      }
      else if(strcmp(lpTSCall1Ans14->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
      {
          strcpy(v_error_code, lpTSCall1Ans14->GetString(LDBIZ_ERROR_CODE_STR));
          strcpy(v_error_info, lpTSCall1Ans14->GetString(LDBIZ_ERROR_INFO_STR));
          iRet=-1;
          goto END;
      }
      //获取输出参数值
      strcpy(v_error_code, lpTSCall1Ans14->GetString(LDBIZ_ERROR_CODE_STR));
      strcpy(v_error_info, lpTSCall1Ans14->GetString(LDBIZ_ERROR_INFO_STR));


      // [获取结果集][lpMainMsg]
      lpMainMsg=lpTSCall1Ans14->GetGroup(LDTAG_NO_RESULTSET);


      // [遍历结果集开始][lpMainMsg]
      iRecordCount = lpMainMsg->GetRecordCount();
      for (int i = 0; i < iRecordCount;i++) 
      {
          IRecord* lpRecord =lpMainMsg->GetRecord(i);
          if(lpRecord)
          {

              //获取记录字段值
              v_row_id = lpRecord->GetInt64(LDBIZ_ROW_ID_INT64);
              v_opor_co_no = lpRecord->GetInt32(LDBIZ_OPOR_CO_NO_INT);
              v_opor_no = lpRecord->GetInt32(LDBIZ_OPOR_NO_INT);
              strcpy(v_oper_mac, lpRecord->GetString(LDBIZ_OPER_MAC_STR));
              strcpy(v_oper_ip_addr, lpRecord->GetString(LDBIZ_OPER_IP_ADDR_STR));
              strcpy(v_oper_info, lpRecord->GetString(LDBIZ_OPER_INFO_STR));
              strcpy(v_oper_way, lpRecord->GetString(LDBIZ_OPER_WAY_STR));
              v_init_date = lpRecord->GetInt32(LDBIZ_INIT_DATE_INT);
              v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
              v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
              v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
              v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
              strcpy(v_out_acco, lpRecord->GetString(LDBIZ_OUT_ACCO_STR));
              v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
              v_pass_no = lpRecord->GetInt32(LDBIZ_PASS_NO_INT);
              v_futu_acco_no = lpRecord->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
              v_contrc_code_no = lpRecord->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
              v_asset_type = lpRecord->GetInt32(LDBIZ_ASSET_TYPE_INT);
              v_contrc_type = lpRecord->GetInt32(LDBIZ_CONTRC_TYPE_INT);
              v_contrc_unit = lpRecord->GetInt32(LDBIZ_CONTRC_UNIT_INT);
              v_external_no = lpRecord->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
              v_report_date = lpRecord->GetInt32(LDBIZ_REPORT_DATE_INT);
              v_report_time = lpRecord->GetInt32(LDBIZ_REPORT_TIME_INT);
              strcpy(v_report_no, lpRecord->GetString(LDBIZ_REPORT_NO_STR));
              v_order_date = lpRecord->GetInt32(LDBIZ_ORDER_DATE_INT);
              v_order_time = lpRecord->GetInt32(LDBIZ_ORDER_TIME_INT);
              v_order_dir = lpRecord->GetInt32(LDBIZ_ORDER_DIR_INT);
              v_order_batch_no = lpRecord->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
              v_contrc_dir = lpRecord->GetInt32(LDBIZ_CONTRC_DIR_INT);
              v_hedge_type = lpRecord->GetInt32(LDBIZ_HEDGE_TYPE_INT);
              v_order_price = lpRecord->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
              v_order_qty = lpRecord->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
              strcpy(v_order_status, lpRecord->GetString(LDBIZ_ORDER_STATUS_STR));
              v_wtdraw_qty = lpRecord->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
              v_strike_qty = lpRecord->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
              v_strike_price = lpRecord->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
              v_strike_amt = lpRecord->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
              v_trade_fee = lpRecord->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
              v_trade_commis = lpRecord->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
              v_other_commis = lpRecord->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
              v_strike_commis = lpRecord->GetDouble(LDBIZ_STRIKE_COMMIS_FLOAT);
              v_strike_other_commis = lpRecord->GetDouble(LDBIZ_STRIKE_OTHER_COMMIS_FLOAT);
              v_strike_all_fee = lpRecord->GetDouble(LDBIZ_STRIKE_ALL_FEE_FLOAT);
              v_report_fee = lpRecord->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
              v_wtdraw_fee = lpRecord->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
              v_rece_margin = lpRecord->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
              v_trade_occur_amt = lpRecord->GetDouble(LDBIZ_TRADE_OCCUR_AMT_FLOAT);
              strcpy(v_comb_code, lpRecord->GetString(LDBIZ_COMB_CODE_STR));
              v_margin_ratio = lpRecord->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);
              strcpy(v_rsp_info, lpRecord->GetString(LDBIZ_RSP_INFO_STR));
              v_compli_trig_id = lpRecord->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);
              strcpy(v_order_oper_way, lpRecord->GetString(LDBIZ_ORDER_OPER_WAY_STR));
              v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


          // [主动推送][futu.order][期货主推_订单_订单主推消息]
          lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.90", 0);
          lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
          lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
          lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
          lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
          lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
          lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
          lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
          lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
          lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
          lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
          lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
          lpPubMsg->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
          lpPubMsg->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
          lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
          lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
          lpPubMsg->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
          lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
          lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
          lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
          lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
          lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
          lpPubMsg->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
          lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
          lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
          lpPubMsg->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
          lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
          lpPubMsg->SetDouble(LDBIZ_TRADE_FEE_FLOAT,v_trade_fee);
          lpPubMsg->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
          lpPubMsg->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
          lpPubMsg->SetDouble(LDBIZ_REPORT_FEE_FLOAT,v_report_fee);
          lpPubMsg->SetDouble(LDBIZ_WTDRAW_FEE_FLOAT,v_wtdraw_fee);
          lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
          lpPubMsg->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
          lpPubMsg->SetDouble(LDBIZ_MARGIN_RATIO_FLOAT,v_margin_ratio);
          lpPubMsg->SetString(LDBIZ_RSP_INFO_STR,v_rsp_info);
          lpPubMsg->SetInt64(LDBIZ_COMPLI_TRIG_ID_INT64,v_compli_trig_id);
          lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
          lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
          lpPubMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
          lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
          lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
          glpPubSub_Interface->PubTopics("futu.order", lpPubMsg);


          // if   @订单批号# > 0 then
          if (  v_order_batch_no > 0)
          {
              //调用过程[事务_交易期货_交易_获取订单汇总]
              //组织事务请求
              if(lpTSCall1Ans15)
              {
                lpTSCall1Ans15->FreeMsg();
                lpTSCall1Ans15=NULL;
              }
              lpTSCall1Req15=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.19", 0);
              lpTSCall1Req15->SetInt32(LDTAG_PRIORITY, iPriority);
              lpTSCall1Req15->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
              lpTSCall1Req15->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
              lpTSCall1Req15->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
              lpTSCall1Req15->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
              lpTSCall1Req15->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
              lpTSCall1Req15->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
              lpTSCall1Req15->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
              lpTSCall1Req15->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
              lpTSCall1Req15->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
              lpTSCall1Req15->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
              glpTSSubcallSerives->SubCall(lpTSCall1Req15, &lpTSCall1Ans15, 5000);
              if(!lpTSCall1Ans15)  //  超时错误
              {
                  lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                  lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.19]subcall timed out!");
                  iRet=-2;
                  goto ENDSYS;
              }
              else if(lpTSCall1Ans15->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
              {
                  lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans15->GetInt32(LDTAG_ERRORNO));
                  lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans15->GetString(LDTAG_ERRORINFO));
                  iRet=-2;
                  goto ENDSYS;
              }
              else if(strcmp(lpTSCall1Ans15->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
              {
                  strcpy(v_error_code, lpTSCall1Ans15->GetString(LDBIZ_ERROR_CODE_STR));
                  strcpy(v_error_info, lpTSCall1Ans15->GetString(LDBIZ_ERROR_INFO_STR));
                  iRet=-1;
                  goto END;
              }
              //获取输出参数值
              strcpy(v_error_code, lpTSCall1Ans15->GetString(LDBIZ_ERROR_CODE_STR));
              strcpy(v_error_info, lpTSCall1Ans15->GetString(LDBIZ_ERROR_INFO_STR));
              v_row_id = lpTSCall1Ans15->GetInt64(LDBIZ_ROW_ID_INT64);
              strcpy(v_oper_func_code, lpTSCall1Ans15->GetString(LDBIZ_OPER_FUNC_CODE_STR));
              v_init_date = lpTSCall1Ans15->GetInt32(LDBIZ_INIT_DATE_INT);
              v_pd_no = lpTSCall1Ans15->GetInt32(LDBIZ_PD_NO_INT);
              v_exch_group_no = lpTSCall1Ans15->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
              v_asset_acco_no = lpTSCall1Ans15->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
              v_pass_no = lpTSCall1Ans15->GetInt32(LDBIZ_PASS_NO_INT);
              strcpy(v_crncy_type, lpTSCall1Ans15->GetString(LDBIZ_CRNCY_TYPE_STR));
              v_exch_no = lpTSCall1Ans15->GetInt32(LDBIZ_EXCH_NO_INT);
              v_contrc_code_no = lpTSCall1Ans15->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
              strcpy(v_contrc_code, lpTSCall1Ans15->GetString(LDBIZ_CONTRC_CODE_STR));
              v_asset_type = lpTSCall1Ans15->GetInt32(LDBIZ_ASSET_TYPE_INT);
              v_contrc_type = lpTSCall1Ans15->GetInt32(LDBIZ_CONTRC_TYPE_INT);
              v_contrc_unit = lpTSCall1Ans15->GetInt32(LDBIZ_CONTRC_UNIT_INT);
              v_external_no = lpTSCall1Ans15->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
              v_order_dir = lpTSCall1Ans15->GetInt32(LDBIZ_ORDER_DIR_INT);
              v_contrc_dir = lpTSCall1Ans15->GetInt32(LDBIZ_CONTRC_DIR_INT);
              v_hedge_type = lpTSCall1Ans15->GetInt32(LDBIZ_HEDGE_TYPE_INT);
              v_order_price = lpTSCall1Ans15->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
              v_order_qty = lpTSCall1Ans15->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
              strcpy(v_order_sum_status, lpTSCall1Ans15->GetString(LDBIZ_ORDER_SUM_STATUS_STR));
              v_wtdraw_qty = lpTSCall1Ans15->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
              v_waste_qty = lpTSCall1Ans15->GetDouble(LDBIZ_WASTE_QTY_FLOAT);
              v_strike_qty = lpTSCall1Ans15->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
              v_strike_aver_price = lpTSCall1Ans15->GetDouble(LDBIZ_STRIKE_AVER_PRICE_FLOAT);
              v_strike_amt = lpTSCall1Ans15->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
              v_trade_fee = lpTSCall1Ans15->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
              v_trade_commis = lpTSCall1Ans15->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
              v_other_commis = lpTSCall1Ans15->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
              v_strike_commis = lpTSCall1Ans15->GetDouble(LDBIZ_STRIKE_COMMIS_FLOAT);
              v_strike_other_commis = lpTSCall1Ans15->GetDouble(LDBIZ_STRIKE_OTHER_COMMIS_FLOAT);
              v_report_fee = lpTSCall1Ans15->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
              v_wtdraw_fee = lpTSCall1Ans15->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
              v_strike_all_fee = lpTSCall1Ans15->GetDouble(LDBIZ_STRIKE_ALL_FEE_FLOAT);
              v_rece_margin = lpTSCall1Ans15->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
              strcpy(v_order_oper_way, lpTSCall1Ans15->GetString(LDBIZ_ORDER_OPER_WAY_STR));
              v_update_times = lpTSCall1Ans15->GetInt32(LDBIZ_UPDATE_TIMES_INT);


              // [主动推送][futu.ordertotal][期货主推_订单_订单汇总主推消息]
              lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.91", 0);
              lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
              lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
              lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
              lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
              lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
              lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
              lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
              lpPubMsg->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
              lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
              lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
              lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
              lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
              lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
              lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
              lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
              lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
              lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
              lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
              lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
              lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
              lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
              lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
              lpPubMsg->SetString(LDBIZ_ORDER_SUM_STATUS_STR,v_order_sum_status);
              lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
              lpPubMsg->SetDouble(LDBIZ_WASTE_QTY_FLOAT,v_waste_qty);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_AVER_PRICE_FLOAT,v_strike_aver_price);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
              lpPubMsg->SetDouble(LDBIZ_TRADE_FEE_FLOAT,v_trade_fee);
              lpPubMsg->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
              lpPubMsg->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_COMMIS_FLOAT,v_strike_commis);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_OTHER_COMMIS_FLOAT,v_strike_other_commis);
              lpPubMsg->SetDouble(LDBIZ_REPORT_FEE_FLOAT,v_report_fee);
              lpPubMsg->SetDouble(LDBIZ_WTDRAW_FEE_FLOAT,v_wtdraw_fee);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_ALL_FEE_FLOAT,v_strike_all_fee);
              lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
              lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
              lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
              glpPubSub_Interface->PubTopics("futu.ordertotal", lpPubMsg);

          // end if;
          }


      // [遍历结果集结束][lpMainMsg]
          }
      }

    // end if;
    }

    //撤单主推

    // if @是否撤单#=《是否撤单-是》 and @撤单序号串# <> "" then
    if (v_is_withdraw==1 && strcmp(v_wtdraw_id_str , "")!=0)
    {

        // set @订单序号串# = @撤单序号串#;
        strcpy(v_order_id_str,v_wtdraw_id_str);
        //调用过程[事务_交易期货_交易_根据订单序号串查询撤单结果集]
        //组织事务请求
        if(lpTSCall1Ans16)
        {
          lpTSCall1Ans16->FreeMsg();
          lpTSCall1Ans16=NULL;
        }
        lpTSCall1Req16=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.18", 0);
        lpTSCall1Req16->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req16->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req16->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req16->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req16->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req16->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req16->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req16->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req16->SetString(LDBIZ_ORDER_ID_STR_STR,v_order_id_str);
        glpTSSubcallSerives->SubCall(lpTSCall1Req16, &lpTSCall1Ans16, 5000);
        if(!lpTSCall1Ans16)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.18]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans16->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans16->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans16->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans16->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans16->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans16->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans16->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans16->GetString(LDBIZ_ERROR_INFO_STR));


        // [获取结果集][lpMainMsg2]
        lpMainMsg2=lpTSCall1Ans16->GetGroup(LDTAG_NO_RESULTSET);


        // [遍历结果集开始][lpMainMsg2]
        iRecordCount = lpMainMsg2->GetRecordCount();
        for (int i = 0; i < iRecordCount;i++) 
        {
            IRecord* lpRecord =lpMainMsg2->GetRecord(i);
            if(lpRecord)
            {

                //获取记录字段值
                v_row_id = lpRecord->GetInt64(LDBIZ_ROW_ID_INT64);
                v_opor_co_no = lpRecord->GetInt32(LDBIZ_OPOR_CO_NO_INT);
                v_opor_no = lpRecord->GetInt32(LDBIZ_OPOR_NO_INT);
                strcpy(v_oper_mac, lpRecord->GetString(LDBIZ_OPER_MAC_STR));
                strcpy(v_oper_ip_addr, lpRecord->GetString(LDBIZ_OPER_IP_ADDR_STR));
                strcpy(v_oper_info, lpRecord->GetString(LDBIZ_OPER_INFO_STR));
                strcpy(v_oper_way, lpRecord->GetString(LDBIZ_OPER_WAY_STR));
                strcpy(v_oper_func_code, lpRecord->GetString(LDBIZ_OPER_FUNC_CODE_STR));
                v_init_date = lpRecord->GetInt32(LDBIZ_INIT_DATE_INT);
                v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
                v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
                v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
                v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
                v_pass_no = lpRecord->GetInt32(LDBIZ_PASS_NO_INT);
                strcpy(v_out_acco, lpRecord->GetString(LDBIZ_OUT_ACCO_STR));
                strcpy(v_crncy_type, lpRecord->GetString(LDBIZ_CRNCY_TYPE_STR));
                v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
                v_futu_acco_no = lpRecord->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
                strcpy(v_futu_acco, lpRecord->GetString(LDBIZ_FUTU_ACCO_STR));
                v_contrc_code_no = lpRecord->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
                strcpy(v_contrc_code, lpRecord->GetString(LDBIZ_CONTRC_CODE_STR));
                v_external_no = lpRecord->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
                v_wtdraw_batch_no = lpRecord->GetInt32(LDBIZ_WTDRAW_BATCH_NO_INT);
                v_wtdraw_date = lpRecord->GetInt32(LDBIZ_WTDRAW_DATE_INT);
                v_wtdraw_time = lpRecord->GetInt32(LDBIZ_WTDRAW_TIME_INT);
                v_order_date = lpRecord->GetInt32(LDBIZ_ORDER_DATE_INT);
                v_order_id = lpRecord->GetInt64(LDBIZ_ORDER_ID_INT64);
                v_report_date = lpRecord->GetInt32(LDBIZ_REPORT_DATE_INT);
                v_report_time = lpRecord->GetInt32(LDBIZ_REPORT_TIME_INT);
                strcpy(v_report_no, lpRecord->GetString(LDBIZ_REPORT_NO_STR));
                strcpy(v_wtdraw_status, lpRecord->GetString(LDBIZ_WTDRAW_STATUS_STR));
                v_wtdraw_qty = lpRecord->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
                strcpy(v_wtdraw_remark, lpRecord->GetString(LDBIZ_WTDRAW_REMARK_STR));
                v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


            // if @撤单状态# <> 《撤单状态-成功》 then
            if (strcmp(v_wtdraw_status , "3")!=0)
            {

                    // [主动推送][futu.rptwtdraw][期货主推_报盘_撤单主推报盘消息]
                    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.102", 0);
                    lpPubMsg->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                    lpPubMsg->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                    lpPubMsg->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                    lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                    lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
                    lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
                    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                    lpPubMsg->SetString(LDBIZ_FUTU_ACCO_STR,v_futu_acco);
                    lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
                    lpPubMsg->SetInt32(LDBIZ_WTDRAW_DATE_INT,v_wtdraw_date);
                    lpPubMsg->SetInt32(LDBIZ_WTDRAW_TIME_INT,v_wtdraw_time);
                    lpPubMsg->SetString(LDBIZ_WTDRAW_STATUS_STR,v_wtdraw_status);
                    lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
                    lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
                    lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
                    glpPubSub_Interface->PubTopics("futu.rptwtdraw", lpPubMsg);

            // end if;
            }


        // [遍历结果集结束][lpMainMsg2]
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
        if(lpTSCall1Ans17)
        {
          lpTSCall1Ans17->FreeMsg();
          lpTSCall1Ans17=NULL;
        }
        lpTSCall1Req17=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req17->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req17->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req17->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req17->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req17->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req17->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req17->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req17->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req17->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req17->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req17, &lpTSCall1Ans17, 5000);
        if (lpTSCall1Ans17)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans17->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans17->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans17->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans17->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans17->GetString(LDBIZ_ERROR_DEAL_STR));
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
    if(lpTSCall1Ans13)
        lpTSCall1Ans13->FreeMsg();
    if(lpTSCall1Ans14)
        lpTSCall1Ans14->FreeMsg();
    if(lpTSCall1Ans15)
        lpTSCall1Ans15->FreeMsg();
    if(lpTSCall1Ans16)
        lpTSCall1Ans16->FreeMsg();
    if(lpTSCall1Ans17)
        lpTSCall1Ans17->FreeMsg();
    return iRet;
}

//逻辑_交易期货_指令_审批指令
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
    int v_exch_no;
    int64 v_comm_id;
    int v_comm_date;
    char v_comm_appr_status[3];
    char v_comm_appr_remark[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_comm_status[3];
    int64 v_order_id;
    char v_tmp_comm_appr_status[3];
    char v_tmp_comm_appr_remark[256];
    int v_price_type;
    int64 v_row_id;
    int v_init_date;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    char v_exch_crncy_type[4];
    int v_futu_acco_no;
    int v_contrc_code_no;
    char v_contrc_code[7];
    int v_contrc_type;
    int v_asset_type;
    int v_contrc_dir;
    int v_hedge_type;
    int v_comm_time;
    int v_comm_batch_no;
    int v_comm_opor;
    int v_comm_executor;
    int v_comm_dir;
    double v_comm_limit_price;
    double v_limit_actual_price;
    double v_comm_qty;
    double v_comm_amt;
    double v_order_qty;
    double v_comm_cancel_qty;
    double v_strike_amt;
    double v_strike_qty;
    double v_comm_frozen_amt;
    double v_comm_frozen_qty;
    double v_rece_margin;
    int v_capit_reback_days;
    int v_posi_reback_days;
    char v_strike_status[3];
    int v_comm_begin_date;
    int v_comm_end_date;
    int v_comm_begin_time;
    int v_comm_end_time;
    int v_comm_comple_date;
    int v_comm_comple_time;
    int v_comm_appr_date;
    int v_comm_appr_time;
    int v_comm_appr_oper_no;
    int v_comm_appr_oper;
    int64 v_external_no;
    char v_comb_code[7];
    char v_comm_oper_way[3];
    char v_remark_info[256];
    int v_comm_comple_flag;
    int v_update_times;
    int v_order_dir;
    double v_order_price;
    char v_co_busi_config_str[65];
    char v_exgp_busi_config_str[65];
    char v_crncy_type[4];
    int v_contrc_unit;
    int v_co_comm_appr_oper;
    char v_sys_config_str[65];
    char v_busi_config_str[65];
    char v_busi_ctrl_str[65];
    char v_asac_busi_config_str[65];
    char v_split_fee_typr_str[65];
    char v_busi_limit_str[2049];
    int v_pass_no;
    char v_out_acco[33];
    double v_nav_asset;
    double v_pre_settle_price;
    double v_up_limit_price;
    double v_down_limit_price;
    double v_last_price;
    int v_lngsht_type;
    int v_calc_dir;
    int v_comb_type;
    char v_futu_acco[17];
    double v_exgp_avail_amt;
    double v_asac_avail_amt;
    double v_exgp_avail_qty;
    double v_asac_avail_qty;
    double v_exgp_long_rece_margin;
    double v_exgp_short_rece_margin;
    double v_asac_long_rece_margin;
    double v_asac_short_rece_margin;
    double v_exgp_long_stock_rece_margin;
    double v_exgp_short_stock_rece_margin;
    double v_trade_commis;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_deli_fee;
    double v_other_fee;
    double v_other_commis;
    double v_all_fee;
    int v_margin_pref;
    double v_margin_ratio;
    double v_trade_fee;
    int v_appr_allow_order_flag;
    int v_trig_stage_type;
    int64 v_compli_trig_id;
    int v_stock_type;
    int v_order_date;
    int v_order_time;
    int v_order_batch_no;
    char v_order_status[3];
    double v_order_frozen_amt;
    double v_order_frozen_qty;
    char v_order_oper_way[3];
    int64 v_exgp_row_id;
    double v_exgp_begin_amt;
    double v_exgp_curr_amt;
    double v_exgp_frozen_amt;
    double v_exgp_unfroz_amt;
    double v_exgp_comm_frozen_amt;
    double v_exgp_comm_unfroz_amt;
    double v_exgp_comm_capt_amt;
    double v_exgp_comm_releas_amt;
    double v_exgp_trade_capt_amt;
    double v_exgp_trade_releas_amt;
    double v_exgp_strike_capt_amt;
    double v_exgp_strike_releas_amt;
    double v_exgp_capt_margin;
    double v_exgp_trade_fee;
    double v_exgp_strike_fee;
    double v_exgp_close_pandl;
    double v_exgp_marked_pandl;
    int v_exgp_cash_update_times;
    int64 v_asac_row_id;
    double v_asac_begin_amt;
    double v_asac_curr_amt;
    double v_asac_frozen_amt;
    double v_asac_unfroz_amt;
    double v_asac_comm_frozen_amt;
    double v_asac_comm_unfroz_amt;
    double v_asac_comm_capt_amt;
    double v_asac_comm_releas_amt;
    double v_asac_trade_capt_amt;
    double v_asac_trade_releas_amt;
    double v_asac_strike_capt_amt;
    double v_asac_strike_releas_amt;
    double v_asac_capt_margin;
    double v_asac_trade_fee;
    double v_asac_strike_fee;
    double v_asac_close_pandl;
    double v_asac_marked_pandl;
    int v_asac_cash_update_times;
    double v_exgp_frozen_qty;
    double v_exgp_unfroz_qty;
    double v_exgp_comm_releas_qty;
    double v_exgp_trade_releas_qty;
    double v_exgp_strike_releas_qty;
    double v_exgp_old_comm_capt_qty;
    double v_exgp_today_comm_capt_qty;
    double v_exgp_old_trade_capt_qty;
    double v_exgp_today_trade_capt_qty;
    double v_exgp_pre_strike_capt_qty;
    double v_exgp_today_strike_capt_qty;
    double v_exgp_rece_margin;
    double v_exgp_realize_pandl;
    double v_exgp_open_amount;
    int v_exgp_posi_update_times;
    double v_asac_frozen_qty;
    double v_asac_unfroz_qty;
    double v_asac_comm_releas_qty;
    double v_asac_trade_releas_qty;
    double v_asac_strike_releas_qty;
    double v_asac_old_comm_capt_qty;
    double v_asac_today_comm_capt_qty;
    double v_asac_old_trade_capt_qty;
    double v_asac_today_trade_capt_qty;
    double v_asac_pre_strike_capt_qty;
    double v_asac_today_strike_capt_qty;
    double v_asac_rece_margin;
    double v_asac_realize_pandl;
    double v_asac_open_amount;
    int v_asac_posi_update_times;
    double v_comm_await_cancel_qty;
    char v_comm_sum_status[3];
    int v_max_comm_comple_date;
    int v_max_comm_comple_time;
    double v_comm_appr_qty;
    char v_comm_sum_approve_status[3];
    double v_buy_order_qty;
    double v_sell_order_qty;
    double v_buy_comm_qty;
    double v_sell_comm_qty;
    double v_buy_strike_qty;
    double v_sell_strike_qty;
    double v_buy_strike_amt;
    double v_sell_strike_amt;
    double v_buy_comm_amt;
    double v_sell_comm_amt;
    double v_wtdraw_qty;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    char v_rsp_info[256];
    double v_curr_strike_price;
    double v_curr_strike_amt;
    double v_curr_strike_qty;
    int64 v_strike_id;
    double v_strike_price;
    char v_oper_func_code[17];
    char v_order_sum_status[3];
    double v_waste_qty;
    double v_strike_aver_price;
    double v_strike_commis;
    double v_strike_other_commis;
    double v_strike_all_fee;
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
    v_exch_no=0;
    v_comm_id=0;
    v_comm_date=0;
    strcpy(v_comm_appr_status, " ");
    strcpy(v_comm_appr_remark, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_comm_status, "0");
    v_order_id=0;
    strcpy(v_tmp_comm_appr_status, " ");
    strcpy(v_tmp_comm_appr_remark, " ");
    v_price_type=0;
    v_row_id=0;
    v_init_date=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    strcpy(v_exch_crncy_type, "CNY");
    v_futu_acco_no=0;
    v_contrc_code_no=0;
    strcpy(v_contrc_code, " ");
    v_contrc_type=0;
    v_asset_type=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    v_comm_time=0;
    v_comm_batch_no=0;
    v_comm_opor=0;
    v_comm_executor=0;
    v_comm_dir=0;
    v_comm_limit_price=0;
    v_limit_actual_price=0;
    v_comm_qty=0;
    v_comm_amt=0;
    v_order_qty=0;
    v_comm_cancel_qty=0;
    v_strike_amt=0;
    v_strike_qty=0;
    v_comm_frozen_amt=0;
    v_comm_frozen_qty=0;
    v_rece_margin=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    strcpy(v_strike_status, "0");
    v_comm_begin_date=0;
    v_comm_end_date=0;
    v_comm_begin_time=0;
    v_comm_end_time=0;
    v_comm_comple_date=0;
    v_comm_comple_time=0;
    v_comm_appr_date=0;
    v_comm_appr_time=0;
    v_comm_appr_oper_no=0;
    v_comm_appr_oper=0;
    v_external_no=0;
    strcpy(v_comb_code, " ");
    strcpy(v_comm_oper_way, " ");
    strcpy(v_remark_info, " ");
    v_comm_comple_flag=0;
    v_update_times=1;
    v_order_dir=0;
    v_order_price=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_exgp_busi_config_str, " ");
    strcpy(v_crncy_type, "CNY");
    v_contrc_unit=0;
    v_co_comm_appr_oper=0;
    strcpy(v_sys_config_str, " ");
    strcpy(v_busi_config_str, " ");
    strcpy(v_busi_ctrl_str, " ");
    strcpy(v_asac_busi_config_str, " ");
    strcpy(v_split_fee_typr_str, " ");
    strcpy(v_busi_limit_str, " ");
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_nav_asset=0;
    v_pre_settle_price=0;
    v_up_limit_price=0;
    v_down_limit_price=0;
    v_last_price=0;
    v_lngsht_type=0;
    v_calc_dir=1;
    v_comb_type=0;
    strcpy(v_futu_acco, " ");
    v_exgp_avail_amt=0;
    v_asac_avail_amt=0;
    v_exgp_avail_qty=0;
    v_asac_avail_qty=0;
    v_exgp_long_rece_margin=0;
    v_exgp_short_rece_margin=0;
    v_asac_long_rece_margin=0;
    v_asac_short_rece_margin=0;
    v_exgp_long_stock_rece_margin=0;
    v_exgp_short_stock_rece_margin=0;
    v_trade_commis=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_deli_fee=0;
    v_other_fee=0;
    v_other_commis=0;
    v_all_fee=0;
    v_margin_pref=0;
    v_margin_ratio=0;
    v_trade_fee=0;
    v_appr_allow_order_flag=0;
    v_trig_stage_type=0;
    v_compli_trig_id=0;
    v_stock_type=0;
    v_order_date=0;
    v_order_time=0;
    v_order_batch_no=0;
    strcpy(v_order_status, "0");
    v_order_frozen_amt=0;
    v_order_frozen_qty=0;
    strcpy(v_order_oper_way, " ");
    v_exgp_row_id=0;
    v_exgp_begin_amt=0;
    v_exgp_curr_amt=0;
    v_exgp_frozen_amt=0;
    v_exgp_unfroz_amt=0;
    v_exgp_comm_frozen_amt=0;
    v_exgp_comm_unfroz_amt=0;
    v_exgp_comm_capt_amt=0;
    v_exgp_comm_releas_amt=0;
    v_exgp_trade_capt_amt=0;
    v_exgp_trade_releas_amt=0;
    v_exgp_strike_capt_amt=0;
    v_exgp_strike_releas_amt=0;
    v_exgp_capt_margin=0;
    v_exgp_trade_fee=0;
    v_exgp_strike_fee=0;
    v_exgp_close_pandl=0;
    v_exgp_marked_pandl=0;
    v_exgp_cash_update_times=1;
    v_asac_row_id=0;
    v_asac_begin_amt=0;
    v_asac_curr_amt=0;
    v_asac_frozen_amt=0;
    v_asac_unfroz_amt=0;
    v_asac_comm_frozen_amt=0;
    v_asac_comm_unfroz_amt=0;
    v_asac_comm_capt_amt=0;
    v_asac_comm_releas_amt=0;
    v_asac_trade_capt_amt=0;
    v_asac_trade_releas_amt=0;
    v_asac_strike_capt_amt=0;
    v_asac_strike_releas_amt=0;
    v_asac_capt_margin=0;
    v_asac_trade_fee=0;
    v_asac_strike_fee=0;
    v_asac_close_pandl=0;
    v_asac_marked_pandl=0;
    v_asac_cash_update_times=1;
    v_exgp_frozen_qty=0;
    v_exgp_unfroz_qty=0;
    v_exgp_comm_releas_qty=0;
    v_exgp_trade_releas_qty=0;
    v_exgp_strike_releas_qty=0;
    v_exgp_old_comm_capt_qty=0;
    v_exgp_today_comm_capt_qty=0;
    v_exgp_old_trade_capt_qty=0;
    v_exgp_today_trade_capt_qty=0;
    v_exgp_pre_strike_capt_qty=0;
    v_exgp_today_strike_capt_qty=0;
    v_exgp_rece_margin=0;
    v_exgp_realize_pandl=0;
    v_exgp_open_amount=0;
    v_exgp_posi_update_times=1;
    v_asac_frozen_qty=0;
    v_asac_unfroz_qty=0;
    v_asac_comm_releas_qty=0;
    v_asac_trade_releas_qty=0;
    v_asac_strike_releas_qty=0;
    v_asac_old_comm_capt_qty=0;
    v_asac_today_comm_capt_qty=0;
    v_asac_old_trade_capt_qty=0;
    v_asac_today_trade_capt_qty=0;
    v_asac_pre_strike_capt_qty=0;
    v_asac_today_strike_capt_qty=0;
    v_asac_rece_margin=0;
    v_asac_realize_pandl=0;
    v_asac_open_amount=0;
    v_asac_posi_update_times=1;
    v_comm_await_cancel_qty=0;
    strcpy(v_comm_sum_status, "0");
    v_max_comm_comple_date=0;
    v_max_comm_comple_time=0;
    v_comm_appr_qty=0;
    strcpy(v_comm_sum_approve_status, "0");
    v_buy_order_qty=0;
    v_sell_order_qty=0;
    v_buy_comm_qty=0;
    v_sell_comm_qty=0;
    v_buy_strike_qty=0;
    v_sell_strike_qty=0;
    v_buy_strike_amt=0;
    v_sell_strike_amt=0;
    v_buy_comm_amt=0;
    v_sell_comm_amt=0;
    v_wtdraw_qty=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    strcpy(v_rsp_info, " ");
    v_curr_strike_price=0;
    v_curr_strike_amt=0;
    v_curr_strike_qty=0;
    v_strike_id=0;
    v_strike_price=0;
    strcpy(v_oper_func_code, " ");
    strcpy(v_order_sum_status, "0");
    v_waste_qty=0;
    v_strike_aver_price=0;
    v_strike_commis=0;
    v_strike_other_commis=0;
    v_strike_all_fee=0;
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
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_date = lpInBizMsg->GetInt32(LDBIZ_COMM_DATE_INT);
    strncpy(v_comm_appr_status, lpInBizMsg->GetString(LDBIZ_COMM_APPR_STATUS_STR),2);
    v_comm_appr_status[2] = '\0';
    strncpy(v_comm_appr_remark, lpInBizMsg->GetString(LDBIZ_COMM_APPR_REMARK_STR),255);
    v_comm_appr_remark[255] = '\0';

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
    IFastMessage* lpTSCall1Req13 = NULL;
    IFastMessage* lpTSCall1Ans13 = NULL;
    IFastMessage* lpTSCall1Req14 = NULL;
    IFastMessage* lpTSCall1Ans14 = NULL;
    IFastMessage* lpTSCall1Req15 = NULL;
    IFastMessage* lpTSCall1Ans15 = NULL;
    IFastMessage* lpTSCall1Req16 = NULL;
    IFastMessage* lpTSCall1Ans16 = NULL;


    // set @临时_指令审批状态# = @指令审批状态#;
    strcpy(v_tmp_comm_appr_status,v_comm_appr_status);

    // set @临时_指令审批说明# = @指令审批说明#;
    strcpy(v_tmp_comm_appr_remark,v_comm_appr_remark);

    // set @价格类型# = 0;
    v_price_type = 0;
    //获取指令信息
    //调用过程[事务_交易期货_指令_获取指令]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.3", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.3]subcall timed out!");
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
    v_row_id = lpTSCall1Ans0->GetInt64(LDBIZ_ROW_ID_INT64);
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    v_co_no = lpTSCall1Ans0->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans0->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strcpy(v_exch_crncy_type, lpTSCall1Ans0->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_exch_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_NO_INT);
    v_futu_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    v_contrc_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strcpy(v_contrc_code, lpTSCall1Ans0->GetString(LDBIZ_CONTRC_CODE_STR));
    v_contrc_type = lpTSCall1Ans0->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_asset_type = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_contrc_dir = lpTSCall1Ans0->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpTSCall1Ans0->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_comm_date = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_time = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_TIME_INT);
    v_comm_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_opor = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_comm_executor = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_comm_dir = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_DIR_INT);
    v_comm_limit_price = lpTSCall1Ans0->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
    v_limit_actual_price = lpTSCall1Ans0->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
    v_comm_qty = lpTSCall1Ans0->GetDouble(LDBIZ_COMM_QTY_FLOAT);
    v_comm_amt = lpTSCall1Ans0->GetDouble(LDBIZ_COMM_AMT_FLOAT);
    v_order_qty = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_comm_cancel_qty = lpTSCall1Ans0->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_qty = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_comm_frozen_amt = lpTSCall1Ans0->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
    v_comm_frozen_qty = lpTSCall1Ans0->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
    v_rece_margin = lpTSCall1Ans0->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_capit_reback_days = lpTSCall1Ans0->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans0->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    strcpy(v_strike_status, lpTSCall1Ans0->GetString(LDBIZ_STRIKE_STATUS_STR));
    strcpy(v_comm_status, lpTSCall1Ans0->GetString(LDBIZ_COMM_STATUS_STR));
    v_comm_begin_date = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
    v_comm_end_date = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_END_DATE_INT);
    v_comm_begin_time = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
    v_comm_end_time = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_END_TIME_INT);
    v_comm_comple_date = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
    v_comm_comple_time = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
    v_comm_appr_date = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
    v_comm_appr_time = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
    strcpy(v_comm_appr_status, lpTSCall1Ans0->GetString(LDBIZ_COMM_APPR_STATUS_STR));
    v_comm_appr_oper_no = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_APPR_OPER_NO_INT);
    v_comm_appr_oper = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
    strcpy(v_comm_appr_remark, lpTSCall1Ans0->GetString(LDBIZ_COMM_APPR_REMARK_STR));
    v_external_no = lpTSCall1Ans0->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    strcpy(v_comb_code, lpTSCall1Ans0->GetString(LDBIZ_COMB_CODE_STR));
    strcpy(v_comm_oper_way, lpTSCall1Ans0->GetString(LDBIZ_COMM_OPER_WAY_STR));
    strcpy(v_remark_info, lpTSCall1Ans0->GetString(LDBIZ_REMARK_INFO_STR));
    v_comm_comple_flag = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
    v_update_times = lpTSCall1Ans0->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // set @指令审批状态# = @临时_指令审批状态#;
    strcpy(v_comm_appr_status,v_tmp_comm_appr_status);

    // set @指令审批说明# = @临时_指令审批说明#;
    strcpy(v_comm_appr_remark,v_tmp_comm_appr_remark);

    // set @订单方向# = @指令方向#;
    v_order_dir = v_comm_dir;

    // set @订单数量# = @指令数量#;
    v_order_qty = v_comm_qty;

    // set @订单价格# = @指令实际限价#;
    v_order_price = v_limit_actual_price;
    //公共子系统检查
    //调用过程[事务_公共_交易接口_检查期货指令市场状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.25.136", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpTSCall1Req1->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req1->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req1->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    lpTSCall1Req1->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.136]subcall timed out!");
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
    v_init_date = lpTSCall1Ans1->GetInt32(LDBIZ_INIT_DATE_INT);
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans1->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));
    strcpy(v_exgp_busi_config_str, lpTSCall1Ans1->GetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR));
    v_contrc_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_contrc_type = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_CRNCY_TYPE_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_contrc_unit = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_UNIT_INT);
    v_capit_reback_days = lpTSCall1Ans1->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans1->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    v_co_comm_appr_oper = lpTSCall1Ans1->GetInt32(LDBIZ_CO_COMM_APPR_OPER_INT);
    strcpy(v_sys_config_str, lpTSCall1Ans1->GetString(LDBIZ_SYS_CONFIG_STR_STR));


    // set @业务控制配置串# = @交易组业务控制配置串#;
    strcpy(v_busi_config_str,v_exgp_busi_config_str);
    //产品子系统检查，检查账户状态，获取当前资金等

    // set @业务控制串# = "11111";
    strcpy(v_busi_ctrl_str,"11111");
    //调用过程[事务_产品_交易接口_检查期货审批产品账户信息]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("prodT.8.110", 0);
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
    lpTSCall1Req2->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req2->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req2->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req2->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
    lpTSCall1Req2->SetString(LDBIZ_BUSI_CONFIG_STR_STR,v_busi_config_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.8.110]subcall timed out!");
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
    strcpy(v_exgp_busi_config_str, lpTSCall1Ans2->GetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR));
    strcpy(v_asac_busi_config_str, lpTSCall1Ans2->GetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR));
    strcpy(v_split_fee_typr_str, lpTSCall1Ans2->GetString(LDBIZ_SPLIT_FEE_TYPR_STR_STR));
    strcpy(v_busi_limit_str, lpTSCall1Ans2->GetString(LDBIZ_BUSI_LIMIT_STR_STR));
    v_pass_no = lpTSCall1Ans2->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans2->GetString(LDBIZ_OUT_ACCO_STR));
    v_nav_asset = lpTSCall1Ans2->GetDouble(LDBIZ_NAV_ASSET_FLOAT);

    //获取指令实际限价
    //调用过程[事务_公共_公共接口_获取合约编号行情价格]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.24.501", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.501]subcall timed out!");
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
    v_pre_settle_price = lpTSCall1Ans3->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
    v_up_limit_price = lpTSCall1Ans3->GetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT);
    v_down_limit_price = lpTSCall1Ans3->GetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
    v_last_price = lpTSCall1Ans3->GetDouble(LDBIZ_LAST_PRICE_FLOAT);

    //根据订单方向和开平方向确定多空类型
    //调用过程[事务_交易期货_交易_获取多空类型]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.26", 0);
    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.26]subcall timed out!");
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
    v_lngsht_type = lpTSCall1Ans4->GetInt32(LDBIZ_LNGSHT_TYPE_INT);


    // set @资产类型#=《资产类型-期货》;
    v_asset_type=31;
    //公共子系统检查，检查交易日期时间

    // set @计算方向#=《计算方向-加上》;
    v_calc_dir=1;
    //获取该合约代码对应的组合编码
    //调用过程[事务_公共_公共接口_获取保证金优惠组合编码]
    //组织事务请求
    if(lpTSCall1Ans5)
    {
      lpTSCall1Ans5->FreeMsg();
      lpTSCall1Ans5=NULL;
    }
    lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pubT.24.256", 0);
    lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req5->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req5->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpTSCall1Req5->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
    if(!lpTSCall1Ans5)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.256]subcall timed out!");
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
    strcpy(v_comb_code, lpTSCall1Ans5->GetString(LDBIZ_COMB_CODE_STR));
    v_comb_type = lpTSCall1Ans5->GetInt32(LDBIZ_COMB_TYPE_INT);

    //从产品期货的持仓表中获得交易组可用数量和资产账户可用
    //调用过程[事务_产品期货_交易接口_检查账户状态获取可用]
    //组织事务请求
    if(lpTSCall1Ans6)
    {
      lpTSCall1Ans6->FreeMsg();
      lpTSCall1Ans6=NULL;
    }
    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("pdfutuT.6.1", 0);
    lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req6->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req6->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req6->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req6->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req6->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req6->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpTSCall1Req6->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req6->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req6->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req6->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
    if(!lpTSCall1Ans6)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.6.1]subcall timed out!");
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
    v_futu_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    strcpy(v_futu_acco, lpTSCall1Ans6->GetString(LDBIZ_FUTU_ACCO_STR));
    v_exgp_avail_amt = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_AVAIL_AMT_FLOAT);
    v_asac_avail_amt = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_AVAIL_AMT_FLOAT);
    v_exgp_avail_qty = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT);
    v_asac_avail_qty = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT);
    v_exgp_long_rece_margin = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT);
    v_exgp_short_rece_margin = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT);
    v_asac_long_rece_margin = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT);
    v_asac_short_rece_margin = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT);
    v_exgp_long_stock_rece_margin = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_LONG_STOCK_RECE_MARGIN_FLOAT);
    v_exgp_short_stock_rece_margin = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_SHORT_STOCK_RECE_MARGIN_FLOAT);

    //获取保证金优惠订单费用
    //调用过程[事务_公共_公共接口_获取保证金优惠组合编码订单费用]
    //组织事务请求
    if(lpTSCall1Ans7)
    {
      lpTSCall1Ans7->FreeMsg();
      lpTSCall1Ans7=NULL;
    }
    lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("pubT.24.255", 0);
    lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req7->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req7->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req7->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req7->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req7->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req7->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpTSCall1Req7->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req7->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req7->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req7->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req7->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
    if(!lpTSCall1Ans7)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.255]subcall timed out!");
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
    v_rece_margin = lpTSCall1Ans7->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_trade_commis = lpTSCall1Ans7->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_report_fee = lpTSCall1Ans7->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
    v_wtdraw_fee = lpTSCall1Ans7->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
    v_deli_fee = lpTSCall1Ans7->GetDouble(LDBIZ_DELI_FEE_FLOAT);
    v_other_fee = lpTSCall1Ans7->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
    v_other_commis = lpTSCall1Ans7->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    v_all_fee = lpTSCall1Ans7->GetDouble(LDBIZ_ALL_FEE_FLOAT);
    v_margin_pref = lpTSCall1Ans7->GetInt32(LDBIZ_MARGIN_PREF_INT);
    strcpy(v_comb_code, lpTSCall1Ans7->GetString(LDBIZ_COMB_CODE_STR));
    v_margin_ratio = lpTSCall1Ans7->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);


    // set @交易费用# = @全部费用#;
    v_trade_fee = v_all_fee;
    //计算费用

    // set @审批通过自动下单# = 《审批通过自动下单-是》;
    v_appr_allow_order_flag = 1;

    // if @指令审批状态# = 《指令审批状态-审批通过》 and @审批通过自动下单# = 《审批通过自动下单-是》  then
    if (strcmp(v_comm_appr_status , "2")==0 && v_appr_allow_order_flag == 1 )
    {

        // set @触发阶段类型# = 《触发阶段类型-交易端》;
        v_trig_stage_type = 2;
        //调用过程[事务_风控期货_接口_检查客户风险]
        //组织事务请求
        if(lpTSCall1Ans8)
        {
          lpTSCall1Ans8->FreeMsg();
          lpTSCall1Ans8=NULL;
        }
        lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("rkfutuT.5.1", 0);
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
        lpTSCall1Req8->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req8->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req8->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
        lpTSCall1Req8->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
        lpTSCall1Req8->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
        lpTSCall1Req8->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
        lpTSCall1Req8->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
        lpTSCall1Req8->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpTSCall1Req8->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
        lpTSCall1Req8->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
        lpTSCall1Req8->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
        lpTSCall1Req8->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpTSCall1Req8->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
        lpTSCall1Req8->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
        lpTSCall1Req8->SetInt32(LDBIZ_TRIG_STAGE_TYPE_INT,v_trig_stage_type);
        glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
        if(!lpTSCall1Ans8)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rkfutuT.5.1]subcall timed out!");
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
        v_compli_trig_id = lpTSCall1Ans8->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);

    // end if;
    }

    //审批指令

    // set @指令审批操作员# = @操作员编号#;
    v_comm_appr_oper = v_opor_no;
    //调用过程[事务_交易期货_指令_审批指令]
    //组织事务请求
    if(lpTSCall1Ans9)
    {
      lpTSCall1Ans9->FreeMsg();
      lpTSCall1Ans9=NULL;
    }
    lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.5", 0);
    lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req9->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req9->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req9->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req9->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpTSCall1Req9->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req9->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpTSCall1Req9->SetString(LDBIZ_FUTU_ACCO_STR,v_futu_acco);
    lpTSCall1Req9->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
    lpTSCall1Req9->SetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT,v_exgp_avail_qty);
    lpTSCall1Req9->SetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT,v_asac_avail_qty);
    lpTSCall1Req9->SetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT,v_exgp_long_rece_margin);
    lpTSCall1Req9->SetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT,v_exgp_short_rece_margin);
    lpTSCall1Req9->SetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT,v_asac_long_rece_margin);
    lpTSCall1Req9->SetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT,v_asac_short_rece_margin);
    lpTSCall1Req9->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpTSCall1Req9->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req9->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
    lpTSCall1Req9->SetInt32(LDBIZ_COMM_APPR_OPER_INT,v_comm_appr_oper);
    lpTSCall1Req9->SetString(LDBIZ_COMM_APPR_STATUS_STR,v_comm_appr_status);
    lpTSCall1Req9->SetString(LDBIZ_COMM_APPR_REMARK_STR,v_comm_appr_remark);
    lpTSCall1Req9->SetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR,v_asac_busi_config_str);
    lpTSCall1Req9->SetDouble(LDBIZ_REPORT_FEE_FLOAT,v_report_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_WTDRAW_FEE_FLOAT,v_wtdraw_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_TRADE_FEE_FLOAT,v_trade_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
    lpTSCall1Req9->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
    lpTSCall1Req9->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpTSCall1Req9->SetInt64(LDBIZ_COMPLI_TRIG_ID_INT64,v_compli_trig_id);
    lpTSCall1Req9->SetDouble(LDBIZ_MARGIN_RATIO_FLOAT,v_margin_ratio);
    glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
    if(!lpTSCall1Ans9)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.5]subcall timed out!");
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
    v_comm_batch_no = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_executor = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_order_id = lpTSCall1Ans9->GetInt64(LDBIZ_ORDER_ID_INT64);
    v_pd_no = lpTSCall1Ans9->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans9->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans9->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpTSCall1Ans9->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_type = lpTSCall1Ans9->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_order_date = lpTSCall1Ans9->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_order_time = lpTSCall1Ans9->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_order_batch_no = lpTSCall1Ans9->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_order_dir = lpTSCall1Ans9->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_external_no = lpTSCall1Ans9->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_price_type = lpTSCall1Ans9->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_order_price = lpTSCall1Ans9->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    strcpy(v_order_status, lpTSCall1Ans9->GetString(LDBIZ_ORDER_STATUS_STR));
    v_order_frozen_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
    v_order_frozen_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT);
    strcpy(v_order_oper_way, lpTSCall1Ans9->GetString(LDBIZ_ORDER_OPER_WAY_STR));
    v_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_UPDATE_TIMES_INT);
    v_appr_allow_order_flag = lpTSCall1Ans9->GetInt32(LDBIZ_APPR_ALLOW_ORDER_FLAG_INT);

    //主推
    //调用过程[事务_交易期货_指令_获取指令]
    //组织事务请求
    if(lpTSCall1Ans10)
    {
      lpTSCall1Ans10->FreeMsg();
      lpTSCall1Ans10=NULL;
    }
    lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.3", 0);
    lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req10->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
    if(!lpTSCall1Ans10)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.3]subcall timed out!");
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
    v_row_id = lpTSCall1Ans10->GetInt64(LDBIZ_ROW_ID_INT64);
    v_init_date = lpTSCall1Ans10->GetInt32(LDBIZ_INIT_DATE_INT);
    v_co_no = lpTSCall1Ans10->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans10->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans10->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans10->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strcpy(v_exch_crncy_type, lpTSCall1Ans10->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_exch_no = lpTSCall1Ans10->GetInt32(LDBIZ_EXCH_NO_INT);
    v_futu_acco_no = lpTSCall1Ans10->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    v_contrc_code_no = lpTSCall1Ans10->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strcpy(v_contrc_code, lpTSCall1Ans10->GetString(LDBIZ_CONTRC_CODE_STR));
    v_contrc_type = lpTSCall1Ans10->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_asset_type = lpTSCall1Ans10->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_contrc_dir = lpTSCall1Ans10->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpTSCall1Ans10->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_comm_date = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_time = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_TIME_INT);
    v_comm_batch_no = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_opor = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_comm_executor = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_comm_dir = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_DIR_INT);
    v_comm_limit_price = lpTSCall1Ans10->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
    v_limit_actual_price = lpTSCall1Ans10->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
    v_comm_qty = lpTSCall1Ans10->GetDouble(LDBIZ_COMM_QTY_FLOAT);
    v_comm_amt = lpTSCall1Ans10->GetDouble(LDBIZ_COMM_AMT_FLOAT);
    v_order_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_comm_cancel_qty = lpTSCall1Ans10->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans10->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_qty = lpTSCall1Ans10->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_comm_frozen_amt = lpTSCall1Ans10->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
    v_comm_frozen_qty = lpTSCall1Ans10->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
    v_rece_margin = lpTSCall1Ans10->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_capit_reback_days = lpTSCall1Ans10->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans10->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    strcpy(v_strike_status, lpTSCall1Ans10->GetString(LDBIZ_STRIKE_STATUS_STR));
    strcpy(v_comm_status, lpTSCall1Ans10->GetString(LDBIZ_COMM_STATUS_STR));
    v_comm_begin_date = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
    v_comm_end_date = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_END_DATE_INT);
    v_comm_begin_time = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
    v_comm_end_time = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_END_TIME_INT);
    v_comm_comple_date = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
    v_comm_comple_time = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
    v_comm_appr_date = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
    v_comm_appr_time = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
    strcpy(v_comm_appr_status, lpTSCall1Ans10->GetString(LDBIZ_COMM_APPR_STATUS_STR));
    v_comm_appr_oper_no = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_APPR_OPER_NO_INT);
    v_comm_appr_oper = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
    strcpy(v_comm_appr_remark, lpTSCall1Ans10->GetString(LDBIZ_COMM_APPR_REMARK_STR));
    v_external_no = lpTSCall1Ans10->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    strcpy(v_comb_code, lpTSCall1Ans10->GetString(LDBIZ_COMB_CODE_STR));
    strcpy(v_comm_oper_way, lpTSCall1Ans10->GetString(LDBIZ_COMM_OPER_WAY_STR));
    strcpy(v_remark_info, lpTSCall1Ans10->GetString(LDBIZ_REMARK_INFO_STR));
    v_comm_comple_flag = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
    v_update_times = lpTSCall1Ans10->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // [主动推送][futu.comm][期货主推_指令_指令主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.92", 0);
    lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpPubMsg->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_TIME_INT,v_comm_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpPubMsg->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpPubMsg->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpPubMsg->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
    lpPubMsg->SetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT,v_comm_limit_price);
    lpPubMsg->SetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,v_limit_actual_price);
    lpPubMsg->SetDouble(LDBIZ_COMM_QTY_FLOAT,v_comm_qty);
    lpPubMsg->SetDouble(LDBIZ_COMM_AMT_FLOAT,v_comm_amt);
    lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpPubMsg->SetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT,v_comm_cancel_qty);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
    lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT,v_comm_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
    lpPubMsg->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
    lpPubMsg->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
    lpPubMsg->SetString(LDBIZ_STRIKE_STATUS_STR,v_strike_status);
    lpPubMsg->SetString(LDBIZ_COMM_STATUS_STR,v_comm_status);
    lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_DATE_INT,v_comm_begin_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_END_DATE_INT,v_comm_end_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_TIME_INT,v_comm_begin_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_END_TIME_INT,v_comm_end_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_DATE_INT,v_comm_comple_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_TIME_INT,v_comm_comple_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_APPR_DATE_INT,v_comm_appr_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_APPR_TIME_INT,v_comm_appr_time);
    lpPubMsg->SetString(LDBIZ_COMM_APPR_STATUS_STR,v_comm_appr_status);
    lpPubMsg->SetInt32(LDBIZ_COMM_APPR_OPER_INT,v_comm_appr_oper);
    lpPubMsg->SetString(LDBIZ_COMM_APPR_REMARK_STR,v_comm_appr_remark);
    lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpPubMsg->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
    lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_FLAG_INT,v_comm_comple_flag);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("futu.comm", lpPubMsg);

    //主推交易组和资产账户资金
    //调用过程[事务_交易期货_账户_获取交易组资产账户资金]
    //组织事务请求
    if(lpTSCall1Ans11)
    {
      lpTSCall1Ans11->FreeMsg();
      lpTSCall1Ans11=NULL;
    }
    lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.11", 0);
    lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req11->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req11->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req11->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
    if(!lpTSCall1Ans11)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.11]subcall timed out!");
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
    v_exgp_row_id = lpTSCall1Ans11->GetInt64(LDBIZ_EXGP_ROW_ID_INT64);
    v_co_no = lpTSCall1Ans11->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans11->GetInt32(LDBIZ_PD_NO_INT);
    v_exgp_begin_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT);
    v_exgp_curr_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT);
    v_exgp_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
    v_exgp_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
    v_exgp_comm_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
    v_exgp_comm_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
    v_exgp_comm_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
    v_exgp_comm_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
    v_exgp_trade_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
    v_exgp_trade_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
    v_exgp_strike_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
    v_exgp_strike_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
    v_exgp_capt_margin = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_CAPT_MARGIN_FLOAT);
    v_exgp_trade_fee = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_FEE_FLOAT);
    v_exgp_strike_fee = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_FEE_FLOAT);
    v_exgp_close_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_CLOSE_PANDL_FLOAT);
    v_exgp_marked_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_MARKED_PANDL_FLOAT);
    v_exgp_cash_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
    v_asac_row_id = lpTSCall1Ans11->GetInt64(LDBIZ_ASAC_ROW_ID_INT64);
    v_asac_begin_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_BEGIN_AMT_FLOAT);
    v_asac_curr_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_CURR_AMT_FLOAT);
    v_asac_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
    v_asac_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
    v_asac_comm_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
    v_asac_comm_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
    v_asac_comm_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
    v_asac_comm_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
    v_asac_trade_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
    v_asac_trade_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
    v_asac_strike_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
    v_asac_strike_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
    v_asac_capt_margin = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_CAPT_MARGIN_FLOAT);
    v_asac_trade_fee = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_FEE_FLOAT);
    v_asac_strike_fee = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_FEE_FLOAT);
    v_asac_close_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_CLOSE_PANDL_FLOAT);
    v_asac_marked_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_MARKED_PANDL_FLOAT);
    v_asac_cash_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);


    // [主动推送][futu.exgpcapital][期货主推_资金_交易组资金主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.110", 0);
    lpPubMsg->SetInt64(LDBIZ_EXGP_ROW_ID_INT64,v_exgp_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT,v_exgp_begin_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT,v_exgp_curr_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT,v_exgp_comm_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT,v_exgp_comm_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT,v_exgp_comm_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT,v_exgp_comm_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT,v_exgp_trade_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT,v_exgp_trade_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT,v_exgp_strike_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT,v_exgp_strike_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_CAPT_MARGIN_FLOAT,v_exgp_capt_margin);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FEE_FLOAT,v_exgp_trade_fee);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FEE_FLOAT,v_exgp_strike_fee);
    lpPubMsg->SetDouble(LDBIZ_EXGP_CLOSE_PANDL_FLOAT,v_exgp_close_pandl);
    lpPubMsg->SetDouble(LDBIZ_EXGP_MARKED_PANDL_FLOAT,v_exgp_marked_pandl);
    lpPubMsg->SetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT,v_exgp_cash_update_times);
    glpPubSub_Interface->PubTopics("futu.exgpcapital", lpPubMsg);


    // [主动推送][futu.asaccapital][期货主推_资金_资产账户资金主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.111", 0);
    lpPubMsg->SetInt64(LDBIZ_ASAC_ROW_ID_INT64,v_asac_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetDouble(LDBIZ_ASAC_BEGIN_AMT_FLOAT,v_asac_begin_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CURR_AMT_FLOAT,v_asac_curr_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT,v_asac_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT,v_asac_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT,v_asac_comm_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT,v_asac_comm_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT,v_asac_comm_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT,v_asac_comm_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT,v_asac_trade_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT,v_asac_trade_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT,v_asac_strike_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT,v_asac_strike_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CAPT_MARGIN_FLOAT,v_asac_capt_margin);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FEE_FLOAT,v_asac_trade_fee);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FEE_FLOAT,v_asac_strike_fee);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CLOSE_PANDL_FLOAT,v_asac_close_pandl);
    lpPubMsg->SetDouble(LDBIZ_ASAC_MARKED_PANDL_FLOAT,v_asac_marked_pandl);
    lpPubMsg->SetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT,v_asac_cash_update_times);
    glpPubSub_Interface->PubTopics("futu.asaccapital", lpPubMsg);

    //主推交易组和资产账户持仓
    //调用过程[事务_交易期货_账户_获取交易组资产账户持仓]
    //组织事务请求
    if(lpTSCall1Ans12)
    {
      lpTSCall1Ans12->FreeMsg();
      lpTSCall1Ans12=NULL;
    }
    lpTSCall1Req12=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.12", 0);
    lpTSCall1Req12->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req12->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req12->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req12->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req12->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req12->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req12->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req12->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req12->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req12->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req12->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req12->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req12->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpTSCall1Req12->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req12, &lpTSCall1Ans12, 5000);
    if(!lpTSCall1Ans12)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.12]subcall timed out!");
        iRet=-2;
        goto ENDSYS;
    }
    else if(lpTSCall1Ans12->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans12->GetInt32(LDTAG_ERRORNO));
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans12->GetString(LDTAG_ERRORINFO));
        iRet=-2;
        goto ENDSYS;
    }
    else if(strcmp(lpTSCall1Ans12->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
    {
        strcpy(v_error_code, lpTSCall1Ans12->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans12->GetString(LDBIZ_ERROR_INFO_STR));
        iRet=-1;
        goto END;
    }
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans12->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans12->GetString(LDBIZ_ERROR_INFO_STR));
    v_exgp_row_id = lpTSCall1Ans12->GetInt64(LDBIZ_EXGP_ROW_ID_INT64);
    v_co_no = lpTSCall1Ans12->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans12->GetInt32(LDBIZ_PD_NO_INT);
    strcpy(v_exch_crncy_type, lpTSCall1Ans12->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_contrc_type = lpTSCall1Ans12->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_unit = lpTSCall1Ans12->GetInt32(LDBIZ_CONTRC_UNIT_INT);
    strcpy(v_comb_code, lpTSCall1Ans12->GetString(LDBIZ_COMB_CODE_STR));
    v_exgp_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
    v_exgp_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
    v_exgp_comm_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
    v_exgp_trade_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
    v_exgp_strike_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
    v_exgp_old_comm_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_OLD_COMM_CAPT_QTY_FLOAT);
    v_exgp_today_comm_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TODAY_COMM_CAPT_QTY_FLOAT);
    v_exgp_old_trade_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_OLD_TRADE_CAPT_QTY_FLOAT);
    v_exgp_today_trade_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TODAY_TRADE_CAPT_QTY_FLOAT);
    v_exgp_pre_strike_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_PRE_STRIKE_CAPT_QTY_FLOAT);
    v_exgp_today_strike_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TODAY_STRIKE_CAPT_QTY_FLOAT);
    v_exgp_rece_margin = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_RECE_MARGIN_FLOAT);
    v_pre_settle_price = lpTSCall1Ans12->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
    v_exgp_realize_pandl = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
    v_exgp_open_amount = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_OPEN_AMOUNT_FLOAT);
    v_exgp_posi_update_times = lpTSCall1Ans12->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
    v_asac_row_id = lpTSCall1Ans12->GetInt64(LDBIZ_ASAC_ROW_ID_INT64);
    v_asac_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
    v_asac_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
    v_asac_comm_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
    v_asac_trade_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
    v_asac_strike_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
    v_asac_old_comm_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_OLD_COMM_CAPT_QTY_FLOAT);
    v_asac_today_comm_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TODAY_COMM_CAPT_QTY_FLOAT);
    v_asac_old_trade_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_OLD_TRADE_CAPT_QTY_FLOAT);
    v_asac_today_trade_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TODAY_TRADE_CAPT_QTY_FLOAT);
    v_asac_pre_strike_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_PRE_STRIKE_CAPT_QTY_FLOAT);
    v_asac_today_strike_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TODAY_STRIKE_CAPT_QTY_FLOAT);
    v_asac_rece_margin = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_RECE_MARGIN_FLOAT);
    v_asac_realize_pandl = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
    v_asac_open_amount = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_OPEN_AMOUNT_FLOAT);
    v_asac_posi_update_times = lpTSCall1Ans12->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


    // [主动推送][futu.exgpposi][期货主推_持仓_交易组持仓主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.130", 0);
    lpPubMsg->SetInt64(LDBIZ_EXGP_ROW_ID_INT64,v_exgp_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpPubMsg->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpPubMsg->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_OLD_COMM_CAPT_QTY_FLOAT,v_exgp_old_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TODAY_COMM_CAPT_QTY_FLOAT,v_exgp_today_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_OLD_TRADE_CAPT_QTY_FLOAT,v_exgp_old_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TODAY_TRADE_CAPT_QTY_FLOAT,v_exgp_today_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_PRE_STRIKE_CAPT_QTY_FLOAT,v_exgp_pre_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TODAY_STRIKE_CAPT_QTY_FLOAT,v_exgp_today_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_RECE_MARGIN_FLOAT,v_exgp_rece_margin);
    lpPubMsg->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
    lpPubMsg->SetDouble(LDBIZ_EXGP_OPEN_AMOUNT_FLOAT,v_exgp_open_amount);
    lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
    glpPubSub_Interface->PubTopics("futu.exgpposi", lpPubMsg);


    // [主动推送][futu.asacposi][期货主推_持仓_资产账户持仓主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.131", 0);
    lpPubMsg->SetInt64(LDBIZ_ASAC_ROW_ID_INT64,v_asac_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpPubMsg->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpPubMsg->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_OLD_COMM_CAPT_QTY_FLOAT,v_asac_old_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TODAY_COMM_CAPT_QTY_FLOAT,v_asac_today_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_OLD_TRADE_CAPT_QTY_FLOAT,v_asac_old_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TODAY_TRADE_CAPT_QTY_FLOAT,v_asac_today_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_PRE_STRIKE_CAPT_QTY_FLOAT,v_asac_pre_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TODAY_STRIKE_CAPT_QTY_FLOAT,v_asac_today_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_RECE_MARGIN_FLOAT,v_asac_rece_margin);
    lpPubMsg->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
    lpPubMsg->SetDouble(LDBIZ_ASAC_OPEN_AMOUNT_FLOAT,v_asac_open_amount);
    lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
    glpPubSub_Interface->PubTopics("futu.asacposi", lpPubMsg);


    // if @指令批号# >0 then
    if (v_comm_batch_no >0)
    {
        //调用过程[事务_交易期货_指令_获取指令汇总]
        //组织事务请求
        if(lpTSCall1Ans13)
        {
          lpTSCall1Ans13->FreeMsg();
          lpTSCall1Ans13=NULL;
        }
        lpTSCall1Req13=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.4", 0);
        lpTSCall1Req13->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req13->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req13->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req13->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req13->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req13->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req13->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req13->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req13->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
        lpTSCall1Req13->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpTSCall1Req13->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req13->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
        glpTSSubcallSerives->SubCall(lpTSCall1Req13, &lpTSCall1Ans13, 5000);
        if(!lpTSCall1Ans13)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.4]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans13->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans13->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans13->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans13->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans13->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans13->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans13->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans13->GetString(LDBIZ_ERROR_INFO_STR));
        v_row_id = lpTSCall1Ans13->GetInt64(LDBIZ_ROW_ID_INT64);
        v_init_date = lpTSCall1Ans13->GetInt32(LDBIZ_INIT_DATE_INT);
        v_pd_no = lpTSCall1Ans13->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans13->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans13->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        strcpy(v_exch_crncy_type, lpTSCall1Ans13->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans13->GetInt32(LDBIZ_EXCH_NO_INT);
        v_futu_acco_no = lpTSCall1Ans13->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
        v_contrc_code_no = lpTSCall1Ans13->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans13->GetString(LDBIZ_CONTRC_CODE_STR));
        v_contrc_type = lpTSCall1Ans13->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_asset_type = lpTSCall1Ans13->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_dir = lpTSCall1Ans13->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans13->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_comm_time = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_TIME_INT);
        v_comm_opor = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_OPOR_INT);
        v_comm_dir = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_DIR_INT);
        v_comm_limit_price = lpTSCall1Ans13->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
        v_limit_actual_price = lpTSCall1Ans13->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
        v_comm_qty = lpTSCall1Ans13->GetDouble(LDBIZ_COMM_QTY_FLOAT);
        v_comm_amt = lpTSCall1Ans13->GetDouble(LDBIZ_COMM_AMT_FLOAT);
        v_order_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_comm_cancel_qty = lpTSCall1Ans13->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
        v_comm_await_cancel_qty = lpTSCall1Ans13->GetDouble(LDBIZ_COMM_AWAIT_CANCEL_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans13->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_strike_qty = lpTSCall1Ans13->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        strcpy(v_strike_status, lpTSCall1Ans13->GetString(LDBIZ_STRIKE_STATUS_STR));
        strcpy(v_comm_sum_status, lpTSCall1Ans13->GetString(LDBIZ_COMM_SUM_STATUS_STR));
        v_comm_begin_date = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
        v_comm_end_date = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_END_DATE_INT);
        v_comm_begin_time = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
        v_comm_end_time = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_END_TIME_INT);
        v_comm_comple_date = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
        v_comm_comple_time = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
        v_max_comm_comple_date = lpTSCall1Ans13->GetInt32(LDBIZ_MAX_COMM_COMPLE_DATE_INT);
        v_max_comm_comple_time = lpTSCall1Ans13->GetInt32(LDBIZ_MAX_COMM_COMPLE_TIME_INT);
        v_comm_appr_date = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
        v_comm_appr_time = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
        v_comm_appr_qty = lpTSCall1Ans13->GetDouble(LDBIZ_COMM_APPR_QTY_FLOAT);
        strcpy(v_comm_sum_approve_status, lpTSCall1Ans13->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
        v_buy_order_qty = lpTSCall1Ans13->GetDouble(LDBIZ_BUY_ORDER_QTY_FLOAT);
        v_sell_order_qty = lpTSCall1Ans13->GetDouble(LDBIZ_SELL_ORDER_QTY_FLOAT);
        v_buy_comm_qty = lpTSCall1Ans13->GetDouble(LDBIZ_BUY_COMM_QTY_FLOAT);
        v_sell_comm_qty = lpTSCall1Ans13->GetDouble(LDBIZ_SELL_COMM_QTY_FLOAT);
        v_buy_strike_qty = lpTSCall1Ans13->GetDouble(LDBIZ_BUY_STRIKE_QTY_FLOAT);
        v_sell_strike_qty = lpTSCall1Ans13->GetDouble(LDBIZ_SELL_STRIKE_QTY_FLOAT);
        v_buy_strike_amt = lpTSCall1Ans13->GetDouble(LDBIZ_BUY_STRIKE_AMT_FLOAT);
        v_sell_strike_amt = lpTSCall1Ans13->GetDouble(LDBIZ_SELL_STRIKE_AMT_FLOAT);
        v_buy_comm_amt = lpTSCall1Ans13->GetDouble(LDBIZ_BUY_COMM_AMT_FLOAT);
        v_sell_comm_amt = lpTSCall1Ans13->GetDouble(LDBIZ_SELL_COMM_AMT_FLOAT);
        v_rece_margin = lpTSCall1Ans13->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_comm_oper_way, lpTSCall1Ans13->GetString(LDBIZ_COMM_OPER_WAY_STR));
        v_update_times = lpTSCall1Ans13->GetInt32(LDBIZ_UPDATE_TIMES_INT);


        // [主动推送][futu.commtotal][期货主推_指令_指令汇总主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.93", 0);
        lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
        lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
        lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
        lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
        lpPubMsg->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_TIME_INT,v_comm_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpPubMsg->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
        lpPubMsg->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
        lpPubMsg->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
        lpPubMsg->SetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT,v_comm_limit_price);
        lpPubMsg->SetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,v_limit_actual_price);
        lpPubMsg->SetDouble(LDBIZ_COMM_QTY_FLOAT,v_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_AMT_FLOAT,v_comm_amt);
        lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT,v_comm_cancel_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_AWAIT_CANCEL_QTY_FLOAT,v_comm_await_cancel_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT,v_comm_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
        lpPubMsg->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
        lpPubMsg->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
        lpPubMsg->SetString(LDBIZ_STRIKE_STATUS_STR,v_strike_status);
        lpPubMsg->SetString(LDBIZ_COMM_SUM_STATUS_STR,v_comm_sum_status);
        lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_DATE_INT,v_comm_begin_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_END_DATE_INT,v_comm_end_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_TIME_INT,v_comm_begin_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_END_TIME_INT,v_comm_end_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_DATE_INT,v_comm_comple_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_TIME_INT,v_comm_comple_time);
        lpPubMsg->SetInt32(LDBIZ_MAX_COMM_COMPLE_DATE_INT,v_max_comm_comple_date);
        lpPubMsg->SetInt32(LDBIZ_MAX_COMM_COMPLE_TIME_INT,v_max_comm_comple_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_APPR_DATE_INT,v_comm_appr_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_APPR_TIME_INT,v_comm_appr_time);
        lpPubMsg->SetDouble(LDBIZ_COMM_APPR_QTY_FLOAT,v_comm_appr_qty);
        lpPubMsg->SetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR,v_comm_sum_approve_status);
        lpPubMsg->SetDouble(LDBIZ_BUY_ORDER_QTY_FLOAT,v_buy_order_qty);
        lpPubMsg->SetDouble(LDBIZ_SELL_ORDER_QTY_FLOAT,v_sell_order_qty);
        lpPubMsg->SetDouble(LDBIZ_BUY_COMM_QTY_FLOAT,v_buy_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_SELL_COMM_QTY_FLOAT,v_sell_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_BUY_STRIKE_QTY_FLOAT,v_buy_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_SELL_STRIKE_QTY_FLOAT,v_sell_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_BUY_STRIKE_AMT_FLOAT,v_buy_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_SELL_STRIKE_AMT_FLOAT,v_sell_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_BUY_COMM_AMT_FLOAT,v_buy_comm_amt);
        lpPubMsg->SetDouble(LDBIZ_SELL_COMM_AMT_FLOAT,v_sell_comm_amt);
        lpPubMsg->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("futu.commtotal", lpPubMsg);

    // end if;
    }

    //订单主推、订单汇总

    // if @订单序号# > 0 then
    if (v_order_id > 0)
    {

        // set @撤单数量# = 0;
        v_wtdraw_qty = 0;

        // set @成交金额# = 0;
        v_strike_amt = 0;

        // set @成交数量# = 0;
        v_strike_qty = 0;

        // set @申报日期# = 0;
        v_report_date = 0;

        // set @申报时间# = 0;
        v_report_time = 0;

        // set @申报编号# = " ";
        strcpy(v_report_no," ");

        // set @回报信息# = " ";
        strcpy(v_rsp_info," ");

        // set @当笔成交价格# = 0;
        v_curr_strike_price = 0;

        // set @当笔成交金额# = 0;
        v_curr_strike_amt = 0;

        // set @当笔成交数量# = 0;
        v_curr_strike_qty = 0;

        // set @成交序号# = 0;
        v_strike_id = 0;

        // set @成交价格# = 0;
        v_strike_price = 0;

        // set @保证金比例# = 0;
        v_margin_ratio = 0;

        // [主动推送][futu.rptorder][期货主推_报盘_订单主推报盘消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.101", 0);
        lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
        lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpPubMsg->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpPubMsg->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpPubMsg->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetString(LDBIZ_FUTU_ACCO_STR,v_futu_acco);
        lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
        lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
        lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
        lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpPubMsg->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
        lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("futu.rptorder", lpPubMsg);


        // set @记录序号# = @订单序号#;
        v_row_id = v_order_id;

        // [主动推送][futu.order][期货主推_订单_订单主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.90", 0);
        lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
        lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
        lpPubMsg->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
        lpPubMsg->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
        lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
        lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpPubMsg->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
        lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
        lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
        lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
        lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpPubMsg->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
        lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_TRADE_FEE_FLOAT,v_trade_fee);
        lpPubMsg->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
        lpPubMsg->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
        lpPubMsg->SetDouble(LDBIZ_REPORT_FEE_FLOAT,v_report_fee);
        lpPubMsg->SetDouble(LDBIZ_WTDRAW_FEE_FLOAT,v_wtdraw_fee);
        lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
        lpPubMsg->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
        lpPubMsg->SetDouble(LDBIZ_MARGIN_RATIO_FLOAT,v_margin_ratio);
        lpPubMsg->SetString(LDBIZ_RSP_INFO_STR,v_rsp_info);
        lpPubMsg->SetInt64(LDBIZ_COMPLI_TRIG_ID_INT64,v_compli_trig_id);
        lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
        lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
        lpPubMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
        lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("futu.order", lpPubMsg);

    // end if;
    }


    // if @指令批号# >0 then
    if (v_comm_batch_no >0)
    {
        //调用过程[事务_交易期货_指令_获取指令汇总]
        //组织事务请求
        if(lpTSCall1Ans14)
        {
          lpTSCall1Ans14->FreeMsg();
          lpTSCall1Ans14=NULL;
        }
        lpTSCall1Req14=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.4", 0);
        lpTSCall1Req14->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req14->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req14->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req14->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req14->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req14->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req14->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req14->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req14->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
        lpTSCall1Req14->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpTSCall1Req14->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req14->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
        glpTSSubcallSerives->SubCall(lpTSCall1Req14, &lpTSCall1Ans14, 5000);
        if(!lpTSCall1Ans14)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.4]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans14->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans14->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans14->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans14->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans14->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans14->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans14->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans14->GetString(LDBIZ_ERROR_INFO_STR));
        v_row_id = lpTSCall1Ans14->GetInt64(LDBIZ_ROW_ID_INT64);
        v_init_date = lpTSCall1Ans14->GetInt32(LDBIZ_INIT_DATE_INT);
        v_pd_no = lpTSCall1Ans14->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans14->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans14->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        strcpy(v_exch_crncy_type, lpTSCall1Ans14->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans14->GetInt32(LDBIZ_EXCH_NO_INT);
        v_futu_acco_no = lpTSCall1Ans14->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
        v_contrc_code_no = lpTSCall1Ans14->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans14->GetString(LDBIZ_CONTRC_CODE_STR));
        v_contrc_type = lpTSCall1Ans14->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_asset_type = lpTSCall1Ans14->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_dir = lpTSCall1Ans14->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans14->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_comm_time = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_TIME_INT);
        v_comm_opor = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_OPOR_INT);
        v_comm_dir = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_DIR_INT);
        v_comm_limit_price = lpTSCall1Ans14->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
        v_limit_actual_price = lpTSCall1Ans14->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
        v_comm_qty = lpTSCall1Ans14->GetDouble(LDBIZ_COMM_QTY_FLOAT);
        v_comm_amt = lpTSCall1Ans14->GetDouble(LDBIZ_COMM_AMT_FLOAT);
        v_order_qty = lpTSCall1Ans14->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_comm_cancel_qty = lpTSCall1Ans14->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
        v_comm_await_cancel_qty = lpTSCall1Ans14->GetDouble(LDBIZ_COMM_AWAIT_CANCEL_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans14->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_strike_qty = lpTSCall1Ans14->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        strcpy(v_strike_status, lpTSCall1Ans14->GetString(LDBIZ_STRIKE_STATUS_STR));
        strcpy(v_comm_sum_status, lpTSCall1Ans14->GetString(LDBIZ_COMM_SUM_STATUS_STR));
        v_comm_begin_date = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
        v_comm_end_date = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_END_DATE_INT);
        v_comm_begin_time = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
        v_comm_end_time = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_END_TIME_INT);
        v_comm_comple_date = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
        v_comm_comple_time = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
        v_max_comm_comple_date = lpTSCall1Ans14->GetInt32(LDBIZ_MAX_COMM_COMPLE_DATE_INT);
        v_max_comm_comple_time = lpTSCall1Ans14->GetInt32(LDBIZ_MAX_COMM_COMPLE_TIME_INT);
        v_comm_appr_date = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
        v_comm_appr_time = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
        v_comm_appr_qty = lpTSCall1Ans14->GetDouble(LDBIZ_COMM_APPR_QTY_FLOAT);
        strcpy(v_comm_sum_approve_status, lpTSCall1Ans14->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
        v_buy_order_qty = lpTSCall1Ans14->GetDouble(LDBIZ_BUY_ORDER_QTY_FLOAT);
        v_sell_order_qty = lpTSCall1Ans14->GetDouble(LDBIZ_SELL_ORDER_QTY_FLOAT);
        v_buy_comm_qty = lpTSCall1Ans14->GetDouble(LDBIZ_BUY_COMM_QTY_FLOAT);
        v_sell_comm_qty = lpTSCall1Ans14->GetDouble(LDBIZ_SELL_COMM_QTY_FLOAT);
        v_buy_strike_qty = lpTSCall1Ans14->GetDouble(LDBIZ_BUY_STRIKE_QTY_FLOAT);
        v_sell_strike_qty = lpTSCall1Ans14->GetDouble(LDBIZ_SELL_STRIKE_QTY_FLOAT);
        v_buy_strike_amt = lpTSCall1Ans14->GetDouble(LDBIZ_BUY_STRIKE_AMT_FLOAT);
        v_sell_strike_amt = lpTSCall1Ans14->GetDouble(LDBIZ_SELL_STRIKE_AMT_FLOAT);
        v_buy_comm_amt = lpTSCall1Ans14->GetDouble(LDBIZ_BUY_COMM_AMT_FLOAT);
        v_sell_comm_amt = lpTSCall1Ans14->GetDouble(LDBIZ_SELL_COMM_AMT_FLOAT);
        v_rece_margin = lpTSCall1Ans14->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_comm_oper_way, lpTSCall1Ans14->GetString(LDBIZ_COMM_OPER_WAY_STR));
        v_update_times = lpTSCall1Ans14->GetInt32(LDBIZ_UPDATE_TIMES_INT);


        // [主动推送][futu.commtotal][期货主推_指令_指令汇总主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.93", 0);
        lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
        lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
        lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
        lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
        lpPubMsg->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_TIME_INT,v_comm_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpPubMsg->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
        lpPubMsg->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
        lpPubMsg->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
        lpPubMsg->SetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT,v_comm_limit_price);
        lpPubMsg->SetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,v_limit_actual_price);
        lpPubMsg->SetDouble(LDBIZ_COMM_QTY_FLOAT,v_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_AMT_FLOAT,v_comm_amt);
        lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT,v_comm_cancel_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_AWAIT_CANCEL_QTY_FLOAT,v_comm_await_cancel_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT,v_comm_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
        lpPubMsg->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
        lpPubMsg->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
        lpPubMsg->SetString(LDBIZ_STRIKE_STATUS_STR,v_strike_status);
        lpPubMsg->SetString(LDBIZ_COMM_SUM_STATUS_STR,v_comm_sum_status);
        lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_DATE_INT,v_comm_begin_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_END_DATE_INT,v_comm_end_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_TIME_INT,v_comm_begin_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_END_TIME_INT,v_comm_end_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_DATE_INT,v_comm_comple_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_TIME_INT,v_comm_comple_time);
        lpPubMsg->SetInt32(LDBIZ_MAX_COMM_COMPLE_DATE_INT,v_max_comm_comple_date);
        lpPubMsg->SetInt32(LDBIZ_MAX_COMM_COMPLE_TIME_INT,v_max_comm_comple_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_APPR_DATE_INT,v_comm_appr_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_APPR_TIME_INT,v_comm_appr_time);
        lpPubMsg->SetDouble(LDBIZ_COMM_APPR_QTY_FLOAT,v_comm_appr_qty);
        lpPubMsg->SetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR,v_comm_sum_approve_status);
        lpPubMsg->SetDouble(LDBIZ_BUY_ORDER_QTY_FLOAT,v_buy_order_qty);
        lpPubMsg->SetDouble(LDBIZ_SELL_ORDER_QTY_FLOAT,v_sell_order_qty);
        lpPubMsg->SetDouble(LDBIZ_BUY_COMM_QTY_FLOAT,v_buy_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_SELL_COMM_QTY_FLOAT,v_sell_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_BUY_STRIKE_QTY_FLOAT,v_buy_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_SELL_STRIKE_QTY_FLOAT,v_sell_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_BUY_STRIKE_AMT_FLOAT,v_buy_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_SELL_STRIKE_AMT_FLOAT,v_sell_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_BUY_COMM_AMT_FLOAT,v_buy_comm_amt);
        lpPubMsg->SetDouble(LDBIZ_SELL_COMM_AMT_FLOAT,v_sell_comm_amt);
        lpPubMsg->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("futu.commtotal", lpPubMsg);

    // end if;
    }


    // if   @订单批号# > 0 then
    if (  v_order_batch_no > 0)
    {
        //调用过程[事务_交易期货_交易_获取订单汇总]
        //组织事务请求
        if(lpTSCall1Ans15)
        {
          lpTSCall1Ans15->FreeMsg();
          lpTSCall1Ans15=NULL;
        }
        lpTSCall1Req15=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.19", 0);
        lpTSCall1Req15->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req15->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req15->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req15->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req15->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req15->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req15->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req15->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req15->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpTSCall1Req15->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
        lpTSCall1Req15->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req15, &lpTSCall1Ans15, 5000);
        if(!lpTSCall1Ans15)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.19]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans15->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans15->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans15->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans15->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans15->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans15->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans15->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans15->GetString(LDBIZ_ERROR_INFO_STR));
        v_row_id = lpTSCall1Ans15->GetInt64(LDBIZ_ROW_ID_INT64);
        strcpy(v_oper_func_code, lpTSCall1Ans15->GetString(LDBIZ_OPER_FUNC_CODE_STR));
        v_init_date = lpTSCall1Ans15->GetInt32(LDBIZ_INIT_DATE_INT);
        v_pd_no = lpTSCall1Ans15->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans15->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans15->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans15->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_crncy_type, lpTSCall1Ans15->GetString(LDBIZ_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans15->GetInt32(LDBIZ_EXCH_NO_INT);
        v_contrc_code_no = lpTSCall1Ans15->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans15->GetString(LDBIZ_CONTRC_CODE_STR));
        v_asset_type = lpTSCall1Ans15->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_type = lpTSCall1Ans15->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_contrc_unit = lpTSCall1Ans15->GetInt32(LDBIZ_CONTRC_UNIT_INT);
        v_external_no = lpTSCall1Ans15->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
        v_order_dir = lpTSCall1Ans15->GetInt32(LDBIZ_ORDER_DIR_INT);
        v_contrc_dir = lpTSCall1Ans15->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans15->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_order_price = lpTSCall1Ans15->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans15->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        strcpy(v_order_sum_status, lpTSCall1Ans15->GetString(LDBIZ_ORDER_SUM_STATUS_STR));
        v_wtdraw_qty = lpTSCall1Ans15->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
        v_waste_qty = lpTSCall1Ans15->GetDouble(LDBIZ_WASTE_QTY_FLOAT);
        v_strike_qty = lpTSCall1Ans15->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_strike_aver_price = lpTSCall1Ans15->GetDouble(LDBIZ_STRIKE_AVER_PRICE_FLOAT);
        v_strike_amt = lpTSCall1Ans15->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_trade_fee = lpTSCall1Ans15->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
        v_trade_commis = lpTSCall1Ans15->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_other_commis = lpTSCall1Ans15->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_strike_commis = lpTSCall1Ans15->GetDouble(LDBIZ_STRIKE_COMMIS_FLOAT);
        v_strike_other_commis = lpTSCall1Ans15->GetDouble(LDBIZ_STRIKE_OTHER_COMMIS_FLOAT);
        v_report_fee = lpTSCall1Ans15->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
        v_wtdraw_fee = lpTSCall1Ans15->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
        v_strike_all_fee = lpTSCall1Ans15->GetDouble(LDBIZ_STRIKE_ALL_FEE_FLOAT);
        v_rece_margin = lpTSCall1Ans15->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_order_oper_way, lpTSCall1Ans15->GetString(LDBIZ_ORDER_OPER_WAY_STR));
        v_update_times = lpTSCall1Ans15->GetInt32(LDBIZ_UPDATE_TIMES_INT);


        // [主动推送][futu.ordertotal][期货主推_订单_订单汇总主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.91", 0);
        lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
        lpPubMsg->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
        lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
        lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
        lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
        lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
        lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
        lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
        lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
        lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpPubMsg->SetString(LDBIZ_ORDER_SUM_STATUS_STR,v_order_sum_status);
        lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
        lpPubMsg->SetDouble(LDBIZ_WASTE_QTY_FLOAT,v_waste_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_AVER_PRICE_FLOAT,v_strike_aver_price);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_TRADE_FEE_FLOAT,v_trade_fee);
        lpPubMsg->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
        lpPubMsg->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_COMMIS_FLOAT,v_strike_commis);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_OTHER_COMMIS_FLOAT,v_strike_other_commis);
        lpPubMsg->SetDouble(LDBIZ_REPORT_FEE_FLOAT,v_report_fee);
        lpPubMsg->SetDouble(LDBIZ_WTDRAW_FEE_FLOAT,v_wtdraw_fee);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_ALL_FEE_FLOAT,v_strike_all_fee);
        lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
        lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("futu.ordertotal", lpPubMsg);

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
        if(lpTSCall1Ans16)
        {
          lpTSCall1Ans16->FreeMsg();
          lpTSCall1Ans16=NULL;
        }
        lpTSCall1Req16=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req16->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req16->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req16->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req16->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req16->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req16->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req16->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req16->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req16->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req16->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req16, &lpTSCall1Ans16, 5000);
        if (lpTSCall1Ans16)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans16->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans16->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans16->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans16->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans16->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_COMM_STATUS_STR,v_comm_status);
    lpOutBizMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
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
    if(lpTSCall1Ans13)
        lpTSCall1Ans13->FreeMsg();
    if(lpTSCall1Ans14)
        lpTSCall1Ans14->FreeMsg();
    if(lpTSCall1Ans15)
        lpTSCall1Ans15->FreeMsg();
    if(lpTSCall1Ans16)
        lpTSCall1Ans16->FreeMsg();
    return iRet;
}

//逻辑_交易期货_指令_分发指令
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
    int v_exch_no;
    int v_co_no;
    int v_exch_group_no;
    int64 v_comm_id;
    int v_comm_executor;
    int v_is_withdraw;
    char v_disp_remark[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_pd_no;
    int v_asset_acco_no;
    int v_comm_opor;
    int v_comm_date;
    int v_comm_batch_no;
    int v_comm_dir;
    double v_comm_qty;
    double v_comm_amt;
    double v_order_qty;
    double v_comm_cancel_qty;
    char v_comm_status[3];
    char v_strike_status[3];
    int v_init_date;
    double v_buy_ref_rate;
    double v_sell_ref_rate;
    int v_tmp_comm_executor;
    int64 v_row_id;
    char v_exch_crncy_type[4];
    int v_futu_acco_no;
    int v_contrc_code_no;
    char v_contrc_code[7];
    int v_contrc_type;
    int v_asset_type;
    int v_contrc_dir;
    int v_hedge_type;
    int v_comm_time;
    double v_comm_limit_price;
    double v_limit_actual_price;
    double v_strike_amt;
    double v_strike_qty;
    double v_comm_frozen_amt;
    double v_comm_frozen_qty;
    double v_rece_margin;
    int v_capit_reback_days;
    int v_posi_reback_days;
    int v_comm_begin_date;
    int v_comm_end_date;
    int v_comm_begin_time;
    int v_comm_end_time;
    int v_comm_comple_date;
    int v_comm_comple_time;
    int v_comm_appr_date;
    int v_comm_appr_time;
    char v_comm_appr_status[3];
    int v_comm_appr_oper_no;
    int v_comm_appr_oper;
    char v_comm_appr_remark[256];
    int64 v_external_no;
    char v_comb_code[7];
    char v_comm_oper_way[3];
    char v_remark_info[256];
    int v_comm_comple_flag;
    int v_update_times;
    int v_order_dir;
    char v_crncy_type[4];
    int v_lngsht_type;
    int v_calc_dir;
    int v_comb_type;
    char v_futu_acco[17];
    double v_exgp_avail_amt;
    double v_asac_avail_amt;
    double v_exgp_avail_qty;
    double v_asac_avail_qty;
    double v_exgp_long_rece_margin;
    double v_exgp_short_rece_margin;
    double v_asac_long_rece_margin;
    double v_asac_short_rece_margin;
    double v_exgp_long_stock_rece_margin;
    double v_exgp_short_stock_rece_margin;
    int v_before_comm_executor;
    char v_order_id_str[2049];
    char v_wtdraw_id_str[2049];
    int64 v_exgp_row_id;
    double v_exgp_begin_amt;
    double v_exgp_curr_amt;
    double v_exgp_frozen_amt;
    double v_exgp_unfroz_amt;
    double v_exgp_comm_frozen_amt;
    double v_exgp_comm_unfroz_amt;
    double v_exgp_comm_capt_amt;
    double v_exgp_comm_releas_amt;
    double v_exgp_trade_capt_amt;
    double v_exgp_trade_releas_amt;
    double v_exgp_strike_capt_amt;
    double v_exgp_strike_releas_amt;
    double v_exgp_capt_margin;
    double v_exgp_trade_fee;
    double v_exgp_strike_fee;
    double v_exgp_close_pandl;
    double v_exgp_marked_pandl;
    int v_exgp_cash_update_times;
    int64 v_asac_row_id;
    double v_asac_begin_amt;
    double v_asac_curr_amt;
    double v_asac_frozen_amt;
    double v_asac_unfroz_amt;
    double v_asac_comm_frozen_amt;
    double v_asac_comm_unfroz_amt;
    double v_asac_comm_capt_amt;
    double v_asac_comm_releas_amt;
    double v_asac_trade_capt_amt;
    double v_asac_trade_releas_amt;
    double v_asac_strike_capt_amt;
    double v_asac_strike_releas_amt;
    double v_asac_capt_margin;
    double v_asac_trade_fee;
    double v_asac_strike_fee;
    double v_asac_close_pandl;
    double v_asac_marked_pandl;
    int v_asac_cash_update_times;
    int v_contrc_unit;
    double v_exgp_frozen_qty;
    double v_exgp_unfroz_qty;
    double v_exgp_comm_releas_qty;
    double v_exgp_trade_releas_qty;
    double v_exgp_strike_releas_qty;
    double v_exgp_old_comm_capt_qty;
    double v_exgp_today_comm_capt_qty;
    double v_exgp_old_trade_capt_qty;
    double v_exgp_today_trade_capt_qty;
    double v_exgp_pre_strike_capt_qty;
    double v_exgp_today_strike_capt_qty;
    double v_exgp_rece_margin;
    double v_pre_settle_price;
    double v_exgp_realize_pandl;
    double v_exgp_open_amount;
    int v_exgp_posi_update_times;
    double v_asac_frozen_qty;
    double v_asac_unfroz_qty;
    double v_asac_comm_releas_qty;
    double v_asac_trade_releas_qty;
    double v_asac_strike_releas_qty;
    double v_asac_old_comm_capt_qty;
    double v_asac_today_comm_capt_qty;
    double v_asac_old_trade_capt_qty;
    double v_asac_today_trade_capt_qty;
    double v_asac_pre_strike_capt_qty;
    double v_asac_today_strike_capt_qty;
    double v_asac_rece_margin;
    double v_asac_realize_pandl;
    double v_asac_open_amount;
    int v_asac_posi_update_times;
    double v_comm_await_cancel_qty;
    char v_comm_sum_status[3];
    int v_max_comm_comple_date;
    int v_max_comm_comple_time;
    double v_comm_appr_qty;
    char v_comm_sum_approve_status[3];
    double v_buy_order_qty;
    double v_sell_order_qty;
    double v_buy_comm_qty;
    double v_sell_comm_qty;
    double v_buy_strike_qty;
    double v_sell_strike_qty;
    double v_buy_strike_amt;
    double v_sell_strike_amt;
    double v_buy_comm_amt;
    double v_sell_comm_amt;
    char v_out_acco[33];
    int v_pass_no;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_batch_no;
    double v_order_price;
    char v_order_status[3];
    double v_wtdraw_qty;
    double v_strike_price;
    double v_trade_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_strike_commis;
    double v_strike_other_commis;
    double v_strike_all_fee;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_trade_occur_amt;
    double v_margin_ratio;
    char v_rsp_info[256];
    int64 v_compli_trig_id;
    char v_order_oper_way[3];
    char v_oper_func_code[17];
    char v_order_sum_status[3];
    double v_waste_qty;
    double v_strike_aver_price;
    int v_wtdraw_batch_no;
    int v_wtdraw_date;
    int v_wtdraw_time;
    int64 v_order_id;
    char v_wtdraw_status[3];
    char v_wtdraw_remark[256];
    char v_log_error_code[33];
    char v_log_error_info[256];

    IGroup* lpMainMsg=NULL;
    int iRecordCount = 0;
    IGroup* lpMainMsg2=NULL;

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
    v_exch_no=0;
    v_co_no=0;
    v_exch_group_no=0;
    v_comm_id=0;
    v_comm_executor=0;
    v_is_withdraw=0;
    strcpy(v_disp_remark, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_pd_no=0;
    v_asset_acco_no=0;
    v_comm_opor=0;
    v_comm_date=0;
    v_comm_batch_no=0;
    v_comm_dir=0;
    v_comm_qty=0;
    v_comm_amt=0;
    v_order_qty=0;
    v_comm_cancel_qty=0;
    strcpy(v_comm_status, "0");
    strcpy(v_strike_status, "0");
    v_init_date=0;
    v_buy_ref_rate=0;
    v_sell_ref_rate=0;
    v_tmp_comm_executor=0;
    v_row_id=0;
    strcpy(v_exch_crncy_type, "CNY");
    v_futu_acco_no=0;
    v_contrc_code_no=0;
    strcpy(v_contrc_code, " ");
    v_contrc_type=0;
    v_asset_type=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    v_comm_time=0;
    v_comm_limit_price=0;
    v_limit_actual_price=0;
    v_strike_amt=0;
    v_strike_qty=0;
    v_comm_frozen_amt=0;
    v_comm_frozen_qty=0;
    v_rece_margin=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    v_comm_begin_date=0;
    v_comm_end_date=0;
    v_comm_begin_time=0;
    v_comm_end_time=0;
    v_comm_comple_date=0;
    v_comm_comple_time=0;
    v_comm_appr_date=0;
    v_comm_appr_time=0;
    strcpy(v_comm_appr_status, " ");
    v_comm_appr_oper_no=0;
    v_comm_appr_oper=0;
    strcpy(v_comm_appr_remark, " ");
    v_external_no=0;
    strcpy(v_comb_code, " ");
    strcpy(v_comm_oper_way, " ");
    strcpy(v_remark_info, " ");
    v_comm_comple_flag=0;
    v_update_times=1;
    v_order_dir=0;
    strcpy(v_crncy_type, "CNY");
    v_lngsht_type=0;
    v_calc_dir=1;
    v_comb_type=0;
    strcpy(v_futu_acco, " ");
    v_exgp_avail_amt=0;
    v_asac_avail_amt=0;
    v_exgp_avail_qty=0;
    v_asac_avail_qty=0;
    v_exgp_long_rece_margin=0;
    v_exgp_short_rece_margin=0;
    v_asac_long_rece_margin=0;
    v_asac_short_rece_margin=0;
    v_exgp_long_stock_rece_margin=0;
    v_exgp_short_stock_rece_margin=0;
    v_before_comm_executor=0;
    strcpy(v_order_id_str, " ");
    strcpy(v_wtdraw_id_str, " ");
    v_exgp_row_id=0;
    v_exgp_begin_amt=0;
    v_exgp_curr_amt=0;
    v_exgp_frozen_amt=0;
    v_exgp_unfroz_amt=0;
    v_exgp_comm_frozen_amt=0;
    v_exgp_comm_unfroz_amt=0;
    v_exgp_comm_capt_amt=0;
    v_exgp_comm_releas_amt=0;
    v_exgp_trade_capt_amt=0;
    v_exgp_trade_releas_amt=0;
    v_exgp_strike_capt_amt=0;
    v_exgp_strike_releas_amt=0;
    v_exgp_capt_margin=0;
    v_exgp_trade_fee=0;
    v_exgp_strike_fee=0;
    v_exgp_close_pandl=0;
    v_exgp_marked_pandl=0;
    v_exgp_cash_update_times=1;
    v_asac_row_id=0;
    v_asac_begin_amt=0;
    v_asac_curr_amt=0;
    v_asac_frozen_amt=0;
    v_asac_unfroz_amt=0;
    v_asac_comm_frozen_amt=0;
    v_asac_comm_unfroz_amt=0;
    v_asac_comm_capt_amt=0;
    v_asac_comm_releas_amt=0;
    v_asac_trade_capt_amt=0;
    v_asac_trade_releas_amt=0;
    v_asac_strike_capt_amt=0;
    v_asac_strike_releas_amt=0;
    v_asac_capt_margin=0;
    v_asac_trade_fee=0;
    v_asac_strike_fee=0;
    v_asac_close_pandl=0;
    v_asac_marked_pandl=0;
    v_asac_cash_update_times=1;
    v_contrc_unit=0;
    v_exgp_frozen_qty=0;
    v_exgp_unfroz_qty=0;
    v_exgp_comm_releas_qty=0;
    v_exgp_trade_releas_qty=0;
    v_exgp_strike_releas_qty=0;
    v_exgp_old_comm_capt_qty=0;
    v_exgp_today_comm_capt_qty=0;
    v_exgp_old_trade_capt_qty=0;
    v_exgp_today_trade_capt_qty=0;
    v_exgp_pre_strike_capt_qty=0;
    v_exgp_today_strike_capt_qty=0;
    v_exgp_rece_margin=0;
    v_pre_settle_price=0;
    v_exgp_realize_pandl=0;
    v_exgp_open_amount=0;
    v_exgp_posi_update_times=1;
    v_asac_frozen_qty=0;
    v_asac_unfroz_qty=0;
    v_asac_comm_releas_qty=0;
    v_asac_trade_releas_qty=0;
    v_asac_strike_releas_qty=0;
    v_asac_old_comm_capt_qty=0;
    v_asac_today_comm_capt_qty=0;
    v_asac_old_trade_capt_qty=0;
    v_asac_today_trade_capt_qty=0;
    v_asac_pre_strike_capt_qty=0;
    v_asac_today_strike_capt_qty=0;
    v_asac_rece_margin=0;
    v_asac_realize_pandl=0;
    v_asac_open_amount=0;
    v_asac_posi_update_times=1;
    v_comm_await_cancel_qty=0;
    strcpy(v_comm_sum_status, "0");
    v_max_comm_comple_date=0;
    v_max_comm_comple_time=0;
    v_comm_appr_qty=0;
    strcpy(v_comm_sum_approve_status, "0");
    v_buy_order_qty=0;
    v_sell_order_qty=0;
    v_buy_comm_qty=0;
    v_sell_comm_qty=0;
    v_buy_strike_qty=0;
    v_sell_strike_qty=0;
    v_buy_strike_amt=0;
    v_sell_strike_amt=0;
    v_buy_comm_amt=0;
    v_sell_comm_amt=0;
    strcpy(v_out_acco, " ");
    v_pass_no=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_batch_no=0;
    v_order_price=0;
    strcpy(v_order_status, "0");
    v_wtdraw_qty=0;
    v_strike_price=0;
    v_trade_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_strike_commis=0;
    v_strike_other_commis=0;
    v_strike_all_fee=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_trade_occur_amt=0;
    v_margin_ratio=0;
    strcpy(v_rsp_info, " ");
    v_compli_trig_id=0;
    strcpy(v_order_oper_way, " ");
    strcpy(v_oper_func_code, " ");
    strcpy(v_order_sum_status, "0");
    v_waste_qty=0;
    v_strike_aver_price=0;
    v_wtdraw_batch_no=0;
    v_wtdraw_date=0;
    v_wtdraw_time=0;
    v_order_id=0;
    strcpy(v_wtdraw_status, "0");
    strcpy(v_wtdraw_remark, " ");
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
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_executor = lpInBizMsg->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_is_withdraw = lpInBizMsg->GetInt32(LDBIZ_IS_WITHDRAW_INT);
    strncpy(v_disp_remark, lpInBizMsg->GetString(LDBIZ_DISP_REMARK_STR),255);
    v_disp_remark[255] = '\0';

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
    IFastMessage* lpTSCall1Req13 = NULL;
    IFastMessage* lpTSCall1Ans13 = NULL;

    //调用过程[事务_公共_交易接口_检查指令分发系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.25.14", 0);
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
    lpTSCall1Req0->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req0->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    lpTSCall1Req0->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.14]subcall timed out!");
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
    v_pd_no = lpTSCall1Ans0->GetInt32(LDBIZ_PD_NO_INT);
    v_buy_ref_rate = lpTSCall1Ans0->GetDouble(LDBIZ_BUY_REF_RATE_FLOAT);
    v_sell_ref_rate = lpTSCall1Ans0->GetDouble(LDBIZ_SELL_REF_RATE_FLOAT);


    // set @临时_指令执行人# = @指令执行人#;
    v_tmp_comm_executor = v_comm_executor;
    //调用过程[事务_交易期货_指令_获取指令]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.3", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.3]subcall timed out!");
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
    v_row_id = lpTSCall1Ans1->GetInt64(LDBIZ_ROW_ID_INT64);
    v_init_date = lpTSCall1Ans1->GetInt32(LDBIZ_INIT_DATE_INT);
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strcpy(v_exch_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
    v_futu_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    v_contrc_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strcpy(v_contrc_code, lpTSCall1Ans1->GetString(LDBIZ_CONTRC_CODE_STR));
    v_contrc_type = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_contrc_dir = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpTSCall1Ans1->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_comm_date = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_time = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_TIME_INT);
    v_comm_batch_no = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_opor = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_comm_executor = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_comm_dir = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_DIR_INT);
    v_comm_limit_price = lpTSCall1Ans1->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
    v_limit_actual_price = lpTSCall1Ans1->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
    v_comm_qty = lpTSCall1Ans1->GetDouble(LDBIZ_COMM_QTY_FLOAT);
    v_comm_amt = lpTSCall1Ans1->GetDouble(LDBIZ_COMM_AMT_FLOAT);
    v_order_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_comm_cancel_qty = lpTSCall1Ans1->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_qty = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_comm_frozen_amt = lpTSCall1Ans1->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
    v_comm_frozen_qty = lpTSCall1Ans1->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
    v_rece_margin = lpTSCall1Ans1->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_capit_reback_days = lpTSCall1Ans1->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans1->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    strcpy(v_strike_status, lpTSCall1Ans1->GetString(LDBIZ_STRIKE_STATUS_STR));
    strcpy(v_comm_status, lpTSCall1Ans1->GetString(LDBIZ_COMM_STATUS_STR));
    v_comm_begin_date = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
    v_comm_end_date = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_END_DATE_INT);
    v_comm_begin_time = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
    v_comm_end_time = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_END_TIME_INT);
    v_comm_comple_date = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
    v_comm_comple_time = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
    v_comm_appr_date = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
    v_comm_appr_time = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
    strcpy(v_comm_appr_status, lpTSCall1Ans1->GetString(LDBIZ_COMM_APPR_STATUS_STR));
    v_comm_appr_oper_no = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_APPR_OPER_NO_INT);
    v_comm_appr_oper = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
    strcpy(v_comm_appr_remark, lpTSCall1Ans1->GetString(LDBIZ_COMM_APPR_REMARK_STR));
    v_external_no = lpTSCall1Ans1->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    strcpy(v_comb_code, lpTSCall1Ans1->GetString(LDBIZ_COMB_CODE_STR));
    strcpy(v_comm_oper_way, lpTSCall1Ans1->GetString(LDBIZ_COMM_OPER_WAY_STR));
    strcpy(v_remark_info, lpTSCall1Ans1->GetString(LDBIZ_REMARK_INFO_STR));
    v_comm_comple_flag = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
    v_update_times = lpTSCall1Ans1->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // set @订单方向# = @指令方向#;
    v_order_dir = v_comm_dir;

    // set @本币币种# = @交易币种#;
    strcpy(v_crncy_type,v_exch_crncy_type);
    //根据订单方向和开平方向确定多空类型
    //调用过程[事务_交易期货_交易_获取多空类型]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.26", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req2->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.26]subcall timed out!");
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
    v_lngsht_type = lpTSCall1Ans2->GetInt32(LDBIZ_LNGSHT_TYPE_INT);


    // set @资产类型#=《资产类型-期货》;
    v_asset_type=31;
    //公共子系统检查，检查交易日期时间

    // set @计算方向#=《计算方向-加上》;
    v_calc_dir=1;
    //获取该合约代码对应的组合编码
    //调用过程[事务_公共_公共接口_获取保证金优惠组合编码]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.24.256", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req3->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpTSCall1Req3->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.256]subcall timed out!");
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
    strcpy(v_comb_code, lpTSCall1Ans3->GetString(LDBIZ_COMB_CODE_STR));
    v_comb_type = lpTSCall1Ans3->GetInt32(LDBIZ_COMB_TYPE_INT);

    //从产品期货的持仓表中获得交易组可用数量和资产账户可用
    //调用过程[事务_产品期货_交易接口_检查账户状态获取可用]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pdfutuT.6.1", 0);
    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req4->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req4->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req4->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req4->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req4->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.6.1]subcall timed out!");
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
    v_futu_acco_no = lpTSCall1Ans4->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    strcpy(v_futu_acco, lpTSCall1Ans4->GetString(LDBIZ_FUTU_ACCO_STR));
    v_exgp_avail_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_AVAIL_AMT_FLOAT);
    v_asac_avail_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_AVAIL_AMT_FLOAT);
    v_exgp_avail_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT);
    v_asac_avail_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT);
    v_exgp_long_rece_margin = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT);
    v_exgp_short_rece_margin = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT);
    v_asac_long_rece_margin = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT);
    v_asac_short_rece_margin = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT);
    v_exgp_long_stock_rece_margin = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_LONG_STOCK_RECE_MARGIN_FLOAT);
    v_exgp_short_stock_rece_margin = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_SHORT_STOCK_RECE_MARGIN_FLOAT);


    // set @指令执行人# = @临时_指令执行人#;
    v_comm_executor = v_tmp_comm_executor;
    //分发指令
    //调用过程[事务_交易期货_指令_分发指令]
    //组织事务请求
    if(lpTSCall1Ans5)
    {
      lpTSCall1Ans5->FreeMsg();
      lpTSCall1Ans5=NULL;
    }
    lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.6", 0);
    lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req5->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req5->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req5->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpTSCall1Req5->SetString(LDBIZ_DISP_REMARK_STR,v_disp_remark);
    lpTSCall1Req5->SetInt32(LDBIZ_IS_WITHDRAW_INT,v_is_withdraw);
    lpTSCall1Req5->SetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT,v_exgp_long_rece_margin);
    lpTSCall1Req5->SetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT,v_exgp_short_rece_margin);
    lpTSCall1Req5->SetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT,v_asac_long_rece_margin);
    lpTSCall1Req5->SetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT,v_asac_short_rece_margin);
    lpTSCall1Req5->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
    if(!lpTSCall1Ans5)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.6]subcall timed out!");
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
    v_co_no = lpTSCall1Ans5->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans5->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans5->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans5->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_comm_date = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_batch_no = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_dir = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_DIR_INT);
    strcpy(v_comm_status, lpTSCall1Ans5->GetString(LDBIZ_COMM_STATUS_STR));
    strcpy(v_strike_status, lpTSCall1Ans5->GetString(LDBIZ_STRIKE_STATUS_STR));
    v_comm_qty = lpTSCall1Ans5->GetDouble(LDBIZ_COMM_QTY_FLOAT);
    v_order_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans5->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_comm_cancel_qty = lpTSCall1Ans5->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
    v_before_comm_executor = lpTSCall1Ans5->GetInt32(LDBIZ_BEFORE_COMM_EXECUTOR_INT);
    strcpy(v_order_id_str, lpTSCall1Ans5->GetString(LDBIZ_ORDER_ID_STR_STR));
    strcpy(v_wtdraw_id_str, lpTSCall1Ans5->GetString(LDBIZ_WTDRAW_ID_STR_STR));

    //主推
    //调用过程[事务_交易期货_指令_获取指令]
    //组织事务请求
    if(lpTSCall1Ans6)
    {
      lpTSCall1Ans6->FreeMsg();
      lpTSCall1Ans6=NULL;
    }
    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.3", 0);
    lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req6->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
    if(!lpTSCall1Ans6)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.3]subcall timed out!");
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
    v_row_id = lpTSCall1Ans6->GetInt64(LDBIZ_ROW_ID_INT64);
    v_init_date = lpTSCall1Ans6->GetInt32(LDBIZ_INIT_DATE_INT);
    v_co_no = lpTSCall1Ans6->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans6->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans6->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strcpy(v_exch_crncy_type, lpTSCall1Ans6->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_exch_no = lpTSCall1Ans6->GetInt32(LDBIZ_EXCH_NO_INT);
    v_futu_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    v_contrc_code_no = lpTSCall1Ans6->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strcpy(v_contrc_code, lpTSCall1Ans6->GetString(LDBIZ_CONTRC_CODE_STR));
    v_contrc_type = lpTSCall1Ans6->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_asset_type = lpTSCall1Ans6->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_contrc_dir = lpTSCall1Ans6->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpTSCall1Ans6->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_comm_date = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_time = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_TIME_INT);
    v_comm_batch_no = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_opor = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_comm_executor = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_comm_dir = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_DIR_INT);
    v_comm_limit_price = lpTSCall1Ans6->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
    v_limit_actual_price = lpTSCall1Ans6->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
    v_comm_qty = lpTSCall1Ans6->GetDouble(LDBIZ_COMM_QTY_FLOAT);
    v_comm_amt = lpTSCall1Ans6->GetDouble(LDBIZ_COMM_AMT_FLOAT);
    v_order_qty = lpTSCall1Ans6->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_comm_cancel_qty = lpTSCall1Ans6->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans6->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_qty = lpTSCall1Ans6->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_comm_frozen_amt = lpTSCall1Ans6->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
    v_comm_frozen_qty = lpTSCall1Ans6->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
    v_rece_margin = lpTSCall1Ans6->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_capit_reback_days = lpTSCall1Ans6->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans6->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    strcpy(v_strike_status, lpTSCall1Ans6->GetString(LDBIZ_STRIKE_STATUS_STR));
    strcpy(v_comm_status, lpTSCall1Ans6->GetString(LDBIZ_COMM_STATUS_STR));
    v_comm_begin_date = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
    v_comm_end_date = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_END_DATE_INT);
    v_comm_begin_time = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
    v_comm_end_time = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_END_TIME_INT);
    v_comm_comple_date = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
    v_comm_comple_time = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
    v_comm_appr_date = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
    v_comm_appr_time = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
    strcpy(v_comm_appr_status, lpTSCall1Ans6->GetString(LDBIZ_COMM_APPR_STATUS_STR));
    v_comm_appr_oper_no = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_APPR_OPER_NO_INT);
    v_comm_appr_oper = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
    strcpy(v_comm_appr_remark, lpTSCall1Ans6->GetString(LDBIZ_COMM_APPR_REMARK_STR));
    v_external_no = lpTSCall1Ans6->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    strcpy(v_comb_code, lpTSCall1Ans6->GetString(LDBIZ_COMB_CODE_STR));
    strcpy(v_comm_oper_way, lpTSCall1Ans6->GetString(LDBIZ_COMM_OPER_WAY_STR));
    strcpy(v_remark_info, lpTSCall1Ans6->GetString(LDBIZ_REMARK_INFO_STR));
    v_comm_comple_flag = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
    v_update_times = lpTSCall1Ans6->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // [主动推送][futu.comm][期货主推_指令_指令主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.92", 0);
    lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpPubMsg->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_TIME_INT,v_comm_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpPubMsg->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpPubMsg->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpPubMsg->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
    lpPubMsg->SetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT,v_comm_limit_price);
    lpPubMsg->SetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,v_limit_actual_price);
    lpPubMsg->SetDouble(LDBIZ_COMM_QTY_FLOAT,v_comm_qty);
    lpPubMsg->SetDouble(LDBIZ_COMM_AMT_FLOAT,v_comm_amt);
    lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpPubMsg->SetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT,v_comm_cancel_qty);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
    lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT,v_comm_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
    lpPubMsg->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
    lpPubMsg->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
    lpPubMsg->SetString(LDBIZ_STRIKE_STATUS_STR,v_strike_status);
    lpPubMsg->SetString(LDBIZ_COMM_STATUS_STR,v_comm_status);
    lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_DATE_INT,v_comm_begin_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_END_DATE_INT,v_comm_end_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_TIME_INT,v_comm_begin_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_END_TIME_INT,v_comm_end_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_DATE_INT,v_comm_comple_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_TIME_INT,v_comm_comple_time);
    lpPubMsg->SetInt32(LDBIZ_COMM_APPR_DATE_INT,v_comm_appr_date);
    lpPubMsg->SetInt32(LDBIZ_COMM_APPR_TIME_INT,v_comm_appr_time);
    lpPubMsg->SetString(LDBIZ_COMM_APPR_STATUS_STR,v_comm_appr_status);
    lpPubMsg->SetInt32(LDBIZ_COMM_APPR_OPER_INT,v_comm_appr_oper);
    lpPubMsg->SetString(LDBIZ_COMM_APPR_REMARK_STR,v_comm_appr_remark);
    lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpPubMsg->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
    lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_FLAG_INT,v_comm_comple_flag);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("futu.comm", lpPubMsg);

    //主推交易组和资产账户资金
    //调用过程[事务_交易期货_账户_获取交易组资产账户资金]
    //组织事务请求
    if(lpTSCall1Ans7)
    {
      lpTSCall1Ans7->FreeMsg();
      lpTSCall1Ans7=NULL;
    }
    lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.11", 0);
    lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req7->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req7->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req7->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
    if(!lpTSCall1Ans7)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.11]subcall timed out!");
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
    v_exgp_row_id = lpTSCall1Ans7->GetInt64(LDBIZ_EXGP_ROW_ID_INT64);
    v_co_no = lpTSCall1Ans7->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans7->GetInt32(LDBIZ_PD_NO_INT);
    v_exgp_begin_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT);
    v_exgp_curr_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT);
    v_exgp_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
    v_exgp_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
    v_exgp_comm_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
    v_exgp_comm_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
    v_exgp_comm_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
    v_exgp_comm_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
    v_exgp_trade_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
    v_exgp_trade_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
    v_exgp_strike_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
    v_exgp_strike_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
    v_exgp_capt_margin = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_CAPT_MARGIN_FLOAT);
    v_exgp_trade_fee = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_FEE_FLOAT);
    v_exgp_strike_fee = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_STRIKE_FEE_FLOAT);
    v_exgp_close_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_CLOSE_PANDL_FLOAT);
    v_exgp_marked_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_MARKED_PANDL_FLOAT);
    v_exgp_cash_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
    v_asac_row_id = lpTSCall1Ans7->GetInt64(LDBIZ_ASAC_ROW_ID_INT64);
    v_asac_begin_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_BEGIN_AMT_FLOAT);
    v_asac_curr_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_CURR_AMT_FLOAT);
    v_asac_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
    v_asac_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
    v_asac_comm_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
    v_asac_comm_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
    v_asac_comm_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
    v_asac_comm_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
    v_asac_trade_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
    v_asac_trade_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
    v_asac_strike_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
    v_asac_strike_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
    v_asac_capt_margin = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_CAPT_MARGIN_FLOAT);
    v_asac_trade_fee = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_FEE_FLOAT);
    v_asac_strike_fee = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_STRIKE_FEE_FLOAT);
    v_asac_close_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_CLOSE_PANDL_FLOAT);
    v_asac_marked_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_MARKED_PANDL_FLOAT);
    v_asac_cash_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);


    // [主动推送][futu.exgpcapital][期货主推_资金_交易组资金主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.110", 0);
    lpPubMsg->SetInt64(LDBIZ_EXGP_ROW_ID_INT64,v_exgp_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT,v_exgp_begin_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT,v_exgp_curr_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT,v_exgp_comm_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT,v_exgp_comm_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT,v_exgp_comm_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT,v_exgp_comm_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT,v_exgp_trade_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT,v_exgp_trade_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT,v_exgp_strike_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT,v_exgp_strike_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_EXGP_CAPT_MARGIN_FLOAT,v_exgp_capt_margin);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FEE_FLOAT,v_exgp_trade_fee);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FEE_FLOAT,v_exgp_strike_fee);
    lpPubMsg->SetDouble(LDBIZ_EXGP_CLOSE_PANDL_FLOAT,v_exgp_close_pandl);
    lpPubMsg->SetDouble(LDBIZ_EXGP_MARKED_PANDL_FLOAT,v_exgp_marked_pandl);
    lpPubMsg->SetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT,v_exgp_cash_update_times);
    glpPubSub_Interface->PubTopics("futu.exgpcapital", lpPubMsg);


    // [主动推送][futu.asaccapital][期货主推_资金_资产账户资金主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.111", 0);
    lpPubMsg->SetInt64(LDBIZ_ASAC_ROW_ID_INT64,v_asac_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetDouble(LDBIZ_ASAC_BEGIN_AMT_FLOAT,v_asac_begin_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CURR_AMT_FLOAT,v_asac_curr_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT,v_asac_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT,v_asac_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT,v_asac_comm_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT,v_asac_comm_unfroz_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT,v_asac_comm_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT,v_asac_comm_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT,v_asac_trade_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT,v_asac_trade_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT,v_asac_strike_capt_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT,v_asac_strike_releas_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CAPT_MARGIN_FLOAT,v_asac_capt_margin);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FEE_FLOAT,v_asac_trade_fee);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FEE_FLOAT,v_asac_strike_fee);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CLOSE_PANDL_FLOAT,v_asac_close_pandl);
    lpPubMsg->SetDouble(LDBIZ_ASAC_MARKED_PANDL_FLOAT,v_asac_marked_pandl);
    lpPubMsg->SetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT,v_asac_cash_update_times);
    glpPubSub_Interface->PubTopics("futu.asaccapital", lpPubMsg);

    //主推交易组和资产账户持仓
    //调用过程[事务_交易期货_账户_获取交易组资产账户持仓]
    //组织事务请求
    if(lpTSCall1Ans8)
    {
      lpTSCall1Ans8->FreeMsg();
      lpTSCall1Ans8=NULL;
    }
    lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.12", 0);
    lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req8->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req8->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req8->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req8->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req8->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpTSCall1Req8->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
    if(!lpTSCall1Ans8)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.12]subcall timed out!");
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
    v_exgp_row_id = lpTSCall1Ans8->GetInt64(LDBIZ_EXGP_ROW_ID_INT64);
    v_co_no = lpTSCall1Ans8->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans8->GetInt32(LDBIZ_PD_NO_INT);
    strcpy(v_exch_crncy_type, lpTSCall1Ans8->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_contrc_type = lpTSCall1Ans8->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_unit = lpTSCall1Ans8->GetInt32(LDBIZ_CONTRC_UNIT_INT);
    strcpy(v_comb_code, lpTSCall1Ans8->GetString(LDBIZ_COMB_CODE_STR));
    v_exgp_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
    v_exgp_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
    v_exgp_comm_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
    v_exgp_trade_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
    v_exgp_strike_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
    v_exgp_old_comm_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_OLD_COMM_CAPT_QTY_FLOAT);
    v_exgp_today_comm_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TODAY_COMM_CAPT_QTY_FLOAT);
    v_exgp_old_trade_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_OLD_TRADE_CAPT_QTY_FLOAT);
    v_exgp_today_trade_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TODAY_TRADE_CAPT_QTY_FLOAT);
    v_exgp_pre_strike_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_PRE_STRIKE_CAPT_QTY_FLOAT);
    v_exgp_today_strike_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TODAY_STRIKE_CAPT_QTY_FLOAT);
    v_exgp_rece_margin = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_RECE_MARGIN_FLOAT);
    v_pre_settle_price = lpTSCall1Ans8->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
    v_exgp_realize_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
    v_exgp_open_amount = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_OPEN_AMOUNT_FLOAT);
    v_exgp_posi_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
    v_asac_row_id = lpTSCall1Ans8->GetInt64(LDBIZ_ASAC_ROW_ID_INT64);
    v_asac_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
    v_asac_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
    v_asac_comm_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
    v_asac_trade_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
    v_asac_strike_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
    v_asac_old_comm_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_OLD_COMM_CAPT_QTY_FLOAT);
    v_asac_today_comm_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TODAY_COMM_CAPT_QTY_FLOAT);
    v_asac_old_trade_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_OLD_TRADE_CAPT_QTY_FLOAT);
    v_asac_today_trade_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TODAY_TRADE_CAPT_QTY_FLOAT);
    v_asac_pre_strike_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_PRE_STRIKE_CAPT_QTY_FLOAT);
    v_asac_today_strike_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TODAY_STRIKE_CAPT_QTY_FLOAT);
    v_asac_rece_margin = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_RECE_MARGIN_FLOAT);
    v_asac_realize_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
    v_asac_open_amount = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_OPEN_AMOUNT_FLOAT);
    v_asac_posi_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


    // [主动推送][futu.exgpposi][期货主推_持仓_交易组持仓主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.130", 0);
    lpPubMsg->SetInt64(LDBIZ_EXGP_ROW_ID_INT64,v_exgp_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpPubMsg->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpPubMsg->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_OLD_COMM_CAPT_QTY_FLOAT,v_exgp_old_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TODAY_COMM_CAPT_QTY_FLOAT,v_exgp_today_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_OLD_TRADE_CAPT_QTY_FLOAT,v_exgp_old_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TODAY_TRADE_CAPT_QTY_FLOAT,v_exgp_today_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_PRE_STRIKE_CAPT_QTY_FLOAT,v_exgp_pre_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_TODAY_STRIKE_CAPT_QTY_FLOAT,v_exgp_today_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_EXGP_RECE_MARGIN_FLOAT,v_exgp_rece_margin);
    lpPubMsg->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
    lpPubMsg->SetDouble(LDBIZ_EXGP_OPEN_AMOUNT_FLOAT,v_exgp_open_amount);
    lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
    glpPubSub_Interface->PubTopics("futu.exgpposi", lpPubMsg);


    // [主动推送][futu.asacposi][期货主推_持仓_资产账户持仓主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.131", 0);
    lpPubMsg->SetInt64(LDBIZ_ASAC_ROW_ID_INT64,v_asac_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpPubMsg->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpPubMsg->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_OLD_COMM_CAPT_QTY_FLOAT,v_asac_old_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TODAY_COMM_CAPT_QTY_FLOAT,v_asac_today_comm_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_OLD_TRADE_CAPT_QTY_FLOAT,v_asac_old_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TODAY_TRADE_CAPT_QTY_FLOAT,v_asac_today_trade_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_PRE_STRIKE_CAPT_QTY_FLOAT,v_asac_pre_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_TODAY_STRIKE_CAPT_QTY_FLOAT,v_asac_today_strike_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_RECE_MARGIN_FLOAT,v_asac_rece_margin);
    lpPubMsg->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
    lpPubMsg->SetDouble(LDBIZ_ASAC_OPEN_AMOUNT_FLOAT,v_asac_open_amount);
    lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
    glpPubSub_Interface->PubTopics("futu.asacposi", lpPubMsg);


    // if @指令批号# >0 then
    if (v_comm_batch_no >0)
    {
        //调用过程[事务_交易期货_指令_获取指令汇总]
        //组织事务请求
        if(lpTSCall1Ans9)
        {
          lpTSCall1Ans9->FreeMsg();
          lpTSCall1Ans9=NULL;
        }
        lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.4", 0);
        lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req9->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
        lpTSCall1Req9->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpTSCall1Req9->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req9->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
        glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
        if(!lpTSCall1Ans9)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.4]subcall timed out!");
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
        v_row_id = lpTSCall1Ans9->GetInt64(LDBIZ_ROW_ID_INT64);
        v_init_date = lpTSCall1Ans9->GetInt32(LDBIZ_INIT_DATE_INT);
        v_pd_no = lpTSCall1Ans9->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans9->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans9->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        strcpy(v_exch_crncy_type, lpTSCall1Ans9->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans9->GetInt32(LDBIZ_EXCH_NO_INT);
        v_futu_acco_no = lpTSCall1Ans9->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
        v_contrc_code_no = lpTSCall1Ans9->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans9->GetString(LDBIZ_CONTRC_CODE_STR));
        v_contrc_type = lpTSCall1Ans9->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_asset_type = lpTSCall1Ans9->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_dir = lpTSCall1Ans9->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans9->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_comm_time = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_TIME_INT);
        v_comm_opor = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_OPOR_INT);
        v_comm_dir = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_DIR_INT);
        v_comm_limit_price = lpTSCall1Ans9->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
        v_limit_actual_price = lpTSCall1Ans9->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
        v_comm_qty = lpTSCall1Ans9->GetDouble(LDBIZ_COMM_QTY_FLOAT);
        v_comm_amt = lpTSCall1Ans9->GetDouble(LDBIZ_COMM_AMT_FLOAT);
        v_order_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_comm_cancel_qty = lpTSCall1Ans9->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
        v_comm_await_cancel_qty = lpTSCall1Ans9->GetDouble(LDBIZ_COMM_AWAIT_CANCEL_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans9->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_strike_qty = lpTSCall1Ans9->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        strcpy(v_strike_status, lpTSCall1Ans9->GetString(LDBIZ_STRIKE_STATUS_STR));
        strcpy(v_comm_sum_status, lpTSCall1Ans9->GetString(LDBIZ_COMM_SUM_STATUS_STR));
        v_comm_begin_date = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
        v_comm_end_date = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_END_DATE_INT);
        v_comm_begin_time = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
        v_comm_end_time = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_END_TIME_INT);
        v_comm_comple_date = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
        v_comm_comple_time = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
        v_max_comm_comple_date = lpTSCall1Ans9->GetInt32(LDBIZ_MAX_COMM_COMPLE_DATE_INT);
        v_max_comm_comple_time = lpTSCall1Ans9->GetInt32(LDBIZ_MAX_COMM_COMPLE_TIME_INT);
        v_comm_appr_date = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
        v_comm_appr_time = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
        v_comm_appr_qty = lpTSCall1Ans9->GetDouble(LDBIZ_COMM_APPR_QTY_FLOAT);
        strcpy(v_comm_sum_approve_status, lpTSCall1Ans9->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
        v_buy_order_qty = lpTSCall1Ans9->GetDouble(LDBIZ_BUY_ORDER_QTY_FLOAT);
        v_sell_order_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SELL_ORDER_QTY_FLOAT);
        v_buy_comm_qty = lpTSCall1Ans9->GetDouble(LDBIZ_BUY_COMM_QTY_FLOAT);
        v_sell_comm_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SELL_COMM_QTY_FLOAT);
        v_buy_strike_qty = lpTSCall1Ans9->GetDouble(LDBIZ_BUY_STRIKE_QTY_FLOAT);
        v_sell_strike_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SELL_STRIKE_QTY_FLOAT);
        v_buy_strike_amt = lpTSCall1Ans9->GetDouble(LDBIZ_BUY_STRIKE_AMT_FLOAT);
        v_sell_strike_amt = lpTSCall1Ans9->GetDouble(LDBIZ_SELL_STRIKE_AMT_FLOAT);
        v_buy_comm_amt = lpTSCall1Ans9->GetDouble(LDBIZ_BUY_COMM_AMT_FLOAT);
        v_sell_comm_amt = lpTSCall1Ans9->GetDouble(LDBIZ_SELL_COMM_AMT_FLOAT);
        v_rece_margin = lpTSCall1Ans9->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_comm_oper_way, lpTSCall1Ans9->GetString(LDBIZ_COMM_OPER_WAY_STR));
        v_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_UPDATE_TIMES_INT);


        // [主动推送][futu.commtotal][期货主推_指令_指令汇总主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.93", 0);
        lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
        lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
        lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
        lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
        lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
        lpPubMsg->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_TIME_INT,v_comm_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpPubMsg->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
        lpPubMsg->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
        lpPubMsg->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
        lpPubMsg->SetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT,v_comm_limit_price);
        lpPubMsg->SetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,v_limit_actual_price);
        lpPubMsg->SetDouble(LDBIZ_COMM_QTY_FLOAT,v_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_AMT_FLOAT,v_comm_amt);
        lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT,v_comm_cancel_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_AWAIT_CANCEL_QTY_FLOAT,v_comm_await_cancel_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT,v_comm_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
        lpPubMsg->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
        lpPubMsg->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
        lpPubMsg->SetString(LDBIZ_STRIKE_STATUS_STR,v_strike_status);
        lpPubMsg->SetString(LDBIZ_COMM_SUM_STATUS_STR,v_comm_sum_status);
        lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_DATE_INT,v_comm_begin_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_END_DATE_INT,v_comm_end_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_BEGIN_TIME_INT,v_comm_begin_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_END_TIME_INT,v_comm_end_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_DATE_INT,v_comm_comple_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_TIME_INT,v_comm_comple_time);
        lpPubMsg->SetInt32(LDBIZ_MAX_COMM_COMPLE_DATE_INT,v_max_comm_comple_date);
        lpPubMsg->SetInt32(LDBIZ_MAX_COMM_COMPLE_TIME_INT,v_max_comm_comple_time);
        lpPubMsg->SetInt32(LDBIZ_COMM_APPR_DATE_INT,v_comm_appr_date);
        lpPubMsg->SetInt32(LDBIZ_COMM_APPR_TIME_INT,v_comm_appr_time);
        lpPubMsg->SetDouble(LDBIZ_COMM_APPR_QTY_FLOAT,v_comm_appr_qty);
        lpPubMsg->SetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR,v_comm_sum_approve_status);
        lpPubMsg->SetDouble(LDBIZ_BUY_ORDER_QTY_FLOAT,v_buy_order_qty);
        lpPubMsg->SetDouble(LDBIZ_SELL_ORDER_QTY_FLOAT,v_sell_order_qty);
        lpPubMsg->SetDouble(LDBIZ_BUY_COMM_QTY_FLOAT,v_buy_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_SELL_COMM_QTY_FLOAT,v_sell_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_BUY_STRIKE_QTY_FLOAT,v_buy_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_SELL_STRIKE_QTY_FLOAT,v_sell_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_BUY_STRIKE_AMT_FLOAT,v_buy_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_SELL_STRIKE_AMT_FLOAT,v_sell_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_BUY_COMM_AMT_FLOAT,v_buy_comm_amt);
        lpPubMsg->SetDouble(LDBIZ_SELL_COMM_AMT_FLOAT,v_sell_comm_amt);
        lpPubMsg->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("futu.commtotal", lpPubMsg);

    // end if;
    }

    //订单主推

    // if @是否撤单#=《是否撤单-是》 and @订单序号串# <> "" then
    if (v_is_withdraw==1 && strcmp(v_order_id_str , "")!=0)
    {
      //调用过程[事务_交易期货_交易_根据订单序号串查询订单结果集]
      //组织事务请求
      if(lpTSCall1Ans10)
      {
        lpTSCall1Ans10->FreeMsg();
        lpTSCall1Ans10=NULL;
      }
      lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.17", 0);
      lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
      lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
      lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
      lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
      lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
      lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
      lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
      lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
      lpTSCall1Req10->SetString(LDBIZ_ORDER_ID_STR_STR,v_order_id_str);
      glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
      if(!lpTSCall1Ans10)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.17]subcall timed out!");
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


      // [获取结果集][lpMainMsg]
      lpMainMsg=lpTSCall1Ans10->GetGroup(LDTAG_NO_RESULTSET);


      // [遍历结果集开始][lpMainMsg]
      iRecordCount = lpMainMsg->GetRecordCount();
      for (int i = 0; i < iRecordCount;i++) 
      {
          IRecord* lpRecord =lpMainMsg->GetRecord(i);
          if(lpRecord)
          {

              //获取记录字段值
              v_row_id = lpRecord->GetInt64(LDBIZ_ROW_ID_INT64);
              v_opor_co_no = lpRecord->GetInt32(LDBIZ_OPOR_CO_NO_INT);
              v_opor_no = lpRecord->GetInt32(LDBIZ_OPOR_NO_INT);
              strcpy(v_oper_mac, lpRecord->GetString(LDBIZ_OPER_MAC_STR));
              strcpy(v_oper_ip_addr, lpRecord->GetString(LDBIZ_OPER_IP_ADDR_STR));
              strcpy(v_oper_info, lpRecord->GetString(LDBIZ_OPER_INFO_STR));
              strcpy(v_oper_way, lpRecord->GetString(LDBIZ_OPER_WAY_STR));
              v_init_date = lpRecord->GetInt32(LDBIZ_INIT_DATE_INT);
              v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
              v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
              v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
              v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
              strcpy(v_out_acco, lpRecord->GetString(LDBIZ_OUT_ACCO_STR));
              v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
              v_pass_no = lpRecord->GetInt32(LDBIZ_PASS_NO_INT);
              v_futu_acco_no = lpRecord->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
              v_contrc_code_no = lpRecord->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
              v_asset_type = lpRecord->GetInt32(LDBIZ_ASSET_TYPE_INT);
              v_contrc_type = lpRecord->GetInt32(LDBIZ_CONTRC_TYPE_INT);
              v_contrc_unit = lpRecord->GetInt32(LDBIZ_CONTRC_UNIT_INT);
              v_external_no = lpRecord->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
              v_report_date = lpRecord->GetInt32(LDBIZ_REPORT_DATE_INT);
              v_report_time = lpRecord->GetInt32(LDBIZ_REPORT_TIME_INT);
              strcpy(v_report_no, lpRecord->GetString(LDBIZ_REPORT_NO_STR));
              v_order_date = lpRecord->GetInt32(LDBIZ_ORDER_DATE_INT);
              v_order_time = lpRecord->GetInt32(LDBIZ_ORDER_TIME_INT);
              v_order_dir = lpRecord->GetInt32(LDBIZ_ORDER_DIR_INT);
              v_order_batch_no = lpRecord->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
              v_contrc_dir = lpRecord->GetInt32(LDBIZ_CONTRC_DIR_INT);
              v_hedge_type = lpRecord->GetInt32(LDBIZ_HEDGE_TYPE_INT);
              v_order_price = lpRecord->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
              v_order_qty = lpRecord->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
              strcpy(v_order_status, lpRecord->GetString(LDBIZ_ORDER_STATUS_STR));
              v_wtdraw_qty = lpRecord->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
              v_strike_qty = lpRecord->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
              v_strike_price = lpRecord->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
              v_strike_amt = lpRecord->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
              v_trade_fee = lpRecord->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
              v_trade_commis = lpRecord->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
              v_other_commis = lpRecord->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
              v_strike_commis = lpRecord->GetDouble(LDBIZ_STRIKE_COMMIS_FLOAT);
              v_strike_other_commis = lpRecord->GetDouble(LDBIZ_STRIKE_OTHER_COMMIS_FLOAT);
              v_strike_all_fee = lpRecord->GetDouble(LDBIZ_STRIKE_ALL_FEE_FLOAT);
              v_report_fee = lpRecord->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
              v_wtdraw_fee = lpRecord->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
              v_rece_margin = lpRecord->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
              v_trade_occur_amt = lpRecord->GetDouble(LDBIZ_TRADE_OCCUR_AMT_FLOAT);
              strcpy(v_comb_code, lpRecord->GetString(LDBIZ_COMB_CODE_STR));
              v_margin_ratio = lpRecord->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);
              strcpy(v_rsp_info, lpRecord->GetString(LDBIZ_RSP_INFO_STR));
              v_compli_trig_id = lpRecord->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);
              strcpy(v_order_oper_way, lpRecord->GetString(LDBIZ_ORDER_OPER_WAY_STR));
              v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


          // [主动推送][futu.order][期货主推_订单_订单主推消息]
          lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.90", 0);
          lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
          lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
          lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
          lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
          lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
          lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
          lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
          lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
          lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
          lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
          lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
          lpPubMsg->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
          lpPubMsg->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
          lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
          lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
          lpPubMsg->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
          lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
          lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
          lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
          lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
          lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
          lpPubMsg->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
          lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
          lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
          lpPubMsg->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
          lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
          lpPubMsg->SetDouble(LDBIZ_TRADE_FEE_FLOAT,v_trade_fee);
          lpPubMsg->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
          lpPubMsg->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
          lpPubMsg->SetDouble(LDBIZ_REPORT_FEE_FLOAT,v_report_fee);
          lpPubMsg->SetDouble(LDBIZ_WTDRAW_FEE_FLOAT,v_wtdraw_fee);
          lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
          lpPubMsg->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
          lpPubMsg->SetDouble(LDBIZ_MARGIN_RATIO_FLOAT,v_margin_ratio);
          lpPubMsg->SetString(LDBIZ_RSP_INFO_STR,v_rsp_info);
          lpPubMsg->SetInt64(LDBIZ_COMPLI_TRIG_ID_INT64,v_compli_trig_id);
          lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
          lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
          lpPubMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
          lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
          lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
          glpPubSub_Interface->PubTopics("futu.order", lpPubMsg);


          // if   @订单批号# > 0 then
          if (  v_order_batch_no > 0)
          {
              //调用过程[事务_交易期货_交易_获取订单汇总]
              //组织事务请求
              if(lpTSCall1Ans11)
              {
                lpTSCall1Ans11->FreeMsg();
                lpTSCall1Ans11=NULL;
              }
              lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.19", 0);
              lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
              lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
              lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
              lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
              lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
              lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
              lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
              lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
              lpTSCall1Req11->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
              lpTSCall1Req11->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
              lpTSCall1Req11->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
              glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
              if(!lpTSCall1Ans11)  //  超时错误
              {
                  lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                  lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.19]subcall timed out!");
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
              v_row_id = lpTSCall1Ans11->GetInt64(LDBIZ_ROW_ID_INT64);
              strcpy(v_oper_func_code, lpTSCall1Ans11->GetString(LDBIZ_OPER_FUNC_CODE_STR));
              v_init_date = lpTSCall1Ans11->GetInt32(LDBIZ_INIT_DATE_INT);
              v_pd_no = lpTSCall1Ans11->GetInt32(LDBIZ_PD_NO_INT);
              v_exch_group_no = lpTSCall1Ans11->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
              v_asset_acco_no = lpTSCall1Ans11->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
              v_pass_no = lpTSCall1Ans11->GetInt32(LDBIZ_PASS_NO_INT);
              strcpy(v_crncy_type, lpTSCall1Ans11->GetString(LDBIZ_CRNCY_TYPE_STR));
              v_exch_no = lpTSCall1Ans11->GetInt32(LDBIZ_EXCH_NO_INT);
              v_contrc_code_no = lpTSCall1Ans11->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
              strcpy(v_contrc_code, lpTSCall1Ans11->GetString(LDBIZ_CONTRC_CODE_STR));
              v_asset_type = lpTSCall1Ans11->GetInt32(LDBIZ_ASSET_TYPE_INT);
              v_contrc_type = lpTSCall1Ans11->GetInt32(LDBIZ_CONTRC_TYPE_INT);
              v_contrc_unit = lpTSCall1Ans11->GetInt32(LDBIZ_CONTRC_UNIT_INT);
              v_external_no = lpTSCall1Ans11->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
              v_order_dir = lpTSCall1Ans11->GetInt32(LDBIZ_ORDER_DIR_INT);
              v_contrc_dir = lpTSCall1Ans11->GetInt32(LDBIZ_CONTRC_DIR_INT);
              v_hedge_type = lpTSCall1Ans11->GetInt32(LDBIZ_HEDGE_TYPE_INT);
              v_order_price = lpTSCall1Ans11->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
              v_order_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
              strcpy(v_order_sum_status, lpTSCall1Ans11->GetString(LDBIZ_ORDER_SUM_STATUS_STR));
              v_wtdraw_qty = lpTSCall1Ans11->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
              v_waste_qty = lpTSCall1Ans11->GetDouble(LDBIZ_WASTE_QTY_FLOAT);
              v_strike_qty = lpTSCall1Ans11->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
              v_strike_aver_price = lpTSCall1Ans11->GetDouble(LDBIZ_STRIKE_AVER_PRICE_FLOAT);
              v_strike_amt = lpTSCall1Ans11->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
              v_trade_fee = lpTSCall1Ans11->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
              v_trade_commis = lpTSCall1Ans11->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
              v_other_commis = lpTSCall1Ans11->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
              v_strike_commis = lpTSCall1Ans11->GetDouble(LDBIZ_STRIKE_COMMIS_FLOAT);
              v_strike_other_commis = lpTSCall1Ans11->GetDouble(LDBIZ_STRIKE_OTHER_COMMIS_FLOAT);
              v_report_fee = lpTSCall1Ans11->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
              v_wtdraw_fee = lpTSCall1Ans11->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
              v_strike_all_fee = lpTSCall1Ans11->GetDouble(LDBIZ_STRIKE_ALL_FEE_FLOAT);
              v_rece_margin = lpTSCall1Ans11->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
              strcpy(v_order_oper_way, lpTSCall1Ans11->GetString(LDBIZ_ORDER_OPER_WAY_STR));
              v_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_UPDATE_TIMES_INT);


              // [主动推送][futu.ordertotal][期货主推_订单_订单汇总主推消息]
              lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.91", 0);
              lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
              lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
              lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
              lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
              lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
              lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
              lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
              lpPubMsg->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
              lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
              lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
              lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
              lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
              lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
              lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
              lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
              lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
              lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
              lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
              lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
              lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
              lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
              lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
              lpPubMsg->SetString(LDBIZ_ORDER_SUM_STATUS_STR,v_order_sum_status);
              lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
              lpPubMsg->SetDouble(LDBIZ_WASTE_QTY_FLOAT,v_waste_qty);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_AVER_PRICE_FLOAT,v_strike_aver_price);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
              lpPubMsg->SetDouble(LDBIZ_TRADE_FEE_FLOAT,v_trade_fee);
              lpPubMsg->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
              lpPubMsg->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_COMMIS_FLOAT,v_strike_commis);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_OTHER_COMMIS_FLOAT,v_strike_other_commis);
              lpPubMsg->SetDouble(LDBIZ_REPORT_FEE_FLOAT,v_report_fee);
              lpPubMsg->SetDouble(LDBIZ_WTDRAW_FEE_FLOAT,v_wtdraw_fee);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_ALL_FEE_FLOAT,v_strike_all_fee);
              lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
              lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
              lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
              glpPubSub_Interface->PubTopics("futu.ordertotal", lpPubMsg);

          // end if;
          }


      // [遍历结果集结束][lpMainMsg]
          }
      }

    // end if;
    }

    //撤单主推

    // if @是否撤单#=《是否撤单-是》 and @撤单序号串# <> "" then
    if (v_is_withdraw==1 && strcmp(v_wtdraw_id_str , "")!=0)
    {

        // set @订单序号串# = @撤单序号串#;
        strcpy(v_order_id_str,v_wtdraw_id_str);
        //调用过程[事务_交易期货_交易_根据订单序号串查询撤单结果集]
        //组织事务请求
        if(lpTSCall1Ans12)
        {
          lpTSCall1Ans12->FreeMsg();
          lpTSCall1Ans12=NULL;
        }
        lpTSCall1Req12=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.18", 0);
        lpTSCall1Req12->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req12->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req12->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req12->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req12->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req12->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req12->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req12->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req12->SetString(LDBIZ_ORDER_ID_STR_STR,v_order_id_str);
        glpTSSubcallSerives->SubCall(lpTSCall1Req12, &lpTSCall1Ans12, 5000);
        if(!lpTSCall1Ans12)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.18]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans12->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans12->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans12->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans12->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans12->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans12->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans12->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans12->GetString(LDBIZ_ERROR_INFO_STR));


        // [获取结果集][lpMainMsg2]
        lpMainMsg2=lpTSCall1Ans12->GetGroup(LDTAG_NO_RESULTSET);


        // [遍历结果集开始][lpMainMsg2]
        iRecordCount = lpMainMsg2->GetRecordCount();
        for (int i = 0; i < iRecordCount;i++) 
        {
            IRecord* lpRecord =lpMainMsg2->GetRecord(i);
            if(lpRecord)
            {

                //获取记录字段值
                v_row_id = lpRecord->GetInt64(LDBIZ_ROW_ID_INT64);
                v_opor_co_no = lpRecord->GetInt32(LDBIZ_OPOR_CO_NO_INT);
                v_opor_no = lpRecord->GetInt32(LDBIZ_OPOR_NO_INT);
                strcpy(v_oper_mac, lpRecord->GetString(LDBIZ_OPER_MAC_STR));
                strcpy(v_oper_ip_addr, lpRecord->GetString(LDBIZ_OPER_IP_ADDR_STR));
                strcpy(v_oper_info, lpRecord->GetString(LDBIZ_OPER_INFO_STR));
                strcpy(v_oper_way, lpRecord->GetString(LDBIZ_OPER_WAY_STR));
                strcpy(v_oper_func_code, lpRecord->GetString(LDBIZ_OPER_FUNC_CODE_STR));
                v_init_date = lpRecord->GetInt32(LDBIZ_INIT_DATE_INT);
                v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
                v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
                v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
                v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
                v_pass_no = lpRecord->GetInt32(LDBIZ_PASS_NO_INT);
                strcpy(v_out_acco, lpRecord->GetString(LDBIZ_OUT_ACCO_STR));
                strcpy(v_crncy_type, lpRecord->GetString(LDBIZ_CRNCY_TYPE_STR));
                v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
                v_futu_acco_no = lpRecord->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
                strcpy(v_futu_acco, lpRecord->GetString(LDBIZ_FUTU_ACCO_STR));
                v_contrc_code_no = lpRecord->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
                strcpy(v_contrc_code, lpRecord->GetString(LDBIZ_CONTRC_CODE_STR));
                v_external_no = lpRecord->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
                v_wtdraw_batch_no = lpRecord->GetInt32(LDBIZ_WTDRAW_BATCH_NO_INT);
                v_wtdraw_date = lpRecord->GetInt32(LDBIZ_WTDRAW_DATE_INT);
                v_wtdraw_time = lpRecord->GetInt32(LDBIZ_WTDRAW_TIME_INT);
                v_order_date = lpRecord->GetInt32(LDBIZ_ORDER_DATE_INT);
                v_order_id = lpRecord->GetInt64(LDBIZ_ORDER_ID_INT64);
                v_report_date = lpRecord->GetInt32(LDBIZ_REPORT_DATE_INT);
                v_report_time = lpRecord->GetInt32(LDBIZ_REPORT_TIME_INT);
                strcpy(v_report_no, lpRecord->GetString(LDBIZ_REPORT_NO_STR));
                strcpy(v_wtdraw_status, lpRecord->GetString(LDBIZ_WTDRAW_STATUS_STR));
                v_wtdraw_qty = lpRecord->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
                strcpy(v_wtdraw_remark, lpRecord->GetString(LDBIZ_WTDRAW_REMARK_STR));
                v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


            // if @撤单状态# <> 《撤单状态-成功》 then
            if (strcmp(v_wtdraw_status , "3")!=0)
            {

                    // [主动推送][futu.rptwtdraw][期货主推_报盘_撤单主推报盘消息]
                    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.102", 0);
                    lpPubMsg->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                    lpPubMsg->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                    lpPubMsg->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                    lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                    lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
                    lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
                    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                    lpPubMsg->SetString(LDBIZ_FUTU_ACCO_STR,v_futu_acco);
                    lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
                    lpPubMsg->SetInt32(LDBIZ_WTDRAW_DATE_INT,v_wtdraw_date);
                    lpPubMsg->SetInt32(LDBIZ_WTDRAW_TIME_INT,v_wtdraw_time);
                    lpPubMsg->SetString(LDBIZ_WTDRAW_STATUS_STR,v_wtdraw_status);
                    lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
                    lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
                    lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
                    glpPubSub_Interface->PubTopics("futu.rptwtdraw", lpPubMsg);

            // end if;
            }


        // [遍历结果集结束][lpMainMsg2]
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
        if(lpTSCall1Ans13)
        {
          lpTSCall1Ans13->FreeMsg();
          lpTSCall1Ans13=NULL;
        }
        lpTSCall1Req13=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req13->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req13->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req13->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req13->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req13->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req13->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req13->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req13->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req13->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req13->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req13, &lpTSCall1Ans13, 5000);
        if (lpTSCall1Ans13)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans13->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans13->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans13->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans13->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans13->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
    lpOutBizMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpOutBizMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpOutBizMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpOutBizMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpOutBizMsg->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpOutBizMsg->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
    lpOutBizMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpOutBizMsg->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
    lpOutBizMsg->SetDouble(LDBIZ_COMM_QTY_FLOAT,v_comm_qty);
    lpOutBizMsg->SetDouble(LDBIZ_COMM_AMT_FLOAT,v_comm_amt);
    lpOutBizMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpOutBizMsg->SetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT,v_comm_cancel_qty);
    lpOutBizMsg->SetString(LDBIZ_COMM_STATUS_STR,v_comm_status);
    lpOutBizMsg->SetString(LDBIZ_STRIKE_STATUS_STR,v_strike_status);
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
    if(lpTSCall1Ans13)
        lpTSCall1Ans13->FreeMsg();
    return iRet;
}

//逻辑_交易期货_指令_查询指令结果集
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
    int64 v_comm_id;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_comm_opor;
    int v_comm_executor;
    int v_comm_appr_oper;
    char v_comm_appr_status_str[2049];
    char v_exch_no_str[2049];
    int v_contrc_code_no;
    char v_asset_type_str[2049];
    char v_comm_dir_str[2049];
    char v_comm_status_str[65];
    char v_strike_status_str[65];
    char v_comm_oper_way[3];
    int v_comm_comple_flag;
    char v_contrc_dir_str[65];
    int64 v_row_id;
    int v_row_count;
    int v_sort_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_oper_func_code[17];
    int v_init_date;
    int v_pass_no;
    char v_out_acco[33];
    char v_exch_crncy_type[4];
    int v_exch_no;
    int v_futu_acco_no;
    char v_contrc_code[7];
    int v_contrc_type;
    int v_asset_type;
    int v_contrc_dir;
    int v_hedge_type;
    int v_comm_date;
    int v_comm_time;
    int v_comm_batch_no;
    int v_comm_dir;
    double v_comm_limit_price;
    double v_limit_actual_price;
    double v_comm_qty;
    double v_comm_amt;
    double v_order_qty;
    double v_comm_cancel_qty;
    double v_strike_amt;
    double v_strike_qty;
    double v_comm_frozen_qty;
    double v_rece_margin;
    int v_capit_reback_days;
    int v_posi_reback_days;
    char v_strike_status[3];
    char v_comm_status[3];
    int v_comm_begin_date;
    int v_comm_end_date;
    int v_comm_begin_time;
    int v_comm_end_time;
    int v_comm_comple_date;
    int v_comm_comple_time;
    int v_comm_appr_date;
    int v_comm_appr_time;
    char v_comm_appr_status[3];
    int v_comm_appr_oper_no;
    char v_comm_appr_remark[256];
    int64 v_external_no;
    char v_comb_code[7];
    char v_remark_info[256];
    int v_update_times;
    char v_busi_ctrl_str[65];
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
    v_comm_id=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_comm_opor=0;
    v_comm_executor=0;
    v_comm_appr_oper=0;
    strcpy(v_comm_appr_status_str, " ");
    strcpy(v_exch_no_str, " ");
    v_contrc_code_no=0;
    strcpy(v_asset_type_str, " ");
    strcpy(v_comm_dir_str, " ");
    strcpy(v_comm_status_str, " ");
    strcpy(v_strike_status_str, " ");
    strcpy(v_comm_oper_way, " ");
    v_comm_comple_flag=0;
    strcpy(v_contrc_dir_str, " ");
    v_row_id=0;
    v_row_count=-1;
    v_sort_type=1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_oper_func_code, " ");
    v_init_date=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_exch_crncy_type, "CNY");
    v_exch_no=0;
    v_futu_acco_no=0;
    strcpy(v_contrc_code, " ");
    v_contrc_type=0;
    v_asset_type=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    v_comm_date=0;
    v_comm_time=0;
    v_comm_batch_no=0;
    v_comm_dir=0;
    v_comm_limit_price=0;
    v_limit_actual_price=0;
    v_comm_qty=0;
    v_comm_amt=0;
    v_order_qty=0;
    v_comm_cancel_qty=0;
    v_strike_amt=0;
    v_strike_qty=0;
    v_comm_frozen_qty=0;
    v_rece_margin=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    strcpy(v_strike_status, "0");
    strcpy(v_comm_status, "0");
    v_comm_begin_date=0;
    v_comm_end_date=0;
    v_comm_begin_time=0;
    v_comm_end_time=0;
    v_comm_comple_date=0;
    v_comm_comple_time=0;
    v_comm_appr_date=0;
    v_comm_appr_time=0;
    strcpy(v_comm_appr_status, " ");
    v_comm_appr_oper_no=0;
    strcpy(v_comm_appr_remark, " ");
    v_external_no=0;
    strcpy(v_comb_code, " ");
    strcpy(v_remark_info, " ");
    v_update_times=1;
    strcpy(v_busi_ctrl_str, " ");
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
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_comm_opor = lpInBizMsg->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_comm_executor = lpInBizMsg->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_comm_appr_oper = lpInBizMsg->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
    strncpy(v_comm_appr_status_str, lpInBizMsg->GetString(LDBIZ_COMM_APPR_STATUS_STR_STR),2048);
    v_comm_appr_status_str[2048] = '\0';
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_contrc_code_no = lpInBizMsg->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strncpy(v_asset_type_str, lpInBizMsg->GetString(LDBIZ_ASSET_TYPE_STR_STR),2048);
    v_asset_type_str[2048] = '\0';
    strncpy(v_comm_dir_str, lpInBizMsg->GetString(LDBIZ_COMM_DIR_STR_STR),2048);
    v_comm_dir_str[2048] = '\0';
    strncpy(v_comm_status_str, lpInBizMsg->GetString(LDBIZ_COMM_STATUS_STR_STR),64);
    v_comm_status_str[64] = '\0';
    strncpy(v_strike_status_str, lpInBizMsg->GetString(LDBIZ_STRIKE_STATUS_STR_STR),64);
    v_strike_status_str[64] = '\0';
    strncpy(v_comm_oper_way, lpInBizMsg->GetString(LDBIZ_COMM_OPER_WAY_STR),2);
    v_comm_oper_way[2] = '\0';
    v_comm_comple_flag = lpInBizMsg->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
    strncpy(v_contrc_dir_str, lpInBizMsg->GetString(LDBIZ_CONTRC_DIR_STR_STR),64);
    v_contrc_dir_str[64] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);
    v_sort_type = lpInBizMsg->GetInt32(LDBIZ_SORT_TYPE_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //公共子系统检查

    // set @业务控制串# = "111";
    strcpy(v_busi_ctrl_str,"111");
    //调用过程[事务_公共_公共接口_检查系统状态查询权限身份获取操作员权限串]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.37", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.37]subcall timed out!");
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

    //调用过程[事务_交易期货_指令_查询指令结果集]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.7", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_APPR_OPER_INT,v_comm_appr_oper);
    lpTSCall1Req1->SetString(LDBIZ_COMM_APPR_STATUS_STR_STR,v_comm_appr_status_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_TYPE_STR_STR,v_asset_type_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_DIR_STR_STR,v_comm_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_STATUS_STR_STR,v_comm_status_str);
    lpTSCall1Req1->SetString(LDBIZ_STRIKE_STATUS_STR_STR,v_strike_status_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_COMPLE_FLAG_INT,v_comm_comple_flag);
    lpTSCall1Req1->SetString(LDBIZ_CONTRC_DIR_STR_STR,v_contrc_dir_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetInt32(LDBIZ_SORT_TYPE_INT,v_sort_type);
    lpTSCall1Req1->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.7]subcall timed out!");
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

//逻辑_交易期货_指令_查询历史指令结果集
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
    int v_begin_date;
    int v_end_date;
    int64 v_comm_id;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_comm_opor;
    int v_comm_executor;
    int v_comm_appr_oper;
    char v_comm_appr_status_str[2049];
    char v_exch_no_str[2049];
    int v_contrc_code_no;
    char v_asset_type_str[2049];
    char v_comm_dir_str[2049];
    char v_comm_status_str[65];
    char v_strike_status_str[65];
    char v_comm_oper_way[3];
    int v_comm_comple_flag;
    char v_contrc_dir_str[65];
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_oper_func_code[17];
    int v_init_date;
    int v_pass_no;
    char v_out_acco[33];
    char v_exch_crncy_type[4];
    int v_exch_no;
    int v_futu_acco_no;
    char v_contrc_code[7];
    int v_contrc_type;
    int v_asset_type;
    int v_contrc_dir;
    int v_hedge_type;
    int v_comm_date;
    int v_comm_time;
    int v_comm_batch_no;
    int v_comm_dir;
    double v_comm_limit_price;
    double v_limit_actual_price;
    double v_comm_qty;
    double v_comm_amt;
    double v_order_qty;
    double v_comm_cancel_qty;
    double v_strike_amt;
    double v_strike_qty;
    double v_comm_frozen_qty;
    double v_rece_margin;
    int v_capit_reback_days;
    int v_posi_reback_days;
    char v_strike_status[3];
    char v_comm_status[3];
    int v_comm_begin_date;
    int v_comm_end_date;
    int v_comm_begin_time;
    int v_comm_end_time;
    int v_comm_comple_date;
    int v_comm_comple_time;
    int v_comm_appr_date;
    int v_comm_appr_time;
    char v_comm_appr_status[3];
    int v_comm_appr_oper_no;
    char v_comm_appr_remark[256];
    int64 v_external_no;
    char v_comb_code[7];
    char v_remark_info[256];
    int v_update_times;
    char v_busi_ctrl_str[65];
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
    v_begin_date=0;
    v_end_date=0;
    v_comm_id=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_comm_opor=0;
    v_comm_executor=0;
    v_comm_appr_oper=0;
    strcpy(v_comm_appr_status_str, " ");
    strcpy(v_exch_no_str, " ");
    v_contrc_code_no=0;
    strcpy(v_asset_type_str, " ");
    strcpy(v_comm_dir_str, " ");
    strcpy(v_comm_status_str, " ");
    strcpy(v_strike_status_str, " ");
    strcpy(v_comm_oper_way, " ");
    v_comm_comple_flag=0;
    strcpy(v_contrc_dir_str, " ");
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_oper_func_code, " ");
    v_init_date=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_exch_crncy_type, "CNY");
    v_exch_no=0;
    v_futu_acco_no=0;
    strcpy(v_contrc_code, " ");
    v_contrc_type=0;
    v_asset_type=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    v_comm_date=0;
    v_comm_time=0;
    v_comm_batch_no=0;
    v_comm_dir=0;
    v_comm_limit_price=0;
    v_limit_actual_price=0;
    v_comm_qty=0;
    v_comm_amt=0;
    v_order_qty=0;
    v_comm_cancel_qty=0;
    v_strike_amt=0;
    v_strike_qty=0;
    v_comm_frozen_qty=0;
    v_rece_margin=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    strcpy(v_strike_status, "0");
    strcpy(v_comm_status, "0");
    v_comm_begin_date=0;
    v_comm_end_date=0;
    v_comm_begin_time=0;
    v_comm_end_time=0;
    v_comm_comple_date=0;
    v_comm_comple_time=0;
    v_comm_appr_date=0;
    v_comm_appr_time=0;
    strcpy(v_comm_appr_status, " ");
    v_comm_appr_oper_no=0;
    strcpy(v_comm_appr_remark, " ");
    v_external_no=0;
    strcpy(v_comb_code, " ");
    strcpy(v_remark_info, " ");
    v_update_times=1;
    strcpy(v_busi_ctrl_str, " ");
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
    v_begin_date = lpInBizMsg->GetInt32(LDBIZ_BEGIN_DATE_INT);
    v_end_date = lpInBizMsg->GetInt32(LDBIZ_END_DATE_INT);
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_comm_opor = lpInBizMsg->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_comm_executor = lpInBizMsg->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_comm_appr_oper = lpInBizMsg->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
    strncpy(v_comm_appr_status_str, lpInBizMsg->GetString(LDBIZ_COMM_APPR_STATUS_STR_STR),2048);
    v_comm_appr_status_str[2048] = '\0';
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_contrc_code_no = lpInBizMsg->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strncpy(v_asset_type_str, lpInBizMsg->GetString(LDBIZ_ASSET_TYPE_STR_STR),2048);
    v_asset_type_str[2048] = '\0';
    strncpy(v_comm_dir_str, lpInBizMsg->GetString(LDBIZ_COMM_DIR_STR_STR),2048);
    v_comm_dir_str[2048] = '\0';
    strncpy(v_comm_status_str, lpInBizMsg->GetString(LDBIZ_COMM_STATUS_STR_STR),64);
    v_comm_status_str[64] = '\0';
    strncpy(v_strike_status_str, lpInBizMsg->GetString(LDBIZ_STRIKE_STATUS_STR_STR),64);
    v_strike_status_str[64] = '\0';
    strncpy(v_comm_oper_way, lpInBizMsg->GetString(LDBIZ_COMM_OPER_WAY_STR),2);
    v_comm_oper_way[2] = '\0';
    v_comm_comple_flag = lpInBizMsg->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
    strncpy(v_contrc_dir_str, lpInBizMsg->GetString(LDBIZ_CONTRC_DIR_STR_STR),64);
    v_contrc_dir_str[64] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //公共子系统检查

    // set @业务控制串# = "111";
    strcpy(v_busi_ctrl_str,"111");
    //调用过程[事务_公共_公共接口_检查系统状态查询权限身份获取操作员权限串]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.37", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.37]subcall timed out!");
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

    //调用过程[事务_交易期货_指令_查询历史指令结果集]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.8", 0);
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
    lpTSCall1Req1->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_APPR_OPER_INT,v_comm_appr_oper);
    lpTSCall1Req1->SetString(LDBIZ_COMM_APPR_STATUS_STR_STR,v_comm_appr_status_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_TYPE_STR_STR,v_asset_type_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_DIR_STR_STR,v_comm_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_STATUS_STR_STR,v_comm_status_str);
    lpTSCall1Req1->SetString(LDBIZ_STRIKE_STATUS_STR_STR,v_strike_status_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_COMPLE_FLAG_INT,v_comm_comple_flag);
    lpTSCall1Req1->SetString(LDBIZ_CONTRC_DIR_STR_STR,v_contrc_dir_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.8]subcall timed out!");
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

//逻辑_交易期货_指令_查询指令分发结果集
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
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    char v_exch_no_str[2049];
    int v_contrc_code_no;
    int v_disp_opor;
    int v_before_comm_executor;
    int v_comm_executor;
    int64 v_comm_id;
    char v_comm_dir_str[2049];
    int64 v_row_id;
    int v_row_count;
    int v_sort_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_oper_func_code[17];
    int v_init_date;
    int v_exch_no;
    int v_contrc_type;
    int v_comm_date;
    int v_comm_batch_no;
    int v_comm_dir;
    char v_comm_status[3];
    int v_comm_opor;
    int v_disp_date;
    int v_disp_time;
    int v_is_withdraw;
    int v_disp_flag;
    char v_disp_remark[256];
    int v_update_times;
    char v_busi_ctrl_str[65];
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
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    strcpy(v_exch_no_str, " ");
    v_contrc_code_no=0;
    v_disp_opor=0;
    v_before_comm_executor=0;
    v_comm_executor=0;
    v_comm_id=0;
    strcpy(v_comm_dir_str, " ");
    v_row_id=0;
    v_row_count=-1;
    v_sort_type=1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_oper_func_code, " ");
    v_init_date=0;
    v_exch_no=0;
    v_contrc_type=0;
    v_comm_date=0;
    v_comm_batch_no=0;
    v_comm_dir=0;
    strcpy(v_comm_status, "0");
    v_comm_opor=0;
    v_disp_date=0;
    v_disp_time=0;
    v_is_withdraw=0;
    v_disp_flag=0;
    strcpy(v_disp_remark, " ");
    v_update_times=1;
    strcpy(v_busi_ctrl_str, " ");
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_contrc_code_no = lpInBizMsg->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_disp_opor = lpInBizMsg->GetInt32(LDBIZ_DISP_OPOR_INT);
    v_before_comm_executor = lpInBizMsg->GetInt32(LDBIZ_BEFORE_COMM_EXECUTOR_INT);
    v_comm_executor = lpInBizMsg->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    strncpy(v_comm_dir_str, lpInBizMsg->GetString(LDBIZ_COMM_DIR_STR_STR),2048);
    v_comm_dir_str[2048] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);
    v_sort_type = lpInBizMsg->GetInt32(LDBIZ_SORT_TYPE_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //公共子系统检查

    // set @业务控制串# = "111";
    strcpy(v_busi_ctrl_str,"111");
    //调用过程[事务_公共_公共接口_检查系统状态查询权限身份获取操作员权限串]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.37", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.37]subcall timed out!");
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

    //调用过程[事务_交易期货_指令_查询指令分发结果集]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.9", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req1->SetInt32(LDBIZ_DISP_OPOR_INT,v_disp_opor);
    lpTSCall1Req1->SetInt32(LDBIZ_BEFORE_COMM_EXECUTOR_INT,v_before_comm_executor);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpTSCall1Req1->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req1->SetString(LDBIZ_COMM_DIR_STR_STR,v_comm_dir_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetInt32(LDBIZ_SORT_TYPE_INT,v_sort_type);
    lpTSCall1Req1->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.9]subcall timed out!");
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

//逻辑_交易期货_指令_查询历史指令分发结果集
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
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    char v_exch_no_str[2049];
    int v_contrc_code_no;
    int v_disp_opor;
    int v_before_comm_executor;
    int v_comm_executor;
    int64 v_comm_id;
    char v_comm_dir_str[2049];
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_oper_func_code[17];
    int v_init_date;
    int v_exch_no;
    int v_contrc_type;
    int v_comm_date;
    int v_comm_batch_no;
    int v_comm_dir;
    char v_comm_status[3];
    int v_comm_opor;
    int v_disp_date;
    int v_disp_time;
    int v_is_withdraw;
    int v_disp_flag;
    char v_disp_remark[256];
    int v_update_times;
    char v_busi_ctrl_str[65];
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
    v_begin_date=0;
    v_end_date=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    strcpy(v_exch_no_str, " ");
    v_contrc_code_no=0;
    v_disp_opor=0;
    v_before_comm_executor=0;
    v_comm_executor=0;
    v_comm_id=0;
    strcpy(v_comm_dir_str, " ");
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_oper_func_code, " ");
    v_init_date=0;
    v_exch_no=0;
    v_contrc_type=0;
    v_comm_date=0;
    v_comm_batch_no=0;
    v_comm_dir=0;
    strcpy(v_comm_status, "0");
    v_comm_opor=0;
    v_disp_date=0;
    v_disp_time=0;
    v_is_withdraw=0;
    v_disp_flag=0;
    strcpy(v_disp_remark, " ");
    v_update_times=1;
    strcpy(v_busi_ctrl_str, " ");
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
    v_begin_date = lpInBizMsg->GetInt32(LDBIZ_BEGIN_DATE_INT);
    v_end_date = lpInBizMsg->GetInt32(LDBIZ_END_DATE_INT);
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_contrc_code_no = lpInBizMsg->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_disp_opor = lpInBizMsg->GetInt32(LDBIZ_DISP_OPOR_INT);
    v_before_comm_executor = lpInBizMsg->GetInt32(LDBIZ_BEFORE_COMM_EXECUTOR_INT);
    v_comm_executor = lpInBizMsg->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    strncpy(v_comm_dir_str, lpInBizMsg->GetString(LDBIZ_COMM_DIR_STR_STR),2048);
    v_comm_dir_str[2048] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //公共子系统检查

    // set @业务控制串# = "111";
    strcpy(v_busi_ctrl_str,"111");
    //调用过程[事务_公共_公共接口_检查系统状态查询权限身份获取操作员权限串]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.37", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.37]subcall timed out!");
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

    //调用过程[事务_交易期货_指令_查询历史指令分发结果集]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.10", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req1->SetInt32(LDBIZ_DISP_OPOR_INT,v_disp_opor);
    lpTSCall1Req1->SetInt32(LDBIZ_BEFORE_COMM_EXECUTOR_INT,v_before_comm_executor);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpTSCall1Req1->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req1->SetString(LDBIZ_COMM_DIR_STR_STR,v_comm_dir_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.10]subcall timed out!");
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

//逻辑_交易期货_指令_查询指令审批结果集
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
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    char v_exch_no_str[2049];
    int v_contrc_code_no;
    int64 v_comm_id;
    int v_comm_opor;
    char v_comm_dir_str[2049];
    int v_comm_appr_oper;
    int64 v_row_id;
    int v_row_count;
    int v_sort_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_oper_func_code[17];
    int v_init_date;
    int v_comm_appr_date;
    int v_comm_appr_time;
    int v_comm_appr_oper_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_futu_acco_no;
    int v_contrc_type;
    int v_comm_date;
    int v_comm_dir;
    double v_comm_qty;
    double v_comm_limit_price;
    double v_limit_actual_price;
    int v_comm_begin_date;
    int v_comm_end_date;
    int v_comm_begin_time;
    int v_comm_end_time;
    char v_comm_appr_status[3];
    char v_comm_appr_remark[256];
    int v_update_times;
    char v_busi_ctrl_str[65];
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
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    strcpy(v_exch_no_str, " ");
    v_contrc_code_no=0;
    v_comm_id=0;
    v_comm_opor=0;
    strcpy(v_comm_dir_str, " ");
    v_comm_appr_oper=0;
    v_row_id=0;
    v_row_count=-1;
    v_sort_type=1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_oper_func_code, " ");
    v_init_date=0;
    v_comm_appr_date=0;
    v_comm_appr_time=0;
    v_comm_appr_oper_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_futu_acco_no=0;
    v_contrc_type=0;
    v_comm_date=0;
    v_comm_dir=0;
    v_comm_qty=0;
    v_comm_limit_price=0;
    v_limit_actual_price=0;
    v_comm_begin_date=0;
    v_comm_end_date=0;
    v_comm_begin_time=0;
    v_comm_end_time=0;
    strcpy(v_comm_appr_status, " ");
    strcpy(v_comm_appr_remark, " ");
    v_update_times=1;
    strcpy(v_busi_ctrl_str, " ");
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_contrc_code_no = lpInBizMsg->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_opor = lpInBizMsg->GetInt32(LDBIZ_COMM_OPOR_INT);
    strncpy(v_comm_dir_str, lpInBizMsg->GetString(LDBIZ_COMM_DIR_STR_STR),2048);
    v_comm_dir_str[2048] = '\0';
    v_comm_appr_oper = lpInBizMsg->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);
    v_sort_type = lpInBizMsg->GetInt32(LDBIZ_SORT_TYPE_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //公共子系统检查

    // set @业务控制串# = "111";
    strcpy(v_busi_ctrl_str,"111");
    //调用过程[事务_公共_公共接口_检查系统状态查询权限身份获取操作员权限串]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.37", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.37]subcall timed out!");
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

    //调用过程[事务_交易期货_指令_查询指令审批结果集]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.11", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req1->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpTSCall1Req1->SetString(LDBIZ_COMM_DIR_STR_STR,v_comm_dir_str);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_APPR_OPER_INT,v_comm_appr_oper);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetInt32(LDBIZ_SORT_TYPE_INT,v_sort_type);
    lpTSCall1Req1->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.11]subcall timed out!");
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

//逻辑_交易期货_指令_查询历史指令审批结果集
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
    int v_begin_date;
    int v_end_date;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    char v_exch_no_str[2049];
    int v_contrc_code_no;
    int64 v_comm_id;
    int v_comm_opor;
    char v_comm_dir_str[2049];
    int v_comm_appr_oper;
    int v_exter_comm_flag;
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_oper_func_code[17];
    int v_init_date;
    int v_comm_appr_date;
    int v_comm_appr_time;
    int v_comm_appr_oper_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_futu_acco_no;
    int v_contrc_type;
    int v_comm_date;
    int v_comm_dir;
    double v_comm_qty;
    double v_comm_limit_price;
    double v_limit_actual_price;
    int v_comm_begin_date;
    int v_comm_end_date;
    int v_comm_begin_time;
    int v_comm_end_time;
    char v_comm_appr_status[3];
    char v_comm_appr_remark[256];
    int v_update_times;
    char v_busi_ctrl_str[65];
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
    v_begin_date=0;
    v_end_date=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    strcpy(v_exch_no_str, " ");
    v_contrc_code_no=0;
    v_comm_id=0;
    v_comm_opor=0;
    strcpy(v_comm_dir_str, " ");
    v_comm_appr_oper=0;
    v_exter_comm_flag=0;
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_oper_func_code, " ");
    v_init_date=0;
    v_comm_appr_date=0;
    v_comm_appr_time=0;
    v_comm_appr_oper_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_futu_acco_no=0;
    v_contrc_type=0;
    v_comm_date=0;
    v_comm_dir=0;
    v_comm_qty=0;
    v_comm_limit_price=0;
    v_limit_actual_price=0;
    v_comm_begin_date=0;
    v_comm_end_date=0;
    v_comm_begin_time=0;
    v_comm_end_time=0;
    strcpy(v_comm_appr_status, " ");
    strcpy(v_comm_appr_remark, " ");
    v_update_times=1;
    strcpy(v_busi_ctrl_str, " ");
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
    v_begin_date = lpInBizMsg->GetInt32(LDBIZ_BEGIN_DATE_INT);
    v_end_date = lpInBizMsg->GetInt32(LDBIZ_END_DATE_INT);
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_contrc_code_no = lpInBizMsg->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_opor = lpInBizMsg->GetInt32(LDBIZ_COMM_OPOR_INT);
    strncpy(v_comm_dir_str, lpInBizMsg->GetString(LDBIZ_COMM_DIR_STR_STR),2048);
    v_comm_dir_str[2048] = '\0';
    v_comm_appr_oper = lpInBizMsg->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
    v_exter_comm_flag = lpInBizMsg->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //公共子系统检查

    // set @业务控制串# = "111";
    strcpy(v_busi_ctrl_str,"111");
    //调用过程[事务_公共_公共接口_检查系统状态查询权限身份获取操作员权限串]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.37", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.37]subcall timed out!");
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

    //调用过程[事务_交易期货_指令_查询历史指令审批结果集]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.12", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req1->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpTSCall1Req1->SetString(LDBIZ_COMM_DIR_STR_STR,v_comm_dir_str);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_APPR_OPER_INT,v_comm_appr_oper);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.12]subcall timed out!");
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

//逻辑_交易期货_指令_查询汇总指令结果集
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
    int v_comm_date;
    int v_comm_batch_no;
    int v_comm_opor;
    int v_comm_executor;
    char v_comm_sum_appr_status_str[65];
    char v_exch_no_str[2049];
    int v_contrc_code_no;
    char v_asset_type_str[2049];
    char v_comm_dir_str[2049];
    char v_comm_sum_status_str[65];
    char v_strike_status_str[65];
    char v_comm_oper_way[3];
    int64 v_row_id;
    int v_row_count;
    int v_sort_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_oper_func_code[17];
    int v_init_date;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_asset_type;
    int v_comm_time;
    int v_comm_dir;
    int v_contrc_dir;
    double v_comm_limit_price;
    double v_limit_actual_price;
    double v_comm_qty;
    double v_comm_amt;
    double v_order_qty;
    double v_comm_cancel_qty;
    double v_strike_amt;
    double v_strike_qty;
    char v_strike_status[3];
    char v_comm_sum_status[3];
    int v_comm_begin_date;
    int v_comm_end_date;
    int v_comm_begin_time;
    int v_comm_end_time;
    int v_comm_comple_date;
    int v_comm_comple_time;
    int v_max_comm_comple_date;
    int v_max_comm_comple_time;
    int v_comm_appr_date;
    int v_comm_appr_time;
    char v_comm_sum_approve_status[3];
    double v_buy_order_qty;
    double v_sell_order_qty;
    double v_buy_comm_qty;
    double v_sell_comm_qty;
    double v_buy_strike_qty;
    double v_sell_strike_qty;
    double v_buy_strike_amt;
    double v_sell_strike_amt;
    double v_buy_comm_amt;
    double v_sell_comm_amt;
    char v_exch_crncy_type[4];
    double v_rece_margin;
    int v_hedge_type;
    int v_update_times;
    char v_busi_ctrl_str[65];
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
    v_comm_date=0;
    v_comm_batch_no=0;
    v_comm_opor=0;
    v_comm_executor=0;
    strcpy(v_comm_sum_appr_status_str, " ");
    strcpy(v_exch_no_str, " ");
    v_contrc_code_no=0;
    strcpy(v_asset_type_str, " ");
    strcpy(v_comm_dir_str, " ");
    strcpy(v_comm_sum_status_str, " ");
    strcpy(v_strike_status_str, " ");
    strcpy(v_comm_oper_way, " ");
    v_row_id=0;
    v_row_count=-1;
    v_sort_type=1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_oper_func_code, " ");
    v_init_date=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_asset_type=0;
    v_comm_time=0;
    v_comm_dir=0;
    v_contrc_dir=0;
    v_comm_limit_price=0;
    v_limit_actual_price=0;
    v_comm_qty=0;
    v_comm_amt=0;
    v_order_qty=0;
    v_comm_cancel_qty=0;
    v_strike_amt=0;
    v_strike_qty=0;
    strcpy(v_strike_status, "0");
    strcpy(v_comm_sum_status, "0");
    v_comm_begin_date=0;
    v_comm_end_date=0;
    v_comm_begin_time=0;
    v_comm_end_time=0;
    v_comm_comple_date=0;
    v_comm_comple_time=0;
    v_max_comm_comple_date=0;
    v_max_comm_comple_time=0;
    v_comm_appr_date=0;
    v_comm_appr_time=0;
    strcpy(v_comm_sum_approve_status, "0");
    v_buy_order_qty=0;
    v_sell_order_qty=0;
    v_buy_comm_qty=0;
    v_sell_comm_qty=0;
    v_buy_strike_qty=0;
    v_sell_strike_qty=0;
    v_buy_strike_amt=0;
    v_sell_strike_amt=0;
    v_buy_comm_amt=0;
    v_sell_comm_amt=0;
    strcpy(v_exch_crncy_type, "CNY");
    v_rece_margin=0;
    v_hedge_type=0;
    v_update_times=1;
    strcpy(v_busi_ctrl_str, " ");
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
    v_comm_date = lpInBizMsg->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_batch_no = lpInBizMsg->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_opor = lpInBizMsg->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_comm_executor = lpInBizMsg->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    strncpy(v_comm_sum_appr_status_str, lpInBizMsg->GetString(LDBIZ_COMM_SUM_APPR_STATUS_STR_STR),64);
    v_comm_sum_appr_status_str[64] = '\0';
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_contrc_code_no = lpInBizMsg->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strncpy(v_asset_type_str, lpInBizMsg->GetString(LDBIZ_ASSET_TYPE_STR_STR),2048);
    v_asset_type_str[2048] = '\0';
    strncpy(v_comm_dir_str, lpInBizMsg->GetString(LDBIZ_COMM_DIR_STR_STR),2048);
    v_comm_dir_str[2048] = '\0';
    strncpy(v_comm_sum_status_str, lpInBizMsg->GetString(LDBIZ_COMM_SUM_STATUS_STR_STR),64);
    v_comm_sum_status_str[64] = '\0';
    strncpy(v_strike_status_str, lpInBizMsg->GetString(LDBIZ_STRIKE_STATUS_STR_STR),64);
    v_strike_status_str[64] = '\0';
    strncpy(v_comm_oper_way, lpInBizMsg->GetString(LDBIZ_COMM_OPER_WAY_STR),2);
    v_comm_oper_way[2] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);
    v_sort_type = lpInBizMsg->GetInt32(LDBIZ_SORT_TYPE_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //公共子系统检查

    // set @业务控制串# = "111";
    strcpy(v_busi_ctrl_str,"111");
    //调用过程[事务_公共_公共接口_检查系统状态查询权限身份获取操作员权限串]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.37", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.37]subcall timed out!");
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

    //调用过程[事务_交易期货_指令_查询汇总指令结果集]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.13", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpTSCall1Req1->SetString(LDBIZ_COMM_SUM_APPR_STATUS_STR_STR,v_comm_sum_appr_status_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_TYPE_STR_STR,v_asset_type_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_DIR_STR_STR,v_comm_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_SUM_STATUS_STR_STR,v_comm_sum_status_str);
    lpTSCall1Req1->SetString(LDBIZ_STRIKE_STATUS_STR_STR,v_strike_status_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetInt32(LDBIZ_SORT_TYPE_INT,v_sort_type);
    lpTSCall1Req1->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.13]subcall timed out!");
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

//逻辑_交易期货_指令_查询历史汇总指令结果集
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
    int v_begin_date;
    int v_end_date;
    int v_comm_date;
    int v_comm_batch_no;
    int v_comm_opor;
    int v_comm_executor;
    char v_comm_sum_appr_status_str[65];
    char v_exch_no_str[2049];
    int v_contrc_code_no;
    char v_asset_type_str[2049];
    char v_comm_dir_str[2049];
    char v_comm_sum_status_str[65];
    char v_strike_status_str[65];
    char v_comm_oper_way[3];
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_oper_func_code[17];
    int v_init_date;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_asset_type;
    int v_comm_time;
    int v_comm_dir;
    int v_contrc_dir;
    double v_comm_limit_price;
    double v_limit_actual_price;
    double v_comm_qty;
    double v_comm_amt;
    double v_order_qty;
    double v_comm_cancel_qty;
    double v_strike_amt;
    double v_strike_qty;
    char v_strike_status[3];
    char v_comm_sum_status[3];
    int v_comm_begin_date;
    int v_comm_end_date;
    int v_comm_begin_time;
    int v_comm_end_time;
    int v_comm_comple_date;
    int v_comm_comple_time;
    int v_max_comm_comple_date;
    int v_max_comm_comple_time;
    int v_comm_appr_date;
    int v_comm_appr_time;
    char v_comm_sum_approve_status[3];
    double v_buy_order_qty;
    double v_sell_order_qty;
    double v_buy_comm_qty;
    double v_sell_comm_qty;
    double v_buy_strike_qty;
    double v_sell_strike_qty;
    double v_buy_strike_amt;
    double v_sell_strike_amt;
    double v_buy_comm_amt;
    double v_sell_comm_amt;
    double v_rece_margin;
    int v_hedge_type;
    int v_update_times;
    char v_busi_ctrl_str[65];
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
    v_begin_date=0;
    v_end_date=0;
    v_comm_date=0;
    v_comm_batch_no=0;
    v_comm_opor=0;
    v_comm_executor=0;
    strcpy(v_comm_sum_appr_status_str, " ");
    strcpy(v_exch_no_str, " ");
    v_contrc_code_no=0;
    strcpy(v_asset_type_str, " ");
    strcpy(v_comm_dir_str, " ");
    strcpy(v_comm_sum_status_str, " ");
    strcpy(v_strike_status_str, " ");
    strcpy(v_comm_oper_way, " ");
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_oper_func_code, " ");
    v_init_date=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_asset_type=0;
    v_comm_time=0;
    v_comm_dir=0;
    v_contrc_dir=0;
    v_comm_limit_price=0;
    v_limit_actual_price=0;
    v_comm_qty=0;
    v_comm_amt=0;
    v_order_qty=0;
    v_comm_cancel_qty=0;
    v_strike_amt=0;
    v_strike_qty=0;
    strcpy(v_strike_status, "0");
    strcpy(v_comm_sum_status, "0");
    v_comm_begin_date=0;
    v_comm_end_date=0;
    v_comm_begin_time=0;
    v_comm_end_time=0;
    v_comm_comple_date=0;
    v_comm_comple_time=0;
    v_max_comm_comple_date=0;
    v_max_comm_comple_time=0;
    v_comm_appr_date=0;
    v_comm_appr_time=0;
    strcpy(v_comm_sum_approve_status, "0");
    v_buy_order_qty=0;
    v_sell_order_qty=0;
    v_buy_comm_qty=0;
    v_sell_comm_qty=0;
    v_buy_strike_qty=0;
    v_sell_strike_qty=0;
    v_buy_strike_amt=0;
    v_sell_strike_amt=0;
    v_buy_comm_amt=0;
    v_sell_comm_amt=0;
    v_rece_margin=0;
    v_hedge_type=0;
    v_update_times=1;
    strcpy(v_busi_ctrl_str, " ");
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
    v_begin_date = lpInBizMsg->GetInt32(LDBIZ_BEGIN_DATE_INT);
    v_end_date = lpInBizMsg->GetInt32(LDBIZ_END_DATE_INT);
    v_comm_date = lpInBizMsg->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_batch_no = lpInBizMsg->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_opor = lpInBizMsg->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_comm_executor = lpInBizMsg->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    strncpy(v_comm_sum_appr_status_str, lpInBizMsg->GetString(LDBIZ_COMM_SUM_APPR_STATUS_STR_STR),64);
    v_comm_sum_appr_status_str[64] = '\0';
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_contrc_code_no = lpInBizMsg->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strncpy(v_asset_type_str, lpInBizMsg->GetString(LDBIZ_ASSET_TYPE_STR_STR),2048);
    v_asset_type_str[2048] = '\0';
    strncpy(v_comm_dir_str, lpInBizMsg->GetString(LDBIZ_COMM_DIR_STR_STR),2048);
    v_comm_dir_str[2048] = '\0';
    strncpy(v_comm_sum_status_str, lpInBizMsg->GetString(LDBIZ_COMM_SUM_STATUS_STR_STR),64);
    v_comm_sum_status_str[64] = '\0';
    strncpy(v_strike_status_str, lpInBizMsg->GetString(LDBIZ_STRIKE_STATUS_STR_STR),64);
    v_strike_status_str[64] = '\0';
    strncpy(v_comm_oper_way, lpInBizMsg->GetString(LDBIZ_COMM_OPER_WAY_STR),2);
    v_comm_oper_way[2] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //公共子系统检查

    // set @业务控制串# = "111";
    strcpy(v_busi_ctrl_str,"111");
    //调用过程[事务_公共_公共接口_检查系统状态查询权限身份获取操作员权限串]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.37", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.37]subcall timed out!");
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

    //调用过程[事务_交易期货_指令_查询历史汇总指令结果集]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.14", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpTSCall1Req1->SetString(LDBIZ_COMM_SUM_APPR_STATUS_STR_STR,v_comm_sum_appr_status_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_TYPE_STR_STR,v_asset_type_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_DIR_STR_STR,v_comm_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_SUM_STATUS_STR_STR,v_comm_sum_status_str);
    lpTSCall1Req1->SetString(LDBIZ_STRIKE_STATUS_STR_STR,v_strike_status_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.14]subcall timed out!");
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

