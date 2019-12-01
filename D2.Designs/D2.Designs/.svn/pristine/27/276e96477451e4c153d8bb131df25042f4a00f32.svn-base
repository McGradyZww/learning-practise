#include <Include/ld_db_interface.h>
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
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.4.11");
        bizFuncInfo->lpFunc = fnFunc0;
    }
    else if (iFunIndex==1)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.4.12");
        bizFuncInfo->lpFunc = fnFunc1;
    }
    else if (iFunIndex==2)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.4.21");
        bizFuncInfo->lpFunc = fnFunc2;
    }
    else if (iFunIndex==3)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.4.31");
        bizFuncInfo->lpFunc = fnFunc3;
    }
    else if (iFunIndex==4)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.4.32");
        bizFuncInfo->lpFunc = fnFunc4;
    }
    else if (iFunIndex==5)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.4.101");
        bizFuncInfo->lpFunc = fnFunc5;
    }
    else if (iFunIndex==6)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.4.102");
        bizFuncInfo->lpFunc = fnFunc6;
    }
    else if (iFunIndex==7)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.4.103");
        bizFuncInfo->lpFunc = fnFunc7;
    }
    else if (iFunIndex==8)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.4.104");
        bizFuncInfo->lpFunc = fnFunc8;
    }
    else if (iFunIndex==9)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.4.33");
        bizFuncInfo->lpFunc = fnFunc9;
    }
    else if (iFunIndex==10)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.4.41");
        bizFuncInfo->lpFunc = fnFunc10;
    }
    else if (iFunIndex==11)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.4.42");
        bizFuncInfo->lpFunc = fnFunc11;
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

//逻辑_交易期货_交易_新增订单
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
    int v_comm_opor;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_exch_no;
    char v_contrc_code[7];
    char v_contrc_name[65];
    int v_contrc_dir;
    int v_hedge_type;
    int64 v_external_no;
    int64 v_comm_id;
    int v_order_batch_no;
    int v_order_dir;
    double v_order_qty;
    double v_order_price;
    char v_order_oper_way[3];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_co_no;
    int v_pass_no;
    char v_out_acco[33];
    int v_contrc_type;
    int v_order_date;
    int v_order_time;
    int64 v_order_id;
    char v_order_status[3];
    int64 v_compli_trig_id;
    int v_tmp_hedge_type;
    int v_lngsht_type;
    int v_asset_type;
    int v_price_type;
    int v_calc_dir;
    int v_init_date;
    int v_pd_no;
    char v_co_busi_config_str[65];
    char v_exgp_busi_config_str[65];
    int v_contrc_code_no;
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    int v_contrc_unit;
    int v_capit_reback_days;
    int v_posi_reback_days;
    char v_busi_config_str[65];
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
    char v_busi_ctrl_str[65];
    char v_co_no_rights_str[2049];
    char v_pd_no_rights_str[2049];
    char v_exch_group_no_rights_str[2049];
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
    int v_trig_stage_type;
    int v_comm_batch_no;
    int v_report_date;
    int v_report_time;
    int v_update_times;
    char v_report_no[33];
    double v_wtdraw_qty;
    double v_strike_qty;
    double v_strike_price;
    double v_strike_amt;
    char v_rsp_info[256];
    int64 v_row_id;
    int v_comm_date;
    int v_comm_time;
    int v_comm_executor;
    int v_comm_dir;
    double v_comm_limit_price;
    double v_limit_actual_price;
    double v_comm_qty;
    double v_comm_amt;
    double v_comm_cancel_qty;
    double v_comm_frozen_amt;
    double v_comm_frozen_qty;
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
    v_comm_opor=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    strcpy(v_contrc_code, " ");
    strcpy(v_contrc_name, " ");
    v_contrc_dir=0;
    v_hedge_type=0;
    v_external_no=0;
    v_comm_id=0;
    v_order_batch_no=0;
    v_order_dir=0;
    v_order_qty=0;
    v_order_price=0;
    strcpy(v_order_oper_way, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_co_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_contrc_type=0;
    v_order_date=0;
    v_order_time=0;
    v_order_id=0;
    strcpy(v_order_status, "0");
    v_compli_trig_id=0;
    v_tmp_hedge_type=0;
    v_lngsht_type=0;
    v_asset_type=0;
    v_price_type=0;
    v_calc_dir=1;
    v_init_date=0;
    v_pd_no=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_exgp_busi_config_str, " ");
    v_contrc_code_no=0;
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_contrc_unit=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    strcpy(v_busi_config_str, " ");
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
    strcpy(v_busi_ctrl_str, " ");
    strcpy(v_co_no_rights_str, " ");
    strcpy(v_pd_no_rights_str, " ");
    strcpy(v_exch_group_no_rights_str, " ");
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
    v_trig_stage_type=0;
    v_comm_batch_no=0;
    v_report_date=0;
    v_report_time=0;
    v_update_times=1;
    strcpy(v_report_no, " ");
    v_wtdraw_qty=0;
    v_strike_qty=0;
    v_strike_price=0;
    v_strike_amt=0;
    strcpy(v_rsp_info, " ");
    v_row_id=0;
    v_comm_date=0;
    v_comm_time=0;
    v_comm_executor=0;
    v_comm_dir=0;
    v_comm_limit_price=0;
    v_limit_actual_price=0;
    v_comm_qty=0;
    v_comm_amt=0;
    v_comm_cancel_qty=0;
    v_comm_frozen_amt=0;
    v_comm_frozen_qty=0;
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
    v_comm_opor = lpInBizMsg->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    strncpy(v_contrc_code, lpInBizMsg->GetString(LDBIZ_CONTRC_CODE_STR),6);
    v_contrc_code[6] = '\0';
    strncpy(v_contrc_name, lpInBizMsg->GetString(LDBIZ_CONTRC_NAME_STR),64);
    v_contrc_name[64] = '\0';
    v_contrc_dir = lpInBizMsg->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpInBizMsg->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_external_no = lpInBizMsg->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    v_order_batch_no = lpInBizMsg->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_order_dir = lpInBizMsg->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_order_qty = lpInBizMsg->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_price = lpInBizMsg->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    strncpy(v_order_oper_way, lpInBizMsg->GetString(LDBIZ_ORDER_OPER_WAY_STR),2);
    v_order_oper_way[2] = '\0';

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


    // [检查报错返回][@套保标志# <>《套保标志-投机》 and @套保标志# <>《套保标志-套保》 and @套保标志# <>《套保标志-套利》][19][@套保标志#]
    if (v_hedge_type !=1 && v_hedge_type !=2 && v_hedge_type !=3)
    {
        strcpy(v_error_code, "tdfutuL.4.11.19");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d","套保标志=",v_hedge_type);
        iRet = -1;
        goto END;
    }


    // set @临时_套保标志# = @套保标志#;
    v_tmp_hedge_type = v_hedge_type;

    // set @机构编号# = @操作员机构编号#;
    v_co_no = v_opor_co_no;

    // if @指令下达人# = (0) then
    if (v_comm_opor == (0))
    {

      // set @指令下达人# = @操作员编号#;
      v_comm_opor = v_opor_no;
    // end if;
    }

    //根据订单方向和开平方向确定多空类型
    //调用过程[事务_交易期货_交易_获取多空类型]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.26", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req0->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.26]subcall timed out!");
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
    v_lngsht_type = lpTSCall1Ans0->GetInt32(LDBIZ_LNGSHT_TYPE_INT);


    // set @资产类型#=31;
    v_asset_type=31;
    //公共子系统检查，检查交易日期时间

    // set @价格类型#=0;
    v_price_type=0;

    // set @计算方向#=《计算方向-加上》;
    v_calc_dir=1;
    //调用过程[事务_公共_交易接口_检查期货交易市场状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.25.135", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.135]subcall timed out!");
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


    // set @业务控制配置串# = @交易组业务控制配置串#;
    strcpy(v_busi_config_str,v_exgp_busi_config_str);
    //获取该合约代码对应的组合编码
    //调用过程[事务_公共_公共接口_获取保证金优惠组合编码]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.256", 0);
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
    lpTSCall1Req2->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.256]subcall timed out!");
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
    strcpy(v_comb_code, lpTSCall1Ans2->GetString(LDBIZ_COMB_CODE_STR));
    v_comb_type = lpTSCall1Ans2->GetInt32(LDBIZ_COMB_TYPE_INT);

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

    //产品子系统检查，检查账户状态，获取当前资金等
    //位1 交易组业务控制配置串，2交易组可用资金 3资产账户业务控制配置串 4资产账户可用资金 5通道编号外部账号

    // set @业务控制串# = "11111";
    strcpy(v_busi_ctrl_str,"11111");
    //调用过程[事务_公共_公共接口_检查系统状态权限身份获取操作员权限串]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pubT.24.3", 0);
    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req4->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req4->SetString(LDBIZ_BUSI_CTRL_STR_STR,v_busi_ctrl_str);
    lpTSCall1Req4->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.3]subcall timed out!");
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
    v_init_date = lpTSCall1Ans4->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans4->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));
    strcpy(v_co_no_rights_str, lpTSCall1Ans4->GetString(LDBIZ_CO_NO_RIGHTS_STR_STR));
    strcpy(v_pd_no_rights_str, lpTSCall1Ans4->GetString(LDBIZ_PD_NO_RIGHTS_STR_STR));
    strcpy(v_exch_group_no_rights_str, lpTSCall1Ans4->GetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR));

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


    // if @订单价格# = 0 then
    if (v_order_price == 0)
    {

      // if @订单方向#=《订单方向-买入》 then
      if (v_order_dir==1)
      {

        // set @订单价格#=@涨停价#;
        v_order_price=v_up_limit_price;
      }
      // else
      else
      {


        // set @订单价格#=@跌停价#;
        v_order_price=v_down_limit_price;
      // end if;
      }

    // end if;
    }


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

    //新增订单
    //调用过程[事务_交易期货_交易_新增订单]
    //组织事务请求
    if(lpTSCall1Ans9)
    {
      lpTSCall1Ans9->FreeMsg();
      lpTSCall1Ans9=NULL;
    }
    lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.11", 0);
    lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req9->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
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
    lpTSCall1Req9->SetString(LDBIZ_BUSI_LIMIT_STR_STR,v_busi_limit_str);
    lpTSCall1Req9->SetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR,v_exgp_busi_config_str);
    lpTSCall1Req9->SetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR,v_asac_busi_config_str);
    lpTSCall1Req9->SetDouble(LDBIZ_EXGP_AVAIL_AMT_FLOAT,v_exgp_avail_amt);
    lpTSCall1Req9->SetDouble(LDBIZ_ASAC_AVAIL_AMT_FLOAT,v_asac_avail_amt);
    lpTSCall1Req9->SetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT,v_exgp_avail_qty);
    lpTSCall1Req9->SetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT,v_asac_avail_qty);
    lpTSCall1Req9->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req9->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpTSCall1Req9->SetInt32(LDBIZ_CALC_DIR_INT,v_calc_dir);
    lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req9->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req9->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req9->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpTSCall1Req9->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req9->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req9->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req9->SetDouble(LDBIZ_REPORT_FEE_FLOAT,v_report_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_WTDRAW_FEE_FLOAT,v_wtdraw_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_TRADE_FEE_FLOAT,v_trade_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
    lpTSCall1Req9->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
    lpTSCall1Req9->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpTSCall1Req9->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpTSCall1Req9->SetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT,v_up_limit_price);
    lpTSCall1Req9->SetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT,v_down_limit_price);
    lpTSCall1Req9->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
    lpTSCall1Req9->SetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT,v_exgp_long_rece_margin);
    lpTSCall1Req9->SetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT,v_exgp_short_rece_margin);
    lpTSCall1Req9->SetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT,v_asac_long_rece_margin);
    lpTSCall1Req9->SetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT,v_asac_short_rece_margin);
    lpTSCall1Req9->SetInt64(LDBIZ_COMPLI_TRIG_ID_INT64,v_compli_trig_id);
    lpTSCall1Req9->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
    lpTSCall1Req9->SetDouble(LDBIZ_MARGIN_RATIO_FLOAT,v_margin_ratio);
    glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
    if(!lpTSCall1Ans9)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.11]subcall timed out!");
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
    strcpy(v_order_status, lpTSCall1Ans9->GetString(LDBIZ_ORDER_STATUS_STR));
    v_comm_batch_no = lpTSCall1Ans9->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_report_date = lpTSCall1Ans9->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpTSCall1Ans9->GetInt32(LDBIZ_REPORT_TIME_INT);
    v_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // set @交易币种#="CNY";
    strcpy(v_exch_crncy_type,"CNY");

    // set @申报编号#=0;
    strcpy(v_report_no,"0");

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

    // set @回报信息#=" ";
    strcpy(v_rsp_info," ");

    // set @记录序号#=@订单序号#;
    v_row_id=v_order_id;
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
    //[主动推送][futu.rptorder][期货主推_报盘_订单主推报盘消息]
    //指令主推

    // if @指令序号# > 0 then
    if (v_comm_id > 0)
    {
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

    // end if;
    }


    // set @套保标志# = @临时_套保标志#;
    v_hedge_type = v_tmp_hedge_type;
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


    // if @指令批号# > 0  then
    if (v_comm_batch_no > 0 )
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

    //订单汇总主推

    // if @订单批号#>0 then
    if (v_order_batch_no>0)
    {
        //调用过程[事务_交易期货_交易_获取订单汇总]
        //组织事务请求
        if(lpTSCall1Ans14)
        {
          lpTSCall1Ans14->FreeMsg();
          lpTSCall1Ans14=NULL;
        }
        lpTSCall1Req14=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.19", 0);
        lpTSCall1Req14->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req14->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req14->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req14->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req14->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req14->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req14->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req14->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req14->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpTSCall1Req14->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
        lpTSCall1Req14->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req14, &lpTSCall1Ans14, 5000);
        if(!lpTSCall1Ans14)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.19]subcall timed out!");
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
        strcpy(v_oper_func_code, lpTSCall1Ans14->GetString(LDBIZ_OPER_FUNC_CODE_STR));
        v_init_date = lpTSCall1Ans14->GetInt32(LDBIZ_INIT_DATE_INT);
        v_pd_no = lpTSCall1Ans14->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans14->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans14->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans14->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_crncy_type, lpTSCall1Ans14->GetString(LDBIZ_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans14->GetInt32(LDBIZ_EXCH_NO_INT);
        v_contrc_code_no = lpTSCall1Ans14->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans14->GetString(LDBIZ_CONTRC_CODE_STR));
        v_asset_type = lpTSCall1Ans14->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_type = lpTSCall1Ans14->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_contrc_unit = lpTSCall1Ans14->GetInt32(LDBIZ_CONTRC_UNIT_INT);
        v_external_no = lpTSCall1Ans14->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
        v_order_dir = lpTSCall1Ans14->GetInt32(LDBIZ_ORDER_DIR_INT);
        v_contrc_dir = lpTSCall1Ans14->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans14->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_order_price = lpTSCall1Ans14->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans14->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        strcpy(v_order_sum_status, lpTSCall1Ans14->GetString(LDBIZ_ORDER_SUM_STATUS_STR));
        v_wtdraw_qty = lpTSCall1Ans14->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
        v_waste_qty = lpTSCall1Ans14->GetDouble(LDBIZ_WASTE_QTY_FLOAT);
        v_strike_qty = lpTSCall1Ans14->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_strike_aver_price = lpTSCall1Ans14->GetDouble(LDBIZ_STRIKE_AVER_PRICE_FLOAT);
        v_strike_amt = lpTSCall1Ans14->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_trade_fee = lpTSCall1Ans14->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
        v_trade_commis = lpTSCall1Ans14->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_other_commis = lpTSCall1Ans14->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_strike_commis = lpTSCall1Ans14->GetDouble(LDBIZ_STRIKE_COMMIS_FLOAT);
        v_strike_other_commis = lpTSCall1Ans14->GetDouble(LDBIZ_STRIKE_OTHER_COMMIS_FLOAT);
        v_report_fee = lpTSCall1Ans14->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
        v_wtdraw_fee = lpTSCall1Ans14->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
        v_strike_all_fee = lpTSCall1Ans14->GetDouble(LDBIZ_STRIKE_ALL_FEE_FLOAT);
        v_rece_margin = lpTSCall1Ans14->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_order_oper_way, lpTSCall1Ans14->GetString(LDBIZ_ORDER_OPER_WAY_STR));
        v_update_times = lpTSCall1Ans14->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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
        if(lpTSCall1Ans15)
        {
          lpTSCall1Ans15->FreeMsg();
          lpTSCall1Ans15=NULL;
        }
        lpTSCall1Req15=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req15->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req15->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req15->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req15->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req15->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req15->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req15->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req15->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req15->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req15->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req15, &lpTSCall1Ans15, 5000);
        if (lpTSCall1Ans15)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans15->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans15->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans15->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans15->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans15->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
    lpOutBizMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpOutBizMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpOutBizMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpOutBizMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpOutBizMsg->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpOutBizMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpOutBizMsg->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
    lpOutBizMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpOutBizMsg->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
    lpOutBizMsg->SetInt64(LDBIZ_COMPLI_TRIG_ID_INT64,v_compli_trig_id);
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
    return iRet;
}

//逻辑_交易期货_交易_撤销订单
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
    int v_order_date;
    int64 v_order_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_asset_acco_no;
    int v_exch_no;
    int v_pass_no;
    char v_contrc_code[7];
    int64 v_external_no;
    char v_report_no[33];
    char v_order_status[3];
    char v_wtdraw_status[3];
    char v_rsp_info[256];
    int v_busi_opor_no;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_contrc_code_no;
    int v_futu_acco_no;
    int v_contrc_type;
    int v_contrc_dir;
    int v_hedge_type;
    char v_comb_code[7];
    int64 v_comm_id;
    int v_order_time;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    double v_order_frozen_amt;
    int v_price_type;
    double v_strike_qty;
    double v_strike_amt;
    double v_all_fee;
    double v_wtdraw_qty;
    int v_wtdraw_time;
    int v_order_batch_no;
    char v_exch_crncy_type[4];
    int v_lngsht_type;
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_exgp_busi_config_str[65];
    int v_asset_type;
    char v_crncy_type[4];
    int v_contrc_unit;
    int v_capit_reback_days;
    int v_posi_reback_days;
    char v_busi_config_str[65];
    char v_busi_ctrl_str[65];
    char v_asac_busi_config_str[65];
    char v_split_fee_typr_str[65];
    char v_busi_limit_str[2049];
    char v_out_acco[33];
    double v_nav_asset;
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
    int v_report_date;
    int v_report_time;
    int v_comm_batch_no;
    double v_comm_limit_price;
    int v_wtdraw_date;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_strike_price;
    int v_calc_dir;
    double v_occur_qty;
    double v_occur_amt;
    double v_trade_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_trade_capt_amt;
    double v_posi_capt_amt;
    double v_rece_margin;
    double v_margin_ratio;
    double v_comm_margin;
    int64 v_compli_trig_id;
    char v_order_oper_way[3];
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
    v_order_date=0;
    v_order_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_asset_acco_no=0;
    v_exch_no=0;
    v_pass_no=0;
    strcpy(v_contrc_code, " ");
    v_external_no=0;
    strcpy(v_report_no, " ");
    strcpy(v_order_status, "0");
    strcpy(v_wtdraw_status, "0");
    strcpy(v_rsp_info, " ");
    v_busi_opor_no=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_contrc_code_no=0;
    v_futu_acco_no=0;
    v_contrc_type=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    strcpy(v_comb_code, " ");
    v_comm_id=0;
    v_order_time=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_order_frozen_amt=0;
    v_price_type=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_all_fee=0;
    v_wtdraw_qty=0;
    v_wtdraw_time=0;
    v_order_batch_no=0;
    strcpy(v_exch_crncy_type, "CNY");
    v_lngsht_type=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_exgp_busi_config_str, " ");
    v_asset_type=0;
    strcpy(v_crncy_type, "CNY");
    v_contrc_unit=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    strcpy(v_busi_config_str, " ");
    strcpy(v_busi_ctrl_str, " ");
    strcpy(v_asac_busi_config_str, " ");
    strcpy(v_split_fee_typr_str, " ");
    strcpy(v_busi_limit_str, " ");
    strcpy(v_out_acco, " ");
    v_nav_asset=0;
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
    v_report_date=0;
    v_report_time=0;
    v_comm_batch_no=0;
    v_comm_limit_price=0;
    v_wtdraw_date=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_strike_price=0;
    v_calc_dir=1;
    v_occur_qty=0;
    v_occur_amt=0;
    v_trade_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_trade_capt_amt=0;
    v_posi_capt_amt=0;
    v_rece_margin=0;
    v_margin_ratio=0;
    v_comm_margin=0;
    v_compli_trig_id=0;
    strcpy(v_order_oper_way, " ");
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
    v_order_date = lpInBizMsg->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_order_id = lpInBizMsg->GetInt64(LDBIZ_ORDER_ID_INT64);

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

    //检查撤单重复，并获取订单信息
    //调用过程[事务_交易期货_交易_检查获取撤单订单信息]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.73", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req0->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.73]subcall timed out!");
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
    v_busi_opor_no = lpTSCall1Ans0->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_co_no = lpTSCall1Ans0->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans0->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans0->GetInt32(LDBIZ_PASS_NO_INT);
    v_exch_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_NO_INT);
    v_contrc_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_futu_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    strcpy(v_contrc_code, lpTSCall1Ans0->GetString(LDBIZ_CONTRC_CODE_STR));
    v_contrc_type = lpTSCall1Ans0->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_dir = lpTSCall1Ans0->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpTSCall1Ans0->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    strcpy(v_comb_code, lpTSCall1Ans0->GetString(LDBIZ_COMB_CODE_STR));
    v_comm_id = lpTSCall1Ans0->GetInt64(LDBIZ_COMM_ID_INT64);
    v_order_time = lpTSCall1Ans0->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_order_dir = lpTSCall1Ans0->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_order_price = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_frozen_amt = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
    strcpy(v_order_status, lpTSCall1Ans0->GetString(LDBIZ_ORDER_STATUS_STR));
    v_price_type = lpTSCall1Ans0->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strike_qty = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_all_fee = lpTSCall1Ans0->GetDouble(LDBIZ_ALL_FEE_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans0->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_wtdraw_time = lpTSCall1Ans0->GetInt32(LDBIZ_WTDRAW_TIME_INT);
    v_order_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);


    // set @交易币种#="CNY";
    strcpy(v_exch_crncy_type,"CNY");
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

    //公共子系统检查，检查交易日期时间
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


    // set @业务控制配置串# = @交易组业务控制配置串#;
    strcpy(v_busi_config_str,v_exgp_busi_config_str);

    // set @业务控制串# = "11111";
    strcpy(v_busi_ctrl_str,"11111");
    //调用过程[事务_产品_交易接口_检查期货交易产品账户信息]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("prodT.8.108", 0);
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
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.8.108]subcall timed out!");
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
    v_pass_no = lpTSCall1Ans3->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans3->GetString(LDBIZ_OUT_ACCO_STR));
    v_nav_asset = lpTSCall1Ans3->GetDouble(LDBIZ_NAV_ASSET_FLOAT);

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

    // end if;
    }

    //处理撤销
    //调用过程[事务_交易期货_交易_撤销订单]
    //组织事务请求
    if(lpTSCall1Ans6)
    {
      lpTSCall1Ans6->FreeMsg();
      lpTSCall1Ans6=NULL;
    }
    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.12", 0);
    lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req6->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req6->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req6->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req6->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpTSCall1Req6->SetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT,v_exgp_avail_qty);
    lpTSCall1Req6->SetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT,v_asac_avail_qty);
    lpTSCall1Req6->SetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT,v_exgp_long_rece_margin);
    lpTSCall1Req6->SetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT,v_exgp_short_rece_margin);
    lpTSCall1Req6->SetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT,v_asac_long_rece_margin);
    lpTSCall1Req6->SetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT,v_asac_short_rece_margin);
    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
    if(!lpTSCall1Ans6)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.12]subcall timed out!");
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
    v_init_date = lpTSCall1Ans6->GetInt32(LDBIZ_INIT_DATE_INT);
    v_pd_no = lpTSCall1Ans6->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans6->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpTSCall1Ans6->GetInt32(LDBIZ_EXCH_NO_INT);
    v_pass_no = lpTSCall1Ans6->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_crncy_type, lpTSCall1Ans6->GetString(LDBIZ_CRNCY_TYPE_STR));
    strcpy(v_futu_acco, lpTSCall1Ans6->GetString(LDBIZ_FUTU_ACCO_STR));
    strcpy(v_contrc_code, lpTSCall1Ans6->GetString(LDBIZ_CONTRC_CODE_STR));
    v_contrc_type = lpTSCall1Ans6->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_dir = lpTSCall1Ans6->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpTSCall1Ans6->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_external_no = lpTSCall1Ans6->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_report_date = lpTSCall1Ans6->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpTSCall1Ans6->GetInt32(LDBIZ_REPORT_TIME_INT);
    strcpy(v_report_no, lpTSCall1Ans6->GetString(LDBIZ_REPORT_NO_STR));
    v_comm_id = lpTSCall1Ans6->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_limit_price = lpTSCall1Ans6->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
    v_order_batch_no = lpTSCall1Ans6->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_order_price = lpTSCall1Ans6->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans6->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    strcpy(v_order_status, lpTSCall1Ans6->GetString(LDBIZ_ORDER_STATUS_STR));
    v_order_time = lpTSCall1Ans6->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_order_dir = lpTSCall1Ans6->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_wtdraw_date = lpTSCall1Ans6->GetInt32(LDBIZ_WTDRAW_DATE_INT);
    v_wtdraw_time = lpTSCall1Ans6->GetInt32(LDBIZ_WTDRAW_TIME_INT);
    v_wtdraw_qty = lpTSCall1Ans6->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    strcpy(v_wtdraw_status, lpTSCall1Ans6->GetString(LDBIZ_WTDRAW_STATUS_STR));
    v_report_fee = lpTSCall1Ans6->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
    v_wtdraw_fee = lpTSCall1Ans6->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
    v_strike_qty = lpTSCall1Ans6->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans6->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_price = lpTSCall1Ans6->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
    v_calc_dir = lpTSCall1Ans6->GetInt32(LDBIZ_CALC_DIR_INT);
    v_occur_qty = lpTSCall1Ans6->GetDouble(LDBIZ_OCCUR_QTY_FLOAT);
    v_occur_amt = lpTSCall1Ans6->GetDouble(LDBIZ_OCCUR_AMT_FLOAT);
    v_trade_fee = lpTSCall1Ans6->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
    v_trade_commis = lpTSCall1Ans6->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_other_commis = lpTSCall1Ans6->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    v_trade_capt_amt = lpTSCall1Ans6->GetDouble(LDBIZ_TRADE_CAPT_AMT_FLOAT);
    v_posi_capt_amt = lpTSCall1Ans6->GetDouble(LDBIZ_POSI_CAPT_AMT_FLOAT);
    strcpy(v_comb_code, lpTSCall1Ans6->GetString(LDBIZ_COMB_CODE_STR));
    v_rece_margin = lpTSCall1Ans6->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_margin_ratio = lpTSCall1Ans6->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);
    v_comm_margin = lpTSCall1Ans6->GetDouble(LDBIZ_COMM_MARGIN_FLOAT);
    strcpy(v_rsp_info, lpTSCall1Ans6->GetString(LDBIZ_RSP_INFO_STR));
    v_compli_trig_id = lpTSCall1Ans6->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);
    strcpy(v_order_oper_way, lpTSCall1Ans6->GetString(LDBIZ_ORDER_OPER_WAY_STR));
    v_update_times = lpTSCall1Ans6->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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

    //主推报盘撤单
    //[主动推送][futu.rptwtdraw][期货主推_报盘_撤单主推报盘消息]
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


    // if @指令批号# > 0  then
    if (v_comm_batch_no > 0 )
    {
        //调用过程[事务_交易期货_指令_获取指令汇总]
        //组织事务请求
        if(lpTSCall1Ans10)
        {
          lpTSCall1Ans10->FreeMsg();
          lpTSCall1Ans10=NULL;
        }
        lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.4", 0);
        lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req10->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
        lpTSCall1Req10->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpTSCall1Req10->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req10->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
        glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
        if(!lpTSCall1Ans10)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.4]subcall timed out!");
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
        v_comm_time = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_TIME_INT);
        v_comm_opor = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_OPOR_INT);
        v_comm_dir = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_DIR_INT);
        v_comm_limit_price = lpTSCall1Ans10->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
        v_limit_actual_price = lpTSCall1Ans10->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
        v_comm_qty = lpTSCall1Ans10->GetDouble(LDBIZ_COMM_QTY_FLOAT);
        v_comm_amt = lpTSCall1Ans10->GetDouble(LDBIZ_COMM_AMT_FLOAT);
        v_order_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_comm_cancel_qty = lpTSCall1Ans10->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
        v_comm_await_cancel_qty = lpTSCall1Ans10->GetDouble(LDBIZ_COMM_AWAIT_CANCEL_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans10->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_strike_qty = lpTSCall1Ans10->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        strcpy(v_strike_status, lpTSCall1Ans10->GetString(LDBIZ_STRIKE_STATUS_STR));
        strcpy(v_comm_sum_status, lpTSCall1Ans10->GetString(LDBIZ_COMM_SUM_STATUS_STR));
        v_comm_begin_date = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
        v_comm_end_date = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_END_DATE_INT);
        v_comm_begin_time = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
        v_comm_end_time = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_END_TIME_INT);
        v_comm_comple_date = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
        v_comm_comple_time = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
        v_max_comm_comple_date = lpTSCall1Ans10->GetInt32(LDBIZ_MAX_COMM_COMPLE_DATE_INT);
        v_max_comm_comple_time = lpTSCall1Ans10->GetInt32(LDBIZ_MAX_COMM_COMPLE_TIME_INT);
        v_comm_appr_date = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
        v_comm_appr_time = lpTSCall1Ans10->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
        v_comm_appr_qty = lpTSCall1Ans10->GetDouble(LDBIZ_COMM_APPR_QTY_FLOAT);
        strcpy(v_comm_sum_approve_status, lpTSCall1Ans10->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
        v_buy_order_qty = lpTSCall1Ans10->GetDouble(LDBIZ_BUY_ORDER_QTY_FLOAT);
        v_sell_order_qty = lpTSCall1Ans10->GetDouble(LDBIZ_SELL_ORDER_QTY_FLOAT);
        v_buy_comm_qty = lpTSCall1Ans10->GetDouble(LDBIZ_BUY_COMM_QTY_FLOAT);
        v_sell_comm_qty = lpTSCall1Ans10->GetDouble(LDBIZ_SELL_COMM_QTY_FLOAT);
        v_buy_strike_qty = lpTSCall1Ans10->GetDouble(LDBIZ_BUY_STRIKE_QTY_FLOAT);
        v_sell_strike_qty = lpTSCall1Ans10->GetDouble(LDBIZ_SELL_STRIKE_QTY_FLOAT);
        v_buy_strike_amt = lpTSCall1Ans10->GetDouble(LDBIZ_BUY_STRIKE_AMT_FLOAT);
        v_sell_strike_amt = lpTSCall1Ans10->GetDouble(LDBIZ_SELL_STRIKE_AMT_FLOAT);
        v_buy_comm_amt = lpTSCall1Ans10->GetDouble(LDBIZ_BUY_COMM_AMT_FLOAT);
        v_sell_comm_amt = lpTSCall1Ans10->GetDouble(LDBIZ_SELL_COMM_AMT_FLOAT);
        v_rece_margin = lpTSCall1Ans10->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_comm_oper_way, lpTSCall1Ans10->GetString(LDBIZ_COMM_OPER_WAY_STR));
        v_update_times = lpTSCall1Ans10->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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
    lpOutBizMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpOutBizMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpOutBizMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpOutBizMsg->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpOutBizMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpOutBizMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpOutBizMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpOutBizMsg->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
    lpOutBizMsg->SetString(LDBIZ_WTDRAW_STATUS_STR,v_wtdraw_status);
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
    if(lpTSCall1Ans12)
        lpTSCall1Ans12->FreeMsg();
    return iRet;
}

//逻辑_交易期货_交易_更新订单状态
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
    int64 v_order_id;
    char v_order_status[3];
    int v_order_date;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_row_id;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_futu_acco_no;
    int v_contrc_code_no;
    int64 v_external_no;
    int v_asset_type;
    int v_contrc_type;
    int v_contrc_unit;
    int v_contrc_dir;
    int v_hedge_type;
    double v_report_fee;
    int v_order_dir;
    int v_order_time;
    double v_order_price;
    double v_order_qty;
    double v_strike_qty;
    double v_strike_amt;
    double v_wtdraw_fee;
    double v_wtdraw_qty;
    double v_strike_price;
    double v_trade_fee;
    double v_trade_commis;
    double v_other_commis;
    int64 v_comm_id;
    int v_comm_batch_no;
    char v_comb_code[7];
    double v_rece_margin;
    double v_margin_ratio;
    int64 v_compli_trig_id;
    int v_order_batch_no;
    char v_order_oper_way[3];
    int v_pass_no;
    char v_out_acco[33];
    int v_exch_no;
    char v_futu_acco[17];
    char v_contrc_code[7];
    int v_report_time;
    char v_report_no[33];
    int v_lngsht_type;
    int v_report_date;
    char v_rsp_info[256];
    int v_busi_opor_no;
    int v_update_times;
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
    v_order_id=0;
    strcpy(v_order_status, "0");
    v_order_date=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_row_id=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_futu_acco_no=0;
    v_contrc_code_no=0;
    v_external_no=0;
    v_asset_type=0;
    v_contrc_type=0;
    v_contrc_unit=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    v_report_fee=0;
    v_order_dir=0;
    v_order_time=0;
    v_order_price=0;
    v_order_qty=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_wtdraw_fee=0;
    v_wtdraw_qty=0;
    v_strike_price=0;
    v_trade_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_comm_id=0;
    v_comm_batch_no=0;
    strcpy(v_comb_code, " ");
    v_rece_margin=0;
    v_margin_ratio=0;
    v_compli_trig_id=0;
    v_order_batch_no=0;
    strcpy(v_order_oper_way, " ");
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    strcpy(v_futu_acco, " ");
    strcpy(v_contrc_code, " ");
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_lngsht_type=0;
    v_report_date=0;
    strcpy(v_rsp_info, " ");
    v_busi_opor_no=0;
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
    v_order_id = lpInBizMsg->GetInt64(LDBIZ_ORDER_ID_INT64);
    strncpy(v_order_status, lpInBizMsg->GetString(LDBIZ_ORDER_STATUS_STR),2);
    v_order_status[2] = '\0';
    v_order_date = lpInBizMsg->GetInt32(LDBIZ_ORDER_DATE_INT);

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

    //调用过程[事务_交易期货_交易_更新订单状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.21", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req1->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.21]subcall timed out!");
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

    //调用过程[事务_交易期货_交易_获取订单]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.27", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.27]subcall timed out!");
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
    v_row_id = lpTSCall1Ans2->GetInt64(LDBIZ_ROW_ID_INT64);
    v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans2->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_futu_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    v_contrc_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_external_no = lpTSCall1Ans2->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_asset_type = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_contrc_type = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_unit = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_UNIT_INT);
    v_contrc_dir = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpTSCall1Ans2->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_report_fee = lpTSCall1Ans2->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
    v_order_dir = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_order_time = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_order_price = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    strcpy(v_order_status, lpTSCall1Ans2->GetString(LDBIZ_ORDER_STATUS_STR));
    v_strike_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_wtdraw_fee = lpTSCall1Ans2->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans2->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_price = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
    v_trade_fee = lpTSCall1Ans2->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
    v_trade_commis = lpTSCall1Ans2->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_other_commis = lpTSCall1Ans2->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    v_comm_id = lpTSCall1Ans2->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    strcpy(v_comb_code, lpTSCall1Ans2->GetString(LDBIZ_COMB_CODE_STR));
    v_rece_margin = lpTSCall1Ans2->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_margin_ratio = lpTSCall1Ans2->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);
    v_compli_trig_id = lpTSCall1Ans2->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);
    v_order_batch_no = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strcpy(v_order_oper_way, lpTSCall1Ans2->GetString(LDBIZ_ORDER_OPER_WAY_STR));
    v_pass_no = lpTSCall1Ans2->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans2->GetString(LDBIZ_OUT_ACCO_STR));
    v_exch_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_NO_INT);
    strcpy(v_futu_acco, lpTSCall1Ans2->GetString(LDBIZ_FUTU_ACCO_STR));
    strcpy(v_contrc_code, lpTSCall1Ans2->GetString(LDBIZ_CONTRC_CODE_STR));
    v_report_time = lpTSCall1Ans2->GetInt32(LDBIZ_REPORT_TIME_INT);
    strcpy(v_report_no, lpTSCall1Ans2->GetString(LDBIZ_REPORT_NO_STR));
    v_lngsht_type = lpTSCall1Ans2->GetInt32(LDBIZ_LNGSHT_TYPE_INT);
    v_report_date = lpTSCall1Ans2->GetInt32(LDBIZ_REPORT_DATE_INT);
    strcpy(v_rsp_info, lpTSCall1Ans2->GetString(LDBIZ_RSP_INFO_STR));
    v_busi_opor_no = lpTSCall1Ans2->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_update_times = lpTSCall1Ans2->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // set @操作员编号# = @业务操作员编号#;
    v_opor_no = v_busi_opor_no;

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

//逻辑_交易期货_交易_查询报盘订单
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
    int v_init_date;
    int v_pass_no;
    int v_row_count;
    int64 v_row_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_exch_no;
    char v_futu_acco[17];
    char v_contrc_code[7];
    int v_contrc_type;
    int v_contrc_unit;
    char v_out_acco[33];
    int64 v_external_no;
    int v_contrc_dir;
    int v_hedge_type;
    int64 v_order_id;
    int v_order_date;
    int v_order_dir;
    double v_order_qty;
    double v_order_price;
    char v_order_status[3];
    int v_update_times;
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
    v_init_date=0;
    v_pass_no=0;
    v_row_count=-1;
    v_row_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    strcpy(v_futu_acco, " ");
    strcpy(v_contrc_code, " ");
    v_contrc_type=0;
    v_contrc_unit=0;
    strcpy(v_out_acco, " ");
    v_external_no=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    v_order_id=0;
    v_order_date=0;
    v_order_dir=0;
    v_order_qty=0;
    v_order_price=0;
    strcpy(v_order_status, "0");
    v_update_times=1;
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
    v_init_date = lpInBizMsg->GetInt32(LDBIZ_INIT_DATE_INT);
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);

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


    // if @指定行数# <=0 then
    if (v_row_count <=0)
    {

      // set @指定行数# = 1;
      v_row_count = 1;
    // end if;
    }


    // if @指定行数# > 50 then
    if (v_row_count > 50)
    {

      // set @指定行数# = 50;
      v_row_count = 50;
    // end if;
    }

    //调用过程[事务_交易期货_交易_查询报盘订单]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.15", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.15]subcall timed out!");
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

//逻辑_交易期货_交易_查询报盘撤单
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
    int v_init_date;
    int v_pass_no;
    int v_row_count;
    int64 v_row_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_asset_acco_no;
    int v_exch_no;
    char v_contrc_code[7];
    int64 v_external_no;
    char v_out_acco[33];
    int64 v_order_id;
    char v_report_no[33];
    double v_wtdraw_qty;
    char v_wtdraw_status[3];
    int v_update_times;
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
    v_init_date=0;
    v_pass_no=0;
    v_row_count=-1;
    v_row_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_asset_acco_no=0;
    v_exch_no=0;
    strcpy(v_contrc_code, " ");
    v_external_no=0;
    strcpy(v_out_acco, " ");
    v_order_id=0;
    strcpy(v_report_no, " ");
    v_wtdraw_qty=0;
    strcpy(v_wtdraw_status, "0");
    v_update_times=1;
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
    v_init_date = lpInBizMsg->GetInt32(LDBIZ_INIT_DATE_INT);
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);

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


    // if @指定行数# <=0 then
    if (v_row_count <=0)
    {

      // set @指定行数# = 1;
      v_row_count = 1;
    // end if;
    }


    // if @指定行数# > 50 then
    if (v_row_count > 50)
    {

      // set @指定行数# = 50;
      v_row_count = 50;
    // end if;
    }

    //调用过程[事务_交易期货_交易_查询报盘撤单]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.16", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.16]subcall timed out!");
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

//逻辑_交易期货_交易_查询订单
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
    int v_busi_opor_no;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_pass_no;
    char v_exch_no_str[2049];
    int v_contrc_code_no;
    char v_contrc_type_str[2049];
    int64 v_comm_id;
    int v_comm_batch_no;
    int v_comm_opor;
    int64 v_external_no;
    int v_order_batch_no;
    int64 v_order_id;
    char v_order_dir_str[1025];
    char v_order_status_str[65];
    int64 v_row_id;
    int v_row_count;
    int v_sort_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    int v_asset_acco_no;
    char v_out_acco[33];
    int v_exch_no;
    int v_futu_acco_no;
    int v_asset_type;
    int v_contrc_type;
    int v_contrc_unit;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_dir;
    int v_contrc_dir;
    int v_hedge_type;
    double v_order_price;
    double v_order_qty;
    char v_order_status[3];
    double v_wtdraw_qty;
    double v_strike_qty;
    double v_strike_price;
    double v_strike_amt;
    double v_trade_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_strike_commis;
    double v_strike_other_commis;
    double v_strike_all_fee;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_rece_margin;
    double v_trade_occur_amt;
    char v_comb_code[7];
    double v_margin_ratio;
    char v_rsp_info[256];
    int64 v_compli_trig_id;
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
    v_busi_opor_no=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_pass_no=0;
    strcpy(v_exch_no_str, " ");
    v_contrc_code_no=0;
    strcpy(v_contrc_type_str, " ");
    v_comm_id=0;
    v_comm_batch_no=0;
    v_comm_opor=0;
    v_external_no=0;
    v_order_batch_no=0;
    v_order_id=0;
    strcpy(v_order_dir_str, " ");
    strcpy(v_order_status_str, " ");
    v_row_id=0;
    v_row_count=-1;
    v_sort_type=1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    v_asset_acco_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    v_futu_acco_no=0;
    v_asset_type=0;
    v_contrc_type=0;
    v_contrc_unit=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_dir=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    v_order_price=0;
    v_order_qty=0;
    strcpy(v_order_status, "0");
    v_wtdraw_qty=0;
    v_strike_qty=0;
    v_strike_price=0;
    v_strike_amt=0;
    v_trade_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_strike_commis=0;
    v_strike_other_commis=0;
    v_strike_all_fee=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_rece_margin=0;
    v_trade_occur_amt=0;
    strcpy(v_comb_code, " ");
    v_margin_ratio=0;
    strcpy(v_rsp_info, " ");
    v_compli_trig_id=0;
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
    v_busi_opor_no = lpInBizMsg->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_contrc_code_no = lpInBizMsg->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strncpy(v_contrc_type_str, lpInBizMsg->GetString(LDBIZ_CONTRC_TYPE_STR_STR),2048);
    v_contrc_type_str[2048] = '\0';
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpInBizMsg->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_opor = lpInBizMsg->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_external_no = lpInBizMsg->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpInBizMsg->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_order_id = lpInBizMsg->GetInt64(LDBIZ_ORDER_ID_INT64);
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    strncpy(v_order_status_str, lpInBizMsg->GetString(LDBIZ_ORDER_STATUS_STR_STR),64);
    v_order_status_str[64] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);
    v_sort_type = lpInBizMsg->GetInt32(LDBIZ_SORT_TYPE_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //公共子系统检查，检查交易日期时间

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

    //调用过程[事务_交易期货_交易_查询订单]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.101", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req1->SetString(LDBIZ_CONTRC_TYPE_STR_STR,v_contrc_type_str);
    lpTSCall1Req1->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpTSCall1Req1->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpTSCall1Req1->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_STATUS_STR_STR,v_order_status_str);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.101]subcall timed out!");
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

//逻辑_交易期货_交易_查询订单历史
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
    int v_busi_opor_no;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_pass_no;
    char v_exch_no_str[2049];
    int v_contrc_code_no;
    char v_contrc_type_str[2049];
    int64 v_comm_id;
    int v_comm_batch_no;
    int v_comm_opor;
    int64 v_external_no;
    int v_order_batch_no;
    int64 v_order_id;
    char v_order_dir_str[1025];
    char v_order_status_str[65];
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    int v_asset_acco_no;
    char v_out_acco[33];
    int v_exch_no;
    int v_futu_acco_no;
    int v_asset_type;
    int v_contrc_type;
    int v_contrc_unit;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_dir;
    int v_contrc_dir;
    int v_hedge_type;
    double v_order_price;
    double v_order_qty;
    char v_order_status[3];
    double v_wtdraw_qty;
    double v_strike_qty;
    double v_strike_price;
    double v_strike_amt;
    double v_trade_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_strike_commis;
    double v_strike_other_commis;
    double v_strike_all_fee;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_rece_margin;
    double v_trade_occur_amt;
    char v_comb_code[7];
    double v_margin_ratio;
    char v_rsp_info[256];
    int64 v_compli_trig_id;
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
    v_busi_opor_no=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_pass_no=0;
    strcpy(v_exch_no_str, " ");
    v_contrc_code_no=0;
    strcpy(v_contrc_type_str, " ");
    v_comm_id=0;
    v_comm_batch_no=0;
    v_comm_opor=0;
    v_external_no=0;
    v_order_batch_no=0;
    v_order_id=0;
    strcpy(v_order_dir_str, " ");
    strcpy(v_order_status_str, " ");
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    v_asset_acco_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    v_futu_acco_no=0;
    v_asset_type=0;
    v_contrc_type=0;
    v_contrc_unit=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_dir=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    v_order_price=0;
    v_order_qty=0;
    strcpy(v_order_status, "0");
    v_wtdraw_qty=0;
    v_strike_qty=0;
    v_strike_price=0;
    v_strike_amt=0;
    v_trade_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_strike_commis=0;
    v_strike_other_commis=0;
    v_strike_all_fee=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_rece_margin=0;
    v_trade_occur_amt=0;
    strcpy(v_comb_code, " ");
    v_margin_ratio=0;
    strcpy(v_rsp_info, " ");
    v_compli_trig_id=0;
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
    v_busi_opor_no = lpInBizMsg->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_contrc_code_no = lpInBizMsg->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strncpy(v_contrc_type_str, lpInBizMsg->GetString(LDBIZ_CONTRC_TYPE_STR_STR),2048);
    v_contrc_type_str[2048] = '\0';
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpInBizMsg->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_opor = lpInBizMsg->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_external_no = lpInBizMsg->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpInBizMsg->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_order_id = lpInBizMsg->GetInt64(LDBIZ_ORDER_ID_INT64);
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    strncpy(v_order_status_str, lpInBizMsg->GetString(LDBIZ_ORDER_STATUS_STR_STR),64);
    v_order_status_str[64] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //公共子系统检查，检查交易日期时间

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

    //调用过程[事务_交易期货_交易_查询订单历史]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.102", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req1->SetString(LDBIZ_CONTRC_TYPE_STR_STR,v_contrc_type_str);
    lpTSCall1Req1->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpTSCall1Req1->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpTSCall1Req1->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_STATUS_STR_STR,v_order_status_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.102]subcall timed out!");
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

//逻辑_交易期货_交易_查询汇总订单结果集
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
    int v_busi_opor_no;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_pass_no;
    char v_exch_no_str[2049];
    int v_contrc_code_no;
    char v_contrc_type_str[2049];
    int64 v_external_no;
    int v_order_batch_no;
    int64 v_order_id;
    char v_order_dir_str[1025];
    char v_order_sum_status_str[65];
    char v_order_oper_way[3];
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
    int v_asset_acco_no;
    char v_crncy_type[4];
    int v_exch_no;
    char v_contrc_code[7];
    int v_asset_type;
    int v_contrc_type;
    int v_contrc_unit;
    int v_order_date;
    int v_order_dir;
    int v_contrc_dir;
    int v_hedge_type;
    double v_order_price;
    double v_order_qty;
    char v_order_sum_status[3];
    double v_wtdraw_qty;
    double v_waste_qty;
    double v_strike_qty;
    double v_strike_aver_price;
    double v_strike_amt;
    double v_trade_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_strike_commis;
    double v_strike_other_commis;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_strike_all_fee;
    double v_rece_margin;
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
    v_busi_opor_no=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_pass_no=0;
    strcpy(v_exch_no_str, " ");
    v_contrc_code_no=0;
    strcpy(v_contrc_type_str, " ");
    v_external_no=0;
    v_order_batch_no=0;
    v_order_id=0;
    strcpy(v_order_dir_str, " ");
    strcpy(v_order_sum_status_str, " ");
    strcpy(v_order_oper_way, " ");
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
    v_asset_acco_no=0;
    strcpy(v_crncy_type, "CNY");
    v_exch_no=0;
    strcpy(v_contrc_code, " ");
    v_asset_type=0;
    v_contrc_type=0;
    v_contrc_unit=0;
    v_order_date=0;
    v_order_dir=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    v_order_price=0;
    v_order_qty=0;
    strcpy(v_order_sum_status, "0");
    v_wtdraw_qty=0;
    v_waste_qty=0;
    v_strike_qty=0;
    v_strike_aver_price=0;
    v_strike_amt=0;
    v_trade_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_strike_commis=0;
    v_strike_other_commis=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_strike_all_fee=0;
    v_rece_margin=0;
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
    v_busi_opor_no = lpInBizMsg->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_contrc_code_no = lpInBizMsg->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strncpy(v_contrc_type_str, lpInBizMsg->GetString(LDBIZ_CONTRC_TYPE_STR_STR),2048);
    v_contrc_type_str[2048] = '\0';
    v_external_no = lpInBizMsg->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpInBizMsg->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_order_id = lpInBizMsg->GetInt64(LDBIZ_ORDER_ID_INT64);
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    strncpy(v_order_sum_status_str, lpInBizMsg->GetString(LDBIZ_ORDER_SUM_STATUS_STR_STR),64);
    v_order_sum_status_str[64] = '\0';
    strncpy(v_order_oper_way, lpInBizMsg->GetString(LDBIZ_ORDER_OPER_WAY_STR),2);
    v_order_oper_way[2] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);
    v_sort_type = lpInBizMsg->GetInt32(LDBIZ_SORT_TYPE_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //公共子系统检查，检查交易日期时间

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

    //调用过程[事务_交易期货_交易_查询汇总订单结果集]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.20", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req1->SetString(LDBIZ_CONTRC_TYPE_STR_STR,v_contrc_type_str);
    lpTSCall1Req1->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpTSCall1Req1->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_SUM_STATUS_STR_STR,v_order_sum_status_str);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.20]subcall timed out!");
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

//逻辑_交易期货_交易_查询历史汇总订单结果集
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
    int v_busi_opor_no;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_pass_no;
    char v_exch_no_str[2049];
    int v_contrc_code_no;
    char v_contrc_type_str[2049];
    int64 v_external_no;
    int v_order_batch_no;
    int64 v_order_id;
    char v_order_dir_str[1025];
    char v_order_sum_status_str[65];
    char v_order_oper_way[3];
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
    int v_asset_acco_no;
    char v_crncy_type[4];
    int v_exch_no;
    char v_contrc_code[7];
    int v_asset_type;
    int v_contrc_type;
    int v_contrc_unit;
    int v_order_date;
    int v_order_dir;
    int v_contrc_dir;
    int v_hedge_type;
    double v_order_price;
    double v_order_qty;
    char v_order_sum_status[3];
    double v_wtdraw_qty;
    double v_waste_qty;
    double v_strike_qty;
    double v_strike_aver_price;
    double v_strike_amt;
    double v_trade_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_strike_commis;
    double v_strike_other_commis;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_strike_all_fee;
    double v_rece_margin;
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
    v_busi_opor_no=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_pass_no=0;
    strcpy(v_exch_no_str, " ");
    v_contrc_code_no=0;
    strcpy(v_contrc_type_str, " ");
    v_external_no=0;
    v_order_batch_no=0;
    v_order_id=0;
    strcpy(v_order_dir_str, " ");
    strcpy(v_order_sum_status_str, " ");
    strcpy(v_order_oper_way, " ");
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
    v_asset_acco_no=0;
    strcpy(v_crncy_type, "CNY");
    v_exch_no=0;
    strcpy(v_contrc_code, " ");
    v_asset_type=0;
    v_contrc_type=0;
    v_contrc_unit=0;
    v_order_date=0;
    v_order_dir=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    v_order_price=0;
    v_order_qty=0;
    strcpy(v_order_sum_status, "0");
    v_wtdraw_qty=0;
    v_waste_qty=0;
    v_strike_qty=0;
    v_strike_aver_price=0;
    v_strike_amt=0;
    v_trade_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_strike_commis=0;
    v_strike_other_commis=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_strike_all_fee=0;
    v_rece_margin=0;
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
    v_busi_opor_no = lpInBizMsg->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_contrc_code_no = lpInBizMsg->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strncpy(v_contrc_type_str, lpInBizMsg->GetString(LDBIZ_CONTRC_TYPE_STR_STR),2048);
    v_contrc_type_str[2048] = '\0';
    v_external_no = lpInBizMsg->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpInBizMsg->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_order_id = lpInBizMsg->GetInt64(LDBIZ_ORDER_ID_INT64);
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    strncpy(v_order_sum_status_str, lpInBizMsg->GetString(LDBIZ_ORDER_SUM_STATUS_STR_STR),64);
    v_order_sum_status_str[64] = '\0';
    strncpy(v_order_oper_way, lpInBizMsg->GetString(LDBIZ_ORDER_OPER_WAY_STR),2);
    v_order_oper_way[2] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);
    v_sort_type = lpInBizMsg->GetInt32(LDBIZ_SORT_TYPE_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //公共子系统检查，检查交易日期时间

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

    //调用过程[事务_交易期货_交易_查询历史汇总订单结果集]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.22", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req1->SetString(LDBIZ_CONTRC_TYPE_STR_STR,v_contrc_type_str);
    lpTSCall1Req1->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpTSCall1Req1->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_SUM_STATUS_STR_STR,v_order_sum_status_str);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.22]subcall timed out!");
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

//逻辑_交易期货_交易_新增改单
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
    int64 v_external_no;
    int v_order_date;
    int64 v_order_id;
    int v_modi_batch_no;
    double v_modi_order_price;
    double v_modi_order_qty;
    int v_modi_price_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    int v_exch_no;
    int v_trade_code_no;
    int v_contrc_code_no;
    char v_report_no[33];
    int64 v_comm_id;
    int64 v_modi_order_id;
    int64 v_new_order_id;
    int v_order_dir;
    double v_order_qty;
    double v_order_price;
    int64 v_wtdraw_id;
    double v_wtdraw_qty;
    char v_wtdraw_status[3];
    int64 v_compli_trig_id;
    char v_old_order_status[3];
    char v_new_order_status[3];
    int v_tmp_opor_no;
    int64 v_ori_order_id;
    int v_busi_opor_no;
    int v_futu_acco_no;
    char v_contrc_code[7];
    int v_contrc_type;
    int v_contrc_dir;
    int v_hedge_type;
    char v_comb_code[7];
    int v_order_time;
    double v_order_frozen_amt;
    char v_order_status[3];
    int v_price_type;
    double v_strike_qty;
    double v_strike_amt;
    double v_all_fee;
    int v_wtdraw_time;
    int v_order_batch_no;
    double v_tmp_order_qty;
    int v_lngsht_type;
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_exgp_busi_config_str[65];
    int v_asset_type;
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    int v_contrc_unit;
    int v_capit_reback_days;
    int v_posi_reback_days;
    char v_busi_config_str[65];
    char v_busi_ctrl_str[65];
    char v_asac_busi_config_str[65];
    char v_split_fee_typr_str[65];
    char v_busi_limit_str[2049];
    double v_nav_asset;
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
    char v_asset_acco[17];
    char v_trade_code[7];
    int v_report_date;
    int v_report_time;
    double v_order_frozen_qty;
    int v_comm_date;
    int v_comm_batch_no;
    int v_comm_executor;
    int v_wtdraw_date;
    char v_rsp_info[256];
    char v_contrc_name[65];
    char v_order_oper_way[3];
    double v_rece_margin;
    double v_strike_price;
    double v_trade_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_margin_ratio;
    int v_update_times;
    int64 v_row_id;
    char v_oper_func_code[17];
    char v_order_sum_status[3];
    double v_waste_qty;
    double v_strike_aver_price;
    double v_strike_commis;
    double v_strike_other_commis;
    double v_strike_all_fee;
    int v_modi_order_date;
    int v_modi_order_time;
    int v_comm_opor;
    char v_remark_info[256];
    double v_deli_fee;
    double v_other_fee;
    int v_margin_pref;
    int v_trig_stage_type;
    int v_calc_dir;
    char v_modi_order_status[3];
    double v_curr_strike_price;
    double v_curr_strike_amt;
    double v_curr_strike_qty;
    int64 v_strike_id;
    int v_comm_time;
    int v_comm_dir;
    double v_comm_limit_price;
    double v_limit_actual_price;
    double v_comm_qty;
    double v_comm_amt;
    double v_comm_cancel_qty;
    double v_comm_frozen_amt;
    double v_comm_frozen_qty;
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
    v_external_no=0;
    v_order_date=0;
    v_order_id=0;
    v_modi_batch_no=0;
    v_modi_order_price=0;
    v_modi_order_qty=0;
    v_modi_price_type=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    v_trade_code_no=0;
    v_contrc_code_no=0;
    strcpy(v_report_no, " ");
    v_comm_id=0;
    v_modi_order_id=0;
    v_new_order_id=0;
    v_order_dir=0;
    v_order_qty=0;
    v_order_price=0;
    v_wtdraw_id=0;
    v_wtdraw_qty=0;
    strcpy(v_wtdraw_status, "0");
    v_compli_trig_id=0;
    strcpy(v_old_order_status, "0");
    strcpy(v_new_order_status, "0");
    v_tmp_opor_no=0;
    v_ori_order_id=0;
    v_busi_opor_no=0;
    v_futu_acco_no=0;
    strcpy(v_contrc_code, " ");
    v_contrc_type=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    strcpy(v_comb_code, " ");
    v_order_time=0;
    v_order_frozen_amt=0;
    strcpy(v_order_status, "0");
    v_price_type=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_all_fee=0;
    v_wtdraw_time=0;
    v_order_batch_no=0;
    v_tmp_order_qty=0;
    v_lngsht_type=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_exgp_busi_config_str, " ");
    v_asset_type=0;
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_contrc_unit=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    strcpy(v_busi_config_str, " ");
    strcpy(v_busi_ctrl_str, " ");
    strcpy(v_asac_busi_config_str, " ");
    strcpy(v_split_fee_typr_str, " ");
    strcpy(v_busi_limit_str, " ");
    v_nav_asset=0;
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
    strcpy(v_asset_acco, " ");
    strcpy(v_trade_code, " ");
    v_report_date=0;
    v_report_time=0;
    v_order_frozen_qty=0;
    v_comm_date=0;
    v_comm_batch_no=0;
    v_comm_executor=0;
    v_wtdraw_date=0;
    strcpy(v_rsp_info, " ");
    strcpy(v_contrc_name, " ");
    strcpy(v_order_oper_way, " ");
    v_rece_margin=0;
    v_strike_price=0;
    v_trade_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_margin_ratio=0;
    v_update_times=1;
    v_row_id=0;
    strcpy(v_oper_func_code, " ");
    strcpy(v_order_sum_status, "0");
    v_waste_qty=0;
    v_strike_aver_price=0;
    v_strike_commis=0;
    v_strike_other_commis=0;
    v_strike_all_fee=0;
    v_modi_order_date=0;
    v_modi_order_time=0;
    v_comm_opor=0;
    strcpy(v_remark_info, " ");
    v_deli_fee=0;
    v_other_fee=0;
    v_margin_pref=0;
    v_trig_stage_type=0;
    v_calc_dir=1;
    strcpy(v_modi_order_status, " ");
    v_curr_strike_price=0;
    v_curr_strike_amt=0;
    v_curr_strike_qty=0;
    v_strike_id=0;
    v_comm_time=0;
    v_comm_dir=0;
    v_comm_limit_price=0;
    v_limit_actual_price=0;
    v_comm_qty=0;
    v_comm_amt=0;
    v_comm_cancel_qty=0;
    v_comm_frozen_amt=0;
    v_comm_frozen_qty=0;
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
    v_external_no = lpInBizMsg->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_date = lpInBizMsg->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_order_id = lpInBizMsg->GetInt64(LDBIZ_ORDER_ID_INT64);
    v_modi_batch_no = lpInBizMsg->GetInt32(LDBIZ_MODI_BATCH_NO_INT);
    v_modi_order_price = lpInBizMsg->GetDouble(LDBIZ_MODI_ORDER_PRICE_FLOAT);
    v_modi_order_qty = lpInBizMsg->GetDouble(LDBIZ_MODI_ORDER_QTY_FLOAT);
    v_modi_price_type = lpInBizMsg->GetInt32(LDBIZ_MODI_PRICE_TYPE_INT);

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


    // set @临时_操作员编号# = @操作员编号#;
    v_tmp_opor_no = v_opor_no;

    // set @原订单序号# = @订单序号#;
    v_ori_order_id = v_order_id;
    //取原委托信息
    //调用过程[事务_交易期货_交易_检查获取撤单订单信息]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.73", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req0->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.73]subcall timed out!");
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
    v_busi_opor_no = lpTSCall1Ans0->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_co_no = lpTSCall1Ans0->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans0->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans0->GetInt32(LDBIZ_PASS_NO_INT);
    v_exch_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_NO_INT);
    v_contrc_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_futu_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    strcpy(v_contrc_code, lpTSCall1Ans0->GetString(LDBIZ_CONTRC_CODE_STR));
    v_contrc_type = lpTSCall1Ans0->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_dir = lpTSCall1Ans0->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpTSCall1Ans0->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    strcpy(v_comb_code, lpTSCall1Ans0->GetString(LDBIZ_COMB_CODE_STR));
    v_comm_id = lpTSCall1Ans0->GetInt64(LDBIZ_COMM_ID_INT64);
    v_order_time = lpTSCall1Ans0->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_order_dir = lpTSCall1Ans0->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_order_price = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_frozen_amt = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
    strcpy(v_order_status, lpTSCall1Ans0->GetString(LDBIZ_ORDER_STATUS_STR));
    v_price_type = lpTSCall1Ans0->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strike_qty = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_all_fee = lpTSCall1Ans0->GetDouble(LDBIZ_ALL_FEE_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans0->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_wtdraw_time = lpTSCall1Ans0->GetInt32(LDBIZ_WTDRAW_TIME_INT);
    v_order_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);


    // set @临时_订单数量# = @订单数量#;
    v_tmp_order_qty = v_order_qty;
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

    //公共子系统检查，检查交易日期时间
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


    // set @业务控制配置串# = @交易组业务控制配置串#;
    strcpy(v_busi_config_str,v_exgp_busi_config_str);
    //产品子系统检查，检查账户状态，获取当前资金等

    // set @业务控制串# = "11111";
    strcpy(v_busi_ctrl_str,"11111");
    //调用过程[事务_产品_交易接口_检查期货交易产品账户信息]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("prodT.8.108", 0);
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
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.8.108]subcall timed out!");
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
    v_pass_no = lpTSCall1Ans3->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans3->GetString(LDBIZ_OUT_ACCO_STR));
    v_nav_asset = lpTSCall1Ans3->GetDouble(LDBIZ_NAV_ASSET_FLOAT);

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

    //平仓需要处理持仓,持仓涉及到昨日收盘价的变化
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

    //新增改单处理
    //调用过程[事务_交易期货_交易_新增改单]
    //组织事务请求
    if(lpTSCall1Ans6)
    {
      lpTSCall1Ans6->FreeMsg();
      lpTSCall1Ans6=NULL;
    }
    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.23", 0);
    lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req6->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req6->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req6->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req6->SetInt32(LDBIZ_MODI_BATCH_NO_INT,v_modi_batch_no);
    lpTSCall1Req6->SetDouble(LDBIZ_MODI_ORDER_PRICE_FLOAT,v_modi_order_price);
    lpTSCall1Req6->SetDouble(LDBIZ_MODI_ORDER_QTY_FLOAT,v_modi_order_qty);
    lpTSCall1Req6->SetInt32(LDBIZ_MODI_PRICE_TYPE_INT,v_modi_price_type);
    lpTSCall1Req6->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req6->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req6->SetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT,v_exgp_long_rece_margin);
    lpTSCall1Req6->SetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT,v_exgp_short_rece_margin);
    lpTSCall1Req6->SetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT,v_asac_long_rece_margin);
    lpTSCall1Req6->SetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT,v_asac_short_rece_margin);
    lpTSCall1Req6->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpTSCall1Req6->SetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT,v_exgp_avail_qty);
    lpTSCall1Req6->SetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT,v_asac_avail_qty);
    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
    if(!lpTSCall1Ans6)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.23]subcall timed out!");
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
    v_co_no = lpTSCall1Ans6->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans6->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans6->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strcpy(v_asset_acco, lpTSCall1Ans6->GetString(LDBIZ_ASSET_ACCO_STR));
    v_pass_no = lpTSCall1Ans6->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans6->GetString(LDBIZ_OUT_ACCO_STR));
    v_exch_no = lpTSCall1Ans6->GetInt32(LDBIZ_EXCH_NO_INT);
    v_trade_code_no = lpTSCall1Ans6->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
    strcpy(v_trade_code, lpTSCall1Ans6->GetString(LDBIZ_TRADE_CODE_STR));
    strcpy(v_contrc_code, lpTSCall1Ans6->GetString(LDBIZ_CONTRC_CODE_STR));
    strcpy(v_report_no, lpTSCall1Ans6->GetString(LDBIZ_REPORT_NO_STR));
    v_report_date = lpTSCall1Ans6->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpTSCall1Ans6->GetInt32(LDBIZ_REPORT_TIME_INT);
    v_comm_id = lpTSCall1Ans6->GetInt64(LDBIZ_COMM_ID_INT64);
    v_modi_order_id = lpTSCall1Ans6->GetInt64(LDBIZ_MODI_ORDER_ID_INT64);
    v_new_order_id = lpTSCall1Ans6->GetInt64(LDBIZ_NEW_ORDER_ID_INT64);
    v_order_dir = lpTSCall1Ans6->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_contrc_dir = lpTSCall1Ans6->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpTSCall1Ans6->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_order_qty = lpTSCall1Ans6->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_price = lpTSCall1Ans6->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_batch_no = lpTSCall1Ans6->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_order_frozen_amt = lpTSCall1Ans6->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
    v_order_frozen_qty = lpTSCall1Ans6->GetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT);
    v_comm_date = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_batch_no = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_executor = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_wtdraw_id = lpTSCall1Ans6->GetInt64(LDBIZ_WTDRAW_ID_INT64);
    v_wtdraw_qty = lpTSCall1Ans6->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    strcpy(v_wtdraw_status, lpTSCall1Ans6->GetString(LDBIZ_WTDRAW_STATUS_STR));
    v_wtdraw_date = lpTSCall1Ans6->GetInt32(LDBIZ_WTDRAW_DATE_INT);
    v_wtdraw_time = lpTSCall1Ans6->GetInt32(LDBIZ_WTDRAW_TIME_INT);
    strcpy(v_rsp_info, lpTSCall1Ans6->GetString(LDBIZ_RSP_INFO_STR));
    v_strike_amt = lpTSCall1Ans6->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_qty = lpTSCall1Ans6->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_compli_trig_id = lpTSCall1Ans6->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);
    strcpy(v_old_order_status, lpTSCall1Ans6->GetString(LDBIZ_OLD_ORDER_STATUS_STR));
    strcpy(v_new_order_status, lpTSCall1Ans6->GetString(LDBIZ_NEW_ORDER_STATUS_STR));
    strcpy(v_order_status, lpTSCall1Ans6->GetString(LDBIZ_ORDER_STATUS_STR));
    strcpy(v_contrc_name, lpTSCall1Ans6->GetString(LDBIZ_CONTRC_NAME_STR));
    strcpy(v_order_oper_way, lpTSCall1Ans6->GetString(LDBIZ_ORDER_OPER_WAY_STR));
    v_rece_margin = lpTSCall1Ans6->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_strike_price = lpTSCall1Ans6->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
    v_trade_fee = lpTSCall1Ans6->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
    v_trade_commis = lpTSCall1Ans6->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_other_commis = lpTSCall1Ans6->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    v_report_fee = lpTSCall1Ans6->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
    v_wtdraw_fee = lpTSCall1Ans6->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
    v_margin_ratio = lpTSCall1Ans6->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);
    v_update_times = lpTSCall1Ans6->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // set @原订单状态# = @订单状态#;
    strcpy(v_old_order_status,v_order_status);

    // set @记录序号# = @订单序号#;
    v_row_id = v_order_id;

    // set @交易费用# = 0;
    v_trade_fee = 0;

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

    //订单汇总主推

    // if @订单批号#>0 then
    if (v_order_batch_no>0)
    {
        //调用过程[事务_交易期货_交易_获取订单汇总]
        //组织事务请求
        if(lpTSCall1Ans7)
        {
          lpTSCall1Ans7->FreeMsg();
          lpTSCall1Ans7=NULL;
        }
        lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.19", 0);
        lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req7->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpTSCall1Req7->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
        lpTSCall1Req7->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
        if(!lpTSCall1Ans7)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.19]subcall timed out!");
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
        strcpy(v_oper_func_code, lpTSCall1Ans7->GetString(LDBIZ_OPER_FUNC_CODE_STR));
        v_init_date = lpTSCall1Ans7->GetInt32(LDBIZ_INIT_DATE_INT);
        v_pd_no = lpTSCall1Ans7->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans7->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans7->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans7->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_crncy_type, lpTSCall1Ans7->GetString(LDBIZ_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans7->GetInt32(LDBIZ_EXCH_NO_INT);
        v_contrc_code_no = lpTSCall1Ans7->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans7->GetString(LDBIZ_CONTRC_CODE_STR));
        v_asset_type = lpTSCall1Ans7->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_type = lpTSCall1Ans7->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_contrc_unit = lpTSCall1Ans7->GetInt32(LDBIZ_CONTRC_UNIT_INT);
        v_external_no = lpTSCall1Ans7->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
        v_order_dir = lpTSCall1Ans7->GetInt32(LDBIZ_ORDER_DIR_INT);
        v_contrc_dir = lpTSCall1Ans7->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans7->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_order_price = lpTSCall1Ans7->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        strcpy(v_order_sum_status, lpTSCall1Ans7->GetString(LDBIZ_ORDER_SUM_STATUS_STR));
        v_wtdraw_qty = lpTSCall1Ans7->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
        v_waste_qty = lpTSCall1Ans7->GetDouble(LDBIZ_WASTE_QTY_FLOAT);
        v_strike_qty = lpTSCall1Ans7->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_strike_aver_price = lpTSCall1Ans7->GetDouble(LDBIZ_STRIKE_AVER_PRICE_FLOAT);
        v_strike_amt = lpTSCall1Ans7->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_trade_fee = lpTSCall1Ans7->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
        v_trade_commis = lpTSCall1Ans7->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_other_commis = lpTSCall1Ans7->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_strike_commis = lpTSCall1Ans7->GetDouble(LDBIZ_STRIKE_COMMIS_FLOAT);
        v_strike_other_commis = lpTSCall1Ans7->GetDouble(LDBIZ_STRIKE_OTHER_COMMIS_FLOAT);
        v_report_fee = lpTSCall1Ans7->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
        v_wtdraw_fee = lpTSCall1Ans7->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
        v_strike_all_fee = lpTSCall1Ans7->GetDouble(LDBIZ_STRIKE_ALL_FEE_FLOAT);
        v_rece_margin = lpTSCall1Ans7->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_order_oper_way, lpTSCall1Ans7->GetString(LDBIZ_ORDER_OPER_WAY_STR));
        v_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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

    //内部撤单 直接下达新订单

    // if @撤单状态# = 《撤单状态-成功》 then
    if (strcmp(v_wtdraw_status , "3")==0)
    {
        //改单处理
        //调用过程[事务_交易期货_交易_更新获取改单信息]
        //组织事务请求
        if(lpTSCall1Ans8)
        {
          lpTSCall1Ans8->FreeMsg();
          lpTSCall1Ans8=NULL;
        }
        lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.24", 0);
        lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req8->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpTSCall1Req8->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
        glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
        if(!lpTSCall1Ans8)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.24]subcall timed out!");
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
        v_modi_order_id = lpTSCall1Ans8->GetInt64(LDBIZ_MODI_ORDER_ID_INT64);
        v_modi_order_date = lpTSCall1Ans8->GetInt32(LDBIZ_MODI_ORDER_DATE_INT);
        v_modi_order_time = lpTSCall1Ans8->GetInt32(LDBIZ_MODI_ORDER_TIME_INT);
        v_modi_batch_no = lpTSCall1Ans8->GetInt32(LDBIZ_MODI_BATCH_NO_INT);
        v_modi_order_price = lpTSCall1Ans8->GetDouble(LDBIZ_MODI_ORDER_PRICE_FLOAT);
        v_modi_order_qty = lpTSCall1Ans8->GetDouble(LDBIZ_MODI_ORDER_QTY_FLOAT);
        v_modi_price_type = lpTSCall1Ans8->GetInt32(LDBIZ_MODI_PRICE_TYPE_INT);
        v_exch_no = lpTSCall1Ans8->GetInt32(LDBIZ_EXCH_NO_INT);
        v_contrc_code_no = lpTSCall1Ans8->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans8->GetString(LDBIZ_CONTRC_CODE_STR));
        strcpy(v_crncy_type, lpTSCall1Ans8->GetString(LDBIZ_CRNCY_TYPE_STR));
        strcpy(v_exch_crncy_type, lpTSCall1Ans8->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        strcpy(v_order_oper_way, lpTSCall1Ans8->GetString(LDBIZ_ORDER_OPER_WAY_STR));
        v_busi_opor_no = lpTSCall1Ans8->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);


        // if @改单序号# <> 0 then
        if (v_modi_order_id != 0)
        {

          // set @订单数量# = @临时_订单数量#;
          v_order_qty = v_tmp_order_qty;

          // set @成交数量# = @订单数量# - @撤单数量#;
          v_strike_qty = v_order_qty - v_wtdraw_qty;

          // set @订单数量# = @改单数量# - @成交数量#;
          v_order_qty = v_modi_order_qty - v_strike_qty;

          // set @订单价格# = @改单价格#;
          v_order_price = v_modi_order_price;

          // set @指令下达人# = @临时_操作员编号#;
          v_comm_opor = v_tmp_opor_no;

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
            //获取保证金优惠订单费用
            //调用过程[事务_公共_公共接口_获取保证金优惠组合编码订单费用]
            //组织事务请求
            if(lpTSCall1Ans9)
            {
              lpTSCall1Ans9->FreeMsg();
              lpTSCall1Ans9=NULL;
            }
            lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("pubT.24.255", 0);
            lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req9->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
            lpTSCall1Req9->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpTSCall1Req9->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
            lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
            lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
            lpTSCall1Req9->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
            lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
            lpTSCall1Req9->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
            lpTSCall1Req9->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
            lpTSCall1Req9->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
            glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
            if(!lpTSCall1Ans9)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.255]subcall timed out!");
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
            v_rece_margin = lpTSCall1Ans9->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
            v_trade_commis = lpTSCall1Ans9->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
            v_report_fee = lpTSCall1Ans9->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
            v_wtdraw_fee = lpTSCall1Ans9->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
            v_deli_fee = lpTSCall1Ans9->GetDouble(LDBIZ_DELI_FEE_FLOAT);
            v_other_fee = lpTSCall1Ans9->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
            v_other_commis = lpTSCall1Ans9->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
            v_all_fee = lpTSCall1Ans9->GetDouble(LDBIZ_ALL_FEE_FLOAT);
            v_margin_pref = lpTSCall1Ans9->GetInt32(LDBIZ_MARGIN_PREF_INT);
            strcpy(v_comb_code, lpTSCall1Ans9->GetString(LDBIZ_COMB_CODE_STR));
            v_margin_ratio = lpTSCall1Ans9->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);


            // set @交易费用# = @全部费用#;
            v_trade_fee = v_all_fee;

            // if @错误编码# = "0" then
            if (strcmp(v_error_code , "0")==0)
            {

                // set @触发阶段类型# = 《触发阶段类型-交易端》;
                v_trig_stage_type = 2;
                //调用过程[事务_风控期货_接口_检查客户风险]
                //组织事务请求
                if(lpTSCall1Ans10)
                {
                  lpTSCall1Ans10->FreeMsg();
                  lpTSCall1Ans10=NULL;
                }
                lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("rkfutuT.5.1", 0);
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
                lpTSCall1Req10->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpTSCall1Req10->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpTSCall1Req10->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
                lpTSCall1Req10->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
                lpTSCall1Req10->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
                lpTSCall1Req10->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
                lpTSCall1Req10->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
                lpTSCall1Req10->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
                lpTSCall1Req10->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
                lpTSCall1Req10->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
                lpTSCall1Req10->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
                lpTSCall1Req10->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
                lpTSCall1Req10->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
                lpTSCall1Req10->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
                lpTSCall1Req10->SetInt32(LDBIZ_TRIG_STAGE_TYPE_INT,v_trig_stage_type);
                glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
                if(!lpTSCall1Ans10)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rkfutuT.5.1]subcall timed out!");
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
                //获取输出参数值
                strcpy(v_error_code, lpTSCall1Ans10->GetString(LDBIZ_ERROR_CODE_STR));
                strcpy(v_error_info, lpTSCall1Ans10->GetString(LDBIZ_ERROR_INFO_STR));
                v_compli_trig_id = lpTSCall1Ans10->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);

            // end if;
            }


            // if @错误编码# = "0" then
            if (strcmp(v_error_code , "0")==0)
            {

                // set @计算方向# = 《计算方向-加上》;
                v_calc_dir = 1;
                //调用过程[事务_交易期货_交易_新增订单]
                //组织事务请求
                if(lpTSCall1Ans11)
                {
                  lpTSCall1Ans11->FreeMsg();
                  lpTSCall1Ans11=NULL;
                }
                lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.11", 0);
                lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req11->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
                lpTSCall1Req11->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                lpTSCall1Req11->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpTSCall1Req11->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpTSCall1Req11->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                lpTSCall1Req11->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpTSCall1Req11->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
                lpTSCall1Req11->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpTSCall1Req11->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
                lpTSCall1Req11->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
                lpTSCall1Req11->SetString(LDBIZ_FUTU_ACCO_STR,v_futu_acco);
                lpTSCall1Req11->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
                lpTSCall1Req11->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
                lpTSCall1Req11->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
                lpTSCall1Req11->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
                lpTSCall1Req11->SetString(LDBIZ_BUSI_LIMIT_STR_STR,v_busi_limit_str);
                lpTSCall1Req11->SetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR,v_exgp_busi_config_str);
                lpTSCall1Req11->SetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR,v_asac_busi_config_str);
                lpTSCall1Req11->SetDouble(LDBIZ_EXGP_AVAIL_AMT_FLOAT,v_exgp_avail_amt);
                lpTSCall1Req11->SetDouble(LDBIZ_ASAC_AVAIL_AMT_FLOAT,v_asac_avail_amt);
                lpTSCall1Req11->SetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT,v_exgp_avail_qty);
                lpTSCall1Req11->SetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT,v_asac_avail_qty);
                lpTSCall1Req11->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
                lpTSCall1Req11->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
                lpTSCall1Req11->SetInt32(LDBIZ_CALC_DIR_INT,v_calc_dir);
                lpTSCall1Req11->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
                lpTSCall1Req11->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
                lpTSCall1Req11->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
                lpTSCall1Req11->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
                lpTSCall1Req11->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
                lpTSCall1Req11->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
                lpTSCall1Req11->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
                lpTSCall1Req11->SetDouble(LDBIZ_REPORT_FEE_FLOAT,v_report_fee);
                lpTSCall1Req11->SetDouble(LDBIZ_WTDRAW_FEE_FLOAT,v_wtdraw_fee);
                lpTSCall1Req11->SetDouble(LDBIZ_TRADE_FEE_FLOAT,v_trade_fee);
                lpTSCall1Req11->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
                lpTSCall1Req11->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
                lpTSCall1Req11->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
                lpTSCall1Req11->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
                lpTSCall1Req11->SetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT,v_up_limit_price);
                lpTSCall1Req11->SetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT,v_down_limit_price);
                lpTSCall1Req11->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
                lpTSCall1Req11->SetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT,v_exgp_long_rece_margin);
                lpTSCall1Req11->SetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT,v_exgp_short_rece_margin);
                lpTSCall1Req11->SetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT,v_asac_long_rece_margin);
                lpTSCall1Req11->SetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT,v_asac_short_rece_margin);
                lpTSCall1Req11->SetInt64(LDBIZ_COMPLI_TRIG_ID_INT64,v_compli_trig_id);
                lpTSCall1Req11->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
                lpTSCall1Req11->SetDouble(LDBIZ_MARGIN_RATIO_FLOAT,v_margin_ratio);
                glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
                if(!lpTSCall1Ans11)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.11]subcall timed out!");
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
                //获取输出参数值
                strcpy(v_error_code, lpTSCall1Ans11->GetString(LDBIZ_ERROR_CODE_STR));
                strcpy(v_error_info, lpTSCall1Ans11->GetString(LDBIZ_ERROR_INFO_STR));
                v_order_id = lpTSCall1Ans11->GetInt64(LDBIZ_ORDER_ID_INT64);
                v_order_date = lpTSCall1Ans11->GetInt32(LDBIZ_ORDER_DATE_INT);
                v_order_time = lpTSCall1Ans11->GetInt32(LDBIZ_ORDER_TIME_INT);
                strcpy(v_order_status, lpTSCall1Ans11->GetString(LDBIZ_ORDER_STATUS_STR));
                v_comm_batch_no = lpTSCall1Ans11->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
                v_report_date = lpTSCall1Ans11->GetInt32(LDBIZ_REPORT_DATE_INT);
                v_report_time = lpTSCall1Ans11->GetInt32(LDBIZ_REPORT_TIME_INT);
                v_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_UPDATE_TIMES_INT);

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

              // set @交易费用# = 0;
              v_trade_fee = 0;
              //主动推送

              // set @记录序号# = @订单序号#;
              v_row_id = v_order_id;

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
            if(lpTSCall1Ans12)
            {
              lpTSCall1Ans12->FreeMsg();
              lpTSCall1Ans12=NULL;
            }
            lpTSCall1Req12=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.25", 0);
            lpTSCall1Req12->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req12->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req12->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req12->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req12->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req12->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req12->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req12->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req12->SetInt32(LDBIZ_MODI_ORDER_DATE_INT,v_modi_order_date);
            lpTSCall1Req12->SetInt64(LDBIZ_MODI_ORDER_ID_INT64,v_modi_order_id);
            lpTSCall1Req12->SetString(LDBIZ_MODI_ORDER_STATUS_STR,v_modi_order_status);
            lpTSCall1Req12->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
            lpTSCall1Req12->SetInt64(LDBIZ_NEW_ORDER_ID_INT64,v_new_order_id);
            glpTSSubcallSerives->SubCall(lpTSCall1Req12, &lpTSCall1Ans12, 5000);
            if(!lpTSCall1Ans12)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.25]subcall timed out!");
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
            if(lpTSCall1Ans13)
            {
              lpTSCall1Ans13->FreeMsg();
              lpTSCall1Ans13=NULL;
            }
            lpTSCall1Req13=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.25", 0);
            lpTSCall1Req13->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req13->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req13->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req13->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req13->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req13->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req13->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req13->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req13->SetInt32(LDBIZ_MODI_ORDER_DATE_INT,v_modi_order_date);
            lpTSCall1Req13->SetInt64(LDBIZ_MODI_ORDER_ID_INT64,v_modi_order_id);
            lpTSCall1Req13->SetString(LDBIZ_MODI_ORDER_STATUS_STR,v_modi_order_status);
            lpTSCall1Req13->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
            lpTSCall1Req13->SetInt64(LDBIZ_NEW_ORDER_ID_INT64,v_new_order_id);
            glpTSSubcallSerives->SubCall(lpTSCall1Req13, &lpTSCall1Ans13, 5000);
            if(!lpTSCall1Ans13)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.25]subcall timed out!");
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


            // [报错返回][715][@订单数量#]
                strcpy(v_error_code,"tdfutuL.4.33.715");
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
            if(lpTSCall1Ans14)
            {
              lpTSCall1Ans14->FreeMsg();
              lpTSCall1Ans14=NULL;
            }
            lpTSCall1Req14=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.3", 0);
            lpTSCall1Req14->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req14->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req14->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req14->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req14->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req14->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req14->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req14->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req14->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
            glpTSSubcallSerives->SubCall(lpTSCall1Req14, &lpTSCall1Ans14, 5000);
            if(!lpTSCall1Ans14)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.3]subcall timed out!");
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
            v_co_no = lpTSCall1Ans14->GetInt32(LDBIZ_CO_NO_INT);
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
            v_comm_date = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_DATE_INT);
            v_comm_time = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_TIME_INT);
            v_comm_batch_no = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
            v_comm_opor = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_OPOR_INT);
            v_comm_executor = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
            v_comm_dir = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_DIR_INT);
            v_comm_limit_price = lpTSCall1Ans14->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
            v_limit_actual_price = lpTSCall1Ans14->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
            v_comm_qty = lpTSCall1Ans14->GetDouble(LDBIZ_COMM_QTY_FLOAT);
            v_comm_amt = lpTSCall1Ans14->GetDouble(LDBIZ_COMM_AMT_FLOAT);
            v_order_qty = lpTSCall1Ans14->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
            v_comm_cancel_qty = lpTSCall1Ans14->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
            v_strike_amt = lpTSCall1Ans14->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
            v_strike_qty = lpTSCall1Ans14->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
            v_comm_frozen_amt = lpTSCall1Ans14->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
            v_comm_frozen_qty = lpTSCall1Ans14->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
            v_rece_margin = lpTSCall1Ans14->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
            v_capit_reback_days = lpTSCall1Ans14->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
            v_posi_reback_days = lpTSCall1Ans14->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
            strcpy(v_strike_status, lpTSCall1Ans14->GetString(LDBIZ_STRIKE_STATUS_STR));
            strcpy(v_comm_status, lpTSCall1Ans14->GetString(LDBIZ_COMM_STATUS_STR));
            v_comm_begin_date = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
            v_comm_end_date = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_END_DATE_INT);
            v_comm_begin_time = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
            v_comm_end_time = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_END_TIME_INT);
            v_comm_comple_date = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
            v_comm_comple_time = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
            v_comm_appr_date = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
            v_comm_appr_time = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
            strcpy(v_comm_appr_status, lpTSCall1Ans14->GetString(LDBIZ_COMM_APPR_STATUS_STR));
            v_comm_appr_oper_no = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_APPR_OPER_NO_INT);
            v_comm_appr_oper = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
            strcpy(v_comm_appr_remark, lpTSCall1Ans14->GetString(LDBIZ_COMM_APPR_REMARK_STR));
            v_external_no = lpTSCall1Ans14->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
            strcpy(v_comb_code, lpTSCall1Ans14->GetString(LDBIZ_COMB_CODE_STR));
            strcpy(v_comm_oper_way, lpTSCall1Ans14->GetString(LDBIZ_COMM_OPER_WAY_STR));
            strcpy(v_remark_info, lpTSCall1Ans14->GetString(LDBIZ_REMARK_INFO_STR));
            v_comm_comple_flag = lpTSCall1Ans14->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
            v_update_times = lpTSCall1Ans14->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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

        //指令汇总主推

        // if @指令批号# > 0  then
        if (v_comm_batch_no > 0 )
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

        //订单汇总主推

        // if @订单批号#>0 then
        if (v_order_batch_no>0)
        {
            //调用过程[事务_交易期货_交易_获取订单汇总]
            //组织事务请求
            if(lpTSCall1Ans18)
            {
              lpTSCall1Ans18->FreeMsg();
              lpTSCall1Ans18=NULL;
            }
            lpTSCall1Req18=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.19", 0);
            lpTSCall1Req18->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req18->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req18->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req18->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req18->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req18->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req18->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req18->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req18->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
            lpTSCall1Req18->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
            lpTSCall1Req18->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            glpTSSubcallSerives->SubCall(lpTSCall1Req18, &lpTSCall1Ans18, 5000);
            if(!lpTSCall1Ans18)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.19]subcall timed out!");
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
            v_row_id = lpTSCall1Ans18->GetInt64(LDBIZ_ROW_ID_INT64);
            strcpy(v_oper_func_code, lpTSCall1Ans18->GetString(LDBIZ_OPER_FUNC_CODE_STR));
            v_init_date = lpTSCall1Ans18->GetInt32(LDBIZ_INIT_DATE_INT);
            v_pd_no = lpTSCall1Ans18->GetInt32(LDBIZ_PD_NO_INT);
            v_exch_group_no = lpTSCall1Ans18->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
            v_asset_acco_no = lpTSCall1Ans18->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            v_pass_no = lpTSCall1Ans18->GetInt32(LDBIZ_PASS_NO_INT);
            strcpy(v_crncy_type, lpTSCall1Ans18->GetString(LDBIZ_CRNCY_TYPE_STR));
            v_exch_no = lpTSCall1Ans18->GetInt32(LDBIZ_EXCH_NO_INT);
            v_contrc_code_no = lpTSCall1Ans18->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
            strcpy(v_contrc_code, lpTSCall1Ans18->GetString(LDBIZ_CONTRC_CODE_STR));
            v_asset_type = lpTSCall1Ans18->GetInt32(LDBIZ_ASSET_TYPE_INT);
            v_contrc_type = lpTSCall1Ans18->GetInt32(LDBIZ_CONTRC_TYPE_INT);
            v_contrc_unit = lpTSCall1Ans18->GetInt32(LDBIZ_CONTRC_UNIT_INT);
            v_external_no = lpTSCall1Ans18->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
            v_order_dir = lpTSCall1Ans18->GetInt32(LDBIZ_ORDER_DIR_INT);
            v_contrc_dir = lpTSCall1Ans18->GetInt32(LDBIZ_CONTRC_DIR_INT);
            v_hedge_type = lpTSCall1Ans18->GetInt32(LDBIZ_HEDGE_TYPE_INT);
            v_order_price = lpTSCall1Ans18->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
            v_order_qty = lpTSCall1Ans18->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
            strcpy(v_order_sum_status, lpTSCall1Ans18->GetString(LDBIZ_ORDER_SUM_STATUS_STR));
            v_wtdraw_qty = lpTSCall1Ans18->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
            v_waste_qty = lpTSCall1Ans18->GetDouble(LDBIZ_WASTE_QTY_FLOAT);
            v_strike_qty = lpTSCall1Ans18->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
            v_strike_aver_price = lpTSCall1Ans18->GetDouble(LDBIZ_STRIKE_AVER_PRICE_FLOAT);
            v_strike_amt = lpTSCall1Ans18->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
            v_trade_fee = lpTSCall1Ans18->GetDouble(LDBIZ_TRADE_FEE_FLOAT);
            v_trade_commis = lpTSCall1Ans18->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
            v_other_commis = lpTSCall1Ans18->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
            v_strike_commis = lpTSCall1Ans18->GetDouble(LDBIZ_STRIKE_COMMIS_FLOAT);
            v_strike_other_commis = lpTSCall1Ans18->GetDouble(LDBIZ_STRIKE_OTHER_COMMIS_FLOAT);
            v_report_fee = lpTSCall1Ans18->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
            v_wtdraw_fee = lpTSCall1Ans18->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
            v_strike_all_fee = lpTSCall1Ans18->GetDouble(LDBIZ_STRIKE_ALL_FEE_FLOAT);
            v_rece_margin = lpTSCall1Ans18->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
            strcpy(v_order_oper_way, lpTSCall1Ans18->GetString(LDBIZ_ORDER_OPER_WAY_STR));
            v_update_times = lpTSCall1Ans18->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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
        if(lpTSCall1Ans19)
        {
          lpTSCall1Ans19->FreeMsg();
          lpTSCall1Ans19=NULL;
        }
        lpTSCall1Req19=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req19->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req19->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req19->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req19->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req19->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req19->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req19->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req19->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req19->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req19->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req19, &lpTSCall1Ans19, 5000);
        if (lpTSCall1Ans19)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans19->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans19->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans19->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans19->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans19->GetString(LDBIZ_ERROR_DEAL_STR));
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
    lpOutBizMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpOutBizMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpOutBizMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpOutBizMsg->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
    lpOutBizMsg->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpOutBizMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpOutBizMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpOutBizMsg->SetInt64(LDBIZ_MODI_ORDER_ID_INT64,v_modi_order_id);
    lpOutBizMsg->SetInt64(LDBIZ_NEW_ORDER_ID_INT64,v_new_order_id);
    lpOutBizMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpOutBizMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpOutBizMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpOutBizMsg->SetInt64(LDBIZ_WTDRAW_ID_INT64,v_wtdraw_id);
    lpOutBizMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
    lpOutBizMsg->SetString(LDBIZ_WTDRAW_STATUS_STR,v_wtdraw_status);
    lpOutBizMsg->SetInt64(LDBIZ_COMPLI_TRIG_ID_INT64,v_compli_trig_id);
    lpOutBizMsg->SetString(LDBIZ_OLD_ORDER_STATUS_STR,v_old_order_status);
    lpOutBizMsg->SetString(LDBIZ_NEW_ORDER_STATUS_STR,v_new_order_status);
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
    return iRet;
}

//逻辑_交易期货_交易_查询报盘订单主推
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
    int v_init_date;
    int v_pass_no;
    int v_row_count;
    int64 v_row_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_exch_no;
    char v_futu_acco[17];
    char v_contrc_code[7];
    int v_contrc_type;
    int v_contrc_unit;
    char v_out_acco[33];
    int64 v_external_no;
    int v_contrc_dir;
    int v_hedge_type;
    int64 v_order_id;
    int v_order_date;
    int v_order_dir;
    double v_order_qty;
    double v_order_price;
    char v_order_status[3];
    int v_update_times;
    char v_exch_crncy_type[4];
    int v_order_time;
    char v_order_oper_way[3];
    char v_log_error_code[33];
    char v_log_error_info[256];

    IGroup* lpMainMsg=NULL;
    int iRecordCount = 0;

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
    v_init_date=0;
    v_pass_no=0;
    v_row_count=-1;
    v_row_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    strcpy(v_futu_acco, " ");
    strcpy(v_contrc_code, " ");
    v_contrc_type=0;
    v_contrc_unit=0;
    strcpy(v_out_acco, " ");
    v_external_no=0;
    v_contrc_dir=0;
    v_hedge_type=0;
    v_order_id=0;
    v_order_date=0;
    v_order_dir=0;
    v_order_qty=0;
    v_order_price=0;
    strcpy(v_order_status, "0");
    v_update_times=1;
    strcpy(v_exch_crncy_type, "CNY");
    v_order_time=0;
    strcpy(v_order_oper_way, " ");
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
    v_init_date = lpInBizMsg->GetInt32(LDBIZ_INIT_DATE_INT);
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //[事务_公共_公共接口_检查系统状态权限身份]
    //调用过程[事务_公共_公共接口_获取系统初始化日期]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.53", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.53]subcall timed out!");
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


    // set @通道编号# = 0;
    v_pass_no = 0;

    // set @记录序号# =0;
    v_row_id =0;

    // set @指定行数# = 1000;
    v_row_count = 1000;

    // set @交易币种# = “ ”;
    strcpy(v_exch_crncy_type," ");

    // set @订单时间# = 0;
    v_order_time = 0;
    //调用过程[事务_交易期货_交易_查询报盘订单]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.15", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.15]subcall timed out!");
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


    // [获取结果集][lpMainMsg]
    lpMainMsg=lpTSCall1Ans1->GetGroup(LDTAG_NO_RESULTSET);


      // [遍历结果集开始][lpMainMsg]
      iRecordCount = lpMainMsg->GetRecordCount();
      for (int i = 0; i < iRecordCount;i++) 
      {
          IRecord* lpRecord =lpMainMsg->GetRecord(i);
          if(lpRecord)
          {

              //获取记录字段值
              v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
              v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
              v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
              v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
              v_pass_no = lpRecord->GetInt32(LDBIZ_PASS_NO_INT);
              v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
              strcpy(v_futu_acco, lpRecord->GetString(LDBIZ_FUTU_ACCO_STR));
              strcpy(v_contrc_code, lpRecord->GetString(LDBIZ_CONTRC_CODE_STR));
              v_contrc_type = lpRecord->GetInt32(LDBIZ_CONTRC_TYPE_INT);
              v_contrc_unit = lpRecord->GetInt32(LDBIZ_CONTRC_UNIT_INT);
              strcpy(v_out_acco, lpRecord->GetString(LDBIZ_OUT_ACCO_STR));
              v_external_no = lpRecord->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
              v_contrc_dir = lpRecord->GetInt32(LDBIZ_CONTRC_DIR_INT);
              v_hedge_type = lpRecord->GetInt32(LDBIZ_HEDGE_TYPE_INT);
              v_order_id = lpRecord->GetInt64(LDBIZ_ORDER_ID_INT64);
              v_order_date = lpRecord->GetInt32(LDBIZ_ORDER_DATE_INT);
              v_order_dir = lpRecord->GetInt32(LDBIZ_ORDER_DIR_INT);
              v_order_qty = lpRecord->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
              v_order_price = lpRecord->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
              strcpy(v_order_status, lpRecord->GetString(LDBIZ_ORDER_STATUS_STR));
              strcpy(v_order_oper_way, lpRecord->GetString(LDBIZ_ORDER_OPER_WAY_STR));
              v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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


      // [遍历结果集结束][lpMainMsg]
          }
      }


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

//逻辑_交易期货_交易_查询报盘撤单主推
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
    int v_init_date;
    int v_pass_no;
    int v_row_count;
    int64 v_row_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_asset_acco_no;
    int v_exch_no;
    char v_contrc_code[7];
    int64 v_external_no;
    char v_out_acco[33];
    int64 v_order_id;
    char v_report_no[33];
    double v_wtdraw_qty;
    char v_wtdraw_status[3];
    int v_update_times;
    int v_order_time;
    char v_futu_acco[17];
    int v_wtdraw_date;
    int v_wtdraw_time;
    int v_order_date;
    char v_log_error_code[33];
    char v_log_error_info[256];

    IGroup* lpMainMsg=NULL;
    int iRecordCount = 0;

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
    v_init_date=0;
    v_pass_no=0;
    v_row_count=-1;
    v_row_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_asset_acco_no=0;
    v_exch_no=0;
    strcpy(v_contrc_code, " ");
    v_external_no=0;
    strcpy(v_out_acco, " ");
    v_order_id=0;
    strcpy(v_report_no, " ");
    v_wtdraw_qty=0;
    strcpy(v_wtdraw_status, "0");
    v_update_times=1;
    v_order_time=0;
    strcpy(v_futu_acco, " ");
    v_wtdraw_date=0;
    v_wtdraw_time=0;
    v_order_date=0;
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
    v_init_date = lpInBizMsg->GetInt32(LDBIZ_INIT_DATE_INT);
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //[事务_公共_公共接口_检查系统状态权限身份]
    //调用过程[事务_公共_公共接口_获取系统初始化日期]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.53", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.53]subcall timed out!");
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


    // set @通道编号# = 0;
    v_pass_no = 0;

    // set @记录序号# =0;
    v_row_id =0;

    // set @指定行数# = 1000;
    v_row_count = 1000;

    // set @订单时间# = 0;
    v_order_time = 0;

    // set @交易编码# = 0;
    strcpy(v_futu_acco,"0");

    // set @撤单日期# = 0;
    v_wtdraw_date = 0;

    // set @撤单时间# = 0;
    v_wtdraw_time = 0;

    // set @订单日期# = 0;
    v_order_date = 0;
    //调用过程[事务_交易期货_交易_查询报盘撤单]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.4.16", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.4.16]subcall timed out!");
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


    // [获取结果集][lpMainMsg]
    lpMainMsg=lpTSCall1Ans1->GetGroup(LDTAG_NO_RESULTSET);


      // [遍历结果集开始][lpMainMsg]
      iRecordCount = lpMainMsg->GetRecordCount();
      for (int i = 0; i < iRecordCount;i++) 
      {
          IRecord* lpRecord =lpMainMsg->GetRecord(i);
          if(lpRecord)
          {

              //获取记录字段值
              v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
              v_pass_no = lpRecord->GetInt32(LDBIZ_PASS_NO_INT);
              v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
              strcpy(v_contrc_code, lpRecord->GetString(LDBIZ_CONTRC_CODE_STR));
              strcpy(v_out_acco, lpRecord->GetString(LDBIZ_OUT_ACCO_STR));
              v_external_no = lpRecord->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
              v_order_id = lpRecord->GetInt64(LDBIZ_ORDER_ID_INT64);
              strcpy(v_report_no, lpRecord->GetString(LDBIZ_REPORT_NO_STR));
              v_wtdraw_qty = lpRecord->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
              strcpy(v_wtdraw_status, lpRecord->GetString(LDBIZ_WTDRAW_STATUS_STR));
              v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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


      // [遍历结果集结束][lpMainMsg]
          }
      }


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

