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
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.5.1");
        bizFuncInfo->lpFunc = fnFunc0;
    }
    else if (iFunIndex==1)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.5.11");
        bizFuncInfo->lpFunc = fnFunc1;
    }
    else if (iFunIndex==2)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.5.21");
        bizFuncInfo->lpFunc = fnFunc2;
    }
    else if (iFunIndex==3)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.5.31");
        bizFuncInfo->lpFunc = fnFunc3;
    }
    else if (iFunIndex==4)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.5.101");
        bizFuncInfo->lpFunc = fnFunc4;
    }
    else if (iFunIndex==5)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.5.121");
        bizFuncInfo->lpFunc = fnFunc5;
    }
    else if (iFunIndex==6)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.5.122");
        bizFuncInfo->lpFunc = fnFunc6;
    }
    else if (iFunIndex==7)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.5.123");
        bizFuncInfo->lpFunc = fnFunc7;
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

//逻辑_交易期货_报盘_处理订单回报
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
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    int v_exch_no;
    char v_out_acco[33];
    char v_futu_acco[17];
    char v_contrc_code[7];
    int v_contrc_type;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int64 v_order_id;
    double v_order_price;
    double v_order_qty;
    int v_order_dir;
    int v_contrc_dir;
    int v_hedge_type;
    char v_rsp_info[256];
    char v_rsp_status[3];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_order_status[3];
    int v_order_batch_no;
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_co_no;
    char v_exch_crncy_type[4];
    char v_crncy_type[4];
    int v_futu_acco_no;
    int v_contrc_code_no;
    int v_contrc_unit;
    int v_order_date;
    int v_order_time;
    double v_wtdraw_qty;
    double v_strike_qty;
    double v_trade_commis;
    double v_other_commis;
    char v_comb_code[7];
    double v_rece_margin;
    int v_lngsht_type;
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
    char v_order_rsp_status[3];
    int64 v_external_no;
    int v_asset_type;
    int v_calc_dir;
    double v_occur_qty;
    double v_occur_amt;
    int64 v_comm_id;
    int v_comm_batch_no;
    double v_comm_limit_price;
    double v_strike_price;
    double v_strike_amt;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_trade_fee;
    double v_strike_fee;
    double v_all_fee;
    double v_trade_capt_amt;
    double v_posi_capt_amt;
    double v_margin_ratio;
    double v_comm_margin;
    int64 v_compli_trig_id;
    char v_order_oper_way[3];
    int v_busi_opor_no;
    int v_update_times;
    int64 v_row_id;
    int v_comm_date;
    int v_comm_time;
    int v_comm_opor;
    int v_comm_executor;
    int v_comm_dir;
    double v_limit_actual_price;
    double v_comm_qty;
    double v_comm_amt;
    double v_comm_cancel_qty;
    double v_comm_frozen_amt;
    double v_comm_frozen_qty;
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
    char v_comm_oper_way[3];
    char v_remark_info[256];
    int v_comm_comple_flag;
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
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    v_exch_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_futu_acco, " ");
    strcpy(v_contrc_code, " ");
    v_contrc_type=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_id=0;
    v_order_price=0;
    v_order_qty=0;
    v_order_dir=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    strcpy(v_rsp_info, " ");
    strcpy(v_rsp_status, "0");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_order_status, "0");
    v_order_batch_no=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_co_no=0;
    strcpy(v_exch_crncy_type, "CNY");
    strcpy(v_crncy_type, "CNY");
    v_futu_acco_no=0;
    v_contrc_code_no=0;
    v_contrc_unit=0;
    v_order_date=0;
    v_order_time=0;
    v_wtdraw_qty=0;
    v_strike_qty=0;
    v_trade_commis=0;
    v_other_commis=0;
    strcpy(v_comb_code, " ");
    v_rece_margin=0;
    v_lngsht_type=0;
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
    strcpy(v_order_rsp_status, "0");
    v_external_no=0;
    v_asset_type=0;
    v_calc_dir=1;
    v_occur_qty=0;
    v_occur_amt=0;
    v_comm_id=0;
    v_comm_batch_no=0;
    v_comm_limit_price=0;
    v_strike_price=0;
    v_strike_amt=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_trade_fee=0;
    v_strike_fee=0;
    v_all_fee=0;
    v_trade_capt_amt=0;
    v_posi_capt_amt=0;
    v_margin_ratio=0;
    v_comm_margin=0;
    v_compli_trig_id=0;
    strcpy(v_order_oper_way, " ");
    v_busi_opor_no=0;
    v_update_times=1;
    v_row_id=0;
    v_comm_date=0;
    v_comm_time=0;
    v_comm_opor=0;
    v_comm_executor=0;
    v_comm_dir=0;
    v_limit_actual_price=0;
    v_comm_qty=0;
    v_comm_amt=0;
    v_comm_cancel_qty=0;
    v_comm_frozen_amt=0;
    v_comm_frozen_qty=0;
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
    strcpy(v_comm_oper_way, " ");
    strcpy(v_remark_info, " ");
    v_comm_comple_flag=0;
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
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    strncpy(v_out_acco, lpInBizMsg->GetString(LDBIZ_OUT_ACCO_STR),32);
    v_out_acco[32] = '\0';
    strncpy(v_futu_acco, lpInBizMsg->GetString(LDBIZ_FUTU_ACCO_STR),16);
    v_futu_acco[16] = '\0';
    strncpy(v_contrc_code, lpInBizMsg->GetString(LDBIZ_CONTRC_CODE_STR),6);
    v_contrc_code[6] = '\0';
    v_contrc_type = lpInBizMsg->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_report_date = lpInBizMsg->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpInBizMsg->GetInt32(LDBIZ_REPORT_TIME_INT);
    strncpy(v_report_no, lpInBizMsg->GetString(LDBIZ_REPORT_NO_STR),32);
    v_report_no[32] = '\0';
    v_order_id = lpInBizMsg->GetInt64(LDBIZ_ORDER_ID_INT64);
    v_order_price = lpInBizMsg->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpInBizMsg->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_dir = lpInBizMsg->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_contrc_dir = lpInBizMsg->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpInBizMsg->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    strncpy(v_rsp_info, lpInBizMsg->GetString(LDBIZ_RSP_INFO_STR),255);
    v_rsp_info[255] = '\0';
    strncpy(v_rsp_status, lpInBizMsg->GetString(LDBIZ_RSP_STATUS_STR),2);
    v_rsp_status[2] = '\0';

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


    // set @机构编号#=@操作员机构编号#;
    v_co_no=v_opor_co_no;

    // set @交易币种#="CNY";
    strcpy(v_exch_crncy_type,"CNY");
    //调用过程[事务_交易期货_报盘_获取订单信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.5.130", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.5.130]subcall timed out!");
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
    v_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strcpy(v_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_CRNCY_TYPE_STR));
    v_futu_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    strcpy(v_futu_acco, lpTSCall1Ans1->GetString(LDBIZ_FUTU_ACCO_STR));
    v_contrc_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strcpy(v_contrc_code, lpTSCall1Ans1->GetString(LDBIZ_CONTRC_CODE_STR));
    v_contrc_type = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_unit = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_UNIT_INT);
    v_contrc_dir = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpTSCall1Ans1->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_order_date = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_order_time = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_order_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_dir = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_order_price = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans1->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_trade_commis = lpTSCall1Ans1->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_other_commis = lpTSCall1Ans1->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    strcpy(v_comb_code, lpTSCall1Ans1->GetString(LDBIZ_COMB_CODE_STR));
    v_rece_margin = lpTSCall1Ans1->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);

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

    //公共子系统检查
    //调用过程[事务_公共_交易接口_检查期货回报业务控制]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.25.230", 0);
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
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.230]subcall timed out!");
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
    v_init_date = lpTSCall1Ans3->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_crncy_type, lpTSCall1Ans3->GetString(LDBIZ_CRNCY_TYPE_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans3->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_contrc_code_no = lpTSCall1Ans3->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_contrc_type = lpTSCall1Ans3->GetInt32(LDBIZ_CONTRC_TYPE_INT);

    //set @业务控制串// = "11111";
    //[事务_公共_公共接口_检查系统状态权限身份获取操作员权限串]
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


    // set @昨结算价#=0;
    v_pre_settle_price=0;
    //处理订单回报

    // set @订单回报状态#=@回报状态#;
    strcpy(v_order_rsp_status,v_rsp_status);
    //调用过程[事务_交易期货_报盘_处理订单回报]
    //组织事务请求
    if(lpTSCall1Ans5)
    {
      lpTSCall1Ans5->FreeMsg();
      lpTSCall1Ans5=NULL;
    }
    lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("tdfutuT.5.1", 0);
    lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req5->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req5->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req5->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req5->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req5->SetString(LDBIZ_FUTU_ACCO_STR,v_futu_acco);
    lpTSCall1Req5->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpTSCall1Req5->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req5->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req5->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req5->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req5->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpTSCall1Req5->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpTSCall1Req5->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
    lpTSCall1Req5->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpTSCall1Req5->SetString(LDBIZ_RSP_INFO_STR,v_rsp_info);
    lpTSCall1Req5->SetString(LDBIZ_ORDER_RSP_STATUS_STR,v_order_rsp_status);
    lpTSCall1Req5->SetString(LDBIZ_RSP_STATUS_STR,v_rsp_status);
    lpTSCall1Req5->SetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT,v_exgp_avail_qty);
    lpTSCall1Req5->SetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT,v_asac_avail_qty);
    lpTSCall1Req5->SetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT,v_exgp_long_rece_margin);
    lpTSCall1Req5->SetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT,v_exgp_short_rece_margin);
    lpTSCall1Req5->SetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT,v_asac_long_rece_margin);
    lpTSCall1Req5->SetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT,v_asac_short_rece_margin);
    glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
    if(!lpTSCall1Ans5)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.5.1]subcall timed out!");
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
    v_futu_acco_no = lpTSCall1Ans5->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    v_contrc_code_no = lpTSCall1Ans5->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_external_no = lpTSCall1Ans5->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_asset_type = lpTSCall1Ans5->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_contrc_type = lpTSCall1Ans5->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_unit = lpTSCall1Ans5->GetInt32(LDBIZ_CONTRC_UNIT_INT);
    v_calc_dir = lpTSCall1Ans5->GetInt32(LDBIZ_CALC_DIR_INT);
    v_occur_qty = lpTSCall1Ans5->GetDouble(LDBIZ_OCCUR_QTY_FLOAT);
    v_occur_amt = lpTSCall1Ans5->GetDouble(LDBIZ_OCCUR_AMT_FLOAT);
    v_comm_id = lpTSCall1Ans5->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_limit_price = lpTSCall1Ans5->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
    strcpy(v_crncy_type, lpTSCall1Ans5->GetString(LDBIZ_CRNCY_TYPE_STR));
    v_hedge_type = lpTSCall1Ans5->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_order_batch_no = lpTSCall1Ans5->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_order_date = lpTSCall1Ans5->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_order_time = lpTSCall1Ans5->GetInt32(LDBIZ_ORDER_TIME_INT);
    strcpy(v_order_status, lpTSCall1Ans5->GetString(LDBIZ_ORDER_STATUS_STR));
    v_order_price = lpTSCall1Ans5->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans5->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans5->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_price = lpTSCall1Ans5->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
    v_strike_amt = lpTSCall1Ans5->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_report_fee = lpTSCall1Ans5->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
    v_wtdraw_fee = lpTSCall1Ans5->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
    v_trade_fee = lpTSCall1Ans5->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
    v_strike_fee = lpTSCall1Ans5->GetDouble(LDBIZ_STRIKE_FEE_FLOAT);
    v_all_fee = lpTSCall1Ans5->GetDouble(LDBIZ_ALL_FEE_FLOAT);
    v_trade_commis = lpTSCall1Ans5->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_other_commis = lpTSCall1Ans5->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    v_trade_capt_amt = lpTSCall1Ans5->GetDouble(LDBIZ_TRADE_CAPT_AMT_FLOAT);
    v_posi_capt_amt = lpTSCall1Ans5->GetDouble(LDBIZ_POSI_CAPT_AMT_FLOAT);
    strcpy(v_comb_code, lpTSCall1Ans5->GetString(LDBIZ_COMB_CODE_STR));
    v_rece_margin = lpTSCall1Ans5->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_margin_ratio = lpTSCall1Ans5->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);
    v_comm_margin = lpTSCall1Ans5->GetDouble(LDBIZ_COMM_MARGIN_FLOAT);
    v_compli_trig_id = lpTSCall1Ans5->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);
    strcpy(v_order_oper_way, lpTSCall1Ans5->GetString(LDBIZ_ORDER_OPER_WAY_STR));
    v_busi_opor_no = lpTSCall1Ans5->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_update_times = lpTSCall1Ans5->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // set @记录序号#=@订单序号#;
    v_row_id=v_order_id;

    // set @操作员编号#=@业务操作员编号#;
    v_opor_no=v_busi_opor_no;

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

    //指令主推

    // if @指令序号# > 0 then
    if (v_comm_id > 0)
    {
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

    // end if;
    }

    //正常状态,资金更新
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


    // if @回报状态# <> 《回报状态-成功》 then
    if (strcmp(v_rsp_status , "1")!=0)
    {
      //废单.资金持仓回退
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

    // end if;
    }


    // if @指令批号# > 0  then
    if (v_comm_batch_no > 0 )
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

    //订单汇总主推

    // if @订单批号#>0 then
    if (v_order_batch_no>0)
    {
        //调用过程[事务_交易期货_交易_获取订单汇总]
        //组织事务请求
        if(lpTSCall1Ans10)
        {
          lpTSCall1Ans10->FreeMsg();
          lpTSCall1Ans10=NULL;
        }
        lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.19", 0);
        lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req10->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpTSCall1Req10->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
        lpTSCall1Req10->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
        if(!lpTSCall1Ans10)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.19]subcall timed out!");
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
        strcpy(v_oper_func_code, lpTSCall1Ans10->GetString(LDBIZ_OPER_FUNC_CODE_STR));
        v_init_date = lpTSCall1Ans10->GetInt32(LDBIZ_INIT_DATE_INT);
        v_pd_no = lpTSCall1Ans10->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans10->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans10->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans10->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_crncy_type, lpTSCall1Ans10->GetString(LDBIZ_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans10->GetInt32(LDBIZ_EXCH_NO_INT);
        v_contrc_code_no = lpTSCall1Ans10->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans10->GetString(LDBIZ_CONTRC_CODE_STR));
        v_asset_type = lpTSCall1Ans10->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_type = lpTSCall1Ans10->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_contrc_unit = lpTSCall1Ans10->GetInt32(LDBIZ_CONTRC_UNIT_INT);
        v_external_no = lpTSCall1Ans10->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
        v_order_dir = lpTSCall1Ans10->GetInt32(LDBIZ_ORDER_DIR_INT);
        v_contrc_dir = lpTSCall1Ans10->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans10->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_order_price = lpTSCall1Ans10->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        strcpy(v_order_sum_status, lpTSCall1Ans10->GetString(LDBIZ_ORDER_SUM_STATUS_STR));
        v_wtdraw_qty = lpTSCall1Ans10->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
        v_waste_qty = lpTSCall1Ans10->GetDouble(LDBIZ_WASTE_QTY_FLOAT);
        v_strike_qty = lpTSCall1Ans10->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_strike_aver_price = lpTSCall1Ans10->GetDouble(LDBIZ_STRIKE_AVER_PRICE_FLOAT);
        v_strike_amt = lpTSCall1Ans10->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_trade_fee = lpTSCall1Ans10->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
        v_trade_commis = lpTSCall1Ans10->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_other_commis = lpTSCall1Ans10->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_strike_commis = lpTSCall1Ans10->GetDouble(LDBIZ_STRIKE_COMMIS_FLOAT);
        v_strike_other_commis = lpTSCall1Ans10->GetDouble(LDBIZ_STRIKE_OTHER_COMMIS_FLOAT);
        v_report_fee = lpTSCall1Ans10->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
        v_wtdraw_fee = lpTSCall1Ans10->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
        v_strike_all_fee = lpTSCall1Ans10->GetDouble(LDBIZ_STRIKE_ALL_FEE_FLOAT);
        v_rece_margin = lpTSCall1Ans10->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_order_oper_way, lpTSCall1Ans10->GetString(LDBIZ_ORDER_OPER_WAY_STR));
        v_update_times = lpTSCall1Ans10->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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
    lpOutBizMsg->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
    lpOutBizMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpOutBizMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpOutBizMsg->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpOutBizMsg->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
    lpOutBizMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpOutBizMsg->SetString(LDBIZ_RSP_INFO_STR,v_rsp_info);
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

//逻辑_交易期货_报盘_处理撤单回报
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
    int v_pass_no;
    char v_out_acco[33];
    int64 v_order_id;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    double v_wtdraw_qty;
    char v_rsp_status[3];
    char v_rsp_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_exch_group_no;
    int64 v_external_no;
    char v_order_status[3];
    int v_wtdraw_date;
    int v_wtdraw_time;
    char v_wtdraw_status[3];
    int v_tmp_opor_no;
    int v_tmp_co_no;
    double v_tmp_wtdraw_qty;
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_co_no;
    int v_pd_no;
    int v_asset_acco_no;
    char v_crncy_type[4];
    int v_futu_acco_no;
    char v_futu_acco[17];
    int v_contrc_code_no;
    char v_contrc_code[7];
    int v_contrc_type;
    int v_contrc_unit;
    int v_contrc_dir;
    int v_hedge_type;
    int v_order_date;
    int v_order_time;
    double v_order_qty;
    int v_order_dir;
    double v_order_price;
    double v_strike_qty;
    double v_trade_commis;
    double v_other_commis;
    char v_comb_code[7];
    double v_rece_margin;
    char v_order_oper_way[3];
    int v_busi_opor_no;
    char v_mac_addr[33];
    char v_ip_addr[33];
    char v_last_oper_info[256];
    int v_order_batch_no;
    double v_tmp_order_qty;
    int v_tmp_exch_group_no;
    int v_tmp_asset_acco_no;
    int v_tmp_contrc_code_no;
    int v_lngsht_type;
    char v_exch_crncy_type[4];
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
    int v_asset_type;
    double v_order_frozen_amt;
    char v_wtdraw_remark[256];
    int v_calc_dir;
    int64 v_comm_id;
    int v_comm_batch_no;
    double v_comm_limit_price;
    double v_occur_qty;
    double v_occur_amt;
    double v_strike_price;
    double v_strike_amt;
    double v_strike_fee;
    double v_trade_fee;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_trade_capt_amt;
    double v_posi_capt_amt;
    double v_margin_ratio;
    double v_comm_margin;
    int64 v_compli_trig_id;
    int v_update_times;
    int64 v_row_id;
    int v_comm_date;
    int v_comm_time;
    int v_comm_opor;
    int v_comm_executor;
    int v_comm_dir;
    double v_limit_actual_price;
    double v_comm_qty;
    double v_comm_amt;
    double v_comm_cancel_qty;
    double v_comm_frozen_amt;
    double v_comm_frozen_qty;
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
    char v_comm_oper_way[3];
    char v_remark_info[256];
    int v_comm_comple_flag;
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
    char v_oper_func_code[17];
    char v_order_sum_status[3];
    double v_waste_qty;
    double v_strike_aver_price;
    double v_strike_commis;
    double v_strike_other_commis;
    double v_strike_all_fee;
    int64 v_modi_order_id;
    int v_modi_order_date;
    int v_modi_order_time;
    int v_modi_batch_no;
    double v_modi_order_price;
    double v_modi_order_qty;
    int v_modi_price_type;
    int v_price_type;
    char v_exgp_busi_config_str[65];
    char v_busi_config_str[65];
    char v_busi_ctrl_str[65];
    char v_co_no_rights_str[2049];
    char v_pd_no_rights_str[2049];
    char v_exch_group_no_rights_str[2049];
    char v_asac_busi_config_str[65];
    char v_split_fee_typr_str[65];
    char v_busi_limit_str[2049];
    double v_nav_asset;
    double v_deli_fee;
    double v_other_fee;
    double v_all_fee;
    int v_margin_pref;
    double v_up_limit_price;
    double v_down_limit_price;
    double v_last_price;
    int v_trig_stage_type;
    char v_modi_order_status[3];
    int64 v_new_order_id;
    char v_new_order_status[3];
    double v_curr_strike_price;
    double v_curr_strike_amt;
    double v_curr_strike_qty;
    int64 v_strike_id;
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
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_order_id=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_wtdraw_qty=0;
    strcpy(v_rsp_status, "0");
    strcpy(v_rsp_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_exch_group_no=0;
    v_external_no=0;
    strcpy(v_order_status, "0");
    v_wtdraw_date=0;
    v_wtdraw_time=0;
    strcpy(v_wtdraw_status, "0");
    v_tmp_opor_no=0;
    v_tmp_co_no=0;
    v_tmp_wtdraw_qty=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_co_no=0;
    v_pd_no=0;
    v_asset_acco_no=0;
    strcpy(v_crncy_type, "CNY");
    v_futu_acco_no=0;
    strcpy(v_futu_acco, " ");
    v_contrc_code_no=0;
    strcpy(v_contrc_code, " ");
    v_contrc_type=0;
    v_contrc_unit=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    v_order_date=0;
    v_order_time=0;
    v_order_qty=0;
    v_order_dir=0;
    v_order_price=0;
    v_strike_qty=0;
    v_trade_commis=0;
    v_other_commis=0;
    strcpy(v_comb_code, " ");
    v_rece_margin=0;
    strcpy(v_order_oper_way, " ");
    v_busi_opor_no=0;
    strcpy(v_mac_addr, " ");
    strcpy(v_ip_addr, " ");
    strcpy(v_last_oper_info, " ");
    v_order_batch_no=0;
    v_tmp_order_qty=0;
    v_tmp_exch_group_no=0;
    v_tmp_asset_acco_no=0;
    v_tmp_contrc_code_no=0;
    v_lngsht_type=0;
    strcpy(v_exch_crncy_type, "CNY");
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
    v_asset_type=0;
    v_order_frozen_amt=0;
    strcpy(v_wtdraw_remark, " ");
    v_calc_dir=1;
    v_comm_id=0;
    v_comm_batch_no=0;
    v_comm_limit_price=0;
    v_occur_qty=0;
    v_occur_amt=0;
    v_strike_price=0;
    v_strike_amt=0;
    v_strike_fee=0;
    v_trade_fee=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_trade_capt_amt=0;
    v_posi_capt_amt=0;
    v_margin_ratio=0;
    v_comm_margin=0;
    v_compli_trig_id=0;
    v_update_times=1;
    v_row_id=0;
    v_comm_date=0;
    v_comm_time=0;
    v_comm_opor=0;
    v_comm_executor=0;
    v_comm_dir=0;
    v_limit_actual_price=0;
    v_comm_qty=0;
    v_comm_amt=0;
    v_comm_cancel_qty=0;
    v_comm_frozen_amt=0;
    v_comm_frozen_qty=0;
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
    strcpy(v_comm_oper_way, " ");
    strcpy(v_remark_info, " ");
    v_comm_comple_flag=0;
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
    strcpy(v_oper_func_code, " ");
    strcpy(v_order_sum_status, "0");
    v_waste_qty=0;
    v_strike_aver_price=0;
    v_strike_commis=0;
    v_strike_other_commis=0;
    v_strike_all_fee=0;
    v_modi_order_id=0;
    v_modi_order_date=0;
    v_modi_order_time=0;
    v_modi_batch_no=0;
    v_modi_order_price=0;
    v_modi_order_qty=0;
    v_modi_price_type=0;
    v_price_type=0;
    strcpy(v_exgp_busi_config_str, " ");
    strcpy(v_busi_config_str, " ");
    strcpy(v_busi_ctrl_str, " ");
    strcpy(v_co_no_rights_str, " ");
    strcpy(v_pd_no_rights_str, " ");
    strcpy(v_exch_group_no_rights_str, " ");
    strcpy(v_asac_busi_config_str, " ");
    strcpy(v_split_fee_typr_str, " ");
    strcpy(v_busi_limit_str, " ");
    v_nav_asset=0;
    v_deli_fee=0;
    v_other_fee=0;
    v_all_fee=0;
    v_margin_pref=0;
    v_up_limit_price=0;
    v_down_limit_price=0;
    v_last_price=0;
    v_trig_stage_type=0;
    strcpy(v_modi_order_status, " ");
    v_new_order_id=0;
    strcpy(v_new_order_status, "0");
    v_curr_strike_price=0;
    v_curr_strike_amt=0;
    v_curr_strike_qty=0;
    v_strike_id=0;
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
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    strncpy(v_out_acco, lpInBizMsg->GetString(LDBIZ_OUT_ACCO_STR),32);
    v_out_acco[32] = '\0';
    v_order_id = lpInBizMsg->GetInt64(LDBIZ_ORDER_ID_INT64);
    v_report_date = lpInBizMsg->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpInBizMsg->GetInt32(LDBIZ_REPORT_TIME_INT);
    strncpy(v_report_no, lpInBizMsg->GetString(LDBIZ_REPORT_NO_STR),32);
    v_report_no[32] = '\0';
    v_wtdraw_qty = lpInBizMsg->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    strncpy(v_rsp_status, lpInBizMsg->GetString(LDBIZ_RSP_STATUS_STR),2);
    v_rsp_status[2] = '\0';
    strncpy(v_rsp_info, lpInBizMsg->GetString(LDBIZ_RSP_INFO_STR),255);
    v_rsp_info[255] = '\0';

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
    IFastMessage* lpTSCall1Req19 = NULL;
    IFastMessage* lpTSCall1Ans19 = NULL;
    IFastMessage* lpTSCall1Req20 = NULL;
    IFastMessage* lpTSCall1Ans20 = NULL;
    IFastMessage* lpTSCall1Req21 = NULL;
    IFastMessage* lpTSCall1Ans21 = NULL;
    IFastMessage* lpTSCall1Req22 = NULL;
    IFastMessage* lpTSCall1Ans22 = NULL;
    IFastMessage* lpTSCall1Req23 = NULL;
    IFastMessage* lpTSCall1Ans23 = NULL;
    IFastMessage* lpTSCall1Req24 = NULL;
    IFastMessage* lpTSCall1Ans24 = NULL;
    IFastMessage* lpTSCall1Req25 = NULL;
    IFastMessage* lpTSCall1Ans25 = NULL;


    // set @临时_操作员编号# = @操作员编号#;
    v_tmp_opor_no = v_opor_no;

    // set @临时_机构编号# = @操作员机构编号#;
    v_tmp_co_no = v_opor_co_no;

    // set @临时_撤单数量#=@撤单数量#;
    v_tmp_wtdraw_qty=v_wtdraw_qty;
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

    //调用过程[事务_交易期货_交易_获取回报订单信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.72", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req1->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpTSCall1Req1->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.72]subcall timed out!");
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
    v_order_id = lpTSCall1Ans1->GetInt64(LDBIZ_ORDER_ID_INT64);
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strcpy(v_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_CRNCY_TYPE_STR));
    v_futu_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    strcpy(v_futu_acco, lpTSCall1Ans1->GetString(LDBIZ_FUTU_ACCO_STR));
    v_contrc_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strcpy(v_contrc_code, lpTSCall1Ans1->GetString(LDBIZ_CONTRC_CODE_STR));
    v_contrc_type = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_unit = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_UNIT_INT);
    v_contrc_dir = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpTSCall1Ans1->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_order_date = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_order_time = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_order_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_dir = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_order_price = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans1->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_trade_commis = lpTSCall1Ans1->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_other_commis = lpTSCall1Ans1->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    strcpy(v_comb_code, lpTSCall1Ans1->GetString(LDBIZ_COMB_CODE_STR));
    v_rece_margin = lpTSCall1Ans1->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    strcpy(v_order_oper_way, lpTSCall1Ans1->GetString(LDBIZ_ORDER_OPER_WAY_STR));
    v_busi_opor_no = lpTSCall1Ans1->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    strcpy(v_mac_addr, lpTSCall1Ans1->GetString(LDBIZ_MAC_ADDR_STR));
    strcpy(v_ip_addr, lpTSCall1Ans1->GetString(LDBIZ_IP_ADDR_STR));
    strcpy(v_last_oper_info, lpTSCall1Ans1->GetString(LDBIZ_LAST_OPER_INFO_STR));
    v_order_batch_no = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);


    // set @临时_订单数量# = @订单数量#;
    v_tmp_order_qty = v_order_qty;

    // set @操作员编号# =@业务操作员编号#;
    v_opor_no =v_busi_opor_no;

    // set @操作员机构编号# =@机构编号#;
    v_opor_co_no =v_co_no;

    // set @临时_交易组编号# =@交易组编号#;
    v_tmp_exch_group_no =v_exch_group_no;

    // set @临时_资产账户编号# = @资产账户编号#;
    v_tmp_asset_acco_no = v_asset_acco_no;

    // set @临时_合约代码编号# = @合约代码编号#;
    v_tmp_contrc_code_no = v_contrc_code_no;
    //根据订单方向和开平方向确定多空类型

    // if @开平方向# = 《开平方向-开仓》 then
    if (v_contrc_dir == 1)
    {

      // set @多空类型# = @订单方向#;
      v_lngsht_type = v_order_dir;
    }
    // else
    else
    {


      // if @订单方向# = 《订单方向-买入》 then
      if (v_order_dir == 1)
      {

        // set @多空类型# = 《多空类型-空头》;
        v_lngsht_type = 2;
      }
      // else
      else
      {


        // set @多空类型# = 《多空类型-多头》;
        v_lngsht_type = 1;
      // end if;
      }

    // end if;
    }

    //公共子系统检查
    //调用过程[事务_公共_交易接口_检查期货回报业务控制]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.25.230", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.230]subcall timed out!");
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
    strcpy(v_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_CRNCY_TYPE_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_contrc_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_contrc_type = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_TYPE_INT);

    //从产品期货的持仓表中获得交易组可用数量和资产账户可用数量
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


    // set @昨结算价#=0;
    v_pre_settle_price=0;
    //处理撤单回报

    // set @撤单数量#=@临时_撤单数量#;
    v_wtdraw_qty=v_tmp_wtdraw_qty;
    //调用过程[事务_交易期货_报盘_处理撤单回报]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("tdfutuT.5.11", 0);
    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req4->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req4->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req4->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req4->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req4->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req4->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpTSCall1Req4->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req4->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req4->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
    lpTSCall1Req4->SetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT,v_exgp_avail_qty);
    lpTSCall1Req4->SetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT,v_asac_avail_qty);
    lpTSCall1Req4->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpTSCall1Req4->SetString(LDBIZ_RSP_STATUS_STR,v_rsp_status);
    lpTSCall1Req4->SetString(LDBIZ_RSP_INFO_STR,v_rsp_info);
    lpTSCall1Req4->SetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT,v_exgp_long_rece_margin);
    lpTSCall1Req4->SetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT,v_exgp_short_rece_margin);
    lpTSCall1Req4->SetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT,v_asac_long_rece_margin);
    lpTSCall1Req4->SetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT,v_asac_short_rece_margin);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.5.11]subcall timed out!");
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
    v_co_no = lpTSCall1Ans4->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans4->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans4->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_futu_acco_no = lpTSCall1Ans4->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    v_contrc_code_no = lpTSCall1Ans4->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_external_no = lpTSCall1Ans4->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_asset_type = lpTSCall1Ans4->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_contrc_type = lpTSCall1Ans4->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_unit = lpTSCall1Ans4->GetInt32(LDBIZ_CONTRC_UNIT_INT);
    strcpy(v_crncy_type, lpTSCall1Ans4->GetString(LDBIZ_CRNCY_TYPE_STR));
    v_report_time = lpTSCall1Ans4->GetInt32(LDBIZ_REPORT_TIME_INT);
    strcpy(v_order_status, lpTSCall1Ans4->GetString(LDBIZ_ORDER_STATUS_STR));
    v_order_batch_no = lpTSCall1Ans4->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_order_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_price = lpTSCall1Ans4->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_frozen_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
    strcpy(v_wtdraw_status, lpTSCall1Ans4->GetString(LDBIZ_WTDRAW_STATUS_STR));
    v_wtdraw_date = lpTSCall1Ans4->GetInt32(LDBIZ_WTDRAW_DATE_INT);
    v_wtdraw_time = lpTSCall1Ans4->GetInt32(LDBIZ_WTDRAW_TIME_INT);
    strcpy(v_wtdraw_remark, lpTSCall1Ans4->GetString(LDBIZ_WTDRAW_REMARK_STR));
    v_calc_dir = lpTSCall1Ans4->GetInt32(LDBIZ_CALC_DIR_INT);
    v_comm_id = lpTSCall1Ans4->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_limit_price = lpTSCall1Ans4->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
    v_occur_qty = lpTSCall1Ans4->GetDouble(LDBIZ_OCCUR_QTY_FLOAT);
    v_occur_amt = lpTSCall1Ans4->GetDouble(LDBIZ_OCCUR_AMT_FLOAT);
    v_strike_qty = lpTSCall1Ans4->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_price = lpTSCall1Ans4->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
    v_strike_amt = lpTSCall1Ans4->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_fee = lpTSCall1Ans4->GetDouble(LDBIZ_STRIKE_FEE_FLOAT);
    v_trade_fee = lpTSCall1Ans4->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
    v_report_fee = lpTSCall1Ans4->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
    v_wtdraw_fee = lpTSCall1Ans4->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
    v_trade_commis = lpTSCall1Ans4->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_other_commis = lpTSCall1Ans4->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    strcpy(v_comb_code, lpTSCall1Ans4->GetString(LDBIZ_COMB_CODE_STR));
    v_trade_capt_amt = lpTSCall1Ans4->GetDouble(LDBIZ_TRADE_CAPT_AMT_FLOAT);
    v_posi_capt_amt = lpTSCall1Ans4->GetDouble(LDBIZ_POSI_CAPT_AMT_FLOAT);
    v_rece_margin = lpTSCall1Ans4->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_margin_ratio = lpTSCall1Ans4->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);
    v_comm_margin = lpTSCall1Ans4->GetDouble(LDBIZ_COMM_MARGIN_FLOAT);
    v_compli_trig_id = lpTSCall1Ans4->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);
    v_update_times = lpTSCall1Ans4->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // set @记录序号#=@订单序号#;
    v_row_id=v_order_id;

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


    // set @操作员编号# =@临时_操作员编号#;
    v_opor_no =v_tmp_opor_no;

    // set @操作员机构编号# =@临时_机构编号#;
    v_opor_co_no =v_tmp_co_no;
    //指令主推

    // if @指令序号# > 0 then
    if (v_comm_id > 0)
    {
        //调用过程[事务_交易期货_指令_获取指令]
        //组织事务请求
        if(lpTSCall1Ans5)
        {
          lpTSCall1Ans5->FreeMsg();
          lpTSCall1Ans5=NULL;
        }
        lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.3", 0);
        lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req5->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
        glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
        if(!lpTSCall1Ans5)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.3]subcall timed out!");
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
        v_row_id = lpTSCall1Ans5->GetInt64(LDBIZ_ROW_ID_INT64);
        v_init_date = lpTSCall1Ans5->GetInt32(LDBIZ_INIT_DATE_INT);
        v_co_no = lpTSCall1Ans5->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans5->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans5->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans5->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        strcpy(v_exch_crncy_type, lpTSCall1Ans5->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans5->GetInt32(LDBIZ_EXCH_NO_INT);
        v_futu_acco_no = lpTSCall1Ans5->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
        v_contrc_code_no = lpTSCall1Ans5->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans5->GetString(LDBIZ_CONTRC_CODE_STR));
        v_contrc_type = lpTSCall1Ans5->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_asset_type = lpTSCall1Ans5->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_dir = lpTSCall1Ans5->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans5->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_comm_date = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_DATE_INT);
        v_comm_time = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_TIME_INT);
        v_comm_batch_no = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
        v_comm_opor = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_OPOR_INT);
        v_comm_executor = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
        v_comm_dir = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_DIR_INT);
        v_comm_limit_price = lpTSCall1Ans5->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
        v_limit_actual_price = lpTSCall1Ans5->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
        v_comm_qty = lpTSCall1Ans5->GetDouble(LDBIZ_COMM_QTY_FLOAT);
        v_comm_amt = lpTSCall1Ans5->GetDouble(LDBIZ_COMM_AMT_FLOAT);
        v_order_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_comm_cancel_qty = lpTSCall1Ans5->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans5->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_strike_qty = lpTSCall1Ans5->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_comm_frozen_amt = lpTSCall1Ans5->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
        v_comm_frozen_qty = lpTSCall1Ans5->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
        v_rece_margin = lpTSCall1Ans5->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        v_capit_reback_days = lpTSCall1Ans5->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
        v_posi_reback_days = lpTSCall1Ans5->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
        strcpy(v_strike_status, lpTSCall1Ans5->GetString(LDBIZ_STRIKE_STATUS_STR));
        strcpy(v_comm_status, lpTSCall1Ans5->GetString(LDBIZ_COMM_STATUS_STR));
        v_comm_begin_date = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
        v_comm_end_date = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_END_DATE_INT);
        v_comm_begin_time = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
        v_comm_end_time = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_END_TIME_INT);
        v_comm_comple_date = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
        v_comm_comple_time = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
        v_comm_appr_date = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
        v_comm_appr_time = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
        strcpy(v_comm_appr_status, lpTSCall1Ans5->GetString(LDBIZ_COMM_APPR_STATUS_STR));
        v_comm_appr_oper_no = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_APPR_OPER_NO_INT);
        v_comm_appr_oper = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
        strcpy(v_comm_appr_remark, lpTSCall1Ans5->GetString(LDBIZ_COMM_APPR_REMARK_STR));
        v_external_no = lpTSCall1Ans5->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
        strcpy(v_comb_code, lpTSCall1Ans5->GetString(LDBIZ_COMB_CODE_STR));
        strcpy(v_comm_oper_way, lpTSCall1Ans5->GetString(LDBIZ_COMM_OPER_WAY_STR));
        strcpy(v_remark_info, lpTSCall1Ans5->GetString(LDBIZ_REMARK_INFO_STR));
        v_comm_comple_flag = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
        v_update_times = lpTSCall1Ans5->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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

    // end if;
    }


    // if @回报状态# = 《回报状态-成功》 then
    if (strcmp(v_rsp_status , "1")==0)
    {
      //回报成功,即可撤单,资金和持仓都有变化
      //调用过程[事务_交易期货_账户_获取交易组资产账户资金]
      //组织事务请求
      if(lpTSCall1Ans6)
      {
        lpTSCall1Ans6->FreeMsg();
        lpTSCall1Ans6=NULL;
      }
      lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.11", 0);
      lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
      lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
      lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
      lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
      lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
      lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
      lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
      lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
      lpTSCall1Req6->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
      lpTSCall1Req6->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      lpTSCall1Req6->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
      if(!lpTSCall1Ans6)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.11]subcall timed out!");
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
      v_exgp_row_id = lpTSCall1Ans6->GetInt64(LDBIZ_EXGP_ROW_ID_INT64);
      v_co_no = lpTSCall1Ans6->GetInt32(LDBIZ_CO_NO_INT);
      v_pd_no = lpTSCall1Ans6->GetInt32(LDBIZ_PD_NO_INT);
      v_exgp_begin_amt = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT);
      v_exgp_curr_amt = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT);
      v_exgp_frozen_amt = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
      v_exgp_unfroz_amt = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
      v_exgp_comm_frozen_amt = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
      v_exgp_comm_unfroz_amt = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
      v_exgp_comm_capt_amt = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
      v_exgp_comm_releas_amt = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
      v_exgp_trade_capt_amt = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
      v_exgp_trade_releas_amt = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
      v_exgp_strike_capt_amt = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
      v_exgp_strike_releas_amt = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
      v_exgp_capt_margin = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_CAPT_MARGIN_FLOAT);
      v_exgp_trade_fee = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_TRADE_FEE_FLOAT);
      v_exgp_strike_fee = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_STRIKE_FEE_FLOAT);
      v_exgp_close_pandl = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_CLOSE_PANDL_FLOAT);
      v_exgp_marked_pandl = lpTSCall1Ans6->GetDouble(LDBIZ_EXGP_MARKED_PANDL_FLOAT);
      v_exgp_cash_update_times = lpTSCall1Ans6->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
      v_asac_row_id = lpTSCall1Ans6->GetInt64(LDBIZ_ASAC_ROW_ID_INT64);
      v_asac_begin_amt = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_BEGIN_AMT_FLOAT);
      v_asac_curr_amt = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_CURR_AMT_FLOAT);
      v_asac_frozen_amt = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
      v_asac_unfroz_amt = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
      v_asac_comm_frozen_amt = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
      v_asac_comm_unfroz_amt = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
      v_asac_comm_capt_amt = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
      v_asac_comm_releas_amt = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
      v_asac_trade_capt_amt = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
      v_asac_trade_releas_amt = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
      v_asac_strike_capt_amt = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
      v_asac_strike_releas_amt = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
      v_asac_capt_margin = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_CAPT_MARGIN_FLOAT);
      v_asac_trade_fee = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_TRADE_FEE_FLOAT);
      v_asac_strike_fee = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_STRIKE_FEE_FLOAT);
      v_asac_close_pandl = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_CLOSE_PANDL_FLOAT);
      v_asac_marked_pandl = lpTSCall1Ans6->GetDouble(LDBIZ_ASAC_MARKED_PANDL_FLOAT);
      v_asac_cash_update_times = lpTSCall1Ans6->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);


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

      //调用过程[事务_交易期货_账户_获取交易组资产账户持仓]
      //组织事务请求
      if(lpTSCall1Ans7)
      {
        lpTSCall1Ans7->FreeMsg();
        lpTSCall1Ans7=NULL;
      }
      lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.12", 0);
      lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
      lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
      lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
      lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
      lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
      lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
      lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
      lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
      lpTSCall1Req7->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
      lpTSCall1Req7->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpTSCall1Req7->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
      lpTSCall1Req7->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
      lpTSCall1Req7->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
      lpTSCall1Req7->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
      glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
      if(!lpTSCall1Ans7)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.12]subcall timed out!");
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
      strcpy(v_exch_crncy_type, lpTSCall1Ans7->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
      v_contrc_type = lpTSCall1Ans7->GetInt32(LDBIZ_CONTRC_TYPE_INT);
      v_contrc_unit = lpTSCall1Ans7->GetInt32(LDBIZ_CONTRC_UNIT_INT);
      strcpy(v_comb_code, lpTSCall1Ans7->GetString(LDBIZ_COMB_CODE_STR));
      v_exgp_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
      v_exgp_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
      v_exgp_comm_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
      v_exgp_trade_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
      v_exgp_strike_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
      v_exgp_old_comm_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_OLD_COMM_CAPT_QTY_FLOAT);
      v_exgp_today_comm_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TODAY_COMM_CAPT_QTY_FLOAT);
      v_exgp_old_trade_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_OLD_TRADE_CAPT_QTY_FLOAT);
      v_exgp_today_trade_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TODAY_TRADE_CAPT_QTY_FLOAT);
      v_exgp_pre_strike_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_PRE_STRIKE_CAPT_QTY_FLOAT);
      v_exgp_today_strike_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TODAY_STRIKE_CAPT_QTY_FLOAT);
      v_exgp_rece_margin = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_RECE_MARGIN_FLOAT);
      v_pre_settle_price = lpTSCall1Ans7->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
      v_exgp_realize_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
      v_exgp_open_amount = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_OPEN_AMOUNT_FLOAT);
      v_exgp_posi_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
      v_asac_row_id = lpTSCall1Ans7->GetInt64(LDBIZ_ASAC_ROW_ID_INT64);
      v_asac_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
      v_asac_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
      v_asac_comm_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
      v_asac_trade_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
      v_asac_strike_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
      v_asac_old_comm_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_OLD_COMM_CAPT_QTY_FLOAT);
      v_asac_today_comm_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TODAY_COMM_CAPT_QTY_FLOAT);
      v_asac_old_trade_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_OLD_TRADE_CAPT_QTY_FLOAT);
      v_asac_today_trade_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TODAY_TRADE_CAPT_QTY_FLOAT);
      v_asac_pre_strike_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_PRE_STRIKE_CAPT_QTY_FLOAT);
      v_asac_today_strike_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TODAY_STRIKE_CAPT_QTY_FLOAT);
      v_asac_rece_margin = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_RECE_MARGIN_FLOAT);
      v_asac_realize_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
      v_asac_open_amount = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_OPEN_AMOUNT_FLOAT);
      v_asac_posi_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


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

    // end if;
    }


    // if @指令批号# > 0  then
    if (v_comm_batch_no > 0 )
    {
        //调用过程[事务_交易期货_指令_获取指令汇总]
        //组织事务请求
        if(lpTSCall1Ans8)
        {
          lpTSCall1Ans8->FreeMsg();
          lpTSCall1Ans8=NULL;
        }
        lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.4", 0);
        lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req8->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
        lpTSCall1Req8->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpTSCall1Req8->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req8->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
        glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
        if(!lpTSCall1Ans8)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.4]subcall timed out!");
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
        v_row_id = lpTSCall1Ans8->GetInt64(LDBIZ_ROW_ID_INT64);
        v_init_date = lpTSCall1Ans8->GetInt32(LDBIZ_INIT_DATE_INT);
        v_pd_no = lpTSCall1Ans8->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans8->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans8->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        strcpy(v_exch_crncy_type, lpTSCall1Ans8->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans8->GetInt32(LDBIZ_EXCH_NO_INT);
        v_futu_acco_no = lpTSCall1Ans8->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
        v_contrc_code_no = lpTSCall1Ans8->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans8->GetString(LDBIZ_CONTRC_CODE_STR));
        v_contrc_type = lpTSCall1Ans8->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_asset_type = lpTSCall1Ans8->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_dir = lpTSCall1Ans8->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans8->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_comm_time = lpTSCall1Ans8->GetInt32(LDBIZ_COMM_TIME_INT);
        v_comm_opor = lpTSCall1Ans8->GetInt32(LDBIZ_COMM_OPOR_INT);
        v_comm_dir = lpTSCall1Ans8->GetInt32(LDBIZ_COMM_DIR_INT);
        v_comm_limit_price = lpTSCall1Ans8->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
        v_limit_actual_price = lpTSCall1Ans8->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
        v_comm_qty = lpTSCall1Ans8->GetDouble(LDBIZ_COMM_QTY_FLOAT);
        v_comm_amt = lpTSCall1Ans8->GetDouble(LDBIZ_COMM_AMT_FLOAT);
        v_order_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_comm_cancel_qty = lpTSCall1Ans8->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
        v_comm_await_cancel_qty = lpTSCall1Ans8->GetDouble(LDBIZ_COMM_AWAIT_CANCEL_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans8->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_strike_qty = lpTSCall1Ans8->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        strcpy(v_strike_status, lpTSCall1Ans8->GetString(LDBIZ_STRIKE_STATUS_STR));
        strcpy(v_comm_sum_status, lpTSCall1Ans8->GetString(LDBIZ_COMM_SUM_STATUS_STR));
        v_comm_begin_date = lpTSCall1Ans8->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
        v_comm_end_date = lpTSCall1Ans8->GetInt32(LDBIZ_COMM_END_DATE_INT);
        v_comm_begin_time = lpTSCall1Ans8->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
        v_comm_end_time = lpTSCall1Ans8->GetInt32(LDBIZ_COMM_END_TIME_INT);
        v_comm_comple_date = lpTSCall1Ans8->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
        v_comm_comple_time = lpTSCall1Ans8->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
        v_max_comm_comple_date = lpTSCall1Ans8->GetInt32(LDBIZ_MAX_COMM_COMPLE_DATE_INT);
        v_max_comm_comple_time = lpTSCall1Ans8->GetInt32(LDBIZ_MAX_COMM_COMPLE_TIME_INT);
        v_comm_appr_date = lpTSCall1Ans8->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
        v_comm_appr_time = lpTSCall1Ans8->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
        v_comm_appr_qty = lpTSCall1Ans8->GetDouble(LDBIZ_COMM_APPR_QTY_FLOAT);
        strcpy(v_comm_sum_approve_status, lpTSCall1Ans8->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
        v_buy_order_qty = lpTSCall1Ans8->GetDouble(LDBIZ_BUY_ORDER_QTY_FLOAT);
        v_sell_order_qty = lpTSCall1Ans8->GetDouble(LDBIZ_SELL_ORDER_QTY_FLOAT);
        v_buy_comm_qty = lpTSCall1Ans8->GetDouble(LDBIZ_BUY_COMM_QTY_FLOAT);
        v_sell_comm_qty = lpTSCall1Ans8->GetDouble(LDBIZ_SELL_COMM_QTY_FLOAT);
        v_buy_strike_qty = lpTSCall1Ans8->GetDouble(LDBIZ_BUY_STRIKE_QTY_FLOAT);
        v_sell_strike_qty = lpTSCall1Ans8->GetDouble(LDBIZ_SELL_STRIKE_QTY_FLOAT);
        v_buy_strike_amt = lpTSCall1Ans8->GetDouble(LDBIZ_BUY_STRIKE_AMT_FLOAT);
        v_sell_strike_amt = lpTSCall1Ans8->GetDouble(LDBIZ_SELL_STRIKE_AMT_FLOAT);
        v_buy_comm_amt = lpTSCall1Ans8->GetDouble(LDBIZ_BUY_COMM_AMT_FLOAT);
        v_sell_comm_amt = lpTSCall1Ans8->GetDouble(LDBIZ_SELL_COMM_AMT_FLOAT);
        v_rece_margin = lpTSCall1Ans8->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_comm_oper_way, lpTSCall1Ans8->GetString(LDBIZ_COMM_OPER_WAY_STR));
        v_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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

    //订单汇总主推

    // if @订单批号#>0 then
    if (v_order_batch_no>0)
    {
        //调用过程[事务_交易期货_交易_获取订单汇总]
        //组织事务请求
        if(lpTSCall1Ans9)
        {
          lpTSCall1Ans9->FreeMsg();
          lpTSCall1Ans9=NULL;
        }
        lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.19", 0);
        lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req9->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpTSCall1Req9->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
        lpTSCall1Req9->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
        if(!lpTSCall1Ans9)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.19]subcall timed out!");
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
        strcpy(v_oper_func_code, lpTSCall1Ans9->GetString(LDBIZ_OPER_FUNC_CODE_STR));
        v_init_date = lpTSCall1Ans9->GetInt32(LDBIZ_INIT_DATE_INT);
        v_pd_no = lpTSCall1Ans9->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans9->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans9->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans9->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_crncy_type, lpTSCall1Ans9->GetString(LDBIZ_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans9->GetInt32(LDBIZ_EXCH_NO_INT);
        v_contrc_code_no = lpTSCall1Ans9->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans9->GetString(LDBIZ_CONTRC_CODE_STR));
        v_asset_type = lpTSCall1Ans9->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_type = lpTSCall1Ans9->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_contrc_unit = lpTSCall1Ans9->GetInt32(LDBIZ_CONTRC_UNIT_INT);
        v_external_no = lpTSCall1Ans9->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
        v_order_dir = lpTSCall1Ans9->GetInt32(LDBIZ_ORDER_DIR_INT);
        v_contrc_dir = lpTSCall1Ans9->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans9->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_order_price = lpTSCall1Ans9->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        strcpy(v_order_sum_status, lpTSCall1Ans9->GetString(LDBIZ_ORDER_SUM_STATUS_STR));
        v_wtdraw_qty = lpTSCall1Ans9->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
        v_waste_qty = lpTSCall1Ans9->GetDouble(LDBIZ_WASTE_QTY_FLOAT);
        v_strike_qty = lpTSCall1Ans9->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_strike_aver_price = lpTSCall1Ans9->GetDouble(LDBIZ_STRIKE_AVER_PRICE_FLOAT);
        v_strike_amt = lpTSCall1Ans9->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_trade_fee = lpTSCall1Ans9->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
        v_trade_commis = lpTSCall1Ans9->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_other_commis = lpTSCall1Ans9->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_strike_commis = lpTSCall1Ans9->GetDouble(LDBIZ_STRIKE_COMMIS_FLOAT);
        v_strike_other_commis = lpTSCall1Ans9->GetDouble(LDBIZ_STRIKE_OTHER_COMMIS_FLOAT);
        v_report_fee = lpTSCall1Ans9->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
        v_wtdraw_fee = lpTSCall1Ans9->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
        v_strike_all_fee = lpTSCall1Ans9->GetDouble(LDBIZ_STRIKE_ALL_FEE_FLOAT);
        v_rece_margin = lpTSCall1Ans9->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_order_oper_way, lpTSCall1Ans9->GetString(LDBIZ_ORDER_OPER_WAY_STR));
        v_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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


    // set @资产账户编号# = @临时_资产账户编号#;
    v_asset_acco_no = v_tmp_asset_acco_no;
    //改单处理
    //调用过程[事务_交易期货_交易_更新获取改单信息]
    //组织事务请求
    if(lpTSCall1Ans10)
    {
      lpTSCall1Ans10->FreeMsg();
      lpTSCall1Ans10=NULL;
    }
    lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.24", 0);
    lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req10->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req10->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
    if(!lpTSCall1Ans10)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.24]subcall timed out!");
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
    v_modi_order_id = lpTSCall1Ans10->GetInt64(LDBIZ_MODI_ORDER_ID_INT64);
    v_modi_order_date = lpTSCall1Ans10->GetInt32(LDBIZ_MODI_ORDER_DATE_INT);
    v_modi_order_time = lpTSCall1Ans10->GetInt32(LDBIZ_MODI_ORDER_TIME_INT);
    v_modi_batch_no = lpTSCall1Ans10->GetInt32(LDBIZ_MODI_BATCH_NO_INT);
    v_modi_order_price = lpTSCall1Ans10->GetDouble(LDBIZ_MODI_ORDER_PRICE_FLOAT);
    v_modi_order_qty = lpTSCall1Ans10->GetDouble(LDBIZ_MODI_ORDER_QTY_FLOAT);
    v_modi_price_type = lpTSCall1Ans10->GetInt32(LDBIZ_MODI_PRICE_TYPE_INT);
    v_exch_no = lpTSCall1Ans10->GetInt32(LDBIZ_EXCH_NO_INT);
    v_contrc_code_no = lpTSCall1Ans10->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strcpy(v_contrc_code, lpTSCall1Ans10->GetString(LDBIZ_CONTRC_CODE_STR));
    strcpy(v_crncy_type, lpTSCall1Ans10->GetString(LDBIZ_CRNCY_TYPE_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans10->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    strcpy(v_order_oper_way, lpTSCall1Ans10->GetString(LDBIZ_ORDER_OPER_WAY_STR));
    v_busi_opor_no = lpTSCall1Ans10->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);


    // if @改单序号# <> 0 and  @撤单状态# = 《撤单状态-成功》 then
    if (v_modi_order_id != 0 &&  strcmp(v_wtdraw_status , "3")==0)
    {

      // set @订单数量# = @临时_订单数量#;
      v_order_qty = v_tmp_order_qty;

      // set @撤单数量# = @临时_撤单数量#;
      v_wtdraw_qty = v_tmp_wtdraw_qty;

      // set @成交数量# = @订单数量# - @撤单数量#;
      v_strike_qty = v_order_qty - v_wtdraw_qty;

      // set @订单数量# = @改单数量# - @成交数量#;
      v_order_qty = v_modi_order_qty - v_strike_qty;

      // set @订单价格# = @改单价格#;
      v_order_price = v_modi_order_price;

      // set @指令下达人# = @业务操作员编号#;
      v_comm_opor = v_busi_opor_no;

      // set @订单批号# = @改单批号#;
      v_order_batch_no = v_modi_batch_no;

      // set @价格类型# = @改单价格类型#;
      v_price_type = v_modi_price_type;

      // set @备注信息# = "未报改单生成订单。";
      strcpy(v_remark_info,"未报改单生成订单。");
      //最小单位这个还没有输出，后续需要输出
      //set @订单数量// = floor(@订单数量///@最小单位//) * @最小单位//;

      // if @订单数量# > 0 then
      if (v_order_qty > 0)
      {

        // set @交易组编号# = @临时_交易组编号#;
        v_exch_group_no = v_tmp_exch_group_no;
        //调用过程[事务_公共_交易接口_检查期货交易市场状态权限身份]
        //组织事务请求
        if(lpTSCall1Ans11)
        {
          lpTSCall1Ans11->FreeMsg();
          lpTSCall1Ans11=NULL;
        }
        lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("pubT.25.135", 0);
        lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req11->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
        lpTSCall1Req11->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req11->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req11->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpTSCall1Req11->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
        lpTSCall1Req11->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpTSCall1Req11->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
        lpTSCall1Req11->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpTSCall1Req11->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
        lpTSCall1Req11->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
        glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
        if(!lpTSCall1Ans11)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.135]subcall timed out!");
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
        v_init_date = lpTSCall1Ans11->GetInt32(LDBIZ_INIT_DATE_INT);
        v_pd_no = lpTSCall1Ans11->GetInt32(LDBIZ_PD_NO_INT);
        strcpy(v_co_busi_config_str, lpTSCall1Ans11->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));
        strcpy(v_exgp_busi_config_str, lpTSCall1Ans11->GetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR));
        v_contrc_code_no = lpTSCall1Ans11->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        v_contrc_type = lpTSCall1Ans11->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_asset_type = lpTSCall1Ans11->GetInt32(LDBIZ_ASSET_TYPE_INT);
        strcpy(v_crncy_type, lpTSCall1Ans11->GetString(LDBIZ_CRNCY_TYPE_STR));
        strcpy(v_exch_crncy_type, lpTSCall1Ans11->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_contrc_unit = lpTSCall1Ans11->GetInt32(LDBIZ_CONTRC_UNIT_INT);
        v_capit_reback_days = lpTSCall1Ans11->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
        v_posi_reback_days = lpTSCall1Ans11->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);


        // set @业务控制配置串# = @交易组业务控制配置串#;
        strcpy(v_busi_config_str,v_exgp_busi_config_str);

        // set @业务控制串# = "11111";
        strcpy(v_busi_ctrl_str,"11111");
        //调用过程[事务_公共_公共接口_检查系统状态权限身份获取操作员权限串]
        //组织事务请求
        if(lpTSCall1Ans12)
        {
          lpTSCall1Ans12->FreeMsg();
          lpTSCall1Ans12=NULL;
        }
        lpTSCall1Req12=glpFastMsgFactory->CreateFastMessage("pubT.24.3", 0);
        lpTSCall1Req12->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req12->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req12->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req12->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req12->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req12->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req12->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req12->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req12->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
        lpTSCall1Req12->SetString(LDBIZ_BUSI_CTRL_STR_STR,v_busi_ctrl_str);
        lpTSCall1Req12->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
        glpTSSubcallSerives->SubCall(lpTSCall1Req12, &lpTSCall1Ans12, 5000);
        if(!lpTSCall1Ans12)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.3]subcall timed out!");
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
        v_init_date = lpTSCall1Ans12->GetInt32(LDBIZ_INIT_DATE_INT);
        strcpy(v_co_busi_config_str, lpTSCall1Ans12->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));
        strcpy(v_co_no_rights_str, lpTSCall1Ans12->GetString(LDBIZ_CO_NO_RIGHTS_STR_STR));
        strcpy(v_pd_no_rights_str, lpTSCall1Ans12->GetString(LDBIZ_PD_NO_RIGHTS_STR_STR));
        strcpy(v_exch_group_no_rights_str, lpTSCall1Ans12->GetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR));

        //调用过程[事务_产品_交易接口_检查期货交易产品账户信息]
        //组织事务请求
        if(lpTSCall1Ans13)
        {
          lpTSCall1Ans13->FreeMsg();
          lpTSCall1Ans13=NULL;
        }
        lpTSCall1Req13=glpFastMsgFactory->CreateFastMessage("prodT.8.108", 0);
        lpTSCall1Req13->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req13->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req13->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req13->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req13->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req13->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req13->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req13->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req13->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req13->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpTSCall1Req13->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpTSCall1Req13->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req13->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
        lpTSCall1Req13->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req13->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
        lpTSCall1Req13->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpTSCall1Req13->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
        lpTSCall1Req13->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
        lpTSCall1Req13->SetString(LDBIZ_BUSI_CONFIG_STR_STR,v_busi_config_str);
        glpTSSubcallSerives->SubCall(lpTSCall1Req13, &lpTSCall1Ans13, 5000);
        if(!lpTSCall1Ans13)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.8.108]subcall timed out!");
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
        strcpy(v_exgp_busi_config_str, lpTSCall1Ans13->GetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR));
        strcpy(v_asac_busi_config_str, lpTSCall1Ans13->GetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR));
        strcpy(v_split_fee_typr_str, lpTSCall1Ans13->GetString(LDBIZ_SPLIT_FEE_TYPR_STR_STR));
        strcpy(v_busi_limit_str, lpTSCall1Ans13->GetString(LDBIZ_BUSI_LIMIT_STR_STR));
        v_pass_no = lpTSCall1Ans13->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_out_acco, lpTSCall1Ans13->GetString(LDBIZ_OUT_ACCO_STR));
        v_nav_asset = lpTSCall1Ans13->GetDouble(LDBIZ_NAV_ASSET_FLOAT);

        //获取保证金优惠订单费用
        //调用过程[事务_公共_公共接口_获取保证金优惠组合编码订单费用]
        //组织事务请求
        if(lpTSCall1Ans14)
        {
          lpTSCall1Ans14->FreeMsg();
          lpTSCall1Ans14=NULL;
        }
        lpTSCall1Req14=glpFastMsgFactory->CreateFastMessage("pubT.24.255", 0);
        lpTSCall1Req14->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req14->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req14->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req14->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req14->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req14->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req14->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req14->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req14->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
        lpTSCall1Req14->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req14->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req14->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
        lpTSCall1Req14->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
        lpTSCall1Req14->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
        lpTSCall1Req14->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpTSCall1Req14->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
        lpTSCall1Req14->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpTSCall1Req14->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
        lpTSCall1Req14->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
        glpTSSubcallSerives->SubCall(lpTSCall1Req14, &lpTSCall1Ans14, 5000);
        if(!lpTSCall1Ans14)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.255]subcall timed out!");
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
        v_rece_margin = lpTSCall1Ans14->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        v_trade_commis = lpTSCall1Ans14->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_report_fee = lpTSCall1Ans14->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
        v_wtdraw_fee = lpTSCall1Ans14->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
        v_deli_fee = lpTSCall1Ans14->GetDouble(LDBIZ_DELI_FEE_FLOAT);
        v_other_fee = lpTSCall1Ans14->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
        v_other_commis = lpTSCall1Ans14->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_all_fee = lpTSCall1Ans14->GetDouble(LDBIZ_ALL_FEE_FLOAT);
        v_margin_pref = lpTSCall1Ans14->GetInt32(LDBIZ_MARGIN_PREF_INT);
        strcpy(v_comb_code, lpTSCall1Ans14->GetString(LDBIZ_COMB_CODE_STR));
        v_margin_ratio = lpTSCall1Ans14->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);


        // set @交易费用# = @全部费用#;
        v_trade_fee = v_all_fee;
        //获取涨停价 跌停价 和 昨日收盘价
        //调用过程[事务_公共_公共接口_获取合约编号行情价格]
        //组织事务请求
        if(lpTSCall1Ans15)
        {
          lpTSCall1Ans15->FreeMsg();
          lpTSCall1Ans15=NULL;
        }
        lpTSCall1Req15=glpFastMsgFactory->CreateFastMessage("pubT.24.501", 0);
        lpTSCall1Req15->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req15->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req15->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req15->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req15->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req15->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req15->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req15->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req15->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req15, &lpTSCall1Ans15, 5000);
        if(!lpTSCall1Ans15)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.501]subcall timed out!");
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
        v_pre_settle_price = lpTSCall1Ans15->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
        v_up_limit_price = lpTSCall1Ans15->GetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT);
        v_down_limit_price = lpTSCall1Ans15->GetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
        v_last_price = lpTSCall1Ans15->GetDouble(LDBIZ_LAST_PRICE_FLOAT);


        // if @错误编码# = "0" then
        if (strcmp(v_error_code , "0")==0)
        {

            // set @触发阶段类型# = 《触发阶段类型-交易端》;
            v_trig_stage_type = 2;
            //调用过程[事务_风控期货_接口_检查客户风险]
            //组织事务请求
            if(lpTSCall1Ans16)
            {
              lpTSCall1Ans16->FreeMsg();
              lpTSCall1Ans16=NULL;
            }
            lpTSCall1Req16=glpFastMsgFactory->CreateFastMessage("rkfutuT.5.1", 0);
            lpTSCall1Req16->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req16->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req16->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req16->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req16->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req16->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req16->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req16->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req16->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpTSCall1Req16->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
            lpTSCall1Req16->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
            lpTSCall1Req16->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpTSCall1Req16->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req16->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
            lpTSCall1Req16->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
            lpTSCall1Req16->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
            lpTSCall1Req16->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
            lpTSCall1Req16->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
            lpTSCall1Req16->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
            lpTSCall1Req16->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
            lpTSCall1Req16->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
            lpTSCall1Req16->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
            lpTSCall1Req16->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
            lpTSCall1Req16->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
            lpTSCall1Req16->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
            lpTSCall1Req16->SetInt32(LDBIZ_TRIG_STAGE_TYPE_INT,v_trig_stage_type);
            glpTSSubcallSerives->SubCall(lpTSCall1Req16, &lpTSCall1Ans16, 5000);
            if(!lpTSCall1Ans16)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rkfutuT.5.1]subcall timed out!");
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
            //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans16->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans16->GetString(LDBIZ_ERROR_INFO_STR));
            v_compli_trig_id = lpTSCall1Ans16->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);

        // end if;
        }


        // if @错误编码# = "0" then
        if (strcmp(v_error_code , "0")==0)
        {

            // set @计算方向# = 《计算方向-加上》;
            v_calc_dir = 1;

            // set @操作员编号# =@业务操作员编号#;
            v_opor_no =v_busi_opor_no;

            // set @操作员机构编号# =@机构编号#;
            v_opor_co_no =v_co_no;

            // set @操作MAC# = @MAC地址#;
            strcpy(v_oper_mac,v_mac_addr);

            // set @操作IP# = @IP地址#;
            strcpy(v_oper_ip_addr,v_ip_addr);

            // set @操作信息# = @上次操作信息#;
            strcpy(v_oper_info,v_last_oper_info);
            //调用过程[事务_交易期货_交易_新增订单]
            //组织事务请求
            if(lpTSCall1Ans17)
            {
              lpTSCall1Ans17->FreeMsg();
              lpTSCall1Ans17=NULL;
            }
            lpTSCall1Req17=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.11", 0);
            lpTSCall1Req17->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req17->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req17->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req17->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req17->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req17->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req17->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req17->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req17->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
            lpTSCall1Req17->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
            lpTSCall1Req17->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpTSCall1Req17->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
            lpTSCall1Req17->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
            lpTSCall1Req17->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpTSCall1Req17->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
            lpTSCall1Req17->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req17->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
            lpTSCall1Req17->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
            lpTSCall1Req17->SetString(LDBIZ_FUTU_ACCO_STR,v_futu_acco);
            lpTSCall1Req17->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
            lpTSCall1Req17->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
            lpTSCall1Req17->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
            lpTSCall1Req17->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
            lpTSCall1Req17->SetString(LDBIZ_BUSI_LIMIT_STR_STR,v_busi_limit_str);
            lpTSCall1Req17->SetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR,v_exgp_busi_config_str);
            lpTSCall1Req17->SetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR,v_asac_busi_config_str);
            lpTSCall1Req17->SetDouble(LDBIZ_EXGP_AVAIL_AMT_FLOAT,v_exgp_avail_amt);
            lpTSCall1Req17->SetDouble(LDBIZ_ASAC_AVAIL_AMT_FLOAT,v_asac_avail_amt);
            lpTSCall1Req17->SetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT,v_exgp_avail_qty);
            lpTSCall1Req17->SetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT,v_asac_avail_qty);
            lpTSCall1Req17->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
            lpTSCall1Req17->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
            lpTSCall1Req17->SetInt32(LDBIZ_CALC_DIR_INT,v_calc_dir);
            lpTSCall1Req17->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
            lpTSCall1Req17->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
            lpTSCall1Req17->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
            lpTSCall1Req17->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
            lpTSCall1Req17->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
            lpTSCall1Req17->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
            lpTSCall1Req17->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
            lpTSCall1Req17->SetDouble(LDBIZ_REPORT_FEE_FLOAT,v_report_fee);
            lpTSCall1Req17->SetDouble(LDBIZ_WTDRAW_FEE_FLOAT,v_wtdraw_fee);
            lpTSCall1Req17->SetDouble(LDBIZ_TRADE_FEE_FLOAT,v_trade_fee);
            lpTSCall1Req17->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
            lpTSCall1Req17->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
            lpTSCall1Req17->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
            lpTSCall1Req17->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
            lpTSCall1Req17->SetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT,v_up_limit_price);
            lpTSCall1Req17->SetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT,v_down_limit_price);
            lpTSCall1Req17->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
            lpTSCall1Req17->SetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT,v_exgp_long_rece_margin);
            lpTSCall1Req17->SetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT,v_exgp_short_rece_margin);
            lpTSCall1Req17->SetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT,v_asac_long_rece_margin);
            lpTSCall1Req17->SetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT,v_asac_short_rece_margin);
            lpTSCall1Req17->SetInt64(LDBIZ_COMPLI_TRIG_ID_INT64,v_compli_trig_id);
            lpTSCall1Req17->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
            lpTSCall1Req17->SetDouble(LDBIZ_MARGIN_RATIO_FLOAT,v_margin_ratio);
            glpTSSubcallSerives->SubCall(lpTSCall1Req17, &lpTSCall1Ans17, 5000);
            if(!lpTSCall1Ans17)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.11]subcall timed out!");
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
            //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans17->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans17->GetString(LDBIZ_ERROR_INFO_STR));
            v_order_id = lpTSCall1Ans17->GetInt64(LDBIZ_ORDER_ID_INT64);
            v_order_date = lpTSCall1Ans17->GetInt32(LDBIZ_ORDER_DATE_INT);
            v_order_time = lpTSCall1Ans17->GetInt32(LDBIZ_ORDER_TIME_INT);
            strcpy(v_order_status, lpTSCall1Ans17->GetString(LDBIZ_ORDER_STATUS_STR));
            v_comm_batch_no = lpTSCall1Ans17->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
            v_report_date = lpTSCall1Ans17->GetInt32(LDBIZ_REPORT_DATE_INT);
            v_report_time = lpTSCall1Ans17->GetInt32(LDBIZ_REPORT_TIME_INT);
            v_update_times = lpTSCall1Ans17->GetInt32(LDBIZ_UPDATE_TIMES_INT);


            // set @记录序号# = @订单序号#;
            v_row_id = v_order_id;
        // end if;
        }


        // if @错误编码# <> "0" then
        if (strcmp(v_error_code , "0")!=0)
        {

          // set @改单状态# = 《改单状态-失败》;
          strcpy(v_modi_order_status,"4");

          // set @新订单序号# = 0;
          v_new_order_id = 0;

          // set @备注信息# = concat(@错误编码#,"|",@错误信息#);
          snprintf(v_remark_info,sizeof(v_remark_info),"%s%s%s",v_error_code,"|",v_error_info);
        }
        // else
        else
        {


          // set @改单状态# = 《改单状态-成功》;
          strcpy(v_modi_order_status,"3");

          // set @新订单序号# = @订单序号#;
          v_new_order_id = v_order_id;

          // set @新订单状态# = @订单状态#;
          strcpy(v_new_order_status,v_order_status);

          // set @备注信息# = "未报改单生成订单成功。";
          strcpy(v_remark_info,"未报改单生成订单成功。");

          // set @撤单数量# = 0;
          v_wtdraw_qty = 0;

          // set @当笔成交价格# = 0;
          v_curr_strike_price = 0;

          // set @当笔成交金额# = 0;
          v_curr_strike_amt = 0;

          // set @当笔成交数量# = 0;
          v_curr_strike_qty = 0;

          // set @成交序号# = 0;
          v_strike_id = 0;

          // set @全部费用# = 0;
          v_all_fee = 0;
          //主动推送

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

        //调用过程[事务_交易期货_交易_更新改单状态]
        //组织事务请求
        if(lpTSCall1Ans18)
        {
          lpTSCall1Ans18->FreeMsg();
          lpTSCall1Ans18=NULL;
        }
        lpTSCall1Req18=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.25", 0);
        lpTSCall1Req18->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req18->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req18->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req18->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req18->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req18->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req18->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req18->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req18->SetInt32(LDBIZ_MODI_ORDER_DATE_INT,v_modi_order_date);
        lpTSCall1Req18->SetInt64(LDBIZ_MODI_ORDER_ID_INT64,v_modi_order_id);
        lpTSCall1Req18->SetString(LDBIZ_MODI_ORDER_STATUS_STR,v_modi_order_status);
        lpTSCall1Req18->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        lpTSCall1Req18->SetInt64(LDBIZ_NEW_ORDER_ID_INT64,v_new_order_id);
        glpTSSubcallSerives->SubCall(lpTSCall1Req18, &lpTSCall1Ans18, 5000);
        if(!lpTSCall1Ans18)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.25]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans18->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans18->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans18->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans18->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans18->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans18->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans18->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans18->GetString(LDBIZ_ERROR_INFO_STR));

      }
      // else
      else
      {


        // set @改单状态# = 《改单状态-失败》;
        strcpy(v_modi_order_status,"4");

        // set @新订单序号# = 0;
        v_new_order_id = 0;

        // set @备注信息# = "重算后的订单数量非法";
        strcpy(v_remark_info,"重算后的订单数量非法");
        //调用过程[事务_交易期货_交易_更新改单状态]
        //组织事务请求
        if(lpTSCall1Ans19)
        {
          lpTSCall1Ans19->FreeMsg();
          lpTSCall1Ans19=NULL;
        }
        lpTSCall1Req19=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.25", 0);
        lpTSCall1Req19->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req19->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req19->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req19->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req19->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req19->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req19->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req19->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req19->SetInt32(LDBIZ_MODI_ORDER_DATE_INT,v_modi_order_date);
        lpTSCall1Req19->SetInt64(LDBIZ_MODI_ORDER_ID_INT64,v_modi_order_id);
        lpTSCall1Req19->SetString(LDBIZ_MODI_ORDER_STATUS_STR,v_modi_order_status);
        lpTSCall1Req19->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        lpTSCall1Req19->SetInt64(LDBIZ_NEW_ORDER_ID_INT64,v_new_order_id);
        glpTSSubcallSerives->SubCall(lpTSCall1Req19, &lpTSCall1Ans19, 5000);
        if(!lpTSCall1Ans19)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.25]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans19->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans19->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans19->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans19->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans19->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans19->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans19->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans19->GetString(LDBIZ_ERROR_INFO_STR));


        // [报错返回][715][@订单数量#]
            strcpy(v_error_code,"tdfutuL.5.11.715");
            snprintf(v_error_info, sizeof(v_error_info), "%s%018.2f","订单数量=",v_order_qty);
            iRet = -1;
            goto END;

      // end if;
      }

    // end if;
    }

    //指令主推

    // if @指令序号# > 0 then
    if (v_comm_id > 0)
    {
        //调用过程[事务_交易期货_指令_获取指令]
        //组织事务请求
        if(lpTSCall1Ans20)
        {
          lpTSCall1Ans20->FreeMsg();
          lpTSCall1Ans20=NULL;
        }
        lpTSCall1Req20=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.3", 0);
        lpTSCall1Req20->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req20->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req20->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req20->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req20->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req20->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req20->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req20->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req20->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
        glpTSSubcallSerives->SubCall(lpTSCall1Req20, &lpTSCall1Ans20, 5000);
        if(!lpTSCall1Ans20)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.3]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans20->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans20->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans20->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans20->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans20->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans20->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans20->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans20->GetString(LDBIZ_ERROR_INFO_STR));
        v_row_id = lpTSCall1Ans20->GetInt64(LDBIZ_ROW_ID_INT64);
        v_init_date = lpTSCall1Ans20->GetInt32(LDBIZ_INIT_DATE_INT);
        v_co_no = lpTSCall1Ans20->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans20->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans20->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans20->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        strcpy(v_exch_crncy_type, lpTSCall1Ans20->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans20->GetInt32(LDBIZ_EXCH_NO_INT);
        v_futu_acco_no = lpTSCall1Ans20->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
        v_contrc_code_no = lpTSCall1Ans20->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans20->GetString(LDBIZ_CONTRC_CODE_STR));
        v_contrc_type = lpTSCall1Ans20->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_asset_type = lpTSCall1Ans20->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_dir = lpTSCall1Ans20->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans20->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_comm_date = lpTSCall1Ans20->GetInt32(LDBIZ_COMM_DATE_INT);
        v_comm_time = lpTSCall1Ans20->GetInt32(LDBIZ_COMM_TIME_INT);
        v_comm_batch_no = lpTSCall1Ans20->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
        v_comm_opor = lpTSCall1Ans20->GetInt32(LDBIZ_COMM_OPOR_INT);
        v_comm_executor = lpTSCall1Ans20->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
        v_comm_dir = lpTSCall1Ans20->GetInt32(LDBIZ_COMM_DIR_INT);
        v_comm_limit_price = lpTSCall1Ans20->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
        v_limit_actual_price = lpTSCall1Ans20->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
        v_comm_qty = lpTSCall1Ans20->GetDouble(LDBIZ_COMM_QTY_FLOAT);
        v_comm_amt = lpTSCall1Ans20->GetDouble(LDBIZ_COMM_AMT_FLOAT);
        v_order_qty = lpTSCall1Ans20->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_comm_cancel_qty = lpTSCall1Ans20->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans20->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_strike_qty = lpTSCall1Ans20->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_comm_frozen_amt = lpTSCall1Ans20->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
        v_comm_frozen_qty = lpTSCall1Ans20->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
        v_rece_margin = lpTSCall1Ans20->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        v_capit_reback_days = lpTSCall1Ans20->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
        v_posi_reback_days = lpTSCall1Ans20->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
        strcpy(v_strike_status, lpTSCall1Ans20->GetString(LDBIZ_STRIKE_STATUS_STR));
        strcpy(v_comm_status, lpTSCall1Ans20->GetString(LDBIZ_COMM_STATUS_STR));
        v_comm_begin_date = lpTSCall1Ans20->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
        v_comm_end_date = lpTSCall1Ans20->GetInt32(LDBIZ_COMM_END_DATE_INT);
        v_comm_begin_time = lpTSCall1Ans20->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
        v_comm_end_time = lpTSCall1Ans20->GetInt32(LDBIZ_COMM_END_TIME_INT);
        v_comm_comple_date = lpTSCall1Ans20->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
        v_comm_comple_time = lpTSCall1Ans20->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
        v_comm_appr_date = lpTSCall1Ans20->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
        v_comm_appr_time = lpTSCall1Ans20->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
        strcpy(v_comm_appr_status, lpTSCall1Ans20->GetString(LDBIZ_COMM_APPR_STATUS_STR));
        v_comm_appr_oper_no = lpTSCall1Ans20->GetInt32(LDBIZ_COMM_APPR_OPER_NO_INT);
        v_comm_appr_oper = lpTSCall1Ans20->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
        strcpy(v_comm_appr_remark, lpTSCall1Ans20->GetString(LDBIZ_COMM_APPR_REMARK_STR));
        v_external_no = lpTSCall1Ans20->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
        strcpy(v_comb_code, lpTSCall1Ans20->GetString(LDBIZ_COMB_CODE_STR));
        strcpy(v_comm_oper_way, lpTSCall1Ans20->GetString(LDBIZ_COMM_OPER_WAY_STR));
        strcpy(v_remark_info, lpTSCall1Ans20->GetString(LDBIZ_REMARK_INFO_STR));
        v_comm_comple_flag = lpTSCall1Ans20->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
        v_update_times = lpTSCall1Ans20->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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

    // end if;
    }


    // if @回报状态# = 《回报状态-成功》 then
    if (strcmp(v_rsp_status , "1")==0)
    {

      // set @合约代码编号# = @临时_合约代码编号#;
      v_contrc_code_no = v_tmp_contrc_code_no;
      //回报成功,即可撤单,资金和持仓都有变化
      //调用过程[事务_交易期货_账户_获取交易组资产账户资金]
      //组织事务请求
      if(lpTSCall1Ans21)
      {
        lpTSCall1Ans21->FreeMsg();
        lpTSCall1Ans21=NULL;
      }
      lpTSCall1Req21=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.11", 0);
      lpTSCall1Req21->SetInt32(LDTAG_PRIORITY, iPriority);
      lpTSCall1Req21->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
      lpTSCall1Req21->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
      lpTSCall1Req21->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
      lpTSCall1Req21->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
      lpTSCall1Req21->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
      lpTSCall1Req21->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
      lpTSCall1Req21->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
      lpTSCall1Req21->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
      lpTSCall1Req21->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      lpTSCall1Req21->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      glpTSSubcallSerives->SubCall(lpTSCall1Req21, &lpTSCall1Ans21, 5000);
      if(!lpTSCall1Ans21)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.11]subcall timed out!");
          iRet=-2;
          goto ENDSYS;
      }
      else if(lpTSCall1Ans21->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans21->GetInt32(LDTAG_ERRORNO));
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans21->GetString(LDTAG_ERRORINFO));
          iRet=-2;
          goto ENDSYS;
      }
      else if(strcmp(lpTSCall1Ans21->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
      {
          strcpy(v_error_code, lpTSCall1Ans21->GetString(LDBIZ_ERROR_CODE_STR));
          strcpy(v_error_info, lpTSCall1Ans21->GetString(LDBIZ_ERROR_INFO_STR));
          iRet=-1;
          goto END;
      }
      //获取输出参数值
      strcpy(v_error_code, lpTSCall1Ans21->GetString(LDBIZ_ERROR_CODE_STR));
      strcpy(v_error_info, lpTSCall1Ans21->GetString(LDBIZ_ERROR_INFO_STR));
      v_exgp_row_id = lpTSCall1Ans21->GetInt64(LDBIZ_EXGP_ROW_ID_INT64);
      v_co_no = lpTSCall1Ans21->GetInt32(LDBIZ_CO_NO_INT);
      v_pd_no = lpTSCall1Ans21->GetInt32(LDBIZ_PD_NO_INT);
      v_exgp_begin_amt = lpTSCall1Ans21->GetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT);
      v_exgp_curr_amt = lpTSCall1Ans21->GetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT);
      v_exgp_frozen_amt = lpTSCall1Ans21->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
      v_exgp_unfroz_amt = lpTSCall1Ans21->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
      v_exgp_comm_frozen_amt = lpTSCall1Ans21->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
      v_exgp_comm_unfroz_amt = lpTSCall1Ans21->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
      v_exgp_comm_capt_amt = lpTSCall1Ans21->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
      v_exgp_comm_releas_amt = lpTSCall1Ans21->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
      v_exgp_trade_capt_amt = lpTSCall1Ans21->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
      v_exgp_trade_releas_amt = lpTSCall1Ans21->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
      v_exgp_strike_capt_amt = lpTSCall1Ans21->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
      v_exgp_strike_releas_amt = lpTSCall1Ans21->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
      v_exgp_capt_margin = lpTSCall1Ans21->GetDouble(LDBIZ_EXGP_CAPT_MARGIN_FLOAT);
      v_exgp_trade_fee = lpTSCall1Ans21->GetDouble(LDBIZ_EXGP_TRADE_FEE_FLOAT);
      v_exgp_strike_fee = lpTSCall1Ans21->GetDouble(LDBIZ_EXGP_STRIKE_FEE_FLOAT);
      v_exgp_close_pandl = lpTSCall1Ans21->GetDouble(LDBIZ_EXGP_CLOSE_PANDL_FLOAT);
      v_exgp_marked_pandl = lpTSCall1Ans21->GetDouble(LDBIZ_EXGP_MARKED_PANDL_FLOAT);
      v_exgp_cash_update_times = lpTSCall1Ans21->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
      v_asac_row_id = lpTSCall1Ans21->GetInt64(LDBIZ_ASAC_ROW_ID_INT64);
      v_asac_begin_amt = lpTSCall1Ans21->GetDouble(LDBIZ_ASAC_BEGIN_AMT_FLOAT);
      v_asac_curr_amt = lpTSCall1Ans21->GetDouble(LDBIZ_ASAC_CURR_AMT_FLOAT);
      v_asac_frozen_amt = lpTSCall1Ans21->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
      v_asac_unfroz_amt = lpTSCall1Ans21->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
      v_asac_comm_frozen_amt = lpTSCall1Ans21->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
      v_asac_comm_unfroz_amt = lpTSCall1Ans21->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
      v_asac_comm_capt_amt = lpTSCall1Ans21->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
      v_asac_comm_releas_amt = lpTSCall1Ans21->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
      v_asac_trade_capt_amt = lpTSCall1Ans21->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
      v_asac_trade_releas_amt = lpTSCall1Ans21->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
      v_asac_strike_capt_amt = lpTSCall1Ans21->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
      v_asac_strike_releas_amt = lpTSCall1Ans21->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
      v_asac_capt_margin = lpTSCall1Ans21->GetDouble(LDBIZ_ASAC_CAPT_MARGIN_FLOAT);
      v_asac_trade_fee = lpTSCall1Ans21->GetDouble(LDBIZ_ASAC_TRADE_FEE_FLOAT);
      v_asac_strike_fee = lpTSCall1Ans21->GetDouble(LDBIZ_ASAC_STRIKE_FEE_FLOAT);
      v_asac_close_pandl = lpTSCall1Ans21->GetDouble(LDBIZ_ASAC_CLOSE_PANDL_FLOAT);
      v_asac_marked_pandl = lpTSCall1Ans21->GetDouble(LDBIZ_ASAC_MARKED_PANDL_FLOAT);
      v_asac_cash_update_times = lpTSCall1Ans21->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);


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

      //调用过程[事务_交易期货_账户_获取交易组资产账户持仓]
      //组织事务请求
      if(lpTSCall1Ans22)
      {
        lpTSCall1Ans22->FreeMsg();
        lpTSCall1Ans22=NULL;
      }
      lpTSCall1Req22=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.12", 0);
      lpTSCall1Req22->SetInt32(LDTAG_PRIORITY, iPriority);
      lpTSCall1Req22->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
      lpTSCall1Req22->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
      lpTSCall1Req22->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
      lpTSCall1Req22->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
      lpTSCall1Req22->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
      lpTSCall1Req22->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
      lpTSCall1Req22->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
      lpTSCall1Req22->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
      lpTSCall1Req22->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpTSCall1Req22->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
      lpTSCall1Req22->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
      lpTSCall1Req22->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
      lpTSCall1Req22->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
      glpTSSubcallSerives->SubCall(lpTSCall1Req22, &lpTSCall1Ans22, 5000);
      if(!lpTSCall1Ans22)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.12]subcall timed out!");
          iRet=-2;
          goto ENDSYS;
      }
      else if(lpTSCall1Ans22->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans22->GetInt32(LDTAG_ERRORNO));
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans22->GetString(LDTAG_ERRORINFO));
          iRet=-2;
          goto ENDSYS;
      }
      else if(strcmp(lpTSCall1Ans22->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
      {
          strcpy(v_error_code, lpTSCall1Ans22->GetString(LDBIZ_ERROR_CODE_STR));
          strcpy(v_error_info, lpTSCall1Ans22->GetString(LDBIZ_ERROR_INFO_STR));
          iRet=-1;
          goto END;
      }
      //获取输出参数值
      strcpy(v_error_code, lpTSCall1Ans22->GetString(LDBIZ_ERROR_CODE_STR));
      strcpy(v_error_info, lpTSCall1Ans22->GetString(LDBIZ_ERROR_INFO_STR));
      v_exgp_row_id = lpTSCall1Ans22->GetInt64(LDBIZ_EXGP_ROW_ID_INT64);
      v_co_no = lpTSCall1Ans22->GetInt32(LDBIZ_CO_NO_INT);
      v_pd_no = lpTSCall1Ans22->GetInt32(LDBIZ_PD_NO_INT);
      strcpy(v_exch_crncy_type, lpTSCall1Ans22->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
      v_contrc_type = lpTSCall1Ans22->GetInt32(LDBIZ_CONTRC_TYPE_INT);
      v_contrc_unit = lpTSCall1Ans22->GetInt32(LDBIZ_CONTRC_UNIT_INT);
      strcpy(v_comb_code, lpTSCall1Ans22->GetString(LDBIZ_COMB_CODE_STR));
      v_exgp_frozen_qty = lpTSCall1Ans22->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
      v_exgp_unfroz_qty = lpTSCall1Ans22->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
      v_exgp_comm_releas_qty = lpTSCall1Ans22->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
      v_exgp_trade_releas_qty = lpTSCall1Ans22->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
      v_exgp_strike_releas_qty = lpTSCall1Ans22->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
      v_exgp_old_comm_capt_qty = lpTSCall1Ans22->GetDouble(LDBIZ_EXGP_OLD_COMM_CAPT_QTY_FLOAT);
      v_exgp_today_comm_capt_qty = lpTSCall1Ans22->GetDouble(LDBIZ_EXGP_TODAY_COMM_CAPT_QTY_FLOAT);
      v_exgp_old_trade_capt_qty = lpTSCall1Ans22->GetDouble(LDBIZ_EXGP_OLD_TRADE_CAPT_QTY_FLOAT);
      v_exgp_today_trade_capt_qty = lpTSCall1Ans22->GetDouble(LDBIZ_EXGP_TODAY_TRADE_CAPT_QTY_FLOAT);
      v_exgp_pre_strike_capt_qty = lpTSCall1Ans22->GetDouble(LDBIZ_EXGP_PRE_STRIKE_CAPT_QTY_FLOAT);
      v_exgp_today_strike_capt_qty = lpTSCall1Ans22->GetDouble(LDBIZ_EXGP_TODAY_STRIKE_CAPT_QTY_FLOAT);
      v_exgp_rece_margin = lpTSCall1Ans22->GetDouble(LDBIZ_EXGP_RECE_MARGIN_FLOAT);
      v_pre_settle_price = lpTSCall1Ans22->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
      v_exgp_realize_pandl = lpTSCall1Ans22->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
      v_exgp_open_amount = lpTSCall1Ans22->GetDouble(LDBIZ_EXGP_OPEN_AMOUNT_FLOAT);
      v_exgp_posi_update_times = lpTSCall1Ans22->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
      v_asac_row_id = lpTSCall1Ans22->GetInt64(LDBIZ_ASAC_ROW_ID_INT64);
      v_asac_frozen_qty = lpTSCall1Ans22->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
      v_asac_unfroz_qty = lpTSCall1Ans22->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
      v_asac_comm_releas_qty = lpTSCall1Ans22->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
      v_asac_trade_releas_qty = lpTSCall1Ans22->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
      v_asac_strike_releas_qty = lpTSCall1Ans22->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
      v_asac_old_comm_capt_qty = lpTSCall1Ans22->GetDouble(LDBIZ_ASAC_OLD_COMM_CAPT_QTY_FLOAT);
      v_asac_today_comm_capt_qty = lpTSCall1Ans22->GetDouble(LDBIZ_ASAC_TODAY_COMM_CAPT_QTY_FLOAT);
      v_asac_old_trade_capt_qty = lpTSCall1Ans22->GetDouble(LDBIZ_ASAC_OLD_TRADE_CAPT_QTY_FLOAT);
      v_asac_today_trade_capt_qty = lpTSCall1Ans22->GetDouble(LDBIZ_ASAC_TODAY_TRADE_CAPT_QTY_FLOAT);
      v_asac_pre_strike_capt_qty = lpTSCall1Ans22->GetDouble(LDBIZ_ASAC_PRE_STRIKE_CAPT_QTY_FLOAT);
      v_asac_today_strike_capt_qty = lpTSCall1Ans22->GetDouble(LDBIZ_ASAC_TODAY_STRIKE_CAPT_QTY_FLOAT);
      v_asac_rece_margin = lpTSCall1Ans22->GetDouble(LDBIZ_ASAC_RECE_MARGIN_FLOAT);
      v_asac_realize_pandl = lpTSCall1Ans22->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
      v_asac_open_amount = lpTSCall1Ans22->GetDouble(LDBIZ_ASAC_OPEN_AMOUNT_FLOAT);
      v_asac_posi_update_times = lpTSCall1Ans22->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


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

    // end if;
    }


    // if @指令批号# > 0  then
    if (v_comm_batch_no > 0 )
    {
        //调用过程[事务_交易期货_指令_获取指令汇总]
        //组织事务请求
        if(lpTSCall1Ans23)
        {
          lpTSCall1Ans23->FreeMsg();
          lpTSCall1Ans23=NULL;
        }
        lpTSCall1Req23=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.4", 0);
        lpTSCall1Req23->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req23->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req23->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req23->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req23->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req23->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req23->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req23->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req23->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
        lpTSCall1Req23->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpTSCall1Req23->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req23->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
        glpTSSubcallSerives->SubCall(lpTSCall1Req23, &lpTSCall1Ans23, 5000);
        if(!lpTSCall1Ans23)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.4]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans23->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans23->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans23->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans23->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans23->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans23->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans23->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans23->GetString(LDBIZ_ERROR_INFO_STR));
        v_row_id = lpTSCall1Ans23->GetInt64(LDBIZ_ROW_ID_INT64);
        v_init_date = lpTSCall1Ans23->GetInt32(LDBIZ_INIT_DATE_INT);
        v_pd_no = lpTSCall1Ans23->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans23->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans23->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        strcpy(v_exch_crncy_type, lpTSCall1Ans23->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans23->GetInt32(LDBIZ_EXCH_NO_INT);
        v_futu_acco_no = lpTSCall1Ans23->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
        v_contrc_code_no = lpTSCall1Ans23->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans23->GetString(LDBIZ_CONTRC_CODE_STR));
        v_contrc_type = lpTSCall1Ans23->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_asset_type = lpTSCall1Ans23->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_dir = lpTSCall1Ans23->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans23->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_comm_time = lpTSCall1Ans23->GetInt32(LDBIZ_COMM_TIME_INT);
        v_comm_opor = lpTSCall1Ans23->GetInt32(LDBIZ_COMM_OPOR_INT);
        v_comm_dir = lpTSCall1Ans23->GetInt32(LDBIZ_COMM_DIR_INT);
        v_comm_limit_price = lpTSCall1Ans23->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
        v_limit_actual_price = lpTSCall1Ans23->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
        v_comm_qty = lpTSCall1Ans23->GetDouble(LDBIZ_COMM_QTY_FLOAT);
        v_comm_amt = lpTSCall1Ans23->GetDouble(LDBIZ_COMM_AMT_FLOAT);
        v_order_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_comm_cancel_qty = lpTSCall1Ans23->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
        v_comm_await_cancel_qty = lpTSCall1Ans23->GetDouble(LDBIZ_COMM_AWAIT_CANCEL_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans23->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_strike_qty = lpTSCall1Ans23->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        strcpy(v_strike_status, lpTSCall1Ans23->GetString(LDBIZ_STRIKE_STATUS_STR));
        strcpy(v_comm_sum_status, lpTSCall1Ans23->GetString(LDBIZ_COMM_SUM_STATUS_STR));
        v_comm_begin_date = lpTSCall1Ans23->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
        v_comm_end_date = lpTSCall1Ans23->GetInt32(LDBIZ_COMM_END_DATE_INT);
        v_comm_begin_time = lpTSCall1Ans23->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
        v_comm_end_time = lpTSCall1Ans23->GetInt32(LDBIZ_COMM_END_TIME_INT);
        v_comm_comple_date = lpTSCall1Ans23->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
        v_comm_comple_time = lpTSCall1Ans23->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
        v_max_comm_comple_date = lpTSCall1Ans23->GetInt32(LDBIZ_MAX_COMM_COMPLE_DATE_INT);
        v_max_comm_comple_time = lpTSCall1Ans23->GetInt32(LDBIZ_MAX_COMM_COMPLE_TIME_INT);
        v_comm_appr_date = lpTSCall1Ans23->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
        v_comm_appr_time = lpTSCall1Ans23->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
        v_comm_appr_qty = lpTSCall1Ans23->GetDouble(LDBIZ_COMM_APPR_QTY_FLOAT);
        strcpy(v_comm_sum_approve_status, lpTSCall1Ans23->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
        v_buy_order_qty = lpTSCall1Ans23->GetDouble(LDBIZ_BUY_ORDER_QTY_FLOAT);
        v_sell_order_qty = lpTSCall1Ans23->GetDouble(LDBIZ_SELL_ORDER_QTY_FLOAT);
        v_buy_comm_qty = lpTSCall1Ans23->GetDouble(LDBIZ_BUY_COMM_QTY_FLOAT);
        v_sell_comm_qty = lpTSCall1Ans23->GetDouble(LDBIZ_SELL_COMM_QTY_FLOAT);
        v_buy_strike_qty = lpTSCall1Ans23->GetDouble(LDBIZ_BUY_STRIKE_QTY_FLOAT);
        v_sell_strike_qty = lpTSCall1Ans23->GetDouble(LDBIZ_SELL_STRIKE_QTY_FLOAT);
        v_buy_strike_amt = lpTSCall1Ans23->GetDouble(LDBIZ_BUY_STRIKE_AMT_FLOAT);
        v_sell_strike_amt = lpTSCall1Ans23->GetDouble(LDBIZ_SELL_STRIKE_AMT_FLOAT);
        v_buy_comm_amt = lpTSCall1Ans23->GetDouble(LDBIZ_BUY_COMM_AMT_FLOAT);
        v_sell_comm_amt = lpTSCall1Ans23->GetDouble(LDBIZ_SELL_COMM_AMT_FLOAT);
        v_rece_margin = lpTSCall1Ans23->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_comm_oper_way, lpTSCall1Ans23->GetString(LDBIZ_COMM_OPER_WAY_STR));
        v_update_times = lpTSCall1Ans23->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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

    //订单汇总主推

    // if @订单批号#>0 then
    if (v_order_batch_no>0)
    {
        //调用过程[事务_交易期货_交易_获取订单汇总]
        //组织事务请求
        if(lpTSCall1Ans24)
        {
          lpTSCall1Ans24->FreeMsg();
          lpTSCall1Ans24=NULL;
        }
        lpTSCall1Req24=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.19", 0);
        lpTSCall1Req24->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req24->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req24->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req24->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req24->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req24->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req24->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req24->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req24->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpTSCall1Req24->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
        lpTSCall1Req24->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req24, &lpTSCall1Ans24, 5000);
        if(!lpTSCall1Ans24)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.19]subcall timed out!");
            iRet=-2;
            goto ENDSYS;
        }
        else if(lpTSCall1Ans24->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans24->GetInt32(LDTAG_ERRORNO));
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans24->GetString(LDTAG_ERRORINFO));
            iRet=-2;
            goto ENDSYS;
        }
        else if(strcmp(lpTSCall1Ans24->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
        {
            strcpy(v_error_code, lpTSCall1Ans24->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans24->GetString(LDBIZ_ERROR_INFO_STR));
            iRet=-1;
            goto END;
        }
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans24->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans24->GetString(LDBIZ_ERROR_INFO_STR));
        v_row_id = lpTSCall1Ans24->GetInt64(LDBIZ_ROW_ID_INT64);
        strcpy(v_oper_func_code, lpTSCall1Ans24->GetString(LDBIZ_OPER_FUNC_CODE_STR));
        v_init_date = lpTSCall1Ans24->GetInt32(LDBIZ_INIT_DATE_INT);
        v_pd_no = lpTSCall1Ans24->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans24->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans24->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans24->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_crncy_type, lpTSCall1Ans24->GetString(LDBIZ_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans24->GetInt32(LDBIZ_EXCH_NO_INT);
        v_contrc_code_no = lpTSCall1Ans24->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans24->GetString(LDBIZ_CONTRC_CODE_STR));
        v_asset_type = lpTSCall1Ans24->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_type = lpTSCall1Ans24->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_contrc_unit = lpTSCall1Ans24->GetInt32(LDBIZ_CONTRC_UNIT_INT);
        v_external_no = lpTSCall1Ans24->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
        v_order_dir = lpTSCall1Ans24->GetInt32(LDBIZ_ORDER_DIR_INT);
        v_contrc_dir = lpTSCall1Ans24->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans24->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_order_price = lpTSCall1Ans24->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans24->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        strcpy(v_order_sum_status, lpTSCall1Ans24->GetString(LDBIZ_ORDER_SUM_STATUS_STR));
        v_wtdraw_qty = lpTSCall1Ans24->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
        v_waste_qty = lpTSCall1Ans24->GetDouble(LDBIZ_WASTE_QTY_FLOAT);
        v_strike_qty = lpTSCall1Ans24->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_strike_aver_price = lpTSCall1Ans24->GetDouble(LDBIZ_STRIKE_AVER_PRICE_FLOAT);
        v_strike_amt = lpTSCall1Ans24->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_trade_fee = lpTSCall1Ans24->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
        v_trade_commis = lpTSCall1Ans24->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_other_commis = lpTSCall1Ans24->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_strike_commis = lpTSCall1Ans24->GetDouble(LDBIZ_STRIKE_COMMIS_FLOAT);
        v_strike_other_commis = lpTSCall1Ans24->GetDouble(LDBIZ_STRIKE_OTHER_COMMIS_FLOAT);
        v_report_fee = lpTSCall1Ans24->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
        v_wtdraw_fee = lpTSCall1Ans24->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
        v_strike_all_fee = lpTSCall1Ans24->GetDouble(LDBIZ_STRIKE_ALL_FEE_FLOAT);
        v_rece_margin = lpTSCall1Ans24->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_order_oper_way, lpTSCall1Ans24->GetString(LDBIZ_ORDER_OPER_WAY_STR));
        v_update_times = lpTSCall1Ans24->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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
        if(lpTSCall1Ans25)
        {
          lpTSCall1Ans25->FreeMsg();
          lpTSCall1Ans25=NULL;
        }
        lpTSCall1Req25=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req25->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req25->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req25->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req25->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req25->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req25->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req25->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req25->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req25->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req25->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req25, &lpTSCall1Ans25, 5000);
        if (lpTSCall1Ans25)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans25->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans25->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans25->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans25->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans25->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
    lpOutBizMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpOutBizMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpOutBizMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpOutBizMsg->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
    lpOutBizMsg->SetInt32(LDBIZ_WTDRAW_DATE_INT,v_wtdraw_date);
    lpOutBizMsg->SetInt32(LDBIZ_WTDRAW_TIME_INT,v_wtdraw_time);
    lpOutBizMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
    lpOutBizMsg->SetString(LDBIZ_WTDRAW_STATUS_STR,v_wtdraw_status);
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
    if(lpTSCall1Ans19)
        lpTSCall1Ans19->FreeMsg();
    if(lpTSCall1Ans20)
        lpTSCall1Ans20->FreeMsg();
    if(lpTSCall1Ans21)
        lpTSCall1Ans21->FreeMsg();
    if(lpTSCall1Ans22)
        lpTSCall1Ans22->FreeMsg();
    if(lpTSCall1Ans23)
        lpTSCall1Ans23->FreeMsg();
    if(lpTSCall1Ans24)
        lpTSCall1Ans24->FreeMsg();
    if(lpTSCall1Ans25)
        lpTSCall1Ans25->FreeMsg();
    return iRet;
}

//逻辑_交易期货_报盘_处理成交回报
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
    int v_pass_no;
    int v_exch_no;
    char v_out_acco[33];
    char v_futu_acco[17];
    char v_contrc_code[7];
    int v_contrc_dir;
    int v_hedge_type;
    int v_report_date;
    char v_report_no[33];
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    int v_order_dir;
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    char v_rsp_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_external_no;
    int v_contrc_type;
    int v_order_batch_no;
    int64 v_order_id;
    double v_order_qty;
    double v_order_price;
    char v_order_status[3];
    int v_asset_type;
    double v_curr_qty;
    double v_old_trade_capt_qty;
    double v_today_trade_capt_qty;
    double v_pre_strike_capt_qty;
    double v_today_strike_capt_qty;
    double v_trade_releas_qty;
    double v_strike_releas_qty;
    double v_open_amount;
    double v_curr_amt;
    double v_begin_amt;
    double v_trade_capt_amt;
    double v_trade_releas_amt;
    double v_strike_capt_amt;
    double v_strike_releas_amt;
    double v_close_pandl;
    double v_realize_pandl;
    double v_trade_fee;
    double v_strike_fee;
    double v_all_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_capt_margin;
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_tmp_strike_no[65];
    int v_lngsht_type;
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    int v_contrc_code_no;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_futu_acco_no;
    int v_contrc_unit;
    int v_order_date;
    int v_rsp_time;
    int v_rsp_no;
    char v_comb_code[7];
    int64 v_comm_id;
    int v_comm_batch_no;
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
    double v_strike_margin;
    double v_margin_ratio;
    double v_pre_settle_price;
    double v_up_limit_price;
    double v_down_limit_price;
    double v_last_price;
    int v_mach_date;
    int v_mach_time;
    int v_calc_dir;
    int v_invest_type;
    int v_report_time;
    int v_order_time;
    double v_wtdraw_qty;
    int v_record_count;
    int64 v_strike_id;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_posi_qty;
    double v_rece_margin;
    double v_posi_capt_amt;
    double v_strike_occur_amt;
    double v_order_margin;
    int64 v_detail_posi_id;
    int64 v_compli_trig_id;
    int v_order_update_times;
    char v_order_oper_way[3];
    int v_update_times;
    int v_busi_opor_no;
    int64 v_row_id;
    int v_comm_date;
    int v_comm_time;
    int v_comm_opor;
    int v_comm_executor;
    int v_comm_dir;
    double v_comm_limit_price;
    double v_limit_actual_price;
    double v_comm_qty;
    double v_comm_amt;
    double v_comm_cancel_qty;
    double v_comm_frozen_amt;
    double v_comm_frozen_qty;
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
    char v_comm_oper_way[3];
    char v_remark_info[256];
    int v_comm_comple_flag;
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
    double v_marked_pandl;
    int v_open_posi_date;
    int v_open_posi_time;
    double v_open_posi_price;
    double v_open_posi_qty;
    double v_open_posi_fee;
    double v_close_posi_fee;
    double v_trade_capt_qty;
    double v_strike_capt_qty;
    double v_marked_sett_price;
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
    v_pass_no=0;
    v_exch_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_futu_acco, " ");
    strcpy(v_contrc_code, " ");
    v_contrc_dir=0;
    v_hedge_type=0;
    v_report_date=0;
    strcpy(v_report_no, " ");
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_order_dir=0;
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    strcpy(v_rsp_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_external_no=0;
    v_contrc_type=0;
    v_order_batch_no=0;
    v_order_id=0;
    v_order_qty=0;
    v_order_price=0;
    strcpy(v_order_status, "0");
    v_asset_type=0;
    v_curr_qty=0;
    v_old_trade_capt_qty=0;
    v_today_trade_capt_qty=0;
    v_pre_strike_capt_qty=0;
    v_today_strike_capt_qty=0;
    v_trade_releas_qty=0;
    v_strike_releas_qty=0;
    v_open_amount=0;
    v_curr_amt=0;
    v_begin_amt=0;
    v_trade_capt_amt=0;
    v_trade_releas_amt=0;
    v_strike_capt_amt=0;
    v_strike_releas_amt=0;
    v_close_pandl=0;
    v_realize_pandl=0;
    v_trade_fee=0;
    v_strike_fee=0;
    v_all_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_capt_margin=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_tmp_strike_no, " ");
    v_lngsht_type=0;
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_contrc_code_no=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_futu_acco_no=0;
    v_contrc_unit=0;
    v_order_date=0;
    v_rsp_time=0;
    v_rsp_no=0;
    strcpy(v_comb_code, " ");
    v_comm_id=0;
    v_comm_batch_no=0;
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
    v_strike_margin=0;
    v_margin_ratio=0;
    v_pre_settle_price=0;
    v_up_limit_price=0;
    v_down_limit_price=0;
    v_last_price=0;
    v_mach_date=0;
    v_mach_time=0;
    v_calc_dir=1;
    v_invest_type=0;
    v_report_time=0;
    v_order_time=0;
    v_wtdraw_qty=0;
    v_record_count=0;
    v_strike_id=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_posi_qty=0;
    v_rece_margin=0;
    v_posi_capt_amt=0;
    v_strike_occur_amt=0;
    v_order_margin=0;
    v_detail_posi_id=0;
    v_compli_trig_id=0;
    v_order_update_times=0;
    strcpy(v_order_oper_way, " ");
    v_update_times=1;
    v_busi_opor_no=0;
    v_row_id=0;
    v_comm_date=0;
    v_comm_time=0;
    v_comm_opor=0;
    v_comm_executor=0;
    v_comm_dir=0;
    v_comm_limit_price=0;
    v_limit_actual_price=0;
    v_comm_qty=0;
    v_comm_amt=0;
    v_comm_cancel_qty=0;
    v_comm_frozen_amt=0;
    v_comm_frozen_qty=0;
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
    strcpy(v_comm_oper_way, " ");
    strcpy(v_remark_info, " ");
    v_comm_comple_flag=0;
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
    v_marked_pandl=0;
    v_open_posi_date=0;
    v_open_posi_time=0;
    v_open_posi_price=0;
    v_open_posi_qty=0;
    v_open_posi_fee=0;
    v_close_posi_fee=0;
    v_trade_capt_qty=0;
    v_strike_capt_qty=0;
    v_marked_sett_price=0;
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
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    strncpy(v_out_acco, lpInBizMsg->GetString(LDBIZ_OUT_ACCO_STR),32);
    v_out_acco[32] = '\0';
    strncpy(v_futu_acco, lpInBizMsg->GetString(LDBIZ_FUTU_ACCO_STR),16);
    v_futu_acco[16] = '\0';
    strncpy(v_contrc_code, lpInBizMsg->GetString(LDBIZ_CONTRC_CODE_STR),6);
    v_contrc_code[6] = '\0';
    v_contrc_dir = lpInBizMsg->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpInBizMsg->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_report_date = lpInBizMsg->GetInt32(LDBIZ_REPORT_DATE_INT);
    strncpy(v_report_no, lpInBizMsg->GetString(LDBIZ_REPORT_NO_STR),32);
    v_report_no[32] = '\0';
    v_strike_date = lpInBizMsg->GetInt32(LDBIZ_STRIKE_DATE_INT);
    v_strike_time = lpInBizMsg->GetInt32(LDBIZ_STRIKE_TIME_INT);
    strncpy(v_strike_no, lpInBizMsg->GetString(LDBIZ_STRIKE_NO_STR),64);
    v_strike_no[64] = '\0';
    v_order_dir = lpInBizMsg->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_strike_price = lpInBizMsg->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
    v_strike_qty = lpInBizMsg->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpInBizMsg->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    strncpy(v_rsp_info, lpInBizMsg->GetString(LDBIZ_RSP_INFO_STR),255);
    v_rsp_info[255] = '\0';

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


    // set @临时_成交编号#=@成交编号#;
    strcpy(v_tmp_strike_no,v_strike_no);
    //根据订单方向和开平方向确定多空类型

    // if @开平方向# = 《开平方向-开仓》 then
    if (v_contrc_dir == 1)
    {

      // set @多空类型# = @订单方向#;
      v_lngsht_type = v_order_dir;
    }
    // else
    else
    {


      // if @订单方向# = 《订单方向-买入》 then
      if (v_order_dir == 1)
      {

        // set @多空类型# = 《多空类型-空头》;
        v_lngsht_type = 2;
      }
      // else
      else
      {


        // set @多空类型# = 《多空类型-多头》;
        v_lngsht_type = 1;
      // end if;
      }

    // end if;
    }

    //公共子系统检查
    //调用过程[事务_公共_交易接口_检查期货回报业务控制]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.25.230", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req1->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.230]subcall timed out!");
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
    strcpy(v_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_CRNCY_TYPE_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_contrc_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_contrc_type = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_TYPE_INT);

    //检查重复回报并获得成交的订单信息
    //调用过程[事务_交易期货_报盘_检查成交回报获取订单信息]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("tdfutuT.5.31", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req2->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req2->SetString(LDBIZ_FUTU_ACCO_STR,v_futu_acco);
    lpTSCall1Req2->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpTSCall1Req2->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req2->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpTSCall1Req2->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpTSCall1Req2->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
    lpTSCall1Req2->SetInt32(LDBIZ_STRIKE_TIME_INT,v_strike_time);
    lpTSCall1Req2->SetString(LDBIZ_STRIKE_NO_STR,v_strike_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req2->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
    lpTSCall1Req2->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
    lpTSCall1Req2->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
    lpTSCall1Req2->SetString(LDBIZ_RSP_INFO_STR,v_rsp_info);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.5.31]subcall timed out!");
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
    v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans2->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_futu_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    v_contrc_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_contrc_type = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_unit = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_UNIT_INT);
    v_order_date = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_order_id = lpTSCall1Ans2->GetInt64(LDBIZ_ORDER_ID_INT64);
    v_rsp_time = lpTSCall1Ans2->GetInt32(LDBIZ_RSP_TIME_INT);
    v_rsp_no = lpTSCall1Ans2->GetInt32(LDBIZ_RSP_NO_INT);
    strcpy(v_comb_code, lpTSCall1Ans2->GetString(LDBIZ_COMB_CODE_STR));
    v_comm_id = lpTSCall1Ans2->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_hedge_type = lpTSCall1Ans2->GetInt32(LDBIZ_HEDGE_TYPE_INT);


    // set @成交金额# =@成交价格# * @成交数量#;
    v_strike_amt =v_strike_price * v_strike_qty;

    // set @成交金额# =@成交金额# * @合约乘数#;
    v_strike_amt =v_strike_amt * v_contrc_unit;
    //从产品期货的持仓表中获得交易组可用数量和资产账户可用数量
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

    //调用过程[事务_公共_公共接口_计算期货成交费用]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pubT.24.254", 0);
    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req4->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req4->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req4->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
    lpTSCall1Req4->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
    lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpTSCall1Req4->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req4->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.254]subcall timed out!");
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
    v_strike_margin = lpTSCall1Ans4->GetDouble(LDBIZ_STRIKE_MARGIN_FLOAT);
    v_trade_commis = lpTSCall1Ans4->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_other_commis = lpTSCall1Ans4->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    v_strike_fee = lpTSCall1Ans4->GetDouble(LDBIZ_STRIKE_FEE_FLOAT);
    v_margin_ratio = lpTSCall1Ans4->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);

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

    //成交回报处理
    //调用过程[事务_交易期货_报盘_处理成交回报]
    //组织事务请求
    if(lpTSCall1Ans6)
    {
      lpTSCall1Ans6->FreeMsg();
      lpTSCall1Ans6=NULL;
    }
    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdfutuT.5.21", 0);
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
    lpTSCall1Req6->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req6->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req6->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req6->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req6->SetString(LDBIZ_FUTU_ACCO_STR,v_futu_acco);
    lpTSCall1Req6->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpTSCall1Req6->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpTSCall1Req6->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req6->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req6->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req6->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpTSCall1Req6->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpTSCall1Req6->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req6->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req6->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req6->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
    lpTSCall1Req6->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
    lpTSCall1Req6->SetInt32(LDBIZ_STRIKE_TIME_INT,v_strike_time);
    lpTSCall1Req6->SetString(LDBIZ_STRIKE_NO_STR,v_strike_no);
    lpTSCall1Req6->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
    lpTSCall1Req6->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
    lpTSCall1Req6->SetDouble(LDBIZ_STRIKE_FEE_FLOAT,v_strike_fee);
    lpTSCall1Req6->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
    lpTSCall1Req6->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
    lpTSCall1Req6->SetString(LDBIZ_RSP_INFO_STR,v_rsp_info);
    lpTSCall1Req6->SetInt32(LDBIZ_RSP_NO_INT,v_rsp_no);
    lpTSCall1Req6->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpTSCall1Req6->SetDouble(LDBIZ_STRIKE_MARGIN_FLOAT,v_strike_margin);
    lpTSCall1Req6->SetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT,v_exgp_long_rece_margin);
    lpTSCall1Req6->SetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT,v_exgp_short_rece_margin);
    lpTSCall1Req6->SetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT,v_asac_long_rece_margin);
    lpTSCall1Req6->SetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT,v_asac_short_rece_margin);
    lpTSCall1Req6->SetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT,v_exgp_avail_qty);
    lpTSCall1Req6->SetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT,v_asac_avail_qty);
    lpTSCall1Req6->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpTSCall1Req6->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req6->SetDouble(LDBIZ_EXGP_LONG_STOCK_RECE_MARGIN_FLOAT,v_exgp_long_stock_rece_margin);
    lpTSCall1Req6->SetDouble(LDBIZ_EXGP_SHORT_STOCK_RECE_MARGIN_FLOAT,v_exgp_short_stock_rece_margin);
    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
    if(!lpTSCall1Ans6)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.5.21]subcall timed out!");
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
    v_mach_date = lpTSCall1Ans6->GetInt32(LDBIZ_MACH_DATE_INT);
    v_mach_time = lpTSCall1Ans6->GetInt32(LDBIZ_MACH_TIME_INT);
    v_futu_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    v_contrc_code_no = lpTSCall1Ans6->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_external_no = lpTSCall1Ans6->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_calc_dir = lpTSCall1Ans6->GetInt32(LDBIZ_CALC_DIR_INT);
    v_asset_type = lpTSCall1Ans6->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_invest_type = lpTSCall1Ans6->GetInt32(LDBIZ_INVEST_TYPE_INT);
    v_report_time = lpTSCall1Ans6->GetInt32(LDBIZ_REPORT_TIME_INT);
    v_order_date = lpTSCall1Ans6->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_order_time = lpTSCall1Ans6->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_order_qty = lpTSCall1Ans6->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_price = lpTSCall1Ans6->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    strcpy(v_order_status, lpTSCall1Ans6->GetString(LDBIZ_ORDER_STATUS_STR));
    v_order_batch_no = lpTSCall1Ans6->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_wtdraw_qty = lpTSCall1Ans6->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_record_count = lpTSCall1Ans6->GetInt32(LDBIZ_RECORD_COUNT_INT);
    v_strike_id = lpTSCall1Ans6->GetInt64(LDBIZ_STRIKE_ID_INT64);
    v_report_fee = lpTSCall1Ans6->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
    v_wtdraw_fee = lpTSCall1Ans6->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
    v_trade_fee = lpTSCall1Ans6->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
    v_all_fee = lpTSCall1Ans6->GetDouble(LDBIZ_ALL_FEE_FLOAT);
    v_posi_qty = lpTSCall1Ans6->GetDouble(LDBIZ_POSI_QTY_FLOAT);
    v_rece_margin = lpTSCall1Ans6->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_margin_ratio = lpTSCall1Ans6->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);
    v_trade_capt_amt = lpTSCall1Ans6->GetDouble(LDBIZ_TRADE_CAPT_AMT_FLOAT);
    v_posi_capt_amt = lpTSCall1Ans6->GetDouble(LDBIZ_POSI_CAPT_AMT_FLOAT);
    v_strike_occur_amt = lpTSCall1Ans6->GetDouble(LDBIZ_STRIKE_OCCUR_AMT_FLOAT);
    v_realize_pandl = lpTSCall1Ans6->GetDouble(LDBIZ_REALIZE_PANDL_FLOAT);
    v_close_pandl = lpTSCall1Ans6->GetDouble(LDBIZ_CLOSE_PANDL_FLOAT);
    v_order_margin = lpTSCall1Ans6->GetDouble(LDBIZ_ORDER_MARGIN_FLOAT);
    v_detail_posi_id = lpTSCall1Ans6->GetInt64(LDBIZ_DETAIL_POSI_ID_INT64);
    v_compli_trig_id = lpTSCall1Ans6->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);
    v_order_update_times = lpTSCall1Ans6->GetInt32(LDBIZ_ORDER_UPDATE_TIMES_INT);
    strcpy(v_order_oper_way, lpTSCall1Ans6->GetString(LDBIZ_ORDER_OPER_WAY_STR));
    v_update_times = lpTSCall1Ans6->GetInt32(LDBIZ_UPDATE_TIMES_INT);
    v_busi_opor_no = lpTSCall1Ans6->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);


    // set @操作员编号#=@业务操作员编号#;
    v_opor_no=v_busi_opor_no;

    // set @记录序号#=@成交序号#;
    v_row_id=v_strike_id;

    // set @本币币种#="CNY";
    strcpy(v_crncy_type,"CNY");

    // set @成交编号#=@临时_成交编号#;
    strcpy(v_strike_no,v_tmp_strike_no);

    // [主动推送][futu.report][期货主推_报盘_成交回报主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.100", 0);
    lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetString(LDBIZ_FUTU_ACCO_STR,v_futu_acco);
    lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpPubMsg->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpPubMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpPubMsg->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpPubMsg->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
    lpPubMsg->SetInt32(LDBIZ_STRIKE_TIME_INT,v_strike_time);
    lpPubMsg->SetString(LDBIZ_STRIKE_NO_STR,v_strike_no);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_FEE_FLOAT,v_strike_fee);
    lpPubMsg->SetDouble(LDBIZ_CLOSE_PANDL_FLOAT,v_close_pandl);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_MARGIN_FLOAT,v_strike_margin);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_OCCUR_AMT_FLOAT,v_strike_occur_amt);
    lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("futu.report", lpPubMsg);


    // set @记录序号#=@订单序号#;
    v_row_id=v_order_id;

    // set @回报信息#="已成交";
    strcpy(v_rsp_info,"已成交");

    // set @成交数量#=@持仓数量#;
    v_strike_qty=v_posi_qty;

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

    //指令主推

    // if @指令序号# > 0 then
    if (v_comm_id > 0)
    {
        //调用过程[事务_交易期货_指令_获取指令]
        //组织事务请求
        if(lpTSCall1Ans7)
        {
          lpTSCall1Ans7->FreeMsg();
          lpTSCall1Ans7=NULL;
        }
        lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.3", 0);
        lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req7->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
        glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
        if(!lpTSCall1Ans7)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.3]subcall timed out!");
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
        v_row_id = lpTSCall1Ans7->GetInt64(LDBIZ_ROW_ID_INT64);
        v_init_date = lpTSCall1Ans7->GetInt32(LDBIZ_INIT_DATE_INT);
        v_co_no = lpTSCall1Ans7->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans7->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans7->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans7->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        strcpy(v_exch_crncy_type, lpTSCall1Ans7->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans7->GetInt32(LDBIZ_EXCH_NO_INT);
        v_futu_acco_no = lpTSCall1Ans7->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
        v_contrc_code_no = lpTSCall1Ans7->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans7->GetString(LDBIZ_CONTRC_CODE_STR));
        v_contrc_type = lpTSCall1Ans7->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_asset_type = lpTSCall1Ans7->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_dir = lpTSCall1Ans7->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans7->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_comm_date = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_DATE_INT);
        v_comm_time = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_TIME_INT);
        v_comm_batch_no = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
        v_comm_opor = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_OPOR_INT);
        v_comm_executor = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
        v_comm_dir = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_DIR_INT);
        v_comm_limit_price = lpTSCall1Ans7->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
        v_limit_actual_price = lpTSCall1Ans7->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
        v_comm_qty = lpTSCall1Ans7->GetDouble(LDBIZ_COMM_QTY_FLOAT);
        v_comm_amt = lpTSCall1Ans7->GetDouble(LDBIZ_COMM_AMT_FLOAT);
        v_order_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_comm_cancel_qty = lpTSCall1Ans7->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans7->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_strike_qty = lpTSCall1Ans7->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_comm_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
        v_comm_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
        v_rece_margin = lpTSCall1Ans7->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        v_capit_reback_days = lpTSCall1Ans7->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
        v_posi_reback_days = lpTSCall1Ans7->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
        strcpy(v_strike_status, lpTSCall1Ans7->GetString(LDBIZ_STRIKE_STATUS_STR));
        strcpy(v_comm_status, lpTSCall1Ans7->GetString(LDBIZ_COMM_STATUS_STR));
        v_comm_begin_date = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
        v_comm_end_date = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_END_DATE_INT);
        v_comm_begin_time = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
        v_comm_end_time = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_END_TIME_INT);
        v_comm_comple_date = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
        v_comm_comple_time = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
        v_comm_appr_date = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
        v_comm_appr_time = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
        strcpy(v_comm_appr_status, lpTSCall1Ans7->GetString(LDBIZ_COMM_APPR_STATUS_STR));
        v_comm_appr_oper_no = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_APPR_OPER_NO_INT);
        v_comm_appr_oper = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
        strcpy(v_comm_appr_remark, lpTSCall1Ans7->GetString(LDBIZ_COMM_APPR_REMARK_STR));
        v_external_no = lpTSCall1Ans7->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
        strcpy(v_comb_code, lpTSCall1Ans7->GetString(LDBIZ_COMB_CODE_STR));
        strcpy(v_comm_oper_way, lpTSCall1Ans7->GetString(LDBIZ_COMM_OPER_WAY_STR));
        strcpy(v_remark_info, lpTSCall1Ans7->GetString(LDBIZ_REMARK_INFO_STR));
        v_comm_comple_flag = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
        v_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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

    // end if;
    }

    //主推交易组和资产账户资金
    //调用过程[事务_交易期货_账户_获取交易组资产账户资金]
    //组织事务请求
    if(lpTSCall1Ans8)
    {
      lpTSCall1Ans8->FreeMsg();
      lpTSCall1Ans8=NULL;
    }
    lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.11", 0);
    lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req8->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req8->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req8->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
    if(!lpTSCall1Ans8)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.11]subcall timed out!");
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
    v_exgp_begin_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT);
    v_exgp_curr_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT);
    v_exgp_frozen_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
    v_exgp_unfroz_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
    v_exgp_comm_frozen_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
    v_exgp_comm_unfroz_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
    v_exgp_comm_capt_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
    v_exgp_comm_releas_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
    v_exgp_trade_capt_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
    v_exgp_trade_releas_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
    v_exgp_strike_capt_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
    v_exgp_strike_releas_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
    v_exgp_capt_margin = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_CAPT_MARGIN_FLOAT);
    v_exgp_trade_fee = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_FEE_FLOAT);
    v_exgp_strike_fee = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_STRIKE_FEE_FLOAT);
    v_exgp_close_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_CLOSE_PANDL_FLOAT);
    v_exgp_marked_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_MARKED_PANDL_FLOAT);
    v_exgp_cash_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
    v_asac_row_id = lpTSCall1Ans8->GetInt64(LDBIZ_ASAC_ROW_ID_INT64);
    v_asac_begin_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_BEGIN_AMT_FLOAT);
    v_asac_curr_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_CURR_AMT_FLOAT);
    v_asac_frozen_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
    v_asac_unfroz_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
    v_asac_comm_frozen_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
    v_asac_comm_unfroz_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
    v_asac_comm_capt_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
    v_asac_comm_releas_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
    v_asac_trade_capt_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
    v_asac_trade_releas_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
    v_asac_strike_capt_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
    v_asac_strike_releas_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
    v_asac_capt_margin = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_CAPT_MARGIN_FLOAT);
    v_asac_trade_fee = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_FEE_FLOAT);
    v_asac_strike_fee = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_STRIKE_FEE_FLOAT);
    v_asac_close_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_CLOSE_PANDL_FLOAT);
    v_asac_marked_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_MARKED_PANDL_FLOAT);
    v_asac_cash_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);


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
    if(lpTSCall1Ans9)
    {
      lpTSCall1Ans9->FreeMsg();
      lpTSCall1Ans9=NULL;
    }
    lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.12", 0);
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
    lpTSCall1Req9->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req9->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req9->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
    if(!lpTSCall1Ans9)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.12]subcall timed out!");
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
    v_exgp_row_id = lpTSCall1Ans9->GetInt64(LDBIZ_EXGP_ROW_ID_INT64);
    v_co_no = lpTSCall1Ans9->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans9->GetInt32(LDBIZ_PD_NO_INT);
    strcpy(v_exch_crncy_type, lpTSCall1Ans9->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_contrc_type = lpTSCall1Ans9->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_unit = lpTSCall1Ans9->GetInt32(LDBIZ_CONTRC_UNIT_INT);
    strcpy(v_comb_code, lpTSCall1Ans9->GetString(LDBIZ_COMB_CODE_STR));
    v_exgp_frozen_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
    v_exgp_unfroz_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
    v_exgp_comm_releas_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
    v_exgp_trade_releas_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
    v_exgp_strike_releas_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
    v_exgp_old_comm_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_OLD_COMM_CAPT_QTY_FLOAT);
    v_exgp_today_comm_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TODAY_COMM_CAPT_QTY_FLOAT);
    v_exgp_old_trade_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_OLD_TRADE_CAPT_QTY_FLOAT);
    v_exgp_today_trade_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TODAY_TRADE_CAPT_QTY_FLOAT);
    v_exgp_pre_strike_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_PRE_STRIKE_CAPT_QTY_FLOAT);
    v_exgp_today_strike_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TODAY_STRIKE_CAPT_QTY_FLOAT);
    v_exgp_rece_margin = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_RECE_MARGIN_FLOAT);
    v_pre_settle_price = lpTSCall1Ans9->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
    v_exgp_realize_pandl = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
    v_exgp_open_amount = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_OPEN_AMOUNT_FLOAT);
    v_exgp_posi_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
    v_asac_row_id = lpTSCall1Ans9->GetInt64(LDBIZ_ASAC_ROW_ID_INT64);
    v_asac_frozen_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
    v_asac_unfroz_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
    v_asac_comm_releas_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
    v_asac_trade_releas_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
    v_asac_strike_releas_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
    v_asac_old_comm_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_OLD_COMM_CAPT_QTY_FLOAT);
    v_asac_today_comm_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TODAY_COMM_CAPT_QTY_FLOAT);
    v_asac_old_trade_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_OLD_TRADE_CAPT_QTY_FLOAT);
    v_asac_today_trade_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TODAY_TRADE_CAPT_QTY_FLOAT);
    v_asac_pre_strike_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_PRE_STRIKE_CAPT_QTY_FLOAT);
    v_asac_today_strike_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TODAY_STRIKE_CAPT_QTY_FLOAT);
    v_asac_rece_margin = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_RECE_MARGIN_FLOAT);
    v_asac_realize_pandl = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
    v_asac_open_amount = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_OPEN_AMOUNT_FLOAT);
    v_asac_posi_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


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


    // set @当前数量#=0;
    v_curr_qty=0;

    // set @期初金额#=@交易组期初金额#;
    v_begin_amt=v_exgp_begin_amt;

    // set @当前金额#=@交易组当前金额#;
    v_curr_amt=v_exgp_curr_amt;

    // set @交易占用金额#=@交易组交易占用金额#;
    v_trade_capt_amt=v_exgp_trade_capt_amt;

    // set @交易释放金额#=@交易组交易释放金额#;
    v_trade_releas_amt=v_exgp_trade_releas_amt;

    // set @成交占用金额#=@交易组成交占用金额#;
    v_strike_capt_amt=v_exgp_strike_capt_amt;

    // set @成交释放金额#=@交易组成交释放金额#;
    v_strike_releas_amt=v_exgp_strike_releas_amt;

    // set @占用保证金#=@交易组占用保证金#;
    v_capt_margin=v_exgp_capt_margin;

    // set @交易费用#=@交易组交易费用#;
    v_trade_fee=v_exgp_trade_fee;

    // set @成交费用#=@交易组成交费用#;
    v_strike_fee=v_exgp_strike_fee;

    // set @平仓盈亏#=@交易组平仓盈亏#;
    v_close_pandl=v_exgp_close_pandl;

    // set @盯市盈亏#=@交易组盯市盈亏#;
    v_marked_pandl=v_exgp_marked_pandl;

    // set @交易释放数量#=@交易组交易释放数量#;
    v_trade_releas_qty=v_exgp_trade_releas_qty;

    // set @成交释放数量#=@交易组成交释放数量#;
    v_strike_releas_qty=v_exgp_strike_releas_qty;

    // set @老仓交易占用数量#=@交易组老仓交易占用数量#;
    v_old_trade_capt_qty=v_exgp_old_trade_capt_qty;

    // set @今仓交易占用数量#=@交易组今仓交易占用数量#;
    v_today_trade_capt_qty=v_exgp_today_trade_capt_qty;

    // set @老仓成交占用数量#=@交易组老仓成交占用数量#;
    v_pre_strike_capt_qty=v_exgp_pre_strike_capt_qty;

    // set @今仓成交占用数量#=@交易组今仓成交占用数量#;
    v_today_strike_capt_qty=v_exgp_today_strike_capt_qty;

    // set @开仓金额#=@交易组开仓金额#;
    v_open_amount=v_exgp_open_amount;
    //主推交易组持仓明细

    // if @明细持仓序号# <> 0 then
    if (v_detail_posi_id != 0)
    {
      //调用过程[事务_交易期货_账户_获取交易组持仓明细]
      //组织事务请求
      if(lpTSCall1Ans10)
      {
        lpTSCall1Ans10->FreeMsg();
        lpTSCall1Ans10=NULL;
      }
      lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.13", 0);
      lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
      lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
      lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
      lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
      lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
      lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
      lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
      lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
      lpTSCall1Req10->SetInt64(LDBIZ_DETAIL_POSI_ID_INT64,v_detail_posi_id);
      glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
      if(!lpTSCall1Ans10)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.13]subcall timed out!");
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
      v_open_posi_date = lpTSCall1Ans10->GetInt32(LDBIZ_OPEN_POSI_DATE_INT);
      v_open_posi_time = lpTSCall1Ans10->GetInt32(LDBIZ_OPEN_POSI_TIME_INT);
      v_open_posi_price = lpTSCall1Ans10->GetDouble(LDBIZ_OPEN_POSI_PRICE_FLOAT);
      v_open_posi_qty = lpTSCall1Ans10->GetDouble(LDBIZ_OPEN_POSI_QTY_FLOAT);
      v_open_posi_fee = lpTSCall1Ans10->GetDouble(LDBIZ_OPEN_POSI_FEE_FLOAT);
      v_close_posi_fee = lpTSCall1Ans10->GetDouble(LDBIZ_CLOSE_POSI_FEE_FLOAT);
      v_trade_capt_qty = lpTSCall1Ans10->GetDouble(LDBIZ_TRADE_CAPT_QTY_FLOAT);
      v_strike_capt_qty = lpTSCall1Ans10->GetDouble(LDBIZ_STRIKE_CAPT_QTY_FLOAT);
      v_marked_sett_price = lpTSCall1Ans10->GetDouble(LDBIZ_MARKED_SETT_PRICE_FLOAT);
      v_rece_margin = lpTSCall1Ans10->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
      v_marked_pandl = lpTSCall1Ans10->GetDouble(LDBIZ_MARKED_PANDL_FLOAT);
      v_update_times = lpTSCall1Ans10->GetInt32(LDBIZ_UPDATE_TIMES_INT);


      // set @成交编号#=@临时_成交编号#;
      strcpy(v_strike_no,v_tmp_strike_no);

      // [主动推送][futu.posidetail][期货主推_持仓_交易组持仓明细主推消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.132", 0);
      lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
      lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      lpPubMsg->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
      lpPubMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
      lpPubMsg->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
      lpPubMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
      lpPubMsg->SetDouble(LDBIZ_CURR_QTY_FLOAT,v_curr_qty);
      lpPubMsg->SetInt32(LDBIZ_INVEST_TYPE_INT,v_invest_type);
      lpPubMsg->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
      lpPubMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
      lpPubMsg->SetInt32(LDBIZ_OPEN_POSI_DATE_INT,v_open_posi_date);
      lpPubMsg->SetInt32(LDBIZ_OPEN_POSI_TIME_INT,v_open_posi_time);
      lpPubMsg->SetDouble(LDBIZ_OPEN_POSI_PRICE_FLOAT,v_open_posi_price);
      lpPubMsg->SetDouble(LDBIZ_OPEN_POSI_QTY_FLOAT,v_open_posi_qty);
      lpPubMsg->SetDouble(LDBIZ_OPEN_AMOUNT_FLOAT,v_open_amount);
      lpPubMsg->SetDouble(LDBIZ_OPEN_POSI_FEE_FLOAT,v_open_posi_fee);
      lpPubMsg->SetDouble(LDBIZ_CLOSE_POSI_FEE_FLOAT,v_close_posi_fee);
      lpPubMsg->SetDouble(LDBIZ_TRADE_CAPT_QTY_FLOAT,v_trade_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_STRIKE_CAPT_QTY_FLOAT,v_strike_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_MARKED_SETT_PRICE_FLOAT,v_marked_sett_price);
      lpPubMsg->SetString(LDBIZ_STRIKE_NO_STR,v_strike_no);
      lpPubMsg->SetInt64(LDBIZ_DETAIL_POSI_ID_INT64,v_detail_posi_id);
      lpPubMsg->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
      lpPubMsg->SetDouble(LDBIZ_CLOSE_PANDL_FLOAT,v_close_pandl);
      lpPubMsg->SetDouble(LDBIZ_MARKED_PANDL_FLOAT,v_marked_pandl);
      lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
      glpPubSub_Interface->PubTopics("futu.posidetail", lpPubMsg);

    // end if;
    }


    // set @成交编号#=@临时_成交编号#;
    strcpy(v_strike_no,v_tmp_strike_no);

    // if @指令批号# > 0  then
    if (v_comm_batch_no > 0 )
    {
        //调用过程[事务_交易期货_指令_获取指令汇总]
        //组织事务请求
        if(lpTSCall1Ans11)
        {
          lpTSCall1Ans11->FreeMsg();
          lpTSCall1Ans11=NULL;
        }
        lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.4", 0);
        lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req11->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
        lpTSCall1Req11->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpTSCall1Req11->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req11->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
        glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
        if(!lpTSCall1Ans11)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.4]subcall timed out!");
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
        v_init_date = lpTSCall1Ans11->GetInt32(LDBIZ_INIT_DATE_INT);
        v_pd_no = lpTSCall1Ans11->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans11->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans11->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        strcpy(v_exch_crncy_type, lpTSCall1Ans11->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans11->GetInt32(LDBIZ_EXCH_NO_INT);
        v_futu_acco_no = lpTSCall1Ans11->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
        v_contrc_code_no = lpTSCall1Ans11->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans11->GetString(LDBIZ_CONTRC_CODE_STR));
        v_contrc_type = lpTSCall1Ans11->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_asset_type = lpTSCall1Ans11->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_dir = lpTSCall1Ans11->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans11->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_comm_time = lpTSCall1Ans11->GetInt32(LDBIZ_COMM_TIME_INT);
        v_comm_opor = lpTSCall1Ans11->GetInt32(LDBIZ_COMM_OPOR_INT);
        v_comm_dir = lpTSCall1Ans11->GetInt32(LDBIZ_COMM_DIR_INT);
        v_comm_limit_price = lpTSCall1Ans11->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
        v_limit_actual_price = lpTSCall1Ans11->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
        v_comm_qty = lpTSCall1Ans11->GetDouble(LDBIZ_COMM_QTY_FLOAT);
        v_comm_amt = lpTSCall1Ans11->GetDouble(LDBIZ_COMM_AMT_FLOAT);
        v_order_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_comm_cancel_qty = lpTSCall1Ans11->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
        v_comm_await_cancel_qty = lpTSCall1Ans11->GetDouble(LDBIZ_COMM_AWAIT_CANCEL_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans11->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_strike_qty = lpTSCall1Ans11->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        strcpy(v_strike_status, lpTSCall1Ans11->GetString(LDBIZ_STRIKE_STATUS_STR));
        strcpy(v_comm_sum_status, lpTSCall1Ans11->GetString(LDBIZ_COMM_SUM_STATUS_STR));
        v_comm_begin_date = lpTSCall1Ans11->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
        v_comm_end_date = lpTSCall1Ans11->GetInt32(LDBIZ_COMM_END_DATE_INT);
        v_comm_begin_time = lpTSCall1Ans11->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
        v_comm_end_time = lpTSCall1Ans11->GetInt32(LDBIZ_COMM_END_TIME_INT);
        v_comm_comple_date = lpTSCall1Ans11->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
        v_comm_comple_time = lpTSCall1Ans11->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
        v_max_comm_comple_date = lpTSCall1Ans11->GetInt32(LDBIZ_MAX_COMM_COMPLE_DATE_INT);
        v_max_comm_comple_time = lpTSCall1Ans11->GetInt32(LDBIZ_MAX_COMM_COMPLE_TIME_INT);
        v_comm_appr_date = lpTSCall1Ans11->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
        v_comm_appr_time = lpTSCall1Ans11->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
        v_comm_appr_qty = lpTSCall1Ans11->GetDouble(LDBIZ_COMM_APPR_QTY_FLOAT);
        strcpy(v_comm_sum_approve_status, lpTSCall1Ans11->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
        v_buy_order_qty = lpTSCall1Ans11->GetDouble(LDBIZ_BUY_ORDER_QTY_FLOAT);
        v_sell_order_qty = lpTSCall1Ans11->GetDouble(LDBIZ_SELL_ORDER_QTY_FLOAT);
        v_buy_comm_qty = lpTSCall1Ans11->GetDouble(LDBIZ_BUY_COMM_QTY_FLOAT);
        v_sell_comm_qty = lpTSCall1Ans11->GetDouble(LDBIZ_SELL_COMM_QTY_FLOAT);
        v_buy_strike_qty = lpTSCall1Ans11->GetDouble(LDBIZ_BUY_STRIKE_QTY_FLOAT);
        v_sell_strike_qty = lpTSCall1Ans11->GetDouble(LDBIZ_SELL_STRIKE_QTY_FLOAT);
        v_buy_strike_amt = lpTSCall1Ans11->GetDouble(LDBIZ_BUY_STRIKE_AMT_FLOAT);
        v_sell_strike_amt = lpTSCall1Ans11->GetDouble(LDBIZ_SELL_STRIKE_AMT_FLOAT);
        v_buy_comm_amt = lpTSCall1Ans11->GetDouble(LDBIZ_BUY_COMM_AMT_FLOAT);
        v_sell_comm_amt = lpTSCall1Ans11->GetDouble(LDBIZ_SELL_COMM_AMT_FLOAT);
        v_rece_margin = lpTSCall1Ans11->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_comm_oper_way, lpTSCall1Ans11->GetString(LDBIZ_COMM_OPER_WAY_STR));
        v_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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

    //订单汇总主推

    // if @订单批号#>0 then
    if (v_order_batch_no>0)
    {
        //调用过程[事务_交易期货_交易_获取订单汇总]
        //组织事务请求
        if(lpTSCall1Ans12)
        {
          lpTSCall1Ans12->FreeMsg();
          lpTSCall1Ans12=NULL;
        }
        lpTSCall1Req12=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.19", 0);
        lpTSCall1Req12->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req12->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req12->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req12->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req12->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req12->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req12->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req12->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req12->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpTSCall1Req12->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
        lpTSCall1Req12->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req12, &lpTSCall1Ans12, 5000);
        if(!lpTSCall1Ans12)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.19]subcall timed out!");
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
        v_row_id = lpTSCall1Ans12->GetInt64(LDBIZ_ROW_ID_INT64);
        strcpy(v_oper_func_code, lpTSCall1Ans12->GetString(LDBIZ_OPER_FUNC_CODE_STR));
        v_init_date = lpTSCall1Ans12->GetInt32(LDBIZ_INIT_DATE_INT);
        v_pd_no = lpTSCall1Ans12->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans12->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans12->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans12->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_crncy_type, lpTSCall1Ans12->GetString(LDBIZ_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans12->GetInt32(LDBIZ_EXCH_NO_INT);
        v_contrc_code_no = lpTSCall1Ans12->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans12->GetString(LDBIZ_CONTRC_CODE_STR));
        v_asset_type = lpTSCall1Ans12->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_type = lpTSCall1Ans12->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_contrc_unit = lpTSCall1Ans12->GetInt32(LDBIZ_CONTRC_UNIT_INT);
        v_external_no = lpTSCall1Ans12->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
        v_order_dir = lpTSCall1Ans12->GetInt32(LDBIZ_ORDER_DIR_INT);
        v_contrc_dir = lpTSCall1Ans12->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans12->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_order_price = lpTSCall1Ans12->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        strcpy(v_order_sum_status, lpTSCall1Ans12->GetString(LDBIZ_ORDER_SUM_STATUS_STR));
        v_wtdraw_qty = lpTSCall1Ans12->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
        v_waste_qty = lpTSCall1Ans12->GetDouble(LDBIZ_WASTE_QTY_FLOAT);
        v_strike_qty = lpTSCall1Ans12->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_strike_aver_price = lpTSCall1Ans12->GetDouble(LDBIZ_STRIKE_AVER_PRICE_FLOAT);
        v_strike_amt = lpTSCall1Ans12->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_trade_fee = lpTSCall1Ans12->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
        v_trade_commis = lpTSCall1Ans12->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_other_commis = lpTSCall1Ans12->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_strike_commis = lpTSCall1Ans12->GetDouble(LDBIZ_STRIKE_COMMIS_FLOAT);
        v_strike_other_commis = lpTSCall1Ans12->GetDouble(LDBIZ_STRIKE_OTHER_COMMIS_FLOAT);
        v_report_fee = lpTSCall1Ans12->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
        v_wtdraw_fee = lpTSCall1Ans12->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
        v_strike_all_fee = lpTSCall1Ans12->GetDouble(LDBIZ_STRIKE_ALL_FEE_FLOAT);
        v_rece_margin = lpTSCall1Ans12->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_order_oper_way, lpTSCall1Ans12->GetString(LDBIZ_ORDER_OPER_WAY_STR));
        v_update_times = lpTSCall1Ans12->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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
    lpOutBizMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpOutBizMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpOutBizMsg->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpOutBizMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpOutBizMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpOutBizMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpOutBizMsg->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
    lpOutBizMsg->SetString(LDBIZ_STRIKE_NO_STR,v_strike_no);
    lpOutBizMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpOutBizMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpOutBizMsg->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
    lpOutBizMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpOutBizMsg->SetDouble(LDBIZ_CURR_QTY_FLOAT,v_curr_qty);
    lpOutBizMsg->SetDouble(LDBIZ_OLD_TRADE_CAPT_QTY_FLOAT,v_old_trade_capt_qty);
    lpOutBizMsg->SetDouble(LDBIZ_TODAY_TRADE_CAPT_QTY_FLOAT,v_today_trade_capt_qty);
    lpOutBizMsg->SetDouble(LDBIZ_PRE_STRIKE_CAPT_QTY_FLOAT,v_pre_strike_capt_qty);
    lpOutBizMsg->SetDouble(LDBIZ_TODAY_STRIKE_CAPT_QTY_FLOAT,v_today_strike_capt_qty);
    lpOutBizMsg->SetDouble(LDBIZ_TRADE_RELEAS_QTY_FLOAT,v_trade_releas_qty);
    lpOutBizMsg->SetDouble(LDBIZ_STRIKE_RELEAS_QTY_FLOAT,v_strike_releas_qty);
    lpOutBizMsg->SetDouble(LDBIZ_OPEN_AMOUNT_FLOAT,v_open_amount);
    lpOutBizMsg->SetDouble(LDBIZ_CURR_AMT_FLOAT,v_curr_amt);
    lpOutBizMsg->SetDouble(LDBIZ_BEGIN_AMT_FLOAT,v_begin_amt);
    lpOutBizMsg->SetDouble(LDBIZ_TRADE_CAPT_AMT_FLOAT,v_trade_capt_amt);
    lpOutBizMsg->SetDouble(LDBIZ_TRADE_RELEAS_AMT_FLOAT,v_trade_releas_amt);
    lpOutBizMsg->SetDouble(LDBIZ_STRIKE_CAPT_AMT_FLOAT,v_strike_capt_amt);
    lpOutBizMsg->SetDouble(LDBIZ_STRIKE_RELEAS_AMT_FLOAT,v_strike_releas_amt);
    lpOutBizMsg->SetDouble(LDBIZ_CLOSE_PANDL_FLOAT,v_close_pandl);
    lpOutBizMsg->SetDouble(LDBIZ_REALIZE_PANDL_FLOAT,v_realize_pandl);
    lpOutBizMsg->SetDouble(LDBIZ_TRADE_FEE_FLOAT,v_trade_fee);
    lpOutBizMsg->SetDouble(LDBIZ_STRIKE_FEE_FLOAT,v_strike_fee);
    lpOutBizMsg->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
    lpOutBizMsg->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
    lpOutBizMsg->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
    lpOutBizMsg->SetDouble(LDBIZ_CAPT_MARGIN_FLOAT,v_capt_margin);
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

//逻辑_交易期货_报盘_处理订单补单回报
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
    int v_pass_no;
    char v_out_acco[33];
    int v_exch_no;
    char v_futu_acco[17];
    char v_contrc_code[7];
    int64 v_external_no;
    int v_contrc_dir;
    int v_hedge_type;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    char v_order_status[3];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_order_id;
    int v_co_no;
    int v_pd_no;
    int v_asset_acco_no;
    int v_exch_group_no;
    int v_price_type;
    int v_init_date;
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
    char v_comb_code[7];
    int v_comb_type;
    int v_futu_acco_no;
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
    char v_busi_config_str[65];
    char v_busi_ctrl_str[65];
    char v_asac_busi_config_str[65];
    char v_split_fee_typr_str[65];
    char v_busi_limit_str[2049];
    double v_nav_asset;
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
    double v_pre_settle_price;
    double v_up_limit_price;
    double v_down_limit_price;
    double v_last_price;
    char v_rsp_info[256];
    int v_lngsht_type;
    int v_order_date;
    int v_order_time;
    double v_wtdraw_qty;
    double v_strike_amt;
    double v_strike_qty;
    char v_order_oper_way[3];
    int v_update_times;
    int v_order_batch_no;
    int64 v_row_id;
    int64 v_compli_trig_id;
    double v_strike_price;
    int64 v_comm_id;
    int v_comm_batch_no;
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
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    strcpy(v_futu_acco, " ");
    strcpy(v_contrc_code, " ");
    v_external_no=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    strcpy(v_order_status, "0");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_order_id=0;
    v_co_no=0;
    v_pd_no=0;
    v_asset_acco_no=0;
    v_exch_group_no=0;
    v_price_type=0;
    v_init_date=0;
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
    strcpy(v_comb_code, " ");
    v_comb_type=0;
    v_futu_acco_no=0;
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
    strcpy(v_busi_config_str, " ");
    strcpy(v_busi_ctrl_str, " ");
    strcpy(v_asac_busi_config_str, " ");
    strcpy(v_split_fee_typr_str, " ");
    strcpy(v_busi_limit_str, " ");
    v_nav_asset=0;
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
    v_pre_settle_price=0;
    v_up_limit_price=0;
    v_down_limit_price=0;
    v_last_price=0;
    strcpy(v_rsp_info, " ");
    v_lngsht_type=0;
    v_order_date=0;
    v_order_time=0;
    v_wtdraw_qty=0;
    v_strike_amt=0;
    v_strike_qty=0;
    strcpy(v_order_oper_way, " ");
    v_update_times=1;
    v_order_batch_no=0;
    v_row_id=0;
    v_compli_trig_id=0;
    v_strike_price=0;
    v_comm_id=0;
    v_comm_batch_no=0;
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
    strncpy(v_futu_acco, lpInBizMsg->GetString(LDBIZ_FUTU_ACCO_STR),16);
    v_futu_acco[16] = '\0';
    strncpy(v_contrc_code, lpInBizMsg->GetString(LDBIZ_CONTRC_CODE_STR),6);
    v_contrc_code[6] = '\0';
    v_external_no = lpInBizMsg->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_contrc_dir = lpInBizMsg->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpInBizMsg->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_report_date = lpInBizMsg->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpInBizMsg->GetInt32(LDBIZ_REPORT_TIME_INT);
    strncpy(v_report_no, lpInBizMsg->GetString(LDBIZ_REPORT_NO_STR),32);
    v_report_no[32] = '\0';
    v_order_dir = lpInBizMsg->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_order_price = lpInBizMsg->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpInBizMsg->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    strncpy(v_order_status, lpInBizMsg->GetString(LDBIZ_ORDER_STATUS_STR),2);
    v_order_status[2] = '\0';

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

    //调用过程[事务_产品_公共接口_外部账号获取资产账户编号]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("prodT.6.7", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req0->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.7]subcall timed out!");
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
    v_co_no = lpTSCall1Ans0->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans0->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);

    //调用过程[事务_产品_交易接口_获取资产账户默认交易组编号]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.8.111", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.8.111]subcall timed out!");
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


    // set @价格类型#=0;
    v_price_type=0;
    //调用过程[事务_公共_交易接口_检查期货交易市场状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.25.135", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.135]subcall timed out!");
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

    //从产品期货中获取资金可用和持仓可用  以及应收保证金
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


    // set @业务控制配置串# = @交易组业务控制配置串#;
    strcpy(v_busi_config_str,v_exgp_busi_config_str);
    //产品子系统检查，检查账户状态，获取当前资金等
    //位1 交易组业务控制配置串，2交易组可用资金 3资产账户业务控制配置串 4资产账户可用资金 5通道编号外部账号

    // set @业务控制串# = "11111";
    strcpy(v_busi_ctrl_str,"11111");
    //[事务_公共_公共接口_检查系统状态权限身份获取操作员权限串]
    //调用过程[事务_产品_交易接口_检查期货交易产品账户信息]
    //组织事务请求
    if(lpTSCall1Ans5)
    {
      lpTSCall1Ans5->FreeMsg();
      lpTSCall1Ans5=NULL;
    }
    lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("prodT.8.108", 0);
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
    lpTSCall1Req5->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req5->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req5->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req5->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req5->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req5->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req5->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
    lpTSCall1Req5->SetString(LDBIZ_BUSI_CONFIG_STR_STR,v_busi_config_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
    if(!lpTSCall1Ans5)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.8.108]subcall timed out!");
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
    strcpy(v_exgp_busi_config_str, lpTSCall1Ans5->GetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR));
    strcpy(v_asac_busi_config_str, lpTSCall1Ans5->GetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR));
    strcpy(v_split_fee_typr_str, lpTSCall1Ans5->GetString(LDBIZ_SPLIT_FEE_TYPR_STR_STR));
    strcpy(v_busi_limit_str, lpTSCall1Ans5->GetString(LDBIZ_BUSI_LIMIT_STR_STR));
    v_pass_no = lpTSCall1Ans5->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans5->GetString(LDBIZ_OUT_ACCO_STR));
    v_nav_asset = lpTSCall1Ans5->GetDouble(LDBIZ_NAV_ASSET_FLOAT);

    //获取保证金优惠订单费用
    //调用过程[事务_公共_公共接口_获取保证金优惠组合编码订单费用]
    //组织事务请求
    if(lpTSCall1Ans6)
    {
      lpTSCall1Ans6->FreeMsg();
      lpTSCall1Ans6=NULL;
    }
    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("pubT.24.255", 0);
    lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req6->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req6->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req6->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req6->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req6->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req6->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpTSCall1Req6->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req6->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req6->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req6->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req6->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
    if(!lpTSCall1Ans6)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.255]subcall timed out!");
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
    v_rece_margin = lpTSCall1Ans6->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_trade_commis = lpTSCall1Ans6->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_report_fee = lpTSCall1Ans6->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
    v_wtdraw_fee = lpTSCall1Ans6->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
    v_deli_fee = lpTSCall1Ans6->GetDouble(LDBIZ_DELI_FEE_FLOAT);
    v_other_fee = lpTSCall1Ans6->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
    v_other_commis = lpTSCall1Ans6->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    v_all_fee = lpTSCall1Ans6->GetDouble(LDBIZ_ALL_FEE_FLOAT);
    v_margin_pref = lpTSCall1Ans6->GetInt32(LDBIZ_MARGIN_PREF_INT);
    strcpy(v_comb_code, lpTSCall1Ans6->GetString(LDBIZ_COMB_CODE_STR));
    v_margin_ratio = lpTSCall1Ans6->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);


    // set @交易费用# = @全部费用#;
    v_trade_fee = v_all_fee;
    //获取涨停价 跌停价 和 昨日收盘价
    //调用过程[事务_公共_公共接口_获取合约编号行情价格]
    //组织事务请求
    if(lpTSCall1Ans7)
    {
      lpTSCall1Ans7->FreeMsg();
      lpTSCall1Ans7=NULL;
    }
    lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("pubT.24.501", 0);
    lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req7->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
    if(!lpTSCall1Ans7)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.501]subcall timed out!");
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
    v_pre_settle_price = lpTSCall1Ans7->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
    v_up_limit_price = lpTSCall1Ans7->GetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT);
    v_down_limit_price = lpTSCall1Ans7->GetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
    v_last_price = lpTSCall1Ans7->GetDouble(LDBIZ_LAST_PRICE_FLOAT);


    // set @回报信息# ="报盘换机补单";
    strcpy(v_rsp_info,"报盘换机补单");
    //根据订单方向和开平方向确定多空类型

    // if @开平方向# = 《开平方向-开仓》 then
    if (v_contrc_dir == 1)
    {

      // set @多空类型# = @订单方向#;
      v_lngsht_type = v_order_dir;
    }
    // else
    else
    {


      // if @订单方向# = 《订单方向-买入》 then
      if (v_order_dir == 1)
      {

        // set @多空类型# = 《多空类型-空头》;
        v_lngsht_type = 2;
      }
      // else
      else
      {


        // set @多空类型# = 《多空类型-多头》;
        v_lngsht_type = 1;
      // end if;
      }

    // end if;
    }

    //调用过程[事务_交易期货_账户_新增保证金优惠信息]
    //组织事务请求
    if(lpTSCall1Ans8)
    {
      lpTSCall1Ans8->FreeMsg();
      lpTSCall1Ans8=NULL;
    }
    lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.49", 0);
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
    lpTSCall1Req8->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req8->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req8->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req8->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpTSCall1Req8->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
    if(!lpTSCall1Ans8)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.49]subcall timed out!");
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
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans8->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans8->GetString(LDBIZ_ERROR_INFO_STR));


    // set @错误编码# = "0";
    strcpy(v_error_code,"0");

    // set @错误信息# = " ";
    strcpy(v_error_info," ");
    //调用过程[事务_交易期货_报盘_新增补单订单]
    //组织事务请求
    if(lpTSCall1Ans9)
    {
      lpTSCall1Ans9->FreeMsg();
      lpTSCall1Ans9=NULL;
    }
    lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("tdfutuT.5.22", 0);
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
    lpTSCall1Req9->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req9->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req9->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req9->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req9->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req9->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req9->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpTSCall1Req9->SetString(LDBIZ_FUTU_ACCO_STR,v_futu_acco);
    lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req9->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpTSCall1Req9->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpTSCall1Req9->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpTSCall1Req9->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
    lpTSCall1Req9->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpTSCall1Req9->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req9->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req9->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req9->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req9->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req9->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req9->SetDouble(LDBIZ_REPORT_FEE_FLOAT,v_report_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_WTDRAW_FEE_FLOAT,v_wtdraw_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_TRADE_FEE_FLOAT,v_trade_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
    lpTSCall1Req9->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
    lpTSCall1Req9->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpTSCall1Req9->SetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR,v_asac_busi_config_str);
    lpTSCall1Req9->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpTSCall1Req9->SetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT,v_up_limit_price);
    lpTSCall1Req9->SetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT,v_down_limit_price);
    lpTSCall1Req9->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
    lpTSCall1Req9->SetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT,v_exgp_avail_qty);
    lpTSCall1Req9->SetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT,v_asac_avail_qty);
    lpTSCall1Req9->SetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT,v_exgp_long_rece_margin);
    lpTSCall1Req9->SetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT,v_exgp_short_rece_margin);
    lpTSCall1Req9->SetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT,v_asac_long_rece_margin);
    lpTSCall1Req9->SetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT,v_asac_short_rece_margin);
    lpTSCall1Req9->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
    if(!lpTSCall1Ans9)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.5.22]subcall timed out!");
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
    v_order_id = lpTSCall1Ans9->GetInt64(LDBIZ_ORDER_ID_INT64);
    v_order_date = lpTSCall1Ans9->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_order_time = lpTSCall1Ans9->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_wtdraw_qty = lpTSCall1Ans9->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans9->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_qty = lpTSCall1Ans9->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    strcpy(v_order_oper_way, lpTSCall1Ans9->GetString(LDBIZ_ORDER_OPER_WAY_STR));
    v_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // set @订单批号#=0;
    v_order_batch_no=0;

    // set @记录序号#=@订单序号#;
    v_row_id=v_order_id;

    // set @订单日期#=@申报日期#;
    v_order_date=v_report_date;

    // set @合规触警序号# =0;
    v_compli_trig_id =0;

    // set @撤单数量#=0;
    v_wtdraw_qty=0;

    // set @成交数量#=0;
    v_strike_qty=0;

    // set @成交价格#=0;
    v_strike_price=0;

    // set @成交金额#=0;
    v_strike_amt=0;

    // set @保证金比例#=0;
    v_margin_ratio=0;

    // set @指令序号# = 0;
    v_comm_id = 0;

    // set @指令批号# = 0;
    v_comm_batch_no = 0;

    // set @订单操作方式# = 《订单操作方式-报盘机补单》;
    strcpy(v_order_oper_way,"33");
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

    //交易组及资产账户的资金持仓主推
    //调用过程[事务_交易期货_账户_获取交易组资产账户资金]
    //组织事务请求
    if(lpTSCall1Ans10)
    {
      lpTSCall1Ans10->FreeMsg();
      lpTSCall1Ans10=NULL;
    }
    lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.11", 0);
    lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req10->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req10->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req10->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
    if(!lpTSCall1Ans10)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.11]subcall timed out!");
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
    v_exgp_row_id = lpTSCall1Ans10->GetInt64(LDBIZ_EXGP_ROW_ID_INT64);
    v_co_no = lpTSCall1Ans10->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans10->GetInt32(LDBIZ_PD_NO_INT);
    v_exgp_begin_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_BEGIN_AMT_FLOAT);
    v_exgp_curr_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_CURR_AMT_FLOAT);
    v_exgp_frozen_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
    v_exgp_unfroz_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
    v_exgp_comm_frozen_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
    v_exgp_comm_unfroz_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
    v_exgp_comm_capt_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
    v_exgp_comm_releas_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
    v_exgp_trade_capt_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
    v_exgp_trade_releas_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
    v_exgp_strike_capt_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
    v_exgp_strike_releas_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
    v_exgp_capt_margin = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_CAPT_MARGIN_FLOAT);
    v_exgp_trade_fee = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TRADE_FEE_FLOAT);
    v_exgp_strike_fee = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_STRIKE_FEE_FLOAT);
    v_exgp_close_pandl = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_CLOSE_PANDL_FLOAT);
    v_exgp_marked_pandl = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_MARKED_PANDL_FLOAT);
    v_exgp_cash_update_times = lpTSCall1Ans10->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
    v_asac_row_id = lpTSCall1Ans10->GetInt64(LDBIZ_ASAC_ROW_ID_INT64);
    v_asac_begin_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_BEGIN_AMT_FLOAT);
    v_asac_curr_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_CURR_AMT_FLOAT);
    v_asac_frozen_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
    v_asac_unfroz_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
    v_asac_comm_frozen_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
    v_asac_comm_unfroz_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
    v_asac_comm_capt_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
    v_asac_comm_releas_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
    v_asac_trade_capt_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
    v_asac_trade_releas_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
    v_asac_strike_capt_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
    v_asac_strike_releas_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
    v_asac_capt_margin = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_CAPT_MARGIN_FLOAT);
    v_asac_trade_fee = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TRADE_FEE_FLOAT);
    v_asac_strike_fee = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_STRIKE_FEE_FLOAT);
    v_asac_close_pandl = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_CLOSE_PANDL_FLOAT);
    v_asac_marked_pandl = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_MARKED_PANDL_FLOAT);
    v_asac_cash_update_times = lpTSCall1Ans10->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);


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
    if(lpTSCall1Ans11)
    {
      lpTSCall1Ans11->FreeMsg();
      lpTSCall1Ans11=NULL;
    }
    lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("tdfutuT.2.12", 0);
    lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req11->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req11->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req11->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req11->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req11->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpTSCall1Req11->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
    if(!lpTSCall1Ans11)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.2.12]subcall timed out!");
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
    strcpy(v_exch_crncy_type, lpTSCall1Ans11->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_contrc_type = lpTSCall1Ans11->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_unit = lpTSCall1Ans11->GetInt32(LDBIZ_CONTRC_UNIT_INT);
    strcpy(v_comb_code, lpTSCall1Ans11->GetString(LDBIZ_COMB_CODE_STR));
    v_exgp_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
    v_exgp_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
    v_exgp_comm_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
    v_exgp_trade_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
    v_exgp_strike_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
    v_exgp_old_comm_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_OLD_COMM_CAPT_QTY_FLOAT);
    v_exgp_today_comm_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TODAY_COMM_CAPT_QTY_FLOAT);
    v_exgp_old_trade_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_OLD_TRADE_CAPT_QTY_FLOAT);
    v_exgp_today_trade_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TODAY_TRADE_CAPT_QTY_FLOAT);
    v_exgp_pre_strike_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_PRE_STRIKE_CAPT_QTY_FLOAT);
    v_exgp_today_strike_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TODAY_STRIKE_CAPT_QTY_FLOAT);
    v_exgp_rece_margin = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_RECE_MARGIN_FLOAT);
    v_pre_settle_price = lpTSCall1Ans11->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
    v_exgp_realize_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
    v_exgp_open_amount = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_OPEN_AMOUNT_FLOAT);
    v_exgp_posi_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
    v_asac_row_id = lpTSCall1Ans11->GetInt64(LDBIZ_ASAC_ROW_ID_INT64);
    v_asac_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
    v_asac_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
    v_asac_comm_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
    v_asac_trade_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
    v_asac_strike_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
    v_asac_old_comm_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_OLD_COMM_CAPT_QTY_FLOAT);
    v_asac_today_comm_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TODAY_COMM_CAPT_QTY_FLOAT);
    v_asac_old_trade_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_OLD_TRADE_CAPT_QTY_FLOAT);
    v_asac_today_trade_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TODAY_TRADE_CAPT_QTY_FLOAT);
    v_asac_pre_strike_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_PRE_STRIKE_CAPT_QTY_FLOAT);
    v_asac_today_strike_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TODAY_STRIKE_CAPT_QTY_FLOAT);
    v_asac_rece_margin = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_RECE_MARGIN_FLOAT);
    v_asac_realize_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
    v_asac_open_amount = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_OPEN_AMOUNT_FLOAT);
    v_asac_posi_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


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
    lpOutBizMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpOutBizMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpOutBizMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpOutBizMsg->SetString(LDBIZ_FUTU_ACCO_STR,v_futu_acco);
    lpOutBizMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpOutBizMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpOutBizMsg->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpOutBizMsg->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpOutBizMsg->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpOutBizMsg->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
    lpOutBizMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpOutBizMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpOutBizMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpOutBizMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpOutBizMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpOutBizMsg->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
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

//逻辑_交易期货_报盘_查询订单回报
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
    char v_exch_no_str[2049];
    char v_futu_acco[17];
    char v_contrc_code[7];
    char v_order_dir_str[1025];
    char v_rsp_status_str[65];
    char v_deal_status_str[65];
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    int v_pass_no;
    char v_out_acco[33];
    int v_exch_no;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int64 v_order_id;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    char v_rsp_status[3];
    char v_rsp_info[256];
    char v_deal_status[3];
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
    strcpy(v_exch_no_str, " ");
    strcpy(v_futu_acco, " ");
    strcpy(v_contrc_code, " ");
    strcpy(v_order_dir_str, " ");
    strcpy(v_rsp_status_str, " ");
    strcpy(v_deal_status_str, " ");
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_id=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    strcpy(v_rsp_status, "0");
    strcpy(v_rsp_info, " ");
    strcpy(v_deal_status, "0");
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
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    strncpy(v_futu_acco, lpInBizMsg->GetString(LDBIZ_FUTU_ACCO_STR),16);
    v_futu_acco[16] = '\0';
    strncpy(v_contrc_code, lpInBizMsg->GetString(LDBIZ_CONTRC_CODE_STR),6);
    v_contrc_code[6] = '\0';
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    strncpy(v_rsp_status_str, lpInBizMsg->GetString(LDBIZ_RSP_STATUS_STR_STR),64);
    v_rsp_status_str[64] = '\0';
    strncpy(v_deal_status_str, lpInBizMsg->GetString(LDBIZ_DEAL_STATUS_STR_STR),64);
    v_deal_status_str[64] = '\0';
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

    //查询订单回报
    //调用过程[事务_交易期货_报盘_查询订单回报]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.5.101", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetString(LDBIZ_FUTU_ACCO_STR,v_futu_acco);
    lpTSCall1Req1->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_RSP_STATUS_STR_STR,v_rsp_status_str);
    lpTSCall1Req1->SetString(LDBIZ_DEAL_STATUS_STR_STR,v_deal_status_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.5.101]subcall timed out!");
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

//逻辑_交易期货_报盘_查询成交回报
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
    char v_exch_no_str[2049];
    char v_futu_acco[17];
    char v_contrc_code[7];
    char v_order_dir_str[1025];
    char v_deal_status_str[65];
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    int v_pass_no;
    char v_out_acco[33];
    int v_exch_no;
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    char v_report_no[33];
    int v_order_dir;
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    int v_strike_deal_type;
    char v_rsp_info[256];
    char v_deal_status[3];
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
    strcpy(v_exch_no_str, " ");
    strcpy(v_futu_acco, " ");
    strcpy(v_contrc_code, " ");
    strcpy(v_order_dir_str, " ");
    strcpy(v_deal_status_str, " ");
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    strcpy(v_report_no, " ");
    v_order_dir=0;
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_strike_deal_type=0;
    strcpy(v_rsp_info, " ");
    strcpy(v_deal_status, "0");
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
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    strncpy(v_futu_acco, lpInBizMsg->GetString(LDBIZ_FUTU_ACCO_STR),16);
    v_futu_acco[16] = '\0';
    strncpy(v_contrc_code, lpInBizMsg->GetString(LDBIZ_CONTRC_CODE_STR),6);
    v_contrc_code[6] = '\0';
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    strncpy(v_deal_status_str, lpInBizMsg->GetString(LDBIZ_DEAL_STATUS_STR_STR),64);
    v_deal_status_str[64] = '\0';
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

    //调用过程[事务_交易期货_报盘_查询成交回报]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.5.121", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetString(LDBIZ_FUTU_ACCO_STR,v_futu_acco);
    lpTSCall1Req1->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_DEAL_STATUS_STR_STR,v_deal_status_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.5.121]subcall timed out!");
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

//逻辑_交易期货_报盘_查询成交明细
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
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    char v_exch_no_str[2049];
    int v_pass_no;
    int v_contrc_code_no;
    char v_order_dir_str[1025];
    int64 v_external_no;
    int64 v_comm_id;
    int v_comm_batch_no;
    int64 v_row_id;
    int v_query_type;
    int v_sort_type;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    int v_query_opor_no;
    int v_asset_acco_no;
    int v_futu_acco_no;
    char v_crncy_type[4];
    int v_exch_no;
    char v_contrc_code[7];
    int v_contrc_unit;
    int v_contrc_dir;
    int v_hedge_type;
    int v_report_date;
    int64 v_order_id;
    int v_order_dir;
    char v_report_no[33];
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    double v_strike_fee;
    double v_close_pandl;
    double v_strike_margin;
    char v_order_oper_way[3];
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
    v_pass_no=0;
    v_contrc_code_no=0;
    strcpy(v_order_dir_str, " ");
    v_external_no=0;
    v_comm_id=0;
    v_comm_batch_no=0;
    v_row_id=0;
    v_query_type=0;
    v_sort_type=1;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    v_query_opor_no=0;
    v_asset_acco_no=0;
    v_futu_acco_no=0;
    strcpy(v_crncy_type, "CNY");
    v_exch_no=0;
    strcpy(v_contrc_code, " ");
    v_contrc_unit=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    v_report_date=0;
    v_order_id=0;
    v_order_dir=0;
    strcpy(v_report_no, " ");
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_strike_fee=0;
    v_close_pandl=0;
    v_strike_margin=0;
    strcpy(v_order_oper_way, " ");
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
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    v_contrc_code_no = lpInBizMsg->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    v_external_no = lpInBizMsg->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpInBizMsg->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_query_type = lpInBizMsg->GetInt32(LDBIZ_QUERY_TYPE_INT);
    v_sort_type = lpInBizMsg->GetInt32(LDBIZ_SORT_TYPE_INT);
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

    //调用过程[事务_交易期货_报盘_查询成交明细]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.5.122", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetInt32(LDBIZ_QUERY_TYPE_INT,v_query_type);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.5.122]subcall timed out!");
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

//逻辑_交易期货_报盘_查询成交明细历史
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
    int v_begin_date;
    int v_end_date;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    char v_exch_no_str[2049];
    int v_pass_no;
    int v_contrc_code_no;
    char v_order_dir_str[1025];
    int64 v_external_no;
    int64 v_comm_id;
    int v_comm_batch_no;
    int64 v_row_id;
    int v_query_type;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    int v_asset_acco_no;
    int v_futu_acco_no;
    char v_crncy_type[4];
    int v_exch_no;
    char v_contrc_code[7];
    int v_contrc_unit;
    int v_contrc_dir;
    int v_hedge_type;
    int v_report_date;
    int64 v_order_id;
    int v_order_dir;
    char v_report_no[33];
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    double v_strike_fee;
    double v_close_pandl;
    double v_strike_margin;
    char v_order_oper_way[3];
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
    v_pass_no=0;
    v_contrc_code_no=0;
    strcpy(v_order_dir_str, " ");
    v_external_no=0;
    v_comm_id=0;
    v_comm_batch_no=0;
    v_row_id=0;
    v_query_type=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    v_asset_acco_no=0;
    v_futu_acco_no=0;
    strcpy(v_crncy_type, "CNY");
    v_exch_no=0;
    strcpy(v_contrc_code, " ");
    v_contrc_unit=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    v_report_date=0;
    v_order_id=0;
    v_order_dir=0;
    strcpy(v_report_no, " ");
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_strike_fee=0;
    v_close_pandl=0;
    v_strike_margin=0;
    strcpy(v_order_oper_way, " ");
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
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    v_contrc_code_no = lpInBizMsg->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    v_external_no = lpInBizMsg->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpInBizMsg->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_query_type = lpInBizMsg->GetInt32(LDBIZ_QUERY_TYPE_INT);
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

    //调用过程[事务_交易期货_报盘_查询成交明细历史]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.5.123", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetInt32(LDBIZ_QUERY_TYPE_INT,v_query_type);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.5.123]subcall timed out!");
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

