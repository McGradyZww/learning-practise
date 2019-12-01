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
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.7.1");
        bizFuncInfo->lpFunc = fnFunc0;
    }
    else if (iFunIndex==1)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.7.2");
        bizFuncInfo->lpFunc = fnFunc1;
    }
    else if (iFunIndex==2)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.7.3");
        bizFuncInfo->lpFunc = fnFunc2;
    }
    else if (iFunIndex==3)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.7.4");
        bizFuncInfo->lpFunc = fnFunc3;
    }
    else if (iFunIndex==4)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.7.5");
        bizFuncInfo->lpFunc = fnFunc4;
    }
    else if (iFunIndex==5)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.7.6");
        bizFuncInfo->lpFunc = fnFunc5;
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
    return "20190723";
}

//逻辑_交易证券_中泰_撤销指令
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
    int v_exch_no;
    int64 v_comm_id;
    char v_cancel_info[256];
    int v_is_withdraw;
    char v_long_token[1025];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_co_no;
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_comm_date;
    int v_comm_batch_no;
    int v_comm_executor;
    char v_order_id_str[2049];
    char v_wtdraw_id_str[2049];
    int v_target_code_no;
    int v_trade_code_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    char v_exch_crncy_type[4];
    int v_stock_acco_no;
    int v_stock_code_no;
    int v_stock_type;
    int v_comm_time;
    int v_comm_opor;
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
    int v_comm_appr_oper;
    char v_comm_appr_remark[256];
    int64 v_basket_id;
    int v_net_price_flag;
    double v_bond_accr_intrst;
    int v_bond_rate_type;
    char v_comm_oper_way[3];
    int v_exter_comm_flag;
    int v_comm_comple_flag;
    double v_strategy_capt_qty;
    double v_strategy_order_qty;
    char v_contra_no[33];
    char v_comm_remark_info[1025];
    int v_disp_opor;
    int v_disp_status;
    int v_read_flag;
    int v_update_times;
    int64 v_sum_comm_row_id;
    int v_sum_comm_co_no;
    int v_sum_comm_pd_no;
    int v_sum_comm_exch_group_no;
    int v_sum_comm_asset_acco_no;
    int v_sum_comm_pass_no;
    char v_sum_comm_out_acco[33];
    char v_sum_comm_exch_crncy_type[4];
    int v_sum_comm_stock_code_no;
    int v_sum_comm_date;
    int v_sum_comm_time;
    int v_sum_comm_batch_no;
    int v_sum_comm_opor;
    int v_sum_comm_executor;
    int v_sum_comm_dir;
    double v_sum_comm_limit_price;
    double v_sum_comm_qty;
    double v_sum_comm_amt;
    double v_sum_comm_order_qty;
    double v_sum_comm_cancel_qty;
    double v_sum_comm_await_cancel_qty;
    double v_sum_comm_strike_amt;
    double v_sum_comm_strike_qty;
    char v_sum_comm_strike_status[3];
    char v_comm_sum_status[3];
    int v_sum_comm_begin_date;
    int v_sum_comm_end_date;
    int v_sum_comm_begin_time;
    int v_sum_comm_end_time;
    int v_sum_comm_comple_date;
    int v_sum_comm_comple_time;
    int v_sum_comm_max_comm_comple_date;
    int v_sum_comm_max_comm_comple_time;
    int v_sum_comm_appr_date;
    int v_sum_comm_appr_time;
    double v_sum_comm_appr_qty;
    char v_comm_sum_approve_status[3];
    int64 v_sum_comm_basket_id;
    int v_sum_comm_net_price_flag;
    double v_sum_comm_bond_accr_intrst;
    int v_sum_comm_bond_rate_type;
    char v_sum_comm_oper_way[3];
    int v_sum_comm_exter_comm_flag;
    double v_sum_buy_order_qty;
    double v_sum_sell_order_qty;
    double v_sum_buy_comm_qty;
    double v_sum_sell_comm_qty;
    double v_sum_buy_strike_qty;
    double v_sum_sell_strike_qty;
    double v_sum_buy_strike_amt;
    double v_sum_sell_strike_amt;
    double v_sum_buy_comm_amt;
    double v_sum_sell_comm_amt;
    char v_sum_comm_remark_info[256];
    int v_sum_comm_update_times;
    char v_acco_concat_info[4097];
    char v_combo_code[33];
    int64 v_exgp_cash_id;
    double v_exgp_frozen_amt;
    double v_exgp_unfroz_amt;
    double v_exgp_comm_frozen_amt;
    double v_exgp_comm_unfroz_amt;
    double v_exgp_comm_capt_amt;
    double v_exgp_comm_releas_amt;
    double v_exgp_trade_frozen_amt;
    double v_exgp_trade_unfroz_amt;
    double v_exgp_trade_capt_amt;
    double v_exgp_trade_releas_amt;
    double v_exgp_strike_capt_amt;
    double v_exgp_strike_releas_amt;
    int v_exgp_cash_update_times;
    int64 v_exgp_posi_id;
    double v_exgp_frozen_qty;
    double v_exgp_unfroz_qty;
    double v_exgp_comm_frozen_qty;
    double v_exgp_comm_unfroz_qty;
    double v_exgp_comm_capt_qty;
    double v_exgp_comm_releas_qty;
    double v_exgp_trade_frozen_qty;
    double v_exgp_trade_unfroz_qty;
    double v_exgp_trade_capt_qty;
    double v_exgp_trade_releas_qty;
    double v_exgp_strike_capt_qty;
    double v_exgp_strike_releas_qty;
    double v_exgp_strike_frozen_qty;
    double v_exgp_strike_unfroz_qty;
    double v_exgp_realize_pandl;
    double v_exgp_cost_amt;
    double v_exgp_intrst_cost_amt;
    double v_exgp_intrst_pandl;
    int v_exgp_posi_update_times;
    int64 v_asac_cash_id;
    double v_asac_frozen_amt;
    double v_asac_unfroz_amt;
    double v_asac_comm_frozen_amt;
    double v_asac_comm_unfroz_amt;
    double v_asac_comm_capt_amt;
    double v_asac_comm_releas_amt;
    double v_asac_trade_frozen_amt;
    double v_asac_trade_unfroz_amt;
    double v_asac_trade_capt_amt;
    double v_asac_trade_releas_amt;
    double v_asac_strike_capt_amt;
    double v_asac_strike_releas_amt;
    int v_asac_cash_update_times;
    int64 v_asac_posi_id;
    double v_asac_frozen_qty;
    double v_asac_unfroz_qty;
    double v_asac_comm_frozen_qty;
    double v_asac_comm_unfroz_qty;
    double v_asac_comm_capt_qty;
    double v_asac_comm_releas_qty;
    double v_asac_trade_frozen_qty;
    double v_asac_trade_unfroz_qty;
    double v_asac_trade_capt_qty;
    double v_asac_trade_releas_qty;
    double v_asac_strike_capt_qty;
    double v_asac_strike_releas_qty;
    double v_asac_strike_frozen_qty;
    double v_asac_strike_unfroz_qty;
    double v_asac_realize_pandl;
    double v_asac_cost_amt;
    double v_asac_intrst_cost_amt;
    double v_asac_intrst_pandl;
    int v_asac_posi_update_times;
    int64 v_exgp_target_posi_id;
    double v_exgp_target_frozen_qty;
    double v_exgp_target_unfroz_qty;
    double v_exgp_target_comm_frozen_qty;
    double v_exgp_target_comm_unfroz_qty;
    double v_exgp_target_comm_capt_qty;
    double v_exgp_target_comm_releas_qty;
    double v_exgp_target_trade_frozen_qty;
    double v_exgp_target_trade_unfroz_qty;
    double v_exgp_target_trade_capt_qty;
    double v_exgp_target_trade_releas_qty;
    double v_exgp_target_strike_capt_qty;
    double v_exgp_target_strike_releas_qty;
    double v_exgp_target_strike_frozen_qty;
    double v_exgp_target_strike_unfroz_qty;
    double v_exgp_target_realize_pandl;
    double v_exgp_target_cost_amt;
    double v_exgp_target_intrst_cost_amt;
    double v_exgp_target_intrst_pandl;
    int v_exgp_target_posi_update_times;
    int64 v_asac_target_posi_id;
    double v_asac_target_frozen_qty;
    double v_asac_target_unfroz_qty;
    double v_asac_target_comm_frozen_qty;
    double v_asac_target_comm_unfroz_qty;
    double v_asac_target_comm_capt_qty;
    double v_asac_target_comm_releas_qty;
    double v_asac_target_trade_frozen_qty;
    double v_asac_target_trade_unfroz_qty;
    double v_asac_target_trade_capt_qty;
    double v_asac_target_trade_releas_qty;
    double v_asac_target_strike_capt_qty;
    double v_asac_target_strike_releas_qty;
    double v_asac_target_strike_frozen_qty;
    double v_asac_target_strike_unfroz_qty;
    double v_asac_target_realize_pandl;
    double v_asac_target_cost_amt;
    double v_asac_target_intrst_cost_amt;
    double v_asac_target_intrst_pandl;
    int v_asac_target_posi_update_times;
    double v_exgp_put_impawn_qty;
    double v_asac_put_impawn_qty;
    char v_split_str[5];
    int64 v_order_id;
    int v_busi_opor_no;
    int64 v_external_no;
    char v_stock_code[7];
    char v_stock_acco[17];
    int v_order_batch_no;
    int v_order_dir;
    double v_order_price;
    int v_order_time;
    double v_wtdraw_qty;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    double v_par_value;
    double v_impawn_ratio;
    char v_rsp_info[256];
    double v_strike_bond_accr_intrst;
    int v_price_type;
    char v_order_oper_way[3];
    char v_order_status[3];
    double v_order_frozen_amt;
    double v_order_frozen_qty;
    int v_order_date;
    int64 v_combo_posi_id;
    int64 v_strategy_id;
    char v_registration_agency[33];
    char v_trade_acco[33];
    int v_asset_acco_type;
    double v_curr_strike_price;
    double v_curr_strike_amt;
    double v_curr_strike_qty;
    int64 v_strike_id;
    double v_all_fee;
    char v_wtdraw_status[3];
    int64 v_sum_order_row_id;
    int v_sum_order_opor_no;
    int v_sum_order_co_no;
    int v_sum_order_pd_no;
    int v_sum_order_exch_group_no;
    int v_sum_order_asset_acco_no;
    int v_sum_order_pass_no;
    char v_sum_order_exch_crncy_type[4];
    int v_sum_order_stock_code_no;
    int v_sum_order_trade_code_no;
    int v_sum_order_target_code_no;
    int64 v_sum_order_external_no;
    int v_sum_order_date;
    int v_sum_order_batch_no;
    int v_sum_order_dir;
    int v_sum_order_price_type;
    double v_sum_order_price;
    double v_sum_order_qty;
    char v_order_sum_status[3];
    double v_sum_order_wtdraw_qty;
    double v_sum_order_waste_qty;
    double v_sum_order_strike_amt;
    double v_sum_order_strike_qty;
    double v_sum_order_strike_aver_price;
    int v_sum_order_net_price_flag;
    double v_sum_order_bond_accr_intrst;
    int v_sum_order_bond_rate_type;
    double v_sum_order_par_value;
    double v_sum_order_impawn_ratio;
    char v_sum_order_oper_way[3];
    int v_sum_order_update_times;
    int64 v_sum_strike_row_id;
    int v_sum_strike_opor_no;
    int v_sum_strike_co_no;
    int v_sum_strike_pd_no;
    int v_sum_strike_exch_group_no;
    int v_sum_strike_asset_acco_no;
    int v_sum_strike_pass_no;
    char v_sum_strike_out_acco[33];
    int v_sum_strike_stock_acco_no;
    int v_sum_strike_stock_code_no;
    int64 v_sum_strike_comm_id;
    int v_sum_strike_report_date;
    char v_sum_strike_report_no[33];
    int v_sum_strike_order_date;
    int64 v_sum_strike_order_id;
    int v_sum_strike_order_dir;
    double v_sum_strike_order_price;
    double v_sum_strike_order_qty;
    double v_sum_strike_strike_qty;
    double v_sum_strike_strike_amt;
    double v_sum_strike_all_fee;
    double v_sum_strike_stamp_tax;
    double v_sum_strike_trans_fee;
    double v_sum_strike_brkage_fee;
    double v_sum_strike_SEC_charges;
    double v_sum_strike_other_fee;
    double v_sum_strike_trade_commis;
    double v_sum_strike_other_commis;
    double v_sum_trade_tax;
    double v_sum_trade_cost_fee;
    double v_sum_trade_system_use_fee;
    double v_sum_stock_settle_fee;
    int v_sum_strike_net_price_flag;
    double v_sum_strike_bond_accr_intrst;
    int v_sum_strike_bond_rate_type;
    char v_sum_strike_order_oper_way[3];
    int v_sum_strike_exter_comm_flag;
    int v_sum_strike_update_times;
    int v_sum_strike_order_batch_no;
    int64 v_sum_external_no;
    int64 v_wtdraw_id;
    int v_wtdraw_batch_no;
    int v_wtdraw_date;
    int v_wtdraw_time;
    char v_wtdraw_remark[256];
    int v_trade_time_flag;
    int v_strategy_dir;
    int v_margin_trade_type;
    char v_target_strategy_type[17];
    char v_strategy_status[3];
    char v_strategy_deal_status[3];
    int v_strategy_deal_kind;
    char v_strategy_oper_way[3];
    int64 v_row_id;
    int v_row_count;
    int v_sort_type;
    char v_co_no_rights_str[2049];
    char v_pd_no_rights_str[2049];
    char v_exch_group_no_rights_str[2049];
    int64 v_orig_strategy_id;
    char v_strategy_exec_broker[17];
    int v_strategy_exec_kind;
    char v_strategy_exec_comm_str[2049];
    int v_asset_type;
    double v_strategy_qty;
    double v_cash_strategy_qty;
    double v_strategy_price;
    int v_strategy_valid_type;
    char v_strategy_rule_way[5];
    char v_remark_info[256];
    int v_strategy_time;
    char v_target_strategy_param[2049];
    char v_strategy_contr_comm[2049];
    double v_strategy_amt;
    double v_order_amt;
    int v_strategy_batch_no;
    int v_strategy_date;
    int64 v_new_strategy_id;
    char v_strategy_sum_status[3];
    double v_valid_order_qty;
    double v_valid_wtdraw_qty;
    double v_cancel_qty;
    double v_faild_qty;
    char v_log_error_code[33];
    char v_log_error_info[256];

    IGroup* lpMainMsg=NULL;
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
    v_exch_no=0;
    v_comm_id=0;
    strcpy(v_cancel_info, " ");
    v_is_withdraw=0;
    strcpy(v_long_token, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_co_no=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_comm_date=0;
    v_comm_batch_no=0;
    v_comm_executor=0;
    strcpy(v_order_id_str, " ");
    strcpy(v_wtdraw_id_str, " ");
    v_target_code_no=0;
    v_trade_code_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_exch_crncy_type, "CNY");
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_stock_type=0;
    v_comm_time=0;
    v_comm_opor=0;
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
    v_comm_appr_oper=0;
    strcpy(v_comm_appr_remark, " ");
    v_basket_id=0;
    v_net_price_flag=0;
    v_bond_accr_intrst=0;
    v_bond_rate_type=0;
    strcpy(v_comm_oper_way, " ");
    v_exter_comm_flag=0;
    v_comm_comple_flag=0;
    v_strategy_capt_qty=0;
    v_strategy_order_qty=0;
    strcpy(v_contra_no, " ");
    strcpy(v_comm_remark_info, " ");
    v_disp_opor=0;
    v_disp_status=0;
    v_read_flag=0;
    v_update_times=1;
    v_sum_comm_row_id=0;
    v_sum_comm_co_no=0;
    v_sum_comm_pd_no=0;
    v_sum_comm_exch_group_no=0;
    v_sum_comm_asset_acco_no=0;
    v_sum_comm_pass_no=0;
    strcpy(v_sum_comm_out_acco, " ");
    strcpy(v_sum_comm_exch_crncy_type, "CNY");
    v_sum_comm_stock_code_no=0;
    v_sum_comm_date=0;
    v_sum_comm_time=0;
    v_sum_comm_batch_no=0;
    v_sum_comm_opor=0;
    v_sum_comm_executor=0;
    v_sum_comm_dir=0;
    v_sum_comm_limit_price=0;
    v_sum_comm_qty=0;
    v_sum_comm_amt=0;
    v_sum_comm_order_qty=0;
    v_sum_comm_cancel_qty=0;
    v_sum_comm_await_cancel_qty=0;
    v_sum_comm_strike_amt=0;
    v_sum_comm_strike_qty=0;
    strcpy(v_sum_comm_strike_status, "0");
    strcpy(v_comm_sum_status, "0");
    v_sum_comm_begin_date=0;
    v_sum_comm_end_date=0;
    v_sum_comm_begin_time=0;
    v_sum_comm_end_time=0;
    v_sum_comm_comple_date=0;
    v_sum_comm_comple_time=0;
    v_sum_comm_max_comm_comple_date=0;
    v_sum_comm_max_comm_comple_time=0;
    v_sum_comm_appr_date=0;
    v_sum_comm_appr_time=0;
    v_sum_comm_appr_qty=0;
    strcpy(v_comm_sum_approve_status, "0");
    v_sum_comm_basket_id=0;
    v_sum_comm_net_price_flag=0;
    v_sum_comm_bond_accr_intrst=0;
    v_sum_comm_bond_rate_type=0;
    strcpy(v_sum_comm_oper_way, " ");
    v_sum_comm_exter_comm_flag=0;
    v_sum_buy_order_qty=0;
    v_sum_sell_order_qty=0;
    v_sum_buy_comm_qty=0;
    v_sum_sell_comm_qty=0;
    v_sum_buy_strike_qty=0;
    v_sum_sell_strike_qty=0;
    v_sum_buy_strike_amt=0;
    v_sum_sell_strike_amt=0;
    v_sum_buy_comm_amt=0;
    v_sum_sell_comm_amt=0;
    strcpy(v_sum_comm_remark_info, " ");
    v_sum_comm_update_times=1;
    strcpy(v_acco_concat_info, " ");
    strcpy(v_combo_code, " ");
    v_exgp_cash_id=0;
    v_exgp_frozen_amt=0;
    v_exgp_unfroz_amt=0;
    v_exgp_comm_frozen_amt=0;
    v_exgp_comm_unfroz_amt=0;
    v_exgp_comm_capt_amt=0;
    v_exgp_comm_releas_amt=0;
    v_exgp_trade_frozen_amt=0;
    v_exgp_trade_unfroz_amt=0;
    v_exgp_trade_capt_amt=0;
    v_exgp_trade_releas_amt=0;
    v_exgp_strike_capt_amt=0;
    v_exgp_strike_releas_amt=0;
    v_exgp_cash_update_times=1;
    v_exgp_posi_id=0;
    v_exgp_frozen_qty=0;
    v_exgp_unfroz_qty=0;
    v_exgp_comm_frozen_qty=0;
    v_exgp_comm_unfroz_qty=0;
    v_exgp_comm_capt_qty=0;
    v_exgp_comm_releas_qty=0;
    v_exgp_trade_frozen_qty=0;
    v_exgp_trade_unfroz_qty=0;
    v_exgp_trade_capt_qty=0;
    v_exgp_trade_releas_qty=0;
    v_exgp_strike_capt_qty=0;
    v_exgp_strike_releas_qty=0;
    v_exgp_strike_frozen_qty=0;
    v_exgp_strike_unfroz_qty=0;
    v_exgp_realize_pandl=0;
    v_exgp_cost_amt=0;
    v_exgp_intrst_cost_amt=0;
    v_exgp_intrst_pandl=0;
    v_exgp_posi_update_times=1;
    v_asac_cash_id=0;
    v_asac_frozen_amt=0;
    v_asac_unfroz_amt=0;
    v_asac_comm_frozen_amt=0;
    v_asac_comm_unfroz_amt=0;
    v_asac_comm_capt_amt=0;
    v_asac_comm_releas_amt=0;
    v_asac_trade_frozen_amt=0;
    v_asac_trade_unfroz_amt=0;
    v_asac_trade_capt_amt=0;
    v_asac_trade_releas_amt=0;
    v_asac_strike_capt_amt=0;
    v_asac_strike_releas_amt=0;
    v_asac_cash_update_times=1;
    v_asac_posi_id=0;
    v_asac_frozen_qty=0;
    v_asac_unfroz_qty=0;
    v_asac_comm_frozen_qty=0;
    v_asac_comm_unfroz_qty=0;
    v_asac_comm_capt_qty=0;
    v_asac_comm_releas_qty=0;
    v_asac_trade_frozen_qty=0;
    v_asac_trade_unfroz_qty=0;
    v_asac_trade_capt_qty=0;
    v_asac_trade_releas_qty=0;
    v_asac_strike_capt_qty=0;
    v_asac_strike_releas_qty=0;
    v_asac_strike_frozen_qty=0;
    v_asac_strike_unfroz_qty=0;
    v_asac_realize_pandl=0;
    v_asac_cost_amt=0;
    v_asac_intrst_cost_amt=0;
    v_asac_intrst_pandl=0;
    v_asac_posi_update_times=1;
    v_exgp_target_posi_id=0;
    v_exgp_target_frozen_qty=0;
    v_exgp_target_unfroz_qty=0;
    v_exgp_target_comm_frozen_qty=0;
    v_exgp_target_comm_unfroz_qty=0;
    v_exgp_target_comm_capt_qty=0;
    v_exgp_target_comm_releas_qty=0;
    v_exgp_target_trade_frozen_qty=0;
    v_exgp_target_trade_unfroz_qty=0;
    v_exgp_target_trade_capt_qty=0;
    v_exgp_target_trade_releas_qty=0;
    v_exgp_target_strike_capt_qty=0;
    v_exgp_target_strike_releas_qty=0;
    v_exgp_target_strike_frozen_qty=0;
    v_exgp_target_strike_unfroz_qty=0;
    v_exgp_target_realize_pandl=0;
    v_exgp_target_cost_amt=0;
    v_exgp_target_intrst_cost_amt=0;
    v_exgp_target_intrst_pandl=0;
    v_exgp_target_posi_update_times=0;
    v_asac_target_posi_id=0;
    v_asac_target_frozen_qty=0;
    v_asac_target_unfroz_qty=0;
    v_asac_target_comm_frozen_qty=0;
    v_asac_target_comm_unfroz_qty=0;
    v_asac_target_comm_capt_qty=0;
    v_asac_target_comm_releas_qty=0;
    v_asac_target_trade_frozen_qty=0;
    v_asac_target_trade_unfroz_qty=0;
    v_asac_target_trade_capt_qty=0;
    v_asac_target_trade_releas_qty=0;
    v_asac_target_strike_capt_qty=0;
    v_asac_target_strike_releas_qty=0;
    v_asac_target_strike_frozen_qty=0;
    v_asac_target_strike_unfroz_qty=0;
    v_asac_target_realize_pandl=0;
    v_asac_target_cost_amt=0;
    v_asac_target_intrst_cost_amt=0;
    v_asac_target_intrst_pandl=0;
    v_asac_target_posi_update_times=0;
    v_exgp_put_impawn_qty=0;
    v_asac_put_impawn_qty=0;
    strcpy(v_split_str, " ");
    v_order_id=0;
    v_busi_opor_no=0;
    v_external_no=0;
    strcpy(v_stock_code, " ");
    strcpy(v_stock_acco, " ");
    v_order_batch_no=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_time=0;
    v_wtdraw_qty=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_par_value=0;
    v_impawn_ratio=0;
    strcpy(v_rsp_info, " ");
    v_strike_bond_accr_intrst=0;
    v_price_type=0;
    strcpy(v_order_oper_way, " ");
    strcpy(v_order_status, "0");
    v_order_frozen_amt=0;
    v_order_frozen_qty=0;
    v_order_date=0;
    v_combo_posi_id=0;
    v_strategy_id=0;
    strcpy(v_registration_agency, " ");
    strcpy(v_trade_acco, " ");
    v_asset_acco_type=0;
    v_curr_strike_price=0;
    v_curr_strike_amt=0;
    v_curr_strike_qty=0;
    v_strike_id=0;
    v_all_fee=0;
    strcpy(v_wtdraw_status, "0");
    v_sum_order_row_id=0;
    v_sum_order_opor_no=0;
    v_sum_order_co_no=0;
    v_sum_order_pd_no=0;
    v_sum_order_exch_group_no=0;
    v_sum_order_asset_acco_no=0;
    v_sum_order_pass_no=0;
    strcpy(v_sum_order_exch_crncy_type, "CNY");
    v_sum_order_stock_code_no=0;
    v_sum_order_trade_code_no=0;
    v_sum_order_target_code_no=0;
    v_sum_order_external_no=0;
    v_sum_order_date=0;
    v_sum_order_batch_no=0;
    v_sum_order_dir=0;
    v_sum_order_price_type=0;
    v_sum_order_price=0;
    v_sum_order_qty=0;
    strcpy(v_order_sum_status, "0");
    v_sum_order_wtdraw_qty=0;
    v_sum_order_waste_qty=0;
    v_sum_order_strike_amt=0;
    v_sum_order_strike_qty=0;
    v_sum_order_strike_aver_price=0;
    v_sum_order_net_price_flag=0;
    v_sum_order_bond_accr_intrst=0;
    v_sum_order_bond_rate_type=0;
    v_sum_order_par_value=0;
    v_sum_order_impawn_ratio=0;
    strcpy(v_sum_order_oper_way, " ");
    v_sum_order_update_times=1;
    v_sum_strike_row_id=0;
    v_sum_strike_opor_no=0;
    v_sum_strike_co_no=0;
    v_sum_strike_pd_no=0;
    v_sum_strike_exch_group_no=0;
    v_sum_strike_asset_acco_no=0;
    v_sum_strike_pass_no=0;
    strcpy(v_sum_strike_out_acco, " ");
    v_sum_strike_stock_acco_no=0;
    v_sum_strike_stock_code_no=0;
    v_sum_strike_comm_id=0;
    v_sum_strike_report_date=0;
    strcpy(v_sum_strike_report_no, " ");
    v_sum_strike_order_date=0;
    v_sum_strike_order_id=0;
    v_sum_strike_order_dir=0;
    v_sum_strike_order_price=0;
    v_sum_strike_order_qty=0;
    v_sum_strike_strike_qty=0;
    v_sum_strike_strike_amt=0;
    v_sum_strike_all_fee=0;
    v_sum_strike_stamp_tax=0;
    v_sum_strike_trans_fee=0;
    v_sum_strike_brkage_fee=0;
    v_sum_strike_SEC_charges=0;
    v_sum_strike_other_fee=0;
    v_sum_strike_trade_commis=0;
    v_sum_strike_other_commis=0;
    v_sum_trade_tax=0;
    v_sum_trade_cost_fee=0;
    v_sum_trade_system_use_fee=0;
    v_sum_stock_settle_fee=0;
    v_sum_strike_net_price_flag=0;
    v_sum_strike_bond_accr_intrst=0;
    v_sum_strike_bond_rate_type=0;
    strcpy(v_sum_strike_order_oper_way, " ");
    v_sum_strike_exter_comm_flag=0;
    v_sum_strike_update_times=1;
    v_sum_strike_order_batch_no=0;
    v_sum_external_no=0;
    v_wtdraw_id=0;
    v_wtdraw_batch_no=0;
    v_wtdraw_date=0;
    v_wtdraw_time=0;
    strcpy(v_wtdraw_remark, " ");
    v_trade_time_flag=0;
    v_strategy_dir=0;
    v_margin_trade_type=0;
    strcpy(v_target_strategy_type, " ");
    strcpy(v_strategy_status, " ");
    strcpy(v_strategy_deal_status, " ");
    v_strategy_deal_kind=0;
    strcpy(v_strategy_oper_way, " ");
    v_row_id=0;
    v_row_count=-1;
    v_sort_type=1;
    strcpy(v_co_no_rights_str, " ");
    strcpy(v_pd_no_rights_str, " ");
    strcpy(v_exch_group_no_rights_str, " ");
    v_orig_strategy_id=0;
    strcpy(v_strategy_exec_broker, " ");
    v_strategy_exec_kind=0;
    strcpy(v_strategy_exec_comm_str, " ");
    v_asset_type=0;
    v_strategy_qty=0;
    v_cash_strategy_qty=0;
    v_strategy_price=0;
    v_strategy_valid_type=0;
    strcpy(v_strategy_rule_way, " ");
    strcpy(v_remark_info, " ");
    v_strategy_time=0;
    strcpy(v_target_strategy_param, " ");
    strcpy(v_strategy_contr_comm, " ");
    v_strategy_amt=0;
    v_order_amt=0;
    v_strategy_batch_no=0;
    v_strategy_date=0;
    v_new_strategy_id=0;
    strcpy(v_strategy_sum_status, " ");
    v_valid_order_qty=0;
    v_valid_wtdraw_qty=0;
    v_cancel_qty=0;
    v_faild_qty=0;
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
    strncpy(v_long_token, lpInBizMsg->GetString(LDBIZ_LONG_TOKEN_STR),1024);
    v_long_token[1024] = '\0';

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

    //公共子系统检查

    // set @机构编号# = @操作员机构编号#;
    v_co_no = v_opor_co_no;
    //调用过程[事务_公共_公共接口_检查系统状态查询权限身份市场]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.38", 0);
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
    lpTSCall1Req0->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.38]subcall timed out!");
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

    //撤销指令
    //调用过程[事务_交易证券_指令_撤销指令]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.3.2", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req1->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req1->SetString(LDBIZ_CANCEL_INFO_STR,v_cancel_info);
    lpTSCall1Req1->SetInt32(LDBIZ_IS_WITHDRAW_INT,v_is_withdraw);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.3.2]subcall timed out!");
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
    v_comm_date = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_batch_no = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_executor = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    strcpy(v_order_id_str, lpTSCall1Ans1->GetString(LDBIZ_ORDER_ID_STR_STR));
    strcpy(v_wtdraw_id_str, lpTSCall1Ans1->GetString(LDBIZ_WTDRAW_ID_STR_STR));
    v_target_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
    v_trade_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TRADE_CODE_NO_INT);

    //调用过程[事务_交易证券_主推接口_获取指令混合信息]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.3", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.3]subcall timed out!");
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
    v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans2->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans2->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans2->GetString(LDBIZ_OUT_ACCO_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_stock_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_stock_type = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_comm_date = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_time = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_TIME_INT);
    v_comm_batch_no = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_opor = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_comm_executor = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_comm_dir = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_DIR_INT);
    v_comm_limit_price = lpTSCall1Ans2->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
    v_limit_actual_price = lpTSCall1Ans2->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
    v_comm_qty = lpTSCall1Ans2->GetDouble(LDBIZ_COMM_QTY_FLOAT);
    v_comm_amt = lpTSCall1Ans2->GetDouble(LDBIZ_COMM_AMT_FLOAT);
    v_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_comm_cancel_qty = lpTSCall1Ans2->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_comm_frozen_amt = lpTSCall1Ans2->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
    v_comm_frozen_qty = lpTSCall1Ans2->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
    strcpy(v_strike_status, lpTSCall1Ans2->GetString(LDBIZ_STRIKE_STATUS_STR));
    strcpy(v_comm_status, lpTSCall1Ans2->GetString(LDBIZ_COMM_STATUS_STR));
    v_comm_begin_date = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
    v_comm_end_date = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_END_DATE_INT);
    v_comm_begin_time = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
    v_comm_end_time = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_END_TIME_INT);
    v_comm_comple_date = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
    v_comm_comple_time = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
    v_comm_appr_date = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
    v_comm_appr_time = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
    strcpy(v_comm_appr_status, lpTSCall1Ans2->GetString(LDBIZ_COMM_APPR_STATUS_STR));
    v_comm_appr_oper = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
    strcpy(v_comm_appr_remark, lpTSCall1Ans2->GetString(LDBIZ_COMM_APPR_REMARK_STR));
    v_basket_id = lpTSCall1Ans2->GetInt64(LDBIZ_BASKET_ID_INT64);
    v_net_price_flag = lpTSCall1Ans2->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
    v_bond_accr_intrst = lpTSCall1Ans2->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
    v_bond_rate_type = lpTSCall1Ans2->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
    strcpy(v_comm_oper_way, lpTSCall1Ans2->GetString(LDBIZ_COMM_OPER_WAY_STR));
    v_exter_comm_flag = lpTSCall1Ans2->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_comm_comple_flag = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
    v_strategy_capt_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRATEGY_CAPT_QTY_FLOAT);
    v_strategy_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRATEGY_ORDER_QTY_FLOAT);
    strcpy(v_contra_no, lpTSCall1Ans2->GetString(LDBIZ_CONTRA_NO_STR));
    strcpy(v_comm_remark_info, lpTSCall1Ans2->GetString(LDBIZ_COMM_REMARK_INFO_STR));
    v_disp_opor = lpTSCall1Ans2->GetInt32(LDBIZ_DISP_OPOR_INT);
    v_disp_status = lpTSCall1Ans2->GetInt32(LDBIZ_DISP_STATUS_INT);
    v_read_flag = lpTSCall1Ans2->GetInt32(LDBIZ_READ_FLAG_INT);
    v_update_times = lpTSCall1Ans2->GetInt32(LDBIZ_UPDATE_TIMES_INT);
    v_sum_comm_row_id = lpTSCall1Ans2->GetInt64(LDBIZ_SUM_COMM_ROW_ID_INT64);
    v_sum_comm_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_CO_NO_INT);
    v_sum_comm_pd_no = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_PD_NO_INT);
    v_sum_comm_exch_group_no = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_EXCH_GROUP_NO_INT);
    v_sum_comm_asset_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_ASSET_ACCO_NO_INT);
    v_sum_comm_pass_no = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_PASS_NO_INT);
    strcpy(v_sum_comm_out_acco, lpTSCall1Ans2->GetString(LDBIZ_SUM_COMM_OUT_ACCO_STR));
    strcpy(v_sum_comm_exch_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_SUM_COMM_EXCH_CRNCY_TYPE_STR));
    v_sum_comm_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_STOCK_CODE_NO_INT);
    v_sum_comm_date = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_DATE_INT);
    v_sum_comm_time = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_TIME_INT);
    v_sum_comm_batch_no = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_BATCH_NO_INT);
    v_sum_comm_opor = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_OPOR_INT);
    v_sum_comm_executor = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_EXECUTOR_INT);
    v_sum_comm_dir = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_DIR_INT);
    v_sum_comm_limit_price = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_COMM_LIMIT_PRICE_FLOAT);
    v_sum_comm_qty = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_COMM_QTY_FLOAT);
    v_sum_comm_amt = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_COMM_AMT_FLOAT);
    v_sum_comm_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_COMM_ORDER_QTY_FLOAT);
    v_sum_comm_cancel_qty = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_COMM_CANCEL_QTY_FLOAT);
    v_sum_comm_await_cancel_qty = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_COMM_AWAIT_CANCEL_QTY_FLOAT);
    v_sum_comm_strike_amt = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_COMM_STRIKE_AMT_FLOAT);
    v_sum_comm_strike_qty = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_COMM_STRIKE_QTY_FLOAT);
    strcpy(v_sum_comm_strike_status, lpTSCall1Ans2->GetString(LDBIZ_SUM_COMM_STRIKE_STATUS_STR));
    strcpy(v_comm_sum_status, lpTSCall1Ans2->GetString(LDBIZ_COMM_SUM_STATUS_STR));
    v_sum_comm_begin_date = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_BEGIN_DATE_INT);
    v_sum_comm_end_date = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_END_DATE_INT);
    v_sum_comm_begin_time = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_BEGIN_TIME_INT);
    v_sum_comm_end_time = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_END_TIME_INT);
    v_sum_comm_comple_date = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_COMPLE_DATE_INT);
    v_sum_comm_comple_time = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_COMPLE_TIME_INT);
    v_sum_comm_max_comm_comple_date = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_DATE_INT);
    v_sum_comm_max_comm_comple_time = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_TIME_INT);
    v_sum_comm_appr_date = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_APPR_DATE_INT);
    v_sum_comm_appr_time = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_APPR_TIME_INT);
    v_sum_comm_appr_qty = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_COMM_APPR_QTY_FLOAT);
    strcpy(v_comm_sum_approve_status, lpTSCall1Ans2->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
    v_sum_comm_basket_id = lpTSCall1Ans2->GetInt64(LDBIZ_SUM_COMM_BASKET_ID_INT64);
    v_sum_comm_net_price_flag = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_NET_PRICE_FLAG_INT);
    v_sum_comm_bond_accr_intrst = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_COMM_BOND_ACCR_INTRST_FLOAT);
    v_sum_comm_bond_rate_type = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_BOND_RATE_TYPE_INT);
    strcpy(v_sum_comm_oper_way, lpTSCall1Ans2->GetString(LDBIZ_SUM_COMM_OPER_WAY_STR));
    v_sum_comm_exter_comm_flag = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_EXTER_COMM_FLAG_INT);
    v_sum_buy_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_BUY_ORDER_QTY_FLOAT);
    v_sum_sell_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_SELL_ORDER_QTY_FLOAT);
    v_sum_buy_comm_qty = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_BUY_COMM_QTY_FLOAT);
    v_sum_sell_comm_qty = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_SELL_COMM_QTY_FLOAT);
    v_sum_buy_strike_qty = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_BUY_STRIKE_QTY_FLOAT);
    v_sum_sell_strike_qty = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_SELL_STRIKE_QTY_FLOAT);
    v_sum_buy_strike_amt = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_BUY_STRIKE_AMT_FLOAT);
    v_sum_sell_strike_amt = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_SELL_STRIKE_AMT_FLOAT);
    v_sum_buy_comm_amt = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_BUY_COMM_AMT_FLOAT);
    v_sum_sell_comm_amt = lpTSCall1Ans2->GetDouble(LDBIZ_SUM_SELL_COMM_AMT_FLOAT);
    strcpy(v_sum_comm_remark_info, lpTSCall1Ans2->GetString(LDBIZ_SUM_COMM_REMARK_INFO_STR));
    v_sum_comm_update_times = lpTSCall1Ans2->GetInt32(LDBIZ_SUM_COMM_UPDATE_TIMES_INT);
    strcpy(v_acco_concat_info, lpTSCall1Ans2->GetString(LDBIZ_ACCO_CONCAT_INFO_STR));
    strcpy(v_combo_code, lpTSCall1Ans2->GetString(LDBIZ_COMBO_CODE_STR));


    // [主动推送][secu.comm][证券主推_指令_指令主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.40", 0);
    lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpPubMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
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
    lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT,v_comm_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT,v_comm_frozen_qty);
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
    lpPubMsg->SetInt64(LDBIZ_BASKET_ID_INT64,v_basket_id);
    lpPubMsg->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
    lpPubMsg->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
    lpPubMsg->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
    lpPubMsg->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
    lpPubMsg->SetInt32(LDBIZ_EXTER_COMM_FLAG_INT,v_exter_comm_flag);
    lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_FLAG_INT,v_comm_comple_flag);
    lpPubMsg->SetDouble(LDBIZ_STRATEGY_CAPT_QTY_FLOAT,v_strategy_capt_qty);
    lpPubMsg->SetDouble(LDBIZ_STRATEGY_ORDER_QTY_FLOAT,v_strategy_order_qty);
    lpPubMsg->SetString(LDBIZ_CONTRA_NO_STR,v_contra_no);
    lpPubMsg->SetString(LDBIZ_COMM_REMARK_INFO_STR,v_comm_remark_info);
    lpPubMsg->SetInt32(LDBIZ_DISP_OPOR_INT,v_disp_opor);
    lpPubMsg->SetInt32(LDBIZ_DISP_STATUS_INT,v_disp_status);
    lpPubMsg->SetInt32(LDBIZ_READ_FLAG_INT,v_read_flag);
    lpPubMsg->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("secu.comm", lpPubMsg);


    // if @指令批号# > 0 then
    if (v_comm_batch_no > 0)
    {

        // set @指令备注信息# = @汇总指令备注信息#;
        strcpy(v_comm_remark_info,v_sum_comm_remark_info);

        // [主动推送][secu.commtotal][证券主推_指令_指令汇总主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.41", 0);
        lpPubMsg->SetInt64(LDBIZ_SUM_COMM_ROW_ID_INT64,v_sum_comm_row_id);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_CO_NO_INT,v_sum_comm_co_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_PD_NO_INT,v_sum_comm_pd_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_EXCH_GROUP_NO_INT,v_sum_comm_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_ASSET_ACCO_NO_INT,v_sum_comm_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_PASS_NO_INT,v_sum_comm_pass_no);
        lpPubMsg->SetString(LDBIZ_SUM_COMM_OUT_ACCO_STR,v_sum_comm_out_acco);
        lpPubMsg->SetString(LDBIZ_SUM_COMM_EXCH_CRNCY_TYPE_STR,v_sum_comm_exch_crncy_type);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_STOCK_CODE_NO_INT,v_sum_comm_stock_code_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_DATE_INT,v_sum_comm_date);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_TIME_INT,v_sum_comm_time);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BATCH_NO_INT,v_sum_comm_batch_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_OPOR_INT,v_sum_comm_opor);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_EXECUTOR_INT,v_sum_comm_executor);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_DIR_INT,v_sum_comm_dir);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_LIMIT_PRICE_FLOAT,v_sum_comm_limit_price);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_QTY_FLOAT,v_sum_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_AMT_FLOAT,v_sum_comm_amt);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_ORDER_QTY_FLOAT,v_sum_comm_order_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_CANCEL_QTY_FLOAT,v_sum_comm_cancel_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_AWAIT_CANCEL_QTY_FLOAT,v_sum_comm_await_cancel_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_STRIKE_AMT_FLOAT,v_sum_comm_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_STRIKE_QTY_FLOAT,v_sum_comm_strike_qty);
        lpPubMsg->SetString(LDBIZ_SUM_COMM_STRIKE_STATUS_STR,v_sum_comm_strike_status);
        lpPubMsg->SetString(LDBIZ_COMM_SUM_STATUS_STR,v_comm_sum_status);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BEGIN_DATE_INT,v_sum_comm_begin_date);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_END_DATE_INT,v_sum_comm_end_date);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BEGIN_TIME_INT,v_sum_comm_begin_time);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_END_TIME_INT,v_sum_comm_end_time);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_COMPLE_DATE_INT,v_sum_comm_comple_date);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_COMPLE_TIME_INT,v_sum_comm_comple_time);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_DATE_INT,v_sum_comm_max_comm_comple_date);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_TIME_INT,v_sum_comm_max_comm_comple_time);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_APPR_DATE_INT,v_sum_comm_appr_date);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_APPR_TIME_INT,v_sum_comm_appr_time);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_APPR_QTY_FLOAT,v_sum_comm_appr_qty);
        lpPubMsg->SetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR,v_comm_sum_approve_status);
        lpPubMsg->SetInt64(LDBIZ_SUM_COMM_BASKET_ID_INT64,v_sum_comm_basket_id);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_NET_PRICE_FLAG_INT,v_sum_comm_net_price_flag);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_BOND_ACCR_INTRST_FLOAT,v_sum_comm_bond_accr_intrst);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BOND_RATE_TYPE_INT,v_sum_comm_bond_rate_type);
        lpPubMsg->SetString(LDBIZ_SUM_COMM_OPER_WAY_STR,v_sum_comm_oper_way);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_EXTER_COMM_FLAG_INT,v_sum_comm_exter_comm_flag);
        lpPubMsg->SetDouble(LDBIZ_SUM_BUY_ORDER_QTY_FLOAT,v_sum_buy_order_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_SELL_ORDER_QTY_FLOAT,v_sum_sell_order_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_BUY_COMM_QTY_FLOAT,v_sum_buy_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_SELL_COMM_QTY_FLOAT,v_sum_sell_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_BUY_STRIKE_QTY_FLOAT,v_sum_buy_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_SELL_STRIKE_QTY_FLOAT,v_sum_sell_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_BUY_STRIKE_AMT_FLOAT,v_sum_buy_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_SUM_SELL_STRIKE_AMT_FLOAT,v_sum_sell_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_SUM_BUY_COMM_AMT_FLOAT,v_sum_buy_comm_amt);
        lpPubMsg->SetDouble(LDBIZ_SUM_SELL_COMM_AMT_FLOAT,v_sum_sell_comm_amt);
        lpPubMsg->SetString(LDBIZ_COMM_REMARK_INFO_STR,v_comm_remark_info);
        lpPubMsg->SetInt32(LDBIZ_READ_FLAG_INT,v_read_flag);
        lpPubMsg->SetString(LDBIZ_ACCO_CONCAT_INFO_STR,v_acco_concat_info);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_UPDATE_TIMES_INT,v_sum_comm_update_times);
        glpPubSub_Interface->PubTopics("secu.commtotal", lpPubMsg);

    // end if;
    }

    //质押提交和质押转回，要推交易代码和标准券代码

    // if @指令方向# = 《指令方向-质押提交》 or @指令方向# = 《指令方向-质押转回》 then
    if (v_comm_dir == 21 || v_comm_dir == 22)
    {
      //调用过程[事务_交易证券_主推接口_获取资金和质押持仓信息]
      //组织事务请求
      if(lpTSCall1Ans3)
      {
        lpTSCall1Ans3->FreeMsg();
        lpTSCall1Ans3=NULL;
      }
      lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.28", 0);
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
      lpTSCall1Req3->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpTSCall1Req3->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
      lpTSCall1Req3->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      lpTSCall1Req3->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
      glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
      if(!lpTSCall1Ans3)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.28]subcall timed out!");
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
      v_exgp_cash_id = lpTSCall1Ans3->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
      v_exgp_frozen_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
      v_exgp_unfroz_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
      v_exgp_comm_frozen_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
      v_exgp_comm_unfroz_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
      v_exgp_comm_capt_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
      v_exgp_comm_releas_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
      v_exgp_trade_frozen_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT);
      v_exgp_trade_unfroz_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT);
      v_exgp_trade_capt_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
      v_exgp_trade_releas_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
      v_exgp_strike_capt_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
      v_exgp_strike_releas_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
      v_exgp_cash_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
      v_exgp_posi_id = lpTSCall1Ans3->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
      v_exgp_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
      v_exgp_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
      v_exgp_comm_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT);
      v_exgp_comm_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT);
      v_exgp_comm_capt_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT);
      v_exgp_comm_releas_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
      v_exgp_trade_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT);
      v_exgp_trade_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT);
      v_exgp_trade_capt_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT);
      v_exgp_trade_releas_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
      v_exgp_strike_capt_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT);
      v_exgp_strike_releas_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
      v_exgp_strike_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT);
      v_exgp_strike_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT);
      v_exgp_realize_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
      v_exgp_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
      v_exgp_intrst_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
      v_exgp_intrst_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
      v_exgp_posi_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
      v_asac_cash_id = lpTSCall1Ans3->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
      v_asac_frozen_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
      v_asac_unfroz_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
      v_asac_comm_frozen_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
      v_asac_comm_unfroz_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
      v_asac_comm_capt_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
      v_asac_comm_releas_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
      v_asac_trade_frozen_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT);
      v_asac_trade_unfroz_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT);
      v_asac_trade_capt_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
      v_asac_trade_releas_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
      v_asac_strike_capt_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
      v_asac_strike_releas_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
      v_asac_cash_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);
      v_asac_posi_id = lpTSCall1Ans3->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
      v_asac_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
      v_asac_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
      v_asac_comm_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT);
      v_asac_comm_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT);
      v_asac_comm_capt_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT);
      v_asac_comm_releas_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
      v_asac_trade_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT);
      v_asac_trade_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT);
      v_asac_trade_capt_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT);
      v_asac_trade_releas_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
      v_asac_strike_capt_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT);
      v_asac_strike_releas_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
      v_asac_strike_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT);
      v_asac_strike_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT);
      v_asac_realize_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
      v_asac_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
      v_asac_intrst_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
      v_asac_intrst_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
      v_asac_posi_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);
      v_exgp_target_posi_id = lpTSCall1Ans3->GetInt64(LDBIZ_EXGP_TARGET_POSI_ID_INT64);
      v_exgp_target_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TARGET_FROZEN_QTY_FLOAT);
      v_exgp_target_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TARGET_UNFROZ_QTY_FLOAT);
      v_exgp_target_comm_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TARGET_COMM_FROZEN_QTY_FLOAT);
      v_exgp_target_comm_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TARGET_COMM_UNFROZ_QTY_FLOAT);
      v_exgp_target_comm_capt_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TARGET_COMM_CAPT_QTY_FLOAT);
      v_exgp_target_comm_releas_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TARGET_COMM_RELEAS_QTY_FLOAT);
      v_exgp_target_trade_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TARGET_TRADE_FROZEN_QTY_FLOAT);
      v_exgp_target_trade_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TARGET_TRADE_UNFROZ_QTY_FLOAT);
      v_exgp_target_trade_capt_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TARGET_TRADE_CAPT_QTY_FLOAT);
      v_exgp_target_trade_releas_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TARGET_TRADE_RELEAS_QTY_FLOAT);
      v_exgp_target_strike_capt_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_CAPT_QTY_FLOAT);
      v_exgp_target_strike_releas_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_RELEAS_QTY_FLOAT);
      v_exgp_target_strike_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_FROZEN_QTY_FLOAT);
      v_exgp_target_strike_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_UNFROZ_QTY_FLOAT);
      v_exgp_target_realize_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TARGET_REALIZE_PANDL_FLOAT);
      v_exgp_target_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TARGET_COST_AMT_FLOAT);
      v_exgp_target_intrst_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TARGET_INTRST_COST_AMT_FLOAT);
      v_exgp_target_intrst_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_TARGET_INTRST_PANDL_FLOAT);
      v_exgp_target_posi_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_EXGP_TARGET_POSI_UPDATE_TIMES_INT);
      v_asac_target_posi_id = lpTSCall1Ans3->GetInt64(LDBIZ_ASAC_TARGET_POSI_ID_INT64);
      v_asac_target_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TARGET_FROZEN_QTY_FLOAT);
      v_asac_target_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TARGET_UNFROZ_QTY_FLOAT);
      v_asac_target_comm_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TARGET_COMM_FROZEN_QTY_FLOAT);
      v_asac_target_comm_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TARGET_COMM_UNFROZ_QTY_FLOAT);
      v_asac_target_comm_capt_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TARGET_COMM_CAPT_QTY_FLOAT);
      v_asac_target_comm_releas_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TARGET_COMM_RELEAS_QTY_FLOAT);
      v_asac_target_trade_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TARGET_TRADE_FROZEN_QTY_FLOAT);
      v_asac_target_trade_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TARGET_TRADE_UNFROZ_QTY_FLOAT);
      v_asac_target_trade_capt_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TARGET_TRADE_CAPT_QTY_FLOAT);
      v_asac_target_trade_releas_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TARGET_TRADE_RELEAS_QTY_FLOAT);
      v_asac_target_strike_capt_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_CAPT_QTY_FLOAT);
      v_asac_target_strike_releas_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_RELEAS_QTY_FLOAT);
      v_asac_target_strike_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_FROZEN_QTY_FLOAT);
      v_asac_target_strike_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_UNFROZ_QTY_FLOAT);
      v_asac_target_realize_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TARGET_REALIZE_PANDL_FLOAT);
      v_asac_target_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TARGET_COST_AMT_FLOAT);
      v_asac_target_intrst_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TARGET_INTRST_COST_AMT_FLOAT);
      v_asac_target_intrst_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_TARGET_INTRST_PANDL_FLOAT);
      v_asac_target_posi_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_ASAC_TARGET_POSI_UPDATE_TIMES_INT);
      v_exgp_put_impawn_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT);
      v_asac_put_impawn_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT);


      // set @证券代码编号# = @交易代码编号#;
      v_stock_code_no = v_trade_code_no;

      // [主动推送][secu.exgpcapital][证券主推_资金_交易组资金主推消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.50", 0);
      lpPubMsg->SetInt64(LDBIZ_EXGP_CASH_ID_INT64,v_exgp_cash_id);
      lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT,v_exgp_comm_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT,v_exgp_comm_unfroz_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT,v_exgp_comm_capt_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT,v_exgp_comm_releas_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT,v_exgp_trade_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT,v_exgp_trade_unfroz_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT,v_exgp_trade_capt_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT,v_exgp_trade_releas_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT,v_exgp_strike_capt_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT,v_exgp_strike_releas_amt);
      lpPubMsg->SetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT,v_exgp_cash_update_times);
      glpPubSub_Interface->PubTopics("secu.exgpcapital", lpPubMsg);


      // [主动推送][secu.exgpposi][证券主推_持仓_交易组持仓主推消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.60", 0);
      lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
      lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
      lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT,v_exgp_comm_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT,v_exgp_comm_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT,v_exgp_comm_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT,v_exgp_trade_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT,v_exgp_trade_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT,v_exgp_trade_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT,v_exgp_strike_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT,v_exgp_strike_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT,v_exgp_strike_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
      lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
      lpPubMsg->SetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT,v_exgp_put_impawn_qty);
      glpPubSub_Interface->PubTopics("secu.exgpposi", lpPubMsg);


      // [主动推送][secu.asaccapital][证券主推_资金_资产账户资金主推消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.51", 0);
      lpPubMsg->SetInt64(LDBIZ_ASAC_CASH_ID_INT64,v_asac_cash_id);
      lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT,v_asac_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT,v_asac_unfroz_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT,v_asac_comm_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT,v_asac_comm_unfroz_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT,v_asac_comm_capt_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT,v_asac_comm_releas_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT,v_asac_trade_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT,v_asac_trade_unfroz_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT,v_asac_trade_capt_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT,v_asac_trade_releas_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT,v_asac_strike_capt_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT,v_asac_strike_releas_amt);
      lpPubMsg->SetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT,v_asac_cash_update_times);
      glpPubSub_Interface->PubTopics("secu.asaccapital", lpPubMsg);


      // [主动推送][secu.asacposi][证券主推_持仓_资产账户持仓主推消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.61", 0);
      lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
      lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
      lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT,v_asac_comm_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT,v_asac_comm_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT,v_asac_comm_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT,v_asac_trade_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT,v_asac_trade_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT,v_asac_trade_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT,v_asac_strike_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT,v_asac_strike_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT,v_asac_strike_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
      lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
      lpPubMsg->SetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT,v_asac_put_impawn_qty);
      glpPubSub_Interface->PubTopics("secu.asacposi", lpPubMsg);


      // set @交易组提交质押数量# = 0;
      v_exgp_put_impawn_qty = 0;

      // set @资产账户提交质押数量# = 0;
      v_asac_put_impawn_qty = 0;

      // set @证券代码编号# = @标的代码编号#;
      v_stock_code_no = v_target_code_no;

      // set @交易组持仓序号# = @交易组标的持仓序号#;
      v_exgp_posi_id = v_exgp_target_posi_id;

      // set @交易组冻结数量# = @交易组标的冻结数量#;
      v_exgp_frozen_qty = v_exgp_target_frozen_qty;

      // set @交易组解冻数量# = @交易组标的解冻数量#;
      v_exgp_unfroz_qty = v_exgp_target_unfroz_qty;

      // set @交易组指令冻结数量# = @交易组标的指令冻结数量#;
      v_exgp_comm_frozen_qty = v_exgp_target_comm_frozen_qty;

      // set @交易组指令解冻数量# = @交易组标的指令解冻数量#;
      v_exgp_comm_unfroz_qty = v_exgp_target_comm_unfroz_qty;

      // set @交易组指令占用数量# = @交易组标的指令占用数量#;
      v_exgp_comm_capt_qty = v_exgp_target_comm_capt_qty;

      // set @交易组指令释放数量# = @交易组标的指令释放数量#;
      v_exgp_comm_releas_qty = v_exgp_target_comm_releas_qty;

      // set @交易组交易冻结数量# = @交易组标的交易冻结数量#;
      v_exgp_trade_frozen_qty = v_exgp_target_trade_frozen_qty;

      // set @交易组交易解冻数量# = @交易组标的交易解冻数量#;
      v_exgp_trade_unfroz_qty = v_exgp_target_trade_unfroz_qty;

      // set @交易组交易占用数量# = @交易组标的交易占用数量#;
      v_exgp_trade_capt_qty = v_exgp_target_trade_capt_qty;

      // set @交易组交易释放数量# = @交易组标的交易释放数量#;
      v_exgp_trade_releas_qty = v_exgp_target_trade_releas_qty;

      // set @交易组成交占用数量# = @交易组标的成交占用数量#;
      v_exgp_strike_capt_qty = v_exgp_target_strike_capt_qty;

      // set @交易组成交释放数量# = @交易组标的成交释放数量#;
      v_exgp_strike_releas_qty = v_exgp_target_strike_releas_qty;

      // set @交易组成交冻结数量# = @交易组标的成交冻结数量#;
      v_exgp_strike_frozen_qty = v_exgp_target_strike_frozen_qty;

      // set @交易组成交解冻数量# = @交易组标的成交解冻数量#;
      v_exgp_strike_unfroz_qty = v_exgp_target_strike_unfroz_qty;

      // set @交易组实现盈亏# = @交易组标的实现盈亏#;
      v_exgp_realize_pandl = v_exgp_target_realize_pandl;

      // set @交易组成本金额# = @交易组标的成本金额#;
      v_exgp_cost_amt = v_exgp_target_cost_amt;

      // set @交易组利息成本金额# = @交易组标的利息成本金额#;
      v_exgp_intrst_cost_amt = v_exgp_target_intrst_cost_amt;

      // set @交易组利息收益# = @交易组标的利息收益#;
      v_exgp_intrst_pandl = v_exgp_target_intrst_pandl;

      // set @交易组持仓更新次数# = @交易组标的持仓更新次数#;
      v_exgp_posi_update_times = v_exgp_target_posi_update_times;

      // set @资产账户持仓序号# = @资产账户标的持仓序号#;
      v_asac_posi_id = v_asac_target_posi_id;

      // set @资产账户冻结数量# = @资产账户标的冻结数量#;
      v_asac_frozen_qty = v_asac_target_frozen_qty;

      // set @资产账户解冻数量# = @资产账户标的解冻数量#;
      v_asac_unfroz_qty = v_asac_target_unfroz_qty;

      // set @资产账户指令冻结数量# = @资产账户标的指令冻结数量#;
      v_asac_comm_frozen_qty = v_asac_target_comm_frozen_qty;

      // set @资产账户指令解冻数量# = @资产账户标的指令解冻数量#;
      v_asac_comm_unfroz_qty = v_asac_target_comm_unfroz_qty;

      // set @资产账户指令占用数量# = @资产账户标的指令占用数量#;
      v_asac_comm_capt_qty = v_asac_target_comm_capt_qty;

      // set @资产账户指令释放数量# = @资产账户标的指令释放数量#;
      v_asac_comm_releas_qty = v_asac_target_comm_releas_qty;

      // set @资产账户交易冻结数量# = @资产账户标的交易冻结数量#;
      v_asac_trade_frozen_qty = v_asac_target_trade_frozen_qty;

      // set @资产账户交易解冻数量# = @资产账户标的交易解冻数量#;
      v_asac_trade_unfroz_qty = v_asac_target_trade_unfroz_qty;

      // set @资产账户交易占用数量# = @资产账户标的交易占用数量#;
      v_asac_trade_capt_qty = v_asac_target_trade_capt_qty;

      // set @资产账户交易释放数量# = @资产账户标的交易释放数量#;
      v_asac_trade_releas_qty = v_asac_target_trade_releas_qty;

      // set @资产账户成交占用数量# = @资产账户标的成交占用数量#;
      v_asac_strike_capt_qty = v_asac_target_strike_capt_qty;

      // set @资产账户成交释放数量# = @资产账户标的成交释放数量#;
      v_asac_strike_releas_qty = v_asac_target_strike_releas_qty;

      // set @资产账户成交冻结数量# = @资产账户标的成交冻结数量#;
      v_asac_strike_frozen_qty = v_asac_target_strike_frozen_qty;

      // set @资产账户成交解冻数量# = @资产账户标的成交解冻数量#;
      v_asac_strike_unfroz_qty = v_asac_target_strike_unfroz_qty;

      // set @资产账户实现盈亏# = @资产账户标的实现盈亏#;
      v_asac_realize_pandl = v_asac_target_realize_pandl;

      // set @资产账户成本金额# = @资产账户标的成本金额#;
      v_asac_cost_amt = v_asac_target_cost_amt;

      // set @资产账户利息成本金额# = @资产账户标的利息成本金额#;
      v_asac_intrst_cost_amt = v_asac_target_intrst_cost_amt;

      // set @资产账户利息收益# = @资产账户标的利息收益#;
      v_asac_intrst_pandl = v_asac_target_intrst_pandl;

      // set @资产账户持仓更新次数# = @资产账户标的持仓更新次数#;
      v_asac_posi_update_times = v_asac_target_posi_update_times;

      // [主动推送][secu.exgpposi][证券主推_持仓_交易组持仓主推消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.60", 0);
      lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
      lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
      lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT,v_exgp_comm_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT,v_exgp_comm_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT,v_exgp_comm_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT,v_exgp_trade_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT,v_exgp_trade_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT,v_exgp_trade_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT,v_exgp_strike_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT,v_exgp_strike_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT,v_exgp_strike_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
      lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
      lpPubMsg->SetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT,v_exgp_put_impawn_qty);
      glpPubSub_Interface->PubTopics("secu.exgpposi", lpPubMsg);


      // [主动推送][secu.asacposi][证券主推_持仓_资产账户持仓主推消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.61", 0);
      lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
      lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
      lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT,v_asac_comm_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT,v_asac_comm_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT,v_asac_comm_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT,v_asac_trade_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT,v_asac_trade_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT,v_asac_trade_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT,v_asac_strike_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT,v_asac_strike_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT,v_asac_strike_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
      lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
      lpPubMsg->SetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT,v_asac_put_impawn_qty);
      glpPubSub_Interface->PubTopics("secu.asacposi", lpPubMsg);


    }
    // else if @指令方向# = 《指令方向-融资回购》 or @指令方向# = 《指令方向-融券回购》 then
    else if (v_comm_dir == 3 || v_comm_dir == 4)
    {

      // set @证券代码编号# = @标的代码编号#;
      v_stock_code_no = v_target_code_no;
      //调用过程[事务_交易证券_主推接口_获取资金持仓信息]
      //组织事务请求
      if(lpTSCall1Ans4)
      {
        lpTSCall1Ans4->FreeMsg();
        lpTSCall1Ans4=NULL;
      }
      lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.13", 0);
      lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
      lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
      lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
      lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
      lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
      lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
      lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
      lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
      lpTSCall1Req4->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpTSCall1Req4->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpTSCall1Req4->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
      lpTSCall1Req4->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpTSCall1Req4->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpTSCall1Req4->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
      lpTSCall1Req4->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
      if(!lpTSCall1Ans4)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.13]subcall timed out!");
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
      v_exgp_cash_id = lpTSCall1Ans4->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
      v_exgp_frozen_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
      v_exgp_unfroz_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
      v_exgp_comm_frozen_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
      v_exgp_comm_unfroz_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
      v_exgp_comm_capt_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
      v_exgp_comm_releas_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
      v_exgp_trade_frozen_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT);
      v_exgp_trade_unfroz_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT);
      v_exgp_trade_capt_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
      v_exgp_trade_releas_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
      v_exgp_strike_capt_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
      v_exgp_strike_releas_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
      v_exgp_cash_update_times = lpTSCall1Ans4->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
      v_exgp_posi_id = lpTSCall1Ans4->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
      v_exgp_frozen_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
      v_exgp_unfroz_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
      v_exgp_comm_frozen_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT);
      v_exgp_comm_unfroz_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT);
      v_exgp_comm_capt_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT);
      v_exgp_comm_releas_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
      v_exgp_trade_frozen_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT);
      v_exgp_trade_unfroz_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT);
      v_exgp_trade_capt_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT);
      v_exgp_trade_releas_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
      v_exgp_strike_capt_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT);
      v_exgp_strike_releas_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
      v_exgp_strike_frozen_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT);
      v_exgp_strike_unfroz_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT);
      v_exgp_realize_pandl = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
      v_exgp_cost_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
      v_exgp_intrst_cost_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
      v_exgp_intrst_pandl = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
      v_exgp_posi_update_times = lpTSCall1Ans4->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
      v_asac_cash_id = lpTSCall1Ans4->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
      v_asac_frozen_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
      v_asac_unfroz_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
      v_asac_comm_frozen_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
      v_asac_comm_unfroz_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
      v_asac_comm_capt_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
      v_asac_comm_releas_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
      v_asac_trade_frozen_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT);
      v_asac_trade_unfroz_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT);
      v_asac_trade_capt_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
      v_asac_trade_releas_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
      v_asac_strike_capt_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
      v_asac_strike_releas_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
      v_asac_cash_update_times = lpTSCall1Ans4->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);
      v_asac_posi_id = lpTSCall1Ans4->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
      v_asac_frozen_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
      v_asac_unfroz_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
      v_asac_comm_frozen_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT);
      v_asac_comm_unfroz_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT);
      v_asac_comm_capt_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT);
      v_asac_comm_releas_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
      v_asac_trade_frozen_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT);
      v_asac_trade_unfroz_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT);
      v_asac_trade_capt_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT);
      v_asac_trade_releas_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
      v_asac_strike_capt_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT);
      v_asac_strike_releas_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
      v_asac_strike_frozen_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT);
      v_asac_strike_unfroz_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT);
      v_asac_realize_pandl = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
      v_asac_cost_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
      v_asac_intrst_cost_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
      v_asac_intrst_pandl = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
      v_asac_posi_update_times = lpTSCall1Ans4->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


      // [主动推送][secu.exgpcapital][证券主推_资金_交易组资金主推消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.50", 0);
      lpPubMsg->SetInt64(LDBIZ_EXGP_CASH_ID_INT64,v_exgp_cash_id);
      lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT,v_exgp_comm_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT,v_exgp_comm_unfroz_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT,v_exgp_comm_capt_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT,v_exgp_comm_releas_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT,v_exgp_trade_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT,v_exgp_trade_unfroz_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT,v_exgp_trade_capt_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT,v_exgp_trade_releas_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT,v_exgp_strike_capt_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT,v_exgp_strike_releas_amt);
      lpPubMsg->SetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT,v_exgp_cash_update_times);
      glpPubSub_Interface->PubTopics("secu.exgpcapital", lpPubMsg);


      // [主动推送][secu.exgpposi][证券主推_持仓_交易组持仓主推消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.60", 0);
      lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
      lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
      lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT,v_exgp_comm_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT,v_exgp_comm_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT,v_exgp_comm_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT,v_exgp_trade_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT,v_exgp_trade_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT,v_exgp_trade_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT,v_exgp_strike_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT,v_exgp_strike_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT,v_exgp_strike_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
      lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
      lpPubMsg->SetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT,v_exgp_put_impawn_qty);
      glpPubSub_Interface->PubTopics("secu.exgpposi", lpPubMsg);


      // [主动推送][secu.asaccapital][证券主推_资金_资产账户资金主推消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.51", 0);
      lpPubMsg->SetInt64(LDBIZ_ASAC_CASH_ID_INT64,v_asac_cash_id);
      lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT,v_asac_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT,v_asac_unfroz_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT,v_asac_comm_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT,v_asac_comm_unfroz_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT,v_asac_comm_capt_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT,v_asac_comm_releas_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT,v_asac_trade_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT,v_asac_trade_unfroz_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT,v_asac_trade_capt_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT,v_asac_trade_releas_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT,v_asac_strike_capt_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT,v_asac_strike_releas_amt);
      lpPubMsg->SetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT,v_asac_cash_update_times);
      glpPubSub_Interface->PubTopics("secu.asaccapital", lpPubMsg);


      // [主动推送][secu.asacposi][证券主推_持仓_资产账户持仓主推消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.61", 0);
      lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
      lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
      lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT,v_asac_comm_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT,v_asac_comm_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT,v_asac_comm_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT,v_asac_trade_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT,v_asac_trade_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT,v_asac_trade_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT,v_asac_strike_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT,v_asac_strike_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT,v_asac_strike_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
      lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
      lpPubMsg->SetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT,v_asac_put_impawn_qty);
      glpPubSub_Interface->PubTopics("secu.asacposi", lpPubMsg);

    }
    // else
    else
    {

      //调用过程[事务_交易证券_主推接口_获取资金持仓信息]
      //组织事务请求
      if(lpTSCall1Ans5)
      {
        lpTSCall1Ans5->FreeMsg();
        lpTSCall1Ans5=NULL;
      }
      lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.13", 0);
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
      lpTSCall1Req5->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpTSCall1Req5->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
      lpTSCall1Req5->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
      if(!lpTSCall1Ans5)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.13]subcall timed out!");
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
      v_exgp_frozen_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
      v_exgp_unfroz_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
      v_exgp_comm_frozen_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
      v_exgp_comm_unfroz_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
      v_exgp_comm_capt_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
      v_exgp_comm_releas_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
      v_exgp_trade_frozen_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT);
      v_exgp_trade_unfroz_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT);
      v_exgp_trade_capt_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
      v_exgp_trade_releas_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
      v_exgp_strike_capt_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
      v_exgp_strike_releas_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
      v_exgp_cash_update_times = lpTSCall1Ans5->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
      v_exgp_posi_id = lpTSCall1Ans5->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
      v_exgp_frozen_qty = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
      v_exgp_unfroz_qty = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
      v_exgp_comm_frozen_qty = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT);
      v_exgp_comm_unfroz_qty = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT);
      v_exgp_comm_capt_qty = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT);
      v_exgp_comm_releas_qty = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
      v_exgp_trade_frozen_qty = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT);
      v_exgp_trade_unfroz_qty = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT);
      v_exgp_trade_capt_qty = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT);
      v_exgp_trade_releas_qty = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
      v_exgp_strike_capt_qty = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT);
      v_exgp_strike_releas_qty = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
      v_exgp_strike_frozen_qty = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT);
      v_exgp_strike_unfroz_qty = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT);
      v_exgp_realize_pandl = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
      v_exgp_cost_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
      v_exgp_intrst_cost_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
      v_exgp_intrst_pandl = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
      v_exgp_posi_update_times = lpTSCall1Ans5->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
      v_asac_cash_id = lpTSCall1Ans5->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
      v_asac_frozen_amt = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
      v_asac_unfroz_amt = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
      v_asac_comm_frozen_amt = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
      v_asac_comm_unfroz_amt = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
      v_asac_comm_capt_amt = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
      v_asac_comm_releas_amt = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
      v_asac_trade_frozen_amt = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT);
      v_asac_trade_unfroz_amt = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT);
      v_asac_trade_capt_amt = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
      v_asac_trade_releas_amt = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
      v_asac_strike_capt_amt = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
      v_asac_strike_releas_amt = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
      v_asac_cash_update_times = lpTSCall1Ans5->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);
      v_asac_posi_id = lpTSCall1Ans5->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
      v_asac_frozen_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
      v_asac_unfroz_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
      v_asac_comm_frozen_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT);
      v_asac_comm_unfroz_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT);
      v_asac_comm_capt_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT);
      v_asac_comm_releas_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
      v_asac_trade_frozen_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT);
      v_asac_trade_unfroz_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT);
      v_asac_trade_capt_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT);
      v_asac_trade_releas_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
      v_asac_strike_capt_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT);
      v_asac_strike_releas_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
      v_asac_strike_frozen_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT);
      v_asac_strike_unfroz_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT);
      v_asac_realize_pandl = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
      v_asac_cost_amt = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
      v_asac_intrst_cost_amt = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
      v_asac_intrst_pandl = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
      v_asac_posi_update_times = lpTSCall1Ans5->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


      // [主动推送][secu.exgpcapital][证券主推_资金_交易组资金主推消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.50", 0);
      lpPubMsg->SetInt64(LDBIZ_EXGP_CASH_ID_INT64,v_exgp_cash_id);
      lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT,v_exgp_comm_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT,v_exgp_comm_unfroz_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT,v_exgp_comm_capt_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT,v_exgp_comm_releas_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT,v_exgp_trade_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT,v_exgp_trade_unfroz_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT,v_exgp_trade_capt_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT,v_exgp_trade_releas_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT,v_exgp_strike_capt_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT,v_exgp_strike_releas_amt);
      lpPubMsg->SetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT,v_exgp_cash_update_times);
      glpPubSub_Interface->PubTopics("secu.exgpcapital", lpPubMsg);


      // [主动推送][secu.exgpposi][证券主推_持仓_交易组持仓主推消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.60", 0);
      lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
      lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
      lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT,v_exgp_comm_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT,v_exgp_comm_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT,v_exgp_comm_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT,v_exgp_trade_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT,v_exgp_trade_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT,v_exgp_trade_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT,v_exgp_strike_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT,v_exgp_strike_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT,v_exgp_strike_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
      lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
      lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
      lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
      lpPubMsg->SetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT,v_exgp_put_impawn_qty);
      glpPubSub_Interface->PubTopics("secu.exgpposi", lpPubMsg);


      // [主动推送][secu.asaccapital][证券主推_资金_资产账户资金主推消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.51", 0);
      lpPubMsg->SetInt64(LDBIZ_ASAC_CASH_ID_INT64,v_asac_cash_id);
      lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT,v_asac_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT,v_asac_unfroz_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT,v_asac_comm_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT,v_asac_comm_unfroz_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT,v_asac_comm_capt_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT,v_asac_comm_releas_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT,v_asac_trade_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT,v_asac_trade_unfroz_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT,v_asac_trade_capt_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT,v_asac_trade_releas_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT,v_asac_strike_capt_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT,v_asac_strike_releas_amt);
      lpPubMsg->SetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT,v_asac_cash_update_times);
      glpPubSub_Interface->PubTopics("secu.asaccapital", lpPubMsg);


      // [主动推送][secu.asacposi][证券主推_持仓_资产账户持仓主推消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.61", 0);
      lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
      lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
      lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT,v_asac_comm_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT,v_asac_comm_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT,v_asac_comm_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT,v_asac_trade_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT,v_asac_trade_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT,v_asac_trade_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT,v_asac_strike_capt_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT,v_asac_strike_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT,v_asac_strike_unfroz_qty);
      lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
      lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
      lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
      lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
      lpPubMsg->SetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT,v_asac_put_impawn_qty);
      glpPubSub_Interface->PubTopics("secu.asacposi", lpPubMsg);

    // end if;
    }


    // set @分隔符# = ";";
    strcpy(v_split_str,";");
    //订单主推

    // if @是否撤单#=《是否撤单-是》 and @订单序号串# <> "" then
    if (v_is_withdraw==1 && strcmp(v_order_id_str , "")!=0)
    {
      //调用过程[事务_交易证券_主推接口_获取批量订单信息]
      //组织事务请求
      if(lpTSCall1Ans6)
      {
        lpTSCall1Ans6->FreeMsg();
        lpTSCall1Ans6=NULL;
      }
      lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.25", 0);
      lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
      lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
      lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
      lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
      lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
      lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
      lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
      lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
      lpTSCall1Req6->SetString(LDBIZ_ORDER_ID_STR_STR,v_order_id_str);
      lpTSCall1Req6->SetString(LDBIZ_SPLIT_STR_STR,v_split_str);
      glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
      if(!lpTSCall1Ans6)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.25]subcall timed out!");
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


      // [获取结果集][lpMainMsg]
      lpMainMsg=lpTSCall1Ans6->GetGroup(LDTAG_NO_RESULTSET);


      // [遍历结果集开始][lpMainMsg]
      iRecordCount = lpMainMsg->GetRecordCount();
      for (int i = 0; i < iRecordCount;i++) 
      {
          IRecord* lpRecord =lpMainMsg->GetRecord(i);
          if(lpRecord)
          {

              //获取记录字段值
              v_order_id = lpRecord->GetInt64(LDBIZ_ORDER_ID_INT64);
              v_busi_opor_no = lpRecord->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
              v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
              v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
              v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
              v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
              v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
              v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
              v_stock_type = lpRecord->GetInt32(LDBIZ_STOCK_TYPE_INT);
              v_pass_no = lpRecord->GetInt32(LDBIZ_PASS_NO_INT);
              v_external_no = lpRecord->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
              strcpy(v_out_acco, lpRecord->GetString(LDBIZ_OUT_ACCO_STR));
              strcpy(v_exch_crncy_type, lpRecord->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
              v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
              strcpy(v_stock_code, lpRecord->GetString(LDBIZ_STOCK_CODE_STR));
              strcpy(v_stock_acco, lpRecord->GetString(LDBIZ_STOCK_ACCO_STR));
              v_comm_id = lpRecord->GetInt64(LDBIZ_COMM_ID_INT64);
              v_comm_batch_no = lpRecord->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
              v_order_batch_no = lpRecord->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
              v_order_dir = lpRecord->GetInt32(LDBIZ_ORDER_DIR_INT);
              v_order_qty = lpRecord->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
              v_order_price = lpRecord->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
              v_order_time = lpRecord->GetInt32(LDBIZ_ORDER_TIME_INT);
              v_wtdraw_qty = lpRecord->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
              v_report_date = lpRecord->GetInt32(LDBIZ_REPORT_DATE_INT);
              v_report_time = lpRecord->GetInt32(LDBIZ_REPORT_TIME_INT);
              strcpy(v_report_no, lpRecord->GetString(LDBIZ_REPORT_NO_STR));
              v_par_value = lpRecord->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
              v_impawn_ratio = lpRecord->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
              strcpy(v_rsp_info, lpRecord->GetString(LDBIZ_RSP_INFO_STR));
              v_strike_amt = lpRecord->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
              v_strike_qty = lpRecord->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
              v_strike_bond_accr_intrst = lpRecord->GetDouble(LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
              v_price_type = lpRecord->GetInt32(LDBIZ_PRICE_TYPE_INT);
              strcpy(v_order_oper_way, lpRecord->GetString(LDBIZ_ORDER_OPER_WAY_STR));
              strcpy(v_order_status, lpRecord->GetString(LDBIZ_ORDER_STATUS_STR));
              v_order_frozen_amt = lpRecord->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
              v_order_frozen_qty = lpRecord->GetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT);
              v_net_price_flag = lpRecord->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
              v_bond_accr_intrst = lpRecord->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
              v_bond_rate_type = lpRecord->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
              v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);
              v_order_date = lpRecord->GetInt32(LDBIZ_ORDER_DATE_INT);
              strcpy(v_combo_code, lpRecord->GetString(LDBIZ_COMBO_CODE_STR));
              v_combo_posi_id = lpRecord->GetInt64(LDBIZ_COMBO_POSI_ID_INT64);
              v_strategy_id = lpRecord->GetInt64(LDBIZ_STRATEGY_ID_INT64);
              strcpy(v_registration_agency, lpRecord->GetString(LDBIZ_REGISTRATION_AGENCY_STR));
              strcpy(v_trade_acco, lpRecord->GetString(LDBIZ_TRADE_ACCO_STR));
              strcpy(v_contra_no, lpRecord->GetString(LDBIZ_CONTRA_NO_STR));
              v_asset_acco_type = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);


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

      // set @撤单状态# = "0";
      strcpy(v_wtdraw_status,"0");

      // [主动推送][secu.order][证券主推_订单_订单主推消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.20", 0);
      lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
      lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
      lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
      lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
      lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
      lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
      lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      lpPubMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
      lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
      lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
      lpPubMsg->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
      lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
      lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
      lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
      lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
      lpPubMsg->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
      lpPubMsg->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
      lpPubMsg->SetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT,v_order_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT,v_order_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
      lpPubMsg->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
      lpPubMsg->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
      lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
      lpPubMsg->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
      lpPubMsg->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
      lpPubMsg->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
      lpPubMsg->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
      lpPubMsg->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
      lpPubMsg->SetString(LDBIZ_RSP_INFO_STR,v_rsp_info);
      lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
      lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
      lpPubMsg->SetDouble(LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT,v_strike_bond_accr_intrst);
      lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
      lpPubMsg->SetDouble(LDBIZ_CURR_STRIKE_QTY_FLOAT,v_curr_strike_qty);
      lpPubMsg->SetDouble(LDBIZ_CURR_STRIKE_AMT_FLOAT,v_curr_strike_amt);
      lpPubMsg->SetDouble(LDBIZ_CURR_STRIKE_PRICE_FLOAT,v_curr_strike_price);
      lpPubMsg->SetInt64(LDBIZ_STRIKE_ID_INT64,v_strike_id);
      lpPubMsg->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
      lpPubMsg->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
      lpPubMsg->SetInt64(LDBIZ_COMBO_POSI_ID_INT64,v_combo_posi_id);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_TYPE_INT,v_asset_acco_type);
      lpPubMsg->SetString(LDBIZ_CONTRA_NO_STR,v_contra_no);
      lpPubMsg->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
      lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
      glpPubSub_Interface->PubTopics("secu.order", lpPubMsg);


      // if  @订单批号# > 0 then
      if ( v_order_batch_no > 0)
      {

        // set @成交序号# = 0;
        v_strike_id = 0;
        //调用过程[事务_交易证券_主推接口_获取汇总订单成交信息]
        //组织事务请求
        if(lpTSCall1Ans7)
        {
          lpTSCall1Ans7->FreeMsg();
          lpTSCall1Ans7=NULL;
        }
        lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.21", 0);
        lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req7->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req7->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpTSCall1Req7->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
        lpTSCall1Req7->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
        lpTSCall1Req7->SetInt64(LDBIZ_STRIKE_ID_INT64,v_strike_id);
        glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
        if(!lpTSCall1Ans7)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.21]subcall timed out!");
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
        v_sum_order_row_id = lpTSCall1Ans7->GetInt64(LDBIZ_SUM_ORDER_ROW_ID_INT64);
        v_sum_order_opor_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_OPOR_NO_INT);
        v_sum_order_co_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_CO_NO_INT);
        v_sum_order_pd_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_PD_NO_INT);
        v_sum_order_exch_group_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_EXCH_GROUP_NO_INT);
        v_sum_order_asset_acco_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_ASSET_ACCO_NO_INT);
        v_sum_order_pass_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_PASS_NO_INT);
        strcpy(v_sum_order_exch_crncy_type, lpTSCall1Ans7->GetString(LDBIZ_SUM_ORDER_EXCH_CRNCY_TYPE_STR));
        v_sum_order_stock_code_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_STOCK_CODE_NO_INT);
        v_sum_order_trade_code_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_TRADE_CODE_NO_INT);
        v_sum_order_target_code_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_TARGET_CODE_NO_INT);
        v_sum_order_external_no = lpTSCall1Ans7->GetInt64(LDBIZ_SUM_ORDER_EXTERNAL_NO_INT64);
        v_sum_order_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_DATE_INT);
        v_sum_order_batch_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_BATCH_NO_INT);
        v_sum_order_dir = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_DIR_INT);
        v_sum_order_price_type = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_PRICE_TYPE_INT);
        v_sum_order_price = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_PRICE_FLOAT);
        v_sum_order_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_QTY_FLOAT);
        strcpy(v_order_sum_status, lpTSCall1Ans7->GetString(LDBIZ_ORDER_SUM_STATUS_STR));
        v_sum_order_wtdraw_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_WTDRAW_QTY_FLOAT);
        v_sum_order_waste_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_WASTE_QTY_FLOAT);
        v_sum_order_strike_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_STRIKE_AMT_FLOAT);
        v_sum_order_strike_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_STRIKE_QTY_FLOAT);
        v_sum_order_strike_aver_price = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_STRIKE_AVER_PRICE_FLOAT);
        v_sum_order_net_price_flag = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_NET_PRICE_FLAG_INT);
        v_sum_order_bond_accr_intrst = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_BOND_ACCR_INTRST_FLOAT);
        v_sum_order_bond_rate_type = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_BOND_RATE_TYPE_INT);
        v_sum_order_par_value = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_PAR_VALUE_FLOAT);
        v_sum_order_impawn_ratio = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_IMPAWN_RATIO_FLOAT);
        strcpy(v_sum_order_oper_way, lpTSCall1Ans7->GetString(LDBIZ_SUM_ORDER_OPER_WAY_STR));
        v_sum_order_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_UPDATE_TIMES_INT);
        v_sum_strike_row_id = lpTSCall1Ans7->GetInt64(LDBIZ_SUM_STRIKE_ROW_ID_INT64);
        v_sum_strike_opor_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_OPOR_NO_INT);
        v_sum_strike_co_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_CO_NO_INT);
        v_sum_strike_pd_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_PD_NO_INT);
        v_sum_strike_exch_group_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_EXCH_GROUP_NO_INT);
        v_sum_strike_asset_acco_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_ASSET_ACCO_NO_INT);
        v_sum_strike_pass_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_PASS_NO_INT);
        strcpy(v_sum_strike_out_acco, lpTSCall1Ans7->GetString(LDBIZ_SUM_STRIKE_OUT_ACCO_STR));
        v_sum_strike_stock_acco_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_STOCK_ACCO_NO_INT);
        v_sum_strike_stock_code_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_STOCK_CODE_NO_INT);
        v_sum_strike_comm_id = lpTSCall1Ans7->GetInt64(LDBIZ_SUM_STRIKE_COMM_ID_INT64);
        v_sum_strike_report_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_REPORT_DATE_INT);
        strcpy(v_sum_strike_report_no, lpTSCall1Ans7->GetString(LDBIZ_SUM_STRIKE_REPORT_NO_STR));
        v_sum_strike_order_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_ORDER_DATE_INT);
        v_sum_strike_order_id = lpTSCall1Ans7->GetInt64(LDBIZ_SUM_STRIKE_ORDER_ID_INT64);
        v_sum_strike_order_dir = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_ORDER_DIR_INT);
        v_sum_strike_order_price = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_ORDER_PRICE_FLOAT);
        v_sum_strike_order_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_ORDER_QTY_FLOAT);
        v_sum_strike_strike_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_STRIKE_QTY_FLOAT);
        v_sum_strike_strike_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_STRIKE_AMT_FLOAT);
        v_sum_strike_all_fee = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_ALL_FEE_FLOAT);
        v_sum_strike_stamp_tax = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_STAMP_TAX_FLOAT);
        v_sum_strike_trans_fee = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_TRANS_FEE_FLOAT);
        v_sum_strike_brkage_fee = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_BRKAGE_FEE_FLOAT);
        v_sum_strike_SEC_charges = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_SEC_CHARGES_FLOAT);
        v_sum_strike_other_fee = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_OTHER_FEE_FLOAT);
        v_sum_strike_trade_commis = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_TRADE_COMMIS_FLOAT);
        v_sum_strike_other_commis = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_OTHER_COMMIS_FLOAT);
        v_sum_trade_tax = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_TRADE_TAX_FLOAT);
        v_sum_trade_cost_fee = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_TRADE_COST_FEE_FLOAT);
        v_sum_trade_system_use_fee = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_TRADE_SYSTEM_USE_FEE_FLOAT);
        v_sum_stock_settle_fee = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STOCK_SETTLE_FEE_FLOAT);
        v_sum_strike_net_price_flag = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_NET_PRICE_FLAG_INT);
        v_sum_strike_bond_accr_intrst = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_BOND_ACCR_INTRST_FLOAT);
        v_sum_strike_bond_rate_type = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_BOND_RATE_TYPE_INT);
        strcpy(v_sum_strike_order_oper_way, lpTSCall1Ans7->GetString(LDBIZ_SUM_STRIKE_ORDER_OPER_WAY_STR));
        v_sum_strike_exter_comm_flag = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_EXTER_COMM_FLAG_INT);
        v_sum_strike_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_UPDATE_TIMES_INT);
        v_sum_strike_order_batch_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_ORDER_BATCH_NO_INT);
        v_sum_external_no = lpTSCall1Ans7->GetInt64(LDBIZ_SUM_EXTERNAL_NO_INT64);


        // [主动推送][secu.ordertotal][证券主推_订单_订单汇总主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.21", 0);
        lpPubMsg->SetInt64(LDBIZ_SUM_ORDER_ROW_ID_INT64,v_sum_order_row_id);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_OPOR_NO_INT,v_sum_order_opor_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_CO_NO_INT,v_sum_order_co_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_PD_NO_INT,v_sum_order_pd_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_EXCH_GROUP_NO_INT,v_sum_order_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_ASSET_ACCO_NO_INT,v_sum_order_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_PASS_NO_INT,v_sum_order_pass_no);
        lpPubMsg->SetString(LDBIZ_SUM_ORDER_EXCH_CRNCY_TYPE_STR,v_sum_order_exch_crncy_type);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_STOCK_CODE_NO_INT,v_sum_order_stock_code_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_TRADE_CODE_NO_INT,v_sum_order_trade_code_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_TARGET_CODE_NO_INT,v_sum_order_target_code_no);
        lpPubMsg->SetInt64(LDBIZ_SUM_ORDER_EXTERNAL_NO_INT64,v_sum_order_external_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_DATE_INT,v_sum_order_date);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_BATCH_NO_INT,v_sum_order_batch_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_DIR_INT,v_sum_order_dir);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_PRICE_TYPE_INT,v_sum_order_price_type);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_PRICE_FLOAT,v_sum_order_price);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_QTY_FLOAT,v_sum_order_qty);
        lpPubMsg->SetString(LDBIZ_ORDER_SUM_STATUS_STR,v_order_sum_status);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_WTDRAW_QTY_FLOAT,v_sum_order_wtdraw_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_WASTE_QTY_FLOAT,v_sum_order_waste_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_STRIKE_AMT_FLOAT,v_sum_order_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_STRIKE_QTY_FLOAT,v_sum_order_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_STRIKE_AVER_PRICE_FLOAT,v_sum_order_strike_aver_price);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_NET_PRICE_FLAG_INT,v_sum_order_net_price_flag);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_BOND_ACCR_INTRST_FLOAT,v_sum_order_bond_accr_intrst);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_BOND_RATE_TYPE_INT,v_sum_order_bond_rate_type);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_PAR_VALUE_FLOAT,v_sum_order_par_value);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_IMPAWN_RATIO_FLOAT,v_sum_order_impawn_ratio);
        lpPubMsg->SetString(LDBIZ_SUM_ORDER_OPER_WAY_STR,v_sum_order_oper_way);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_UPDATE_TIMES_INT,v_sum_order_update_times);
        glpPubSub_Interface->PubTopics("secu.ordertotal", lpPubMsg);

      // end if;
      }

      //调用过程[事务_交易证券_主推接口_获取撤单信息]
      //组织事务请求
      if(lpTSCall1Ans8)
      {
        lpTSCall1Ans8->FreeMsg();
        lpTSCall1Ans8=NULL;
      }
      lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.48", 0);
      lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
      lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
      lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
      lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
      lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
      lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
      lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
      lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
      lpTSCall1Req8->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
      glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
      if(!lpTSCall1Ans8)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.48]subcall timed out!");
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
      v_wtdraw_id = lpTSCall1Ans8->GetInt64(LDBIZ_WTDRAW_ID_INT64);
      v_busi_opor_no = lpTSCall1Ans8->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
      v_init_date = lpTSCall1Ans8->GetInt32(LDBIZ_INIT_DATE_INT);
      v_co_no = lpTSCall1Ans8->GetInt32(LDBIZ_CO_NO_INT);
      v_pd_no = lpTSCall1Ans8->GetInt32(LDBIZ_PD_NO_INT);
      v_exch_group_no = lpTSCall1Ans8->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
      v_asset_acco_no = lpTSCall1Ans8->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
      v_pass_no = lpTSCall1Ans8->GetInt32(LDBIZ_PASS_NO_INT);
      strcpy(v_out_acco, lpTSCall1Ans8->GetString(LDBIZ_OUT_ACCO_STR));
      strcpy(v_exch_crncy_type, lpTSCall1Ans8->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
      v_exch_no = lpTSCall1Ans8->GetInt32(LDBIZ_EXCH_NO_INT);
      v_stock_acco_no = lpTSCall1Ans8->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
      strcpy(v_stock_acco, lpTSCall1Ans8->GetString(LDBIZ_STOCK_ACCO_STR));
      v_stock_code_no = lpTSCall1Ans8->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
      strcpy(v_stock_code, lpTSCall1Ans8->GetString(LDBIZ_STOCK_CODE_STR));
      v_external_no = lpTSCall1Ans8->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
      v_wtdraw_batch_no = lpTSCall1Ans8->GetInt32(LDBIZ_WTDRAW_BATCH_NO_INT);
      v_wtdraw_date = lpTSCall1Ans8->GetInt32(LDBIZ_WTDRAW_DATE_INT);
      v_wtdraw_time = lpTSCall1Ans8->GetInt32(LDBIZ_WTDRAW_TIME_INT);
      v_order_date = lpTSCall1Ans8->GetInt32(LDBIZ_ORDER_DATE_INT);
      v_report_date = lpTSCall1Ans8->GetInt32(LDBIZ_REPORT_DATE_INT);
      v_report_time = lpTSCall1Ans8->GetInt32(LDBIZ_REPORT_TIME_INT);
      strcpy(v_report_no, lpTSCall1Ans8->GetString(LDBIZ_REPORT_NO_STR));
      strcpy(v_wtdraw_status, lpTSCall1Ans8->GetString(LDBIZ_WTDRAW_STATUS_STR));
      v_wtdraw_qty = lpTSCall1Ans8->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
      strcpy(v_wtdraw_remark, lpTSCall1Ans8->GetString(LDBIZ_WTDRAW_REMARK_STR));
      v_order_price = lpTSCall1Ans8->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
      strcpy(v_trade_acco, lpTSCall1Ans8->GetString(LDBIZ_TRADE_ACCO_STR));
      v_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_UPDATE_TIMES_INT);


      // [主动推送][secu.withdraw][证券主推_订单_撤单主推消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.201", 0);
      lpPubMsg->SetInt64(LDBIZ_WTDRAW_ID_INT64,v_wtdraw_id);
      lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
      lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
      lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
      lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
      lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpPubMsg->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
      lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
      lpPubMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
      lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
      lpPubMsg->SetInt32(LDBIZ_WTDRAW_BATCH_NO_INT,v_wtdraw_batch_no);
      lpPubMsg->SetInt32(LDBIZ_WTDRAW_DATE_INT,v_wtdraw_date);
      lpPubMsg->SetInt32(LDBIZ_WTDRAW_TIME_INT,v_wtdraw_time);
      lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
      lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
      lpPubMsg->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
      lpPubMsg->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
      lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
      lpPubMsg->SetString(LDBIZ_WTDRAW_STATUS_STR,v_wtdraw_status);
      lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
      lpPubMsg->SetString(LDBIZ_WTDRAW_REMARK_STR,v_wtdraw_remark);
      lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
      lpPubMsg->SetString(LDBIZ_TRADE_ACCO_STR,v_trade_acco);
      lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
      glpPubSub_Interface->PubTopics("secu.withdraw", lpPubMsg);


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
        //调用过程[事务_交易证券_主推接口_获取批量撤单信息]
        //组织事务请求
        if(lpTSCall1Ans9)
        {
          lpTSCall1Ans9->FreeMsg();
          lpTSCall1Ans9=NULL;
        }
        lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.27", 0);
        lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req9->SetString(LDBIZ_WTDRAW_ID_STR_STR,v_wtdraw_id_str);
        glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
        if(!lpTSCall1Ans9)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.27]subcall timed out!");
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


        // [获取结果集][lpMainMsg2]
        lpMainMsg2=lpTSCall1Ans9->GetGroup(LDTAG_NO_RESULTSET);


        // [遍历结果集开始][lpMainMsg2]
        iRecordCount = lpMainMsg2->GetRecordCount();
        for (int i = 0; i < iRecordCount;i++) 
        {
            IRecord* lpRecord =lpMainMsg2->GetRecord(i);
            if(lpRecord)
            {

                //获取记录字段值
                v_init_date = lpRecord->GetInt32(LDBIZ_INIT_DATE_INT);
                v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
                v_pass_no = lpRecord->GetInt32(LDBIZ_PASS_NO_INT);
                strcpy(v_out_acco, lpRecord->GetString(LDBIZ_OUT_ACCO_STR));
                v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
                strcpy(v_stock_acco, lpRecord->GetString(LDBIZ_STOCK_ACCO_STR));
                strcpy(v_stock_code, lpRecord->GetString(LDBIZ_STOCK_CODE_STR));
                v_wtdraw_date = lpRecord->GetInt32(LDBIZ_WTDRAW_DATE_INT);
                v_wtdraw_time = lpRecord->GetInt32(LDBIZ_WTDRAW_TIME_INT);
                v_order_date = lpRecord->GetInt32(LDBIZ_ORDER_DATE_INT);
                v_order_id = lpRecord->GetInt64(LDBIZ_ORDER_ID_INT64);
                strcpy(v_report_no, lpRecord->GetString(LDBIZ_REPORT_NO_STR));
                strcpy(v_wtdraw_status, lpRecord->GetString(LDBIZ_WTDRAW_STATUS_STR));
                v_order_price = lpRecord->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
                v_wtdraw_id = lpRecord->GetInt64(LDBIZ_WTDRAW_ID_INT64);

            //调用过程[事务_交易证券_交易_根据交易时间控制报盘主推]
            //组织事务请求
            if(lpTSCall1Ans10)
            {
              lpTSCall1Ans10->FreeMsg();
              lpTSCall1Ans10=NULL;
            }
            lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("tdsecuT.4.124", 0);
            lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req10->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpTSCall1Req10->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
            if(!lpTSCall1Ans10)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.4.124]subcall timed out!");
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
            v_trade_time_flag = lpTSCall1Ans10->GetInt32(LDBIZ_TRADE_TIME_FLAG_INT);


            // if @撤单状态# <> 《撤单状态-成功》 or @交易时间标志#=1  then
            if (strcmp(v_wtdraw_status , "3")!=0 || v_trade_time_flag==1 )
            {

                    // [主动推送][secu.ztrptwtdraw][证券主推_报盘_中泰订单撤单主推报盘消息]
                    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.927", 0);
                    lpPubMsg->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                    lpPubMsg->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                    lpPubMsg->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                    lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                    lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
                    lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
                    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                    lpPubMsg->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
                    lpPubMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
                    lpPubMsg->SetInt32(LDBIZ_WTDRAW_DATE_INT,v_wtdraw_date);
                    lpPubMsg->SetInt32(LDBIZ_WTDRAW_TIME_INT,v_wtdraw_time);
                    lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
                    lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
                    lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
                    lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
                    lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
                    lpPubMsg->SetString(LDBIZ_TRADE_ACCO_STR,v_trade_acco);
                    lpPubMsg->SetString(LDBIZ_LONG_TOKEN_STR,v_long_token);
                    glpPubSub_Interface->PubTopics("secu.ztrptwtdraw", lpPubMsg);

            // end if;
            }


        // [遍历结果集结束][lpMainMsg2]
            }
        }

    // end if;
    }

    //撤销策略

    // set @策略方向# = 0;
    v_strategy_dir = 0;

    // set @信用交易方式# = 0;
    v_margin_trade_type = 0;

    // set @目标策略类型# = " ";
    strcpy(v_target_strategy_type," ");

    // set @策略状态# = " ";
    strcpy(v_strategy_status," ");

    // set @策略处理状态# = " ";
    strcpy(v_strategy_deal_status," ");

    // set @策略处理方式# = 0;
    v_strategy_deal_kind = 0;

    // set @外部编号# = 0;
    v_external_no = 0;

    // set @订单批号# = 0;
    v_order_batch_no = 0;

    // set @策略操作方式# = " ";
    strcpy(v_strategy_oper_way," ");

    // set @指令批号# = 0;
    v_comm_batch_no = 0;

    // set @记录序号# = 0;
    v_row_id = 0;

    // set @指定行数# = -1;
    v_row_count = -1;

    // set @排序方式# = 1;
    v_sort_type = 1;

    // set @策略序号# = 0;
    v_strategy_id = 0;

    // set @机构编号权限串# = " ";
    strcpy(v_co_no_rights_str," ");

    // set @产品编号权限串# = 0;
    strcpy(v_pd_no_rights_str,"0");

    // set @交易组编号权限串# = 0;
    strcpy(v_exch_group_no_rights_str,"0");
    //调用过程[事务_交易证券_策略_查询策略]
    //组织事务请求
    if(lpTSCall1Ans11)
    {
      lpTSCall1Ans11->FreeMsg();
      lpTSCall1Ans11=NULL;
    }
    lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.101", 0);
    lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req11->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpTSCall1Req11->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req11->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req11->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req11->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    lpTSCall1Req11->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req11->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req11->SetInt32(LDBIZ_STRATEGY_DIR_INT,v_strategy_dir);
    lpTSCall1Req11->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
    lpTSCall1Req11->SetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT,v_margin_trade_type);
    lpTSCall1Req11->SetString(LDBIZ_TARGET_STRATEGY_TYPE_STR,v_target_strategy_type);
    lpTSCall1Req11->SetString(LDBIZ_STRATEGY_STATUS_STR,v_strategy_status);
    lpTSCall1Req11->SetString(LDBIZ_STRATEGY_DEAL_STATUS_STR,v_strategy_deal_status);
    lpTSCall1Req11->SetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT,v_strategy_deal_kind);
    lpTSCall1Req11->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpTSCall1Req11->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpTSCall1Req11->SetString(LDBIZ_STRATEGY_OPER_WAY_STR,v_strategy_oper_way);
    lpTSCall1Req11->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req11->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req11->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req11->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req11->SetInt32(LDBIZ_SORT_TYPE_INT,v_sort_type);
    lpTSCall1Req11->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req11->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req11->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
    if(!lpTSCall1Ans11)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.101]subcall timed out!");
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


    // [获取结果集][lpMainMsg3]
    lpMainMsg3=lpTSCall1Ans11->GetGroup(LDTAG_NO_RESULTSET);


    // [遍历结果集开始][lpMainMsg3]
    iRecordCount = lpMainMsg3->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpMainMsg3->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            v_comm_opor = lpRecord->GetInt32(LDBIZ_COMM_OPOR_INT);
            v_opor_no = lpRecord->GetInt32(LDBIZ_OPOR_NO_INT);
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
            v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
            v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            v_pass_no = lpRecord->GetInt32(LDBIZ_PASS_NO_INT);
            strcpy(v_out_acco, lpRecord->GetString(LDBIZ_OUT_ACCO_STR));
            v_strategy_id = lpRecord->GetInt64(LDBIZ_STRATEGY_ID_INT64);
            v_orig_strategy_id = lpRecord->GetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64);
            strcpy(v_strategy_exec_broker, lpRecord->GetString(LDBIZ_STRATEGY_EXEC_BROKER_STR));
            v_strategy_exec_kind = lpRecord->GetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT);
            strcpy(v_strategy_exec_comm_str, lpRecord->GetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR));
            v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
            v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
            strcpy(v_stock_acco, lpRecord->GetString(LDBIZ_STOCK_ACCO_STR));
            v_stock_type = lpRecord->GetInt32(LDBIZ_STOCK_TYPE_INT);
            v_asset_type = lpRecord->GetInt32(LDBIZ_ASSET_TYPE_INT);
            strcpy(v_stock_code, lpRecord->GetString(LDBIZ_STOCK_CODE_STR));
            v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
            v_strategy_dir = lpRecord->GetInt32(LDBIZ_STRATEGY_DIR_INT);
            v_strategy_qty = lpRecord->GetDouble(LDBIZ_STRATEGY_QTY_FLOAT);
            v_cash_strategy_qty = lpRecord->GetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT);
            v_strategy_price = lpRecord->GetDouble(LDBIZ_STRATEGY_PRICE_FLOAT);
            v_price_type = lpRecord->GetInt32(LDBIZ_PRICE_TYPE_INT);
            v_strategy_valid_type = lpRecord->GetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT);
            strcpy(v_strategy_rule_way, lpRecord->GetString(LDBIZ_STRATEGY_RULE_WAY_STR));
            strcpy(v_exch_crncy_type, lpRecord->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
            strcpy(v_remark_info, lpRecord->GetString(LDBIZ_REMARK_INFO_STR));
            v_strategy_time = lpRecord->GetInt32(LDBIZ_STRATEGY_TIME_INT);
            v_margin_trade_type = lpRecord->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
            strcpy(v_target_strategy_type, lpRecord->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR));
            strcpy(v_target_strategy_param, lpRecord->GetString(LDBIZ_TARGET_STRATEGY_PARAM_STR));
            strcpy(v_strategy_contr_comm, lpRecord->GetString(LDBIZ_STRATEGY_CONTR_COMM_STR));
            strcpy(v_strategy_status, lpRecord->GetString(LDBIZ_STRATEGY_STATUS_STR));
            strcpy(v_strategy_deal_status, lpRecord->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR));
            v_strategy_deal_kind = lpRecord->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
            v_strategy_amt = lpRecord->GetDouble(LDBIZ_STRATEGY_AMT_FLOAT);
            v_order_qty = lpRecord->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
            v_order_amt = lpRecord->GetDouble(LDBIZ_ORDER_AMT_FLOAT);
            v_wtdraw_qty = lpRecord->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
            v_strike_qty = lpRecord->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
            v_strike_amt = lpRecord->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
            v_external_no = lpRecord->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
            v_order_batch_no = lpRecord->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
            strcpy(v_strategy_oper_way, lpRecord->GetString(LDBIZ_STRATEGY_OPER_WAY_STR));
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);
            v_strategy_batch_no = lpRecord->GetInt32(LDBIZ_STRATEGY_BATCH_NO_INT);
            v_comm_batch_no = lpRecord->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
            v_comm_id = lpRecord->GetInt64(LDBIZ_COMM_ID_INT64);

        //调用过程[事务_交易证券_策略_撤销策略]
        //组织事务请求
        if(lpTSCall1Ans12)
        {
          lpTSCall1Ans12->FreeMsg();
          lpTSCall1Ans12=NULL;
        }
        lpTSCall1Req12=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.14", 0);
        lpTSCall1Req12->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req12->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req12->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req12->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req12->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req12->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req12->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req12->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req12->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
        lpTSCall1Req12->SetString(LDBIZ_TARGET_STRATEGY_TYPE_STR,v_target_strategy_type);
        lpTSCall1Req12->SetString(LDBIZ_TARGET_STRATEGY_PARAM_STR,v_target_strategy_param);
        lpTSCall1Req12->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req12, &lpTSCall1Ans12, 5000);
        if(!lpTSCall1Ans12)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.14]subcall timed out!");
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
        v_comm_opor = lpTSCall1Ans12->GetInt32(LDBIZ_COMM_OPOR_INT);
        v_co_no = lpTSCall1Ans12->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans12->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans12->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans12->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans12->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_out_acco, lpTSCall1Ans12->GetString(LDBIZ_OUT_ACCO_STR));
        v_strategy_batch_no = lpTSCall1Ans12->GetInt32(LDBIZ_STRATEGY_BATCH_NO_INT);
        v_orig_strategy_id = lpTSCall1Ans12->GetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64);
        strcpy(v_strategy_exec_broker, lpTSCall1Ans12->GetString(LDBIZ_STRATEGY_EXEC_BROKER_STR));
        v_strategy_exec_kind = lpTSCall1Ans12->GetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT);
        strcpy(v_strategy_exec_comm_str, lpTSCall1Ans12->GetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR));
        v_exch_no = lpTSCall1Ans12->GetInt32(LDBIZ_EXCH_NO_INT);
        v_stock_acco_no = lpTSCall1Ans12->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
        strcpy(v_stock_acco, lpTSCall1Ans12->GetString(LDBIZ_STOCK_ACCO_STR));
        v_stock_type = lpTSCall1Ans12->GetInt32(LDBIZ_STOCK_TYPE_INT);
        v_asset_type = lpTSCall1Ans12->GetInt32(LDBIZ_ASSET_TYPE_INT);
        strcpy(v_stock_code, lpTSCall1Ans12->GetString(LDBIZ_STOCK_CODE_STR));
        v_stock_code_no = lpTSCall1Ans12->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        v_strategy_dir = lpTSCall1Ans12->GetInt32(LDBIZ_STRATEGY_DIR_INT);
        v_strategy_qty = lpTSCall1Ans12->GetDouble(LDBIZ_STRATEGY_QTY_FLOAT);
        v_cash_strategy_qty = lpTSCall1Ans12->GetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT);
        v_strategy_price = lpTSCall1Ans12->GetDouble(LDBIZ_STRATEGY_PRICE_FLOAT);
        v_price_type = lpTSCall1Ans12->GetInt32(LDBIZ_PRICE_TYPE_INT);
        v_strategy_amt = lpTSCall1Ans12->GetDouble(LDBIZ_STRATEGY_AMT_FLOAT);
        v_strategy_valid_type = lpTSCall1Ans12->GetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT);
        strcpy(v_strategy_rule_way, lpTSCall1Ans12->GetString(LDBIZ_STRATEGY_RULE_WAY_STR));
        strcpy(v_exch_crncy_type, lpTSCall1Ans12->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_strategy_date = lpTSCall1Ans12->GetInt32(LDBIZ_STRATEGY_DATE_INT);
        v_strategy_time = lpTSCall1Ans12->GetInt32(LDBIZ_STRATEGY_TIME_INT);
        v_margin_trade_type = lpTSCall1Ans12->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
        strcpy(v_strategy_status, lpTSCall1Ans12->GetString(LDBIZ_STRATEGY_STATUS_STR));
        strcpy(v_strategy_deal_status, lpTSCall1Ans12->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR));
        v_strategy_deal_kind = lpTSCall1Ans12->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
        v_order_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_order_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ORDER_AMT_FLOAT);
        v_wtdraw_qty = lpTSCall1Ans12->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
        v_strike_qty = lpTSCall1Ans12->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans12->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_external_no = lpTSCall1Ans12->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
        v_order_batch_no = lpTSCall1Ans12->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
        strcpy(v_strategy_oper_way, lpTSCall1Ans12->GetString(LDBIZ_STRATEGY_OPER_WAY_STR));
        v_busi_opor_no = lpTSCall1Ans12->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
        v_new_strategy_id = lpTSCall1Ans12->GetInt64(LDBIZ_NEW_STRATEGY_ID_INT64);
        v_comm_id = lpTSCall1Ans12->GetInt64(LDBIZ_COMM_ID_INT64);
        v_comm_batch_no = lpTSCall1Ans12->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
        v_update_times = lpTSCall1Ans12->GetInt32(LDBIZ_UPDATE_TIMES_INT);


        // set @策略序号# = @新策略序号#;
        v_strategy_id = v_new_strategy_id;

        // [主动推送][secu.strategywithdraw][证券主推_算法交易_撤销策略主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.502", 0);
        lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpPubMsg->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
        lpPubMsg->SetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64,v_orig_strategy_id);
        lpPubMsg->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpPubMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
        lpPubMsg->SetInt32(LDBIZ_STRATEGY_DIR_INT,v_strategy_dir);
        lpPubMsg->SetDouble(LDBIZ_STRATEGY_QTY_FLOAT,v_strategy_qty);
        lpPubMsg->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        lpPubMsg->SetInt32(LDBIZ_STRATEGY_DATE_INT,v_strategy_date);
        lpPubMsg->SetInt32(LDBIZ_STRATEGY_TIME_INT,v_strategy_time);
        lpPubMsg->SetString(LDBIZ_TARGET_STRATEGY_TYPE_STR,v_target_strategy_type);
        lpPubMsg->SetString(LDBIZ_TARGET_STRATEGY_PARAM_STR,v_target_strategy_param);
        lpPubMsg->SetString(LDBIZ_STRATEGY_OPER_WAY_STR,v_strategy_oper_way);
        glpPubSub_Interface->PubTopics("secu.strategywithdraw", lpPubMsg);


        // set @策略序号# = @原策略序号#;
        v_strategy_id = v_orig_strategy_id;

        // set @策略处理方式#=《策略处理方式-新增》;
        v_strategy_deal_kind=1;

        // [主动推送][secu.strategyupdate][证券主推_算法交易_策略变化主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.510", 0);
        lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpPubMsg->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
        lpPubMsg->SetString(LDBIZ_STRATEGY_EXEC_BROKER_STR,v_strategy_exec_broker);
        lpPubMsg->SetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT,v_strategy_exec_kind);
        lpPubMsg->SetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR,v_strategy_exec_comm_str);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpPubMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetInt32(LDBIZ_STRATEGY_DIR_INT,v_strategy_dir);
        lpPubMsg->SetDouble(LDBIZ_STRATEGY_QTY_FLOAT,v_strategy_qty);
        lpPubMsg->SetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT,v_cash_strategy_qty);
        lpPubMsg->SetDouble(LDBIZ_STRATEGY_PRICE_FLOAT,v_strategy_price);
        lpPubMsg->SetDouble(LDBIZ_STRATEGY_AMT_FLOAT,v_strategy_amt);
        lpPubMsg->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
        lpPubMsg->SetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT,v_strategy_valid_type);
        lpPubMsg->SetString(LDBIZ_STRATEGY_RULE_WAY_STR,v_strategy_rule_way);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        lpPubMsg->SetInt32(LDBIZ_STRATEGY_DATE_INT,v_strategy_date);
        lpPubMsg->SetInt32(LDBIZ_STRATEGY_TIME_INT,v_strategy_time);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT,v_margin_trade_type);
        lpPubMsg->SetString(LDBIZ_TARGET_STRATEGY_TYPE_STR,v_target_strategy_type);
        lpPubMsg->SetString(LDBIZ_TARGET_STRATEGY_PARAM_STR,v_target_strategy_param);
        lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
        lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
        lpPubMsg->SetString(LDBIZ_STRATEGY_STATUS_STR,v_strategy_status);
        lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpPubMsg->SetDouble(LDBIZ_ORDER_AMT_FLOAT,v_order_amt);
        lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
        lpPubMsg->SetString(LDBIZ_STRATEGY_OPER_WAY_STR,v_strategy_oper_way);
        lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        lpPubMsg->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        glpPubSub_Interface->PubTopics("secu.strategyupdate", lpPubMsg);

        //调用过程[事务_交易证券_策略_查询单条策略汇总]
        //组织事务请求
        if(lpTSCall1Ans13)
        {
          lpTSCall1Ans13->FreeMsg();
          lpTSCall1Ans13=NULL;
        }
        lpTSCall1Req13=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.104", 0);
        lpTSCall1Req13->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req13->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req13->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req13->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req13->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req13->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req13->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req13->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req13->SetInt32(LDBIZ_STRATEGY_BATCH_NO_INT,v_strategy_batch_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req13, &lpTSCall1Ans13, 5000);
        if(!lpTSCall1Ans13)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.104]subcall timed out!");
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
        v_busi_opor_no = lpTSCall1Ans13->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
        v_comm_opor = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_OPOR_INT);
        v_co_no = lpTSCall1Ans13->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans13->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans13->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans13->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans13->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_strategy_exec_broker, lpTSCall1Ans13->GetString(LDBIZ_STRATEGY_EXEC_BROKER_STR));
        v_strategy_exec_kind = lpTSCall1Ans13->GetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT);
        strcpy(v_strategy_exec_comm_str, lpTSCall1Ans13->GetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR));
        v_exch_no = lpTSCall1Ans13->GetInt32(LDBIZ_EXCH_NO_INT);
        v_stock_type = lpTSCall1Ans13->GetInt32(LDBIZ_STOCK_TYPE_INT);
        v_asset_type = lpTSCall1Ans13->GetInt32(LDBIZ_ASSET_TYPE_INT);
        strcpy(v_stock_code, lpTSCall1Ans13->GetString(LDBIZ_STOCK_CODE_STR));
        v_stock_code_no = lpTSCall1Ans13->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        v_strategy_dir = lpTSCall1Ans13->GetInt32(LDBIZ_STRATEGY_DIR_INT);
        v_strategy_qty = lpTSCall1Ans13->GetDouble(LDBIZ_STRATEGY_QTY_FLOAT);
        v_cash_strategy_qty = lpTSCall1Ans13->GetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT);
        v_strategy_price = lpTSCall1Ans13->GetDouble(LDBIZ_STRATEGY_PRICE_FLOAT);
        v_price_type = lpTSCall1Ans13->GetInt32(LDBIZ_PRICE_TYPE_INT);
        v_strategy_amt = lpTSCall1Ans13->GetDouble(LDBIZ_STRATEGY_AMT_FLOAT);
        v_strategy_valid_type = lpTSCall1Ans13->GetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT);
        strcpy(v_strategy_rule_way, lpTSCall1Ans13->GetString(LDBIZ_STRATEGY_RULE_WAY_STR));
        strcpy(v_exch_crncy_type, lpTSCall1Ans13->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        strcpy(v_remark_info, lpTSCall1Ans13->GetString(LDBIZ_REMARK_INFO_STR));
        v_strategy_date = lpTSCall1Ans13->GetInt32(LDBIZ_STRATEGY_DATE_INT);
        v_margin_trade_type = lpTSCall1Ans13->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
        strcpy(v_target_strategy_type, lpTSCall1Ans13->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR));
        strcpy(v_target_strategy_param, lpTSCall1Ans13->GetString(LDBIZ_TARGET_STRATEGY_PARAM_STR));
        strcpy(v_strategy_contr_comm, lpTSCall1Ans13->GetString(LDBIZ_STRATEGY_CONTR_COMM_STR));
        strcpy(v_strategy_sum_status, lpTSCall1Ans13->GetString(LDBIZ_STRATEGY_SUM_STATUS_STR));
        strcpy(v_strategy_deal_status, lpTSCall1Ans13->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR));
        v_strategy_deal_kind = lpTSCall1Ans13->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
        v_order_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_valid_order_qty = lpTSCall1Ans13->GetDouble(LDBIZ_VALID_ORDER_QTY_FLOAT);
        v_order_amt = lpTSCall1Ans13->GetDouble(LDBIZ_ORDER_AMT_FLOAT);
        v_wtdraw_qty = lpTSCall1Ans13->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
        v_valid_wtdraw_qty = lpTSCall1Ans13->GetDouble(LDBIZ_VALID_WTDRAW_QTY_FLOAT);
        v_strike_qty = lpTSCall1Ans13->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans13->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_cancel_qty = lpTSCall1Ans13->GetDouble(LDBIZ_CANCEL_QTY_FLOAT);
        v_faild_qty = lpTSCall1Ans13->GetDouble(LDBIZ_FAILD_QTY_FLOAT);
        v_external_no = lpTSCall1Ans13->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
        v_order_batch_no = lpTSCall1Ans13->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
        v_comm_batch_no = lpTSCall1Ans13->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
        strcpy(v_strategy_oper_way, lpTSCall1Ans13->GetString(LDBIZ_STRATEGY_OPER_WAY_STR));
        v_update_times = lpTSCall1Ans13->GetInt32(LDBIZ_UPDATE_TIMES_INT);


        // [主动推送][secu.strategysum][证券主推_算法交易_策略汇总变化主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.511", 0);
        lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpPubMsg->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
        lpPubMsg->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
        lpPubMsg->SetInt32(LDBIZ_STRATEGY_BATCH_NO_INT,v_strategy_batch_no);
        lpPubMsg->SetString(LDBIZ_STRATEGY_EXEC_BROKER_STR,v_strategy_exec_broker);
        lpPubMsg->SetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT,v_strategy_exec_kind);
        lpPubMsg->SetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR,v_strategy_exec_comm_str);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpPubMsg->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
        lpPubMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetInt32(LDBIZ_STRATEGY_DIR_INT,v_strategy_dir);
        lpPubMsg->SetDouble(LDBIZ_STRATEGY_QTY_FLOAT,v_strategy_qty);
        lpPubMsg->SetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT,v_cash_strategy_qty);
        lpPubMsg->SetDouble(LDBIZ_STRATEGY_PRICE_FLOAT,v_strategy_price);
        lpPubMsg->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
        lpPubMsg->SetDouble(LDBIZ_STRATEGY_AMT_FLOAT,v_strategy_amt);
        lpPubMsg->SetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT,v_strategy_valid_type);
        lpPubMsg->SetString(LDBIZ_STRATEGY_RULE_WAY_STR,v_strategy_rule_way);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        lpPubMsg->SetInt32(LDBIZ_STRATEGY_DATE_INT,v_strategy_date);
        lpPubMsg->SetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT,v_margin_trade_type);
        lpPubMsg->SetString(LDBIZ_TARGET_STRATEGY_TYPE_STR,v_target_strategy_type);
        lpPubMsg->SetString(LDBIZ_TARGET_STRATEGY_PARAM_STR,v_target_strategy_param);
        lpPubMsg->SetString(LDBIZ_STRATEGY_CONTR_COMM_STR,v_strategy_contr_comm);
        lpPubMsg->SetString(LDBIZ_STRATEGY_SUM_STATUS_STR,v_strategy_sum_status);
        lpPubMsg->SetString(LDBIZ_STRATEGY_DEAL_STATUS_STR,v_strategy_deal_status);
        lpPubMsg->SetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT,v_strategy_deal_kind);
        lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpPubMsg->SetDouble(LDBIZ_VALID_ORDER_QTY_FLOAT,v_valid_order_qty);
        lpPubMsg->SetDouble(LDBIZ_ORDER_AMT_FLOAT,v_order_amt);
        lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
        lpPubMsg->SetDouble(LDBIZ_VALID_WTDRAW_QTY_FLOAT,v_valid_wtdraw_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_CANCEL_QTY_FLOAT,v_cancel_qty);
        lpPubMsg->SetDouble(LDBIZ_FAILD_QTY_FLOAT,v_faild_qty);
        lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
        lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
        lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpPubMsg->SetString(LDBIZ_STRATEGY_OPER_WAY_STR,v_strategy_oper_way);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        lpPubMsg->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        glpPubSub_Interface->PubTopics("secu.strategysum", lpPubMsg);


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
        if(lpTSCall1Ans14)
        {
          lpTSCall1Ans14->FreeMsg();
          lpTSCall1Ans14=NULL;
        }
        lpTSCall1Req14=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req14->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req14->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req14->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req14->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req14->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req14->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req14->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req14->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req14->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req14->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req14, &lpTSCall1Ans14, 5000);
        if (lpTSCall1Ans14)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans14->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans14->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans14->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans14->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans14->GetString(LDBIZ_ERROR_DEAL_STR));
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
    return iRet;
}

//逻辑_交易证券_中泰_新增组合指令
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
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    char v_combo_code[33];
    double v_combo_copies;
    char v_exch_no_str[2049];
    char v_stock_code_str[4097];
    char v_target_stock_code_str[4097];
    int v_comm_batch_no;
    int v_comm_executor;
    int v_comm_begin_date;
    int v_comm_end_date;
    int v_comm_begin_time;
    int v_comm_end_time;
    int v_order_batch_no;
    char v_comm_dir_str[2049];
    char v_price_type_str[2049];
    char v_comm_qty_str[4097];
    char v_limit_price_str[4097];
    char v_limit_actual_price_str[4097];
    char v_comm_amt_str[4097];
    char v_comm_oper_way[3];
    int64 v_basket_id;
    char v_combo_posi_id_str[2049];
    char v_long_token[1025];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_oper_statn[65];
    int v_pass_no;
    char v_out_acco[33];
    int v_order_date;
    char v_order_id_str[2049];
    char v_order_status_str[65];
    int64 v_compli_trig_id;
    char v_split_str[5];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_co_comm_appr_oper;
    char v_exgp_busi_config_str[65];
    char v_crncy_type_str[2049];
    char v_exch_crncy_type_str[2049];
    char v_buy_ref_rate_str[2049];
    char v_sell_ref_rate_str[2049];
    char v_stock_code_no_str[4097];
    char v_target_stock_code_no_str[4097];
    char v_stock_type_str[2049];
    char v_asset_type_str[2049];
    char v_net_price_flag_str[2049];
    char v_par_value_str[4097];
    char v_impawn_ratio_str[4097];
    char v_intrst_days_str[2049];
    char v_bond_rate_type_str[4097];
    char v_bond_accr_intrst_str[4097];
    char v_target_code_no_str[4097];
    char v_target_code_str[2049];
    char v_target_code_stock_type_str[2049];
    char v_target_code_asset_type_str[2049];
    char v_trade_code_no_str[4097];
    char v_trade_code_str[2049];
    char v_trade_code_stock_type_str[2049];
    char v_trade_code_asset_type_str[2049];
    char v_min_unit_str[2049];
    char v_up_limit_price_str[4097];
    char v_down_limit_price_str[4097];
    char v_last_price_str[4097];
    char v_capit_reback_days_str[2049];
    char v_posi_reback_days_str[2049];
    char v_pre_close_price_str[4097];
    char v_subscription_trade_mark_str[4097];
    char v_purchase_trade_mark_str[4097];
    char v_rede_trade_mark_str[4097];
    char v_first_minimum_amt_str[4097];
    char v_minimum_purchase_amt_str[4097];
    char v_minimum_subscription_amt_str[4097];
    char v_minimum_rede_share_str[4097];
    char v_minimum_holding_share_str[4097];
    char v_minimum_turning_out_share_str[4097];
    char v_fund_manager_str[4097];
    char v_charging_method_str[4097];
    char v_registration_agency_str[4097];
    char v_target_subscrip_trade_mark_str[4097];
    char v_target_purchase_trade_mark_str[4097];
    char v_target_rede_trade_mark_str[4097];
    char v_target_first_minimum_amt_str[4097];
    char v_target_min_purchase_amt_str[4097];
    char v_target_min_subscrip_amt_str[4097];
    char v_target_min_rede_share_str[4097];
    char v_target_min_holding_share_str[4097];
    char v_target_min_turning_out_share_str[4097];
    char v_target_fund_manager_str[4097];
    char v_target_charging_method_str[4097];
    char v_target_registration_agency_str[4097];
    char v_trade_acco[33];
    char v_sys_config_str[65];
    char v_online_opor_no_str[2049];
    char v_busi_config_str[65];
    char v_busi_ctrl_str[65];
    char v_order_dir_str[1025];
    char v_order_qty_str[4097];
    char v_order_price_str[4097];
    char v_asac_busi_config_str[65];
    char v_split_fee_typr_str[65];
    char v_busi_limit_str[2049];
    int v_comm_appr_oper;
    int v_exter_comm_flag;
    double v_market_price_ratio;
    double v_comm_no_limit_price_ratio;
    int v_cost_calc_type;
    int v_comm_appr_set;
    int v_appr_allow_order_flag;
    int v_sys_type;
    char v_opor_no_str1[2049];
    char v_opor_no_str2[2049];
    char v_opor_no_str3[2049];
    int v_asset_acco_type;
    char v_stock_acco_no_str[4097];
    char v_stock_acco_str[2049];
    double v_exgp_avail_amt;
    double v_asac_avail_amt;
    double v_asac_T_hk_buy_total_amt;
    double v_asac_T_hk_sell_total_amt;
    double v_asac_T1_hk_buy_total_amt;
    double v_asac_T1_hk_sell_total_amt;
    double v_exgp_T_hk_buy_total_amt;
    double v_exgp_T_hk_sell_total_amt;
    double v_exgp_T1_hk_buy_total_amt;
    double v_exgp_T1_hk_sell_total_amt;
    char v_exgp_avail_qty_str[4097];
    char v_exgp_target_code_avail_qty_str[4097];
    char v_exgp_trade_code_avail_qty_str[4097];
    char v_asac_avail_qty_str[4097];
    char v_asac_target_code_avail_qty_str[4097];
    char v_asac_trade_code_avail_qty_str[4097];
    int v_record_count;
    char v_all_fee_str[4097];
    int v_tmp_opor_no;
    char v_last_login_ip[33];
    char v_last_login_mac[33];
    int v_last_login_date;
    char v_last_oper_info[256];
    int v_online_status;
    int v_comm_opor;
    double v_nav_asset;
    int v_read_flag;
    char v_acco_concat_info[4097];
    int v_comm_date;
    char v_comm_id_str[2049];
    char v_comm_appr_status_str[2049];
    int64 v_comm_id;
    char v_exch_crncy_type[4];
    int v_stock_acco_no;
    int v_stock_code_no;
    int v_stock_type;
    int v_comm_time;
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
    char v_strike_status[3];
    char v_comm_status[3];
    int v_comm_comple_date;
    int v_comm_comple_time;
    int v_comm_appr_date;
    int v_comm_appr_time;
    char v_comm_appr_status[3];
    char v_comm_appr_remark[256];
    int v_net_price_flag;
    double v_bond_accr_intrst;
    int v_bond_rate_type;
    int v_comm_comple_flag;
    double v_strategy_capt_qty;
    double v_strategy_order_qty;
    char v_contra_no[33];
    char v_comm_remark_info[1025];
    int v_disp_opor;
    int v_disp_status;
    int v_update_times;
    int64 v_sum_comm_row_id;
    int v_sum_comm_co_no;
    int v_sum_comm_pd_no;
    int v_sum_comm_exch_group_no;
    int v_sum_comm_asset_acco_no;
    int v_sum_comm_pass_no;
    char v_sum_comm_out_acco[33];
    char v_sum_comm_exch_crncy_type[4];
    int v_sum_comm_stock_code_no;
    int v_sum_comm_date;
    int v_sum_comm_time;
    int v_sum_comm_batch_no;
    int v_sum_comm_opor;
    int v_sum_comm_executor;
    int v_sum_comm_dir;
    double v_sum_comm_limit_price;
    double v_sum_comm_qty;
    double v_sum_comm_amt;
    double v_sum_comm_order_qty;
    double v_sum_comm_cancel_qty;
    double v_sum_comm_await_cancel_qty;
    double v_sum_comm_strike_amt;
    double v_sum_comm_strike_qty;
    char v_sum_comm_strike_status[3];
    char v_comm_sum_status[3];
    int v_sum_comm_begin_date;
    int v_sum_comm_end_date;
    int v_sum_comm_begin_time;
    int v_sum_comm_end_time;
    int v_sum_comm_comple_date;
    int v_sum_comm_comple_time;
    int v_sum_comm_max_comm_comple_date;
    int v_sum_comm_max_comm_comple_time;
    int v_sum_comm_appr_date;
    int v_sum_comm_appr_time;
    double v_sum_comm_appr_qty;
    char v_comm_sum_approve_status[3];
    int64 v_sum_comm_basket_id;
    int v_sum_comm_net_price_flag;
    double v_sum_comm_bond_accr_intrst;
    int v_sum_comm_bond_rate_type;
    char v_sum_comm_oper_way[3];
    int v_sum_comm_exter_comm_flag;
    double v_sum_buy_order_qty;
    double v_sum_sell_order_qty;
    double v_sum_buy_comm_qty;
    double v_sum_sell_comm_qty;
    double v_sum_buy_strike_qty;
    double v_sum_sell_strike_qty;
    double v_sum_buy_strike_amt;
    double v_sum_sell_strike_amt;
    double v_sum_buy_comm_amt;
    double v_sum_sell_comm_amt;
    int v_sum_comm_update_times;
    int64 v_order_id;
    int v_busi_opor_no;
    int64 v_external_no;
    int v_exch_no;
    char v_stock_code[7];
    char v_stock_acco[17];
    int v_order_dir;
    double v_order_price;
    int v_order_time;
    double v_wtdraw_qty;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    double v_par_value;
    double v_impawn_ratio;
    char v_rsp_info[256];
    double v_strike_bond_accr_intrst;
    int v_price_type;
    char v_order_oper_way[3];
    char v_order_status[3];
    double v_order_frozen_amt;
    double v_order_frozen_qty;
    int64 v_combo_posi_id;
    int64 v_strategy_id;
    char v_registration_agency[33];
    double v_curr_strike_price;
    double v_curr_strike_amt;
    double v_curr_strike_qty;
    int64 v_strike_id;
    double v_all_fee;
    char v_wtdraw_status[3];
    int64 v_sum_order_row_id;
    int v_sum_order_opor_no;
    int v_sum_order_co_no;
    int v_sum_order_pd_no;
    int v_sum_order_exch_group_no;
    int v_sum_order_asset_acco_no;
    int v_sum_order_pass_no;
    char v_sum_order_exch_crncy_type[4];
    int v_sum_order_stock_code_no;
    int v_sum_order_trade_code_no;
    int v_sum_order_target_code_no;
    int64 v_sum_order_external_no;
    int v_sum_order_date;
    int v_sum_order_batch_no;
    int v_sum_order_dir;
    int v_sum_order_price_type;
    double v_sum_order_price;
    double v_sum_order_qty;
    char v_order_sum_status[3];
    double v_sum_order_wtdraw_qty;
    double v_sum_order_waste_qty;
    double v_sum_order_strike_amt;
    double v_sum_order_strike_qty;
    double v_sum_order_strike_aver_price;
    int v_sum_order_net_price_flag;
    double v_sum_order_bond_accr_intrst;
    int v_sum_order_bond_rate_type;
    double v_sum_order_par_value;
    double v_sum_order_impawn_ratio;
    char v_sum_order_oper_way[3];
    int v_sum_order_update_times;
    int64 v_sum_strike_row_id;
    int v_sum_strike_opor_no;
    int v_sum_strike_co_no;
    int v_sum_strike_pd_no;
    int v_sum_strike_exch_group_no;
    int v_sum_strike_asset_acco_no;
    int v_sum_strike_pass_no;
    char v_sum_strike_out_acco[33];
    int v_sum_strike_stock_acco_no;
    int v_sum_strike_stock_code_no;
    int64 v_sum_strike_comm_id;
    int v_sum_strike_report_date;
    char v_sum_strike_report_no[33];
    int v_sum_strike_order_date;
    int64 v_sum_strike_order_id;
    int v_sum_strike_order_dir;
    double v_sum_strike_order_price;
    double v_sum_strike_order_qty;
    double v_sum_strike_strike_qty;
    double v_sum_strike_strike_amt;
    double v_sum_strike_all_fee;
    double v_sum_strike_stamp_tax;
    double v_sum_strike_trans_fee;
    double v_sum_strike_brkage_fee;
    double v_sum_strike_SEC_charges;
    double v_sum_strike_other_fee;
    double v_sum_strike_trade_commis;
    double v_sum_strike_other_commis;
    double v_sum_trade_tax;
    double v_sum_trade_cost_fee;
    double v_sum_trade_system_use_fee;
    double v_sum_stock_settle_fee;
    int v_sum_strike_net_price_flag;
    double v_sum_strike_bond_accr_intrst;
    int v_sum_strike_bond_rate_type;
    char v_sum_strike_order_oper_way[3];
    int v_sum_strike_exter_comm_flag;
    int v_sum_strike_update_times;
    int v_sum_strike_order_batch_no;
    int64 v_sum_external_no;
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
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    strcpy(v_combo_code, " ");
    v_combo_copies=0;
    strcpy(v_exch_no_str, " ");
    strcpy(v_stock_code_str, " ");
    strcpy(v_target_stock_code_str, " ");
    v_comm_batch_no=0;
    v_comm_executor=0;
    v_comm_begin_date=0;
    v_comm_end_date=0;
    v_comm_begin_time=0;
    v_comm_end_time=0;
    v_order_batch_no=0;
    strcpy(v_comm_dir_str, " ");
    strcpy(v_price_type_str, " ");
    strcpy(v_comm_qty_str, " ");
    strcpy(v_limit_price_str, " ");
    strcpy(v_limit_actual_price_str, " ");
    strcpy(v_comm_amt_str, " ");
    strcpy(v_comm_oper_way, " ");
    v_basket_id=0;
    strcpy(v_combo_posi_id_str, " ");
    strcpy(v_long_token, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_oper_statn, " ");
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_order_date=0;
    strcpy(v_order_id_str, " ");
    strcpy(v_order_status_str, " ");
    v_compli_trig_id=0;
    strcpy(v_split_str, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_co_comm_appr_oper=0;
    strcpy(v_exgp_busi_config_str, " ");
    strcpy(v_crncy_type_str, " ");
    strcpy(v_exch_crncy_type_str, " ");
    strcpy(v_buy_ref_rate_str, " ");
    strcpy(v_sell_ref_rate_str, " ");
    strcpy(v_stock_code_no_str, " ");
    strcpy(v_target_stock_code_no_str, " ");
    strcpy(v_stock_type_str, " ");
    strcpy(v_asset_type_str, " ");
    strcpy(v_net_price_flag_str, " ");
    strcpy(v_par_value_str, " ");
    strcpy(v_impawn_ratio_str, " ");
    strcpy(v_intrst_days_str, " ");
    strcpy(v_bond_rate_type_str, " ");
    strcpy(v_bond_accr_intrst_str, " ");
    strcpy(v_target_code_no_str, " ");
    strcpy(v_target_code_str, " ");
    strcpy(v_target_code_stock_type_str, " ");
    strcpy(v_target_code_asset_type_str, " ");
    strcpy(v_trade_code_no_str, " ");
    strcpy(v_trade_code_str, " ");
    strcpy(v_trade_code_stock_type_str, " ");
    strcpy(v_trade_code_asset_type_str, " ");
    strcpy(v_min_unit_str, " ");
    strcpy(v_up_limit_price_str, " ");
    strcpy(v_down_limit_price_str, " ");
    strcpy(v_last_price_str, " ");
    strcpy(v_capit_reback_days_str, " ");
    strcpy(v_posi_reback_days_str, " ");
    strcpy(v_pre_close_price_str, " ");
    strcpy(v_subscription_trade_mark_str, " ");
    strcpy(v_purchase_trade_mark_str, " ");
    strcpy(v_rede_trade_mark_str, " ");
    strcpy(v_first_minimum_amt_str, " ");
    strcpy(v_minimum_purchase_amt_str, " ");
    strcpy(v_minimum_subscription_amt_str, " ");
    strcpy(v_minimum_rede_share_str, " ");
    strcpy(v_minimum_holding_share_str, " ");
    strcpy(v_minimum_turning_out_share_str, " ");
    strcpy(v_fund_manager_str, " ");
    strcpy(v_charging_method_str, " ");
    strcpy(v_registration_agency_str, " ");
    strcpy(v_target_subscrip_trade_mark_str, " ");
    strcpy(v_target_purchase_trade_mark_str, " ");
    strcpy(v_target_rede_trade_mark_str, " ");
    strcpy(v_target_first_minimum_amt_str, " ");
    strcpy(v_target_min_purchase_amt_str, " ");
    strcpy(v_target_min_subscrip_amt_str, " ");
    strcpy(v_target_min_rede_share_str, " ");
    strcpy(v_target_min_holding_share_str, " ");
    strcpy(v_target_min_turning_out_share_str, " ");
    strcpy(v_target_fund_manager_str, " ");
    strcpy(v_target_charging_method_str, " ");
    strcpy(v_target_registration_agency_str, " ");
    strcpy(v_trade_acco, " ");
    strcpy(v_sys_config_str, " ");
    strcpy(v_online_opor_no_str, " ");
    strcpy(v_busi_config_str, " ");
    strcpy(v_busi_ctrl_str, " ");
    strcpy(v_order_dir_str, " ");
    strcpy(v_order_qty_str, " ");
    strcpy(v_order_price_str, " ");
    strcpy(v_asac_busi_config_str, " ");
    strcpy(v_split_fee_typr_str, " ");
    strcpy(v_busi_limit_str, " ");
    v_comm_appr_oper=0;
    v_exter_comm_flag=0;
    v_market_price_ratio=0;
    v_comm_no_limit_price_ratio=0;
    v_cost_calc_type=0;
    v_comm_appr_set=0;
    v_appr_allow_order_flag=0;
    v_sys_type=0;
    strcpy(v_opor_no_str1, " ");
    strcpy(v_opor_no_str2, " ");
    strcpy(v_opor_no_str3, " ");
    v_asset_acco_type=0;
    strcpy(v_stock_acco_no_str, " ");
    strcpy(v_stock_acco_str, " ");
    v_exgp_avail_amt=0;
    v_asac_avail_amt=0;
    v_asac_T_hk_buy_total_amt=0;
    v_asac_T_hk_sell_total_amt=0;
    v_asac_T1_hk_buy_total_amt=0;
    v_asac_T1_hk_sell_total_amt=0;
    v_exgp_T_hk_buy_total_amt=0;
    v_exgp_T_hk_sell_total_amt=0;
    v_exgp_T1_hk_buy_total_amt=0;
    v_exgp_T1_hk_sell_total_amt=0;
    strcpy(v_exgp_avail_qty_str, " ");
    strcpy(v_exgp_target_code_avail_qty_str, " ");
    strcpy(v_exgp_trade_code_avail_qty_str, " ");
    strcpy(v_asac_avail_qty_str, " ");
    strcpy(v_asac_target_code_avail_qty_str, " ");
    strcpy(v_asac_trade_code_avail_qty_str, " ");
    v_record_count=0;
    strcpy(v_all_fee_str, " ");
    v_tmp_opor_no=0;
    strcpy(v_last_login_ip, " ");
    strcpy(v_last_login_mac, " ");
    v_last_login_date=0;
    strcpy(v_last_oper_info, " ");
    v_online_status=0;
    v_comm_opor=0;
    v_nav_asset=0;
    v_read_flag=0;
    strcpy(v_acco_concat_info, " ");
    v_comm_date=0;
    strcpy(v_comm_id_str, " ");
    strcpy(v_comm_appr_status_str, " ");
    v_comm_id=0;
    strcpy(v_exch_crncy_type, "CNY");
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_stock_type=0;
    v_comm_time=0;
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
    strcpy(v_strike_status, "0");
    strcpy(v_comm_status, "0");
    v_comm_comple_date=0;
    v_comm_comple_time=0;
    v_comm_appr_date=0;
    v_comm_appr_time=0;
    strcpy(v_comm_appr_status, " ");
    strcpy(v_comm_appr_remark, " ");
    v_net_price_flag=0;
    v_bond_accr_intrst=0;
    v_bond_rate_type=0;
    v_comm_comple_flag=0;
    v_strategy_capt_qty=0;
    v_strategy_order_qty=0;
    strcpy(v_contra_no, " ");
    strcpy(v_comm_remark_info, " ");
    v_disp_opor=0;
    v_disp_status=0;
    v_update_times=1;
    v_sum_comm_row_id=0;
    v_sum_comm_co_no=0;
    v_sum_comm_pd_no=0;
    v_sum_comm_exch_group_no=0;
    v_sum_comm_asset_acco_no=0;
    v_sum_comm_pass_no=0;
    strcpy(v_sum_comm_out_acco, " ");
    strcpy(v_sum_comm_exch_crncy_type, "CNY");
    v_sum_comm_stock_code_no=0;
    v_sum_comm_date=0;
    v_sum_comm_time=0;
    v_sum_comm_batch_no=0;
    v_sum_comm_opor=0;
    v_sum_comm_executor=0;
    v_sum_comm_dir=0;
    v_sum_comm_limit_price=0;
    v_sum_comm_qty=0;
    v_sum_comm_amt=0;
    v_sum_comm_order_qty=0;
    v_sum_comm_cancel_qty=0;
    v_sum_comm_await_cancel_qty=0;
    v_sum_comm_strike_amt=0;
    v_sum_comm_strike_qty=0;
    strcpy(v_sum_comm_strike_status, "0");
    strcpy(v_comm_sum_status, "0");
    v_sum_comm_begin_date=0;
    v_sum_comm_end_date=0;
    v_sum_comm_begin_time=0;
    v_sum_comm_end_time=0;
    v_sum_comm_comple_date=0;
    v_sum_comm_comple_time=0;
    v_sum_comm_max_comm_comple_date=0;
    v_sum_comm_max_comm_comple_time=0;
    v_sum_comm_appr_date=0;
    v_sum_comm_appr_time=0;
    v_sum_comm_appr_qty=0;
    strcpy(v_comm_sum_approve_status, "0");
    v_sum_comm_basket_id=0;
    v_sum_comm_net_price_flag=0;
    v_sum_comm_bond_accr_intrst=0;
    v_sum_comm_bond_rate_type=0;
    strcpy(v_sum_comm_oper_way, " ");
    v_sum_comm_exter_comm_flag=0;
    v_sum_buy_order_qty=0;
    v_sum_sell_order_qty=0;
    v_sum_buy_comm_qty=0;
    v_sum_sell_comm_qty=0;
    v_sum_buy_strike_qty=0;
    v_sum_sell_strike_qty=0;
    v_sum_buy_strike_amt=0;
    v_sum_sell_strike_amt=0;
    v_sum_buy_comm_amt=0;
    v_sum_sell_comm_amt=0;
    v_sum_comm_update_times=1;
    v_order_id=0;
    v_busi_opor_no=0;
    v_external_no=0;
    v_exch_no=0;
    strcpy(v_stock_code, " ");
    strcpy(v_stock_acco, " ");
    v_order_dir=0;
    v_order_price=0;
    v_order_time=0;
    v_wtdraw_qty=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_par_value=0;
    v_impawn_ratio=0;
    strcpy(v_rsp_info, " ");
    v_strike_bond_accr_intrst=0;
    v_price_type=0;
    strcpy(v_order_oper_way, " ");
    strcpy(v_order_status, "0");
    v_order_frozen_amt=0;
    v_order_frozen_qty=0;
    v_combo_posi_id=0;
    v_strategy_id=0;
    strcpy(v_registration_agency, " ");
    v_curr_strike_price=0;
    v_curr_strike_amt=0;
    v_curr_strike_qty=0;
    v_strike_id=0;
    v_all_fee=0;
    strcpy(v_wtdraw_status, "0");
    v_sum_order_row_id=0;
    v_sum_order_opor_no=0;
    v_sum_order_co_no=0;
    v_sum_order_pd_no=0;
    v_sum_order_exch_group_no=0;
    v_sum_order_asset_acco_no=0;
    v_sum_order_pass_no=0;
    strcpy(v_sum_order_exch_crncy_type, "CNY");
    v_sum_order_stock_code_no=0;
    v_sum_order_trade_code_no=0;
    v_sum_order_target_code_no=0;
    v_sum_order_external_no=0;
    v_sum_order_date=0;
    v_sum_order_batch_no=0;
    v_sum_order_dir=0;
    v_sum_order_price_type=0;
    v_sum_order_price=0;
    v_sum_order_qty=0;
    strcpy(v_order_sum_status, "0");
    v_sum_order_wtdraw_qty=0;
    v_sum_order_waste_qty=0;
    v_sum_order_strike_amt=0;
    v_sum_order_strike_qty=0;
    v_sum_order_strike_aver_price=0;
    v_sum_order_net_price_flag=0;
    v_sum_order_bond_accr_intrst=0;
    v_sum_order_bond_rate_type=0;
    v_sum_order_par_value=0;
    v_sum_order_impawn_ratio=0;
    strcpy(v_sum_order_oper_way, " ");
    v_sum_order_update_times=1;
    v_sum_strike_row_id=0;
    v_sum_strike_opor_no=0;
    v_sum_strike_co_no=0;
    v_sum_strike_pd_no=0;
    v_sum_strike_exch_group_no=0;
    v_sum_strike_asset_acco_no=0;
    v_sum_strike_pass_no=0;
    strcpy(v_sum_strike_out_acco, " ");
    v_sum_strike_stock_acco_no=0;
    v_sum_strike_stock_code_no=0;
    v_sum_strike_comm_id=0;
    v_sum_strike_report_date=0;
    strcpy(v_sum_strike_report_no, " ");
    v_sum_strike_order_date=0;
    v_sum_strike_order_id=0;
    v_sum_strike_order_dir=0;
    v_sum_strike_order_price=0;
    v_sum_strike_order_qty=0;
    v_sum_strike_strike_qty=0;
    v_sum_strike_strike_amt=0;
    v_sum_strike_all_fee=0;
    v_sum_strike_stamp_tax=0;
    v_sum_strike_trans_fee=0;
    v_sum_strike_brkage_fee=0;
    v_sum_strike_SEC_charges=0;
    v_sum_strike_other_fee=0;
    v_sum_strike_trade_commis=0;
    v_sum_strike_other_commis=0;
    v_sum_trade_tax=0;
    v_sum_trade_cost_fee=0;
    v_sum_trade_system_use_fee=0;
    v_sum_stock_settle_fee=0;
    v_sum_strike_net_price_flag=0;
    v_sum_strike_bond_accr_intrst=0;
    v_sum_strike_bond_rate_type=0;
    strcpy(v_sum_strike_order_oper_way, " ");
    v_sum_strike_exter_comm_flag=0;
    v_sum_strike_update_times=1;
    v_sum_strike_order_batch_no=0;
    v_sum_external_no=0;
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
    strncpy(v_combo_code, lpInBizMsg->GetString(LDBIZ_COMBO_CODE_STR),32);
    v_combo_code[32] = '\0';
    v_combo_copies = lpInBizMsg->GetDouble(LDBIZ_COMBO_COPIES_FLOAT);
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    strncpy(v_stock_code_str, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR_STR),4096);
    v_stock_code_str[4096] = '\0';
    strncpy(v_target_stock_code_str, lpInBizMsg->GetString(LDBIZ_TARGET_STOCK_CODE_STR_STR),4096);
    v_target_stock_code_str[4096] = '\0';
    v_comm_batch_no = lpInBizMsg->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_executor = lpInBizMsg->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_comm_begin_date = lpInBizMsg->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
    v_comm_end_date = lpInBizMsg->GetInt32(LDBIZ_COMM_END_DATE_INT);
    v_comm_begin_time = lpInBizMsg->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
    v_comm_end_time = lpInBizMsg->GetInt32(LDBIZ_COMM_END_TIME_INT);
    v_order_batch_no = lpInBizMsg->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strncpy(v_comm_dir_str, lpInBizMsg->GetString(LDBIZ_COMM_DIR_STR_STR),2048);
    v_comm_dir_str[2048] = '\0';
    strncpy(v_price_type_str, lpInBizMsg->GetString(LDBIZ_PRICE_TYPE_STR_STR),2048);
    v_price_type_str[2048] = '\0';
    strncpy(v_comm_qty_str, lpInBizMsg->GetString(LDBIZ_COMM_QTY_STR_STR),4096);
    v_comm_qty_str[4096] = '\0';
    strncpy(v_limit_price_str, lpInBizMsg->GetString(LDBIZ_LIMIT_PRICE_STR_STR),4096);
    v_limit_price_str[4096] = '\0';
    strncpy(v_limit_actual_price_str, lpInBizMsg->GetString(LDBIZ_LIMIT_ACTUAL_PRICE_STR_STR),4096);
    v_limit_actual_price_str[4096] = '\0';
    strncpy(v_comm_amt_str, lpInBizMsg->GetString(LDBIZ_COMM_AMT_STR_STR),4096);
    v_comm_amt_str[4096] = '\0';
    strncpy(v_comm_oper_way, lpInBizMsg->GetString(LDBIZ_COMM_OPER_WAY_STR),2);
    v_comm_oper_way[2] = '\0';
    v_basket_id = lpInBizMsg->GetInt64(LDBIZ_BASKET_ID_INT64);
    strncpy(v_combo_posi_id_str, lpInBizMsg->GetString(LDBIZ_COMBO_POSI_ID_STR_STR),2048);
    v_combo_posi_id_str[2048] = '\0';
    strncpy(v_long_token, lpInBizMsg->GetString(LDBIZ_LONG_TOKEN_STR),1024);
    v_long_token[1024] = '\0';

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


    // set @分隔符# = ";";
    strcpy(v_split_str,";");
    //公共子系统检查，检查状态、身份、权限等 这里要改为批量校验
    //调用过程[事务_公共_交易接口_检查基金批量指令市场状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.25.9", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req0->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req0->SetString(LDBIZ_TARGET_STOCK_CODE_STR_STR,v_target_stock_code_str);
    lpTSCall1Req0->SetString(LDBIZ_STOCK_CODE_STR_STR,v_stock_code_str);
    lpTSCall1Req0->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpTSCall1Req0->SetString(LDBIZ_COMM_DIR_STR_STR,v_comm_dir_str);
    lpTSCall1Req0->SetString(LDBIZ_COMM_QTY_STR_STR,v_comm_qty_str);
    lpTSCall1Req0->SetString(LDBIZ_LIMIT_PRICE_STR_STR,v_limit_price_str);
    lpTSCall1Req0->SetString(LDBIZ_SPLIT_STR_STR,v_split_str);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.9]subcall timed out!");
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
    v_co_comm_appr_oper = lpTSCall1Ans0->GetInt32(LDBIZ_CO_COMM_APPR_OPER_INT);
    strcpy(v_exgp_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR));
    strcpy(v_crncy_type_str, lpTSCall1Ans0->GetString(LDBIZ_CRNCY_TYPE_STR_STR));
    strcpy(v_exch_crncy_type_str, lpTSCall1Ans0->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR_STR));
    strcpy(v_buy_ref_rate_str, lpTSCall1Ans0->GetString(LDBIZ_BUY_REF_RATE_STR_STR));
    strcpy(v_sell_ref_rate_str, lpTSCall1Ans0->GetString(LDBIZ_SELL_REF_RATE_STR_STR));
    strcpy(v_stock_code_no_str, lpTSCall1Ans0->GetString(LDBIZ_STOCK_CODE_NO_STR_STR));
    strcpy(v_target_stock_code_no_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_STOCK_CODE_NO_STR_STR));
    strcpy(v_stock_type_str, lpTSCall1Ans0->GetString(LDBIZ_STOCK_TYPE_STR_STR));
    strcpy(v_asset_type_str, lpTSCall1Ans0->GetString(LDBIZ_ASSET_TYPE_STR_STR));
    strcpy(v_net_price_flag_str, lpTSCall1Ans0->GetString(LDBIZ_NET_PRICE_FLAG_STR_STR));
    strcpy(v_par_value_str, lpTSCall1Ans0->GetString(LDBIZ_PAR_VALUE_STR_STR));
    strcpy(v_impawn_ratio_str, lpTSCall1Ans0->GetString(LDBIZ_IMPAWN_RATIO_STR_STR));
    strcpy(v_intrst_days_str, lpTSCall1Ans0->GetString(LDBIZ_INTRST_DAYS_STR_STR));
    strcpy(v_bond_rate_type_str, lpTSCall1Ans0->GetString(LDBIZ_BOND_RATE_TYPE_STR_STR));
    strcpy(v_bond_accr_intrst_str, lpTSCall1Ans0->GetString(LDBIZ_BOND_ACCR_INTRST_STR_STR));
    strcpy(v_target_code_no_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_CODE_NO_STR_STR));
    strcpy(v_target_code_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_CODE_STR_STR));
    strcpy(v_target_code_stock_type_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_CODE_STOCK_TYPE_STR_STR));
    strcpy(v_target_code_asset_type_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_CODE_ASSET_TYPE_STR_STR));
    strcpy(v_trade_code_no_str, lpTSCall1Ans0->GetString(LDBIZ_TRADE_CODE_NO_STR_STR));
    strcpy(v_trade_code_str, lpTSCall1Ans0->GetString(LDBIZ_TRADE_CODE_STR_STR));
    strcpy(v_trade_code_stock_type_str, lpTSCall1Ans0->GetString(LDBIZ_TRADE_CODE_STOCK_TYPE_STR_STR));
    strcpy(v_trade_code_asset_type_str, lpTSCall1Ans0->GetString(LDBIZ_TRADE_CODE_ASSET_TYPE_STR_STR));
    strcpy(v_min_unit_str, lpTSCall1Ans0->GetString(LDBIZ_MIN_UNIT_STR_STR));
    strcpy(v_up_limit_price_str, lpTSCall1Ans0->GetString(LDBIZ_UP_LIMIT_PRICE_STR_STR));
    strcpy(v_down_limit_price_str, lpTSCall1Ans0->GetString(LDBIZ_DOWN_LIMIT_PRICE_STR_STR));
    strcpy(v_last_price_str, lpTSCall1Ans0->GetString(LDBIZ_LAST_PRICE_STR_STR));
    strcpy(v_capit_reback_days_str, lpTSCall1Ans0->GetString(LDBIZ_CAPIT_REBACK_DAYS_STR_STR));
    strcpy(v_posi_reback_days_str, lpTSCall1Ans0->GetString(LDBIZ_POSI_REBACK_DAYS_STR_STR));
    strcpy(v_limit_actual_price_str, lpTSCall1Ans0->GetString(LDBIZ_LIMIT_ACTUAL_PRICE_STR_STR));
    strcpy(v_pre_close_price_str, lpTSCall1Ans0->GetString(LDBIZ_PRE_CLOSE_PRICE_STR_STR));
    strcpy(v_subscription_trade_mark_str, lpTSCall1Ans0->GetString(LDBIZ_SUBSCRIPTION_TRADE_MARK_STR_STR));
    strcpy(v_purchase_trade_mark_str, lpTSCall1Ans0->GetString(LDBIZ_PURCHASE_TRADE_MARK_STR_STR));
    strcpy(v_rede_trade_mark_str, lpTSCall1Ans0->GetString(LDBIZ_REDE_TRADE_MARK_STR_STR));
    strcpy(v_first_minimum_amt_str, lpTSCall1Ans0->GetString(LDBIZ_FIRST_MINIMUM_AMT_STR_STR));
    strcpy(v_minimum_purchase_amt_str, lpTSCall1Ans0->GetString(LDBIZ_MINIMUM_PURCHASE_AMT_STR_STR));
    strcpy(v_minimum_subscription_amt_str, lpTSCall1Ans0->GetString(LDBIZ_MINIMUM_SUBSCRIPTION_AMT_STR_STR));
    strcpy(v_minimum_rede_share_str, lpTSCall1Ans0->GetString(LDBIZ_MINIMUM_REDE_SHARE_STR_STR));
    strcpy(v_minimum_holding_share_str, lpTSCall1Ans0->GetString(LDBIZ_MINIMUM_HOLDING_SHARE_STR_STR));
    strcpy(v_minimum_turning_out_share_str, lpTSCall1Ans0->GetString(LDBIZ_MINIMUM_TURNING_OUT_SHARE_STR_STR));
    strcpy(v_fund_manager_str, lpTSCall1Ans0->GetString(LDBIZ_FUND_MANAGER_STR_STR));
    strcpy(v_charging_method_str, lpTSCall1Ans0->GetString(LDBIZ_CHARGING_METHOD_STR_STR));
    strcpy(v_registration_agency_str, lpTSCall1Ans0->GetString(LDBIZ_REGISTRATION_AGENCY_STR_STR));
    strcpy(v_target_subscrip_trade_mark_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_SUBSCRIP_TRADE_MARK_STR_STR));
    strcpy(v_target_purchase_trade_mark_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_PURCHASE_TRADE_MARK_STR_STR));
    strcpy(v_target_rede_trade_mark_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_REDE_TRADE_MARK_STR_STR));
    strcpy(v_target_first_minimum_amt_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_FIRST_MINIMUM_AMT_STR_STR));
    strcpy(v_target_min_purchase_amt_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_MIN_PURCHASE_AMT_STR_STR));
    strcpy(v_target_min_subscrip_amt_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_MIN_SUBSCRIP_AMT_STR_STR));
    strcpy(v_target_min_rede_share_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_MIN_REDE_SHARE_STR_STR));
    strcpy(v_target_min_holding_share_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_MIN_HOLDING_SHARE_STR_STR));
    strcpy(v_target_min_turning_out_share_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_MIN_TURNING_OUT_SHARE_STR_STR));
    strcpy(v_target_fund_manager_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_FUND_MANAGER_STR_STR));
    strcpy(v_target_charging_method_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_CHARGING_METHOD_STR_STR));
    strcpy(v_target_registration_agency_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_REGISTRATION_AGENCY_STR_STR));
    strcpy(v_trade_acco, lpTSCall1Ans0->GetString(LDBIZ_TRADE_ACCO_STR));
    strcpy(v_sys_config_str, lpTSCall1Ans0->GetString(LDBIZ_SYS_CONFIG_STR_STR));
    strcpy(v_online_opor_no_str, lpTSCall1Ans0->GetString(LDBIZ_ONLINE_OPOR_NO_STR_STR));


    // set @业务控制配置串# = @交易组业务控制配置串#;
    strcpy(v_busi_config_str,v_exgp_busi_config_str);
    //判断组合是否失效
    //[事务_交易证券_账户_检查组合失效]
    //检查参数合法性

    // [检查报错返回][@指令开始日期# <> 0 and @指令开始日期# < @初始化日期#][601][@指令开始日期#,@初始化日期#]
    if (v_comm_begin_date != 0 && v_comm_begin_date < v_init_date)
    {
        strcpy(v_error_code, "tdsecuL.7.2.601");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","指令开始日期=",v_comm_begin_date,"初始化日期=",v_init_date);
        iRet = -1;
        goto END;
    }


    // [检查报错返回][@指令结束日期# <> 0 and @指令结束日期# < @初始化日期#][602][@指令结束日期#,@初始化日期#]
    if (v_comm_end_date != 0 && v_comm_end_date < v_init_date)
    {
        strcpy(v_error_code, "tdsecuL.7.2.602");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","指令结束日期=",v_comm_end_date,"初始化日期=",v_init_date);
        iRet = -1;
        goto END;
    }


    // [检查报错返回][(@指令开始日期# > 0 or @指令结束日期# > 0) and  @指令开始日期# > @指令结束日期#][621][@指令开始日期#,@指令结束日期#]
    if ((v_comm_begin_date > 0 || v_comm_end_date > 0) &&  v_comm_begin_date > v_comm_end_date)
    {
        strcpy(v_error_code, "tdsecuL.7.2.621");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","指令开始日期=",v_comm_begin_date,"指令结束日期=",v_comm_end_date);
        iRet = -1;
        goto END;
    }


    // [检查报错返回][(@指令开始日期# > 0 or @指令结束日期# > 0) and  @指令开始日期# = @指令结束日期# and @指令开始时间# > @指令结束时间#][622][@指令开始时间#,@指令结束时间#]
    if ((v_comm_begin_date > 0 || v_comm_end_date > 0) &&  v_comm_begin_date == v_comm_end_date && v_comm_begin_time > v_comm_end_time)
    {
        strcpy(v_error_code, "tdsecuL.7.2.622");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","指令开始时间=",v_comm_begin_time,"指令结束时间=",v_comm_end_time);
        iRet = -1;
        goto END;
    }

    //场外基金只能存在一批在途的指令
    //[事务_交易证券_指令_校验组合在途指令]

    // set @业务控制串# = "11111";
    strcpy(v_busi_ctrl_str,"11111");

    // set @订单方向串# = @指令方向串#;
    strcpy(v_order_dir_str,v_comm_dir_str);

    // set @订单数量串# = @指令数量串#;
    strcpy(v_order_qty_str,v_comm_qty_str);

    // set @订单价格串# = @指令实际限价串#;
    strcpy(v_order_price_str,v_limit_actual_price_str);
    //位1 交易组业务控制配置串，2交易组可用资金 3资产账户业务控制配置串 4资产账户可用资金 5通道编号外部账号

    // set @业务控制串# = "11111";
    strcpy(v_busi_ctrl_str,"11111");
    //调用过程[事务_产品_交易接口_检查指令产品账户批量信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.8.12", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_CRNCY_TYPE_STR_STR,v_crncy_type_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_DIR_STR_STR,v_comm_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_COMM_APPR_OPER_INT,v_co_comm_appr_oper);
    lpTSCall1Req1->SetString(LDBIZ_BUSI_CONFIG_STR_STR,v_busi_config_str);
    lpTSCall1Req1->SetString(LDBIZ_SYS_CONFIG_STR_STR,v_sys_config_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.8.12]subcall timed out!");
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
    v_sys_type = lpTSCall1Ans1->GetInt32(LDBIZ_SYS_TYPE_INT);
    strcpy(v_opor_no_str1, lpTSCall1Ans1->GetString(LDBIZ_OPOR_NO_STR1_STR));
    strcpy(v_opor_no_str2, lpTSCall1Ans1->GetString(LDBIZ_OPOR_NO_STR2_STR));
    strcpy(v_opor_no_str3, lpTSCall1Ans1->GetString(LDBIZ_OPOR_NO_STR3_STR));
    v_asset_acco_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);

    //检查股东和获取可用
    //调用过程[事务_产品证券_交易接口_检查账户状态获取批量可用]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.6.2", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_CODE_NO_STR_STR,v_stock_code_no_str);
    lpTSCall1Req2->SetString(LDBIZ_TRADE_CODE_NO_STR_STR,v_trade_code_no_str);
    lpTSCall1Req2->SetString(LDBIZ_TARGET_CODE_NO_STR_STR,v_target_code_no_str);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req2->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req2->SetString(LDBIZ_ORDER_QTY_STR_STR,v_order_qty_str);
    lpTSCall1Req2->SetString(LDBIZ_CRNCY_TYPE_STR_STR,v_crncy_type_str);
    lpTSCall1Req2->SetString(LDBIZ_REGISTRATION_AGENCY_STR_STR,v_registration_agency_str);
    lpTSCall1Req2->SetString(LDBIZ_SPLIT_STR_STR,v_split_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.6.2]subcall timed out!");
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
    strcpy(v_stock_acco_no_str, lpTSCall1Ans2->GetString(LDBIZ_STOCK_ACCO_NO_STR_STR));
    strcpy(v_stock_acco_str, lpTSCall1Ans2->GetString(LDBIZ_STOCK_ACCO_STR_STR));
    v_exgp_avail_amt = lpTSCall1Ans2->GetDouble(LDBIZ_EXGP_AVAIL_AMT_FLOAT);
    v_asac_avail_amt = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_AVAIL_AMT_FLOAT);
    v_asac_T_hk_buy_total_amt = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_T_HK_BUY_TOTAL_AMT_FLOAT);
    v_asac_T_hk_sell_total_amt = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_T_HK_SELL_TOTAL_AMT_FLOAT);
    v_asac_T1_hk_buy_total_amt = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_T1_HK_BUY_TOTAL_AMT_FLOAT);
    v_asac_T1_hk_sell_total_amt = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_T1_HK_SELL_TOTAL_AMT_FLOAT);
    v_exgp_T_hk_buy_total_amt = lpTSCall1Ans2->GetDouble(LDBIZ_EXGP_T_HK_BUY_TOTAL_AMT_FLOAT);
    v_exgp_T_hk_sell_total_amt = lpTSCall1Ans2->GetDouble(LDBIZ_EXGP_T_HK_SELL_TOTAL_AMT_FLOAT);
    v_exgp_T1_hk_buy_total_amt = lpTSCall1Ans2->GetDouble(LDBIZ_EXGP_T1_HK_BUY_TOTAL_AMT_FLOAT);
    v_exgp_T1_hk_sell_total_amt = lpTSCall1Ans2->GetDouble(LDBIZ_EXGP_T1_HK_SELL_TOTAL_AMT_FLOAT);
    strcpy(v_exgp_avail_qty_str, lpTSCall1Ans2->GetString(LDBIZ_EXGP_AVAIL_QTY_STR_STR));
    strcpy(v_exgp_target_code_avail_qty_str, lpTSCall1Ans2->GetString(LDBIZ_EXGP_TARGET_CODE_AVAIL_QTY_STR_STR));
    strcpy(v_exgp_trade_code_avail_qty_str, lpTSCall1Ans2->GetString(LDBIZ_EXGP_TRADE_CODE_AVAIL_QTY_STR_STR));
    strcpy(v_asac_avail_qty_str, lpTSCall1Ans2->GetString(LDBIZ_ASAC_AVAIL_QTY_STR_STR));
    strcpy(v_asac_target_code_avail_qty_str, lpTSCall1Ans2->GetString(LDBIZ_ASAC_TARGET_CODE_AVAIL_QTY_STR_STR));
    strcpy(v_asac_trade_code_avail_qty_str, lpTSCall1Ans2->GetString(LDBIZ_ASAC_TRADE_CODE_AVAIL_QTY_STR_STR));
    v_record_count = lpTSCall1Ans2->GetInt32(LDBIZ_RECORD_COUNT_INT);

    //下指令时先计算好全部费用，以便后续审批和直接下单使用
    //根据不同订单方向，检查并计算相关费用，有关业务检查在前面已经检查过了，可用在后面检查
    //调用过程[事务_公共_公共接口_计算批量订单费用]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.24.208", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req3->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req3->SetString(LDBIZ_STOCK_CODE_NO_STR_STR,v_stock_code_no_str);
    lpTSCall1Req3->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req3->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req3->SetString(LDBIZ_ORDER_QTY_STR_STR,v_order_qty_str);
    lpTSCall1Req3->SetString(LDBIZ_ORDER_PRICE_STR_STR,v_order_price_str);
    lpTSCall1Req3->SetString(LDBIZ_NET_PRICE_FLAG_STR_STR,v_net_price_flag_str);
    lpTSCall1Req3->SetString(LDBIZ_BOND_RATE_TYPE_STR_STR,v_bond_rate_type_str);
    lpTSCall1Req3->SetString(LDBIZ_BOND_ACCR_INTRST_STR_STR,v_bond_accr_intrst_str);
    lpTSCall1Req3->SetString(LDBIZ_PAR_VALUE_STR_STR,v_par_value_str);
    lpTSCall1Req3->SetString(LDBIZ_SPLIT_STR_STR,v_split_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.208]subcall timed out!");
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
    strcpy(v_all_fee_str, lpTSCall1Ans3->GetString(LDBIZ_ALL_FEE_STR_STR));

    //如果指令自动审批，需检查自动审批操作员的权限是否

    // if @指令审批设置# = 《指令审批设置-自动审批》 then
    if (v_comm_appr_set == 1)
    {

        // [检查报错返回][@指令审批操作员#=0][66][@指令审批操作员#]
        if (v_comm_appr_oper==0)
        {
            strcpy(v_error_code, "tdsecuL.7.2.66");
            snprintf(v_error_info, sizeof(v_error_info), "%s%d","指令审批操作员=",v_comm_appr_oper);
            iRet = -1;
            goto END;
        }


        // set @临时_操作员编号#=@操作员编号#;
        v_tmp_opor_no=v_opor_no;

        // set @操作员编号#=@指令审批操作员#;
        v_opor_no=v_comm_appr_oper;
        //调用过程[事务_公共_交易接口_检查操作员身份批量权限]
        //组织事务请求
        if(lpTSCall1Ans4)
        {
          lpTSCall1Ans4->FreeMsg();
          lpTSCall1Ans4=NULL;
        }
        lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pubT.25.155", 0);
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
        lpTSCall1Req4->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
        lpTSCall1Req4->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
        lpTSCall1Req4->SetString(LDBIZ_SPLIT_STR_STR,v_split_str);
        lpTSCall1Req4->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
        glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
        if(!lpTSCall1Ans4)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.155]subcall timed out!");
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

       //PB系统自动审批获取审批操作员登录信息，审批操作员不在线状态下不能自动审批

       // if @系统类型# = 《系统类型-PB系统》 then
       if (v_sys_type == 1)
       {
            //调用过程[事务_公共_交易接口_获取操作员登录信息]
            //组织事务请求
            if(lpTSCall1Ans5)
            {
              lpTSCall1Ans5->FreeMsg();
              lpTSCall1Ans5=NULL;
            }
            lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pubT.25.233", 0);
            lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
            if(!lpTSCall1Ans5)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.233]subcall timed out!");
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
            strcpy(v_last_login_ip, lpTSCall1Ans5->GetString(LDBIZ_LAST_LOGIN_IP_STR));
            strcpy(v_last_login_mac, lpTSCall1Ans5->GetString(LDBIZ_LAST_LOGIN_MAC_STR));
            v_last_login_date = lpTSCall1Ans5->GetInt32(LDBIZ_LAST_LOGIN_DATE_INT);
            strcpy(v_last_oper_info, lpTSCall1Ans5->GetString(LDBIZ_LAST_OPER_INFO_STR));
            v_online_status = lpTSCall1Ans5->GetInt32(LDBIZ_ONLINE_STATUS_INT);


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


        // set @操作员编号#=@临时_操作员编号#;
        v_opor_no=v_tmp_opor_no;
        //如果需要自动下单，需要校验指令执行人的权限

        // if @审批通过自动下单# = 《审批通过自动下单-是》 and  @系统类型# <> 《系统类型-PB系统》  then
        if (v_appr_allow_order_flag == 1 &&  v_sys_type != 1 )
        {

            // [检查报错返回][@指令执行人#=0][634][@指令执行人#]
            if (v_comm_executor==0)
            {
                strcpy(v_error_code, "tdsecuL.7.2.634");
                snprintf(v_error_info, sizeof(v_error_info), "%s%d","指令执行人=",v_comm_executor);
                iRet = -1;
                goto END;
            }


            // set @临时_操作员编号#=@操作员编号#;
            v_tmp_opor_no=v_opor_no;

            // set @操作员编号#=@指令执行人#;
            v_opor_no=v_comm_executor;
            //调用过程[事务_公共_交易接口_检查交易员身份批量权限]
            //组织事务请求
            if(lpTSCall1Ans6)
            {
              lpTSCall1Ans6->FreeMsg();
              lpTSCall1Ans6=NULL;
            }
            lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("pubT.25.152", 0);
            lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req6->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpTSCall1Req6->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
            lpTSCall1Req6->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
            lpTSCall1Req6->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
            lpTSCall1Req6->SetString(LDBIZ_SPLIT_STR_STR,v_split_str);
            lpTSCall1Req6->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
            glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
            if(!lpTSCall1Ans6)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.152]subcall timed out!");
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
            v_pd_no = lpTSCall1Ans6->GetInt32(LDBIZ_PD_NO_INT);


            // set @操作员编号#=@临时_操作员编号#;
            v_opor_no=v_tmp_opor_no;
        // end if;
        }

    // end if;
    }

    //交易证券子系统处理，新增证券指令

    // set @指令下达人# = @操作员编号#;
    v_comm_opor = v_opor_no;

    // set @指令审批操作员# = @机构指令审批操作员#;
    v_comm_appr_oper = v_co_comm_appr_oper;

    // set @净资产# = 0;
    v_nav_asset = 0;

    // set @已读标记# = 0;
    v_read_flag = 0;

    // set @账户拼接信息# = "";
    strcpy(v_acco_concat_info,"");
    //调用过程[事务_交易证券_指令_新增组合指令]
    //组织事务请求
    if(lpTSCall1Ans7)
    {
      lpTSCall1Ans7->FreeMsg();
      lpTSCall1Ans7=NULL;
    }
    lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("tdsecuT.3.9", 0);
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
    lpTSCall1Req7->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req7->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req7->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req7->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req7->SetString(LDBIZ_CRNCY_TYPE_STR_STR,v_crncy_type_str);
    lpTSCall1Req7->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR_STR,v_exch_crncy_type_str);
    lpTSCall1Req7->SetString(LDBIZ_BUY_REF_RATE_STR_STR,v_buy_ref_rate_str);
    lpTSCall1Req7->SetString(LDBIZ_SELL_REF_RATE_STR_STR,v_sell_ref_rate_str);
    lpTSCall1Req7->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req7->SetString(LDBIZ_STOCK_ACCO_NO_STR_STR,v_stock_acco_no_str);
    lpTSCall1Req7->SetString(LDBIZ_STOCK_ACCO_STR_STR,v_stock_acco_str);
    lpTSCall1Req7->SetString(LDBIZ_STOCK_CODE_NO_STR_STR,v_stock_code_no_str);
    lpTSCall1Req7->SetString(LDBIZ_STOCK_CODE_STR_STR,v_stock_code_str);
    lpTSCall1Req7->SetString(LDBIZ_TARGET_STOCK_CODE_STR_STR,v_target_stock_code_str);
    lpTSCall1Req7->SetString(LDBIZ_TARGET_STOCK_CODE_NO_STR_STR,v_target_stock_code_no_str);
    lpTSCall1Req7->SetString(LDBIZ_TARGET_CODE_NO_STR_STR,v_target_code_no_str);
    lpTSCall1Req7->SetString(LDBIZ_TRADE_CODE_NO_STR_STR,v_trade_code_no_str);
    lpTSCall1Req7->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req7->SetString(LDBIZ_ASSET_TYPE_STR_STR,v_asset_type_str);
    lpTSCall1Req7->SetDouble(LDBIZ_EXGP_AVAIL_AMT_FLOAT,v_exgp_avail_amt);
    lpTSCall1Req7->SetDouble(LDBIZ_EXGP_T_HK_BUY_TOTAL_AMT_FLOAT,v_exgp_T_hk_buy_total_amt);
    lpTSCall1Req7->SetDouble(LDBIZ_EXGP_T_HK_SELL_TOTAL_AMT_FLOAT,v_exgp_T_hk_sell_total_amt);
    lpTSCall1Req7->SetDouble(LDBIZ_EXGP_T1_HK_BUY_TOTAL_AMT_FLOAT,v_exgp_T1_hk_buy_total_amt);
    lpTSCall1Req7->SetDouble(LDBIZ_EXGP_T1_HK_SELL_TOTAL_AMT_FLOAT,v_exgp_T1_hk_sell_total_amt);
    lpTSCall1Req7->SetDouble(LDBIZ_ASAC_AVAIL_AMT_FLOAT,v_asac_avail_amt);
    lpTSCall1Req7->SetDouble(LDBIZ_ASAC_T_HK_BUY_TOTAL_AMT_FLOAT,v_asac_T_hk_buy_total_amt);
    lpTSCall1Req7->SetDouble(LDBIZ_ASAC_T_HK_SELL_TOTAL_AMT_FLOAT,v_asac_T_hk_sell_total_amt);
    lpTSCall1Req7->SetDouble(LDBIZ_ASAC_T1_HK_BUY_TOTAL_AMT_FLOAT,v_asac_T1_hk_buy_total_amt);
    lpTSCall1Req7->SetDouble(LDBIZ_ASAC_T1_HK_SELL_TOTAL_AMT_FLOAT,v_asac_T1_hk_sell_total_amt);
    lpTSCall1Req7->SetString(LDBIZ_EXGP_AVAIL_QTY_STR_STR,v_exgp_avail_qty_str);
    lpTSCall1Req7->SetString(LDBIZ_EXGP_TARGET_CODE_AVAIL_QTY_STR_STR,v_exgp_target_code_avail_qty_str);
    lpTSCall1Req7->SetString(LDBIZ_EXGP_TRADE_CODE_AVAIL_QTY_STR_STR,v_exgp_trade_code_avail_qty_str);
    lpTSCall1Req7->SetString(LDBIZ_ASAC_AVAIL_QTY_STR_STR,v_asac_avail_qty_str);
    lpTSCall1Req7->SetString(LDBIZ_ASAC_TARGET_CODE_AVAIL_QTY_STR_STR,v_asac_target_code_avail_qty_str);
    lpTSCall1Req7->SetString(LDBIZ_ASAC_TRADE_CODE_AVAIL_QTY_STR_STR,v_asac_trade_code_avail_qty_str);
    lpTSCall1Req7->SetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR,v_exgp_busi_config_str);
    lpTSCall1Req7->SetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR,v_asac_busi_config_str);
    lpTSCall1Req7->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpTSCall1Req7->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpTSCall1Req7->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req7->SetString(LDBIZ_COMM_DIR_STR_STR,v_comm_dir_str);
    lpTSCall1Req7->SetString(LDBIZ_LIMIT_PRICE_STR_STR,v_limit_price_str);
    lpTSCall1Req7->SetString(LDBIZ_LIMIT_ACTUAL_PRICE_STR_STR,v_limit_actual_price_str);
    lpTSCall1Req7->SetString(LDBIZ_COMM_QTY_STR_STR,v_comm_qty_str);
    lpTSCall1Req7->SetString(LDBIZ_COMM_AMT_STR_STR,v_comm_amt_str);
    lpTSCall1Req7->SetInt32(LDBIZ_COMM_BEGIN_DATE_INT,v_comm_begin_date);
    lpTSCall1Req7->SetInt32(LDBIZ_COMM_END_DATE_INT,v_comm_end_date);
    lpTSCall1Req7->SetInt32(LDBIZ_COMM_BEGIN_TIME_INT,v_comm_begin_time);
    lpTSCall1Req7->SetInt32(LDBIZ_COMM_END_TIME_INT,v_comm_end_time);
    lpTSCall1Req7->SetInt32(LDBIZ_COMM_APPR_OPER_INT,v_comm_appr_oper);
    lpTSCall1Req7->SetString(LDBIZ_ALL_FEE_STR_STR,v_all_fee_str);
    lpTSCall1Req7->SetString(LDBIZ_UP_LIMIT_PRICE_STR_STR,v_up_limit_price_str);
    lpTSCall1Req7->SetString(LDBIZ_DOWN_LIMIT_PRICE_STR_STR,v_down_limit_price_str);
    lpTSCall1Req7->SetString(LDBIZ_LAST_PRICE_STR_STR,v_last_price_str);
    lpTSCall1Req7->SetDouble(LDBIZ_NAV_ASSET_FLOAT,v_nav_asset);
    lpTSCall1Req7->SetString(LDBIZ_NET_PRICE_FLAG_STR_STR,v_net_price_flag_str);
    lpTSCall1Req7->SetString(LDBIZ_PAR_VALUE_STR_STR,v_par_value_str);
    lpTSCall1Req7->SetString(LDBIZ_IMPAWN_RATIO_STR_STR,v_impawn_ratio_str);
    lpTSCall1Req7->SetString(LDBIZ_INTRST_DAYS_STR_STR,v_intrst_days_str);
    lpTSCall1Req7->SetString(LDBIZ_BOND_ACCR_INTRST_STR_STR,v_bond_accr_intrst_str);
    lpTSCall1Req7->SetString(LDBIZ_BOND_RATE_TYPE_STR_STR,v_bond_rate_type_str);
    lpTSCall1Req7->SetString(LDBIZ_CAPIT_REBACK_DAYS_STR_STR,v_capit_reback_days_str);
    lpTSCall1Req7->SetString(LDBIZ_POSI_REBACK_DAYS_STR_STR,v_posi_reback_days_str);
    lpTSCall1Req7->SetInt64(LDBIZ_BASKET_ID_INT64,v_basket_id);
    lpTSCall1Req7->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
    lpTSCall1Req7->SetInt32(LDBIZ_EXTER_COMM_FLAG_INT,v_exter_comm_flag);
    lpTSCall1Req7->SetString(LDBIZ_SPLIT_STR_STR,v_split_str);
    lpTSCall1Req7->SetInt32(LDBIZ_COST_CALC_TYPE_INT,v_cost_calc_type);
    lpTSCall1Req7->SetDouble(LDBIZ_COMM_NO_LIMIT_PRICE_RATIO_FLOAT,v_comm_no_limit_price_ratio);
    lpTSCall1Req7->SetString(LDBIZ_PRE_CLOSE_PRICE_STR_STR,v_pre_close_price_str);
    lpTSCall1Req7->SetString(LDBIZ_SUBSCRIPTION_TRADE_MARK_STR_STR,v_subscription_trade_mark_str);
    lpTSCall1Req7->SetString(LDBIZ_TARGET_SUBSCRIP_TRADE_MARK_STR_STR,v_target_subscrip_trade_mark_str);
    lpTSCall1Req7->SetString(LDBIZ_PURCHASE_TRADE_MARK_STR_STR,v_purchase_trade_mark_str);
    lpTSCall1Req7->SetString(LDBIZ_TARGET_PURCHASE_TRADE_MARK_STR_STR,v_target_purchase_trade_mark_str);
    lpTSCall1Req7->SetString(LDBIZ_REDE_TRADE_MARK_STR_STR,v_rede_trade_mark_str);
    lpTSCall1Req7->SetString(LDBIZ_TARGET_REDE_TRADE_MARK_STR_STR,v_target_rede_trade_mark_str);
    lpTSCall1Req7->SetString(LDBIZ_FIRST_MINIMUM_AMT_STR_STR,v_first_minimum_amt_str);
    lpTSCall1Req7->SetString(LDBIZ_TARGET_FIRST_MINIMUM_AMT_STR_STR,v_target_first_minimum_amt_str);
    lpTSCall1Req7->SetString(LDBIZ_MINIMUM_PURCHASE_AMT_STR_STR,v_minimum_purchase_amt_str);
    lpTSCall1Req7->SetString(LDBIZ_TARGET_MIN_PURCHASE_AMT_STR_STR,v_target_min_purchase_amt_str);
    lpTSCall1Req7->SetString(LDBIZ_MINIMUM_SUBSCRIPTION_AMT_STR_STR,v_minimum_subscription_amt_str);
    lpTSCall1Req7->SetString(LDBIZ_TARGET_MIN_SUBSCRIP_AMT_STR_STR,v_target_min_subscrip_amt_str);
    lpTSCall1Req7->SetString(LDBIZ_MINIMUM_REDE_SHARE_STR_STR,v_minimum_rede_share_str);
    lpTSCall1Req7->SetString(LDBIZ_TARGET_MIN_REDE_SHARE_STR_STR,v_target_min_rede_share_str);
    lpTSCall1Req7->SetString(LDBIZ_MINIMUM_HOLDING_SHARE_STR_STR,v_minimum_holding_share_str);
    lpTSCall1Req7->SetString(LDBIZ_TARGET_MIN_HOLDING_SHARE_STR_STR,v_target_min_holding_share_str);
    lpTSCall1Req7->SetString(LDBIZ_CHARGING_METHOD_STR_STR,v_charging_method_str);
    lpTSCall1Req7->SetString(LDBIZ_TARGET_CHARGING_METHOD_STR_STR,v_target_charging_method_str);
    lpTSCall1Req7->SetString(LDBIZ_FUND_MANAGER_STR_STR,v_fund_manager_str);
    lpTSCall1Req7->SetString(LDBIZ_TARGET_FUND_MANAGER_STR_STR,v_target_fund_manager_str);
    lpTSCall1Req7->SetInt32(LDBIZ_RECORD_COUNT_INT,v_record_count);
    lpTSCall1Req7->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
    lpTSCall1Req7->SetDouble(LDBIZ_COMBO_COPIES_FLOAT,v_combo_copies);
    lpTSCall1Req7->SetString(LDBIZ_COMBO_POSI_ID_STR_STR,v_combo_posi_id_str);
    lpTSCall1Req7->SetString(LDBIZ_REGISTRATION_AGENCY_STR_STR,v_registration_agency_str);
    lpTSCall1Req7->SetString(LDBIZ_TRADE_ACCO_STR,v_trade_acco);
    lpTSCall1Req7->SetString(LDBIZ_LAST_LOGIN_IP_STR,v_last_login_ip);
    lpTSCall1Req7->SetString(LDBIZ_LAST_LOGIN_MAC_STR,v_last_login_mac);
    lpTSCall1Req7->SetInt32(LDBIZ_LAST_LOGIN_DATE_INT,v_last_login_date);
    lpTSCall1Req7->SetString(LDBIZ_LAST_OPER_INFO_STR,v_last_oper_info);
    lpTSCall1Req7->SetInt32(LDBIZ_ONLINE_STATUS_INT,v_online_status);
    lpTSCall1Req7->SetString(LDBIZ_SYS_CONFIG_STR_STR,v_sys_config_str);
    lpTSCall1Req7->SetInt32(LDBIZ_ASSET_ACCO_TYPE_INT,v_asset_acco_type);
    lpTSCall1Req7->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
    lpTSCall1Req7->SetString(LDBIZ_ONLINE_OPOR_NO_STR_STR,v_online_opor_no_str);
    lpTSCall1Req7->SetString(LDBIZ_ACCO_CONCAT_INFO_STR,v_acco_concat_info);
    glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
    if(!lpTSCall1Ans7)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.3.9]subcall timed out!");
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
    v_comm_date = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_DATE_INT);
    strcpy(v_comm_id_str, lpTSCall1Ans7->GetString(LDBIZ_COMM_ID_STR_STR));
    strcpy(v_comm_appr_status_str, lpTSCall1Ans7->GetString(LDBIZ_COMM_APPR_STATUS_STR_STR));
    strcpy(v_order_id_str, lpTSCall1Ans7->GetString(LDBIZ_ORDER_ID_STR_STR));

    //指令主推
    //调用过程[事务_交易证券_主推接口_获取批量指令信息]
    //组织事务请求
    if(lpTSCall1Ans8)
    {
      lpTSCall1Ans8->FreeMsg();
      lpTSCall1Ans8=NULL;
    }
    lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.26", 0);
    lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req8->SetString(LDBIZ_COMM_ID_STR_STR,v_comm_id_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
    if(!lpTSCall1Ans8)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.26]subcall timed out!");
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


    // [获取结果集][lpMainMsg]
    lpMainMsg=lpTSCall1Ans8->GetGroup(LDTAG_NO_RESULTSET);


    // [遍历结果集开始][lpMainMsg]
    iRecordCount = lpMainMsg->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpMainMsg->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            v_comm_id = lpRecord->GetInt64(LDBIZ_COMM_ID_INT64);
            v_init_date = lpRecord->GetInt32(LDBIZ_INIT_DATE_INT);
            v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
            v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
            v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            v_pass_no = lpRecord->GetInt32(LDBIZ_PASS_NO_INT);
            strcpy(v_out_acco, lpRecord->GetString(LDBIZ_OUT_ACCO_STR));
            strcpy(v_exch_crncy_type, lpRecord->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
            v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
            v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
            v_stock_type = lpRecord->GetInt32(LDBIZ_STOCK_TYPE_INT);
            v_comm_time = lpRecord->GetInt32(LDBIZ_COMM_TIME_INT);
            v_comm_opor = lpRecord->GetInt32(LDBIZ_COMM_OPOR_INT);
            v_comm_dir = lpRecord->GetInt32(LDBIZ_COMM_DIR_INT);
            v_comm_limit_price = lpRecord->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
            v_limit_actual_price = lpRecord->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
            v_comm_qty = lpRecord->GetDouble(LDBIZ_COMM_QTY_FLOAT);
            v_comm_amt = lpRecord->GetDouble(LDBIZ_COMM_AMT_FLOAT);
            v_order_qty = lpRecord->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
            v_comm_cancel_qty = lpRecord->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
            v_strike_amt = lpRecord->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
            v_strike_qty = lpRecord->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
            v_comm_frozen_amt = lpRecord->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
            v_comm_frozen_qty = lpRecord->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
            strcpy(v_strike_status, lpRecord->GetString(LDBIZ_STRIKE_STATUS_STR));
            strcpy(v_comm_status, lpRecord->GetString(LDBIZ_COMM_STATUS_STR));
            v_comm_begin_date = lpRecord->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
            v_comm_end_date = lpRecord->GetInt32(LDBIZ_COMM_END_DATE_INT);
            v_comm_begin_time = lpRecord->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
            v_comm_end_time = lpRecord->GetInt32(LDBIZ_COMM_END_TIME_INT);
            v_comm_comple_date = lpRecord->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
            v_comm_comple_time = lpRecord->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
            v_comm_appr_date = lpRecord->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
            v_comm_appr_time = lpRecord->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
            strcpy(v_comm_appr_status, lpRecord->GetString(LDBIZ_COMM_APPR_STATUS_STR));
            v_comm_appr_oper = lpRecord->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
            strcpy(v_comm_appr_remark, lpRecord->GetString(LDBIZ_COMM_APPR_REMARK_STR));
            v_basket_id = lpRecord->GetInt64(LDBIZ_BASKET_ID_INT64);
            v_net_price_flag = lpRecord->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
            v_bond_accr_intrst = lpRecord->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
            v_bond_rate_type = lpRecord->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
            strcpy(v_comm_oper_way, lpRecord->GetString(LDBIZ_COMM_OPER_WAY_STR));
            v_exter_comm_flag = lpRecord->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
            v_comm_comple_flag = lpRecord->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
            v_strategy_capt_qty = lpRecord->GetDouble(LDBIZ_STRATEGY_CAPT_QTY_FLOAT);
            v_strategy_order_qty = lpRecord->GetDouble(LDBIZ_STRATEGY_ORDER_QTY_FLOAT);
            strcpy(v_contra_no, lpRecord->GetString(LDBIZ_CONTRA_NO_STR));
            strcpy(v_comm_remark_info, lpRecord->GetString(LDBIZ_COMM_REMARK_INFO_STR));
            v_disp_opor = lpRecord->GetInt32(LDBIZ_DISP_OPOR_INT);
            v_disp_status = lpRecord->GetInt32(LDBIZ_DISP_STATUS_INT);
            strcpy(v_combo_code, lpRecord->GetString(LDBIZ_COMBO_CODE_STR));
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


        // [主动推送][secu.comm][证券主推_指令_指令主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.40", 0);
        lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
        lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpPubMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
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
        lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT,v_comm_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT,v_comm_frozen_qty);
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
        lpPubMsg->SetInt64(LDBIZ_BASKET_ID_INT64,v_basket_id);
        lpPubMsg->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
        lpPubMsg->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
        lpPubMsg->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
        lpPubMsg->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
        lpPubMsg->SetInt32(LDBIZ_EXTER_COMM_FLAG_INT,v_exter_comm_flag);
        lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_FLAG_INT,v_comm_comple_flag);
        lpPubMsg->SetDouble(LDBIZ_STRATEGY_CAPT_QTY_FLOAT,v_strategy_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_STRATEGY_ORDER_QTY_FLOAT,v_strategy_order_qty);
        lpPubMsg->SetString(LDBIZ_CONTRA_NO_STR,v_contra_no);
        lpPubMsg->SetString(LDBIZ_COMM_REMARK_INFO_STR,v_comm_remark_info);
        lpPubMsg->SetInt32(LDBIZ_DISP_OPOR_INT,v_disp_opor);
        lpPubMsg->SetInt32(LDBIZ_DISP_STATUS_INT,v_disp_status);
        lpPubMsg->SetInt32(LDBIZ_READ_FLAG_INT,v_read_flag);
        lpPubMsg->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("secu.comm", lpPubMsg);


    // [遍历结果集结束][lpMainMsg]
        }
    }

    //指令汇总主推

    // if @指令批号# > 0 then
    if (v_comm_batch_no > 0)
    {
        //调用过程[事务_交易证券_主推接口_获取汇总指令信息]
        //组织事务请求
        if(lpTSCall1Ans9)
        {
          lpTSCall1Ans9->FreeMsg();
          lpTSCall1Ans9=NULL;
        }
        lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.2", 0);
        lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req9->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
        lpTSCall1Req9->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req9->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpTSCall1Req9->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
        glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
        if(!lpTSCall1Ans9)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.2]subcall timed out!");
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
        v_sum_comm_row_id = lpTSCall1Ans9->GetInt64(LDBIZ_SUM_COMM_ROW_ID_INT64);
        v_sum_comm_co_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_CO_NO_INT);
        v_sum_comm_pd_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_PD_NO_INT);
        v_sum_comm_exch_group_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_EXCH_GROUP_NO_INT);
        v_sum_comm_asset_acco_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_ASSET_ACCO_NO_INT);
        v_sum_comm_pass_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_PASS_NO_INT);
        strcpy(v_sum_comm_out_acco, lpTSCall1Ans9->GetString(LDBIZ_SUM_COMM_OUT_ACCO_STR));
        strcpy(v_sum_comm_exch_crncy_type, lpTSCall1Ans9->GetString(LDBIZ_SUM_COMM_EXCH_CRNCY_TYPE_STR));
        v_sum_comm_stock_code_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_STOCK_CODE_NO_INT);
        v_sum_comm_date = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_DATE_INT);
        v_sum_comm_time = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_TIME_INT);
        v_sum_comm_batch_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_BATCH_NO_INT);
        v_sum_comm_opor = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_OPOR_INT);
        v_sum_comm_executor = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_EXECUTOR_INT);
        v_sum_comm_dir = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_DIR_INT);
        v_sum_comm_limit_price = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_COMM_LIMIT_PRICE_FLOAT);
        v_sum_comm_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_COMM_QTY_FLOAT);
        v_sum_comm_amt = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_COMM_AMT_FLOAT);
        v_sum_comm_order_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_COMM_ORDER_QTY_FLOAT);
        v_sum_comm_cancel_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_COMM_CANCEL_QTY_FLOAT);
        v_sum_comm_await_cancel_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_COMM_AWAIT_CANCEL_QTY_FLOAT);
        v_sum_comm_strike_amt = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_COMM_STRIKE_AMT_FLOAT);
        v_sum_comm_strike_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_COMM_STRIKE_QTY_FLOAT);
        strcpy(v_sum_comm_strike_status, lpTSCall1Ans9->GetString(LDBIZ_SUM_COMM_STRIKE_STATUS_STR));
        strcpy(v_comm_sum_status, lpTSCall1Ans9->GetString(LDBIZ_COMM_SUM_STATUS_STR));
        v_sum_comm_begin_date = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_BEGIN_DATE_INT);
        v_sum_comm_end_date = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_END_DATE_INT);
        v_sum_comm_begin_time = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_BEGIN_TIME_INT);
        v_sum_comm_end_time = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_END_TIME_INT);
        v_sum_comm_comple_date = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_COMPLE_DATE_INT);
        v_sum_comm_comple_time = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_COMPLE_TIME_INT);
        v_sum_comm_max_comm_comple_date = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_DATE_INT);
        v_sum_comm_max_comm_comple_time = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_TIME_INT);
        v_sum_comm_appr_date = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_APPR_DATE_INT);
        v_sum_comm_appr_time = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_APPR_TIME_INT);
        v_sum_comm_appr_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_COMM_APPR_QTY_FLOAT);
        strcpy(v_comm_sum_approve_status, lpTSCall1Ans9->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
        v_sum_comm_basket_id = lpTSCall1Ans9->GetInt64(LDBIZ_SUM_COMM_BASKET_ID_INT64);
        v_sum_comm_net_price_flag = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_NET_PRICE_FLAG_INT);
        v_sum_comm_bond_accr_intrst = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_COMM_BOND_ACCR_INTRST_FLOAT);
        v_sum_comm_bond_rate_type = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_BOND_RATE_TYPE_INT);
        strcpy(v_sum_comm_oper_way, lpTSCall1Ans9->GetString(LDBIZ_SUM_COMM_OPER_WAY_STR));
        v_sum_comm_exter_comm_flag = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_EXTER_COMM_FLAG_INT);
        v_sum_buy_order_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_BUY_ORDER_QTY_FLOAT);
        v_sum_sell_order_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_SELL_ORDER_QTY_FLOAT);
        v_sum_buy_comm_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_BUY_COMM_QTY_FLOAT);
        v_sum_sell_comm_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_SELL_COMM_QTY_FLOAT);
        v_sum_buy_strike_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_BUY_STRIKE_QTY_FLOAT);
        v_sum_sell_strike_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_SELL_STRIKE_QTY_FLOAT);
        v_sum_buy_strike_amt = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_BUY_STRIKE_AMT_FLOAT);
        v_sum_sell_strike_amt = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_SELL_STRIKE_AMT_FLOAT);
        v_sum_buy_comm_amt = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_BUY_COMM_AMT_FLOAT);
        v_sum_sell_comm_amt = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_SELL_COMM_AMT_FLOAT);
        strcpy(v_comm_remark_info, lpTSCall1Ans9->GetString(LDBIZ_COMM_REMARK_INFO_STR));
        v_sum_comm_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_COMM_UPDATE_TIMES_INT);
        strcpy(v_acco_concat_info, lpTSCall1Ans9->GetString(LDBIZ_ACCO_CONCAT_INFO_STR));


        // [主动推送][secu.commtotal][证券主推_指令_指令汇总主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.41", 0);
        lpPubMsg->SetInt64(LDBIZ_SUM_COMM_ROW_ID_INT64,v_sum_comm_row_id);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_CO_NO_INT,v_sum_comm_co_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_PD_NO_INT,v_sum_comm_pd_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_EXCH_GROUP_NO_INT,v_sum_comm_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_ASSET_ACCO_NO_INT,v_sum_comm_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_PASS_NO_INT,v_sum_comm_pass_no);
        lpPubMsg->SetString(LDBIZ_SUM_COMM_OUT_ACCO_STR,v_sum_comm_out_acco);
        lpPubMsg->SetString(LDBIZ_SUM_COMM_EXCH_CRNCY_TYPE_STR,v_sum_comm_exch_crncy_type);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_STOCK_CODE_NO_INT,v_sum_comm_stock_code_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_DATE_INT,v_sum_comm_date);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_TIME_INT,v_sum_comm_time);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BATCH_NO_INT,v_sum_comm_batch_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_OPOR_INT,v_sum_comm_opor);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_EXECUTOR_INT,v_sum_comm_executor);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_DIR_INT,v_sum_comm_dir);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_LIMIT_PRICE_FLOAT,v_sum_comm_limit_price);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_QTY_FLOAT,v_sum_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_AMT_FLOAT,v_sum_comm_amt);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_ORDER_QTY_FLOAT,v_sum_comm_order_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_CANCEL_QTY_FLOAT,v_sum_comm_cancel_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_AWAIT_CANCEL_QTY_FLOAT,v_sum_comm_await_cancel_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_STRIKE_AMT_FLOAT,v_sum_comm_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_STRIKE_QTY_FLOAT,v_sum_comm_strike_qty);
        lpPubMsg->SetString(LDBIZ_SUM_COMM_STRIKE_STATUS_STR,v_sum_comm_strike_status);
        lpPubMsg->SetString(LDBIZ_COMM_SUM_STATUS_STR,v_comm_sum_status);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BEGIN_DATE_INT,v_sum_comm_begin_date);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_END_DATE_INT,v_sum_comm_end_date);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BEGIN_TIME_INT,v_sum_comm_begin_time);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_END_TIME_INT,v_sum_comm_end_time);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_COMPLE_DATE_INT,v_sum_comm_comple_date);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_COMPLE_TIME_INT,v_sum_comm_comple_time);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_DATE_INT,v_sum_comm_max_comm_comple_date);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_TIME_INT,v_sum_comm_max_comm_comple_time);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_APPR_DATE_INT,v_sum_comm_appr_date);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_APPR_TIME_INT,v_sum_comm_appr_time);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_APPR_QTY_FLOAT,v_sum_comm_appr_qty);
        lpPubMsg->SetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR,v_comm_sum_approve_status);
        lpPubMsg->SetInt64(LDBIZ_SUM_COMM_BASKET_ID_INT64,v_sum_comm_basket_id);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_NET_PRICE_FLAG_INT,v_sum_comm_net_price_flag);
        lpPubMsg->SetDouble(LDBIZ_SUM_COMM_BOND_ACCR_INTRST_FLOAT,v_sum_comm_bond_accr_intrst);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BOND_RATE_TYPE_INT,v_sum_comm_bond_rate_type);
        lpPubMsg->SetString(LDBIZ_SUM_COMM_OPER_WAY_STR,v_sum_comm_oper_way);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_EXTER_COMM_FLAG_INT,v_sum_comm_exter_comm_flag);
        lpPubMsg->SetDouble(LDBIZ_SUM_BUY_ORDER_QTY_FLOAT,v_sum_buy_order_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_SELL_ORDER_QTY_FLOAT,v_sum_sell_order_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_BUY_COMM_QTY_FLOAT,v_sum_buy_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_SELL_COMM_QTY_FLOAT,v_sum_sell_comm_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_BUY_STRIKE_QTY_FLOAT,v_sum_buy_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_SELL_STRIKE_QTY_FLOAT,v_sum_sell_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_BUY_STRIKE_AMT_FLOAT,v_sum_buy_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_SUM_SELL_STRIKE_AMT_FLOAT,v_sum_sell_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_SUM_BUY_COMM_AMT_FLOAT,v_sum_buy_comm_amt);
        lpPubMsg->SetDouble(LDBIZ_SUM_SELL_COMM_AMT_FLOAT,v_sum_sell_comm_amt);
        lpPubMsg->SetString(LDBIZ_COMM_REMARK_INFO_STR,v_comm_remark_info);
        lpPubMsg->SetInt32(LDBIZ_READ_FLAG_INT,v_read_flag);
        lpPubMsg->SetString(LDBIZ_ACCO_CONCAT_INFO_STR,v_acco_concat_info);
        lpPubMsg->SetInt32(LDBIZ_SUM_COMM_UPDATE_TIMES_INT,v_sum_comm_update_times);
        glpPubSub_Interface->PubTopics("secu.commtotal", lpPubMsg);

    // end if;
    }

    //订单主推
    //调用过程[事务_交易证券_主推接口_获取批量订单信息]
    //组织事务请求
    if(lpTSCall1Ans10)
    {
      lpTSCall1Ans10->FreeMsg();
      lpTSCall1Ans10=NULL;
    }
    lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.25", 0);
    lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req10->SetString(LDBIZ_ORDER_ID_STR_STR,v_order_id_str);
    lpTSCall1Req10->SetString(LDBIZ_SPLIT_STR_STR,v_split_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
    if(!lpTSCall1Ans10)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.25]subcall timed out!");
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


    // [获取结果集][lpMainMsg2]
    lpMainMsg2=lpTSCall1Ans10->GetGroup(LDTAG_NO_RESULTSET);


    // [遍历结果集开始][lpMainMsg2]
    iRecordCount = lpMainMsg2->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpMainMsg2->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            v_order_id = lpRecord->GetInt64(LDBIZ_ORDER_ID_INT64);
            v_busi_opor_no = lpRecord->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
            v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
            v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
            v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
            v_stock_type = lpRecord->GetInt32(LDBIZ_STOCK_TYPE_INT);
            v_pass_no = lpRecord->GetInt32(LDBIZ_PASS_NO_INT);
            v_external_no = lpRecord->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
            strcpy(v_out_acco, lpRecord->GetString(LDBIZ_OUT_ACCO_STR));
            strcpy(v_exch_crncy_type, lpRecord->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
            v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
            strcpy(v_stock_code, lpRecord->GetString(LDBIZ_STOCK_CODE_STR));
            strcpy(v_stock_acco, lpRecord->GetString(LDBIZ_STOCK_ACCO_STR));
            v_comm_id = lpRecord->GetInt64(LDBIZ_COMM_ID_INT64);
            v_comm_batch_no = lpRecord->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
            v_order_batch_no = lpRecord->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
            v_order_dir = lpRecord->GetInt32(LDBIZ_ORDER_DIR_INT);
            v_order_qty = lpRecord->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
            v_order_price = lpRecord->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
            v_order_time = lpRecord->GetInt32(LDBIZ_ORDER_TIME_INT);
            v_wtdraw_qty = lpRecord->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
            v_report_date = lpRecord->GetInt32(LDBIZ_REPORT_DATE_INT);
            v_report_time = lpRecord->GetInt32(LDBIZ_REPORT_TIME_INT);
            strcpy(v_report_no, lpRecord->GetString(LDBIZ_REPORT_NO_STR));
            v_par_value = lpRecord->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
            v_impawn_ratio = lpRecord->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
            strcpy(v_rsp_info, lpRecord->GetString(LDBIZ_RSP_INFO_STR));
            v_strike_amt = lpRecord->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
            v_strike_qty = lpRecord->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
            v_strike_bond_accr_intrst = lpRecord->GetDouble(LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
            v_price_type = lpRecord->GetInt32(LDBIZ_PRICE_TYPE_INT);
            strcpy(v_order_oper_way, lpRecord->GetString(LDBIZ_ORDER_OPER_WAY_STR));
            strcpy(v_order_status, lpRecord->GetString(LDBIZ_ORDER_STATUS_STR));
            v_order_frozen_amt = lpRecord->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
            v_order_frozen_qty = lpRecord->GetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT);
            v_net_price_flag = lpRecord->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
            v_bond_accr_intrst = lpRecord->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
            v_bond_rate_type = lpRecord->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);
            v_order_date = lpRecord->GetInt32(LDBIZ_ORDER_DATE_INT);
            strcpy(v_combo_code, lpRecord->GetString(LDBIZ_COMBO_CODE_STR));
            v_combo_posi_id = lpRecord->GetInt64(LDBIZ_COMBO_POSI_ID_INT64);
            v_strategy_id = lpRecord->GetInt64(LDBIZ_STRATEGY_ID_INT64);
            strcpy(v_registration_agency, lpRecord->GetString(LDBIZ_REGISTRATION_AGENCY_STR));
            strcpy(v_trade_acco, lpRecord->GetString(LDBIZ_TRADE_ACCO_STR));
            strcpy(v_contra_no, lpRecord->GetString(LDBIZ_CONTRA_NO_STR));
            v_asset_acco_type = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);


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

      // set @撤单状态# = "0";
      strcpy(v_wtdraw_status,"0");

      // [主动推送][secu.order][证券主推_订单_订单主推消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.20", 0);
      lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
      lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
      lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
      lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
      lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
      lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
      lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      lpPubMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
      lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
      lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
      lpPubMsg->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
      lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
      lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
      lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
      lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
      lpPubMsg->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
      lpPubMsg->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
      lpPubMsg->SetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT,v_order_frozen_amt);
      lpPubMsg->SetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT,v_order_frozen_qty);
      lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
      lpPubMsg->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
      lpPubMsg->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
      lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
      lpPubMsg->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
      lpPubMsg->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
      lpPubMsg->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
      lpPubMsg->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
      lpPubMsg->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
      lpPubMsg->SetString(LDBIZ_RSP_INFO_STR,v_rsp_info);
      lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
      lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
      lpPubMsg->SetDouble(LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT,v_strike_bond_accr_intrst);
      lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
      lpPubMsg->SetDouble(LDBIZ_CURR_STRIKE_QTY_FLOAT,v_curr_strike_qty);
      lpPubMsg->SetDouble(LDBIZ_CURR_STRIKE_AMT_FLOAT,v_curr_strike_amt);
      lpPubMsg->SetDouble(LDBIZ_CURR_STRIKE_PRICE_FLOAT,v_curr_strike_price);
      lpPubMsg->SetInt64(LDBIZ_STRIKE_ID_INT64,v_strike_id);
      lpPubMsg->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
      lpPubMsg->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
      lpPubMsg->SetInt64(LDBIZ_COMBO_POSI_ID_INT64,v_combo_posi_id);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_TYPE_INT,v_asset_acco_type);
      lpPubMsg->SetString(LDBIZ_CONTRA_NO_STR,v_contra_no);
      lpPubMsg->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
      lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
      glpPubSub_Interface->PubTopics("secu.order", lpPubMsg);


      // [主动推送][secu.ztrptorder][证券主推_报盘_中泰订单主推报盘消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.926", 0);
      lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
      lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
      lpPubMsg->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
      lpPubMsg->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
      lpPubMsg->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
      lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
      lpPubMsg->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
      lpPubMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
      lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
      lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
      lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
      lpPubMsg->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
      lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
      lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
      lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
      lpPubMsg->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
      lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
      lpPubMsg->SetString(LDBIZ_TRADE_ACCO_STR,v_trade_acco);
      lpPubMsg->SetString(LDBIZ_REGISTRATION_AGENCY_STR,v_registration_agency);
      lpPubMsg->SetString(LDBIZ_LONG_TOKEN_STR,v_long_token);
      lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
      glpPubSub_Interface->PubTopics("secu.ztrptorder", lpPubMsg);


      // if  @订单批号# > 0 then
      if ( v_order_batch_no > 0)
      {

        // set @成交序号# = 0;
        v_strike_id = 0;
        //调用过程[事务_交易证券_主推接口_获取汇总订单成交信息]
        //组织事务请求
        if(lpTSCall1Ans11)
        {
          lpTSCall1Ans11->FreeMsg();
          lpTSCall1Ans11=NULL;
        }
        lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.21", 0);
        lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req11->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req11->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpTSCall1Req11->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
        lpTSCall1Req11->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
        lpTSCall1Req11->SetInt64(LDBIZ_STRIKE_ID_INT64,v_strike_id);
        glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
        if(!lpTSCall1Ans11)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.21]subcall timed out!");
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
        v_sum_order_row_id = lpTSCall1Ans11->GetInt64(LDBIZ_SUM_ORDER_ROW_ID_INT64);
        v_sum_order_opor_no = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_ORDER_OPOR_NO_INT);
        v_sum_order_co_no = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_ORDER_CO_NO_INT);
        v_sum_order_pd_no = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_ORDER_PD_NO_INT);
        v_sum_order_exch_group_no = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_ORDER_EXCH_GROUP_NO_INT);
        v_sum_order_asset_acco_no = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_ORDER_ASSET_ACCO_NO_INT);
        v_sum_order_pass_no = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_ORDER_PASS_NO_INT);
        strcpy(v_sum_order_exch_crncy_type, lpTSCall1Ans11->GetString(LDBIZ_SUM_ORDER_EXCH_CRNCY_TYPE_STR));
        v_sum_order_stock_code_no = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_ORDER_STOCK_CODE_NO_INT);
        v_sum_order_trade_code_no = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_ORDER_TRADE_CODE_NO_INT);
        v_sum_order_target_code_no = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_ORDER_TARGET_CODE_NO_INT);
        v_sum_order_external_no = lpTSCall1Ans11->GetInt64(LDBIZ_SUM_ORDER_EXTERNAL_NO_INT64);
        v_sum_order_date = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_ORDER_DATE_INT);
        v_sum_order_batch_no = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_ORDER_BATCH_NO_INT);
        v_sum_order_dir = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_ORDER_DIR_INT);
        v_sum_order_price_type = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_ORDER_PRICE_TYPE_INT);
        v_sum_order_price = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_ORDER_PRICE_FLOAT);
        v_sum_order_qty = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_ORDER_QTY_FLOAT);
        strcpy(v_order_sum_status, lpTSCall1Ans11->GetString(LDBIZ_ORDER_SUM_STATUS_STR));
        v_sum_order_wtdraw_qty = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_ORDER_WTDRAW_QTY_FLOAT);
        v_sum_order_waste_qty = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_ORDER_WASTE_QTY_FLOAT);
        v_sum_order_strike_amt = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_ORDER_STRIKE_AMT_FLOAT);
        v_sum_order_strike_qty = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_ORDER_STRIKE_QTY_FLOAT);
        v_sum_order_strike_aver_price = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_ORDER_STRIKE_AVER_PRICE_FLOAT);
        v_sum_order_net_price_flag = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_ORDER_NET_PRICE_FLAG_INT);
        v_sum_order_bond_accr_intrst = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_ORDER_BOND_ACCR_INTRST_FLOAT);
        v_sum_order_bond_rate_type = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_ORDER_BOND_RATE_TYPE_INT);
        v_sum_order_par_value = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_ORDER_PAR_VALUE_FLOAT);
        v_sum_order_impawn_ratio = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_ORDER_IMPAWN_RATIO_FLOAT);
        strcpy(v_sum_order_oper_way, lpTSCall1Ans11->GetString(LDBIZ_SUM_ORDER_OPER_WAY_STR));
        v_sum_order_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_ORDER_UPDATE_TIMES_INT);
        v_sum_strike_row_id = lpTSCall1Ans11->GetInt64(LDBIZ_SUM_STRIKE_ROW_ID_INT64);
        v_sum_strike_opor_no = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_STRIKE_OPOR_NO_INT);
        v_sum_strike_co_no = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_STRIKE_CO_NO_INT);
        v_sum_strike_pd_no = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_STRIKE_PD_NO_INT);
        v_sum_strike_exch_group_no = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_STRIKE_EXCH_GROUP_NO_INT);
        v_sum_strike_asset_acco_no = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_STRIKE_ASSET_ACCO_NO_INT);
        v_sum_strike_pass_no = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_STRIKE_PASS_NO_INT);
        strcpy(v_sum_strike_out_acco, lpTSCall1Ans11->GetString(LDBIZ_SUM_STRIKE_OUT_ACCO_STR));
        v_sum_strike_stock_acco_no = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_STRIKE_STOCK_ACCO_NO_INT);
        v_sum_strike_stock_code_no = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_STRIKE_STOCK_CODE_NO_INT);
        v_sum_strike_comm_id = lpTSCall1Ans11->GetInt64(LDBIZ_SUM_STRIKE_COMM_ID_INT64);
        v_sum_strike_report_date = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_STRIKE_REPORT_DATE_INT);
        strcpy(v_sum_strike_report_no, lpTSCall1Ans11->GetString(LDBIZ_SUM_STRIKE_REPORT_NO_STR));
        v_sum_strike_order_date = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_STRIKE_ORDER_DATE_INT);
        v_sum_strike_order_id = lpTSCall1Ans11->GetInt64(LDBIZ_SUM_STRIKE_ORDER_ID_INT64);
        v_sum_strike_order_dir = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_STRIKE_ORDER_DIR_INT);
        v_sum_strike_order_price = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_STRIKE_ORDER_PRICE_FLOAT);
        v_sum_strike_order_qty = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_STRIKE_ORDER_QTY_FLOAT);
        v_sum_strike_strike_qty = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_STRIKE_STRIKE_QTY_FLOAT);
        v_sum_strike_strike_amt = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_STRIKE_STRIKE_AMT_FLOAT);
        v_sum_strike_all_fee = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_STRIKE_ALL_FEE_FLOAT);
        v_sum_strike_stamp_tax = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_STRIKE_STAMP_TAX_FLOAT);
        v_sum_strike_trans_fee = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_STRIKE_TRANS_FEE_FLOAT);
        v_sum_strike_brkage_fee = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_STRIKE_BRKAGE_FEE_FLOAT);
        v_sum_strike_SEC_charges = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_STRIKE_SEC_CHARGES_FLOAT);
        v_sum_strike_other_fee = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_STRIKE_OTHER_FEE_FLOAT);
        v_sum_strike_trade_commis = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_STRIKE_TRADE_COMMIS_FLOAT);
        v_sum_strike_other_commis = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_STRIKE_OTHER_COMMIS_FLOAT);
        v_sum_trade_tax = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_TRADE_TAX_FLOAT);
        v_sum_trade_cost_fee = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_TRADE_COST_FEE_FLOAT);
        v_sum_trade_system_use_fee = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_TRADE_SYSTEM_USE_FEE_FLOAT);
        v_sum_stock_settle_fee = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_STOCK_SETTLE_FEE_FLOAT);
        v_sum_strike_net_price_flag = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_STRIKE_NET_PRICE_FLAG_INT);
        v_sum_strike_bond_accr_intrst = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_STRIKE_BOND_ACCR_INTRST_FLOAT);
        v_sum_strike_bond_rate_type = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_STRIKE_BOND_RATE_TYPE_INT);
        strcpy(v_sum_strike_order_oper_way, lpTSCall1Ans11->GetString(LDBIZ_SUM_STRIKE_ORDER_OPER_WAY_STR));
        v_sum_strike_exter_comm_flag = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_STRIKE_EXTER_COMM_FLAG_INT);
        v_sum_strike_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_STRIKE_UPDATE_TIMES_INT);
        v_sum_strike_order_batch_no = lpTSCall1Ans11->GetInt32(LDBIZ_SUM_STRIKE_ORDER_BATCH_NO_INT);
        v_sum_external_no = lpTSCall1Ans11->GetInt64(LDBIZ_SUM_EXTERNAL_NO_INT64);


        // [主动推送][secu.ordertotal][证券主推_订单_订单汇总主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.21", 0);
        lpPubMsg->SetInt64(LDBIZ_SUM_ORDER_ROW_ID_INT64,v_sum_order_row_id);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_OPOR_NO_INT,v_sum_order_opor_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_CO_NO_INT,v_sum_order_co_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_PD_NO_INT,v_sum_order_pd_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_EXCH_GROUP_NO_INT,v_sum_order_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_ASSET_ACCO_NO_INT,v_sum_order_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_PASS_NO_INT,v_sum_order_pass_no);
        lpPubMsg->SetString(LDBIZ_SUM_ORDER_EXCH_CRNCY_TYPE_STR,v_sum_order_exch_crncy_type);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_STOCK_CODE_NO_INT,v_sum_order_stock_code_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_TRADE_CODE_NO_INT,v_sum_order_trade_code_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_TARGET_CODE_NO_INT,v_sum_order_target_code_no);
        lpPubMsg->SetInt64(LDBIZ_SUM_ORDER_EXTERNAL_NO_INT64,v_sum_order_external_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_DATE_INT,v_sum_order_date);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_BATCH_NO_INT,v_sum_order_batch_no);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_DIR_INT,v_sum_order_dir);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_PRICE_TYPE_INT,v_sum_order_price_type);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_PRICE_FLOAT,v_sum_order_price);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_QTY_FLOAT,v_sum_order_qty);
        lpPubMsg->SetString(LDBIZ_ORDER_SUM_STATUS_STR,v_order_sum_status);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_WTDRAW_QTY_FLOAT,v_sum_order_wtdraw_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_WASTE_QTY_FLOAT,v_sum_order_waste_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_STRIKE_AMT_FLOAT,v_sum_order_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_STRIKE_QTY_FLOAT,v_sum_order_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_STRIKE_AVER_PRICE_FLOAT,v_sum_order_strike_aver_price);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_NET_PRICE_FLAG_INT,v_sum_order_net_price_flag);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_BOND_ACCR_INTRST_FLOAT,v_sum_order_bond_accr_intrst);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_BOND_RATE_TYPE_INT,v_sum_order_bond_rate_type);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_PAR_VALUE_FLOAT,v_sum_order_par_value);
        lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_IMPAWN_RATIO_FLOAT,v_sum_order_impawn_ratio);
        lpPubMsg->SetString(LDBIZ_SUM_ORDER_OPER_WAY_STR,v_sum_order_oper_way);
        lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_UPDATE_TIMES_INT,v_sum_order_update_times);
        glpPubSub_Interface->PubTopics("secu.ordertotal", lpPubMsg);

      // end if;
      }


    // [遍历结果集结束][lpMainMsg2]
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
    lpOutBizMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpOutBizMsg->SetString(LDBIZ_OPER_STATN_STR,v_oper_statn);
    lpOutBizMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpOutBizMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpOutBizMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpOutBizMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpOutBizMsg->SetString(LDBIZ_ORDER_ID_STR_STR,v_order_id_str);
    lpOutBizMsg->SetString(LDBIZ_ORDER_STATUS_STR_STR,v_order_status_str);
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
    return iRet;
}

//逻辑_交易证券_中泰_新增组合订单
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
    char v_combo_code[33];
    double v_combo_copies;
    int v_exch_group_no;
    int v_asset_acco_no;
    char v_exch_no_str[2049];
    char v_stock_code_str[4097];
    char v_target_stock_code_str[4097];
    int v_order_batch_no;
    char v_comm_id_str[2049];
    char v_order_dir_str[1025];
    char v_price_type_str[2049];
    char v_order_qty_str[4097];
    char v_order_price_str[4097];
    char v_order_amt_str[4097];
    char v_order_oper_way[3];
    char v_combo_posi_id_str[2049];
    char v_long_token[1025];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_oper_statn[65];
    int v_co_no;
    int v_pass_no;
    char v_out_acco[33];
    int v_order_date;
    char v_order_id_str[2049];
    char v_order_status_str[65];
    int64 v_compli_trig_id;
    char v_split_str[5];
    int v_pd_no;
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_exgp_busi_config_str[65];
    char v_stock_code_no_str[4097];
    char v_target_stock_code_no_str[4097];
    char v_stock_type_str[2049];
    char v_asset_type_str[2049];
    char v_crncy_type_str[2049];
    char v_exch_crncy_type_str[2049];
    char v_buy_ref_rate_str[2049];
    char v_sell_ref_rate_str[2049];
    char v_par_value_str[4097];
    char v_impawn_ratio_str[4097];
    char v_net_price_flag_str[2049];
    char v_intrst_days_str[2049];
    char v_bond_rate_type_str[4097];
    char v_bond_accr_intrst_str[4097];
    char v_target_code_no_str[4097];
    char v_target_code_str[2049];
    char v_target_code_stock_type_str[2049];
    char v_target_code_asset_type_str[2049];
    char v_trade_code_no_str[4097];
    char v_trade_code_str[2049];
    char v_trade_code_stock_type_str[2049];
    char v_trade_code_asset_type_str[2049];
    char v_min_unit_str[2049];
    char v_up_limit_price_str[4097];
    char v_down_limit_price_str[4097];
    char v_last_price_str[4097];
    char v_capit_reback_days_str[2049];
    char v_posi_reback_days_str[2049];
    char v_subscription_trade_mark_str[4097];
    char v_purchase_trade_mark_str[4097];
    char v_rede_trade_mark_str[4097];
    char v_first_minimum_amt_str[4097];
    char v_minimum_purchase_amt_str[4097];
    char v_minimum_subscription_amt_str[4097];
    char v_minimum_rede_share_str[4097];
    char v_minimum_holding_share_str[4097];
    char v_minimum_turning_out_share_str[4097];
    char v_fund_manager_str[4097];
    char v_charging_method_str[4097];
    char v_registration_agency_str[4097];
    char v_target_subscrip_trade_mark_str[4097];
    char v_target_purchase_trade_mark_str[4097];
    char v_target_rede_trade_mark_str[4097];
    char v_target_first_minimum_amt_str[4097];
    char v_target_min_purchase_amt_str[4097];
    char v_target_min_subscrip_amt_str[4097];
    char v_target_min_rede_share_str[4097];
    char v_target_min_holding_share_str[4097];
    char v_target_min_turning_out_share_str[4097];
    char v_target_fund_manager_str[4097];
    char v_target_charging_method_str[4097];
    char v_trade_acco[33];
    char v_target_registration_agency_str[4097];
    char v_sys_config_str[65];
    char v_busi_config_str[65];
    char v_busi_ctrl_str[65];
    char v_asac_busi_config_str[65];
    char v_split_fee_typr_str[65];
    char v_busi_limit_str[2049];
    double v_nav_asset;
    int v_exter_comm_flag;
    double v_market_price_ratio;
    int v_market_price_type;
    int v_cost_calc_type;
    char v_order_market_price_str[4097];
    int v_sys_type;
    char v_opor_no_str1[2049];
    char v_opor_no_str2[2049];
    char v_opor_no_str3[2049];
    int v_asset_acco_type;
    char v_stock_acco_no_str[4097];
    char v_stock_acco_str[2049];
    double v_exgp_avail_amt;
    double v_asac_avail_amt;
    double v_asac_T_hk_buy_total_amt;
    double v_asac_T_hk_sell_total_amt;
    double v_asac_T1_hk_buy_total_amt;
    double v_asac_T1_hk_sell_total_amt;
    double v_exgp_T_hk_buy_total_amt;
    double v_exgp_T_hk_sell_total_amt;
    double v_exgp_T1_hk_buy_total_amt;
    double v_exgp_T1_hk_sell_total_amt;
    char v_exgp_avail_qty_str[4097];
    char v_exgp_target_code_avail_qty_str[4097];
    char v_exgp_trade_code_avail_qty_str[4097];
    char v_asac_avail_qty_str[4097];
    char v_asac_target_code_avail_qty_str[4097];
    char v_asac_trade_code_avail_qty_str[4097];
    int v_record_count;
    char v_all_fee_str[4097];
    int v_open_posi_date;
    int v_tmp_exgp_cash_update_times;
    int v_tmp_asac_cash_update_times;
    int v_tmp_sum_comm_update_times;
    double v_exgp_put_impawn_qty;
    double v_asac_put_impawn_qty;
    int64 v_order_id;
    int v_busi_opor_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    int v_stock_type;
    int64 v_external_no;
    char v_exch_crncy_type[4];
    int v_exch_no;
    char v_stock_code[7];
    char v_stock_acco[17];
    int64 v_comm_id;
    int v_comm_batch_no;
    int v_order_dir;
    double v_order_qty;
    double v_order_price;
    int v_order_time;
    double v_wtdraw_qty;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    double v_par_value;
    double v_impawn_ratio;
    char v_rsp_info[256];
    double v_strike_amt;
    double v_strike_qty;
    double v_strike_bond_accr_intrst;
    int v_price_type;
    char v_order_status[3];
    double v_order_frozen_amt;
    double v_order_frozen_qty;
    int v_net_price_flag;
    double v_bond_accr_intrst;
    int v_bond_rate_type;
    int v_update_times;
    int64 v_combo_posi_id;
    int64 v_strategy_id;
    char v_registration_agency[33];
    char v_contra_no[33];
    double v_curr_strike_price;
    double v_curr_strike_amt;
    double v_curr_strike_qty;
    int64 v_strike_id;
    double v_all_fee;
    char v_wtdraw_status[3];
    int v_trade_time_flag;
    int64 v_exgp_cash_id;
    double v_exgp_frozen_amt;
    double v_exgp_unfroz_amt;
    double v_exgp_comm_frozen_amt;
    double v_exgp_comm_unfroz_amt;
    double v_exgp_comm_capt_amt;
    double v_exgp_comm_releas_amt;
    double v_exgp_trade_frozen_amt;
    double v_exgp_trade_unfroz_amt;
    double v_exgp_trade_capt_amt;
    double v_exgp_trade_releas_amt;
    double v_exgp_strike_capt_amt;
    double v_exgp_strike_releas_amt;
    int v_exgp_cash_update_times;
    int64 v_exgp_posi_id;
    double v_exgp_frozen_qty;
    double v_exgp_unfroz_qty;
    double v_exgp_comm_frozen_qty;
    double v_exgp_comm_unfroz_qty;
    double v_exgp_comm_capt_qty;
    double v_exgp_comm_releas_qty;
    double v_exgp_trade_frozen_qty;
    double v_exgp_trade_unfroz_qty;
    double v_exgp_trade_capt_qty;
    double v_exgp_trade_releas_qty;
    double v_exgp_strike_capt_qty;
    double v_exgp_strike_releas_qty;
    double v_exgp_strike_frozen_qty;
    double v_exgp_strike_unfroz_qty;
    double v_exgp_realize_pandl;
    double v_exgp_cost_amt;
    double v_exgp_intrst_cost_amt;
    double v_exgp_intrst_pandl;
    int v_exgp_posi_update_times;
    int64 v_asac_cash_id;
    double v_asac_frozen_amt;
    double v_asac_unfroz_amt;
    double v_asac_comm_frozen_amt;
    double v_asac_comm_unfroz_amt;
    double v_asac_comm_capt_amt;
    double v_asac_comm_releas_amt;
    double v_asac_trade_frozen_amt;
    double v_asac_trade_unfroz_amt;
    double v_asac_trade_capt_amt;
    double v_asac_trade_releas_amt;
    double v_asac_strike_capt_amt;
    double v_asac_strike_releas_amt;
    int v_asac_cash_update_times;
    int64 v_asac_posi_id;
    double v_asac_frozen_qty;
    double v_asac_unfroz_qty;
    double v_asac_comm_frozen_qty;
    double v_asac_comm_unfroz_qty;
    double v_asac_comm_capt_qty;
    double v_asac_comm_releas_qty;
    double v_asac_trade_frozen_qty;
    double v_asac_trade_unfroz_qty;
    double v_asac_trade_capt_qty;
    double v_asac_trade_releas_qty;
    double v_asac_strike_capt_qty;
    double v_asac_strike_releas_qty;
    double v_asac_strike_frozen_qty;
    double v_asac_strike_unfroz_qty;
    double v_asac_realize_pandl;
    double v_asac_cost_amt;
    double v_asac_intrst_cost_amt;
    double v_asac_intrst_pandl;
    int v_asac_posi_update_times;
    int64 v_row_id;
    double v_curr_qty;
    double v_posi_qty;
    double v_frozen_qty;
    double v_unfroz_qty;
    double v_pre_settle_qty;
    double v_trade_frozen_qty;
    double v_trade_unfroz_qty;
    double v_trade_capt_qty;
    double v_trade_releas_qty;
    double v_strike_capt_qty;
    double v_strike_releas_qty;
    double v_strike_frozen_qty;
    double v_strike_unfroz_qty;
    double v_realize_pandl;
    double v_cost_amt;
    double v_intrst_cost_amt;
    double v_intrst_pandl;
    int v_combo_date;
    int v_combo_time;
    char v_combo_status[3];
    double v_combo_cost;
    double v_combo_market_value;
    double v_sum_realize_pandl;
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
    strcpy(v_combo_code, " ");
    v_combo_copies=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    strcpy(v_exch_no_str, " ");
    strcpy(v_stock_code_str, " ");
    strcpy(v_target_stock_code_str, " ");
    v_order_batch_no=0;
    strcpy(v_comm_id_str, " ");
    strcpy(v_order_dir_str, " ");
    strcpy(v_price_type_str, " ");
    strcpy(v_order_qty_str, " ");
    strcpy(v_order_price_str, " ");
    strcpy(v_order_amt_str, " ");
    strcpy(v_order_oper_way, " ");
    strcpy(v_combo_posi_id_str, " ");
    strcpy(v_long_token, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_oper_statn, " ");
    v_co_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_order_date=0;
    strcpy(v_order_id_str, " ");
    strcpy(v_order_status_str, " ");
    v_compli_trig_id=0;
    strcpy(v_split_str, " ");
    v_pd_no=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_exgp_busi_config_str, " ");
    strcpy(v_stock_code_no_str, " ");
    strcpy(v_target_stock_code_no_str, " ");
    strcpy(v_stock_type_str, " ");
    strcpy(v_asset_type_str, " ");
    strcpy(v_crncy_type_str, " ");
    strcpy(v_exch_crncy_type_str, " ");
    strcpy(v_buy_ref_rate_str, " ");
    strcpy(v_sell_ref_rate_str, " ");
    strcpy(v_par_value_str, " ");
    strcpy(v_impawn_ratio_str, " ");
    strcpy(v_net_price_flag_str, " ");
    strcpy(v_intrst_days_str, " ");
    strcpy(v_bond_rate_type_str, " ");
    strcpy(v_bond_accr_intrst_str, " ");
    strcpy(v_target_code_no_str, " ");
    strcpy(v_target_code_str, " ");
    strcpy(v_target_code_stock_type_str, " ");
    strcpy(v_target_code_asset_type_str, " ");
    strcpy(v_trade_code_no_str, " ");
    strcpy(v_trade_code_str, " ");
    strcpy(v_trade_code_stock_type_str, " ");
    strcpy(v_trade_code_asset_type_str, " ");
    strcpy(v_min_unit_str, " ");
    strcpy(v_up_limit_price_str, " ");
    strcpy(v_down_limit_price_str, " ");
    strcpy(v_last_price_str, " ");
    strcpy(v_capit_reback_days_str, " ");
    strcpy(v_posi_reback_days_str, " ");
    strcpy(v_subscription_trade_mark_str, " ");
    strcpy(v_purchase_trade_mark_str, " ");
    strcpy(v_rede_trade_mark_str, " ");
    strcpy(v_first_minimum_amt_str, " ");
    strcpy(v_minimum_purchase_amt_str, " ");
    strcpy(v_minimum_subscription_amt_str, " ");
    strcpy(v_minimum_rede_share_str, " ");
    strcpy(v_minimum_holding_share_str, " ");
    strcpy(v_minimum_turning_out_share_str, " ");
    strcpy(v_fund_manager_str, " ");
    strcpy(v_charging_method_str, " ");
    strcpy(v_registration_agency_str, " ");
    strcpy(v_target_subscrip_trade_mark_str, " ");
    strcpy(v_target_purchase_trade_mark_str, " ");
    strcpy(v_target_rede_trade_mark_str, " ");
    strcpy(v_target_first_minimum_amt_str, " ");
    strcpy(v_target_min_purchase_amt_str, " ");
    strcpy(v_target_min_subscrip_amt_str, " ");
    strcpy(v_target_min_rede_share_str, " ");
    strcpy(v_target_min_holding_share_str, " ");
    strcpy(v_target_min_turning_out_share_str, " ");
    strcpy(v_target_fund_manager_str, " ");
    strcpy(v_target_charging_method_str, " ");
    strcpy(v_trade_acco, " ");
    strcpy(v_target_registration_agency_str, " ");
    strcpy(v_sys_config_str, " ");
    strcpy(v_busi_config_str, " ");
    strcpy(v_busi_ctrl_str, " ");
    strcpy(v_asac_busi_config_str, " ");
    strcpy(v_split_fee_typr_str, " ");
    strcpy(v_busi_limit_str, " ");
    v_nav_asset=0;
    v_exter_comm_flag=0;
    v_market_price_ratio=0;
    v_market_price_type=0;
    v_cost_calc_type=0;
    strcpy(v_order_market_price_str, " ");
    v_sys_type=0;
    strcpy(v_opor_no_str1, " ");
    strcpy(v_opor_no_str2, " ");
    strcpy(v_opor_no_str3, " ");
    v_asset_acco_type=0;
    strcpy(v_stock_acco_no_str, " ");
    strcpy(v_stock_acco_str, " ");
    v_exgp_avail_amt=0;
    v_asac_avail_amt=0;
    v_asac_T_hk_buy_total_amt=0;
    v_asac_T_hk_sell_total_amt=0;
    v_asac_T1_hk_buy_total_amt=0;
    v_asac_T1_hk_sell_total_amt=0;
    v_exgp_T_hk_buy_total_amt=0;
    v_exgp_T_hk_sell_total_amt=0;
    v_exgp_T1_hk_buy_total_amt=0;
    v_exgp_T1_hk_sell_total_amt=0;
    strcpy(v_exgp_avail_qty_str, " ");
    strcpy(v_exgp_target_code_avail_qty_str, " ");
    strcpy(v_exgp_trade_code_avail_qty_str, " ");
    strcpy(v_asac_avail_qty_str, " ");
    strcpy(v_asac_target_code_avail_qty_str, " ");
    strcpy(v_asac_trade_code_avail_qty_str, " ");
    v_record_count=0;
    strcpy(v_all_fee_str, " ");
    v_open_posi_date=0;
    v_tmp_exgp_cash_update_times=1;
    v_tmp_asac_cash_update_times=1;
    v_tmp_sum_comm_update_times=1;
    v_exgp_put_impawn_qty=0;
    v_asac_put_impawn_qty=0;
    v_order_id=0;
    v_busi_opor_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_stock_type=0;
    v_external_no=0;
    strcpy(v_exch_crncy_type, "CNY");
    v_exch_no=0;
    strcpy(v_stock_code, " ");
    strcpy(v_stock_acco, " ");
    v_comm_id=0;
    v_comm_batch_no=0;
    v_order_dir=0;
    v_order_qty=0;
    v_order_price=0;
    v_order_time=0;
    v_wtdraw_qty=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_par_value=0;
    v_impawn_ratio=0;
    strcpy(v_rsp_info, " ");
    v_strike_amt=0;
    v_strike_qty=0;
    v_strike_bond_accr_intrst=0;
    v_price_type=0;
    strcpy(v_order_status, "0");
    v_order_frozen_amt=0;
    v_order_frozen_qty=0;
    v_net_price_flag=0;
    v_bond_accr_intrst=0;
    v_bond_rate_type=0;
    v_update_times=1;
    v_combo_posi_id=0;
    v_strategy_id=0;
    strcpy(v_registration_agency, " ");
    strcpy(v_contra_no, " ");
    v_curr_strike_price=0;
    v_curr_strike_amt=0;
    v_curr_strike_qty=0;
    v_strike_id=0;
    v_all_fee=0;
    strcpy(v_wtdraw_status, "0");
    v_trade_time_flag=0;
    v_exgp_cash_id=0;
    v_exgp_frozen_amt=0;
    v_exgp_unfroz_amt=0;
    v_exgp_comm_frozen_amt=0;
    v_exgp_comm_unfroz_amt=0;
    v_exgp_comm_capt_amt=0;
    v_exgp_comm_releas_amt=0;
    v_exgp_trade_frozen_amt=0;
    v_exgp_trade_unfroz_amt=0;
    v_exgp_trade_capt_amt=0;
    v_exgp_trade_releas_amt=0;
    v_exgp_strike_capt_amt=0;
    v_exgp_strike_releas_amt=0;
    v_exgp_cash_update_times=1;
    v_exgp_posi_id=0;
    v_exgp_frozen_qty=0;
    v_exgp_unfroz_qty=0;
    v_exgp_comm_frozen_qty=0;
    v_exgp_comm_unfroz_qty=0;
    v_exgp_comm_capt_qty=0;
    v_exgp_comm_releas_qty=0;
    v_exgp_trade_frozen_qty=0;
    v_exgp_trade_unfroz_qty=0;
    v_exgp_trade_capt_qty=0;
    v_exgp_trade_releas_qty=0;
    v_exgp_strike_capt_qty=0;
    v_exgp_strike_releas_qty=0;
    v_exgp_strike_frozen_qty=0;
    v_exgp_strike_unfroz_qty=0;
    v_exgp_realize_pandl=0;
    v_exgp_cost_amt=0;
    v_exgp_intrst_cost_amt=0;
    v_exgp_intrst_pandl=0;
    v_exgp_posi_update_times=1;
    v_asac_cash_id=0;
    v_asac_frozen_amt=0;
    v_asac_unfroz_amt=0;
    v_asac_comm_frozen_amt=0;
    v_asac_comm_unfroz_amt=0;
    v_asac_comm_capt_amt=0;
    v_asac_comm_releas_amt=0;
    v_asac_trade_frozen_amt=0;
    v_asac_trade_unfroz_amt=0;
    v_asac_trade_capt_amt=0;
    v_asac_trade_releas_amt=0;
    v_asac_strike_capt_amt=0;
    v_asac_strike_releas_amt=0;
    v_asac_cash_update_times=1;
    v_asac_posi_id=0;
    v_asac_frozen_qty=0;
    v_asac_unfroz_qty=0;
    v_asac_comm_frozen_qty=0;
    v_asac_comm_unfroz_qty=0;
    v_asac_comm_capt_qty=0;
    v_asac_comm_releas_qty=0;
    v_asac_trade_frozen_qty=0;
    v_asac_trade_unfroz_qty=0;
    v_asac_trade_capt_qty=0;
    v_asac_trade_releas_qty=0;
    v_asac_strike_capt_qty=0;
    v_asac_strike_releas_qty=0;
    v_asac_strike_frozen_qty=0;
    v_asac_strike_unfroz_qty=0;
    v_asac_realize_pandl=0;
    v_asac_cost_amt=0;
    v_asac_intrst_cost_amt=0;
    v_asac_intrst_pandl=0;
    v_asac_posi_update_times=1;
    v_row_id=0;
    v_curr_qty=0;
    v_posi_qty=0;
    v_frozen_qty=0;
    v_unfroz_qty=0;
    v_pre_settle_qty=0;
    v_trade_frozen_qty=0;
    v_trade_unfroz_qty=0;
    v_trade_capt_qty=0;
    v_trade_releas_qty=0;
    v_strike_capt_qty=0;
    v_strike_releas_qty=0;
    v_strike_frozen_qty=0;
    v_strike_unfroz_qty=0;
    v_realize_pandl=0;
    v_cost_amt=0;
    v_intrst_cost_amt=0;
    v_intrst_pandl=0;
    v_combo_date=0;
    v_combo_time=0;
    strcpy(v_combo_status, "0");
    v_combo_cost=0;
    v_combo_market_value=0;
    v_sum_realize_pandl=0;
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
    strncpy(v_combo_code, lpInBizMsg->GetString(LDBIZ_COMBO_CODE_STR),32);
    v_combo_code[32] = '\0';
    v_combo_copies = lpInBizMsg->GetDouble(LDBIZ_COMBO_COPIES_FLOAT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    strncpy(v_stock_code_str, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR_STR),4096);
    v_stock_code_str[4096] = '\0';
    strncpy(v_target_stock_code_str, lpInBizMsg->GetString(LDBIZ_TARGET_STOCK_CODE_STR_STR),4096);
    v_target_stock_code_str[4096] = '\0';
    v_order_batch_no = lpInBizMsg->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strncpy(v_comm_id_str, lpInBizMsg->GetString(LDBIZ_COMM_ID_STR_STR),2048);
    v_comm_id_str[2048] = '\0';
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    strncpy(v_price_type_str, lpInBizMsg->GetString(LDBIZ_PRICE_TYPE_STR_STR),2048);
    v_price_type_str[2048] = '\0';
    strncpy(v_order_qty_str, lpInBizMsg->GetString(LDBIZ_ORDER_QTY_STR_STR),4096);
    v_order_qty_str[4096] = '\0';
    strncpy(v_order_price_str, lpInBizMsg->GetString(LDBIZ_ORDER_PRICE_STR_STR),4096);
    v_order_price_str[4096] = '\0';
    strncpy(v_order_amt_str, lpInBizMsg->GetString(LDBIZ_ORDER_AMT_STR_STR),4096);
    v_order_amt_str[4096] = '\0';
    strncpy(v_order_oper_way, lpInBizMsg->GetString(LDBIZ_ORDER_OPER_WAY_STR),2);
    v_order_oper_way[2] = '\0';
    strncpy(v_combo_posi_id_str, lpInBizMsg->GetString(LDBIZ_COMBO_POSI_ID_STR_STR),2048);
    v_combo_posi_id_str[2048] = '\0';
    strncpy(v_long_token, lpInBizMsg->GetString(LDBIZ_LONG_TOKEN_STR),1024);
    v_long_token[1024] = '\0';

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

    // set @分隔符# = ";";
    strcpy(v_split_str,";");
    //公共子系统检查，检查交易日期时间

    // set @产品编号# = 0;
    v_pd_no = 0;
    //调用过程[事务_公共_交易接口_检查批量基金转换市场状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.25.8", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req0->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req0->SetString(LDBIZ_STOCK_CODE_STR_STR,v_stock_code_str);
    lpTSCall1Req0->SetString(LDBIZ_TARGET_STOCK_CODE_STR_STR,v_target_stock_code_str);
    lpTSCall1Req0->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req0->SetString(LDBIZ_ORDER_QTY_STR_STR,v_order_qty_str);
    lpTSCall1Req0->SetString(LDBIZ_PRICE_TYPE_STR_STR,v_price_type_str);
    lpTSCall1Req0->SetString(LDBIZ_SPLIT_STR_STR,v_split_str);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.8]subcall timed out!");
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
    strcpy(v_stock_code_no_str, lpTSCall1Ans0->GetString(LDBIZ_STOCK_CODE_NO_STR_STR));
    strcpy(v_target_stock_code_no_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_STOCK_CODE_NO_STR_STR));
    strcpy(v_stock_type_str, lpTSCall1Ans0->GetString(LDBIZ_STOCK_TYPE_STR_STR));
    strcpy(v_asset_type_str, lpTSCall1Ans0->GetString(LDBIZ_ASSET_TYPE_STR_STR));
    strcpy(v_crncy_type_str, lpTSCall1Ans0->GetString(LDBIZ_CRNCY_TYPE_STR_STR));
    strcpy(v_exch_crncy_type_str, lpTSCall1Ans0->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR_STR));
    strcpy(v_buy_ref_rate_str, lpTSCall1Ans0->GetString(LDBIZ_BUY_REF_RATE_STR_STR));
    strcpy(v_sell_ref_rate_str, lpTSCall1Ans0->GetString(LDBIZ_SELL_REF_RATE_STR_STR));
    strcpy(v_par_value_str, lpTSCall1Ans0->GetString(LDBIZ_PAR_VALUE_STR_STR));
    strcpy(v_impawn_ratio_str, lpTSCall1Ans0->GetString(LDBIZ_IMPAWN_RATIO_STR_STR));
    strcpy(v_net_price_flag_str, lpTSCall1Ans0->GetString(LDBIZ_NET_PRICE_FLAG_STR_STR));
    strcpy(v_intrst_days_str, lpTSCall1Ans0->GetString(LDBIZ_INTRST_DAYS_STR_STR));
    strcpy(v_bond_rate_type_str, lpTSCall1Ans0->GetString(LDBIZ_BOND_RATE_TYPE_STR_STR));
    strcpy(v_bond_accr_intrst_str, lpTSCall1Ans0->GetString(LDBIZ_BOND_ACCR_INTRST_STR_STR));
    strcpy(v_target_code_no_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_CODE_NO_STR_STR));
    strcpy(v_target_code_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_CODE_STR_STR));
    strcpy(v_target_code_stock_type_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_CODE_STOCK_TYPE_STR_STR));
    strcpy(v_target_code_asset_type_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_CODE_ASSET_TYPE_STR_STR));
    strcpy(v_trade_code_no_str, lpTSCall1Ans0->GetString(LDBIZ_TRADE_CODE_NO_STR_STR));
    strcpy(v_trade_code_str, lpTSCall1Ans0->GetString(LDBIZ_TRADE_CODE_STR_STR));
    strcpy(v_trade_code_stock_type_str, lpTSCall1Ans0->GetString(LDBIZ_TRADE_CODE_STOCK_TYPE_STR_STR));
    strcpy(v_trade_code_asset_type_str, lpTSCall1Ans0->GetString(LDBIZ_TRADE_CODE_ASSET_TYPE_STR_STR));
    strcpy(v_min_unit_str, lpTSCall1Ans0->GetString(LDBIZ_MIN_UNIT_STR_STR));
    strcpy(v_up_limit_price_str, lpTSCall1Ans0->GetString(LDBIZ_UP_LIMIT_PRICE_STR_STR));
    strcpy(v_down_limit_price_str, lpTSCall1Ans0->GetString(LDBIZ_DOWN_LIMIT_PRICE_STR_STR));
    strcpy(v_last_price_str, lpTSCall1Ans0->GetString(LDBIZ_LAST_PRICE_STR_STR));
    strcpy(v_capit_reback_days_str, lpTSCall1Ans0->GetString(LDBIZ_CAPIT_REBACK_DAYS_STR_STR));
    strcpy(v_posi_reback_days_str, lpTSCall1Ans0->GetString(LDBIZ_POSI_REBACK_DAYS_STR_STR));
    strcpy(v_subscription_trade_mark_str, lpTSCall1Ans0->GetString(LDBIZ_SUBSCRIPTION_TRADE_MARK_STR_STR));
    strcpy(v_purchase_trade_mark_str, lpTSCall1Ans0->GetString(LDBIZ_PURCHASE_TRADE_MARK_STR_STR));
    strcpy(v_rede_trade_mark_str, lpTSCall1Ans0->GetString(LDBIZ_REDE_TRADE_MARK_STR_STR));
    strcpy(v_first_minimum_amt_str, lpTSCall1Ans0->GetString(LDBIZ_FIRST_MINIMUM_AMT_STR_STR));
    strcpy(v_minimum_purchase_amt_str, lpTSCall1Ans0->GetString(LDBIZ_MINIMUM_PURCHASE_AMT_STR_STR));
    strcpy(v_minimum_subscription_amt_str, lpTSCall1Ans0->GetString(LDBIZ_MINIMUM_SUBSCRIPTION_AMT_STR_STR));
    strcpy(v_minimum_rede_share_str, lpTSCall1Ans0->GetString(LDBIZ_MINIMUM_REDE_SHARE_STR_STR));
    strcpy(v_minimum_holding_share_str, lpTSCall1Ans0->GetString(LDBIZ_MINIMUM_HOLDING_SHARE_STR_STR));
    strcpy(v_minimum_turning_out_share_str, lpTSCall1Ans0->GetString(LDBIZ_MINIMUM_TURNING_OUT_SHARE_STR_STR));
    strcpy(v_fund_manager_str, lpTSCall1Ans0->GetString(LDBIZ_FUND_MANAGER_STR_STR));
    strcpy(v_charging_method_str, lpTSCall1Ans0->GetString(LDBIZ_CHARGING_METHOD_STR_STR));
    strcpy(v_registration_agency_str, lpTSCall1Ans0->GetString(LDBIZ_REGISTRATION_AGENCY_STR_STR));
    strcpy(v_target_subscrip_trade_mark_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_SUBSCRIP_TRADE_MARK_STR_STR));
    strcpy(v_target_purchase_trade_mark_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_PURCHASE_TRADE_MARK_STR_STR));
    strcpy(v_target_rede_trade_mark_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_REDE_TRADE_MARK_STR_STR));
    strcpy(v_target_first_minimum_amt_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_FIRST_MINIMUM_AMT_STR_STR));
    strcpy(v_target_min_purchase_amt_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_MIN_PURCHASE_AMT_STR_STR));
    strcpy(v_target_min_subscrip_amt_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_MIN_SUBSCRIP_AMT_STR_STR));
    strcpy(v_target_min_rede_share_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_MIN_REDE_SHARE_STR_STR));
    strcpy(v_target_min_holding_share_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_MIN_HOLDING_SHARE_STR_STR));
    strcpy(v_target_min_turning_out_share_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_MIN_TURNING_OUT_SHARE_STR_STR));
    strcpy(v_target_fund_manager_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_FUND_MANAGER_STR_STR));
    strcpy(v_target_charging_method_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_CHARGING_METHOD_STR_STR));
    strcpy(v_trade_acco, lpTSCall1Ans0->GetString(LDBIZ_TRADE_ACCO_STR));
    strcpy(v_target_registration_agency_str, lpTSCall1Ans0->GetString(LDBIZ_TARGET_REGISTRATION_AGENCY_STR_STR));
    strcpy(v_sys_config_str, lpTSCall1Ans0->GetString(LDBIZ_SYS_CONFIG_STR_STR));


    // set @业务控制配置串# = @交易组业务控制配置串#;
    strcpy(v_busi_config_str,v_exgp_busi_config_str);
    //判断组合是否失效
    //[事务_交易证券_账户_检查组合失效]
    //产品子系统检查，检查账户状态，获取当前资金等
    //位1 交易组业务控制配置串，2交易组可用资金 3资产账户业务控制配置串 4资产账户可用资金 5通道编号外部账号

    // set @业务控制串# = "11111";
    strcpy(v_busi_ctrl_str,"11111");
    //调用过程[事务_产品_交易接口_检查交易产品账户批量信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.8.22", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_CRNCY_TYPE_STR_STR,v_crncy_type_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_PRICE_STR_STR,v_order_price_str);
    lpTSCall1Req1->SetString(LDBIZ_PRICE_TYPE_STR_STR,v_price_type_str);
    lpTSCall1Req1->SetString(LDBIZ_UP_LIMIT_PRICE_STR_STR,v_up_limit_price_str);
    lpTSCall1Req1->SetString(LDBIZ_DOWN_LIMIT_PRICE_STR_STR,v_down_limit_price_str);
    lpTSCall1Req1->SetString(LDBIZ_LAST_PRICE_STR_STR,v_last_price_str);
    lpTSCall1Req1->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
    lpTSCall1Req1->SetString(LDBIZ_BUSI_CONFIG_STR_STR,v_busi_config_str);
    lpTSCall1Req1->SetString(LDBIZ_SPLIT_STR_STR,v_split_str);
    lpTSCall1Req1->SetString(LDBIZ_SYS_CONFIG_STR_STR,v_sys_config_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.8.22]subcall timed out!");
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
    v_pass_no = lpTSCall1Ans1->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans1->GetString(LDBIZ_OUT_ACCO_STR));
    v_nav_asset = lpTSCall1Ans1->GetDouble(LDBIZ_NAV_ASSET_FLOAT);
    v_exter_comm_flag = lpTSCall1Ans1->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_market_price_ratio = lpTSCall1Ans1->GetDouble(LDBIZ_MARKET_PRICE_RATIO_FLOAT);
    v_market_price_type = lpTSCall1Ans1->GetInt32(LDBIZ_MARKET_PRICE_TYPE_INT);
    v_cost_calc_type = lpTSCall1Ans1->GetInt32(LDBIZ_COST_CALC_TYPE_INT);
    strcpy(v_order_market_price_str, lpTSCall1Ans1->GetString(LDBIZ_ORDER_MARKET_PRICE_STR_STR));
    v_sys_type = lpTSCall1Ans1->GetInt32(LDBIZ_SYS_TYPE_INT);
    strcpy(v_opor_no_str1, lpTSCall1Ans1->GetString(LDBIZ_OPOR_NO_STR1_STR));
    strcpy(v_opor_no_str2, lpTSCall1Ans1->GetString(LDBIZ_OPOR_NO_STR2_STR));
    strcpy(v_opor_no_str3, lpTSCall1Ans1->GetString(LDBIZ_OPOR_NO_STR3_STR));
    v_asset_acco_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);


    // set @订单价格串# = @订单市价价格串#;
    strcpy(v_order_price_str,v_order_market_price_str);
    //检查股东，获取可用
    //调用过程[事务_产品证券_交易接口_检查账户状态获取批量可用]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.6.2", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_CODE_NO_STR_STR,v_stock_code_no_str);
    lpTSCall1Req2->SetString(LDBIZ_TRADE_CODE_NO_STR_STR,v_trade_code_no_str);
    lpTSCall1Req2->SetString(LDBIZ_TARGET_CODE_NO_STR_STR,v_target_code_no_str);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req2->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req2->SetString(LDBIZ_ORDER_QTY_STR_STR,v_order_qty_str);
    lpTSCall1Req2->SetString(LDBIZ_CRNCY_TYPE_STR_STR,v_crncy_type_str);
    lpTSCall1Req2->SetString(LDBIZ_REGISTRATION_AGENCY_STR_STR,v_registration_agency_str);
    lpTSCall1Req2->SetString(LDBIZ_SPLIT_STR_STR,v_split_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.6.2]subcall timed out!");
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
    strcpy(v_stock_acco_no_str, lpTSCall1Ans2->GetString(LDBIZ_STOCK_ACCO_NO_STR_STR));
    strcpy(v_stock_acco_str, lpTSCall1Ans2->GetString(LDBIZ_STOCK_ACCO_STR_STR));
    v_exgp_avail_amt = lpTSCall1Ans2->GetDouble(LDBIZ_EXGP_AVAIL_AMT_FLOAT);
    v_asac_avail_amt = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_AVAIL_AMT_FLOAT);
    v_asac_T_hk_buy_total_amt = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_T_HK_BUY_TOTAL_AMT_FLOAT);
    v_asac_T_hk_sell_total_amt = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_T_HK_SELL_TOTAL_AMT_FLOAT);
    v_asac_T1_hk_buy_total_amt = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_T1_HK_BUY_TOTAL_AMT_FLOAT);
    v_asac_T1_hk_sell_total_amt = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_T1_HK_SELL_TOTAL_AMT_FLOAT);
    v_exgp_T_hk_buy_total_amt = lpTSCall1Ans2->GetDouble(LDBIZ_EXGP_T_HK_BUY_TOTAL_AMT_FLOAT);
    v_exgp_T_hk_sell_total_amt = lpTSCall1Ans2->GetDouble(LDBIZ_EXGP_T_HK_SELL_TOTAL_AMT_FLOAT);
    v_exgp_T1_hk_buy_total_amt = lpTSCall1Ans2->GetDouble(LDBIZ_EXGP_T1_HK_BUY_TOTAL_AMT_FLOAT);
    v_exgp_T1_hk_sell_total_amt = lpTSCall1Ans2->GetDouble(LDBIZ_EXGP_T1_HK_SELL_TOTAL_AMT_FLOAT);
    strcpy(v_exgp_avail_qty_str, lpTSCall1Ans2->GetString(LDBIZ_EXGP_AVAIL_QTY_STR_STR));
    strcpy(v_exgp_target_code_avail_qty_str, lpTSCall1Ans2->GetString(LDBIZ_EXGP_TARGET_CODE_AVAIL_QTY_STR_STR));
    strcpy(v_exgp_trade_code_avail_qty_str, lpTSCall1Ans2->GetString(LDBIZ_EXGP_TRADE_CODE_AVAIL_QTY_STR_STR));
    strcpy(v_asac_avail_qty_str, lpTSCall1Ans2->GetString(LDBIZ_ASAC_AVAIL_QTY_STR_STR));
    strcpy(v_asac_target_code_avail_qty_str, lpTSCall1Ans2->GetString(LDBIZ_ASAC_TARGET_CODE_AVAIL_QTY_STR_STR));
    strcpy(v_asac_trade_code_avail_qty_str, lpTSCall1Ans2->GetString(LDBIZ_ASAC_TRADE_CODE_AVAIL_QTY_STR_STR));
    v_record_count = lpTSCall1Ans2->GetInt32(LDBIZ_RECORD_COUNT_INT);

    //如果是买入，需计算费用，卖出需要获取可用数量
    //调用过程[事务_公共_公共接口_计算批量订单费用]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.24.208", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req3->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req3->SetString(LDBIZ_STOCK_CODE_NO_STR_STR,v_stock_code_no_str);
    lpTSCall1Req3->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req3->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req3->SetString(LDBIZ_ORDER_QTY_STR_STR,v_order_qty_str);
    lpTSCall1Req3->SetString(LDBIZ_ORDER_PRICE_STR_STR,v_order_price_str);
    lpTSCall1Req3->SetString(LDBIZ_NET_PRICE_FLAG_STR_STR,v_net_price_flag_str);
    lpTSCall1Req3->SetString(LDBIZ_BOND_RATE_TYPE_STR_STR,v_bond_rate_type_str);
    lpTSCall1Req3->SetString(LDBIZ_BOND_ACCR_INTRST_STR_STR,v_bond_accr_intrst_str);
    lpTSCall1Req3->SetString(LDBIZ_PAR_VALUE_STR_STR,v_par_value_str);
    lpTSCall1Req3->SetString(LDBIZ_SPLIT_STR_STR,v_split_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.208]subcall timed out!");
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
    strcpy(v_all_fee_str, lpTSCall1Ans3->GetString(LDBIZ_ALL_FEE_STR_STR));

    //新增订单
    //调用过程[事务_交易证券_交易_新增组合批量订单]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("tdsecuT.4.45", 0);
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
    lpTSCall1Req4->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req4->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req4->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req4->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req4->SetString(LDBIZ_CRNCY_TYPE_STR_STR,v_crncy_type_str);
    lpTSCall1Req4->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR_STR,v_exch_crncy_type_str);
    lpTSCall1Req4->SetString(LDBIZ_BUY_REF_RATE_STR_STR,v_buy_ref_rate_str);
    lpTSCall1Req4->SetString(LDBIZ_SELL_REF_RATE_STR_STR,v_sell_ref_rate_str);
    lpTSCall1Req4->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req4->SetString(LDBIZ_STOCK_ACCO_NO_STR_STR,v_stock_acco_no_str);
    lpTSCall1Req4->SetString(LDBIZ_STOCK_ACCO_STR_STR,v_stock_acco_str);
    lpTSCall1Req4->SetString(LDBIZ_STOCK_CODE_NO_STR_STR,v_stock_code_no_str);
    lpTSCall1Req4->SetString(LDBIZ_STOCK_CODE_STR_STR,v_stock_code_str);
    lpTSCall1Req4->SetString(LDBIZ_TARGET_STOCK_CODE_STR_STR,v_target_stock_code_str);
    lpTSCall1Req4->SetString(LDBIZ_TARGET_STOCK_CODE_NO_STR_STR,v_target_stock_code_no_str);
    lpTSCall1Req4->SetString(LDBIZ_TRADE_CODE_NO_STR_STR,v_trade_code_no_str);
    lpTSCall1Req4->SetString(LDBIZ_TARGET_CODE_NO_STR_STR,v_target_code_no_str);
    lpTSCall1Req4->SetString(LDBIZ_ASSET_TYPE_STR_STR,v_asset_type_str);
    lpTSCall1Req4->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req4->SetString(LDBIZ_BUSI_LIMIT_STR_STR,v_busi_limit_str);
    lpTSCall1Req4->SetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR,v_exgp_busi_config_str);
    lpTSCall1Req4->SetDouble(LDBIZ_EXGP_AVAIL_AMT_FLOAT,v_exgp_avail_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_EXGP_T_HK_BUY_TOTAL_AMT_FLOAT,v_exgp_T_hk_buy_total_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_EXGP_T_HK_SELL_TOTAL_AMT_FLOAT,v_exgp_T_hk_sell_total_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_EXGP_T1_HK_BUY_TOTAL_AMT_FLOAT,v_exgp_T1_hk_buy_total_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_EXGP_T1_HK_SELL_TOTAL_AMT_FLOAT,v_exgp_T1_hk_sell_total_amt);
    lpTSCall1Req4->SetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR,v_asac_busi_config_str);
    lpTSCall1Req4->SetDouble(LDBIZ_ASAC_AVAIL_AMT_FLOAT,v_asac_avail_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_ASAC_T_HK_BUY_TOTAL_AMT_FLOAT,v_asac_T_hk_buy_total_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_ASAC_T_HK_SELL_TOTAL_AMT_FLOAT,v_asac_T_hk_sell_total_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_ASAC_T1_HK_BUY_TOTAL_AMT_FLOAT,v_asac_T1_hk_buy_total_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_ASAC_T1_HK_SELL_TOTAL_AMT_FLOAT,v_asac_T1_hk_sell_total_amt);
    lpTSCall1Req4->SetString(LDBIZ_EXGP_AVAIL_QTY_STR_STR,v_exgp_avail_qty_str);
    lpTSCall1Req4->SetString(LDBIZ_EXGP_TARGET_CODE_AVAIL_QTY_STR_STR,v_exgp_target_code_avail_qty_str);
    lpTSCall1Req4->SetString(LDBIZ_EXGP_TRADE_CODE_AVAIL_QTY_STR_STR,v_exgp_trade_code_avail_qty_str);
    lpTSCall1Req4->SetString(LDBIZ_ASAC_AVAIL_QTY_STR_STR,v_asac_avail_qty_str);
    lpTSCall1Req4->SetString(LDBIZ_ASAC_TARGET_CODE_AVAIL_QTY_STR_STR,v_asac_target_code_avail_qty_str);
    lpTSCall1Req4->SetString(LDBIZ_ASAC_TRADE_CODE_AVAIL_QTY_STR_STR,v_asac_trade_code_avail_qty_str);
    lpTSCall1Req4->SetDouble(LDBIZ_MARKET_PRICE_RATIO_FLOAT,v_market_price_ratio);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpTSCall1Req4->SetString(LDBIZ_ORDER_PRICE_STR_STR,v_order_price_str);
    lpTSCall1Req4->SetString(LDBIZ_ORDER_QTY_STR_STR,v_order_qty_str);
    lpTSCall1Req4->SetString(LDBIZ_ORDER_AMT_STR_STR,v_order_amt_str);
    lpTSCall1Req4->SetString(LDBIZ_PRICE_TYPE_STR_STR,v_price_type_str);
    lpTSCall1Req4->SetString(LDBIZ_ALL_FEE_STR_STR,v_all_fee_str);
    lpTSCall1Req4->SetString(LDBIZ_PAR_VALUE_STR_STR,v_par_value_str);
    lpTSCall1Req4->SetString(LDBIZ_INTRST_DAYS_STR_STR,v_intrst_days_str);
    lpTSCall1Req4->SetString(LDBIZ_IMPAWN_RATIO_STR_STR,v_impawn_ratio_str);
    lpTSCall1Req4->SetString(LDBIZ_NET_PRICE_FLAG_STR_STR,v_net_price_flag_str);
    lpTSCall1Req4->SetString(LDBIZ_BOND_ACCR_INTRST_STR_STR,v_bond_accr_intrst_str);
    lpTSCall1Req4->SetString(LDBIZ_BOND_RATE_TYPE_STR_STR,v_bond_rate_type_str);
    lpTSCall1Req4->SetString(LDBIZ_MIN_UNIT_STR_STR,v_min_unit_str);
    lpTSCall1Req4->SetString(LDBIZ_UP_LIMIT_PRICE_STR_STR,v_up_limit_price_str);
    lpTSCall1Req4->SetString(LDBIZ_DOWN_LIMIT_PRICE_STR_STR,v_down_limit_price_str);
    lpTSCall1Req4->SetString(LDBIZ_LAST_PRICE_STR_STR,v_last_price_str);
    lpTSCall1Req4->SetString(LDBIZ_CAPIT_REBACK_DAYS_STR_STR,v_capit_reback_days_str);
    lpTSCall1Req4->SetString(LDBIZ_POSI_REBACK_DAYS_STR_STR,v_posi_reback_days_str);
    lpTSCall1Req4->SetString(LDBIZ_SPLIT_STR_STR,v_split_str);
    lpTSCall1Req4->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
    lpTSCall1Req4->SetInt32(LDBIZ_COST_CALC_TYPE_INT,v_cost_calc_type);
    lpTSCall1Req4->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
    lpTSCall1Req4->SetDouble(LDBIZ_COMBO_COPIES_FLOAT,v_combo_copies);
    lpTSCall1Req4->SetString(LDBIZ_COMM_ID_STR_STR,v_comm_id_str);
    lpTSCall1Req4->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req4->SetString(LDBIZ_COMBO_POSI_ID_STR_STR,v_combo_posi_id_str);
    lpTSCall1Req4->SetString(LDBIZ_SUBSCRIPTION_TRADE_MARK_STR_STR,v_subscription_trade_mark_str);
    lpTSCall1Req4->SetString(LDBIZ_PURCHASE_TRADE_MARK_STR_STR,v_purchase_trade_mark_str);
    lpTSCall1Req4->SetString(LDBIZ_TARGET_PURCHASE_TRADE_MARK_STR_STR,v_target_purchase_trade_mark_str);
    lpTSCall1Req4->SetString(LDBIZ_REDE_TRADE_MARK_STR_STR,v_rede_trade_mark_str);
    lpTSCall1Req4->SetString(LDBIZ_FIRST_MINIMUM_AMT_STR_STR,v_first_minimum_amt_str);
    lpTSCall1Req4->SetString(LDBIZ_MINIMUM_PURCHASE_AMT_STR_STR,v_minimum_purchase_amt_str);
    lpTSCall1Req4->SetString(LDBIZ_MINIMUM_SUBSCRIPTION_AMT_STR_STR,v_minimum_subscription_amt_str);
    lpTSCall1Req4->SetString(LDBIZ_MINIMUM_REDE_SHARE_STR_STR,v_minimum_rede_share_str);
    lpTSCall1Req4->SetString(LDBIZ_MINIMUM_HOLDING_SHARE_STR_STR,v_minimum_holding_share_str);
    lpTSCall1Req4->SetString(LDBIZ_FUND_MANAGER_STR_STR,v_fund_manager_str);
    lpTSCall1Req4->SetString(LDBIZ_TARGET_FUND_MANAGER_STR_STR,v_target_fund_manager_str);
    lpTSCall1Req4->SetString(LDBIZ_CHARGING_METHOD_STR_STR,v_charging_method_str);
    lpTSCall1Req4->SetString(LDBIZ_TARGET_CHARGING_METHOD_STR_STR,v_target_charging_method_str);
    lpTSCall1Req4->SetInt32(LDBIZ_RECORD_COUNT_INT,v_record_count);
    lpTSCall1Req4->SetString(LDBIZ_REGISTRATION_AGENCY_STR_STR,v_registration_agency_str);
    lpTSCall1Req4->SetString(LDBIZ_TRADE_ACCO_STR,v_trade_acco);
    lpTSCall1Req4->SetInt32(LDBIZ_ASSET_ACCO_TYPE_INT,v_asset_acco_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.4.45]subcall timed out!");
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
    strcpy(v_order_id_str, lpTSCall1Ans4->GetString(LDBIZ_ORDER_ID_STR_STR));
    strcpy(v_order_status_str, lpTSCall1Ans4->GetString(LDBIZ_ORDER_STATUS_STR_STR));
    v_order_date = lpTSCall1Ans4->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_open_posi_date = lpTSCall1Ans4->GetInt32(LDBIZ_OPEN_POSI_DATE_INT);

    //主推

    // set @记录个数# = 0;
    v_record_count = 0;

    // set @临时_交易组资金更新次数# = 0;
    v_tmp_exgp_cash_update_times = 0;

    // set @临时_资产账户资金更新次数# = 0;
    v_tmp_asac_cash_update_times = 0;

    // set @临时_汇总指令更新次数# = 0;
    v_tmp_sum_comm_update_times = 0;

    // set @交易组提交质押数量# = 0;
    v_exgp_put_impawn_qty = 0;

    // set @资产账户提交质押数量# = 0;
    v_asac_put_impawn_qty = 0;
    //调用过程[事务_交易证券_主推接口_获取批量订单信息]
    //组织事务请求
    if(lpTSCall1Ans5)
    {
      lpTSCall1Ans5->FreeMsg();
      lpTSCall1Ans5=NULL;
    }
    lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.25", 0);
    lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req5->SetString(LDBIZ_ORDER_ID_STR_STR,v_order_id_str);
    lpTSCall1Req5->SetString(LDBIZ_SPLIT_STR_STR,v_split_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
    if(!lpTSCall1Ans5)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.25]subcall timed out!");
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


    // [获取结果集][lpMainMsg]
    lpMainMsg=lpTSCall1Ans5->GetGroup(LDTAG_NO_RESULTSET);


    // [遍历结果集开始][lpMainMsg]
    iRecordCount = lpMainMsg->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpMainMsg->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            v_order_id = lpRecord->GetInt64(LDBIZ_ORDER_ID_INT64);
            v_busi_opor_no = lpRecord->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
            v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
            v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
            v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
            v_stock_type = lpRecord->GetInt32(LDBIZ_STOCK_TYPE_INT);
            v_pass_no = lpRecord->GetInt32(LDBIZ_PASS_NO_INT);
            v_external_no = lpRecord->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
            strcpy(v_out_acco, lpRecord->GetString(LDBIZ_OUT_ACCO_STR));
            strcpy(v_exch_crncy_type, lpRecord->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
            v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
            strcpy(v_stock_code, lpRecord->GetString(LDBIZ_STOCK_CODE_STR));
            strcpy(v_stock_acco, lpRecord->GetString(LDBIZ_STOCK_ACCO_STR));
            v_comm_id = lpRecord->GetInt64(LDBIZ_COMM_ID_INT64);
            v_comm_batch_no = lpRecord->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
            v_order_batch_no = lpRecord->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
            v_order_dir = lpRecord->GetInt32(LDBIZ_ORDER_DIR_INT);
            v_order_qty = lpRecord->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
            v_order_price = lpRecord->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
            v_order_time = lpRecord->GetInt32(LDBIZ_ORDER_TIME_INT);
            v_wtdraw_qty = lpRecord->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
            v_report_date = lpRecord->GetInt32(LDBIZ_REPORT_DATE_INT);
            v_report_time = lpRecord->GetInt32(LDBIZ_REPORT_TIME_INT);
            strcpy(v_report_no, lpRecord->GetString(LDBIZ_REPORT_NO_STR));
            v_par_value = lpRecord->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
            v_impawn_ratio = lpRecord->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
            strcpy(v_rsp_info, lpRecord->GetString(LDBIZ_RSP_INFO_STR));
            v_strike_amt = lpRecord->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
            v_strike_qty = lpRecord->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
            v_strike_bond_accr_intrst = lpRecord->GetDouble(LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
            v_price_type = lpRecord->GetInt32(LDBIZ_PRICE_TYPE_INT);
            strcpy(v_order_oper_way, lpRecord->GetString(LDBIZ_ORDER_OPER_WAY_STR));
            strcpy(v_order_status, lpRecord->GetString(LDBIZ_ORDER_STATUS_STR));
            v_order_frozen_amt = lpRecord->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
            v_order_frozen_qty = lpRecord->GetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT);
            v_net_price_flag = lpRecord->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
            v_bond_accr_intrst = lpRecord->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
            v_bond_rate_type = lpRecord->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);
            v_order_date = lpRecord->GetInt32(LDBIZ_ORDER_DATE_INT);
            strcpy(v_combo_code, lpRecord->GetString(LDBIZ_COMBO_CODE_STR));
            v_combo_posi_id = lpRecord->GetInt64(LDBIZ_COMBO_POSI_ID_INT64);
            v_strategy_id = lpRecord->GetInt64(LDBIZ_STRATEGY_ID_INT64);
            strcpy(v_registration_agency, lpRecord->GetString(LDBIZ_REGISTRATION_AGENCY_STR));
            strcpy(v_trade_acco, lpRecord->GetString(LDBIZ_TRADE_ACCO_STR));
            strcpy(v_contra_no, lpRecord->GetString(LDBIZ_CONTRA_NO_STR));
            v_asset_acco_type = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);


        // set @当笔成交价格# = 0;
        v_curr_strike_price = 0;

        // set @当笔成交金额# = 0;
        v_curr_strike_amt = 0;

        // set @当笔成交数量# = 0;
        v_curr_strike_qty = 0;

        // set @成交序号# = 0;
        v_strike_id = 0;

        // set @全部费用# =0;
        v_all_fee =0;

        // set @策略序号# = 0;
        v_strategy_id = 0;

        // set @撤单状态# = "0";
        strcpy(v_wtdraw_status,"0");
       //调用过程[事务_交易证券_交易_根据交易时间控制报盘主推]
       //组织事务请求
       if(lpTSCall1Ans6)
       {
         lpTSCall1Ans6->FreeMsg();
         lpTSCall1Ans6=NULL;
       }
       lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdsecuT.4.124", 0);
       lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
       lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
       lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
       lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
       lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
       lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
       lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
       lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
       lpTSCall1Req6->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
       lpTSCall1Req6->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
       glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
       if(!lpTSCall1Ans6)  //  超时错误
       {
           lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
           lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.4.124]subcall timed out!");
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
       v_trade_time_flag = lpTSCall1Ans6->GetInt32(LDBIZ_TRADE_TIME_FLAG_INT);


        // if @交易时间标志# =1 then
        if (v_trade_time_flag ==1)
        {

        // [主动推送][secu.ztrptorder][证券主推_报盘_中泰订单主推报盘消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.926", 0);
        lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
        lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpPubMsg->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpPubMsg->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpPubMsg->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
        lpPubMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
        lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
        lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpPubMsg->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
        lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
        lpPubMsg->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
        lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
        lpPubMsg->SetString(LDBIZ_TRADE_ACCO_STR,v_trade_acco);
        lpPubMsg->SetString(LDBIZ_REGISTRATION_AGENCY_STR,v_registration_agency);
        lpPubMsg->SetString(LDBIZ_LONG_TOKEN_STR,v_long_token);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("secu.ztrptorder", lpPubMsg);

        // end if;
        }


        // [主动推送][secu.order][证券主推_订单_订单主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.20", 0);
        lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
        lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
        lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
        lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
        lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
        lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpPubMsg->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
        lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
        lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
        lpPubMsg->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
        lpPubMsg->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
        lpPubMsg->SetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT,v_order_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT,v_order_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
        lpPubMsg->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
        lpPubMsg->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
        lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
        lpPubMsg->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
        lpPubMsg->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
        lpPubMsg->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
        lpPubMsg->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
        lpPubMsg->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
        lpPubMsg->SetString(LDBIZ_RSP_INFO_STR,v_rsp_info);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT,v_strike_bond_accr_intrst);
        lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
        lpPubMsg->SetDouble(LDBIZ_CURR_STRIKE_QTY_FLOAT,v_curr_strike_qty);
        lpPubMsg->SetDouble(LDBIZ_CURR_STRIKE_AMT_FLOAT,v_curr_strike_amt);
        lpPubMsg->SetDouble(LDBIZ_CURR_STRIKE_PRICE_FLOAT,v_curr_strike_price);
        lpPubMsg->SetInt64(LDBIZ_STRIKE_ID_INT64,v_strike_id);
        lpPubMsg->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
        lpPubMsg->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
        lpPubMsg->SetInt64(LDBIZ_COMBO_POSI_ID_INT64,v_combo_posi_id);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_TYPE_INT,v_asset_acco_type);
        lpPubMsg->SetString(LDBIZ_CONTRA_NO_STR,v_contra_no);
        lpPubMsg->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("secu.order", lpPubMsg);

        //调用过程[事务_交易证券_主推接口_获取资金持仓信息]
        //组织事务请求
        if(lpTSCall1Ans7)
        {
          lpTSCall1Ans7->FreeMsg();
          lpTSCall1Ans7=NULL;
        }
        lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.13", 0);
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
        lpTSCall1Req7->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req7->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req7->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req7->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
        if(!lpTSCall1Ans7)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.13]subcall timed out!");
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
        v_exgp_cash_id = lpTSCall1Ans7->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
        v_exgp_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
        v_exgp_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
        v_exgp_comm_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
        v_exgp_comm_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
        v_exgp_comm_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
        v_exgp_comm_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
        v_exgp_trade_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT);
        v_exgp_trade_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT);
        v_exgp_trade_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
        v_exgp_trade_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
        v_exgp_strike_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
        v_exgp_strike_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
        v_exgp_cash_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
        v_exgp_posi_id = lpTSCall1Ans7->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
        v_exgp_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
        v_exgp_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
        v_exgp_comm_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT);
        v_exgp_comm_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT);
        v_exgp_comm_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT);
        v_exgp_comm_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
        v_exgp_trade_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT);
        v_exgp_trade_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT);
        v_exgp_trade_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT);
        v_exgp_trade_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
        v_exgp_strike_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT);
        v_exgp_strike_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
        v_exgp_strike_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT);
        v_exgp_strike_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT);
        v_exgp_realize_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
        v_exgp_cost_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
        v_exgp_intrst_cost_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
        v_exgp_intrst_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
        v_exgp_posi_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
        v_asac_cash_id = lpTSCall1Ans7->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
        v_asac_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
        v_asac_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
        v_asac_comm_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
        v_asac_comm_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
        v_asac_comm_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
        v_asac_comm_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
        v_asac_trade_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT);
        v_asac_trade_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT);
        v_asac_trade_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
        v_asac_trade_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
        v_asac_strike_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
        v_asac_strike_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
        v_asac_cash_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);
        v_asac_posi_id = lpTSCall1Ans7->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
        v_asac_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
        v_asac_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
        v_asac_comm_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT);
        v_asac_comm_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT);
        v_asac_comm_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT);
        v_asac_comm_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
        v_asac_trade_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT);
        v_asac_trade_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT);
        v_asac_trade_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT);
        v_asac_trade_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
        v_asac_strike_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT);
        v_asac_strike_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
        v_asac_strike_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT);
        v_asac_strike_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT);
        v_asac_realize_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
        v_asac_cost_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
        v_asac_intrst_cost_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
        v_asac_intrst_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
        v_asac_posi_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


        // if @临时_交易组资金更新次数# <> @交易组资金更新次数# then
        if (v_tmp_exgp_cash_update_times != v_exgp_cash_update_times)
        {

            // set @临时_交易组资金更新次数# = @交易组资金更新次数#;
            v_tmp_exgp_cash_update_times = v_exgp_cash_update_times;

            // [主动推送][secu.exgpcapital][证券主推_资金_交易组资金主推消息]
            lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.50", 0);
            lpPubMsg->SetInt64(LDBIZ_EXGP_CASH_ID_INT64,v_exgp_cash_id);
            lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
            lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
            lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
            lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
            lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
            lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT,v_exgp_comm_frozen_amt);
            lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT,v_exgp_comm_unfroz_amt);
            lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT,v_exgp_comm_capt_amt);
            lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT,v_exgp_comm_releas_amt);
            lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT,v_exgp_trade_frozen_amt);
            lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT,v_exgp_trade_unfroz_amt);
            lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT,v_exgp_trade_capt_amt);
            lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT,v_exgp_trade_releas_amt);
            lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT,v_exgp_strike_capt_amt);
            lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT,v_exgp_strike_releas_amt);
            lpPubMsg->SetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT,v_exgp_cash_update_times);
            glpPubSub_Interface->PubTopics("secu.exgpcapital", lpPubMsg);

        // end if;
        }


        // [主动推送][secu.exgpposi][证券主推_持仓_交易组持仓主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.60", 0);
        lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT,v_exgp_comm_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT,v_exgp_comm_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT,v_exgp_comm_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT,v_exgp_trade_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT,v_exgp_trade_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT,v_exgp_trade_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT,v_exgp_strike_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT,v_exgp_strike_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT,v_exgp_strike_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
        lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
        lpPubMsg->SetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT,v_exgp_put_impawn_qty);
        glpPubSub_Interface->PubTopics("secu.exgpposi", lpPubMsg);


        // if @临时_资产账户资金更新次数# <> @资产账户资金更新次数# then
        if (v_tmp_asac_cash_update_times != v_asac_cash_update_times)
        {

            // set @临时_资产账户资金更新次数# = @资产账户资金更新次数#;
            v_tmp_asac_cash_update_times = v_asac_cash_update_times;

            // [主动推送][secu.asaccapital][证券主推_资金_资产账户资金主推消息]
            lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.51", 0);
            lpPubMsg->SetInt64(LDBIZ_ASAC_CASH_ID_INT64,v_asac_cash_id);
            lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
            lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
            lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT,v_asac_frozen_amt);
            lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT,v_asac_unfroz_amt);
            lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT,v_asac_comm_frozen_amt);
            lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT,v_asac_comm_unfroz_amt);
            lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT,v_asac_comm_capt_amt);
            lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT,v_asac_comm_releas_amt);
            lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT,v_asac_trade_frozen_amt);
            lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT,v_asac_trade_unfroz_amt);
            lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT,v_asac_trade_capt_amt);
            lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT,v_asac_trade_releas_amt);
            lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT,v_asac_strike_capt_amt);
            lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT,v_asac_strike_releas_amt);
            lpPubMsg->SetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT,v_asac_cash_update_times);
            glpPubSub_Interface->PubTopics("secu.asaccapital", lpPubMsg);

        // end if;
        }


        // [主动推送][secu.asacposi][证券主推_持仓_资产账户持仓主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.61", 0);
        lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT,v_asac_comm_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT,v_asac_comm_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT,v_asac_comm_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT,v_asac_trade_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT,v_asac_trade_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT,v_asac_trade_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT,v_asac_strike_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT,v_asac_strike_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT,v_asac_strike_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
        lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
        lpPubMsg->SetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT,v_asac_put_impawn_qty);
        glpPubSub_Interface->PubTopics("secu.asacposi", lpPubMsg);

        //调用过程[事务_交易证券_主推接口_获取组合持仓]
        //组织事务请求
        if(lpTSCall1Ans8)
        {
          lpTSCall1Ans8->FreeMsg();
          lpTSCall1Ans8=NULL;
        }
        lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.43", 0);
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
        lpTSCall1Req8->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req8->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
        lpTSCall1Req8->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req8->SetInt32(LDBIZ_OPEN_POSI_DATE_INT,v_open_posi_date);
        lpTSCall1Req8->SetInt64(LDBIZ_COMBO_POSI_ID_INT64,v_combo_posi_id);
        glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
        if(!lpTSCall1Ans8)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.43]subcall timed out!");
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
        v_co_no = lpTSCall1Ans8->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans8->GetInt32(LDBIZ_PD_NO_INT);
        strcpy(v_stock_code, lpTSCall1Ans8->GetString(LDBIZ_STOCK_CODE_STR));
        v_exch_no = lpTSCall1Ans8->GetInt32(LDBIZ_EXCH_NO_INT);
        v_curr_qty = lpTSCall1Ans8->GetDouble(LDBIZ_CURR_QTY_FLOAT);
        v_posi_qty = lpTSCall1Ans8->GetDouble(LDBIZ_POSI_QTY_FLOAT);
        v_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_FROZEN_QTY_FLOAT);
        v_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_UNFROZ_QTY_FLOAT);
        v_pre_settle_qty = lpTSCall1Ans8->GetDouble(LDBIZ_PRE_SETTLE_QTY_FLOAT);
        v_trade_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_TRADE_FROZEN_QTY_FLOAT);
        v_trade_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
        v_trade_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_TRADE_CAPT_QTY_FLOAT);
        v_trade_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_TRADE_RELEAS_QTY_FLOAT);
        v_strike_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_STRIKE_CAPT_QTY_FLOAT);
        v_strike_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
        v_strike_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
        v_strike_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
        v_realize_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_REALIZE_PANDL_FLOAT);
        v_cost_amt = lpTSCall1Ans8->GetDouble(LDBIZ_COST_AMT_FLOAT);
        v_intrst_cost_amt = lpTSCall1Ans8->GetDouble(LDBIZ_INTRST_COST_AMT_FLOAT);
        v_intrst_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_INTRST_PANDL_FLOAT);
        v_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_UPDATE_TIMES_INT);


        // [主动推送][secu.comboposi][证券主推_组合_组合持仓主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.905", 0);
        lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
        lpPubMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetInt32(LDBIZ_OPEN_POSI_DATE_INT,v_open_posi_date);
        lpPubMsg->SetDouble(LDBIZ_POSI_QTY_FLOAT,v_posi_qty);
        lpPubMsg->SetDouble(LDBIZ_CURR_QTY_FLOAT,v_curr_qty);
        lpPubMsg->SetDouble(LDBIZ_FROZEN_QTY_FLOAT,v_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_UNFROZ_QTY_FLOAT,v_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_PRE_SETTLE_QTY_FLOAT,v_pre_settle_qty);
        lpPubMsg->SetDouble(LDBIZ_TRADE_FROZEN_QTY_FLOAT,v_trade_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_TRADE_UNFROZ_QTY_FLOAT,v_trade_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_TRADE_CAPT_QTY_FLOAT,v_trade_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_TRADE_RELEAS_QTY_FLOAT,v_trade_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_CAPT_QTY_FLOAT,v_strike_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_RELEAS_QTY_FLOAT,v_strike_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_FROZEN_QTY_FLOAT,v_strike_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_STRIKE_UNFROZ_QTY_FLOAT,v_strike_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_REALIZE_PANDL_FLOAT,v_realize_pandl);
        lpPubMsg->SetDouble(LDBIZ_COST_AMT_FLOAT,v_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_INTRST_COST_AMT_FLOAT,v_intrst_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_INTRST_PANDL_FLOAT,v_intrst_pandl);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("secu.comboposi", lpPubMsg);


    // [遍历结果集结束][lpMainMsg]
        }
    }

    //组合主推
    //调用过程[事务_交易证券_主推接口_获取组合交易流水记录]
    //组织事务请求
    if(lpTSCall1Ans9)
    {
      lpTSCall1Ans9->FreeMsg();
      lpTSCall1Ans9=NULL;
    }
    lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.42", 0);
    lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req9->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpTSCall1Req9->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
    glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
    if(!lpTSCall1Ans9)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.42]subcall timed out!");
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
    v_co_no = lpTSCall1Ans9->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans9->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans9->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_order_dir = lpTSCall1Ans9->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_combo_copies = lpTSCall1Ans9->GetDouble(LDBIZ_COMBO_COPIES_FLOAT);
    v_combo_date = lpTSCall1Ans9->GetInt32(LDBIZ_COMBO_DATE_INT);
    v_combo_time = lpTSCall1Ans9->GetInt32(LDBIZ_COMBO_TIME_INT);
    v_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // [主动推送][secu.combotradelog][证券主推_组合_组合交易记录流水主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.907", 0);
    lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
    lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpPubMsg->SetDouble(LDBIZ_COMBO_COPIES_FLOAT,v_combo_copies);
    lpPubMsg->SetInt32(LDBIZ_COMBO_DATE_INT,v_combo_date);
    lpPubMsg->SetInt32(LDBIZ_COMBO_TIME_INT,v_combo_time);
    glpPubSub_Interface->PubTopics("secu.combotradelog", lpPubMsg);

    //调用过程[事务_交易证券_主推接口_获取组合收益]
    //组织事务请求
    if(lpTSCall1Ans10)
    {
      lpTSCall1Ans10->FreeMsg();
      lpTSCall1Ans10=NULL;
    }
    lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.44", 0);
    lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req10->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req10->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req10->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req10->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req10->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
    glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
    if(!lpTSCall1Ans10)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.44]subcall timed out!");
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
    v_open_posi_date = lpTSCall1Ans10->GetInt32(LDBIZ_OPEN_POSI_DATE_INT);
    v_combo_copies = lpTSCall1Ans10->GetDouble(LDBIZ_COMBO_COPIES_FLOAT);
    strcpy(v_combo_status, lpTSCall1Ans10->GetString(LDBIZ_COMBO_STATUS_STR));
    v_combo_cost = lpTSCall1Ans10->GetDouble(LDBIZ_COMBO_COST_FLOAT);
    v_combo_market_value = lpTSCall1Ans10->GetDouble(LDBIZ_COMBO_MARKET_VALUE_FLOAT);
    v_realize_pandl = lpTSCall1Ans10->GetDouble(LDBIZ_REALIZE_PANDL_FLOAT);
    v_sum_realize_pandl = lpTSCall1Ans10->GetDouble(LDBIZ_SUM_REALIZE_PANDL_FLOAT);
    v_update_times = lpTSCall1Ans10->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // [主动推送][secu.comboincome][证券主推_组合_组合收益主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.906", 0);
    lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_OPEN_POSI_DATE_INT,v_open_posi_date);
    lpPubMsg->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
    lpPubMsg->SetDouble(LDBIZ_COMBO_COPIES_FLOAT,v_combo_copies);
    lpPubMsg->SetString(LDBIZ_COMBO_STATUS_STR,v_combo_status);
    lpPubMsg->SetDouble(LDBIZ_COMBO_COST_FLOAT,v_combo_cost);
    lpPubMsg->SetDouble(LDBIZ_COMBO_MARKET_VALUE_FLOAT,v_combo_market_value);
    lpPubMsg->SetDouble(LDBIZ_REALIZE_PANDL_FLOAT,v_realize_pandl);
    lpPubMsg->SetDouble(LDBIZ_SUM_REALIZE_PANDL_FLOAT,v_sum_realize_pandl);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("secu.comboincome", lpPubMsg);


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
    lpOutBizMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpOutBizMsg->SetString(LDBIZ_OPER_STATN_STR,v_oper_statn);
    lpOutBizMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpOutBizMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpOutBizMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpOutBizMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpOutBizMsg->SetString(LDBIZ_ORDER_ID_STR_STR,v_order_id_str);
    lpOutBizMsg->SetString(LDBIZ_ORDER_STATUS_STR_STR,v_order_status_str);
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
    return iRet;
}

//逻辑_交易证券_中泰_撤销订单
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
    int v_order_date;
    int64 v_order_id;
    char v_long_token[1025];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_pass_no;
    char v_out_acco[33];
    int v_exch_no;
    char v_stock_acco[17];
    char v_stock_code[7];
    char v_report_no[33];
    int64 v_external_no;
    char v_order_status[3];
    int64 v_wtdraw_id;
    double v_wtdraw_qty;
    char v_wtdraw_status[3];
    int v_busi_opor_no;
    char v_order_oper_way[3];
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    int v_stock_type;
    int v_asset_type;
    int64 v_comm_id;
    int v_comm_batch_no;
    int v_order_time;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    double v_order_frozen_amt;
    int v_price_type;
    double v_strike_qty;
    double v_strike_amt;
    double v_all_fee;
    int v_wtdraw_time;
    int v_net_price_flag;
    double v_bond_accr_intrst;
    int v_bond_rate_type;
    double v_par_value;
    double v_impawn_ratio;
    char v_combo_code[33];
    int64 v_combo_posi_id;
    int64 v_strategy_id;
    char v_contra_no[33];
    int v_asset_acco_type;
    int v_exist_debt_flag;
    int v_init_date;
    char v_sys_config_str[65];
    char v_co_busi_config_str[65];
    char v_exgp_busi_config_str[65];
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    double v_buy_ref_rate;
    double v_sell_ref_rate;
    int v_intrst_days;
    int v_target_code_no;
    char v_target_code[7];
    int v_target_code_stock_type;
    int v_target_code_asset_type;
    int v_trade_code_no;
    char v_trade_code[7];
    int v_trade_code_stock_type;
    int v_trade_code_asset_type;
    int v_min_unit;
    double v_up_limit_price;
    double v_down_limit_price;
    double v_last_price;
    int v_capit_reback_days;
    int v_posi_reback_days;
    int v_apply_date;
    int v_subscription_trade_mark;
    int v_purchase_trade_mark;
    int v_rede_trade_mark;
    double v_first_minimum_amt;
    double v_minimum_purchase_amt;
    double v_minimum_subscription_amt;
    double v_minimum_rede_share;
    double v_minimum_holding_share;
    char v_trade_acco[33];
    char v_busi_config_str[65];
    char v_busi_ctrl_str[65];
    char v_asac_busi_config_str[65];
    char v_split_fee_typr_str[65];
    char v_busi_limit_str[2049];
    double v_nav_asset;
    int v_exter_comm_flag;
    double v_market_price_ratio;
    int v_market_price_type;
    int v_cost_calc_type;
    double v_order_market_price;
    int v_sys_type;
    char v_opor_no_str1[2049];
    char v_opor_no_str2[2049];
    char v_opor_no_str3[2049];
    double v_fina_limit_max;
    double v_loan_limit_max;
    int v_sell_auto_back_debt;
    int v_comm_date;
    int v_comm_executor;
    int v_wtdraw_date;
    int v_order_batch_no;
    double v_order_frozen_qty;
    int v_report_date;
    int v_report_time;
    char v_rsp_info[256];
    double v_strike_bond_accr_intrst;
    int v_open_posi_date;
    int v_update_times;
    double v_curr_strike_price;
    double v_curr_strike_amt;
    double v_curr_strike_qty;
    int64 v_strike_id;
    int v_trade_time_flag;
    int v_wtdraw_batch_no;
    char v_wtdraw_remark[256];
    int v_comm_time;
    int v_comm_opor;
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
    int v_comm_appr_oper;
    char v_comm_appr_remark[256];
    int64 v_basket_id;
    char v_comm_oper_way[3];
    int v_comm_comple_flag;
    double v_strategy_capt_qty;
    double v_strategy_order_qty;
    char v_comm_remark_info[1025];
    int v_disp_opor;
    int v_disp_status;
    int v_read_flag;
    int64 v_sum_comm_row_id;
    int v_sum_comm_co_no;
    int v_sum_comm_pd_no;
    int v_sum_comm_exch_group_no;
    int v_sum_comm_asset_acco_no;
    int v_sum_comm_pass_no;
    char v_sum_comm_out_acco[33];
    char v_sum_comm_exch_crncy_type[4];
    int v_sum_comm_stock_code_no;
    int v_sum_comm_date;
    int v_sum_comm_time;
    int v_sum_comm_batch_no;
    int v_sum_comm_opor;
    int v_sum_comm_executor;
    int v_sum_comm_dir;
    double v_sum_comm_limit_price;
    double v_sum_comm_qty;
    double v_sum_comm_amt;
    double v_sum_comm_order_qty;
    double v_sum_comm_cancel_qty;
    double v_sum_comm_await_cancel_qty;
    double v_sum_comm_strike_amt;
    double v_sum_comm_strike_qty;
    char v_sum_comm_strike_status[3];
    char v_comm_sum_status[3];
    int v_sum_comm_begin_date;
    int v_sum_comm_end_date;
    int v_sum_comm_begin_time;
    int v_sum_comm_end_time;
    int v_sum_comm_comple_date;
    int v_sum_comm_comple_time;
    int v_sum_comm_max_comm_comple_date;
    int v_sum_comm_max_comm_comple_time;
    int v_sum_comm_appr_date;
    int v_sum_comm_appr_time;
    double v_sum_comm_appr_qty;
    char v_comm_sum_approve_status[3];
    int64 v_sum_comm_basket_id;
    int v_sum_comm_net_price_flag;
    double v_sum_comm_bond_accr_intrst;
    int v_sum_comm_bond_rate_type;
    char v_sum_comm_oper_way[3];
    int v_sum_comm_exter_comm_flag;
    double v_sum_buy_order_qty;
    double v_sum_sell_order_qty;
    double v_sum_buy_comm_qty;
    double v_sum_sell_comm_qty;
    double v_sum_buy_strike_qty;
    double v_sum_sell_strike_qty;
    double v_sum_buy_strike_amt;
    double v_sum_sell_strike_amt;
    double v_sum_buy_comm_amt;
    double v_sum_sell_comm_amt;
    char v_sum_comm_remark_info[256];
    int v_sum_comm_update_times;
    char v_acco_concat_info[4097];
    int64 v_sum_order_row_id;
    int v_sum_order_opor_no;
    int v_sum_order_co_no;
    int v_sum_order_pd_no;
    int v_sum_order_exch_group_no;
    int v_sum_order_asset_acco_no;
    int v_sum_order_pass_no;
    char v_sum_order_exch_crncy_type[4];
    int v_sum_order_stock_code_no;
    int v_sum_order_trade_code_no;
    int v_sum_order_target_code_no;
    int64 v_sum_order_external_no;
    int v_sum_order_date;
    int v_sum_order_batch_no;
    int v_sum_order_dir;
    int v_sum_order_price_type;
    double v_sum_order_price;
    double v_sum_order_qty;
    char v_order_sum_status[3];
    double v_sum_order_wtdraw_qty;
    double v_sum_order_waste_qty;
    double v_sum_order_strike_amt;
    double v_sum_order_strike_qty;
    double v_sum_order_strike_aver_price;
    int v_sum_order_net_price_flag;
    double v_sum_order_bond_accr_intrst;
    int v_sum_order_bond_rate_type;
    double v_sum_order_par_value;
    double v_sum_order_impawn_ratio;
    char v_sum_order_oper_way[3];
    int v_sum_order_update_times;
    int64 v_sum_strike_row_id;
    int v_sum_strike_opor_no;
    int v_sum_strike_co_no;
    int v_sum_strike_pd_no;
    int v_sum_strike_exch_group_no;
    int v_sum_strike_asset_acco_no;
    int v_sum_strike_pass_no;
    char v_sum_strike_out_acco[33];
    int v_sum_strike_stock_acco_no;
    int v_sum_strike_stock_code_no;
    int64 v_sum_strike_comm_id;
    int v_sum_strike_report_date;
    char v_sum_strike_report_no[33];
    int v_sum_strike_order_date;
    int64 v_sum_strike_order_id;
    int v_sum_strike_order_dir;
    double v_sum_strike_order_price;
    double v_sum_strike_order_qty;
    double v_sum_strike_strike_qty;
    double v_sum_strike_strike_amt;
    double v_sum_strike_all_fee;
    double v_sum_strike_stamp_tax;
    double v_sum_strike_trans_fee;
    double v_sum_strike_brkage_fee;
    double v_sum_strike_SEC_charges;
    double v_sum_strike_other_fee;
    double v_sum_strike_trade_commis;
    double v_sum_strike_other_commis;
    double v_sum_trade_tax;
    double v_sum_trade_cost_fee;
    double v_sum_trade_system_use_fee;
    double v_sum_stock_settle_fee;
    int v_sum_strike_net_price_flag;
    double v_sum_strike_bond_accr_intrst;
    int v_sum_strike_bond_rate_type;
    char v_sum_strike_order_oper_way[3];
    int v_sum_strike_exter_comm_flag;
    int v_sum_strike_update_times;
    int v_sum_strike_order_batch_no;
    int64 v_sum_external_no;
    int64 v_exgp_cash_id;
    double v_exgp_frozen_amt;
    double v_exgp_unfroz_amt;
    double v_exgp_comm_frozen_amt;
    double v_exgp_comm_unfroz_amt;
    double v_exgp_comm_capt_amt;
    double v_exgp_comm_releas_amt;
    double v_exgp_trade_frozen_amt;
    double v_exgp_trade_unfroz_amt;
    double v_exgp_trade_capt_amt;
    double v_exgp_trade_releas_amt;
    double v_exgp_strike_capt_amt;
    double v_exgp_strike_releas_amt;
    int v_exgp_cash_update_times;
    int64 v_exgp_posi_id;
    double v_exgp_frozen_qty;
    double v_exgp_unfroz_qty;
    double v_exgp_comm_frozen_qty;
    double v_exgp_comm_unfroz_qty;
    double v_exgp_comm_capt_qty;
    double v_exgp_comm_releas_qty;
    double v_exgp_trade_frozen_qty;
    double v_exgp_trade_unfroz_qty;
    double v_exgp_trade_capt_qty;
    double v_exgp_trade_releas_qty;
    double v_exgp_strike_capt_qty;
    double v_exgp_strike_releas_qty;
    double v_exgp_strike_frozen_qty;
    double v_exgp_strike_unfroz_qty;
    double v_exgp_realize_pandl;
    double v_exgp_cost_amt;
    double v_exgp_intrst_cost_amt;
    double v_exgp_intrst_pandl;
    int v_exgp_posi_update_times;
    int64 v_asac_cash_id;
    double v_asac_frozen_amt;
    double v_asac_unfroz_amt;
    double v_asac_comm_frozen_amt;
    double v_asac_comm_unfroz_amt;
    double v_asac_comm_capt_amt;
    double v_asac_comm_releas_amt;
    double v_asac_trade_frozen_amt;
    double v_asac_trade_unfroz_amt;
    double v_asac_trade_capt_amt;
    double v_asac_trade_releas_amt;
    double v_asac_strike_capt_amt;
    double v_asac_strike_releas_amt;
    int v_asac_cash_update_times;
    int64 v_asac_posi_id;
    double v_asac_frozen_qty;
    double v_asac_unfroz_qty;
    double v_asac_comm_frozen_qty;
    double v_asac_comm_unfroz_qty;
    double v_asac_comm_capt_qty;
    double v_asac_comm_releas_qty;
    double v_asac_trade_frozen_qty;
    double v_asac_trade_unfroz_qty;
    double v_asac_trade_capt_qty;
    double v_asac_trade_releas_qty;
    double v_asac_strike_capt_qty;
    double v_asac_strike_releas_qty;
    double v_asac_strike_frozen_qty;
    double v_asac_strike_unfroz_qty;
    double v_asac_realize_pandl;
    double v_asac_cost_amt;
    double v_asac_intrst_cost_amt;
    double v_asac_intrst_pandl;
    int v_asac_posi_update_times;
    int64 v_exgp_target_posi_id;
    double v_exgp_target_frozen_qty;
    double v_exgp_target_unfroz_qty;
    double v_exgp_target_comm_frozen_qty;
    double v_exgp_target_comm_unfroz_qty;
    double v_exgp_target_comm_capt_qty;
    double v_exgp_target_comm_releas_qty;
    double v_exgp_target_trade_frozen_qty;
    double v_exgp_target_trade_unfroz_qty;
    double v_exgp_target_trade_capt_qty;
    double v_exgp_target_trade_releas_qty;
    double v_exgp_target_strike_capt_qty;
    double v_exgp_target_strike_releas_qty;
    double v_exgp_target_strike_frozen_qty;
    double v_exgp_target_strike_unfroz_qty;
    double v_exgp_target_realize_pandl;
    double v_exgp_target_cost_amt;
    double v_exgp_target_intrst_cost_amt;
    double v_exgp_target_intrst_pandl;
    int v_exgp_target_posi_update_times;
    int64 v_asac_target_posi_id;
    double v_asac_target_frozen_qty;
    double v_asac_target_unfroz_qty;
    double v_asac_target_comm_frozen_qty;
    double v_asac_target_comm_unfroz_qty;
    double v_asac_target_comm_capt_qty;
    double v_asac_target_comm_releas_qty;
    double v_asac_target_trade_frozen_qty;
    double v_asac_target_trade_unfroz_qty;
    double v_asac_target_trade_capt_qty;
    double v_asac_target_trade_releas_qty;
    double v_asac_target_strike_capt_qty;
    double v_asac_target_strike_releas_qty;
    double v_asac_target_strike_frozen_qty;
    double v_asac_target_strike_unfroz_qty;
    double v_asac_target_realize_pandl;
    double v_asac_target_cost_amt;
    double v_asac_target_intrst_cost_amt;
    double v_asac_target_intrst_pandl;
    int v_asac_target_posi_update_times;
    double v_exgp_put_impawn_qty;
    double v_asac_put_impawn_qty;
    int64 v_row_id;
    double v_source_stock_qty;
    double v_single_limit_qty;
    double v_assigned_qty;
    double v_trade_releas_qty;
    double v_trade_capt_qty;
    double v_strike_releas_qty;
    double v_strike_capt_qty;
    double v_over_night_pandl;
    double v_sum_realize_pandl;
    double v_total_open_posi_fee;
    double v_total_close_posi_fee;
    double v_out_order_releas_qty;
    double v_out_order_capt_qty;
    double v_out_strike_releas_qty;
    double v_out_strike_capt_qty;
    char v_remark_info[256];
    double v_buy_avail_qty;
    double v_sell_avail_qty;
    double v_posi_qty;
    double v_today_trade_fee;
    double v_today_pandl;
    double v_diff_qty;
    double v_over_night_trade_buy_qty;
    double v_over_night_trade_sell_qty;
    double v_over_night_strike_sell_qty;
    double v_over_night_sumtrd_sell_qty;
    double v_over_night_sumstk_sell_qty;
    double v_trade_amt;
    double v_trade_qty;
    double v_realize_pandl;
    double v_yield_rate;
    double v_avail_amt;
    double v_begin_amt;
    double v_curr_amt;
    double v_frozen_amt;
    double v_unfroz_amt;
    double v_comm_unfroz_amt;
    double v_comm_capt_amt;
    double v_comm_releas_amt;
    double v_trade_frozen_amt;
    double v_trade_unfroz_amt;
    double v_trade_capt_amt;
    double v_trade_releas_amt;
    double v_strike_capt_amt;
    double v_strike_releas_amt;
    double v_curr_qty;
    double v_frozen_qty;
    double v_unfroz_qty;
    double v_pre_settle_qty;
    double v_trade_frozen_qty;
    double v_trade_unfroz_qty;
    double v_strike_frozen_qty;
    double v_strike_unfroz_qty;
    double v_cost_amt;
    double v_intrst_cost_amt;
    double v_intrst_pandl;
    double v_combo_copies;
    char v_combo_status[3];
    double v_combo_cost;
    double v_combo_market_value;
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
    strcpy(v_long_token, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    strcpy(v_stock_acco, " ");
    strcpy(v_stock_code, " ");
    strcpy(v_report_no, " ");
    v_external_no=0;
    strcpy(v_order_status, "0");
    v_wtdraw_id=0;
    v_wtdraw_qty=0;
    strcpy(v_wtdraw_status, "0");
    v_busi_opor_no=0;
    strcpy(v_order_oper_way, " ");
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_stock_type=0;
    v_asset_type=0;
    v_comm_id=0;
    v_comm_batch_no=0;
    v_order_time=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_order_frozen_amt=0;
    v_price_type=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_all_fee=0;
    v_wtdraw_time=0;
    v_net_price_flag=0;
    v_bond_accr_intrst=0;
    v_bond_rate_type=0;
    v_par_value=0;
    v_impawn_ratio=0;
    strcpy(v_combo_code, " ");
    v_combo_posi_id=0;
    v_strategy_id=0;
    strcpy(v_contra_no, " ");
    v_asset_acco_type=0;
    v_exist_debt_flag=0;
    v_init_date=0;
    strcpy(v_sys_config_str, " ");
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_exgp_busi_config_str, " ");
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_buy_ref_rate=0;
    v_sell_ref_rate=0;
    v_intrst_days=0;
    v_target_code_no=0;
    strcpy(v_target_code, " ");
    v_target_code_stock_type=0;
    v_target_code_asset_type=0;
    v_trade_code_no=0;
    strcpy(v_trade_code, " ");
    v_trade_code_stock_type=0;
    v_trade_code_asset_type=0;
    v_min_unit=0;
    v_up_limit_price=0;
    v_down_limit_price=0;
    v_last_price=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    v_apply_date=0;
    v_subscription_trade_mark=0;
    v_purchase_trade_mark=0;
    v_rede_trade_mark=0;
    v_first_minimum_amt=0;
    v_minimum_purchase_amt=0;
    v_minimum_subscription_amt=0;
    v_minimum_rede_share=0;
    v_minimum_holding_share=0;
    strcpy(v_trade_acco, " ");
    strcpy(v_busi_config_str, " ");
    strcpy(v_busi_ctrl_str, " ");
    strcpy(v_asac_busi_config_str, " ");
    strcpy(v_split_fee_typr_str, " ");
    strcpy(v_busi_limit_str, " ");
    v_nav_asset=0;
    v_exter_comm_flag=0;
    v_market_price_ratio=0;
    v_market_price_type=0;
    v_cost_calc_type=0;
    v_order_market_price=0;
    v_sys_type=0;
    strcpy(v_opor_no_str1, " ");
    strcpy(v_opor_no_str2, " ");
    strcpy(v_opor_no_str3, " ");
    v_fina_limit_max=0;
    v_loan_limit_max=0;
    v_sell_auto_back_debt=0;
    v_comm_date=0;
    v_comm_executor=0;
    v_wtdraw_date=0;
    v_order_batch_no=0;
    v_order_frozen_qty=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_rsp_info, " ");
    v_strike_bond_accr_intrst=0;
    v_open_posi_date=0;
    v_update_times=1;
    v_curr_strike_price=0;
    v_curr_strike_amt=0;
    v_curr_strike_qty=0;
    v_strike_id=0;
    v_trade_time_flag=0;
    v_wtdraw_batch_no=0;
    strcpy(v_wtdraw_remark, " ");
    v_comm_time=0;
    v_comm_opor=0;
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
    v_comm_appr_oper=0;
    strcpy(v_comm_appr_remark, " ");
    v_basket_id=0;
    strcpy(v_comm_oper_way, " ");
    v_comm_comple_flag=0;
    v_strategy_capt_qty=0;
    v_strategy_order_qty=0;
    strcpy(v_comm_remark_info, " ");
    v_disp_opor=0;
    v_disp_status=0;
    v_read_flag=0;
    v_sum_comm_row_id=0;
    v_sum_comm_co_no=0;
    v_sum_comm_pd_no=0;
    v_sum_comm_exch_group_no=0;
    v_sum_comm_asset_acco_no=0;
    v_sum_comm_pass_no=0;
    strcpy(v_sum_comm_out_acco, " ");
    strcpy(v_sum_comm_exch_crncy_type, "CNY");
    v_sum_comm_stock_code_no=0;
    v_sum_comm_date=0;
    v_sum_comm_time=0;
    v_sum_comm_batch_no=0;
    v_sum_comm_opor=0;
    v_sum_comm_executor=0;
    v_sum_comm_dir=0;
    v_sum_comm_limit_price=0;
    v_sum_comm_qty=0;
    v_sum_comm_amt=0;
    v_sum_comm_order_qty=0;
    v_sum_comm_cancel_qty=0;
    v_sum_comm_await_cancel_qty=0;
    v_sum_comm_strike_amt=0;
    v_sum_comm_strike_qty=0;
    strcpy(v_sum_comm_strike_status, "0");
    strcpy(v_comm_sum_status, "0");
    v_sum_comm_begin_date=0;
    v_sum_comm_end_date=0;
    v_sum_comm_begin_time=0;
    v_sum_comm_end_time=0;
    v_sum_comm_comple_date=0;
    v_sum_comm_comple_time=0;
    v_sum_comm_max_comm_comple_date=0;
    v_sum_comm_max_comm_comple_time=0;
    v_sum_comm_appr_date=0;
    v_sum_comm_appr_time=0;
    v_sum_comm_appr_qty=0;
    strcpy(v_comm_sum_approve_status, "0");
    v_sum_comm_basket_id=0;
    v_sum_comm_net_price_flag=0;
    v_sum_comm_bond_accr_intrst=0;
    v_sum_comm_bond_rate_type=0;
    strcpy(v_sum_comm_oper_way, " ");
    v_sum_comm_exter_comm_flag=0;
    v_sum_buy_order_qty=0;
    v_sum_sell_order_qty=0;
    v_sum_buy_comm_qty=0;
    v_sum_sell_comm_qty=0;
    v_sum_buy_strike_qty=0;
    v_sum_sell_strike_qty=0;
    v_sum_buy_strike_amt=0;
    v_sum_sell_strike_amt=0;
    v_sum_buy_comm_amt=0;
    v_sum_sell_comm_amt=0;
    strcpy(v_sum_comm_remark_info, " ");
    v_sum_comm_update_times=1;
    strcpy(v_acco_concat_info, " ");
    v_sum_order_row_id=0;
    v_sum_order_opor_no=0;
    v_sum_order_co_no=0;
    v_sum_order_pd_no=0;
    v_sum_order_exch_group_no=0;
    v_sum_order_asset_acco_no=0;
    v_sum_order_pass_no=0;
    strcpy(v_sum_order_exch_crncy_type, "CNY");
    v_sum_order_stock_code_no=0;
    v_sum_order_trade_code_no=0;
    v_sum_order_target_code_no=0;
    v_sum_order_external_no=0;
    v_sum_order_date=0;
    v_sum_order_batch_no=0;
    v_sum_order_dir=0;
    v_sum_order_price_type=0;
    v_sum_order_price=0;
    v_sum_order_qty=0;
    strcpy(v_order_sum_status, "0");
    v_sum_order_wtdraw_qty=0;
    v_sum_order_waste_qty=0;
    v_sum_order_strike_amt=0;
    v_sum_order_strike_qty=0;
    v_sum_order_strike_aver_price=0;
    v_sum_order_net_price_flag=0;
    v_sum_order_bond_accr_intrst=0;
    v_sum_order_bond_rate_type=0;
    v_sum_order_par_value=0;
    v_sum_order_impawn_ratio=0;
    strcpy(v_sum_order_oper_way, " ");
    v_sum_order_update_times=1;
    v_sum_strike_row_id=0;
    v_sum_strike_opor_no=0;
    v_sum_strike_co_no=0;
    v_sum_strike_pd_no=0;
    v_sum_strike_exch_group_no=0;
    v_sum_strike_asset_acco_no=0;
    v_sum_strike_pass_no=0;
    strcpy(v_sum_strike_out_acco, " ");
    v_sum_strike_stock_acco_no=0;
    v_sum_strike_stock_code_no=0;
    v_sum_strike_comm_id=0;
    v_sum_strike_report_date=0;
    strcpy(v_sum_strike_report_no, " ");
    v_sum_strike_order_date=0;
    v_sum_strike_order_id=0;
    v_sum_strike_order_dir=0;
    v_sum_strike_order_price=0;
    v_sum_strike_order_qty=0;
    v_sum_strike_strike_qty=0;
    v_sum_strike_strike_amt=0;
    v_sum_strike_all_fee=0;
    v_sum_strike_stamp_tax=0;
    v_sum_strike_trans_fee=0;
    v_sum_strike_brkage_fee=0;
    v_sum_strike_SEC_charges=0;
    v_sum_strike_other_fee=0;
    v_sum_strike_trade_commis=0;
    v_sum_strike_other_commis=0;
    v_sum_trade_tax=0;
    v_sum_trade_cost_fee=0;
    v_sum_trade_system_use_fee=0;
    v_sum_stock_settle_fee=0;
    v_sum_strike_net_price_flag=0;
    v_sum_strike_bond_accr_intrst=0;
    v_sum_strike_bond_rate_type=0;
    strcpy(v_sum_strike_order_oper_way, " ");
    v_sum_strike_exter_comm_flag=0;
    v_sum_strike_update_times=1;
    v_sum_strike_order_batch_no=0;
    v_sum_external_no=0;
    v_exgp_cash_id=0;
    v_exgp_frozen_amt=0;
    v_exgp_unfroz_amt=0;
    v_exgp_comm_frozen_amt=0;
    v_exgp_comm_unfroz_amt=0;
    v_exgp_comm_capt_amt=0;
    v_exgp_comm_releas_amt=0;
    v_exgp_trade_frozen_amt=0;
    v_exgp_trade_unfroz_amt=0;
    v_exgp_trade_capt_amt=0;
    v_exgp_trade_releas_amt=0;
    v_exgp_strike_capt_amt=0;
    v_exgp_strike_releas_amt=0;
    v_exgp_cash_update_times=1;
    v_exgp_posi_id=0;
    v_exgp_frozen_qty=0;
    v_exgp_unfroz_qty=0;
    v_exgp_comm_frozen_qty=0;
    v_exgp_comm_unfroz_qty=0;
    v_exgp_comm_capt_qty=0;
    v_exgp_comm_releas_qty=0;
    v_exgp_trade_frozen_qty=0;
    v_exgp_trade_unfroz_qty=0;
    v_exgp_trade_capt_qty=0;
    v_exgp_trade_releas_qty=0;
    v_exgp_strike_capt_qty=0;
    v_exgp_strike_releas_qty=0;
    v_exgp_strike_frozen_qty=0;
    v_exgp_strike_unfroz_qty=0;
    v_exgp_realize_pandl=0;
    v_exgp_cost_amt=0;
    v_exgp_intrst_cost_amt=0;
    v_exgp_intrst_pandl=0;
    v_exgp_posi_update_times=1;
    v_asac_cash_id=0;
    v_asac_frozen_amt=0;
    v_asac_unfroz_amt=0;
    v_asac_comm_frozen_amt=0;
    v_asac_comm_unfroz_amt=0;
    v_asac_comm_capt_amt=0;
    v_asac_comm_releas_amt=0;
    v_asac_trade_frozen_amt=0;
    v_asac_trade_unfroz_amt=0;
    v_asac_trade_capt_amt=0;
    v_asac_trade_releas_amt=0;
    v_asac_strike_capt_amt=0;
    v_asac_strike_releas_amt=0;
    v_asac_cash_update_times=1;
    v_asac_posi_id=0;
    v_asac_frozen_qty=0;
    v_asac_unfroz_qty=0;
    v_asac_comm_frozen_qty=0;
    v_asac_comm_unfroz_qty=0;
    v_asac_comm_capt_qty=0;
    v_asac_comm_releas_qty=0;
    v_asac_trade_frozen_qty=0;
    v_asac_trade_unfroz_qty=0;
    v_asac_trade_capt_qty=0;
    v_asac_trade_releas_qty=0;
    v_asac_strike_capt_qty=0;
    v_asac_strike_releas_qty=0;
    v_asac_strike_frozen_qty=0;
    v_asac_strike_unfroz_qty=0;
    v_asac_realize_pandl=0;
    v_asac_cost_amt=0;
    v_asac_intrst_cost_amt=0;
    v_asac_intrst_pandl=0;
    v_asac_posi_update_times=1;
    v_exgp_target_posi_id=0;
    v_exgp_target_frozen_qty=0;
    v_exgp_target_unfroz_qty=0;
    v_exgp_target_comm_frozen_qty=0;
    v_exgp_target_comm_unfroz_qty=0;
    v_exgp_target_comm_capt_qty=0;
    v_exgp_target_comm_releas_qty=0;
    v_exgp_target_trade_frozen_qty=0;
    v_exgp_target_trade_unfroz_qty=0;
    v_exgp_target_trade_capt_qty=0;
    v_exgp_target_trade_releas_qty=0;
    v_exgp_target_strike_capt_qty=0;
    v_exgp_target_strike_releas_qty=0;
    v_exgp_target_strike_frozen_qty=0;
    v_exgp_target_strike_unfroz_qty=0;
    v_exgp_target_realize_pandl=0;
    v_exgp_target_cost_amt=0;
    v_exgp_target_intrst_cost_amt=0;
    v_exgp_target_intrst_pandl=0;
    v_exgp_target_posi_update_times=0;
    v_asac_target_posi_id=0;
    v_asac_target_frozen_qty=0;
    v_asac_target_unfroz_qty=0;
    v_asac_target_comm_frozen_qty=0;
    v_asac_target_comm_unfroz_qty=0;
    v_asac_target_comm_capt_qty=0;
    v_asac_target_comm_releas_qty=0;
    v_asac_target_trade_frozen_qty=0;
    v_asac_target_trade_unfroz_qty=0;
    v_asac_target_trade_capt_qty=0;
    v_asac_target_trade_releas_qty=0;
    v_asac_target_strike_capt_qty=0;
    v_asac_target_strike_releas_qty=0;
    v_asac_target_strike_frozen_qty=0;
    v_asac_target_strike_unfroz_qty=0;
    v_asac_target_realize_pandl=0;
    v_asac_target_cost_amt=0;
    v_asac_target_intrst_cost_amt=0;
    v_asac_target_intrst_pandl=0;
    v_asac_target_posi_update_times=0;
    v_exgp_put_impawn_qty=0;
    v_asac_put_impawn_qty=0;
    v_row_id=0;
    v_source_stock_qty=0;
    v_single_limit_qty=0;
    v_assigned_qty=0;
    v_trade_releas_qty=0;
    v_trade_capt_qty=0;
    v_strike_releas_qty=0;
    v_strike_capt_qty=0;
    v_over_night_pandl=0;
    v_sum_realize_pandl=0;
    v_total_open_posi_fee=0;
    v_total_close_posi_fee=0;
    v_out_order_releas_qty=0;
    v_out_order_capt_qty=0;
    v_out_strike_releas_qty=0;
    v_out_strike_capt_qty=0;
    strcpy(v_remark_info, " ");
    v_buy_avail_qty=0;
    v_sell_avail_qty=0;
    v_posi_qty=0;
    v_today_trade_fee=0;
    v_today_pandl=0;
    v_diff_qty=0;
    v_over_night_trade_buy_qty=0;
    v_over_night_trade_sell_qty=0;
    v_over_night_strike_sell_qty=0;
    v_over_night_sumtrd_sell_qty=0;
    v_over_night_sumstk_sell_qty=0;
    v_trade_amt=0;
    v_trade_qty=0;
    v_realize_pandl=0;
    v_yield_rate=0;
    v_avail_amt=0;
    v_begin_amt=0;
    v_curr_amt=0;
    v_frozen_amt=0;
    v_unfroz_amt=0;
    v_comm_unfroz_amt=0;
    v_comm_capt_amt=0;
    v_comm_releas_amt=0;
    v_trade_frozen_amt=0;
    v_trade_unfroz_amt=0;
    v_trade_capt_amt=0;
    v_trade_releas_amt=0;
    v_strike_capt_amt=0;
    v_strike_releas_amt=0;
    v_curr_qty=0;
    v_frozen_qty=0;
    v_unfroz_qty=0;
    v_pre_settle_qty=0;
    v_trade_frozen_qty=0;
    v_trade_unfroz_qty=0;
    v_strike_frozen_qty=0;
    v_strike_unfroz_qty=0;
    v_cost_amt=0;
    v_intrst_cost_amt=0;
    v_intrst_pandl=0;
    v_combo_copies=0;
    strcpy(v_combo_status, "0");
    v_combo_cost=0;
    v_combo_market_value=0;
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
    strncpy(v_long_token, lpInBizMsg->GetString(LDBIZ_LONG_TOKEN_STR),1024);
    v_long_token[1024] = '\0';

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

    //检查撤单重复，并获取订单信息
    //调用过程[事务_交易证券_交易_检查获取撤单订单信息]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("tdsecuT.4.73", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.4.73]subcall timed out!");
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
    strcpy(v_order_oper_way, lpTSCall1Ans0->GetString(LDBIZ_ORDER_OPER_WAY_STR));
    v_co_no = lpTSCall1Ans0->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans0->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans0->GetInt32(LDBIZ_PASS_NO_INT);
    v_exch_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_stock_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strcpy(v_stock_code, lpTSCall1Ans0->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_type = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_comm_id = lpTSCall1Ans0->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
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
    v_net_price_flag = lpTSCall1Ans0->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
    v_bond_accr_intrst = lpTSCall1Ans0->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
    v_bond_rate_type = lpTSCall1Ans0->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
    v_par_value = lpTSCall1Ans0->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
    v_impawn_ratio = lpTSCall1Ans0->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
    strcpy(v_combo_code, lpTSCall1Ans0->GetString(LDBIZ_COMBO_CODE_STR));
    v_combo_posi_id = lpTSCall1Ans0->GetInt64(LDBIZ_COMBO_POSI_ID_INT64);
    v_strategy_id = lpTSCall1Ans0->GetInt64(LDBIZ_STRATEGY_ID_INT64);
    strcpy(v_contra_no, lpTSCall1Ans0->GetString(LDBIZ_CONTRA_NO_STR));
    v_asset_acco_type = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);
    v_exist_debt_flag = lpTSCall1Ans0->GetInt32(LDBIZ_EXIST_DEBT_FLAG_INT);


    // [检查报错返回][@订单状态# <> 《订单状态-未报》 and @订单状态# <> 《订单状态-已报》  and @订单状态# <> 《订单状态-部成》 and @订单状态# <> 《订单状态-待撤》 ][717][@订单状态#]
    if (strcmp(v_order_status , "1")!=0 && strcmp(v_order_status , "2")!=0  && strcmp(v_order_status , "5")!=0 && strcmp(v_order_status , "3")!=0 )
    {
        strcpy(v_error_code, "tdsecuL.7.4.717");
        snprintf(v_error_info, sizeof(v_error_info), "%s%s","订单状态=",v_order_status);
        iRet = -1;
        goto END;
    }


    // [检查报错返回][@订单状态# <> 《订单状态-未报》 and (@证券类型# = 《证券类型-申购》 or @订单方向# = 《订单方向-新股申购》 or @订单方向# = 《订单方向-配售申购》)][718][@订单方向#]
    if (strcmp(v_order_status , "1")!=0 && (v_stock_type == 2 || v_order_dir == 11 || v_order_dir == 23))
    {
        strcpy(v_error_code, "tdsecuL.7.4.718");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d","订单方向=",v_order_dir);
        iRet = -1;
        goto END;
    }


    // [检查报错返回][@订单状态# <> 《订单状态-未报》 and (@订单方向# = 《订单方向-质押提交》 or @订单方向# = 《订单方向-质押转回》)][719][@订单状态#,@订单方向#]
    if (strcmp(v_order_status , "1")!=0 && (v_order_dir == 21 || v_order_dir == 22))
    {
        strcpy(v_error_code, "tdsecuL.7.4.719");
        snprintf(v_error_info, sizeof(v_error_info), "%s%s%s%d","订单状态=",v_order_status,"订单方向=",v_order_dir);
        iRet = -1;
        goto END;
    }

    //公共子系统检查，检查交易日期时间
    //调用过程[事务_公共_交易接口_检查交易市场状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.25.22", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req1->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req1->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    lpTSCall1Req1->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.22]subcall timed out!");
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
    strcpy(v_sys_config_str, lpTSCall1Ans1->GetString(LDBIZ_SYS_CONFIG_STR_STR));
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans1->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));
    strcpy(v_exgp_busi_config_str, lpTSCall1Ans1->GetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR));
    v_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_stock_type = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_CRNCY_TYPE_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_buy_ref_rate = lpTSCall1Ans1->GetDouble(LDBIZ_BUY_REF_RATE_FLOAT);
    v_sell_ref_rate = lpTSCall1Ans1->GetDouble(LDBIZ_SELL_REF_RATE_FLOAT);
    v_par_value = lpTSCall1Ans1->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
    v_impawn_ratio = lpTSCall1Ans1->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
    v_net_price_flag = lpTSCall1Ans1->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
    v_intrst_days = lpTSCall1Ans1->GetInt32(LDBIZ_INTRST_DAYS_INT);
    v_bond_rate_type = lpTSCall1Ans1->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
    v_bond_accr_intrst = lpTSCall1Ans1->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
    v_target_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
    strcpy(v_target_code, lpTSCall1Ans1->GetString(LDBIZ_TARGET_CODE_STR));
    v_target_code_stock_type = lpTSCall1Ans1->GetInt32(LDBIZ_TARGET_CODE_STOCK_TYPE_INT);
    v_target_code_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_TARGET_CODE_ASSET_TYPE_INT);
    v_trade_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
    strcpy(v_trade_code, lpTSCall1Ans1->GetString(LDBIZ_TRADE_CODE_STR));
    v_trade_code_stock_type = lpTSCall1Ans1->GetInt32(LDBIZ_TRADE_CODE_STOCK_TYPE_INT);
    v_trade_code_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_TRADE_CODE_ASSET_TYPE_INT);
    v_min_unit = lpTSCall1Ans1->GetInt32(LDBIZ_MIN_UNIT_INT);
    v_up_limit_price = lpTSCall1Ans1->GetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT);
    v_down_limit_price = lpTSCall1Ans1->GetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
    v_last_price = lpTSCall1Ans1->GetDouble(LDBIZ_LAST_PRICE_FLOAT);
    v_capit_reback_days = lpTSCall1Ans1->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans1->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    v_apply_date = lpTSCall1Ans1->GetInt32(LDBIZ_APPLY_DATE_INT);
    v_subscription_trade_mark = lpTSCall1Ans1->GetInt32(LDBIZ_SUBSCRIPTION_TRADE_MARK_INT);
    v_purchase_trade_mark = lpTSCall1Ans1->GetInt32(LDBIZ_PURCHASE_TRADE_MARK_INT);
    v_rede_trade_mark = lpTSCall1Ans1->GetInt32(LDBIZ_REDE_TRADE_MARK_INT);
    v_first_minimum_amt = lpTSCall1Ans1->GetDouble(LDBIZ_FIRST_MINIMUM_AMT_FLOAT);
    v_minimum_purchase_amt = lpTSCall1Ans1->GetDouble(LDBIZ_MINIMUM_PURCHASE_AMT_FLOAT);
    v_minimum_subscription_amt = lpTSCall1Ans1->GetDouble(LDBIZ_MINIMUM_SUBSCRIPTION_AMT_FLOAT);
    v_minimum_rede_share = lpTSCall1Ans1->GetDouble(LDBIZ_MINIMUM_REDE_SHARE_FLOAT);
    v_minimum_holding_share = lpTSCall1Ans1->GetDouble(LDBIZ_MINIMUM_HOLDING_SHARE_FLOAT);
    strcpy(v_trade_acco, lpTSCall1Ans1->GetString(LDBIZ_TRADE_ACCO_STR));


    // set @业务控制配置串# = @交易组业务控制配置串#;
    strcpy(v_busi_config_str,v_exgp_busi_config_str);
    //产品子系统检查，检查账户状态，获取当前资金等

    // set @业务控制串# = "11111";
    strcpy(v_busi_ctrl_str,"11111");
    //调用过程[事务_产品_交易接口_检查交易产品账户信息]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("prodT.8.21", 0);
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
    lpTSCall1Req2->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req2->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req2->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req2->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req2->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    lpTSCall1Req2->SetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT,v_up_limit_price);
    lpTSCall1Req2->SetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT,v_down_limit_price);
    lpTSCall1Req2->SetDouble(LDBIZ_LAST_PRICE_FLOAT,v_last_price);
    lpTSCall1Req2->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
    lpTSCall1Req2->SetString(LDBIZ_BUSI_CONFIG_STR_STR,v_busi_config_str);
    lpTSCall1Req2->SetString(LDBIZ_SYS_CONFIG_STR_STR,v_sys_config_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.8.21]subcall timed out!");
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
    v_exter_comm_flag = lpTSCall1Ans2->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_market_price_ratio = lpTSCall1Ans2->GetDouble(LDBIZ_MARKET_PRICE_RATIO_FLOAT);
    v_market_price_type = lpTSCall1Ans2->GetInt32(LDBIZ_MARKET_PRICE_TYPE_INT);
    v_cost_calc_type = lpTSCall1Ans2->GetInt32(LDBIZ_COST_CALC_TYPE_INT);
    v_order_market_price = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_MARKET_PRICE_FLOAT);
    v_sys_type = lpTSCall1Ans2->GetInt32(LDBIZ_SYS_TYPE_INT);
    strcpy(v_opor_no_str1, lpTSCall1Ans2->GetString(LDBIZ_OPOR_NO_STR1_STR));
    strcpy(v_opor_no_str2, lpTSCall1Ans2->GetString(LDBIZ_OPOR_NO_STR2_STR));
    strcpy(v_opor_no_str3, lpTSCall1Ans2->GetString(LDBIZ_OPOR_NO_STR3_STR));
    v_fina_limit_max = lpTSCall1Ans2->GetDouble(LDBIZ_FINA_LIMIT_MAX_FLOAT);
    v_loan_limit_max = lpTSCall1Ans2->GetDouble(LDBIZ_LOAN_LIMIT_MAX_FLOAT);
    v_asset_acco_type = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);
    v_sell_auto_back_debt = lpTSCall1Ans2->GetInt32(LDBIZ_SELL_AUTO_BACK_DEBT_INT);

    //处理撤销
    //调用过程[事务_交易证券_交易_撤销订单]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("tdsecuT.4.12", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req3->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req3->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.4.12]subcall timed out!");
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
    v_pass_no = lpTSCall1Ans3->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans3->GetString(LDBIZ_OUT_ACCO_STR));
    v_exch_no = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans3->GetString(LDBIZ_STOCK_ACCO_STR));
    strcpy(v_stock_code, lpTSCall1Ans3->GetString(LDBIZ_STOCK_CODE_STR));
    v_comm_date = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_id = lpTSCall1Ans3->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_executor = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    strcpy(v_report_no, lpTSCall1Ans3->GetString(LDBIZ_REPORT_NO_STR));
    v_external_no = lpTSCall1Ans3->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    strcpy(v_order_status, lpTSCall1Ans3->GetString(LDBIZ_ORDER_STATUS_STR));
    v_wtdraw_date = lpTSCall1Ans3->GetInt32(LDBIZ_WTDRAW_DATE_INT);
    v_wtdraw_id = lpTSCall1Ans3->GetInt64(LDBIZ_WTDRAW_ID_INT64);
    v_wtdraw_qty = lpTSCall1Ans3->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    strcpy(v_wtdraw_status, lpTSCall1Ans3->GetString(LDBIZ_WTDRAW_STATUS_STR));
    v_order_batch_no = lpTSCall1Ans3->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_order_frozen_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
    v_order_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT);
    v_report_date = lpTSCall1Ans3->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpTSCall1Ans3->GetInt32(LDBIZ_REPORT_TIME_INT);
    strcpy(v_rsp_info, lpTSCall1Ans3->GetString(LDBIZ_RSP_INFO_STR));
    v_strike_amt = lpTSCall1Ans3->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_qty = lpTSCall1Ans3->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_bond_accr_intrst = lpTSCall1Ans3->GetDouble(LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
    strcpy(v_order_oper_way, lpTSCall1Ans3->GetString(LDBIZ_ORDER_OPER_WAY_STR));
    v_order_price = lpTSCall1Ans3->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    strcpy(v_combo_code, lpTSCall1Ans3->GetString(LDBIZ_COMBO_CODE_STR));
    v_combo_posi_id = lpTSCall1Ans3->GetInt64(LDBIZ_COMBO_POSI_ID_INT64);
    v_open_posi_date = lpTSCall1Ans3->GetInt32(LDBIZ_OPEN_POSI_DATE_INT);
    v_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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
    //set @撤单状态// = "0";

    // [主动推送][secu.order][证券主推_订单_订单主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.20", 0);
    lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpPubMsg->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
    lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpPubMsg->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    lpPubMsg->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
    lpPubMsg->SetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT,v_order_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT,v_order_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
    lpPubMsg->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpPubMsg->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
    lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpPubMsg->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
    lpPubMsg->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
    lpPubMsg->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
    lpPubMsg->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
    lpPubMsg->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
    lpPubMsg->SetString(LDBIZ_RSP_INFO_STR,v_rsp_info);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT,v_strike_bond_accr_intrst);
    lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
    lpPubMsg->SetDouble(LDBIZ_CURR_STRIKE_QTY_FLOAT,v_curr_strike_qty);
    lpPubMsg->SetDouble(LDBIZ_CURR_STRIKE_AMT_FLOAT,v_curr_strike_amt);
    lpPubMsg->SetDouble(LDBIZ_CURR_STRIKE_PRICE_FLOAT,v_curr_strike_price);
    lpPubMsg->SetInt64(LDBIZ_STRIKE_ID_INT64,v_strike_id);
    lpPubMsg->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
    lpPubMsg->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
    lpPubMsg->SetInt64(LDBIZ_COMBO_POSI_ID_INT64,v_combo_posi_id);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_TYPE_INT,v_asset_acco_type);
    lpPubMsg->SetString(LDBIZ_CONTRA_NO_STR,v_contra_no);
    lpPubMsg->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("secu.order", lpPubMsg);

    //调用过程[事务_交易证券_交易_根据交易时间控制报盘主推]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("tdsecuT.4.124", 0);
    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req4->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.4.124]subcall timed out!");
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
    v_trade_time_flag = lpTSCall1Ans4->GetInt32(LDBIZ_TRADE_TIME_FLAG_INT);


    // if @撤单状态# <> 《撤单状态-成功》 and @交易时间标志# =1  then
    if (strcmp(v_wtdraw_status , "3")!=0 && v_trade_time_flag ==1 )
    {

        // [主动推送][secu.ztrptwtdraw][证券主推_报盘_中泰订单撤单主推报盘消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.927", 0);
        lpPubMsg->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpPubMsg->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpPubMsg->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
        lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
        lpPubMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
        lpPubMsg->SetInt32(LDBIZ_WTDRAW_DATE_INT,v_wtdraw_date);
        lpPubMsg->SetInt32(LDBIZ_WTDRAW_TIME_INT,v_wtdraw_time);
        lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
        lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
        lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
        lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
        lpPubMsg->SetString(LDBIZ_TRADE_ACCO_STR,v_trade_acco);
        lpPubMsg->SetString(LDBIZ_LONG_TOKEN_STR,v_long_token);
        glpPubSub_Interface->PubTopics("secu.ztrptwtdraw", lpPubMsg);

    // end if;
    }

    //调用过程[事务_交易证券_主推接口_获取撤单信息]
    //组织事务请求
    if(lpTSCall1Ans5)
    {
      lpTSCall1Ans5->FreeMsg();
      lpTSCall1Ans5=NULL;
    }
    lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.48", 0);
    lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req5->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
    if(!lpTSCall1Ans5)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.48]subcall timed out!");
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
    v_wtdraw_id = lpTSCall1Ans5->GetInt64(LDBIZ_WTDRAW_ID_INT64);
    v_busi_opor_no = lpTSCall1Ans5->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_init_date = lpTSCall1Ans5->GetInt32(LDBIZ_INIT_DATE_INT);
    v_co_no = lpTSCall1Ans5->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans5->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans5->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans5->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans5->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans5->GetString(LDBIZ_OUT_ACCO_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans5->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_exch_no = lpTSCall1Ans5->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans5->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans5->GetString(LDBIZ_STOCK_ACCO_STR));
    v_stock_code_no = lpTSCall1Ans5->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strcpy(v_stock_code, lpTSCall1Ans5->GetString(LDBIZ_STOCK_CODE_STR));
    v_external_no = lpTSCall1Ans5->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_wtdraw_batch_no = lpTSCall1Ans5->GetInt32(LDBIZ_WTDRAW_BATCH_NO_INT);
    v_wtdraw_date = lpTSCall1Ans5->GetInt32(LDBIZ_WTDRAW_DATE_INT);
    v_wtdraw_time = lpTSCall1Ans5->GetInt32(LDBIZ_WTDRAW_TIME_INT);
    v_order_date = lpTSCall1Ans5->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_report_date = lpTSCall1Ans5->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpTSCall1Ans5->GetInt32(LDBIZ_REPORT_TIME_INT);
    strcpy(v_report_no, lpTSCall1Ans5->GetString(LDBIZ_REPORT_NO_STR));
    strcpy(v_wtdraw_status, lpTSCall1Ans5->GetString(LDBIZ_WTDRAW_STATUS_STR));
    v_wtdraw_qty = lpTSCall1Ans5->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    strcpy(v_wtdraw_remark, lpTSCall1Ans5->GetString(LDBIZ_WTDRAW_REMARK_STR));
    v_order_price = lpTSCall1Ans5->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    strcpy(v_trade_acco, lpTSCall1Ans5->GetString(LDBIZ_TRADE_ACCO_STR));
    v_update_times = lpTSCall1Ans5->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // [主动推送][secu.withdraw][证券主推_订单_撤单主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.201", 0);
    lpPubMsg->SetInt64(LDBIZ_WTDRAW_ID_INT64,v_wtdraw_id);
    lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpPubMsg->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
    lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpPubMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpPubMsg->SetInt32(LDBIZ_WTDRAW_BATCH_NO_INT,v_wtdraw_batch_no);
    lpPubMsg->SetInt32(LDBIZ_WTDRAW_DATE_INT,v_wtdraw_date);
    lpPubMsg->SetInt32(LDBIZ_WTDRAW_TIME_INT,v_wtdraw_time);
    lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpPubMsg->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpPubMsg->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
    lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpPubMsg->SetString(LDBIZ_WTDRAW_STATUS_STR,v_wtdraw_status);
    lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
    lpPubMsg->SetString(LDBIZ_WTDRAW_REMARK_STR,v_wtdraw_remark);
    lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpPubMsg->SetString(LDBIZ_TRADE_ACCO_STR,v_trade_acco);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("secu.withdraw", lpPubMsg);


    // if @指令序号# > 0 then
    if (v_comm_id > 0)
    {
        //调用过程[事务_交易证券_主推接口_获取指令混合信息]
        //组织事务请求
        if(lpTSCall1Ans6)
        {
          lpTSCall1Ans6->FreeMsg();
          lpTSCall1Ans6=NULL;
        }
        lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.3", 0);
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
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.3]subcall timed out!");
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
        v_co_no = lpTSCall1Ans6->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans6->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans6->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans6->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_out_acco, lpTSCall1Ans6->GetString(LDBIZ_OUT_ACCO_STR));
        strcpy(v_exch_crncy_type, lpTSCall1Ans6->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_stock_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
        v_stock_code_no = lpTSCall1Ans6->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        v_stock_type = lpTSCall1Ans6->GetInt32(LDBIZ_STOCK_TYPE_INT);
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
        v_comm_appr_oper = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
        strcpy(v_comm_appr_remark, lpTSCall1Ans6->GetString(LDBIZ_COMM_APPR_REMARK_STR));
        v_basket_id = lpTSCall1Ans6->GetInt64(LDBIZ_BASKET_ID_INT64);
        v_net_price_flag = lpTSCall1Ans6->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
        v_bond_accr_intrst = lpTSCall1Ans6->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
        v_bond_rate_type = lpTSCall1Ans6->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
        strcpy(v_comm_oper_way, lpTSCall1Ans6->GetString(LDBIZ_COMM_OPER_WAY_STR));
        v_exter_comm_flag = lpTSCall1Ans6->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
        v_comm_comple_flag = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
        v_strategy_capt_qty = lpTSCall1Ans6->GetDouble(LDBIZ_STRATEGY_CAPT_QTY_FLOAT);
        v_strategy_order_qty = lpTSCall1Ans6->GetDouble(LDBIZ_STRATEGY_ORDER_QTY_FLOAT);
        strcpy(v_contra_no, lpTSCall1Ans6->GetString(LDBIZ_CONTRA_NO_STR));
        strcpy(v_comm_remark_info, lpTSCall1Ans6->GetString(LDBIZ_COMM_REMARK_INFO_STR));
        v_disp_opor = lpTSCall1Ans6->GetInt32(LDBIZ_DISP_OPOR_INT);
        v_disp_status = lpTSCall1Ans6->GetInt32(LDBIZ_DISP_STATUS_INT);
        v_read_flag = lpTSCall1Ans6->GetInt32(LDBIZ_READ_FLAG_INT);
        v_update_times = lpTSCall1Ans6->GetInt32(LDBIZ_UPDATE_TIMES_INT);
        v_sum_comm_row_id = lpTSCall1Ans6->GetInt64(LDBIZ_SUM_COMM_ROW_ID_INT64);
        v_sum_comm_co_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_CO_NO_INT);
        v_sum_comm_pd_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_PD_NO_INT);
        v_sum_comm_exch_group_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_EXCH_GROUP_NO_INT);
        v_sum_comm_asset_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_ASSET_ACCO_NO_INT);
        v_sum_comm_pass_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_PASS_NO_INT);
        strcpy(v_sum_comm_out_acco, lpTSCall1Ans6->GetString(LDBIZ_SUM_COMM_OUT_ACCO_STR));
        strcpy(v_sum_comm_exch_crncy_type, lpTSCall1Ans6->GetString(LDBIZ_SUM_COMM_EXCH_CRNCY_TYPE_STR));
        v_sum_comm_stock_code_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_STOCK_CODE_NO_INT);
        v_sum_comm_date = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_DATE_INT);
        v_sum_comm_time = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_TIME_INT);
        v_sum_comm_batch_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_BATCH_NO_INT);
        v_sum_comm_opor = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_OPOR_INT);
        v_sum_comm_executor = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_EXECUTOR_INT);
        v_sum_comm_dir = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_DIR_INT);
        v_sum_comm_limit_price = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_LIMIT_PRICE_FLOAT);
        v_sum_comm_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_QTY_FLOAT);
        v_sum_comm_amt = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_AMT_FLOAT);
        v_sum_comm_order_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_ORDER_QTY_FLOAT);
        v_sum_comm_cancel_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_CANCEL_QTY_FLOAT);
        v_sum_comm_await_cancel_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_AWAIT_CANCEL_QTY_FLOAT);
        v_sum_comm_strike_amt = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_STRIKE_AMT_FLOAT);
        v_sum_comm_strike_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_STRIKE_QTY_FLOAT);
        strcpy(v_sum_comm_strike_status, lpTSCall1Ans6->GetString(LDBIZ_SUM_COMM_STRIKE_STATUS_STR));
        strcpy(v_comm_sum_status, lpTSCall1Ans6->GetString(LDBIZ_COMM_SUM_STATUS_STR));
        v_sum_comm_begin_date = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_BEGIN_DATE_INT);
        v_sum_comm_end_date = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_END_DATE_INT);
        v_sum_comm_begin_time = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_BEGIN_TIME_INT);
        v_sum_comm_end_time = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_END_TIME_INT);
        v_sum_comm_comple_date = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_COMPLE_DATE_INT);
        v_sum_comm_comple_time = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_COMPLE_TIME_INT);
        v_sum_comm_max_comm_comple_date = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_DATE_INT);
        v_sum_comm_max_comm_comple_time = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_TIME_INT);
        v_sum_comm_appr_date = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_APPR_DATE_INT);
        v_sum_comm_appr_time = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_APPR_TIME_INT);
        v_sum_comm_appr_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_APPR_QTY_FLOAT);
        strcpy(v_comm_sum_approve_status, lpTSCall1Ans6->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
        v_sum_comm_basket_id = lpTSCall1Ans6->GetInt64(LDBIZ_SUM_COMM_BASKET_ID_INT64);
        v_sum_comm_net_price_flag = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_NET_PRICE_FLAG_INT);
        v_sum_comm_bond_accr_intrst = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_BOND_ACCR_INTRST_FLOAT);
        v_sum_comm_bond_rate_type = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_BOND_RATE_TYPE_INT);
        strcpy(v_sum_comm_oper_way, lpTSCall1Ans6->GetString(LDBIZ_SUM_COMM_OPER_WAY_STR));
        v_sum_comm_exter_comm_flag = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_EXTER_COMM_FLAG_INT);
        v_sum_buy_order_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_BUY_ORDER_QTY_FLOAT);
        v_sum_sell_order_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_SELL_ORDER_QTY_FLOAT);
        v_sum_buy_comm_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_BUY_COMM_QTY_FLOAT);
        v_sum_sell_comm_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_SELL_COMM_QTY_FLOAT);
        v_sum_buy_strike_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_BUY_STRIKE_QTY_FLOAT);
        v_sum_sell_strike_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_SELL_STRIKE_QTY_FLOAT);
        v_sum_buy_strike_amt = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_BUY_STRIKE_AMT_FLOAT);
        v_sum_sell_strike_amt = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_SELL_STRIKE_AMT_FLOAT);
        v_sum_buy_comm_amt = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_BUY_COMM_AMT_FLOAT);
        v_sum_sell_comm_amt = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_SELL_COMM_AMT_FLOAT);
        strcpy(v_sum_comm_remark_info, lpTSCall1Ans6->GetString(LDBIZ_SUM_COMM_REMARK_INFO_STR));
        v_sum_comm_update_times = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_UPDATE_TIMES_INT);
        strcpy(v_acco_concat_info, lpTSCall1Ans6->GetString(LDBIZ_ACCO_CONCAT_INFO_STR));
        strcpy(v_combo_code, lpTSCall1Ans6->GetString(LDBIZ_COMBO_CODE_STR));


        // [主动推送][secu.comm][证券主推_指令_指令主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.40", 0);
        lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
        lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpPubMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
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
        lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT,v_comm_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT,v_comm_frozen_qty);
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
        lpPubMsg->SetInt64(LDBIZ_BASKET_ID_INT64,v_basket_id);
        lpPubMsg->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
        lpPubMsg->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
        lpPubMsg->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
        lpPubMsg->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
        lpPubMsg->SetInt32(LDBIZ_EXTER_COMM_FLAG_INT,v_exter_comm_flag);
        lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_FLAG_INT,v_comm_comple_flag);
        lpPubMsg->SetDouble(LDBIZ_STRATEGY_CAPT_QTY_FLOAT,v_strategy_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_STRATEGY_ORDER_QTY_FLOAT,v_strategy_order_qty);
        lpPubMsg->SetString(LDBIZ_CONTRA_NO_STR,v_contra_no);
        lpPubMsg->SetString(LDBIZ_COMM_REMARK_INFO_STR,v_comm_remark_info);
        lpPubMsg->SetInt32(LDBIZ_DISP_OPOR_INT,v_disp_opor);
        lpPubMsg->SetInt32(LDBIZ_DISP_STATUS_INT,v_disp_status);
        lpPubMsg->SetInt32(LDBIZ_READ_FLAG_INT,v_read_flag);
        lpPubMsg->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("secu.comm", lpPubMsg);


        // if @指令批号# > 0 then
        if (v_comm_batch_no > 0)
        {

             // set @指令备注信息# = @汇总指令备注信息#;
             strcpy(v_comm_remark_info,v_sum_comm_remark_info);

            // [主动推送][secu.commtotal][证券主推_指令_指令汇总主推消息]
            lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.41", 0);
            lpPubMsg->SetInt64(LDBIZ_SUM_COMM_ROW_ID_INT64,v_sum_comm_row_id);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_CO_NO_INT,v_sum_comm_co_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_PD_NO_INT,v_sum_comm_pd_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_EXCH_GROUP_NO_INT,v_sum_comm_exch_group_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_ASSET_ACCO_NO_INT,v_sum_comm_asset_acco_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_PASS_NO_INT,v_sum_comm_pass_no);
            lpPubMsg->SetString(LDBIZ_SUM_COMM_OUT_ACCO_STR,v_sum_comm_out_acco);
            lpPubMsg->SetString(LDBIZ_SUM_COMM_EXCH_CRNCY_TYPE_STR,v_sum_comm_exch_crncy_type);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_STOCK_CODE_NO_INT,v_sum_comm_stock_code_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_DATE_INT,v_sum_comm_date);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_TIME_INT,v_sum_comm_time);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BATCH_NO_INT,v_sum_comm_batch_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_OPOR_INT,v_sum_comm_opor);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_EXECUTOR_INT,v_sum_comm_executor);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_DIR_INT,v_sum_comm_dir);
            lpPubMsg->SetDouble(LDBIZ_SUM_COMM_LIMIT_PRICE_FLOAT,v_sum_comm_limit_price);
            lpPubMsg->SetDouble(LDBIZ_SUM_COMM_QTY_FLOAT,v_sum_comm_qty);
            lpPubMsg->SetDouble(LDBIZ_SUM_COMM_AMT_FLOAT,v_sum_comm_amt);
            lpPubMsg->SetDouble(LDBIZ_SUM_COMM_ORDER_QTY_FLOAT,v_sum_comm_order_qty);
            lpPubMsg->SetDouble(LDBIZ_SUM_COMM_CANCEL_QTY_FLOAT,v_sum_comm_cancel_qty);
            lpPubMsg->SetDouble(LDBIZ_SUM_COMM_AWAIT_CANCEL_QTY_FLOAT,v_sum_comm_await_cancel_qty);
            lpPubMsg->SetDouble(LDBIZ_SUM_COMM_STRIKE_AMT_FLOAT,v_sum_comm_strike_amt);
            lpPubMsg->SetDouble(LDBIZ_SUM_COMM_STRIKE_QTY_FLOAT,v_sum_comm_strike_qty);
            lpPubMsg->SetString(LDBIZ_SUM_COMM_STRIKE_STATUS_STR,v_sum_comm_strike_status);
            lpPubMsg->SetString(LDBIZ_COMM_SUM_STATUS_STR,v_comm_sum_status);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BEGIN_DATE_INT,v_sum_comm_begin_date);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_END_DATE_INT,v_sum_comm_end_date);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BEGIN_TIME_INT,v_sum_comm_begin_time);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_END_TIME_INT,v_sum_comm_end_time);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_COMPLE_DATE_INT,v_sum_comm_comple_date);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_COMPLE_TIME_INT,v_sum_comm_comple_time);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_DATE_INT,v_sum_comm_max_comm_comple_date);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_TIME_INT,v_sum_comm_max_comm_comple_time);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_APPR_DATE_INT,v_sum_comm_appr_date);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_APPR_TIME_INT,v_sum_comm_appr_time);
            lpPubMsg->SetDouble(LDBIZ_SUM_COMM_APPR_QTY_FLOAT,v_sum_comm_appr_qty);
            lpPubMsg->SetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR,v_comm_sum_approve_status);
            lpPubMsg->SetInt64(LDBIZ_SUM_COMM_BASKET_ID_INT64,v_sum_comm_basket_id);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_NET_PRICE_FLAG_INT,v_sum_comm_net_price_flag);
            lpPubMsg->SetDouble(LDBIZ_SUM_COMM_BOND_ACCR_INTRST_FLOAT,v_sum_comm_bond_accr_intrst);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BOND_RATE_TYPE_INT,v_sum_comm_bond_rate_type);
            lpPubMsg->SetString(LDBIZ_SUM_COMM_OPER_WAY_STR,v_sum_comm_oper_way);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_EXTER_COMM_FLAG_INT,v_sum_comm_exter_comm_flag);
            lpPubMsg->SetDouble(LDBIZ_SUM_BUY_ORDER_QTY_FLOAT,v_sum_buy_order_qty);
            lpPubMsg->SetDouble(LDBIZ_SUM_SELL_ORDER_QTY_FLOAT,v_sum_sell_order_qty);
            lpPubMsg->SetDouble(LDBIZ_SUM_BUY_COMM_QTY_FLOAT,v_sum_buy_comm_qty);
            lpPubMsg->SetDouble(LDBIZ_SUM_SELL_COMM_QTY_FLOAT,v_sum_sell_comm_qty);
            lpPubMsg->SetDouble(LDBIZ_SUM_BUY_STRIKE_QTY_FLOAT,v_sum_buy_strike_qty);
            lpPubMsg->SetDouble(LDBIZ_SUM_SELL_STRIKE_QTY_FLOAT,v_sum_sell_strike_qty);
            lpPubMsg->SetDouble(LDBIZ_SUM_BUY_STRIKE_AMT_FLOAT,v_sum_buy_strike_amt);
            lpPubMsg->SetDouble(LDBIZ_SUM_SELL_STRIKE_AMT_FLOAT,v_sum_sell_strike_amt);
            lpPubMsg->SetDouble(LDBIZ_SUM_BUY_COMM_AMT_FLOAT,v_sum_buy_comm_amt);
            lpPubMsg->SetDouble(LDBIZ_SUM_SELL_COMM_AMT_FLOAT,v_sum_sell_comm_amt);
            lpPubMsg->SetString(LDBIZ_COMM_REMARK_INFO_STR,v_comm_remark_info);
            lpPubMsg->SetInt32(LDBIZ_READ_FLAG_INT,v_read_flag);
            lpPubMsg->SetString(LDBIZ_ACCO_CONCAT_INFO_STR,v_acco_concat_info);
            lpPubMsg->SetInt32(LDBIZ_SUM_COMM_UPDATE_TIMES_INT,v_sum_comm_update_times);
            glpPubSub_Interface->PubTopics("secu.commtotal", lpPubMsg);

        // end if;
        }

    // end if;
    }

    //已撤，需要推资金、持仓

    // if @订单状态# = 《订单状态-已撤》 then
    if (strcmp(v_order_status , "4")==0)
    {

        // if  @订单批号# > 0 then
        if ( v_order_batch_no > 0)
        {

            // set @成交序号# = 0;
            v_strike_id = 0;
            //调用过程[事务_交易证券_主推接口_获取汇总订单成交信息]
            //组织事务请求
            if(lpTSCall1Ans7)
            {
              lpTSCall1Ans7->FreeMsg();
              lpTSCall1Ans7=NULL;
            }
            lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.21", 0);
            lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req7->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpTSCall1Req7->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
            lpTSCall1Req7->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
            lpTSCall1Req7->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
            lpTSCall1Req7->SetInt64(LDBIZ_STRIKE_ID_INT64,v_strike_id);
            glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
            if(!lpTSCall1Ans7)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.21]subcall timed out!");
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
            v_sum_order_row_id = lpTSCall1Ans7->GetInt64(LDBIZ_SUM_ORDER_ROW_ID_INT64);
            v_sum_order_opor_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_OPOR_NO_INT);
            v_sum_order_co_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_CO_NO_INT);
            v_sum_order_pd_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_PD_NO_INT);
            v_sum_order_exch_group_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_EXCH_GROUP_NO_INT);
            v_sum_order_asset_acco_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_ASSET_ACCO_NO_INT);
            v_sum_order_pass_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_PASS_NO_INT);
            strcpy(v_sum_order_exch_crncy_type, lpTSCall1Ans7->GetString(LDBIZ_SUM_ORDER_EXCH_CRNCY_TYPE_STR));
            v_sum_order_stock_code_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_STOCK_CODE_NO_INT);
            v_sum_order_trade_code_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_TRADE_CODE_NO_INT);
            v_sum_order_target_code_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_TARGET_CODE_NO_INT);
            v_sum_order_external_no = lpTSCall1Ans7->GetInt64(LDBIZ_SUM_ORDER_EXTERNAL_NO_INT64);
            v_sum_order_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_DATE_INT);
            v_sum_order_batch_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_BATCH_NO_INT);
            v_sum_order_dir = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_DIR_INT);
            v_sum_order_price_type = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_PRICE_TYPE_INT);
            v_sum_order_price = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_PRICE_FLOAT);
            v_sum_order_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_QTY_FLOAT);
            strcpy(v_order_sum_status, lpTSCall1Ans7->GetString(LDBIZ_ORDER_SUM_STATUS_STR));
            v_sum_order_wtdraw_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_WTDRAW_QTY_FLOAT);
            v_sum_order_waste_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_WASTE_QTY_FLOAT);
            v_sum_order_strike_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_STRIKE_AMT_FLOAT);
            v_sum_order_strike_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_STRIKE_QTY_FLOAT);
            v_sum_order_strike_aver_price = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_STRIKE_AVER_PRICE_FLOAT);
            v_sum_order_net_price_flag = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_NET_PRICE_FLAG_INT);
            v_sum_order_bond_accr_intrst = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_BOND_ACCR_INTRST_FLOAT);
            v_sum_order_bond_rate_type = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_BOND_RATE_TYPE_INT);
            v_sum_order_par_value = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_PAR_VALUE_FLOAT);
            v_sum_order_impawn_ratio = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_ORDER_IMPAWN_RATIO_FLOAT);
            strcpy(v_sum_order_oper_way, lpTSCall1Ans7->GetString(LDBIZ_SUM_ORDER_OPER_WAY_STR));
            v_sum_order_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_ORDER_UPDATE_TIMES_INT);
            v_sum_strike_row_id = lpTSCall1Ans7->GetInt64(LDBIZ_SUM_STRIKE_ROW_ID_INT64);
            v_sum_strike_opor_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_OPOR_NO_INT);
            v_sum_strike_co_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_CO_NO_INT);
            v_sum_strike_pd_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_PD_NO_INT);
            v_sum_strike_exch_group_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_EXCH_GROUP_NO_INT);
            v_sum_strike_asset_acco_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_ASSET_ACCO_NO_INT);
            v_sum_strike_pass_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_PASS_NO_INT);
            strcpy(v_sum_strike_out_acco, lpTSCall1Ans7->GetString(LDBIZ_SUM_STRIKE_OUT_ACCO_STR));
            v_sum_strike_stock_acco_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_STOCK_ACCO_NO_INT);
            v_sum_strike_stock_code_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_STOCK_CODE_NO_INT);
            v_sum_strike_comm_id = lpTSCall1Ans7->GetInt64(LDBIZ_SUM_STRIKE_COMM_ID_INT64);
            v_sum_strike_report_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_REPORT_DATE_INT);
            strcpy(v_sum_strike_report_no, lpTSCall1Ans7->GetString(LDBIZ_SUM_STRIKE_REPORT_NO_STR));
            v_sum_strike_order_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_ORDER_DATE_INT);
            v_sum_strike_order_id = lpTSCall1Ans7->GetInt64(LDBIZ_SUM_STRIKE_ORDER_ID_INT64);
            v_sum_strike_order_dir = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_ORDER_DIR_INT);
            v_sum_strike_order_price = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_ORDER_PRICE_FLOAT);
            v_sum_strike_order_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_ORDER_QTY_FLOAT);
            v_sum_strike_strike_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_STRIKE_QTY_FLOAT);
            v_sum_strike_strike_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_STRIKE_AMT_FLOAT);
            v_sum_strike_all_fee = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_ALL_FEE_FLOAT);
            v_sum_strike_stamp_tax = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_STAMP_TAX_FLOAT);
            v_sum_strike_trans_fee = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_TRANS_FEE_FLOAT);
            v_sum_strike_brkage_fee = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_BRKAGE_FEE_FLOAT);
            v_sum_strike_SEC_charges = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_SEC_CHARGES_FLOAT);
            v_sum_strike_other_fee = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_OTHER_FEE_FLOAT);
            v_sum_strike_trade_commis = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_TRADE_COMMIS_FLOAT);
            v_sum_strike_other_commis = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_OTHER_COMMIS_FLOAT);
            v_sum_trade_tax = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_TRADE_TAX_FLOAT);
            v_sum_trade_cost_fee = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_TRADE_COST_FEE_FLOAT);
            v_sum_trade_system_use_fee = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_TRADE_SYSTEM_USE_FEE_FLOAT);
            v_sum_stock_settle_fee = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STOCK_SETTLE_FEE_FLOAT);
            v_sum_strike_net_price_flag = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_NET_PRICE_FLAG_INT);
            v_sum_strike_bond_accr_intrst = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_STRIKE_BOND_ACCR_INTRST_FLOAT);
            v_sum_strike_bond_rate_type = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_BOND_RATE_TYPE_INT);
            strcpy(v_sum_strike_order_oper_way, lpTSCall1Ans7->GetString(LDBIZ_SUM_STRIKE_ORDER_OPER_WAY_STR));
            v_sum_strike_exter_comm_flag = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_EXTER_COMM_FLAG_INT);
            v_sum_strike_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_UPDATE_TIMES_INT);
            v_sum_strike_order_batch_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_STRIKE_ORDER_BATCH_NO_INT);
            v_sum_external_no = lpTSCall1Ans7->GetInt64(LDBIZ_SUM_EXTERNAL_NO_INT64);


            // [主动推送][secu.ordertotal][证券主推_订单_订单汇总主推消息]
            lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.21", 0);
            lpPubMsg->SetInt64(LDBIZ_SUM_ORDER_ROW_ID_INT64,v_sum_order_row_id);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_OPOR_NO_INT,v_sum_order_opor_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_CO_NO_INT,v_sum_order_co_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_PD_NO_INT,v_sum_order_pd_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_EXCH_GROUP_NO_INT,v_sum_order_exch_group_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_ASSET_ACCO_NO_INT,v_sum_order_asset_acco_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_PASS_NO_INT,v_sum_order_pass_no);
            lpPubMsg->SetString(LDBIZ_SUM_ORDER_EXCH_CRNCY_TYPE_STR,v_sum_order_exch_crncy_type);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_STOCK_CODE_NO_INT,v_sum_order_stock_code_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_TRADE_CODE_NO_INT,v_sum_order_trade_code_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_TARGET_CODE_NO_INT,v_sum_order_target_code_no);
            lpPubMsg->SetInt64(LDBIZ_SUM_ORDER_EXTERNAL_NO_INT64,v_sum_order_external_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_DATE_INT,v_sum_order_date);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_BATCH_NO_INT,v_sum_order_batch_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_DIR_INT,v_sum_order_dir);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_PRICE_TYPE_INT,v_sum_order_price_type);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_PRICE_FLOAT,v_sum_order_price);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_QTY_FLOAT,v_sum_order_qty);
            lpPubMsg->SetString(LDBIZ_ORDER_SUM_STATUS_STR,v_order_sum_status);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_WTDRAW_QTY_FLOAT,v_sum_order_wtdraw_qty);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_WASTE_QTY_FLOAT,v_sum_order_waste_qty);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_STRIKE_AMT_FLOAT,v_sum_order_strike_amt);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_STRIKE_QTY_FLOAT,v_sum_order_strike_qty);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_STRIKE_AVER_PRICE_FLOAT,v_sum_order_strike_aver_price);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_NET_PRICE_FLAG_INT,v_sum_order_net_price_flag);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_BOND_ACCR_INTRST_FLOAT,v_sum_order_bond_accr_intrst);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_BOND_RATE_TYPE_INT,v_sum_order_bond_rate_type);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_PAR_VALUE_FLOAT,v_sum_order_par_value);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_IMPAWN_RATIO_FLOAT,v_sum_order_impawn_ratio);
            lpPubMsg->SetString(LDBIZ_SUM_ORDER_OPER_WAY_STR,v_sum_order_oper_way);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_UPDATE_TIMES_INT,v_sum_order_update_times);
            glpPubSub_Interface->PubTopics("secu.ordertotal", lpPubMsg);

        // end if;
        }

        //质押提交和质押转回，要推交易代码和标准券代码

        // if @订单方向# = 《订单方向-质押提交》 or @订单方向# = 《订单方向-质押转回》 then
        if (v_order_dir == 21 || v_order_dir == 22)
        {
          //调用过程[事务_交易证券_主推接口_获取资金和质押持仓信息]
          //组织事务请求
          if(lpTSCall1Ans8)
          {
            lpTSCall1Ans8->FreeMsg();
            lpTSCall1Ans8=NULL;
          }
          lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.28", 0);
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
          lpTSCall1Req8->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
          lpTSCall1Req8->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
          lpTSCall1Req8->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
          lpTSCall1Req8->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
          glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
          if(!lpTSCall1Ans8)  //  超时错误
          {
              lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
              lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.28]subcall timed out!");
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
          v_exgp_frozen_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
          v_exgp_unfroz_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
          v_exgp_comm_frozen_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
          v_exgp_comm_unfroz_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
          v_exgp_comm_capt_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
          v_exgp_comm_releas_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
          v_exgp_trade_frozen_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT);
          v_exgp_trade_unfroz_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT);
          v_exgp_trade_capt_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
          v_exgp_trade_releas_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
          v_exgp_strike_capt_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
          v_exgp_strike_releas_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
          v_exgp_cash_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
          v_exgp_posi_id = lpTSCall1Ans8->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
          v_exgp_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
          v_exgp_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
          v_exgp_comm_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT);
          v_exgp_comm_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT);
          v_exgp_comm_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT);
          v_exgp_comm_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
          v_exgp_trade_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT);
          v_exgp_trade_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT);
          v_exgp_trade_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT);
          v_exgp_trade_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
          v_exgp_strike_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT);
          v_exgp_strike_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
          v_exgp_strike_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT);
          v_exgp_strike_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT);
          v_exgp_realize_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
          v_exgp_cost_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
          v_exgp_intrst_cost_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
          v_exgp_intrst_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
          v_exgp_posi_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
          v_asac_cash_id = lpTSCall1Ans8->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
          v_asac_frozen_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
          v_asac_unfroz_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
          v_asac_comm_frozen_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
          v_asac_comm_unfroz_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
          v_asac_comm_capt_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
          v_asac_comm_releas_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
          v_asac_trade_frozen_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT);
          v_asac_trade_unfroz_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT);
          v_asac_trade_capt_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
          v_asac_trade_releas_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
          v_asac_strike_capt_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
          v_asac_strike_releas_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
          v_asac_cash_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);
          v_asac_posi_id = lpTSCall1Ans8->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
          v_asac_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
          v_asac_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
          v_asac_comm_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT);
          v_asac_comm_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT);
          v_asac_comm_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT);
          v_asac_comm_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
          v_asac_trade_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT);
          v_asac_trade_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT);
          v_asac_trade_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT);
          v_asac_trade_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
          v_asac_strike_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT);
          v_asac_strike_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
          v_asac_strike_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT);
          v_asac_strike_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT);
          v_asac_realize_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
          v_asac_cost_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
          v_asac_intrst_cost_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
          v_asac_intrst_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
          v_asac_posi_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);
          v_exgp_target_posi_id = lpTSCall1Ans8->GetInt64(LDBIZ_EXGP_TARGET_POSI_ID_INT64);
          v_exgp_target_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TARGET_FROZEN_QTY_FLOAT);
          v_exgp_target_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TARGET_UNFROZ_QTY_FLOAT);
          v_exgp_target_comm_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TARGET_COMM_FROZEN_QTY_FLOAT);
          v_exgp_target_comm_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TARGET_COMM_UNFROZ_QTY_FLOAT);
          v_exgp_target_comm_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TARGET_COMM_CAPT_QTY_FLOAT);
          v_exgp_target_comm_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TARGET_COMM_RELEAS_QTY_FLOAT);
          v_exgp_target_trade_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TARGET_TRADE_FROZEN_QTY_FLOAT);
          v_exgp_target_trade_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TARGET_TRADE_UNFROZ_QTY_FLOAT);
          v_exgp_target_trade_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TARGET_TRADE_CAPT_QTY_FLOAT);
          v_exgp_target_trade_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TARGET_TRADE_RELEAS_QTY_FLOAT);
          v_exgp_target_strike_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_CAPT_QTY_FLOAT);
          v_exgp_target_strike_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_RELEAS_QTY_FLOAT);
          v_exgp_target_strike_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_FROZEN_QTY_FLOAT);
          v_exgp_target_strike_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_UNFROZ_QTY_FLOAT);
          v_exgp_target_realize_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TARGET_REALIZE_PANDL_FLOAT);
          v_exgp_target_cost_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TARGET_COST_AMT_FLOAT);
          v_exgp_target_intrst_cost_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TARGET_INTRST_COST_AMT_FLOAT);
          v_exgp_target_intrst_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TARGET_INTRST_PANDL_FLOAT);
          v_exgp_target_posi_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_EXGP_TARGET_POSI_UPDATE_TIMES_INT);
          v_asac_target_posi_id = lpTSCall1Ans8->GetInt64(LDBIZ_ASAC_TARGET_POSI_ID_INT64);
          v_asac_target_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TARGET_FROZEN_QTY_FLOAT);
          v_asac_target_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TARGET_UNFROZ_QTY_FLOAT);
          v_asac_target_comm_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TARGET_COMM_FROZEN_QTY_FLOAT);
          v_asac_target_comm_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TARGET_COMM_UNFROZ_QTY_FLOAT);
          v_asac_target_comm_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TARGET_COMM_CAPT_QTY_FLOAT);
          v_asac_target_comm_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TARGET_COMM_RELEAS_QTY_FLOAT);
          v_asac_target_trade_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TARGET_TRADE_FROZEN_QTY_FLOAT);
          v_asac_target_trade_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TARGET_TRADE_UNFROZ_QTY_FLOAT);
          v_asac_target_trade_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TARGET_TRADE_CAPT_QTY_FLOAT);
          v_asac_target_trade_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TARGET_TRADE_RELEAS_QTY_FLOAT);
          v_asac_target_strike_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_CAPT_QTY_FLOAT);
          v_asac_target_strike_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_RELEAS_QTY_FLOAT);
          v_asac_target_strike_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_FROZEN_QTY_FLOAT);
          v_asac_target_strike_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_UNFROZ_QTY_FLOAT);
          v_asac_target_realize_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TARGET_REALIZE_PANDL_FLOAT);
          v_asac_target_cost_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TARGET_COST_AMT_FLOAT);
          v_asac_target_intrst_cost_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TARGET_INTRST_COST_AMT_FLOAT);
          v_asac_target_intrst_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TARGET_INTRST_PANDL_FLOAT);
          v_asac_target_posi_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_ASAC_TARGET_POSI_UPDATE_TIMES_INT);
          v_exgp_put_impawn_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT);
          v_asac_put_impawn_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT);


          // set @证券代码编号# = @交易代码编号#;
          v_stock_code_no = v_trade_code_no;

          // [主动推送][secu.exgpcapital][证券主推_资金_交易组资金主推消息]
          lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.50", 0);
          lpPubMsg->SetInt64(LDBIZ_EXGP_CASH_ID_INT64,v_exgp_cash_id);
          lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
          lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
          lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
          lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT,v_exgp_comm_frozen_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT,v_exgp_comm_unfroz_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT,v_exgp_comm_capt_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT,v_exgp_comm_releas_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT,v_exgp_trade_frozen_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT,v_exgp_trade_unfroz_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT,v_exgp_trade_capt_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT,v_exgp_trade_releas_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT,v_exgp_strike_capt_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT,v_exgp_strike_releas_amt);
          lpPubMsg->SetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT,v_exgp_cash_update_times);
          glpPubSub_Interface->PubTopics("secu.exgpcapital", lpPubMsg);


          // [主动推送][secu.exgpposi][证券主推_持仓_交易组持仓主推消息]
          lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.60", 0);
          lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
          lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
          lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
          lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
          lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
          lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
          lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT,v_exgp_comm_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT,v_exgp_comm_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT,v_exgp_comm_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT,v_exgp_trade_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT,v_exgp_trade_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT,v_exgp_trade_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT,v_exgp_strike_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT,v_exgp_strike_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT,v_exgp_strike_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
          lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
          lpPubMsg->SetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT,v_exgp_put_impawn_qty);
          glpPubSub_Interface->PubTopics("secu.exgpposi", lpPubMsg);


          // [主动推送][secu.asaccapital][证券主推_资金_资产账户资金主推消息]
          lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.51", 0);
          lpPubMsg->SetInt64(LDBIZ_ASAC_CASH_ID_INT64,v_asac_cash_id);
          lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
          lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
          lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT,v_asac_frozen_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT,v_asac_unfroz_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT,v_asac_comm_frozen_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT,v_asac_comm_unfroz_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT,v_asac_comm_capt_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT,v_asac_comm_releas_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT,v_asac_trade_frozen_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT,v_asac_trade_unfroz_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT,v_asac_trade_capt_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT,v_asac_trade_releas_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT,v_asac_strike_capt_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT,v_asac_strike_releas_amt);
          lpPubMsg->SetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT,v_asac_cash_update_times);
          glpPubSub_Interface->PubTopics("secu.asaccapital", lpPubMsg);


          // [主动推送][secu.asacposi][证券主推_持仓_资产账户持仓主推消息]
          lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.61", 0);
          lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
          lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
          lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
          lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
          lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
          lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT,v_asac_comm_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT,v_asac_comm_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT,v_asac_comm_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT,v_asac_trade_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT,v_asac_trade_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT,v_asac_trade_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT,v_asac_strike_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT,v_asac_strike_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT,v_asac_strike_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
          lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
          lpPubMsg->SetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT,v_asac_put_impawn_qty);
          glpPubSub_Interface->PubTopics("secu.asacposi", lpPubMsg);


          // set @证券代码编号# = @标的代码编号#;
          v_stock_code_no = v_target_code_no;

          // set @交易组提交质押数量# = 0;
          v_exgp_put_impawn_qty = 0;

          // set @资产账户提交质押数量# = 0;
          v_asac_put_impawn_qty = 0;

          // set @交易组持仓序号# = @交易组标的持仓序号#;
          v_exgp_posi_id = v_exgp_target_posi_id;

          // set @交易组冻结数量# = @交易组标的冻结数量#;
          v_exgp_frozen_qty = v_exgp_target_frozen_qty;

          // set @交易组解冻数量# = @交易组标的解冻数量#;
          v_exgp_unfroz_qty = v_exgp_target_unfroz_qty;

          // set @交易组指令冻结数量# = @交易组标的指令冻结数量#;
          v_exgp_comm_frozen_qty = v_exgp_target_comm_frozen_qty;

          // set @交易组指令解冻数量# = @交易组标的指令解冻数量#;
          v_exgp_comm_unfroz_qty = v_exgp_target_comm_unfroz_qty;

          // set @交易组指令占用数量# = @交易组标的指令占用数量#;
          v_exgp_comm_capt_qty = v_exgp_target_comm_capt_qty;

          // set @交易组指令释放数量# = @交易组标的指令释放数量#;
          v_exgp_comm_releas_qty = v_exgp_target_comm_releas_qty;

          // set @交易组交易冻结数量# = @交易组标的交易冻结数量#;
          v_exgp_trade_frozen_qty = v_exgp_target_trade_frozen_qty;

          // set @交易组交易解冻数量# = @交易组标的交易解冻数量#;
          v_exgp_trade_unfroz_qty = v_exgp_target_trade_unfroz_qty;

          // set @交易组交易占用数量# = @交易组标的交易占用数量#;
          v_exgp_trade_capt_qty = v_exgp_target_trade_capt_qty;

          // set @交易组交易释放数量# = @交易组标的交易释放数量#;
          v_exgp_trade_releas_qty = v_exgp_target_trade_releas_qty;

          // set @交易组成交占用数量# = @交易组标的成交占用数量#;
          v_exgp_strike_capt_qty = v_exgp_target_strike_capt_qty;

          // set @交易组成交释放数量# = @交易组标的成交释放数量#;
          v_exgp_strike_releas_qty = v_exgp_target_strike_releas_qty;

          // set @交易组成交冻结数量# = @交易组标的成交冻结数量#;
          v_exgp_strike_frozen_qty = v_exgp_target_strike_frozen_qty;

          // set @交易组成交解冻数量# = @交易组标的成交解冻数量#;
          v_exgp_strike_unfroz_qty = v_exgp_target_strike_unfroz_qty;

          // set @交易组实现盈亏# = @交易组标的实现盈亏#;
          v_exgp_realize_pandl = v_exgp_target_realize_pandl;

          // set @交易组成本金额# = @交易组标的成本金额#;
          v_exgp_cost_amt = v_exgp_target_cost_amt;

          // set @交易组利息成本金额# = @交易组标的利息成本金额#;
          v_exgp_intrst_cost_amt = v_exgp_target_intrst_cost_amt;

          // set @交易组利息收益# = @交易组标的利息收益#;
          v_exgp_intrst_pandl = v_exgp_target_intrst_pandl;

          // set @交易组持仓更新次数# = @交易组标的持仓更新次数#;
          v_exgp_posi_update_times = v_exgp_target_posi_update_times;

          // set @资产账户持仓序号# = @资产账户标的持仓序号#;
          v_asac_posi_id = v_asac_target_posi_id;

          // set @资产账户冻结数量# = @资产账户标的冻结数量#;
          v_asac_frozen_qty = v_asac_target_frozen_qty;

          // set @资产账户解冻数量# = @资产账户标的解冻数量#;
          v_asac_unfroz_qty = v_asac_target_unfroz_qty;

          // set @资产账户指令冻结数量# = @资产账户标的指令冻结数量#;
          v_asac_comm_frozen_qty = v_asac_target_comm_frozen_qty;

          // set @资产账户指令解冻数量# = @资产账户标的指令解冻数量#;
          v_asac_comm_unfroz_qty = v_asac_target_comm_unfroz_qty;

          // set @资产账户指令占用数量# = @资产账户标的指令占用数量#;
          v_asac_comm_capt_qty = v_asac_target_comm_capt_qty;

          // set @资产账户指令释放数量# = @资产账户标的指令释放数量#;
          v_asac_comm_releas_qty = v_asac_target_comm_releas_qty;

          // set @资产账户交易冻结数量# = @资产账户标的交易冻结数量#;
          v_asac_trade_frozen_qty = v_asac_target_trade_frozen_qty;

          // set @资产账户交易解冻数量# = @资产账户标的交易解冻数量#;
          v_asac_trade_unfroz_qty = v_asac_target_trade_unfroz_qty;

          // set @资产账户交易占用数量# = @资产账户标的交易占用数量#;
          v_asac_trade_capt_qty = v_asac_target_trade_capt_qty;

          // set @资产账户交易释放数量# = @资产账户标的交易释放数量#;
          v_asac_trade_releas_qty = v_asac_target_trade_releas_qty;

          // set @资产账户成交占用数量# = @资产账户标的成交占用数量#;
          v_asac_strike_capt_qty = v_asac_target_strike_capt_qty;

          // set @资产账户成交释放数量# = @资产账户标的成交释放数量#;
          v_asac_strike_releas_qty = v_asac_target_strike_releas_qty;

          // set @资产账户成交冻结数量# = @资产账户标的成交冻结数量#;
          v_asac_strike_frozen_qty = v_asac_target_strike_frozen_qty;

          // set @资产账户成交解冻数量# = @资产账户标的成交解冻数量#;
          v_asac_strike_unfroz_qty = v_asac_target_strike_unfroz_qty;

          // set @资产账户实现盈亏# = @资产账户标的实现盈亏#;
          v_asac_realize_pandl = v_asac_target_realize_pandl;

          // set @资产账户成本金额# = @资产账户标的成本金额#;
          v_asac_cost_amt = v_asac_target_cost_amt;

          // set @资产账户利息成本金额# = @资产账户标的利息成本金额#;
          v_asac_intrst_cost_amt = v_asac_target_intrst_cost_amt;

          // set @资产账户利息收益# = @资产账户标的利息收益#;
          v_asac_intrst_pandl = v_asac_target_intrst_pandl;

          // set @资产账户持仓更新次数# = @资产账户标的持仓更新次数#;
          v_asac_posi_update_times = v_asac_target_posi_update_times;

          // [主动推送][secu.exgpposi][证券主推_持仓_交易组持仓主推消息]
          lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.60", 0);
          lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
          lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
          lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
          lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
          lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
          lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
          lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT,v_exgp_comm_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT,v_exgp_comm_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT,v_exgp_comm_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT,v_exgp_trade_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT,v_exgp_trade_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT,v_exgp_trade_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT,v_exgp_strike_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT,v_exgp_strike_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT,v_exgp_strike_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
          lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
          lpPubMsg->SetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT,v_exgp_put_impawn_qty);
          glpPubSub_Interface->PubTopics("secu.exgpposi", lpPubMsg);


          // [主动推送][secu.asacposi][证券主推_持仓_资产账户持仓主推消息]
          lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.61", 0);
          lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
          lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
          lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
          lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
          lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
          lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT,v_asac_comm_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT,v_asac_comm_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT,v_asac_comm_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT,v_asac_trade_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT,v_asac_trade_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT,v_asac_trade_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT,v_asac_strike_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT,v_asac_strike_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT,v_asac_strike_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
          lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
          lpPubMsg->SetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT,v_asac_put_impawn_qty);
          glpPubSub_Interface->PubTopics("secu.asacposi", lpPubMsg);


        }
        // else if @订单方向# = 《订单方向-融资回购》 or @订单方向# = 《订单方向-融券回购》 then
        else if (v_order_dir == 3 || v_order_dir == 4)
        {

          // set @证券代码编号# = @标的代码编号#;
          v_stock_code_no = v_target_code_no;
          //调用过程[事务_交易证券_主推接口_获取资金持仓信息]
          //组织事务请求
          if(lpTSCall1Ans9)
          {
            lpTSCall1Ans9->FreeMsg();
            lpTSCall1Ans9=NULL;
          }
          lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.13", 0);
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
          lpTSCall1Req9->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpTSCall1Req9->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
          lpTSCall1Req9->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
          lpTSCall1Req9->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
          glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
          if(!lpTSCall1Ans9)  //  超时错误
          {
              lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
              lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.13]subcall timed out!");
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
          v_exgp_cash_id = lpTSCall1Ans9->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
          v_exgp_frozen_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
          v_exgp_unfroz_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
          v_exgp_comm_frozen_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
          v_exgp_comm_unfroz_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
          v_exgp_comm_capt_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
          v_exgp_comm_releas_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
          v_exgp_trade_frozen_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT);
          v_exgp_trade_unfroz_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT);
          v_exgp_trade_capt_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
          v_exgp_trade_releas_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
          v_exgp_strike_capt_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
          v_exgp_strike_releas_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
          v_exgp_cash_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
          v_exgp_posi_id = lpTSCall1Ans9->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
          v_exgp_frozen_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
          v_exgp_unfroz_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
          v_exgp_comm_frozen_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT);
          v_exgp_comm_unfroz_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT);
          v_exgp_comm_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT);
          v_exgp_comm_releas_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
          v_exgp_trade_frozen_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT);
          v_exgp_trade_unfroz_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT);
          v_exgp_trade_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT);
          v_exgp_trade_releas_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
          v_exgp_strike_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT);
          v_exgp_strike_releas_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
          v_exgp_strike_frozen_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT);
          v_exgp_strike_unfroz_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT);
          v_exgp_realize_pandl = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
          v_exgp_cost_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
          v_exgp_intrst_cost_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
          v_exgp_intrst_pandl = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
          v_exgp_posi_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
          v_asac_cash_id = lpTSCall1Ans9->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
          v_asac_frozen_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
          v_asac_unfroz_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
          v_asac_comm_frozen_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
          v_asac_comm_unfroz_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
          v_asac_comm_capt_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
          v_asac_comm_releas_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
          v_asac_trade_frozen_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT);
          v_asac_trade_unfroz_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT);
          v_asac_trade_capt_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
          v_asac_trade_releas_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
          v_asac_strike_capt_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
          v_asac_strike_releas_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
          v_asac_cash_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);
          v_asac_posi_id = lpTSCall1Ans9->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
          v_asac_frozen_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
          v_asac_unfroz_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
          v_asac_comm_frozen_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT);
          v_asac_comm_unfroz_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT);
          v_asac_comm_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT);
          v_asac_comm_releas_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
          v_asac_trade_frozen_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT);
          v_asac_trade_unfroz_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT);
          v_asac_trade_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT);
          v_asac_trade_releas_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
          v_asac_strike_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT);
          v_asac_strike_releas_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
          v_asac_strike_frozen_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT);
          v_asac_strike_unfroz_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT);
          v_asac_realize_pandl = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
          v_asac_cost_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
          v_asac_intrst_cost_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
          v_asac_intrst_pandl = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
          v_asac_posi_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


          // [主动推送][secu.exgpcapital][证券主推_资金_交易组资金主推消息]
          lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.50", 0);
          lpPubMsg->SetInt64(LDBIZ_EXGP_CASH_ID_INT64,v_exgp_cash_id);
          lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
          lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
          lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
          lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT,v_exgp_comm_frozen_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT,v_exgp_comm_unfroz_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT,v_exgp_comm_capt_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT,v_exgp_comm_releas_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT,v_exgp_trade_frozen_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT,v_exgp_trade_unfroz_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT,v_exgp_trade_capt_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT,v_exgp_trade_releas_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT,v_exgp_strike_capt_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT,v_exgp_strike_releas_amt);
          lpPubMsg->SetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT,v_exgp_cash_update_times);
          glpPubSub_Interface->PubTopics("secu.exgpcapital", lpPubMsg);


          // [主动推送][secu.exgpposi][证券主推_持仓_交易组持仓主推消息]
          lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.60", 0);
          lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
          lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
          lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
          lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
          lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
          lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
          lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT,v_exgp_comm_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT,v_exgp_comm_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT,v_exgp_comm_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT,v_exgp_trade_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT,v_exgp_trade_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT,v_exgp_trade_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT,v_exgp_strike_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT,v_exgp_strike_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT,v_exgp_strike_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
          lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
          lpPubMsg->SetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT,v_exgp_put_impawn_qty);
          glpPubSub_Interface->PubTopics("secu.exgpposi", lpPubMsg);


          // [主动推送][secu.asaccapital][证券主推_资金_资产账户资金主推消息]
          lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.51", 0);
          lpPubMsg->SetInt64(LDBIZ_ASAC_CASH_ID_INT64,v_asac_cash_id);
          lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
          lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
          lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT,v_asac_frozen_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT,v_asac_unfroz_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT,v_asac_comm_frozen_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT,v_asac_comm_unfroz_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT,v_asac_comm_capt_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT,v_asac_comm_releas_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT,v_asac_trade_frozen_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT,v_asac_trade_unfroz_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT,v_asac_trade_capt_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT,v_asac_trade_releas_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT,v_asac_strike_capt_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT,v_asac_strike_releas_amt);
          lpPubMsg->SetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT,v_asac_cash_update_times);
          glpPubSub_Interface->PubTopics("secu.asaccapital", lpPubMsg);


          // [主动推送][secu.asacposi][证券主推_持仓_资产账户持仓主推消息]
          lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.61", 0);
          lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
          lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
          lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
          lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
          lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
          lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT,v_asac_comm_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT,v_asac_comm_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT,v_asac_comm_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT,v_asac_trade_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT,v_asac_trade_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT,v_asac_trade_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT,v_asac_strike_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT,v_asac_strike_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT,v_asac_strike_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
          lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
          lpPubMsg->SetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT,v_asac_put_impawn_qty);
          glpPubSub_Interface->PubTopics("secu.asacposi", lpPubMsg);

        }
        // else
        else
        {

          //调用过程[事务_交易证券_主推接口_获取资金持仓信息]
          //组织事务请求
          if(lpTSCall1Ans10)
          {
            lpTSCall1Ans10->FreeMsg();
            lpTSCall1Ans10=NULL;
          }
          lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.13", 0);
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
          lpTSCall1Req10->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
          lpTSCall1Req10->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
          lpTSCall1Req10->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
          glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
          if(!lpTSCall1Ans10)  //  超时错误
          {
              lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
              lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.13]subcall timed out!");
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
          v_exgp_cash_id = lpTSCall1Ans10->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
          v_exgp_frozen_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
          v_exgp_unfroz_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
          v_exgp_comm_frozen_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
          v_exgp_comm_unfroz_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
          v_exgp_comm_capt_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
          v_exgp_comm_releas_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
          v_exgp_trade_frozen_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT);
          v_exgp_trade_unfroz_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT);
          v_exgp_trade_capt_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
          v_exgp_trade_releas_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
          v_exgp_strike_capt_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
          v_exgp_strike_releas_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
          v_exgp_cash_update_times = lpTSCall1Ans10->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
          v_exgp_posi_id = lpTSCall1Ans10->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
          v_exgp_frozen_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
          v_exgp_unfroz_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
          v_exgp_comm_frozen_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT);
          v_exgp_comm_unfroz_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT);
          v_exgp_comm_capt_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT);
          v_exgp_comm_releas_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
          v_exgp_trade_frozen_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT);
          v_exgp_trade_unfroz_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT);
          v_exgp_trade_capt_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT);
          v_exgp_trade_releas_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
          v_exgp_strike_capt_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT);
          v_exgp_strike_releas_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
          v_exgp_strike_frozen_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT);
          v_exgp_strike_unfroz_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT);
          v_exgp_realize_pandl = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
          v_exgp_cost_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
          v_exgp_intrst_cost_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
          v_exgp_intrst_pandl = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
          v_exgp_posi_update_times = lpTSCall1Ans10->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
          v_asac_cash_id = lpTSCall1Ans10->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
          v_asac_frozen_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
          v_asac_unfroz_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
          v_asac_comm_frozen_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
          v_asac_comm_unfroz_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
          v_asac_comm_capt_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
          v_asac_comm_releas_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
          v_asac_trade_frozen_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT);
          v_asac_trade_unfroz_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT);
          v_asac_trade_capt_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
          v_asac_trade_releas_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
          v_asac_strike_capt_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
          v_asac_strike_releas_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
          v_asac_cash_update_times = lpTSCall1Ans10->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);
          v_asac_posi_id = lpTSCall1Ans10->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
          v_asac_frozen_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
          v_asac_unfroz_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
          v_asac_comm_frozen_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT);
          v_asac_comm_unfroz_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT);
          v_asac_comm_capt_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT);
          v_asac_comm_releas_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
          v_asac_trade_frozen_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT);
          v_asac_trade_unfroz_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT);
          v_asac_trade_capt_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT);
          v_asac_trade_releas_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
          v_asac_strike_capt_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT);
          v_asac_strike_releas_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
          v_asac_strike_frozen_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT);
          v_asac_strike_unfroz_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT);
          v_asac_realize_pandl = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
          v_asac_cost_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
          v_asac_intrst_cost_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
          v_asac_intrst_pandl = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
          v_asac_posi_update_times = lpTSCall1Ans10->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


          // [主动推送][secu.exgpcapital][证券主推_资金_交易组资金主推消息]
          lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.50", 0);
          lpPubMsg->SetInt64(LDBIZ_EXGP_CASH_ID_INT64,v_exgp_cash_id);
          lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
          lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
          lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
          lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT,v_exgp_comm_frozen_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT,v_exgp_comm_unfroz_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT,v_exgp_comm_capt_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT,v_exgp_comm_releas_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT,v_exgp_trade_frozen_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT,v_exgp_trade_unfroz_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT,v_exgp_trade_capt_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT,v_exgp_trade_releas_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT,v_exgp_strike_capt_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT,v_exgp_strike_releas_amt);
          lpPubMsg->SetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT,v_exgp_cash_update_times);
          glpPubSub_Interface->PubTopics("secu.exgpcapital", lpPubMsg);


          // [主动推送][secu.exgpposi][证券主推_持仓_交易组持仓主推消息]
          lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.60", 0);
          lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
          lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
          lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
          lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
          lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
          lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
          lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT,v_exgp_comm_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT,v_exgp_comm_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT,v_exgp_comm_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT,v_exgp_trade_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT,v_exgp_trade_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT,v_exgp_trade_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT,v_exgp_strike_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT,v_exgp_strike_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT,v_exgp_strike_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
          lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
          lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
          lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
          lpPubMsg->SetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT,v_exgp_put_impawn_qty);
          glpPubSub_Interface->PubTopics("secu.exgpposi", lpPubMsg);


          // [主动推送][secu.asaccapital][证券主推_资金_资产账户资金主推消息]
          lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.51", 0);
          lpPubMsg->SetInt64(LDBIZ_ASAC_CASH_ID_INT64,v_asac_cash_id);
          lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
          lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
          lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT,v_asac_frozen_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT,v_asac_unfroz_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT,v_asac_comm_frozen_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT,v_asac_comm_unfroz_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT,v_asac_comm_capt_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT,v_asac_comm_releas_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT,v_asac_trade_frozen_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT,v_asac_trade_unfroz_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT,v_asac_trade_capt_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT,v_asac_trade_releas_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT,v_asac_strike_capt_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT,v_asac_strike_releas_amt);
          lpPubMsg->SetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT,v_asac_cash_update_times);
          glpPubSub_Interface->PubTopics("secu.asaccapital", lpPubMsg);


          // [主动推送][secu.asacposi][证券主推_持仓_资产账户持仓主推消息]
          lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.61", 0);
          lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
          lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
          lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
          lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
          lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
          lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
          lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT,v_asac_comm_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT,v_asac_comm_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT,v_asac_comm_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT,v_asac_trade_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT,v_asac_trade_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT,v_asac_trade_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT,v_asac_strike_capt_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT,v_asac_strike_frozen_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT,v_asac_strike_unfroz_qty);
          lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
          lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
          lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
          lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
          lpPubMsg->SetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT,v_asac_put_impawn_qty);
          glpPubSub_Interface->PubTopics("secu.asacposi", lpPubMsg);

        // end if;
        }


        // if (@订单操作方式# = 《订单操作方式-增强交易》 or @订单操作方式# = 《订单操作方式-增强交易平仓》) then
        if ((strcmp(v_order_oper_way , "14")==0 || strcmp(v_order_oper_way , "51")==0))
        {
        //增强交易主推
            //调用过程[事务_交易证券_主推接口_获取券源信息]
            //组织事务请求
            if(lpTSCall1Ans11)
            {
              lpTSCall1Ans11->FreeMsg();
              lpTSCall1Ans11=NULL;
            }
            lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.35", 0);
            lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req11->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
            lpTSCall1Req11->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
            lpTSCall1Req11->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpTSCall1Req11->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
            lpTSCall1Req11->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
            lpTSCall1Req11->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
            glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
            if(!lpTSCall1Ans11)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.35]subcall timed out!");
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
            v_co_no = lpTSCall1Ans11->GetInt32(LDBIZ_CO_NO_INT);
            v_pd_no = lpTSCall1Ans11->GetInt32(LDBIZ_PD_NO_INT);
            strcpy(v_stock_code, lpTSCall1Ans11->GetString(LDBIZ_STOCK_CODE_STR));
            v_exch_no = lpTSCall1Ans11->GetInt32(LDBIZ_EXCH_NO_INT);
            v_source_stock_qty = lpTSCall1Ans11->GetDouble(LDBIZ_SOURCE_STOCK_QTY_FLOAT);
            v_single_limit_qty = lpTSCall1Ans11->GetDouble(LDBIZ_SINGLE_LIMIT_QTY_FLOAT);
            v_assigned_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASSIGNED_QTY_FLOAT);
            v_trade_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_TRADE_RELEAS_QTY_FLOAT);
            v_trade_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_TRADE_CAPT_QTY_FLOAT);
            v_strike_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
            v_strike_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_STRIKE_CAPT_QTY_FLOAT);
            v_over_night_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_OVER_NIGHT_PANDL_FLOAT);
            v_sum_realize_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_SUM_REALIZE_PANDL_FLOAT);
            v_total_open_posi_fee = lpTSCall1Ans11->GetDouble(LDBIZ_TOTAL_OPEN_POSI_FEE_FLOAT);
            v_total_close_posi_fee = lpTSCall1Ans11->GetDouble(LDBIZ_TOTAL_CLOSE_POSI_FEE_FLOAT);
            v_out_order_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_OUT_ORDER_RELEAS_QTY_FLOAT);
            v_out_order_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_OUT_ORDER_CAPT_QTY_FLOAT);
            v_out_strike_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_OUT_STRIKE_RELEAS_QTY_FLOAT);
            v_out_strike_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_OUT_STRIKE_CAPT_QTY_FLOAT);
            strcpy(v_remark_info, lpTSCall1Ans11->GetString(LDBIZ_REMARK_INFO_STR));
            v_buy_avail_qty = lpTSCall1Ans11->GetDouble(LDBIZ_BUY_AVAIL_QTY_FLOAT);
            v_sell_avail_qty = lpTSCall1Ans11->GetDouble(LDBIZ_SELL_AVAIL_QTY_FLOAT);
            v_posi_qty = lpTSCall1Ans11->GetDouble(LDBIZ_POSI_QTY_FLOAT);
            v_today_trade_fee = lpTSCall1Ans11->GetDouble(LDBIZ_TODAY_TRADE_FEE_FLOAT);
            v_today_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_TODAY_PANDL_FLOAT);
            v_diff_qty = lpTSCall1Ans11->GetDouble(LDBIZ_DIFF_QTY_FLOAT);
            v_over_night_trade_buy_qty = lpTSCall1Ans11->GetDouble(LDBIZ_OVER_NIGHT_TRADE_BUY_QTY_FLOAT);
            v_over_night_trade_sell_qty = lpTSCall1Ans11->GetDouble(LDBIZ_OVER_NIGHT_TRADE_SELL_QTY_FLOAT);
            v_over_night_strike_sell_qty = lpTSCall1Ans11->GetDouble(LDBIZ_OVER_NIGHT_STRIKE_SELL_QTY_FLOAT);
            v_over_night_sumtrd_sell_qty = lpTSCall1Ans11->GetDouble(LDBIZ_OVER_NIGHT_SUMTRD_SELL_QTY_FLOAT);
            v_over_night_sumstk_sell_qty = lpTSCall1Ans11->GetDouble(LDBIZ_OVER_NIGHT_SUMSTK_SELL_QTY_FLOAT);
            v_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_UPDATE_TIMES_INT);


            // [主动推送][secu.t0stocksource][证券主推_增强交易_券源变化主推消息]
            lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.701", 0);
            lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
            lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
            lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
            lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
            lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
            lpPubMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
            lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpPubMsg->SetDouble(LDBIZ_SOURCE_STOCK_QTY_FLOAT,v_source_stock_qty);
            lpPubMsg->SetDouble(LDBIZ_SINGLE_LIMIT_QTY_FLOAT,v_single_limit_qty);
            lpPubMsg->SetDouble(LDBIZ_ASSIGNED_QTY_FLOAT,v_assigned_qty);
            lpPubMsg->SetDouble(LDBIZ_TRADE_RELEAS_QTY_FLOAT,v_trade_releas_qty);
            lpPubMsg->SetDouble(LDBIZ_TRADE_CAPT_QTY_FLOAT,v_trade_capt_qty);
            lpPubMsg->SetDouble(LDBIZ_STRIKE_RELEAS_QTY_FLOAT,v_strike_releas_qty);
            lpPubMsg->SetDouble(LDBIZ_STRIKE_CAPT_QTY_FLOAT,v_strike_capt_qty);
            lpPubMsg->SetDouble(LDBIZ_OVER_NIGHT_PANDL_FLOAT,v_over_night_pandl);
            lpPubMsg->SetDouble(LDBIZ_SUM_REALIZE_PANDL_FLOAT,v_sum_realize_pandl);
            lpPubMsg->SetDouble(LDBIZ_TOTAL_OPEN_POSI_FEE_FLOAT,v_total_open_posi_fee);
            lpPubMsg->SetDouble(LDBIZ_TOTAL_CLOSE_POSI_FEE_FLOAT,v_total_close_posi_fee);
            lpPubMsg->SetDouble(LDBIZ_OUT_ORDER_RELEAS_QTY_FLOAT,v_out_order_releas_qty);
            lpPubMsg->SetDouble(LDBIZ_OUT_ORDER_CAPT_QTY_FLOAT,v_out_order_capt_qty);
            lpPubMsg->SetDouble(LDBIZ_OUT_STRIKE_RELEAS_QTY_FLOAT,v_out_strike_releas_qty);
            lpPubMsg->SetDouble(LDBIZ_OUT_STRIKE_CAPT_QTY_FLOAT,v_out_strike_capt_qty);
            lpPubMsg->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
            lpPubMsg->SetDouble(LDBIZ_BUY_AVAIL_QTY_FLOAT,v_buy_avail_qty);
            lpPubMsg->SetDouble(LDBIZ_SELL_AVAIL_QTY_FLOAT,v_sell_avail_qty);
            lpPubMsg->SetDouble(LDBIZ_POSI_QTY_FLOAT,v_posi_qty);
            lpPubMsg->SetDouble(LDBIZ_TODAY_TRADE_FEE_FLOAT,v_today_trade_fee);
            lpPubMsg->SetDouble(LDBIZ_TODAY_PANDL_FLOAT,v_today_pandl);
            lpPubMsg->SetDouble(LDBIZ_DIFF_QTY_FLOAT,v_diff_qty);
            lpPubMsg->SetDouble(LDBIZ_OVER_NIGHT_TRADE_BUY_QTY_FLOAT,v_over_night_trade_buy_qty);
            lpPubMsg->SetDouble(LDBIZ_OVER_NIGHT_TRADE_SELL_QTY_FLOAT,v_over_night_trade_sell_qty);
            lpPubMsg->SetDouble(LDBIZ_OVER_NIGHT_STRIKE_SELL_QTY_FLOAT,v_over_night_strike_sell_qty);
            lpPubMsg->SetDouble(LDBIZ_OVER_NIGHT_SUMTRD_SELL_QTY_FLOAT,v_over_night_sumtrd_sell_qty);
            lpPubMsg->SetDouble(LDBIZ_OVER_NIGHT_SUMSTK_SELL_QTY_FLOAT,v_over_night_sumstk_sell_qty);
            lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
            glpPubSub_Interface->PubTopics("secu.t0stocksource", lpPubMsg);

            //调用过程[事务_交易证券_主推接口_获取账户汇总信息查询]
            //组织事务请求
            if(lpTSCall1Ans12)
            {
              lpTSCall1Ans12->FreeMsg();
              lpTSCall1Ans12=NULL;
            }
            lpTSCall1Req12=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.37", 0);
            lpTSCall1Req12->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req12->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req12->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req12->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req12->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req12->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req12->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req12->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req12->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            glpTSSubcallSerives->SubCall(lpTSCall1Req12, &lpTSCall1Ans12, 5000);
            if(!lpTSCall1Ans12)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.37]subcall timed out!");
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
            v_trade_amt = lpTSCall1Ans12->GetDouble(LDBIZ_TRADE_AMT_FLOAT);
            v_trade_qty = lpTSCall1Ans12->GetDouble(LDBIZ_TRADE_QTY_FLOAT);
            v_realize_pandl = lpTSCall1Ans12->GetDouble(LDBIZ_REALIZE_PANDL_FLOAT);
            v_yield_rate = lpTSCall1Ans12->GetDouble(LDBIZ_YIELD_RATE_FLOAT);
            v_all_fee = lpTSCall1Ans12->GetDouble(LDBIZ_ALL_FEE_FLOAT);
            v_over_night_pandl = lpTSCall1Ans12->GetDouble(LDBIZ_OVER_NIGHT_PANDL_FLOAT);
            v_sum_realize_pandl = lpTSCall1Ans12->GetDouble(LDBIZ_SUM_REALIZE_PANDL_FLOAT);
            v_update_times = lpTSCall1Ans12->GetInt32(LDBIZ_UPDATE_TIMES_INT);


            // [主动推送][secu.t0accosum][证券主推_增强交易_t0账户汇总主推消息]
            lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.703", 0);
            lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpPubMsg->SetDouble(LDBIZ_TRADE_AMT_FLOAT,v_trade_amt);
            lpPubMsg->SetDouble(LDBIZ_TRADE_QTY_FLOAT,v_trade_qty);
            lpPubMsg->SetDouble(LDBIZ_REALIZE_PANDL_FLOAT,v_realize_pandl);
            lpPubMsg->SetDouble(LDBIZ_YIELD_RATE_FLOAT,v_yield_rate);
            lpPubMsg->SetDouble(LDBIZ_OVER_NIGHT_PANDL_FLOAT,v_over_night_pandl);
            lpPubMsg->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
            lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
            glpPubSub_Interface->PubTopics("secu.t0accosum", lpPubMsg);

            //调用过程[事务_交易证券_主推接口_获取t0操作员可用金额]
            //组织事务请求
            if(lpTSCall1Ans13)
            {
              lpTSCall1Ans13->FreeMsg();
              lpTSCall1Ans13=NULL;
            }
            lpTSCall1Req13=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.38", 0);
            lpTSCall1Req13->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req13->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req13->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req13->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req13->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req13->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req13->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req13->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req13->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpTSCall1Req13->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
            glpTSSubcallSerives->SubCall(lpTSCall1Req13, &lpTSCall1Ans13, 5000);
            if(!lpTSCall1Ans13)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.38]subcall timed out!");
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
            v_avail_amt = lpTSCall1Ans13->GetDouble(LDBIZ_AVAIL_AMT_FLOAT);
            v_sum_realize_pandl = lpTSCall1Ans13->GetDouble(LDBIZ_SUM_REALIZE_PANDL_FLOAT);
            v_update_times = lpTSCall1Ans13->GetInt32(LDBIZ_UPDATE_TIMES_INT);


            // [主动推送][secu.t0availcapital][证券主推_增强交易_t0操作员可用金额主推消息]
            lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.704", 0);
            lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpPubMsg->SetDouble(LDBIZ_AVAIL_AMT_FLOAT,v_avail_amt);
            lpPubMsg->SetDouble(LDBIZ_SUM_REALIZE_PANDL_FLOAT,v_sum_realize_pandl);
            lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
            glpPubSub_Interface->PubTopics("secu.t0availcapital", lpPubMsg);

           //调用过程[事务_交易证券_主推接口_获取操作员可用交易组资金信息]
           //组织事务请求
           if(lpTSCall1Ans14)
           {
             lpTSCall1Ans14->FreeMsg();
             lpTSCall1Ans14=NULL;
           }
           lpTSCall1Req14=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.46", 0);
           lpTSCall1Req14->SetInt32(LDTAG_PRIORITY, iPriority);
           lpTSCall1Req14->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
           lpTSCall1Req14->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
           lpTSCall1Req14->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
           lpTSCall1Req14->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
           lpTSCall1Req14->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
           lpTSCall1Req14->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
           lpTSCall1Req14->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
           lpTSCall1Req14->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
           lpTSCall1Req14->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
           lpTSCall1Req14->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
           lpTSCall1Req14->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
           lpTSCall1Req14->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
           lpTSCall1Req14->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
           glpTSSubcallSerives->SubCall(lpTSCall1Req14, &lpTSCall1Ans14, 5000);
           if(!lpTSCall1Ans14)  //  超时错误
           {
               lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
               lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.46]subcall timed out!");
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
           v_begin_amt = lpTSCall1Ans14->GetDouble(LDBIZ_BEGIN_AMT_FLOAT);
           v_curr_amt = lpTSCall1Ans14->GetDouble(LDBIZ_CURR_AMT_FLOAT);
           v_frozen_amt = lpTSCall1Ans14->GetDouble(LDBIZ_FROZEN_AMT_FLOAT);
           v_unfroz_amt = lpTSCall1Ans14->GetDouble(LDBIZ_UNFROZ_AMT_FLOAT);
           v_comm_frozen_amt = lpTSCall1Ans14->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
           v_comm_unfroz_amt = lpTSCall1Ans14->GetDouble(LDBIZ_COMM_UNFROZ_AMT_FLOAT);
           v_comm_capt_amt = lpTSCall1Ans14->GetDouble(LDBIZ_COMM_CAPT_AMT_FLOAT);
           v_comm_releas_amt = lpTSCall1Ans14->GetDouble(LDBIZ_COMM_RELEAS_AMT_FLOAT);
           v_trade_frozen_amt = lpTSCall1Ans14->GetDouble(LDBIZ_TRADE_FROZEN_AMT_FLOAT);
           v_trade_unfroz_amt = lpTSCall1Ans14->GetDouble(LDBIZ_TRADE_UNFROZ_AMT_FLOAT);
           v_trade_capt_amt = lpTSCall1Ans14->GetDouble(LDBIZ_TRADE_CAPT_AMT_FLOAT);
           v_trade_releas_amt = lpTSCall1Ans14->GetDouble(LDBIZ_TRADE_RELEAS_AMT_FLOAT);
           v_strike_capt_amt = lpTSCall1Ans14->GetDouble(LDBIZ_STRIKE_CAPT_AMT_FLOAT);
           v_strike_releas_amt = lpTSCall1Ans14->GetDouble(LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
           v_update_times = lpTSCall1Ans14->GetInt32(LDBIZ_UPDATE_TIMES_INT);


           // [主动推送][secu.t0oporallowexgrpcap][证券主推_增强交易_操作员可用交易组资金变化主推消息]
           lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.710", 0);
           lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
           lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
           lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
           lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
           lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
           lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
           lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
           lpPubMsg->SetDouble(LDBIZ_BEGIN_AMT_FLOAT,v_begin_amt);
           lpPubMsg->SetDouble(LDBIZ_CURR_AMT_FLOAT,v_curr_amt);
           lpPubMsg->SetDouble(LDBIZ_FROZEN_AMT_FLOAT,v_frozen_amt);
           lpPubMsg->SetDouble(LDBIZ_UNFROZ_AMT_FLOAT,v_unfroz_amt);
           lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT,v_comm_frozen_amt);
           lpPubMsg->SetDouble(LDBIZ_COMM_UNFROZ_AMT_FLOAT,v_comm_unfroz_amt);
           lpPubMsg->SetDouble(LDBIZ_COMM_CAPT_AMT_FLOAT,v_comm_capt_amt);
           lpPubMsg->SetDouble(LDBIZ_COMM_RELEAS_AMT_FLOAT,v_comm_releas_amt);
           lpPubMsg->SetDouble(LDBIZ_TRADE_FROZEN_AMT_FLOAT,v_trade_frozen_amt);
           lpPubMsg->SetDouble(LDBIZ_TRADE_UNFROZ_AMT_FLOAT,v_trade_unfroz_amt);
           lpPubMsg->SetDouble(LDBIZ_TRADE_CAPT_AMT_FLOAT,v_trade_capt_amt);
           lpPubMsg->SetDouble(LDBIZ_TRADE_RELEAS_AMT_FLOAT,v_trade_releas_amt);
           lpPubMsg->SetDouble(LDBIZ_STRIKE_CAPT_AMT_FLOAT,v_strike_capt_amt);
           lpPubMsg->SetDouble(LDBIZ_STRIKE_RELEAS_AMT_FLOAT,v_strike_releas_amt);
           lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
           glpPubSub_Interface->PubTopics("secu.t0oporallowexgrpcap", lpPubMsg);

        // end if;
        }


        // if @组合持仓序号# > 0 then
        if (v_combo_posi_id > 0)
        {
            //调用过程[事务_交易证券_主推接口_获取组合持仓]
            //组织事务请求
            if(lpTSCall1Ans15)
            {
              lpTSCall1Ans15->FreeMsg();
              lpTSCall1Ans15=NULL;
            }
            lpTSCall1Req15=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.43", 0);
            lpTSCall1Req15->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req15->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req15->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req15->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req15->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req15->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req15->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req15->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req15->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
            lpTSCall1Req15->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpTSCall1Req15->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
            lpTSCall1Req15->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
            lpTSCall1Req15->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
            lpTSCall1Req15->SetInt32(LDBIZ_OPEN_POSI_DATE_INT,v_open_posi_date);
            lpTSCall1Req15->SetInt64(LDBIZ_COMBO_POSI_ID_INT64,v_combo_posi_id);
            glpTSSubcallSerives->SubCall(lpTSCall1Req15, &lpTSCall1Ans15, 5000);
            if(!lpTSCall1Ans15)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.43]subcall timed out!");
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
            v_co_no = lpTSCall1Ans15->GetInt32(LDBIZ_CO_NO_INT);
            v_pd_no = lpTSCall1Ans15->GetInt32(LDBIZ_PD_NO_INT);
            strcpy(v_stock_code, lpTSCall1Ans15->GetString(LDBIZ_STOCK_CODE_STR));
            v_exch_no = lpTSCall1Ans15->GetInt32(LDBIZ_EXCH_NO_INT);
            v_curr_qty = lpTSCall1Ans15->GetDouble(LDBIZ_CURR_QTY_FLOAT);
            v_posi_qty = lpTSCall1Ans15->GetDouble(LDBIZ_POSI_QTY_FLOAT);
            v_frozen_qty = lpTSCall1Ans15->GetDouble(LDBIZ_FROZEN_QTY_FLOAT);
            v_unfroz_qty = lpTSCall1Ans15->GetDouble(LDBIZ_UNFROZ_QTY_FLOAT);
            v_pre_settle_qty = lpTSCall1Ans15->GetDouble(LDBIZ_PRE_SETTLE_QTY_FLOAT);
            v_trade_frozen_qty = lpTSCall1Ans15->GetDouble(LDBIZ_TRADE_FROZEN_QTY_FLOAT);
            v_trade_unfroz_qty = lpTSCall1Ans15->GetDouble(LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
            v_trade_capt_qty = lpTSCall1Ans15->GetDouble(LDBIZ_TRADE_CAPT_QTY_FLOAT);
            v_trade_releas_qty = lpTSCall1Ans15->GetDouble(LDBIZ_TRADE_RELEAS_QTY_FLOAT);
            v_strike_capt_qty = lpTSCall1Ans15->GetDouble(LDBIZ_STRIKE_CAPT_QTY_FLOAT);
            v_strike_releas_qty = lpTSCall1Ans15->GetDouble(LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
            v_strike_frozen_qty = lpTSCall1Ans15->GetDouble(LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
            v_strike_unfroz_qty = lpTSCall1Ans15->GetDouble(LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
            v_realize_pandl = lpTSCall1Ans15->GetDouble(LDBIZ_REALIZE_PANDL_FLOAT);
            v_cost_amt = lpTSCall1Ans15->GetDouble(LDBIZ_COST_AMT_FLOAT);
            v_intrst_cost_amt = lpTSCall1Ans15->GetDouble(LDBIZ_INTRST_COST_AMT_FLOAT);
            v_intrst_pandl = lpTSCall1Ans15->GetDouble(LDBIZ_INTRST_PANDL_FLOAT);
            v_update_times = lpTSCall1Ans15->GetInt32(LDBIZ_UPDATE_TIMES_INT);


            // [主动推送][secu.comboposi][证券主推_组合_组合持仓主推消息]
            lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.905", 0);
            lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
            lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
            lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
            lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
            lpPubMsg->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
            lpPubMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
            lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
            lpPubMsg->SetInt32(LDBIZ_OPEN_POSI_DATE_INT,v_open_posi_date);
            lpPubMsg->SetDouble(LDBIZ_POSI_QTY_FLOAT,v_posi_qty);
            lpPubMsg->SetDouble(LDBIZ_CURR_QTY_FLOAT,v_curr_qty);
            lpPubMsg->SetDouble(LDBIZ_FROZEN_QTY_FLOAT,v_frozen_qty);
            lpPubMsg->SetDouble(LDBIZ_UNFROZ_QTY_FLOAT,v_unfroz_qty);
            lpPubMsg->SetDouble(LDBIZ_PRE_SETTLE_QTY_FLOAT,v_pre_settle_qty);
            lpPubMsg->SetDouble(LDBIZ_TRADE_FROZEN_QTY_FLOAT,v_trade_frozen_qty);
            lpPubMsg->SetDouble(LDBIZ_TRADE_UNFROZ_QTY_FLOAT,v_trade_unfroz_qty);
            lpPubMsg->SetDouble(LDBIZ_TRADE_CAPT_QTY_FLOAT,v_trade_capt_qty);
            lpPubMsg->SetDouble(LDBIZ_TRADE_RELEAS_QTY_FLOAT,v_trade_releas_qty);
            lpPubMsg->SetDouble(LDBIZ_STRIKE_CAPT_QTY_FLOAT,v_strike_capt_qty);
            lpPubMsg->SetDouble(LDBIZ_STRIKE_RELEAS_QTY_FLOAT,v_strike_releas_qty);
            lpPubMsg->SetDouble(LDBIZ_STRIKE_FROZEN_QTY_FLOAT,v_strike_frozen_qty);
            lpPubMsg->SetDouble(LDBIZ_STRIKE_UNFROZ_QTY_FLOAT,v_strike_unfroz_qty);
            lpPubMsg->SetDouble(LDBIZ_REALIZE_PANDL_FLOAT,v_realize_pandl);
            lpPubMsg->SetDouble(LDBIZ_COST_AMT_FLOAT,v_cost_amt);
            lpPubMsg->SetDouble(LDBIZ_INTRST_COST_AMT_FLOAT,v_intrst_cost_amt);
            lpPubMsg->SetDouble(LDBIZ_INTRST_PANDL_FLOAT,v_intrst_pandl);
            lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
            glpPubSub_Interface->PubTopics("secu.comboposi", lpPubMsg);

            //调用过程[事务_交易证券_主推接口_获取组合收益]
            //组织事务请求
            if(lpTSCall1Ans16)
            {
              lpTSCall1Ans16->FreeMsg();
              lpTSCall1Ans16=NULL;
            }
            lpTSCall1Req16=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.44", 0);
            lpTSCall1Req16->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req16->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req16->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req16->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req16->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req16->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req16->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req16->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req16->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
            lpTSCall1Req16->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpTSCall1Req16->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
            lpTSCall1Req16->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
            lpTSCall1Req16->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
            glpTSSubcallSerives->SubCall(lpTSCall1Req16, &lpTSCall1Ans16, 5000);
            if(!lpTSCall1Ans16)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.44]subcall timed out!");
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
            v_row_id = lpTSCall1Ans16->GetInt64(LDBIZ_ROW_ID_INT64);
            v_open_posi_date = lpTSCall1Ans16->GetInt32(LDBIZ_OPEN_POSI_DATE_INT);
            v_combo_copies = lpTSCall1Ans16->GetDouble(LDBIZ_COMBO_COPIES_FLOAT);
            strcpy(v_combo_status, lpTSCall1Ans16->GetString(LDBIZ_COMBO_STATUS_STR));
            v_combo_cost = lpTSCall1Ans16->GetDouble(LDBIZ_COMBO_COST_FLOAT);
            v_combo_market_value = lpTSCall1Ans16->GetDouble(LDBIZ_COMBO_MARKET_VALUE_FLOAT);
            v_realize_pandl = lpTSCall1Ans16->GetDouble(LDBIZ_REALIZE_PANDL_FLOAT);
            v_sum_realize_pandl = lpTSCall1Ans16->GetDouble(LDBIZ_SUM_REALIZE_PANDL_FLOAT);
            v_update_times = lpTSCall1Ans16->GetInt32(LDBIZ_UPDATE_TIMES_INT);


            // [主动推送][secu.comboincome][证券主推_组合_组合收益主推消息]
            lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.906", 0);
            lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
            lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
            lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
            lpPubMsg->SetInt32(LDBIZ_OPEN_POSI_DATE_INT,v_open_posi_date);
            lpPubMsg->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
            lpPubMsg->SetDouble(LDBIZ_COMBO_COPIES_FLOAT,v_combo_copies);
            lpPubMsg->SetString(LDBIZ_COMBO_STATUS_STR,v_combo_status);
            lpPubMsg->SetDouble(LDBIZ_COMBO_COST_FLOAT,v_combo_cost);
            lpPubMsg->SetDouble(LDBIZ_COMBO_MARKET_VALUE_FLOAT,v_combo_market_value);
            lpPubMsg->SetDouble(LDBIZ_REALIZE_PANDL_FLOAT,v_realize_pandl);
            lpPubMsg->SetDouble(LDBIZ_SUM_REALIZE_PANDL_FLOAT,v_sum_realize_pandl);
            lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
            glpPubSub_Interface->PubTopics("secu.comboincome", lpPubMsg);

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
    lpOutBizMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpOutBizMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpOutBizMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpOutBizMsg->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
    lpOutBizMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpOutBizMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpOutBizMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpOutBizMsg->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
    lpOutBizMsg->SetInt64(LDBIZ_WTDRAW_ID_INT64,v_wtdraw_id);
    lpOutBizMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
    lpOutBizMsg->SetString(LDBIZ_WTDRAW_STATUS_STR,v_wtdraw_status);
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
    if(lpTSCall1Ans17)
        lpTSCall1Ans17->FreeMsg();
    return iRet;
}

//逻辑_交易证券_中泰_新增改单
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
    int64 v_external_no;
    int v_order_date;
    int64 v_order_id;
    int v_modi_batch_no;
    double v_modi_order_price;
    double v_modi_order_qty;
    int v_modi_price_type;
    char v_long_token[1025];
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
    int v_stock_acco_no;
    int v_stock_code_no;
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
    char v_order_oper_way[3];
    char v_stock_acco[17];
    char v_stock_code[7];
    int v_stock_type;
    int v_asset_type;
    int v_comm_batch_no;
    int v_report_date;
    int v_report_time;
    int v_order_time;
    double v_order_frozen_qty;
    double v_order_frozen_amt;
    char v_order_status[3];
    int v_price_type;
    double v_strike_qty;
    double v_strike_amt;
    double v_all_fee;
    int v_wtdraw_time;
    int v_exter_comm_flag;
    int v_cost_calc_type;
    char v_combo_code[33];
    int64 v_combo_posi_id;
    int64 v_strategy_id;
    int v_order_batch_no;
    int v_asset_acco_type;
    char v_contra_no[33];
    int v_exist_debt_flag;
    int v_update_times;
    double v_tmp_order_qty;
    int v_init_date;
    char v_sys_config_str[65];
    char v_co_busi_config_str[65];
    char v_exgp_busi_config_str[65];
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    double v_buy_ref_rate;
    double v_sell_ref_rate;
    double v_par_value;
    double v_impawn_ratio;
    int v_net_price_flag;
    int v_intrst_days;
    int v_bond_rate_type;
    double v_bond_accr_intrst;
    int v_target_code_no;
    char v_target_code[7];
    int v_target_code_stock_type;
    int v_target_code_asset_type;
    int v_trade_code_no;
    char v_trade_code[7];
    int v_trade_code_stock_type;
    int v_trade_code_asset_type;
    int v_min_unit;
    double v_up_limit_price;
    double v_down_limit_price;
    double v_last_price;
    int v_capit_reback_days;
    int v_posi_reback_days;
    int v_apply_date;
    int v_subscription_trade_mark;
    int v_purchase_trade_mark;
    int v_rede_trade_mark;
    double v_first_minimum_amt;
    double v_minimum_purchase_amt;
    double v_minimum_subscription_amt;
    double v_minimum_rede_share;
    double v_minimum_holding_share;
    char v_trade_acco[33];
    char v_busi_config_str[65];
    char v_busi_ctrl_str[65];
    char v_asac_busi_config_str[65];
    char v_split_fee_typr_str[65];
    char v_busi_limit_str[2049];
    double v_nav_asset;
    double v_market_price_ratio;
    int v_market_price_type;
    double v_order_market_price;
    int v_sys_type;
    char v_opor_no_str1[2049];
    char v_opor_no_str2[2049];
    char v_opor_no_str3[2049];
    double v_fina_limit_max;
    double v_loan_limit_max;
    int v_sell_auto_back_debt;
    char v_asset_acco[17];
    int v_comm_date;
    int v_comm_executor;
    int v_wtdraw_date;
    char v_rsp_info[256];
    double v_strike_bond_accr_intrst;
    double v_curr_strike_price;
    double v_curr_strike_amt;
    double v_curr_strike_qty;
    int64 v_strike_id;
    char v_target_stock_code[7];
    int v_target_stock_code_no;
    int v_trade_time_flag;
    int64 v_sum_order_row_id;
    int v_sum_order_opor_no;
    int v_sum_order_co_no;
    int v_sum_order_pd_no;
    int v_sum_order_exch_group_no;
    int v_sum_order_asset_acco_no;
    int v_sum_order_pass_no;
    char v_sum_order_exch_crncy_type[4];
    int v_sum_order_stock_code_no;
    int v_sum_order_trade_code_no;
    int v_sum_order_target_code_no;
    int64 v_sum_order_external_no;
    int v_sum_order_date;
    int v_sum_order_batch_no;
    int v_sum_order_dir;
    int v_sum_order_price_type;
    double v_sum_order_price;
    double v_sum_order_qty;
    char v_order_sum_status[3];
    double v_sum_order_wtdraw_qty;
    double v_sum_order_waste_qty;
    double v_sum_order_strike_amt;
    double v_sum_order_strike_qty;
    double v_sum_order_strike_aver_price;
    int v_sum_order_net_price_flag;
    double v_sum_order_bond_accr_intrst;
    int v_sum_order_bond_rate_type;
    double v_sum_order_par_value;
    double v_sum_order_impawn_ratio;
    char v_sum_order_oper_way[3];
    int v_sum_order_update_times;
    int64 v_sum_strike_row_id;
    int v_sum_strike_opor_no;
    int v_sum_strike_co_no;
    int v_sum_strike_pd_no;
    int v_sum_strike_exch_group_no;
    int v_sum_strike_asset_acco_no;
    int v_sum_strike_pass_no;
    char v_sum_strike_out_acco[33];
    int v_sum_strike_stock_acco_no;
    int v_sum_strike_stock_code_no;
    int64 v_sum_strike_comm_id;
    int v_sum_strike_report_date;
    char v_sum_strike_report_no[33];
    int v_sum_strike_order_date;
    int64 v_sum_strike_order_id;
    int v_sum_strike_order_dir;
    double v_sum_strike_order_price;
    double v_sum_strike_order_qty;
    double v_sum_strike_strike_qty;
    double v_sum_strike_strike_amt;
    double v_sum_strike_all_fee;
    double v_sum_strike_stamp_tax;
    double v_sum_strike_trans_fee;
    double v_sum_strike_brkage_fee;
    double v_sum_strike_SEC_charges;
    double v_sum_strike_other_fee;
    double v_sum_strike_trade_commis;
    double v_sum_strike_other_commis;
    double v_sum_trade_tax;
    double v_sum_trade_cost_fee;
    double v_sum_trade_system_use_fee;
    double v_sum_stock_settle_fee;
    int v_sum_strike_net_price_flag;
    double v_sum_strike_bond_accr_intrst;
    int v_sum_strike_bond_rate_type;
    char v_sum_strike_order_oper_way[3];
    int v_sum_strike_exter_comm_flag;
    int v_sum_strike_update_times;
    int v_sum_strike_order_batch_no;
    int64 v_sum_external_no;
    int v_comm_time;
    int v_comm_opor;
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
    int v_comm_appr_oper;
    char v_comm_appr_remark[256];
    int64 v_basket_id;
    char v_comm_oper_way[3];
    int v_comm_comple_flag;
    double v_strategy_capt_qty;
    double v_strategy_order_qty;
    char v_comm_remark_info[1025];
    int v_disp_opor;
    int v_disp_status;
    int v_read_flag;
    int64 v_sum_comm_row_id;
    int v_sum_comm_co_no;
    int v_sum_comm_pd_no;
    int v_sum_comm_exch_group_no;
    int v_sum_comm_asset_acco_no;
    int v_sum_comm_pass_no;
    char v_sum_comm_out_acco[33];
    char v_sum_comm_exch_crncy_type[4];
    int v_sum_comm_stock_code_no;
    int v_sum_comm_date;
    int v_sum_comm_time;
    int v_sum_comm_batch_no;
    int v_sum_comm_opor;
    int v_sum_comm_executor;
    int v_sum_comm_dir;
    double v_sum_comm_limit_price;
    double v_sum_comm_qty;
    double v_sum_comm_amt;
    double v_sum_comm_order_qty;
    double v_sum_comm_cancel_qty;
    double v_sum_comm_await_cancel_qty;
    double v_sum_comm_strike_amt;
    double v_sum_comm_strike_qty;
    char v_sum_comm_strike_status[3];
    char v_comm_sum_status[3];
    int v_sum_comm_begin_date;
    int v_sum_comm_end_date;
    int v_sum_comm_begin_time;
    int v_sum_comm_end_time;
    int v_sum_comm_comple_date;
    int v_sum_comm_comple_time;
    int v_sum_comm_max_comm_comple_date;
    int v_sum_comm_max_comm_comple_time;
    int v_sum_comm_appr_date;
    int v_sum_comm_appr_time;
    double v_sum_comm_appr_qty;
    char v_comm_sum_approve_status[3];
    int64 v_sum_comm_basket_id;
    int v_sum_comm_net_price_flag;
    double v_sum_comm_bond_accr_intrst;
    int v_sum_comm_bond_rate_type;
    char v_sum_comm_oper_way[3];
    int v_sum_comm_exter_comm_flag;
    double v_sum_buy_order_qty;
    double v_sum_sell_order_qty;
    double v_sum_buy_comm_qty;
    double v_sum_sell_comm_qty;
    double v_sum_buy_strike_qty;
    double v_sum_sell_strike_qty;
    double v_sum_buy_strike_amt;
    double v_sum_sell_strike_amt;
    double v_sum_buy_comm_amt;
    double v_sum_sell_comm_amt;
    char v_sum_comm_remark_info[256];
    int v_sum_comm_update_times;
    char v_acco_concat_info[4097];
    int64 v_exgp_cash_id;
    double v_exgp_frozen_amt;
    double v_exgp_unfroz_amt;
    double v_exgp_comm_frozen_amt;
    double v_exgp_comm_unfroz_amt;
    double v_exgp_comm_capt_amt;
    double v_exgp_comm_releas_amt;
    double v_exgp_trade_frozen_amt;
    double v_exgp_trade_unfroz_amt;
    double v_exgp_trade_capt_amt;
    double v_exgp_trade_releas_amt;
    double v_exgp_strike_capt_amt;
    double v_exgp_strike_releas_amt;
    int v_exgp_cash_update_times;
    int64 v_exgp_posi_id;
    double v_exgp_frozen_qty;
    double v_exgp_unfroz_qty;
    double v_exgp_comm_frozen_qty;
    double v_exgp_comm_unfroz_qty;
    double v_exgp_comm_capt_qty;
    double v_exgp_comm_releas_qty;
    double v_exgp_trade_frozen_qty;
    double v_exgp_trade_unfroz_qty;
    double v_exgp_trade_capt_qty;
    double v_exgp_trade_releas_qty;
    double v_exgp_strike_capt_qty;
    double v_exgp_strike_releas_qty;
    double v_exgp_strike_frozen_qty;
    double v_exgp_strike_unfroz_qty;
    double v_exgp_realize_pandl;
    double v_exgp_cost_amt;
    double v_exgp_intrst_cost_amt;
    double v_exgp_intrst_pandl;
    int v_exgp_posi_update_times;
    int64 v_asac_cash_id;
    double v_asac_frozen_amt;
    double v_asac_unfroz_amt;
    double v_asac_comm_frozen_amt;
    double v_asac_comm_unfroz_amt;
    double v_asac_comm_capt_amt;
    double v_asac_comm_releas_amt;
    double v_asac_trade_frozen_amt;
    double v_asac_trade_unfroz_amt;
    double v_asac_trade_capt_amt;
    double v_asac_trade_releas_amt;
    double v_asac_strike_capt_amt;
    double v_asac_strike_releas_amt;
    int v_asac_cash_update_times;
    int64 v_asac_posi_id;
    double v_asac_frozen_qty;
    double v_asac_unfroz_qty;
    double v_asac_comm_frozen_qty;
    double v_asac_comm_unfroz_qty;
    double v_asac_comm_capt_qty;
    double v_asac_comm_releas_qty;
    double v_asac_trade_frozen_qty;
    double v_asac_trade_unfroz_qty;
    double v_asac_trade_capt_qty;
    double v_asac_trade_releas_qty;
    double v_asac_strike_capt_qty;
    double v_asac_strike_releas_qty;
    double v_asac_strike_frozen_qty;
    double v_asac_strike_unfroz_qty;
    double v_asac_realize_pandl;
    double v_asac_cost_amt;
    double v_asac_intrst_cost_amt;
    double v_asac_intrst_pandl;
    int v_asac_posi_update_times;
    int64 v_exgp_target_posi_id;
    double v_exgp_target_frozen_qty;
    double v_exgp_target_unfroz_qty;
    double v_exgp_target_comm_frozen_qty;
    double v_exgp_target_comm_unfroz_qty;
    double v_exgp_target_comm_capt_qty;
    double v_exgp_target_comm_releas_qty;
    double v_exgp_target_trade_frozen_qty;
    double v_exgp_target_trade_unfroz_qty;
    double v_exgp_target_trade_capt_qty;
    double v_exgp_target_trade_releas_qty;
    double v_exgp_target_strike_capt_qty;
    double v_exgp_target_strike_releas_qty;
    double v_exgp_target_strike_frozen_qty;
    double v_exgp_target_strike_unfroz_qty;
    double v_exgp_target_realize_pandl;
    double v_exgp_target_cost_amt;
    double v_exgp_target_intrst_cost_amt;
    double v_exgp_target_intrst_pandl;
    int v_exgp_target_posi_update_times;
    int64 v_asac_target_posi_id;
    double v_asac_target_frozen_qty;
    double v_asac_target_unfroz_qty;
    double v_asac_target_comm_frozen_qty;
    double v_asac_target_comm_unfroz_qty;
    double v_asac_target_comm_capt_qty;
    double v_asac_target_comm_releas_qty;
    double v_asac_target_trade_frozen_qty;
    double v_asac_target_trade_unfroz_qty;
    double v_asac_target_trade_capt_qty;
    double v_asac_target_trade_releas_qty;
    double v_asac_target_strike_capt_qty;
    double v_asac_target_strike_releas_qty;
    double v_asac_target_strike_frozen_qty;
    double v_asac_target_strike_unfroz_qty;
    double v_asac_target_realize_pandl;
    double v_asac_target_cost_amt;
    double v_asac_target_intrst_cost_amt;
    double v_asac_target_intrst_pandl;
    int v_asac_target_posi_update_times;
    double v_exgp_put_impawn_qty;
    double v_asac_put_impawn_qty;
    int v_modi_order_date;
    int v_modi_order_time;
    char v_remark_info[256];
    double v_exgp_avail_amt;
    double v_asac_avail_amt;
    double v_asac_T_hk_buy_total_amt;
    double v_asac_T_hk_sell_total_amt;
    double v_asac_T1_hk_buy_total_amt;
    double v_asac_T1_hk_sell_total_amt;
    double v_exgp_T_hk_buy_total_amt;
    double v_exgp_T_hk_sell_total_amt;
    double v_exgp_T1_hk_buy_total_amt;
    double v_exgp_T1_hk_sell_total_amt;
    double v_exgp_avail_qty;
    double v_exgp_target_code_avail_qty;
    double v_exgp_trade_code_avail_qty;
    double v_asac_avail_qty;
    double v_asac_target_code_avail_qty;
    double v_asac_trade_code_avail_qty;
    double v_exgp_loan_sell_amt;
    double v_asac_loan_sell_amt;
    double v_exgp_debt_loan_sell_strike_qty;
    double v_exgp_debt_fina_buy_strike_amt;
    int v_record_count;
    int v_T0_opor_fee_set_flag;
    int64 v_row_id;
    double v_curr_amt;
    double v_frozen_amt;
    double v_opor_warn_tshold;
    double v_opor_stop_tshold;
    int v_order_limit_time;
    double v_per_secu_posi_ratio;
    int v_posi_limit_time;
    double v_order_ctrl_qty;
    double v_order_ctrl_amt;
    double v_stock_warn_ratio;
    double v_stock_stop_ratio;
    double v_stock_warn_amt;
    double v_stock_stop_amt;
    int v_trig_oper_type;
    int v_open_close_permission;
    int v_risk_oper;
    int v_fee_calc_type;
    int v_permit_margin_trade;
    double v_buy_fee_ratio;
    double v_sell_fee_ratio;
    double v_buy_min_fee;
    double v_sell_min_fee;
    double v_all_fee_for_tmp;
    double v_trade_commis;
    double v_stamp_tax;
    double v_trans_fee;
    double v_brkage_fee;
    double v_SEC_charges;
    double v_other_fee;
    double v_other_commis;
    double v_trade_tax;
    double v_trade_cost_fee;
    double v_trade_system_use_fee;
    double v_stock_settle_fee;
    int v_trig_stage_type;
    char v_modi_order_status[3];
    char v_registration_agency[33];
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
    strcpy(v_long_token, " ");
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
    v_stock_acco_no=0;
    v_stock_code_no=0;
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
    strcpy(v_order_oper_way, " ");
    strcpy(v_stock_acco, " ");
    strcpy(v_stock_code, " ");
    v_stock_type=0;
    v_asset_type=0;
    v_comm_batch_no=0;
    v_report_date=0;
    v_report_time=0;
    v_order_time=0;
    v_order_frozen_qty=0;
    v_order_frozen_amt=0;
    strcpy(v_order_status, "0");
    v_price_type=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_all_fee=0;
    v_wtdraw_time=0;
    v_exter_comm_flag=0;
    v_cost_calc_type=0;
    strcpy(v_combo_code, " ");
    v_combo_posi_id=0;
    v_strategy_id=0;
    v_order_batch_no=0;
    v_asset_acco_type=0;
    strcpy(v_contra_no, " ");
    v_exist_debt_flag=0;
    v_update_times=1;
    v_tmp_order_qty=0;
    v_init_date=0;
    strcpy(v_sys_config_str, " ");
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_exgp_busi_config_str, " ");
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_buy_ref_rate=0;
    v_sell_ref_rate=0;
    v_par_value=0;
    v_impawn_ratio=0;
    v_net_price_flag=0;
    v_intrst_days=0;
    v_bond_rate_type=0;
    v_bond_accr_intrst=0;
    v_target_code_no=0;
    strcpy(v_target_code, " ");
    v_target_code_stock_type=0;
    v_target_code_asset_type=0;
    v_trade_code_no=0;
    strcpy(v_trade_code, " ");
    v_trade_code_stock_type=0;
    v_trade_code_asset_type=0;
    v_min_unit=0;
    v_up_limit_price=0;
    v_down_limit_price=0;
    v_last_price=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    v_apply_date=0;
    v_subscription_trade_mark=0;
    v_purchase_trade_mark=0;
    v_rede_trade_mark=0;
    v_first_minimum_amt=0;
    v_minimum_purchase_amt=0;
    v_minimum_subscription_amt=0;
    v_minimum_rede_share=0;
    v_minimum_holding_share=0;
    strcpy(v_trade_acco, " ");
    strcpy(v_busi_config_str, " ");
    strcpy(v_busi_ctrl_str, " ");
    strcpy(v_asac_busi_config_str, " ");
    strcpy(v_split_fee_typr_str, " ");
    strcpy(v_busi_limit_str, " ");
    v_nav_asset=0;
    v_market_price_ratio=0;
    v_market_price_type=0;
    v_order_market_price=0;
    v_sys_type=0;
    strcpy(v_opor_no_str1, " ");
    strcpy(v_opor_no_str2, " ");
    strcpy(v_opor_no_str3, " ");
    v_fina_limit_max=0;
    v_loan_limit_max=0;
    v_sell_auto_back_debt=0;
    strcpy(v_asset_acco, " ");
    v_comm_date=0;
    v_comm_executor=0;
    v_wtdraw_date=0;
    strcpy(v_rsp_info, " ");
    v_strike_bond_accr_intrst=0;
    v_curr_strike_price=0;
    v_curr_strike_amt=0;
    v_curr_strike_qty=0;
    v_strike_id=0;
    strcpy(v_target_stock_code, " ");
    v_target_stock_code_no=0;
    v_trade_time_flag=0;
    v_sum_order_row_id=0;
    v_sum_order_opor_no=0;
    v_sum_order_co_no=0;
    v_sum_order_pd_no=0;
    v_sum_order_exch_group_no=0;
    v_sum_order_asset_acco_no=0;
    v_sum_order_pass_no=0;
    strcpy(v_sum_order_exch_crncy_type, "CNY");
    v_sum_order_stock_code_no=0;
    v_sum_order_trade_code_no=0;
    v_sum_order_target_code_no=0;
    v_sum_order_external_no=0;
    v_sum_order_date=0;
    v_sum_order_batch_no=0;
    v_sum_order_dir=0;
    v_sum_order_price_type=0;
    v_sum_order_price=0;
    v_sum_order_qty=0;
    strcpy(v_order_sum_status, "0");
    v_sum_order_wtdraw_qty=0;
    v_sum_order_waste_qty=0;
    v_sum_order_strike_amt=0;
    v_sum_order_strike_qty=0;
    v_sum_order_strike_aver_price=0;
    v_sum_order_net_price_flag=0;
    v_sum_order_bond_accr_intrst=0;
    v_sum_order_bond_rate_type=0;
    v_sum_order_par_value=0;
    v_sum_order_impawn_ratio=0;
    strcpy(v_sum_order_oper_way, " ");
    v_sum_order_update_times=1;
    v_sum_strike_row_id=0;
    v_sum_strike_opor_no=0;
    v_sum_strike_co_no=0;
    v_sum_strike_pd_no=0;
    v_sum_strike_exch_group_no=0;
    v_sum_strike_asset_acco_no=0;
    v_sum_strike_pass_no=0;
    strcpy(v_sum_strike_out_acco, " ");
    v_sum_strike_stock_acco_no=0;
    v_sum_strike_stock_code_no=0;
    v_sum_strike_comm_id=0;
    v_sum_strike_report_date=0;
    strcpy(v_sum_strike_report_no, " ");
    v_sum_strike_order_date=0;
    v_sum_strike_order_id=0;
    v_sum_strike_order_dir=0;
    v_sum_strike_order_price=0;
    v_sum_strike_order_qty=0;
    v_sum_strike_strike_qty=0;
    v_sum_strike_strike_amt=0;
    v_sum_strike_all_fee=0;
    v_sum_strike_stamp_tax=0;
    v_sum_strike_trans_fee=0;
    v_sum_strike_brkage_fee=0;
    v_sum_strike_SEC_charges=0;
    v_sum_strike_other_fee=0;
    v_sum_strike_trade_commis=0;
    v_sum_strike_other_commis=0;
    v_sum_trade_tax=0;
    v_sum_trade_cost_fee=0;
    v_sum_trade_system_use_fee=0;
    v_sum_stock_settle_fee=0;
    v_sum_strike_net_price_flag=0;
    v_sum_strike_bond_accr_intrst=0;
    v_sum_strike_bond_rate_type=0;
    strcpy(v_sum_strike_order_oper_way, " ");
    v_sum_strike_exter_comm_flag=0;
    v_sum_strike_update_times=1;
    v_sum_strike_order_batch_no=0;
    v_sum_external_no=0;
    v_comm_time=0;
    v_comm_opor=0;
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
    v_comm_appr_oper=0;
    strcpy(v_comm_appr_remark, " ");
    v_basket_id=0;
    strcpy(v_comm_oper_way, " ");
    v_comm_comple_flag=0;
    v_strategy_capt_qty=0;
    v_strategy_order_qty=0;
    strcpy(v_comm_remark_info, " ");
    v_disp_opor=0;
    v_disp_status=0;
    v_read_flag=0;
    v_sum_comm_row_id=0;
    v_sum_comm_co_no=0;
    v_sum_comm_pd_no=0;
    v_sum_comm_exch_group_no=0;
    v_sum_comm_asset_acco_no=0;
    v_sum_comm_pass_no=0;
    strcpy(v_sum_comm_out_acco, " ");
    strcpy(v_sum_comm_exch_crncy_type, "CNY");
    v_sum_comm_stock_code_no=0;
    v_sum_comm_date=0;
    v_sum_comm_time=0;
    v_sum_comm_batch_no=0;
    v_sum_comm_opor=0;
    v_sum_comm_executor=0;
    v_sum_comm_dir=0;
    v_sum_comm_limit_price=0;
    v_sum_comm_qty=0;
    v_sum_comm_amt=0;
    v_sum_comm_order_qty=0;
    v_sum_comm_cancel_qty=0;
    v_sum_comm_await_cancel_qty=0;
    v_sum_comm_strike_amt=0;
    v_sum_comm_strike_qty=0;
    strcpy(v_sum_comm_strike_status, "0");
    strcpy(v_comm_sum_status, "0");
    v_sum_comm_begin_date=0;
    v_sum_comm_end_date=0;
    v_sum_comm_begin_time=0;
    v_sum_comm_end_time=0;
    v_sum_comm_comple_date=0;
    v_sum_comm_comple_time=0;
    v_sum_comm_max_comm_comple_date=0;
    v_sum_comm_max_comm_comple_time=0;
    v_sum_comm_appr_date=0;
    v_sum_comm_appr_time=0;
    v_sum_comm_appr_qty=0;
    strcpy(v_comm_sum_approve_status, "0");
    v_sum_comm_basket_id=0;
    v_sum_comm_net_price_flag=0;
    v_sum_comm_bond_accr_intrst=0;
    v_sum_comm_bond_rate_type=0;
    strcpy(v_sum_comm_oper_way, " ");
    v_sum_comm_exter_comm_flag=0;
    v_sum_buy_order_qty=0;
    v_sum_sell_order_qty=0;
    v_sum_buy_comm_qty=0;
    v_sum_sell_comm_qty=0;
    v_sum_buy_strike_qty=0;
    v_sum_sell_strike_qty=0;
    v_sum_buy_strike_amt=0;
    v_sum_sell_strike_amt=0;
    v_sum_buy_comm_amt=0;
    v_sum_sell_comm_amt=0;
    strcpy(v_sum_comm_remark_info, " ");
    v_sum_comm_update_times=1;
    strcpy(v_acco_concat_info, " ");
    v_exgp_cash_id=0;
    v_exgp_frozen_amt=0;
    v_exgp_unfroz_amt=0;
    v_exgp_comm_frozen_amt=0;
    v_exgp_comm_unfroz_amt=0;
    v_exgp_comm_capt_amt=0;
    v_exgp_comm_releas_amt=0;
    v_exgp_trade_frozen_amt=0;
    v_exgp_trade_unfroz_amt=0;
    v_exgp_trade_capt_amt=0;
    v_exgp_trade_releas_amt=0;
    v_exgp_strike_capt_amt=0;
    v_exgp_strike_releas_amt=0;
    v_exgp_cash_update_times=1;
    v_exgp_posi_id=0;
    v_exgp_frozen_qty=0;
    v_exgp_unfroz_qty=0;
    v_exgp_comm_frozen_qty=0;
    v_exgp_comm_unfroz_qty=0;
    v_exgp_comm_capt_qty=0;
    v_exgp_comm_releas_qty=0;
    v_exgp_trade_frozen_qty=0;
    v_exgp_trade_unfroz_qty=0;
    v_exgp_trade_capt_qty=0;
    v_exgp_trade_releas_qty=0;
    v_exgp_strike_capt_qty=0;
    v_exgp_strike_releas_qty=0;
    v_exgp_strike_frozen_qty=0;
    v_exgp_strike_unfroz_qty=0;
    v_exgp_realize_pandl=0;
    v_exgp_cost_amt=0;
    v_exgp_intrst_cost_amt=0;
    v_exgp_intrst_pandl=0;
    v_exgp_posi_update_times=1;
    v_asac_cash_id=0;
    v_asac_frozen_amt=0;
    v_asac_unfroz_amt=0;
    v_asac_comm_frozen_amt=0;
    v_asac_comm_unfroz_amt=0;
    v_asac_comm_capt_amt=0;
    v_asac_comm_releas_amt=0;
    v_asac_trade_frozen_amt=0;
    v_asac_trade_unfroz_amt=0;
    v_asac_trade_capt_amt=0;
    v_asac_trade_releas_amt=0;
    v_asac_strike_capt_amt=0;
    v_asac_strike_releas_amt=0;
    v_asac_cash_update_times=1;
    v_asac_posi_id=0;
    v_asac_frozen_qty=0;
    v_asac_unfroz_qty=0;
    v_asac_comm_frozen_qty=0;
    v_asac_comm_unfroz_qty=0;
    v_asac_comm_capt_qty=0;
    v_asac_comm_releas_qty=0;
    v_asac_trade_frozen_qty=0;
    v_asac_trade_unfroz_qty=0;
    v_asac_trade_capt_qty=0;
    v_asac_trade_releas_qty=0;
    v_asac_strike_capt_qty=0;
    v_asac_strike_releas_qty=0;
    v_asac_strike_frozen_qty=0;
    v_asac_strike_unfroz_qty=0;
    v_asac_realize_pandl=0;
    v_asac_cost_amt=0;
    v_asac_intrst_cost_amt=0;
    v_asac_intrst_pandl=0;
    v_asac_posi_update_times=1;
    v_exgp_target_posi_id=0;
    v_exgp_target_frozen_qty=0;
    v_exgp_target_unfroz_qty=0;
    v_exgp_target_comm_frozen_qty=0;
    v_exgp_target_comm_unfroz_qty=0;
    v_exgp_target_comm_capt_qty=0;
    v_exgp_target_comm_releas_qty=0;
    v_exgp_target_trade_frozen_qty=0;
    v_exgp_target_trade_unfroz_qty=0;
    v_exgp_target_trade_capt_qty=0;
    v_exgp_target_trade_releas_qty=0;
    v_exgp_target_strike_capt_qty=0;
    v_exgp_target_strike_releas_qty=0;
    v_exgp_target_strike_frozen_qty=0;
    v_exgp_target_strike_unfroz_qty=0;
    v_exgp_target_realize_pandl=0;
    v_exgp_target_cost_amt=0;
    v_exgp_target_intrst_cost_amt=0;
    v_exgp_target_intrst_pandl=0;
    v_exgp_target_posi_update_times=0;
    v_asac_target_posi_id=0;
    v_asac_target_frozen_qty=0;
    v_asac_target_unfroz_qty=0;
    v_asac_target_comm_frozen_qty=0;
    v_asac_target_comm_unfroz_qty=0;
    v_asac_target_comm_capt_qty=0;
    v_asac_target_comm_releas_qty=0;
    v_asac_target_trade_frozen_qty=0;
    v_asac_target_trade_unfroz_qty=0;
    v_asac_target_trade_capt_qty=0;
    v_asac_target_trade_releas_qty=0;
    v_asac_target_strike_capt_qty=0;
    v_asac_target_strike_releas_qty=0;
    v_asac_target_strike_frozen_qty=0;
    v_asac_target_strike_unfroz_qty=0;
    v_asac_target_realize_pandl=0;
    v_asac_target_cost_amt=0;
    v_asac_target_intrst_cost_amt=0;
    v_asac_target_intrst_pandl=0;
    v_asac_target_posi_update_times=0;
    v_exgp_put_impawn_qty=0;
    v_asac_put_impawn_qty=0;
    v_modi_order_date=0;
    v_modi_order_time=0;
    strcpy(v_remark_info, " ");
    v_exgp_avail_amt=0;
    v_asac_avail_amt=0;
    v_asac_T_hk_buy_total_amt=0;
    v_asac_T_hk_sell_total_amt=0;
    v_asac_T1_hk_buy_total_amt=0;
    v_asac_T1_hk_sell_total_amt=0;
    v_exgp_T_hk_buy_total_amt=0;
    v_exgp_T_hk_sell_total_amt=0;
    v_exgp_T1_hk_buy_total_amt=0;
    v_exgp_T1_hk_sell_total_amt=0;
    v_exgp_avail_qty=0;
    v_exgp_target_code_avail_qty=0;
    v_exgp_trade_code_avail_qty=0;
    v_asac_avail_qty=0;
    v_asac_target_code_avail_qty=0;
    v_asac_trade_code_avail_qty=0;
    v_exgp_loan_sell_amt=0;
    v_asac_loan_sell_amt=0;
    v_exgp_debt_loan_sell_strike_qty=0;
    v_exgp_debt_fina_buy_strike_amt=0;
    v_record_count=0;
    v_T0_opor_fee_set_flag=0;
    v_row_id=0;
    v_curr_amt=0;
    v_frozen_amt=0;
    v_opor_warn_tshold=0;
    v_opor_stop_tshold=0;
    v_order_limit_time=0;
    v_per_secu_posi_ratio=0;
    v_posi_limit_time=5;
    v_order_ctrl_qty=0;
    v_order_ctrl_amt=0;
    v_stock_warn_ratio=0;
    v_stock_stop_ratio=0;
    v_stock_warn_amt=0;
    v_stock_stop_amt=0;
    v_trig_oper_type=0;
    v_open_close_permission=0;
    v_risk_oper=0;
    v_fee_calc_type=0;
    v_permit_margin_trade=0;
    v_buy_fee_ratio=0;
    v_sell_fee_ratio=0;
    v_buy_min_fee=0;
    v_sell_min_fee=0;
    v_all_fee_for_tmp=0;
    v_trade_commis=0;
    v_stamp_tax=0;
    v_trans_fee=0;
    v_brkage_fee=0;
    v_SEC_charges=0;
    v_other_fee=0;
    v_other_commis=0;
    v_trade_tax=0;
    v_trade_cost_fee=0;
    v_trade_system_use_fee=0;
    v_stock_settle_fee=0;
    v_trig_stage_type=0;
    strcpy(v_modi_order_status, " ");
    strcpy(v_registration_agency, " ");
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
    strncpy(v_long_token, lpInBizMsg->GetString(LDBIZ_LONG_TOKEN_STR),1024);
    v_long_token[1024] = '\0';

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
    IFastMessage* lpTSCall1Req26 = NULL;
    IFastMessage* lpTSCall1Ans26 = NULL;
    IFastMessage* lpTSCall1Req27 = NULL;
    IFastMessage* lpTSCall1Ans27 = NULL;
    IFastMessage* lpTSCall1Req28 = NULL;
    IFastMessage* lpTSCall1Ans28 = NULL;


    // set @临时_操作员编号# = @操作员编号#;
    v_tmp_opor_no = v_opor_no;

    // set @原订单序号# = @订单序号#;
    v_ori_order_id = v_order_id;
    //取原委托信息
    //调用过程[事务_交易证券_交易_获取订单信息]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("tdsecuT.4.71", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.4.71]subcall timed out!");
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
    strcpy(v_order_oper_way, lpTSCall1Ans0->GetString(LDBIZ_ORDER_OPER_WAY_STR));
    v_co_no = lpTSCall1Ans0->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans0->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans0->GetInt32(LDBIZ_PASS_NO_INT);
    v_exch_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans0->GetString(LDBIZ_STOCK_ACCO_STR));
    v_stock_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strcpy(v_stock_code, lpTSCall1Ans0->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_type = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_comm_id = lpTSCall1Ans0->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_report_date = lpTSCall1Ans0->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpTSCall1Ans0->GetInt32(LDBIZ_REPORT_TIME_INT);
    strcpy(v_report_no, lpTSCall1Ans0->GetString(LDBIZ_REPORT_NO_STR));
    v_order_time = lpTSCall1Ans0->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_order_dir = lpTSCall1Ans0->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_order_price = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_frozen_qty = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT);
    v_order_frozen_amt = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
    strcpy(v_order_status, lpTSCall1Ans0->GetString(LDBIZ_ORDER_STATUS_STR));
    v_price_type = lpTSCall1Ans0->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strike_qty = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_all_fee = lpTSCall1Ans0->GetDouble(LDBIZ_ALL_FEE_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans0->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_wtdraw_time = lpTSCall1Ans0->GetInt32(LDBIZ_WTDRAW_TIME_INT);
    v_exter_comm_flag = lpTSCall1Ans0->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_cost_calc_type = lpTSCall1Ans0->GetInt32(LDBIZ_COST_CALC_TYPE_INT);
    strcpy(v_combo_code, lpTSCall1Ans0->GetString(LDBIZ_COMBO_CODE_STR));
    v_combo_posi_id = lpTSCall1Ans0->GetInt64(LDBIZ_COMBO_POSI_ID_INT64);
    v_strategy_id = lpTSCall1Ans0->GetInt64(LDBIZ_STRATEGY_ID_INT64);
    v_order_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans0->GetString(LDBIZ_OUT_ACCO_STR));
    v_asset_acco_type = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);
    strcpy(v_contra_no, lpTSCall1Ans0->GetString(LDBIZ_CONTRA_NO_STR));
    v_exist_debt_flag = lpTSCall1Ans0->GetInt32(LDBIZ_EXIST_DEBT_FLAG_INT);
    v_update_times = lpTSCall1Ans0->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // set @临时_订单数量# = @订单数量#;
    v_tmp_order_qty = v_order_qty;
    //公共子系统检查，检查交易日期时间
    //调用过程[事务_公共_交易接口_检查交易市场状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.25.22", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req1->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req1->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    lpTSCall1Req1->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.22]subcall timed out!");
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
    strcpy(v_sys_config_str, lpTSCall1Ans1->GetString(LDBIZ_SYS_CONFIG_STR_STR));
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans1->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));
    strcpy(v_exgp_busi_config_str, lpTSCall1Ans1->GetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR));
    v_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_stock_type = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_CRNCY_TYPE_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_buy_ref_rate = lpTSCall1Ans1->GetDouble(LDBIZ_BUY_REF_RATE_FLOAT);
    v_sell_ref_rate = lpTSCall1Ans1->GetDouble(LDBIZ_SELL_REF_RATE_FLOAT);
    v_par_value = lpTSCall1Ans1->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
    v_impawn_ratio = lpTSCall1Ans1->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
    v_net_price_flag = lpTSCall1Ans1->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
    v_intrst_days = lpTSCall1Ans1->GetInt32(LDBIZ_INTRST_DAYS_INT);
    v_bond_rate_type = lpTSCall1Ans1->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
    v_bond_accr_intrst = lpTSCall1Ans1->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
    v_target_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
    strcpy(v_target_code, lpTSCall1Ans1->GetString(LDBIZ_TARGET_CODE_STR));
    v_target_code_stock_type = lpTSCall1Ans1->GetInt32(LDBIZ_TARGET_CODE_STOCK_TYPE_INT);
    v_target_code_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_TARGET_CODE_ASSET_TYPE_INT);
    v_trade_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
    strcpy(v_trade_code, lpTSCall1Ans1->GetString(LDBIZ_TRADE_CODE_STR));
    v_trade_code_stock_type = lpTSCall1Ans1->GetInt32(LDBIZ_TRADE_CODE_STOCK_TYPE_INT);
    v_trade_code_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_TRADE_CODE_ASSET_TYPE_INT);
    v_min_unit = lpTSCall1Ans1->GetInt32(LDBIZ_MIN_UNIT_INT);
    v_up_limit_price = lpTSCall1Ans1->GetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT);
    v_down_limit_price = lpTSCall1Ans1->GetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
    v_last_price = lpTSCall1Ans1->GetDouble(LDBIZ_LAST_PRICE_FLOAT);
    v_capit_reback_days = lpTSCall1Ans1->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans1->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    v_apply_date = lpTSCall1Ans1->GetInt32(LDBIZ_APPLY_DATE_INT);
    v_subscription_trade_mark = lpTSCall1Ans1->GetInt32(LDBIZ_SUBSCRIPTION_TRADE_MARK_INT);
    v_purchase_trade_mark = lpTSCall1Ans1->GetInt32(LDBIZ_PURCHASE_TRADE_MARK_INT);
    v_rede_trade_mark = lpTSCall1Ans1->GetInt32(LDBIZ_REDE_TRADE_MARK_INT);
    v_first_minimum_amt = lpTSCall1Ans1->GetDouble(LDBIZ_FIRST_MINIMUM_AMT_FLOAT);
    v_minimum_purchase_amt = lpTSCall1Ans1->GetDouble(LDBIZ_MINIMUM_PURCHASE_AMT_FLOAT);
    v_minimum_subscription_amt = lpTSCall1Ans1->GetDouble(LDBIZ_MINIMUM_SUBSCRIPTION_AMT_FLOAT);
    v_minimum_rede_share = lpTSCall1Ans1->GetDouble(LDBIZ_MINIMUM_REDE_SHARE_FLOAT);
    v_minimum_holding_share = lpTSCall1Ans1->GetDouble(LDBIZ_MINIMUM_HOLDING_SHARE_FLOAT);
    strcpy(v_trade_acco, lpTSCall1Ans1->GetString(LDBIZ_TRADE_ACCO_STR));


    // set @业务控制配置串# = @交易组业务控制配置串#;
    strcpy(v_busi_config_str,v_exgp_busi_config_str);
    //产品子系统检查，检查账户状态，获取当前资金等

    // set @业务控制串# = "11111";
    strcpy(v_busi_ctrl_str,"11111");
    //调用过程[事务_产品_交易接口_检查交易产品账户信息]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("prodT.8.21", 0);
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
    lpTSCall1Req2->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req2->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req2->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req2->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req2->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    lpTSCall1Req2->SetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT,v_up_limit_price);
    lpTSCall1Req2->SetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT,v_down_limit_price);
    lpTSCall1Req2->SetDouble(LDBIZ_LAST_PRICE_FLOAT,v_last_price);
    lpTSCall1Req2->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
    lpTSCall1Req2->SetString(LDBIZ_BUSI_CONFIG_STR_STR,v_busi_config_str);
    lpTSCall1Req2->SetString(LDBIZ_SYS_CONFIG_STR_STR,v_sys_config_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.8.21]subcall timed out!");
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
    v_exter_comm_flag = lpTSCall1Ans2->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_market_price_ratio = lpTSCall1Ans2->GetDouble(LDBIZ_MARKET_PRICE_RATIO_FLOAT);
    v_market_price_type = lpTSCall1Ans2->GetInt32(LDBIZ_MARKET_PRICE_TYPE_INT);
    v_cost_calc_type = lpTSCall1Ans2->GetInt32(LDBIZ_COST_CALC_TYPE_INT);
    v_order_market_price = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_MARKET_PRICE_FLOAT);
    v_sys_type = lpTSCall1Ans2->GetInt32(LDBIZ_SYS_TYPE_INT);
    strcpy(v_opor_no_str1, lpTSCall1Ans2->GetString(LDBIZ_OPOR_NO_STR1_STR));
    strcpy(v_opor_no_str2, lpTSCall1Ans2->GetString(LDBIZ_OPOR_NO_STR2_STR));
    strcpy(v_opor_no_str3, lpTSCall1Ans2->GetString(LDBIZ_OPOR_NO_STR3_STR));
    v_fina_limit_max = lpTSCall1Ans2->GetDouble(LDBIZ_FINA_LIMIT_MAX_FLOAT);
    v_loan_limit_max = lpTSCall1Ans2->GetDouble(LDBIZ_LOAN_LIMIT_MAX_FLOAT);
    v_asset_acco_type = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);
    v_sell_auto_back_debt = lpTSCall1Ans2->GetInt32(LDBIZ_SELL_AUTO_BACK_DEBT_INT);

    //新增改单处理
    //调用过程[事务_交易证券_交易_新增改单]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("tdsecuT.4.14", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req3->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req3->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req3->SetInt32(LDBIZ_MODI_BATCH_NO_INT,v_modi_batch_no);
    lpTSCall1Req3->SetDouble(LDBIZ_MODI_ORDER_PRICE_FLOAT,v_modi_order_price);
    lpTSCall1Req3->SetDouble(LDBIZ_MODI_ORDER_QTY_FLOAT,v_modi_order_qty);
    lpTSCall1Req3->SetInt32(LDBIZ_MODI_PRICE_TYPE_INT,v_modi_price_type);
    lpTSCall1Req3->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req3->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req3->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
    lpTSCall1Req3->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
    lpTSCall1Req3->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
    lpTSCall1Req3->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
    lpTSCall1Req3->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
    lpTSCall1Req3->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
    lpTSCall1Req3->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
    lpTSCall1Req3->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
    lpTSCall1Req3->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.4.14]subcall timed out!");
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
    v_co_no = lpTSCall1Ans3->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans3->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans3->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strcpy(v_asset_acco, lpTSCall1Ans3->GetString(LDBIZ_ASSET_ACCO_STR));
    v_pass_no = lpTSCall1Ans3->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans3->GetString(LDBIZ_OUT_ACCO_STR));
    v_exch_no = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans3->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans3->GetString(LDBIZ_STOCK_ACCO_STR));
    strcpy(v_stock_code, lpTSCall1Ans3->GetString(LDBIZ_STOCK_CODE_STR));
    strcpy(v_report_no, lpTSCall1Ans3->GetString(LDBIZ_REPORT_NO_STR));
    v_report_date = lpTSCall1Ans3->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpTSCall1Ans3->GetInt32(LDBIZ_REPORT_TIME_INT);
    v_comm_id = lpTSCall1Ans3->GetInt64(LDBIZ_COMM_ID_INT64);
    v_modi_order_id = lpTSCall1Ans3->GetInt64(LDBIZ_MODI_ORDER_ID_INT64);
    v_new_order_id = lpTSCall1Ans3->GetInt64(LDBIZ_NEW_ORDER_ID_INT64);
    v_order_dir = lpTSCall1Ans3->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_order_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_price = lpTSCall1Ans3->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_batch_no = lpTSCall1Ans3->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_order_frozen_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
    v_order_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT);
    v_comm_date = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_batch_no = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_executor = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_wtdraw_id = lpTSCall1Ans3->GetInt64(LDBIZ_WTDRAW_ID_INT64);
    v_wtdraw_qty = lpTSCall1Ans3->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    strcpy(v_wtdraw_status, lpTSCall1Ans3->GetString(LDBIZ_WTDRAW_STATUS_STR));
    v_wtdraw_date = lpTSCall1Ans3->GetInt32(LDBIZ_WTDRAW_DATE_INT);
    v_wtdraw_time = lpTSCall1Ans3->GetInt32(LDBIZ_WTDRAW_TIME_INT);
    strcpy(v_rsp_info, lpTSCall1Ans3->GetString(LDBIZ_RSP_INFO_STR));
    v_strike_amt = lpTSCall1Ans3->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_qty = lpTSCall1Ans3->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_bond_accr_intrst = lpTSCall1Ans3->GetDouble(LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
    v_compli_trig_id = lpTSCall1Ans3->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);
    strcpy(v_old_order_status, lpTSCall1Ans3->GetString(LDBIZ_OLD_ORDER_STATUS_STR));
    strcpy(v_new_order_status, lpTSCall1Ans3->GetString(LDBIZ_NEW_ORDER_STATUS_STR));
    strcpy(v_order_status, lpTSCall1Ans3->GetString(LDBIZ_ORDER_STATUS_STR));
    v_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // set @原订单状态# = @订单状态#;
    strcpy(v_old_order_status,v_order_status);

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

    // set @目标证券代码# = "";
    strcpy(v_target_stock_code,"");

    // set @目标证券代码编号# = 0;
    v_target_stock_code_no = 0;
    //set @撤单状态// = "0";

    // [主动推送][secu.order][证券主推_订单_订单主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.20", 0);
    lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpPubMsg->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
    lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpPubMsg->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    lpPubMsg->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
    lpPubMsg->SetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT,v_order_frozen_amt);
    lpPubMsg->SetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT,v_order_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
    lpPubMsg->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpPubMsg->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
    lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpPubMsg->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
    lpPubMsg->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
    lpPubMsg->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
    lpPubMsg->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
    lpPubMsg->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
    lpPubMsg->SetString(LDBIZ_RSP_INFO_STR,v_rsp_info);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT,v_strike_bond_accr_intrst);
    lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
    lpPubMsg->SetDouble(LDBIZ_CURR_STRIKE_QTY_FLOAT,v_curr_strike_qty);
    lpPubMsg->SetDouble(LDBIZ_CURR_STRIKE_AMT_FLOAT,v_curr_strike_amt);
    lpPubMsg->SetDouble(LDBIZ_CURR_STRIKE_PRICE_FLOAT,v_curr_strike_price);
    lpPubMsg->SetInt64(LDBIZ_STRIKE_ID_INT64,v_strike_id);
    lpPubMsg->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
    lpPubMsg->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
    lpPubMsg->SetInt64(LDBIZ_COMBO_POSI_ID_INT64,v_combo_posi_id);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_TYPE_INT,v_asset_acco_type);
    lpPubMsg->SetString(LDBIZ_CONTRA_NO_STR,v_contra_no);
    lpPubMsg->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("secu.order", lpPubMsg);

    //调用过程[事务_交易证券_交易_根据交易时间控制报盘主推]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("tdsecuT.4.124", 0);
    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req4->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.4.124]subcall timed out!");
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
    v_trade_time_flag = lpTSCall1Ans4->GetInt32(LDBIZ_TRADE_TIME_FLAG_INT);


    // if @撤单状态# <> 《撤单状态-成功》 and @交易时间标志#=1  then
    if (strcmp(v_wtdraw_status , "3")!=0 && v_trade_time_flag==1 )
    {

        // [主动推送][secu.ztrptwtdraw][证券主推_报盘_中泰订单撤单主推报盘消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.927", 0);
        lpPubMsg->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpPubMsg->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpPubMsg->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
        lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
        lpPubMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
        lpPubMsg->SetInt32(LDBIZ_WTDRAW_DATE_INT,v_wtdraw_date);
        lpPubMsg->SetInt32(LDBIZ_WTDRAW_TIME_INT,v_wtdraw_time);
        lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
        lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
        lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
        lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
        lpPubMsg->SetString(LDBIZ_TRADE_ACCO_STR,v_trade_acco);
        lpPubMsg->SetString(LDBIZ_LONG_TOKEN_STR,v_long_token);
        glpPubSub_Interface->PubTopics("secu.ztrptwtdraw", lpPubMsg);

    // end if;
    }

    //内部撤单 直接下达新订单

    // if @撤单状态# = 《撤单状态-成功》 then
    if (strcmp(v_wtdraw_status , "3")==0)
    {

        // if  @订单批号# > 0 then
        if ( v_order_batch_no > 0)
        {

            // set @成交序号# = 0;
            v_strike_id = 0;
            //调用过程[事务_交易证券_主推接口_获取汇总订单成交信息]
            //组织事务请求
            if(lpTSCall1Ans5)
            {
              lpTSCall1Ans5->FreeMsg();
              lpTSCall1Ans5=NULL;
            }
            lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.21", 0);
            lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req5->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpTSCall1Req5->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
            lpTSCall1Req5->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
            lpTSCall1Req5->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
            lpTSCall1Req5->SetInt64(LDBIZ_STRIKE_ID_INT64,v_strike_id);
            glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
            if(!lpTSCall1Ans5)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.21]subcall timed out!");
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
            v_sum_order_row_id = lpTSCall1Ans5->GetInt64(LDBIZ_SUM_ORDER_ROW_ID_INT64);
            v_sum_order_opor_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_ORDER_OPOR_NO_INT);
            v_sum_order_co_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_ORDER_CO_NO_INT);
            v_sum_order_pd_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_ORDER_PD_NO_INT);
            v_sum_order_exch_group_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_ORDER_EXCH_GROUP_NO_INT);
            v_sum_order_asset_acco_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_ORDER_ASSET_ACCO_NO_INT);
            v_sum_order_pass_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_ORDER_PASS_NO_INT);
            strcpy(v_sum_order_exch_crncy_type, lpTSCall1Ans5->GetString(LDBIZ_SUM_ORDER_EXCH_CRNCY_TYPE_STR));
            v_sum_order_stock_code_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_ORDER_STOCK_CODE_NO_INT);
            v_sum_order_trade_code_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_ORDER_TRADE_CODE_NO_INT);
            v_sum_order_target_code_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_ORDER_TARGET_CODE_NO_INT);
            v_sum_order_external_no = lpTSCall1Ans5->GetInt64(LDBIZ_SUM_ORDER_EXTERNAL_NO_INT64);
            v_sum_order_date = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_ORDER_DATE_INT);
            v_sum_order_batch_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_ORDER_BATCH_NO_INT);
            v_sum_order_dir = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_ORDER_DIR_INT);
            v_sum_order_price_type = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_ORDER_PRICE_TYPE_INT);
            v_sum_order_price = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_ORDER_PRICE_FLOAT);
            v_sum_order_qty = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_ORDER_QTY_FLOAT);
            strcpy(v_order_sum_status, lpTSCall1Ans5->GetString(LDBIZ_ORDER_SUM_STATUS_STR));
            v_sum_order_wtdraw_qty = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_ORDER_WTDRAW_QTY_FLOAT);
            v_sum_order_waste_qty = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_ORDER_WASTE_QTY_FLOAT);
            v_sum_order_strike_amt = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_ORDER_STRIKE_AMT_FLOAT);
            v_sum_order_strike_qty = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_ORDER_STRIKE_QTY_FLOAT);
            v_sum_order_strike_aver_price = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_ORDER_STRIKE_AVER_PRICE_FLOAT);
            v_sum_order_net_price_flag = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_ORDER_NET_PRICE_FLAG_INT);
            v_sum_order_bond_accr_intrst = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_ORDER_BOND_ACCR_INTRST_FLOAT);
            v_sum_order_bond_rate_type = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_ORDER_BOND_RATE_TYPE_INT);
            v_sum_order_par_value = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_ORDER_PAR_VALUE_FLOAT);
            v_sum_order_impawn_ratio = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_ORDER_IMPAWN_RATIO_FLOAT);
            strcpy(v_sum_order_oper_way, lpTSCall1Ans5->GetString(LDBIZ_SUM_ORDER_OPER_WAY_STR));
            v_sum_order_update_times = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_ORDER_UPDATE_TIMES_INT);
            v_sum_strike_row_id = lpTSCall1Ans5->GetInt64(LDBIZ_SUM_STRIKE_ROW_ID_INT64);
            v_sum_strike_opor_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_STRIKE_OPOR_NO_INT);
            v_sum_strike_co_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_STRIKE_CO_NO_INT);
            v_sum_strike_pd_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_STRIKE_PD_NO_INT);
            v_sum_strike_exch_group_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_STRIKE_EXCH_GROUP_NO_INT);
            v_sum_strike_asset_acco_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_STRIKE_ASSET_ACCO_NO_INT);
            v_sum_strike_pass_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_STRIKE_PASS_NO_INT);
            strcpy(v_sum_strike_out_acco, lpTSCall1Ans5->GetString(LDBIZ_SUM_STRIKE_OUT_ACCO_STR));
            v_sum_strike_stock_acco_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_STRIKE_STOCK_ACCO_NO_INT);
            v_sum_strike_stock_code_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_STRIKE_STOCK_CODE_NO_INT);
            v_sum_strike_comm_id = lpTSCall1Ans5->GetInt64(LDBIZ_SUM_STRIKE_COMM_ID_INT64);
            v_sum_strike_report_date = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_STRIKE_REPORT_DATE_INT);
            strcpy(v_sum_strike_report_no, lpTSCall1Ans5->GetString(LDBIZ_SUM_STRIKE_REPORT_NO_STR));
            v_sum_strike_order_date = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_STRIKE_ORDER_DATE_INT);
            v_sum_strike_order_id = lpTSCall1Ans5->GetInt64(LDBIZ_SUM_STRIKE_ORDER_ID_INT64);
            v_sum_strike_order_dir = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_STRIKE_ORDER_DIR_INT);
            v_sum_strike_order_price = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_STRIKE_ORDER_PRICE_FLOAT);
            v_sum_strike_order_qty = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_STRIKE_ORDER_QTY_FLOAT);
            v_sum_strike_strike_qty = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_STRIKE_STRIKE_QTY_FLOAT);
            v_sum_strike_strike_amt = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_STRIKE_STRIKE_AMT_FLOAT);
            v_sum_strike_all_fee = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_STRIKE_ALL_FEE_FLOAT);
            v_sum_strike_stamp_tax = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_STRIKE_STAMP_TAX_FLOAT);
            v_sum_strike_trans_fee = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_STRIKE_TRANS_FEE_FLOAT);
            v_sum_strike_brkage_fee = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_STRIKE_BRKAGE_FEE_FLOAT);
            v_sum_strike_SEC_charges = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_STRIKE_SEC_CHARGES_FLOAT);
            v_sum_strike_other_fee = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_STRIKE_OTHER_FEE_FLOAT);
            v_sum_strike_trade_commis = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_STRIKE_TRADE_COMMIS_FLOAT);
            v_sum_strike_other_commis = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_STRIKE_OTHER_COMMIS_FLOAT);
            v_sum_trade_tax = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_TRADE_TAX_FLOAT);
            v_sum_trade_cost_fee = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_TRADE_COST_FEE_FLOAT);
            v_sum_trade_system_use_fee = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_TRADE_SYSTEM_USE_FEE_FLOAT);
            v_sum_stock_settle_fee = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_STOCK_SETTLE_FEE_FLOAT);
            v_sum_strike_net_price_flag = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_STRIKE_NET_PRICE_FLAG_INT);
            v_sum_strike_bond_accr_intrst = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_STRIKE_BOND_ACCR_INTRST_FLOAT);
            v_sum_strike_bond_rate_type = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_STRIKE_BOND_RATE_TYPE_INT);
            strcpy(v_sum_strike_order_oper_way, lpTSCall1Ans5->GetString(LDBIZ_SUM_STRIKE_ORDER_OPER_WAY_STR));
            v_sum_strike_exter_comm_flag = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_STRIKE_EXTER_COMM_FLAG_INT);
            v_sum_strike_update_times = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_STRIKE_UPDATE_TIMES_INT);
            v_sum_strike_order_batch_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_STRIKE_ORDER_BATCH_NO_INT);
            v_sum_external_no = lpTSCall1Ans5->GetInt64(LDBIZ_SUM_EXTERNAL_NO_INT64);


            // [主动推送][secu.ordertotal][证券主推_订单_订单汇总主推消息]
            lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.21", 0);
            lpPubMsg->SetInt64(LDBIZ_SUM_ORDER_ROW_ID_INT64,v_sum_order_row_id);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_OPOR_NO_INT,v_sum_order_opor_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_CO_NO_INT,v_sum_order_co_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_PD_NO_INT,v_sum_order_pd_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_EXCH_GROUP_NO_INT,v_sum_order_exch_group_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_ASSET_ACCO_NO_INT,v_sum_order_asset_acco_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_PASS_NO_INT,v_sum_order_pass_no);
            lpPubMsg->SetString(LDBIZ_SUM_ORDER_EXCH_CRNCY_TYPE_STR,v_sum_order_exch_crncy_type);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_STOCK_CODE_NO_INT,v_sum_order_stock_code_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_TRADE_CODE_NO_INT,v_sum_order_trade_code_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_TARGET_CODE_NO_INT,v_sum_order_target_code_no);
            lpPubMsg->SetInt64(LDBIZ_SUM_ORDER_EXTERNAL_NO_INT64,v_sum_order_external_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_DATE_INT,v_sum_order_date);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_BATCH_NO_INT,v_sum_order_batch_no);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_DIR_INT,v_sum_order_dir);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_PRICE_TYPE_INT,v_sum_order_price_type);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_PRICE_FLOAT,v_sum_order_price);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_QTY_FLOAT,v_sum_order_qty);
            lpPubMsg->SetString(LDBIZ_ORDER_SUM_STATUS_STR,v_order_sum_status);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_WTDRAW_QTY_FLOAT,v_sum_order_wtdraw_qty);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_WASTE_QTY_FLOAT,v_sum_order_waste_qty);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_STRIKE_AMT_FLOAT,v_sum_order_strike_amt);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_STRIKE_QTY_FLOAT,v_sum_order_strike_qty);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_STRIKE_AVER_PRICE_FLOAT,v_sum_order_strike_aver_price);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_NET_PRICE_FLAG_INT,v_sum_order_net_price_flag);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_BOND_ACCR_INTRST_FLOAT,v_sum_order_bond_accr_intrst);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_BOND_RATE_TYPE_INT,v_sum_order_bond_rate_type);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_PAR_VALUE_FLOAT,v_sum_order_par_value);
            lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_IMPAWN_RATIO_FLOAT,v_sum_order_impawn_ratio);
            lpPubMsg->SetString(LDBIZ_SUM_ORDER_OPER_WAY_STR,v_sum_order_oper_way);
            lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_UPDATE_TIMES_INT,v_sum_order_update_times);
            glpPubSub_Interface->PubTopics("secu.ordertotal", lpPubMsg);

        // end if;
        }


        // if @指令序号# > 0 then
        if (v_comm_id > 0)
        {
            //调用过程[事务_交易证券_主推接口_获取指令混合信息]
            //组织事务请求
            if(lpTSCall1Ans6)
            {
              lpTSCall1Ans6->FreeMsg();
              lpTSCall1Ans6=NULL;
            }
            lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.3", 0);
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
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.3]subcall timed out!");
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
            v_co_no = lpTSCall1Ans6->GetInt32(LDBIZ_CO_NO_INT);
            v_pd_no = lpTSCall1Ans6->GetInt32(LDBIZ_PD_NO_INT);
            v_exch_group_no = lpTSCall1Ans6->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
            v_asset_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            v_pass_no = lpTSCall1Ans6->GetInt32(LDBIZ_PASS_NO_INT);
            strcpy(v_out_acco, lpTSCall1Ans6->GetString(LDBIZ_OUT_ACCO_STR));
            strcpy(v_exch_crncy_type, lpTSCall1Ans6->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
            v_stock_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
            v_stock_code_no = lpTSCall1Ans6->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
            v_stock_type = lpTSCall1Ans6->GetInt32(LDBIZ_STOCK_TYPE_INT);
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
            v_comm_appr_oper = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
            strcpy(v_comm_appr_remark, lpTSCall1Ans6->GetString(LDBIZ_COMM_APPR_REMARK_STR));
            v_basket_id = lpTSCall1Ans6->GetInt64(LDBIZ_BASKET_ID_INT64);
            v_net_price_flag = lpTSCall1Ans6->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
            v_bond_accr_intrst = lpTSCall1Ans6->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
            v_bond_rate_type = lpTSCall1Ans6->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
            strcpy(v_comm_oper_way, lpTSCall1Ans6->GetString(LDBIZ_COMM_OPER_WAY_STR));
            v_exter_comm_flag = lpTSCall1Ans6->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
            v_comm_comple_flag = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
            v_strategy_capt_qty = lpTSCall1Ans6->GetDouble(LDBIZ_STRATEGY_CAPT_QTY_FLOAT);
            v_strategy_order_qty = lpTSCall1Ans6->GetDouble(LDBIZ_STRATEGY_ORDER_QTY_FLOAT);
            strcpy(v_contra_no, lpTSCall1Ans6->GetString(LDBIZ_CONTRA_NO_STR));
            strcpy(v_comm_remark_info, lpTSCall1Ans6->GetString(LDBIZ_COMM_REMARK_INFO_STR));
            v_disp_opor = lpTSCall1Ans6->GetInt32(LDBIZ_DISP_OPOR_INT);
            v_disp_status = lpTSCall1Ans6->GetInt32(LDBIZ_DISP_STATUS_INT);
            v_read_flag = lpTSCall1Ans6->GetInt32(LDBIZ_READ_FLAG_INT);
            v_update_times = lpTSCall1Ans6->GetInt32(LDBIZ_UPDATE_TIMES_INT);
            v_sum_comm_row_id = lpTSCall1Ans6->GetInt64(LDBIZ_SUM_COMM_ROW_ID_INT64);
            v_sum_comm_co_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_CO_NO_INT);
            v_sum_comm_pd_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_PD_NO_INT);
            v_sum_comm_exch_group_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_EXCH_GROUP_NO_INT);
            v_sum_comm_asset_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_ASSET_ACCO_NO_INT);
            v_sum_comm_pass_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_PASS_NO_INT);
            strcpy(v_sum_comm_out_acco, lpTSCall1Ans6->GetString(LDBIZ_SUM_COMM_OUT_ACCO_STR));
            strcpy(v_sum_comm_exch_crncy_type, lpTSCall1Ans6->GetString(LDBIZ_SUM_COMM_EXCH_CRNCY_TYPE_STR));
            v_sum_comm_stock_code_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_STOCK_CODE_NO_INT);
            v_sum_comm_date = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_DATE_INT);
            v_sum_comm_time = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_TIME_INT);
            v_sum_comm_batch_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_BATCH_NO_INT);
            v_sum_comm_opor = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_OPOR_INT);
            v_sum_comm_executor = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_EXECUTOR_INT);
            v_sum_comm_dir = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_DIR_INT);
            v_sum_comm_limit_price = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_LIMIT_PRICE_FLOAT);
            v_sum_comm_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_QTY_FLOAT);
            v_sum_comm_amt = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_AMT_FLOAT);
            v_sum_comm_order_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_ORDER_QTY_FLOAT);
            v_sum_comm_cancel_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_CANCEL_QTY_FLOAT);
            v_sum_comm_await_cancel_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_AWAIT_CANCEL_QTY_FLOAT);
            v_sum_comm_strike_amt = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_STRIKE_AMT_FLOAT);
            v_sum_comm_strike_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_STRIKE_QTY_FLOAT);
            strcpy(v_sum_comm_strike_status, lpTSCall1Ans6->GetString(LDBIZ_SUM_COMM_STRIKE_STATUS_STR));
            strcpy(v_comm_sum_status, lpTSCall1Ans6->GetString(LDBIZ_COMM_SUM_STATUS_STR));
            v_sum_comm_begin_date = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_BEGIN_DATE_INT);
            v_sum_comm_end_date = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_END_DATE_INT);
            v_sum_comm_begin_time = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_BEGIN_TIME_INT);
            v_sum_comm_end_time = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_END_TIME_INT);
            v_sum_comm_comple_date = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_COMPLE_DATE_INT);
            v_sum_comm_comple_time = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_COMPLE_TIME_INT);
            v_sum_comm_max_comm_comple_date = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_DATE_INT);
            v_sum_comm_max_comm_comple_time = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_TIME_INT);
            v_sum_comm_appr_date = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_APPR_DATE_INT);
            v_sum_comm_appr_time = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_APPR_TIME_INT);
            v_sum_comm_appr_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_APPR_QTY_FLOAT);
            strcpy(v_comm_sum_approve_status, lpTSCall1Ans6->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
            v_sum_comm_basket_id = lpTSCall1Ans6->GetInt64(LDBIZ_SUM_COMM_BASKET_ID_INT64);
            v_sum_comm_net_price_flag = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_NET_PRICE_FLAG_INT);
            v_sum_comm_bond_accr_intrst = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_COMM_BOND_ACCR_INTRST_FLOAT);
            v_sum_comm_bond_rate_type = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_BOND_RATE_TYPE_INT);
            strcpy(v_sum_comm_oper_way, lpTSCall1Ans6->GetString(LDBIZ_SUM_COMM_OPER_WAY_STR));
            v_sum_comm_exter_comm_flag = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_EXTER_COMM_FLAG_INT);
            v_sum_buy_order_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_BUY_ORDER_QTY_FLOAT);
            v_sum_sell_order_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_SELL_ORDER_QTY_FLOAT);
            v_sum_buy_comm_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_BUY_COMM_QTY_FLOAT);
            v_sum_sell_comm_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_SELL_COMM_QTY_FLOAT);
            v_sum_buy_strike_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_BUY_STRIKE_QTY_FLOAT);
            v_sum_sell_strike_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_SELL_STRIKE_QTY_FLOAT);
            v_sum_buy_strike_amt = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_BUY_STRIKE_AMT_FLOAT);
            v_sum_sell_strike_amt = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_SELL_STRIKE_AMT_FLOAT);
            v_sum_buy_comm_amt = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_BUY_COMM_AMT_FLOAT);
            v_sum_sell_comm_amt = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_SELL_COMM_AMT_FLOAT);
            strcpy(v_sum_comm_remark_info, lpTSCall1Ans6->GetString(LDBIZ_SUM_COMM_REMARK_INFO_STR));
            v_sum_comm_update_times = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_COMM_UPDATE_TIMES_INT);
            strcpy(v_acco_concat_info, lpTSCall1Ans6->GetString(LDBIZ_ACCO_CONCAT_INFO_STR));
            strcpy(v_combo_code, lpTSCall1Ans6->GetString(LDBIZ_COMBO_CODE_STR));


            // [主动推送][secu.comm][证券主推_指令_指令主推消息]
            lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.40", 0);
            lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
            lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
            lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
            lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
            lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
            lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
            lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
            lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
            lpPubMsg->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
            lpPubMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
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
            lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT,v_comm_frozen_amt);
            lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT,v_comm_frozen_qty);
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
            lpPubMsg->SetInt64(LDBIZ_BASKET_ID_INT64,v_basket_id);
            lpPubMsg->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
            lpPubMsg->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
            lpPubMsg->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
            lpPubMsg->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
            lpPubMsg->SetInt32(LDBIZ_EXTER_COMM_FLAG_INT,v_exter_comm_flag);
            lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_FLAG_INT,v_comm_comple_flag);
            lpPubMsg->SetDouble(LDBIZ_STRATEGY_CAPT_QTY_FLOAT,v_strategy_capt_qty);
            lpPubMsg->SetDouble(LDBIZ_STRATEGY_ORDER_QTY_FLOAT,v_strategy_order_qty);
            lpPubMsg->SetString(LDBIZ_CONTRA_NO_STR,v_contra_no);
            lpPubMsg->SetString(LDBIZ_COMM_REMARK_INFO_STR,v_comm_remark_info);
            lpPubMsg->SetInt32(LDBIZ_DISP_OPOR_INT,v_disp_opor);
            lpPubMsg->SetInt32(LDBIZ_DISP_STATUS_INT,v_disp_status);
            lpPubMsg->SetInt32(LDBIZ_READ_FLAG_INT,v_read_flag);
            lpPubMsg->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
            lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
            glpPubSub_Interface->PubTopics("secu.comm", lpPubMsg);


            // if @指令批号# > 0 then
            if (v_comm_batch_no > 0)
            {

                 // set @指令备注信息# = @汇总指令备注信息#;
                 strcpy(v_comm_remark_info,v_sum_comm_remark_info);

                // [主动推送][secu.commtotal][证券主推_指令_指令汇总主推消息]
                lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.41", 0);
                lpPubMsg->SetInt64(LDBIZ_SUM_COMM_ROW_ID_INT64,v_sum_comm_row_id);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_CO_NO_INT,v_sum_comm_co_no);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_PD_NO_INT,v_sum_comm_pd_no);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_EXCH_GROUP_NO_INT,v_sum_comm_exch_group_no);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_ASSET_ACCO_NO_INT,v_sum_comm_asset_acco_no);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_PASS_NO_INT,v_sum_comm_pass_no);
                lpPubMsg->SetString(LDBIZ_SUM_COMM_OUT_ACCO_STR,v_sum_comm_out_acco);
                lpPubMsg->SetString(LDBIZ_SUM_COMM_EXCH_CRNCY_TYPE_STR,v_sum_comm_exch_crncy_type);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_STOCK_CODE_NO_INT,v_sum_comm_stock_code_no);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_DATE_INT,v_sum_comm_date);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_TIME_INT,v_sum_comm_time);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BATCH_NO_INT,v_sum_comm_batch_no);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_OPOR_INT,v_sum_comm_opor);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_EXECUTOR_INT,v_sum_comm_executor);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_DIR_INT,v_sum_comm_dir);
                lpPubMsg->SetDouble(LDBIZ_SUM_COMM_LIMIT_PRICE_FLOAT,v_sum_comm_limit_price);
                lpPubMsg->SetDouble(LDBIZ_SUM_COMM_QTY_FLOAT,v_sum_comm_qty);
                lpPubMsg->SetDouble(LDBIZ_SUM_COMM_AMT_FLOAT,v_sum_comm_amt);
                lpPubMsg->SetDouble(LDBIZ_SUM_COMM_ORDER_QTY_FLOAT,v_sum_comm_order_qty);
                lpPubMsg->SetDouble(LDBIZ_SUM_COMM_CANCEL_QTY_FLOAT,v_sum_comm_cancel_qty);
                lpPubMsg->SetDouble(LDBIZ_SUM_COMM_AWAIT_CANCEL_QTY_FLOAT,v_sum_comm_await_cancel_qty);
                lpPubMsg->SetDouble(LDBIZ_SUM_COMM_STRIKE_AMT_FLOAT,v_sum_comm_strike_amt);
                lpPubMsg->SetDouble(LDBIZ_SUM_COMM_STRIKE_QTY_FLOAT,v_sum_comm_strike_qty);
                lpPubMsg->SetString(LDBIZ_SUM_COMM_STRIKE_STATUS_STR,v_sum_comm_strike_status);
                lpPubMsg->SetString(LDBIZ_COMM_SUM_STATUS_STR,v_comm_sum_status);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BEGIN_DATE_INT,v_sum_comm_begin_date);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_END_DATE_INT,v_sum_comm_end_date);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BEGIN_TIME_INT,v_sum_comm_begin_time);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_END_TIME_INT,v_sum_comm_end_time);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_COMPLE_DATE_INT,v_sum_comm_comple_date);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_COMPLE_TIME_INT,v_sum_comm_comple_time);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_DATE_INT,v_sum_comm_max_comm_comple_date);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_TIME_INT,v_sum_comm_max_comm_comple_time);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_APPR_DATE_INT,v_sum_comm_appr_date);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_APPR_TIME_INT,v_sum_comm_appr_time);
                lpPubMsg->SetDouble(LDBIZ_SUM_COMM_APPR_QTY_FLOAT,v_sum_comm_appr_qty);
                lpPubMsg->SetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR,v_comm_sum_approve_status);
                lpPubMsg->SetInt64(LDBIZ_SUM_COMM_BASKET_ID_INT64,v_sum_comm_basket_id);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_NET_PRICE_FLAG_INT,v_sum_comm_net_price_flag);
                lpPubMsg->SetDouble(LDBIZ_SUM_COMM_BOND_ACCR_INTRST_FLOAT,v_sum_comm_bond_accr_intrst);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BOND_RATE_TYPE_INT,v_sum_comm_bond_rate_type);
                lpPubMsg->SetString(LDBIZ_SUM_COMM_OPER_WAY_STR,v_sum_comm_oper_way);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_EXTER_COMM_FLAG_INT,v_sum_comm_exter_comm_flag);
                lpPubMsg->SetDouble(LDBIZ_SUM_BUY_ORDER_QTY_FLOAT,v_sum_buy_order_qty);
                lpPubMsg->SetDouble(LDBIZ_SUM_SELL_ORDER_QTY_FLOAT,v_sum_sell_order_qty);
                lpPubMsg->SetDouble(LDBIZ_SUM_BUY_COMM_QTY_FLOAT,v_sum_buy_comm_qty);
                lpPubMsg->SetDouble(LDBIZ_SUM_SELL_COMM_QTY_FLOAT,v_sum_sell_comm_qty);
                lpPubMsg->SetDouble(LDBIZ_SUM_BUY_STRIKE_QTY_FLOAT,v_sum_buy_strike_qty);
                lpPubMsg->SetDouble(LDBIZ_SUM_SELL_STRIKE_QTY_FLOAT,v_sum_sell_strike_qty);
                lpPubMsg->SetDouble(LDBIZ_SUM_BUY_STRIKE_AMT_FLOAT,v_sum_buy_strike_amt);
                lpPubMsg->SetDouble(LDBIZ_SUM_SELL_STRIKE_AMT_FLOAT,v_sum_sell_strike_amt);
                lpPubMsg->SetDouble(LDBIZ_SUM_BUY_COMM_AMT_FLOAT,v_sum_buy_comm_amt);
                lpPubMsg->SetDouble(LDBIZ_SUM_SELL_COMM_AMT_FLOAT,v_sum_sell_comm_amt);
                lpPubMsg->SetString(LDBIZ_COMM_REMARK_INFO_STR,v_comm_remark_info);
                lpPubMsg->SetInt32(LDBIZ_READ_FLAG_INT,v_read_flag);
                lpPubMsg->SetString(LDBIZ_ACCO_CONCAT_INFO_STR,v_acco_concat_info);
                lpPubMsg->SetInt32(LDBIZ_SUM_COMM_UPDATE_TIMES_INT,v_sum_comm_update_times);
                glpPubSub_Interface->PubTopics("secu.commtotal", lpPubMsg);

            // end if;
            }

        // end if;
        }

      //质押提交和质押转回，要推交易代码和标准券代码

      // if @订单方向# = 《订单方向-质押提交》 or @订单方向# = 《订单方向-质押转回》 then
      if (v_order_dir == 21 || v_order_dir == 22)
      {
        //调用过程[事务_交易证券_主推接口_获取资金和质押持仓信息]
        //组织事务请求
        if(lpTSCall1Ans7)
        {
          lpTSCall1Ans7->FreeMsg();
          lpTSCall1Ans7=NULL;
        }
        lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.28", 0);
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
        lpTSCall1Req7->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req7->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req7->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
        lpTSCall1Req7->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpTSCall1Req7->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
        if(!lpTSCall1Ans7)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.28]subcall timed out!");
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
        v_exgp_cash_id = lpTSCall1Ans7->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
        v_exgp_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
        v_exgp_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
        v_exgp_comm_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
        v_exgp_comm_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
        v_exgp_comm_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
        v_exgp_comm_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
        v_exgp_trade_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT);
        v_exgp_trade_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT);
        v_exgp_trade_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
        v_exgp_trade_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
        v_exgp_strike_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
        v_exgp_strike_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
        v_exgp_cash_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
        v_exgp_posi_id = lpTSCall1Ans7->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
        v_exgp_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
        v_exgp_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
        v_exgp_comm_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT);
        v_exgp_comm_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT);
        v_exgp_comm_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT);
        v_exgp_comm_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
        v_exgp_trade_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT);
        v_exgp_trade_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT);
        v_exgp_trade_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT);
        v_exgp_trade_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
        v_exgp_strike_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT);
        v_exgp_strike_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
        v_exgp_strike_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT);
        v_exgp_strike_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT);
        v_exgp_realize_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
        v_exgp_cost_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
        v_exgp_intrst_cost_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
        v_exgp_intrst_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
        v_exgp_posi_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
        v_asac_cash_id = lpTSCall1Ans7->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
        v_asac_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
        v_asac_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
        v_asac_comm_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
        v_asac_comm_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
        v_asac_comm_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
        v_asac_comm_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
        v_asac_trade_frozen_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT);
        v_asac_trade_unfroz_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT);
        v_asac_trade_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
        v_asac_trade_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
        v_asac_strike_capt_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
        v_asac_strike_releas_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
        v_asac_cash_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);
        v_asac_posi_id = lpTSCall1Ans7->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
        v_asac_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
        v_asac_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
        v_asac_comm_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT);
        v_asac_comm_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT);
        v_asac_comm_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT);
        v_asac_comm_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
        v_asac_trade_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT);
        v_asac_trade_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT);
        v_asac_trade_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT);
        v_asac_trade_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
        v_asac_strike_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT);
        v_asac_strike_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
        v_asac_strike_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT);
        v_asac_strike_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT);
        v_asac_realize_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
        v_asac_cost_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
        v_asac_intrst_cost_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
        v_asac_intrst_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
        v_asac_posi_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);
        v_exgp_target_posi_id = lpTSCall1Ans7->GetInt64(LDBIZ_EXGP_TARGET_POSI_ID_INT64);
        v_exgp_target_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TARGET_FROZEN_QTY_FLOAT);
        v_exgp_target_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TARGET_UNFROZ_QTY_FLOAT);
        v_exgp_target_comm_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TARGET_COMM_FROZEN_QTY_FLOAT);
        v_exgp_target_comm_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TARGET_COMM_UNFROZ_QTY_FLOAT);
        v_exgp_target_comm_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TARGET_COMM_CAPT_QTY_FLOAT);
        v_exgp_target_comm_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TARGET_COMM_RELEAS_QTY_FLOAT);
        v_exgp_target_trade_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TARGET_TRADE_FROZEN_QTY_FLOAT);
        v_exgp_target_trade_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TARGET_TRADE_UNFROZ_QTY_FLOAT);
        v_exgp_target_trade_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TARGET_TRADE_CAPT_QTY_FLOAT);
        v_exgp_target_trade_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TARGET_TRADE_RELEAS_QTY_FLOAT);
        v_exgp_target_strike_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_CAPT_QTY_FLOAT);
        v_exgp_target_strike_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_RELEAS_QTY_FLOAT);
        v_exgp_target_strike_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_FROZEN_QTY_FLOAT);
        v_exgp_target_strike_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_UNFROZ_QTY_FLOAT);
        v_exgp_target_realize_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TARGET_REALIZE_PANDL_FLOAT);
        v_exgp_target_cost_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TARGET_COST_AMT_FLOAT);
        v_exgp_target_intrst_cost_amt = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TARGET_INTRST_COST_AMT_FLOAT);
        v_exgp_target_intrst_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_TARGET_INTRST_PANDL_FLOAT);
        v_exgp_target_posi_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_EXGP_TARGET_POSI_UPDATE_TIMES_INT);
        v_asac_target_posi_id = lpTSCall1Ans7->GetInt64(LDBIZ_ASAC_TARGET_POSI_ID_INT64);
        v_asac_target_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TARGET_FROZEN_QTY_FLOAT);
        v_asac_target_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TARGET_UNFROZ_QTY_FLOAT);
        v_asac_target_comm_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TARGET_COMM_FROZEN_QTY_FLOAT);
        v_asac_target_comm_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TARGET_COMM_UNFROZ_QTY_FLOAT);
        v_asac_target_comm_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TARGET_COMM_CAPT_QTY_FLOAT);
        v_asac_target_comm_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TARGET_COMM_RELEAS_QTY_FLOAT);
        v_asac_target_trade_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TARGET_TRADE_FROZEN_QTY_FLOAT);
        v_asac_target_trade_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TARGET_TRADE_UNFROZ_QTY_FLOAT);
        v_asac_target_trade_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TARGET_TRADE_CAPT_QTY_FLOAT);
        v_asac_target_trade_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TARGET_TRADE_RELEAS_QTY_FLOAT);
        v_asac_target_strike_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_CAPT_QTY_FLOAT);
        v_asac_target_strike_releas_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_RELEAS_QTY_FLOAT);
        v_asac_target_strike_frozen_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_FROZEN_QTY_FLOAT);
        v_asac_target_strike_unfroz_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_UNFROZ_QTY_FLOAT);
        v_asac_target_realize_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TARGET_REALIZE_PANDL_FLOAT);
        v_asac_target_cost_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TARGET_COST_AMT_FLOAT);
        v_asac_target_intrst_cost_amt = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TARGET_INTRST_COST_AMT_FLOAT);
        v_asac_target_intrst_pandl = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_TARGET_INTRST_PANDL_FLOAT);
        v_asac_target_posi_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_ASAC_TARGET_POSI_UPDATE_TIMES_INT);
        v_exgp_put_impawn_qty = lpTSCall1Ans7->GetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT);
        v_asac_put_impawn_qty = lpTSCall1Ans7->GetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT);


        // set @证券代码编号# = @交易代码编号#;
        v_stock_code_no = v_trade_code_no;

        // [主动推送][secu.exgpcapital][证券主推_资金_交易组资金主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.50", 0);
        lpPubMsg->SetInt64(LDBIZ_EXGP_CASH_ID_INT64,v_exgp_cash_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT,v_exgp_comm_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT,v_exgp_comm_unfroz_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT,v_exgp_comm_capt_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT,v_exgp_comm_releas_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT,v_exgp_trade_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT,v_exgp_trade_unfroz_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT,v_exgp_trade_capt_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT,v_exgp_trade_releas_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT,v_exgp_strike_capt_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT,v_exgp_strike_releas_amt);
        lpPubMsg->SetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT,v_exgp_cash_update_times);
        glpPubSub_Interface->PubTopics("secu.exgpcapital", lpPubMsg);


        // [主动推送][secu.exgpposi][证券主推_持仓_交易组持仓主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.60", 0);
        lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT,v_exgp_comm_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT,v_exgp_comm_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT,v_exgp_comm_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT,v_exgp_trade_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT,v_exgp_trade_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT,v_exgp_trade_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT,v_exgp_strike_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT,v_exgp_strike_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT,v_exgp_strike_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
        lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
        lpPubMsg->SetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT,v_exgp_put_impawn_qty);
        glpPubSub_Interface->PubTopics("secu.exgpposi", lpPubMsg);


        // [主动推送][secu.asaccapital][证券主推_资金_资产账户资金主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.51", 0);
        lpPubMsg->SetInt64(LDBIZ_ASAC_CASH_ID_INT64,v_asac_cash_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT,v_asac_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT,v_asac_unfroz_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT,v_asac_comm_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT,v_asac_comm_unfroz_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT,v_asac_comm_capt_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT,v_asac_comm_releas_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT,v_asac_trade_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT,v_asac_trade_unfroz_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT,v_asac_trade_capt_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT,v_asac_trade_releas_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT,v_asac_strike_capt_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT,v_asac_strike_releas_amt);
        lpPubMsg->SetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT,v_asac_cash_update_times);
        glpPubSub_Interface->PubTopics("secu.asaccapital", lpPubMsg);


        // [主动推送][secu.asacposi][证券主推_持仓_资产账户持仓主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.61", 0);
        lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT,v_asac_comm_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT,v_asac_comm_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT,v_asac_comm_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT,v_asac_trade_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT,v_asac_trade_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT,v_asac_trade_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT,v_asac_strike_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT,v_asac_strike_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT,v_asac_strike_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
        lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
        lpPubMsg->SetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT,v_asac_put_impawn_qty);
        glpPubSub_Interface->PubTopics("secu.asacposi", lpPubMsg);


        // set @证券代码编号# = @标的代码编号#;
        v_stock_code_no = v_target_code_no;

        // set @交易组提交质押数量# = 0;
        v_exgp_put_impawn_qty = 0;

        // set @资产账户提交质押数量# = 0;
        v_asac_put_impawn_qty = 0;

        // set @交易组持仓序号# = @交易组标的持仓序号#;
        v_exgp_posi_id = v_exgp_target_posi_id;

        // set @交易组冻结数量# = @交易组标的冻结数量#;
        v_exgp_frozen_qty = v_exgp_target_frozen_qty;

        // set @交易组解冻数量# = @交易组标的解冻数量#;
        v_exgp_unfroz_qty = v_exgp_target_unfroz_qty;

        // set @交易组指令冻结数量# = @交易组标的指令冻结数量#;
        v_exgp_comm_frozen_qty = v_exgp_target_comm_frozen_qty;

        // set @交易组指令解冻数量# = @交易组标的指令解冻数量#;
        v_exgp_comm_unfroz_qty = v_exgp_target_comm_unfroz_qty;

        // set @交易组指令占用数量# = @交易组标的指令占用数量#;
        v_exgp_comm_capt_qty = v_exgp_target_comm_capt_qty;

        // set @交易组指令释放数量# = @交易组标的指令释放数量#;
        v_exgp_comm_releas_qty = v_exgp_target_comm_releas_qty;

        // set @交易组交易冻结数量# = @交易组标的交易冻结数量#;
        v_exgp_trade_frozen_qty = v_exgp_target_trade_frozen_qty;

        // set @交易组交易解冻数量# = @交易组标的交易解冻数量#;
        v_exgp_trade_unfroz_qty = v_exgp_target_trade_unfroz_qty;

        // set @交易组交易占用数量# = @交易组标的交易占用数量#;
        v_exgp_trade_capt_qty = v_exgp_target_trade_capt_qty;

        // set @交易组交易释放数量# = @交易组标的交易释放数量#;
        v_exgp_trade_releas_qty = v_exgp_target_trade_releas_qty;

        // set @交易组成交占用数量# = @交易组标的成交占用数量#;
        v_exgp_strike_capt_qty = v_exgp_target_strike_capt_qty;

        // set @交易组成交释放数量# = @交易组标的成交释放数量#;
        v_exgp_strike_releas_qty = v_exgp_target_strike_releas_qty;

        // set @交易组成交冻结数量# = @交易组标的成交冻结数量#;
        v_exgp_strike_frozen_qty = v_exgp_target_strike_frozen_qty;

        // set @交易组成交解冻数量# = @交易组标的成交解冻数量#;
        v_exgp_strike_unfroz_qty = v_exgp_target_strike_unfroz_qty;

        // set @交易组实现盈亏# = @交易组标的实现盈亏#;
        v_exgp_realize_pandl = v_exgp_target_realize_pandl;

        // set @交易组成本金额# = @交易组标的成本金额#;
        v_exgp_cost_amt = v_exgp_target_cost_amt;

        // set @交易组利息成本金额# = @交易组标的利息成本金额#;
        v_exgp_intrst_cost_amt = v_exgp_target_intrst_cost_amt;

        // set @交易组利息收益# = @交易组标的利息收益#;
        v_exgp_intrst_pandl = v_exgp_target_intrst_pandl;

        // set @交易组持仓更新次数# = @交易组标的持仓更新次数#;
        v_exgp_posi_update_times = v_exgp_target_posi_update_times;

        // set @资产账户持仓序号# = @资产账户标的持仓序号#;
        v_asac_posi_id = v_asac_target_posi_id;

        // set @资产账户冻结数量# = @资产账户标的冻结数量#;
        v_asac_frozen_qty = v_asac_target_frozen_qty;

        // set @资产账户解冻数量# = @资产账户标的解冻数量#;
        v_asac_unfroz_qty = v_asac_target_unfroz_qty;

        // set @资产账户指令冻结数量# = @资产账户标的指令冻结数量#;
        v_asac_comm_frozen_qty = v_asac_target_comm_frozen_qty;

        // set @资产账户指令解冻数量# = @资产账户标的指令解冻数量#;
        v_asac_comm_unfroz_qty = v_asac_target_comm_unfroz_qty;

        // set @资产账户指令占用数量# = @资产账户标的指令占用数量#;
        v_asac_comm_capt_qty = v_asac_target_comm_capt_qty;

        // set @资产账户指令释放数量# = @资产账户标的指令释放数量#;
        v_asac_comm_releas_qty = v_asac_target_comm_releas_qty;

        // set @资产账户交易冻结数量# = @资产账户标的交易冻结数量#;
        v_asac_trade_frozen_qty = v_asac_target_trade_frozen_qty;

        // set @资产账户交易解冻数量# = @资产账户标的交易解冻数量#;
        v_asac_trade_unfroz_qty = v_asac_target_trade_unfroz_qty;

        // set @资产账户交易占用数量# = @资产账户标的交易占用数量#;
        v_asac_trade_capt_qty = v_asac_target_trade_capt_qty;

        // set @资产账户交易释放数量# = @资产账户标的交易释放数量#;
        v_asac_trade_releas_qty = v_asac_target_trade_releas_qty;

        // set @资产账户成交占用数量# = @资产账户标的成交占用数量#;
        v_asac_strike_capt_qty = v_asac_target_strike_capt_qty;

        // set @资产账户成交释放数量# = @资产账户标的成交释放数量#;
        v_asac_strike_releas_qty = v_asac_target_strike_releas_qty;

        // set @资产账户成交冻结数量# = @资产账户标的成交冻结数量#;
        v_asac_strike_frozen_qty = v_asac_target_strike_frozen_qty;

        // set @资产账户成交解冻数量# = @资产账户标的成交解冻数量#;
        v_asac_strike_unfroz_qty = v_asac_target_strike_unfroz_qty;

        // set @资产账户实现盈亏# = @资产账户标的实现盈亏#;
        v_asac_realize_pandl = v_asac_target_realize_pandl;

        // set @资产账户成本金额# = @资产账户标的成本金额#;
        v_asac_cost_amt = v_asac_target_cost_amt;

        // set @资产账户利息成本金额# = @资产账户标的利息成本金额#;
        v_asac_intrst_cost_amt = v_asac_target_intrst_cost_amt;

        // set @资产账户利息收益# = @资产账户标的利息收益#;
        v_asac_intrst_pandl = v_asac_target_intrst_pandl;

        // set @资产账户持仓更新次数# = @资产账户标的持仓更新次数#;
        v_asac_posi_update_times = v_asac_target_posi_update_times;

        // [主动推送][secu.exgpposi][证券主推_持仓_交易组持仓主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.60", 0);
        lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT,v_exgp_comm_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT,v_exgp_comm_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT,v_exgp_comm_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT,v_exgp_trade_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT,v_exgp_trade_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT,v_exgp_trade_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT,v_exgp_strike_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT,v_exgp_strike_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT,v_exgp_strike_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
        lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
        lpPubMsg->SetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT,v_exgp_put_impawn_qty);
        glpPubSub_Interface->PubTopics("secu.exgpposi", lpPubMsg);


        // [主动推送][secu.asacposi][证券主推_持仓_资产账户持仓主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.61", 0);
        lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT,v_asac_comm_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT,v_asac_comm_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT,v_asac_comm_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT,v_asac_trade_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT,v_asac_trade_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT,v_asac_trade_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT,v_asac_strike_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT,v_asac_strike_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT,v_asac_strike_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
        lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
        lpPubMsg->SetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT,v_asac_put_impawn_qty);
        glpPubSub_Interface->PubTopics("secu.asacposi", lpPubMsg);


      }
      // else if @订单方向# = 《订单方向-融资回购》 or @订单方向# = 《订单方向-融券回购》 then
      else if (v_order_dir == 3 || v_order_dir == 4)
      {

        // set @证券代码编号# = @标的代码编号#;
        v_stock_code_no = v_target_code_no;
        //调用过程[事务_交易证券_主推接口_获取资金持仓信息]
        //组织事务请求
        if(lpTSCall1Ans8)
        {
          lpTSCall1Ans8->FreeMsg();
          lpTSCall1Ans8=NULL;
        }
        lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.13", 0);
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
        lpTSCall1Req8->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req8->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req8->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
        if(!lpTSCall1Ans8)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.13]subcall timed out!");
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
        v_exgp_frozen_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
        v_exgp_unfroz_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
        v_exgp_comm_frozen_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
        v_exgp_comm_unfroz_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
        v_exgp_comm_capt_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
        v_exgp_comm_releas_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
        v_exgp_trade_frozen_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT);
        v_exgp_trade_unfroz_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT);
        v_exgp_trade_capt_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
        v_exgp_trade_releas_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
        v_exgp_strike_capt_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
        v_exgp_strike_releas_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
        v_exgp_cash_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
        v_exgp_posi_id = lpTSCall1Ans8->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
        v_exgp_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
        v_exgp_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
        v_exgp_comm_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT);
        v_exgp_comm_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT);
        v_exgp_comm_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT);
        v_exgp_comm_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
        v_exgp_trade_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT);
        v_exgp_trade_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT);
        v_exgp_trade_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT);
        v_exgp_trade_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
        v_exgp_strike_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT);
        v_exgp_strike_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
        v_exgp_strike_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT);
        v_exgp_strike_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT);
        v_exgp_realize_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
        v_exgp_cost_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
        v_exgp_intrst_cost_amt = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
        v_exgp_intrst_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
        v_exgp_posi_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
        v_asac_cash_id = lpTSCall1Ans8->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
        v_asac_frozen_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
        v_asac_unfroz_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
        v_asac_comm_frozen_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
        v_asac_comm_unfroz_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
        v_asac_comm_capt_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
        v_asac_comm_releas_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
        v_asac_trade_frozen_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT);
        v_asac_trade_unfroz_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT);
        v_asac_trade_capt_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
        v_asac_trade_releas_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
        v_asac_strike_capt_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
        v_asac_strike_releas_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
        v_asac_cash_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);
        v_asac_posi_id = lpTSCall1Ans8->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
        v_asac_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
        v_asac_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
        v_asac_comm_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT);
        v_asac_comm_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT);
        v_asac_comm_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT);
        v_asac_comm_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
        v_asac_trade_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT);
        v_asac_trade_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT);
        v_asac_trade_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT);
        v_asac_trade_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
        v_asac_strike_capt_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT);
        v_asac_strike_releas_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
        v_asac_strike_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT);
        v_asac_strike_unfroz_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT);
        v_asac_realize_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
        v_asac_cost_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
        v_asac_intrst_cost_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
        v_asac_intrst_pandl = lpTSCall1Ans8->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
        v_asac_posi_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


        // [主动推送][secu.exgpcapital][证券主推_资金_交易组资金主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.50", 0);
        lpPubMsg->SetInt64(LDBIZ_EXGP_CASH_ID_INT64,v_exgp_cash_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT,v_exgp_comm_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT,v_exgp_comm_unfroz_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT,v_exgp_comm_capt_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT,v_exgp_comm_releas_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT,v_exgp_trade_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT,v_exgp_trade_unfroz_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT,v_exgp_trade_capt_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT,v_exgp_trade_releas_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT,v_exgp_strike_capt_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT,v_exgp_strike_releas_amt);
        lpPubMsg->SetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT,v_exgp_cash_update_times);
        glpPubSub_Interface->PubTopics("secu.exgpcapital", lpPubMsg);


        // [主动推送][secu.exgpposi][证券主推_持仓_交易组持仓主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.60", 0);
        lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT,v_exgp_comm_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT,v_exgp_comm_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT,v_exgp_comm_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT,v_exgp_trade_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT,v_exgp_trade_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT,v_exgp_trade_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT,v_exgp_strike_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT,v_exgp_strike_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT,v_exgp_strike_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
        lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
        lpPubMsg->SetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT,v_exgp_put_impawn_qty);
        glpPubSub_Interface->PubTopics("secu.exgpposi", lpPubMsg);


        // [主动推送][secu.asaccapital][证券主推_资金_资产账户资金主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.51", 0);
        lpPubMsg->SetInt64(LDBIZ_ASAC_CASH_ID_INT64,v_asac_cash_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT,v_asac_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT,v_asac_unfroz_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT,v_asac_comm_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT,v_asac_comm_unfroz_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT,v_asac_comm_capt_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT,v_asac_comm_releas_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT,v_asac_trade_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT,v_asac_trade_unfroz_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT,v_asac_trade_capt_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT,v_asac_trade_releas_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT,v_asac_strike_capt_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT,v_asac_strike_releas_amt);
        lpPubMsg->SetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT,v_asac_cash_update_times);
        glpPubSub_Interface->PubTopics("secu.asaccapital", lpPubMsg);


        // [主动推送][secu.asacposi][证券主推_持仓_资产账户持仓主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.61", 0);
        lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT,v_asac_comm_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT,v_asac_comm_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT,v_asac_comm_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT,v_asac_trade_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT,v_asac_trade_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT,v_asac_trade_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT,v_asac_strike_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT,v_asac_strike_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT,v_asac_strike_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
        lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
        lpPubMsg->SetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT,v_asac_put_impawn_qty);
        glpPubSub_Interface->PubTopics("secu.asacposi", lpPubMsg);

      }
      // else
      else
      {

        //调用过程[事务_交易证券_主推接口_获取资金持仓信息]
        //组织事务请求
        if(lpTSCall1Ans9)
        {
          lpTSCall1Ans9->FreeMsg();
          lpTSCall1Ans9=NULL;
        }
        lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.13", 0);
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
        lpTSCall1Req9->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req9->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req9->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req9->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
        if(!lpTSCall1Ans9)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.13]subcall timed out!");
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
        v_exgp_cash_id = lpTSCall1Ans9->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
        v_exgp_frozen_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
        v_exgp_unfroz_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
        v_exgp_comm_frozen_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
        v_exgp_comm_unfroz_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
        v_exgp_comm_capt_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
        v_exgp_comm_releas_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
        v_exgp_trade_frozen_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT);
        v_exgp_trade_unfroz_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT);
        v_exgp_trade_capt_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
        v_exgp_trade_releas_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
        v_exgp_strike_capt_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
        v_exgp_strike_releas_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
        v_exgp_cash_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
        v_exgp_posi_id = lpTSCall1Ans9->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
        v_exgp_frozen_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
        v_exgp_unfroz_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
        v_exgp_comm_frozen_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT);
        v_exgp_comm_unfroz_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT);
        v_exgp_comm_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT);
        v_exgp_comm_releas_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
        v_exgp_trade_frozen_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT);
        v_exgp_trade_unfroz_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT);
        v_exgp_trade_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT);
        v_exgp_trade_releas_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
        v_exgp_strike_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT);
        v_exgp_strike_releas_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
        v_exgp_strike_frozen_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT);
        v_exgp_strike_unfroz_qty = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT);
        v_exgp_realize_pandl = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
        v_exgp_cost_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
        v_exgp_intrst_cost_amt = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
        v_exgp_intrst_pandl = lpTSCall1Ans9->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
        v_exgp_posi_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
        v_asac_cash_id = lpTSCall1Ans9->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
        v_asac_frozen_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
        v_asac_unfroz_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
        v_asac_comm_frozen_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
        v_asac_comm_unfroz_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
        v_asac_comm_capt_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
        v_asac_comm_releas_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
        v_asac_trade_frozen_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT);
        v_asac_trade_unfroz_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT);
        v_asac_trade_capt_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
        v_asac_trade_releas_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
        v_asac_strike_capt_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
        v_asac_strike_releas_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
        v_asac_cash_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);
        v_asac_posi_id = lpTSCall1Ans9->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
        v_asac_frozen_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
        v_asac_unfroz_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
        v_asac_comm_frozen_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT);
        v_asac_comm_unfroz_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT);
        v_asac_comm_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT);
        v_asac_comm_releas_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
        v_asac_trade_frozen_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT);
        v_asac_trade_unfroz_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT);
        v_asac_trade_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT);
        v_asac_trade_releas_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
        v_asac_strike_capt_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT);
        v_asac_strike_releas_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
        v_asac_strike_frozen_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT);
        v_asac_strike_unfroz_qty = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT);
        v_asac_realize_pandl = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
        v_asac_cost_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
        v_asac_intrst_cost_amt = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
        v_asac_intrst_pandl = lpTSCall1Ans9->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
        v_asac_posi_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


        // [主动推送][secu.exgpcapital][证券主推_资金_交易组资金主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.50", 0);
        lpPubMsg->SetInt64(LDBIZ_EXGP_CASH_ID_INT64,v_exgp_cash_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT,v_exgp_comm_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT,v_exgp_comm_unfroz_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT,v_exgp_comm_capt_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT,v_exgp_comm_releas_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT,v_exgp_trade_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT,v_exgp_trade_unfroz_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT,v_exgp_trade_capt_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT,v_exgp_trade_releas_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT,v_exgp_strike_capt_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT,v_exgp_strike_releas_amt);
        lpPubMsg->SetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT,v_exgp_cash_update_times);
        glpPubSub_Interface->PubTopics("secu.exgpcapital", lpPubMsg);


        // [主动推送][secu.exgpposi][证券主推_持仓_交易组持仓主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.60", 0);
        lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT,v_exgp_comm_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT,v_exgp_comm_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT,v_exgp_comm_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT,v_exgp_trade_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT,v_exgp_trade_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT,v_exgp_trade_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT,v_exgp_strike_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT,v_exgp_strike_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT,v_exgp_strike_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
        lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
        lpPubMsg->SetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT,v_exgp_put_impawn_qty);
        glpPubSub_Interface->PubTopics("secu.exgpposi", lpPubMsg);


        // [主动推送][secu.asaccapital][证券主推_资金_资产账户资金主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.51", 0);
        lpPubMsg->SetInt64(LDBIZ_ASAC_CASH_ID_INT64,v_asac_cash_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT,v_asac_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT,v_asac_unfroz_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT,v_asac_comm_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT,v_asac_comm_unfroz_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT,v_asac_comm_capt_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT,v_asac_comm_releas_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT,v_asac_trade_frozen_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT,v_asac_trade_unfroz_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT,v_asac_trade_capt_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT,v_asac_trade_releas_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT,v_asac_strike_capt_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT,v_asac_strike_releas_amt);
        lpPubMsg->SetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT,v_asac_cash_update_times);
        glpPubSub_Interface->PubTopics("secu.asaccapital", lpPubMsg);


        // [主动推送][secu.asacposi][证券主推_持仓_资产账户持仓主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.61", 0);
        lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT,v_asac_comm_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT,v_asac_comm_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT,v_asac_comm_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT,v_asac_trade_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT,v_asac_trade_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT,v_asac_trade_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT,v_asac_strike_capt_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT,v_asac_strike_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT,v_asac_strike_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
        lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
        lpPubMsg->SetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT,v_asac_put_impawn_qty);
        glpPubSub_Interface->PubTopics("secu.asacposi", lpPubMsg);

      // end if;
      }

        //改单处理
        //调用过程[事务_交易证券_交易_更新获取改单信息]
        //组织事务请求
        if(lpTSCall1Ans10)
        {
          lpTSCall1Ans10->FreeMsg();
          lpTSCall1Ans10=NULL;
        }
        lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("tdsecuT.4.62", 0);
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
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.4.62]subcall timed out!");
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
        v_stock_code_no = lpTSCall1Ans10->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        strcpy(v_stock_code, lpTSCall1Ans10->GetString(LDBIZ_STOCK_CODE_STR));
        strcpy(v_crncy_type, lpTSCall1Ans10->GetString(LDBIZ_CRNCY_TYPE_STR));
        strcpy(v_exch_crncy_type, lpTSCall1Ans10->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        strcpy(v_order_oper_way, lpTSCall1Ans10->GetString(LDBIZ_ORDER_OPER_WAY_STR));
        v_busi_opor_no = lpTSCall1Ans10->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);


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

          // set @订单数量# = floor(@订单数量#/@最小单位#) * @最小单位#;
          v_order_qty = floor(v_order_qty/v_min_unit) * v_min_unit;

          // if @订单数量# > 0 then
          if (v_order_qty > 0)
          {
            //如果是买入，需计算费用，卖出需要获取可用数量
            //调用过程[事务_产品证券_交易接口_检查账户状态获取可用]
            //组织事务请求
            if(lpTSCall1Ans11)
            {
              lpTSCall1Ans11->FreeMsg();
              lpTSCall1Ans11=NULL;
            }
            lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("pdsecuT.6.1", 0);
            lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req11->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
            lpTSCall1Req11->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
            lpTSCall1Req11->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpTSCall1Req11->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req11->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
            lpTSCall1Req11->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
            lpTSCall1Req11->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
            lpTSCall1Req11->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
            lpTSCall1Req11->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
            lpTSCall1Req11->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
            lpTSCall1Req11->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
            lpTSCall1Req11->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
            glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
            if(!lpTSCall1Ans11)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.6.1]subcall timed out!");
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
            v_stock_acco_no = lpTSCall1Ans11->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
            strcpy(v_stock_acco, lpTSCall1Ans11->GetString(LDBIZ_STOCK_ACCO_STR));
            v_exgp_avail_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_AVAIL_AMT_FLOAT);
            v_asac_avail_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_AVAIL_AMT_FLOAT);
            v_asac_T_hk_buy_total_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_T_HK_BUY_TOTAL_AMT_FLOAT);
            v_asac_T_hk_sell_total_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_T_HK_SELL_TOTAL_AMT_FLOAT);
            v_asac_T1_hk_buy_total_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_T1_HK_BUY_TOTAL_AMT_FLOAT);
            v_asac_T1_hk_sell_total_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_T1_HK_SELL_TOTAL_AMT_FLOAT);
            v_exgp_T_hk_buy_total_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_T_HK_BUY_TOTAL_AMT_FLOAT);
            v_exgp_T_hk_sell_total_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_T_HK_SELL_TOTAL_AMT_FLOAT);
            v_exgp_T1_hk_buy_total_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_T1_HK_BUY_TOTAL_AMT_FLOAT);
            v_exgp_T1_hk_sell_total_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_T1_HK_SELL_TOTAL_AMT_FLOAT);
            v_exgp_avail_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT);
            v_exgp_target_code_avail_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TARGET_CODE_AVAIL_QTY_FLOAT);
            v_exgp_trade_code_avail_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_CODE_AVAIL_QTY_FLOAT);
            v_asac_avail_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT);
            v_asac_target_code_avail_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TARGET_CODE_AVAIL_QTY_FLOAT);
            v_asac_trade_code_avail_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_CODE_AVAIL_QTY_FLOAT);
            v_exgp_loan_sell_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_LOAN_SELL_AMT_FLOAT);
            v_asac_loan_sell_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_LOAN_SELL_AMT_FLOAT);
            v_exgp_debt_loan_sell_strike_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_DEBT_LOAN_SELL_STRIKE_QTY_FLOAT);
            v_exgp_debt_fina_buy_strike_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_DEBT_FINA_BUY_STRIKE_AMT_FLOAT);
            v_record_count = lpTSCall1Ans11->GetInt32(LDBIZ_RECORD_COUNT_INT);


            // if @订单操作方式# = 《订单操作方式-增强交易》 then
            if (strcmp(v_order_oper_way , "14")==0)
            {
                //调用过程[事务_交易证券_T0_获取机构级操作员费用设置标志]
                //组织事务请求
                if(lpTSCall1Ans12)
                {
                  lpTSCall1Ans12->FreeMsg();
                  lpTSCall1Ans12=NULL;
                }
                lpTSCall1Req12=glpFastMsgFactory->CreateFastMessage("tdsecuT.6.103", 0);
                lpTSCall1Req12->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req12->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req12->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req12->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req12->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req12->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req12->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req12->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req12->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
                glpTSSubcallSerives->SubCall(lpTSCall1Req12, &lpTSCall1Ans12, 5000);
                if(!lpTSCall1Ans12)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.6.103]subcall timed out!");
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
                v_T0_opor_fee_set_flag = lpTSCall1Ans12->GetInt32(LDBIZ_T0_OPOR_FEE_SET_FLAG_INT);

                //调用过程[事务_交易证券_T0_获取操作员阈值信息]
                //组织事务请求
                if(lpTSCall1Ans13)
                {
                  lpTSCall1Ans13->FreeMsg();
                  lpTSCall1Ans13=NULL;
                }
                lpTSCall1Req13=glpFastMsgFactory->CreateFastMessage("tdsecuT.6.98", 0);
                lpTSCall1Req13->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req13->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req13->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req13->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req13->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req13->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req13->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req13->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req13->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
                glpTSSubcallSerives->SubCall(lpTSCall1Req13, &lpTSCall1Ans13, 5000);
                if(!lpTSCall1Ans13)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.6.98]subcall timed out!");
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
                //获取输出参数值
                strcpy(v_error_code, lpTSCall1Ans13->GetString(LDBIZ_ERROR_CODE_STR));
                strcpy(v_error_info, lpTSCall1Ans13->GetString(LDBIZ_ERROR_INFO_STR));
                v_row_id = lpTSCall1Ans13->GetInt64(LDBIZ_ROW_ID_INT64);
                v_curr_amt = lpTSCall1Ans13->GetDouble(LDBIZ_CURR_AMT_FLOAT);
                v_frozen_amt = lpTSCall1Ans13->GetDouble(LDBIZ_FROZEN_AMT_FLOAT);
                v_opor_warn_tshold = lpTSCall1Ans13->GetDouble(LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
                v_opor_stop_tshold = lpTSCall1Ans13->GetDouble(LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
                v_order_limit_time = lpTSCall1Ans13->GetInt32(LDBIZ_ORDER_LIMIT_TIME_INT);
                v_per_secu_posi_ratio = lpTSCall1Ans13->GetDouble(LDBIZ_PER_SECU_POSI_RATIO_FLOAT);
                v_posi_limit_time = lpTSCall1Ans13->GetInt32(LDBIZ_POSI_LIMIT_TIME_INT);
                v_order_ctrl_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ORDER_CTRL_QTY_FLOAT);
                v_order_ctrl_amt = lpTSCall1Ans13->GetDouble(LDBIZ_ORDER_CTRL_AMT_FLOAT);
                v_stock_warn_ratio = lpTSCall1Ans13->GetDouble(LDBIZ_STOCK_WARN_RATIO_FLOAT);
                v_stock_stop_ratio = lpTSCall1Ans13->GetDouble(LDBIZ_STOCK_STOP_RATIO_FLOAT);
                v_stock_warn_amt = lpTSCall1Ans13->GetDouble(LDBIZ_STOCK_WARN_AMT_FLOAT);
                v_stock_stop_amt = lpTSCall1Ans13->GetDouble(LDBIZ_STOCK_STOP_AMT_FLOAT);
                v_trig_oper_type = lpTSCall1Ans13->GetInt32(LDBIZ_TRIG_OPER_TYPE_INT);
                v_open_close_permission = lpTSCall1Ans13->GetInt32(LDBIZ_OPEN_CLOSE_PERMISSION_INT);
                v_risk_oper = lpTSCall1Ans13->GetInt32(LDBIZ_RISK_OPER_INT);
                v_fee_calc_type = lpTSCall1Ans13->GetInt32(LDBIZ_FEE_CALC_TYPE_INT);
                v_permit_margin_trade = lpTSCall1Ans13->GetInt32(LDBIZ_PERMIT_MARGIN_TRADE_INT);
                v_buy_fee_ratio = lpTSCall1Ans13->GetDouble(LDBIZ_BUY_FEE_RATIO_FLOAT);
                v_sell_fee_ratio = lpTSCall1Ans13->GetDouble(LDBIZ_SELL_FEE_RATIO_FLOAT);
                v_buy_min_fee = lpTSCall1Ans13->GetDouble(LDBIZ_BUY_MIN_FEE_FLOAT);
                v_sell_min_fee = lpTSCall1Ans13->GetDouble(LDBIZ_SELL_MIN_FEE_FLOAT);
                strcpy(v_remark_info, lpTSCall1Ans13->GetString(LDBIZ_REMARK_INFO_STR));
                v_update_times = lpTSCall1Ans13->GetInt32(LDBIZ_UPDATE_TIMES_INT);

            // end if;
            }


            // if @订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-融券回购》 and @错误编码# = "0" then
            if (v_order_dir == 1 || v_order_dir == 4 && strcmp(v_error_code , "0")==0)
            {

                // if @订单操作方式# = 《订单操作方式-增强交易》 and @T0操作员费用设置标志#=《T0操作员费用设置标志-设置》 then
                if (strcmp(v_order_oper_way , "14")==0 && v_T0_opor_fee_set_flag==1)
                {

                    // if @费用计算方式#  = 《费用计算方式-操作员》 then
                    if (v_fee_calc_type  == 2)
                    {

                        // set @全部费用临时值#=0;
                        v_all_fee_for_tmp=0;
                        //调用过程[事务_交易证券_T0_操作员交易费用计算]
                        //组织事务请求
                        if(lpTSCall1Ans14)
                        {
                          lpTSCall1Ans14->FreeMsg();
                          lpTSCall1Ans14=NULL;
                        }
                        lpTSCall1Req14=glpFastMsgFactory->CreateFastMessage("tdsecuT.6.99", 0);
                        lpTSCall1Req14->SetInt32(LDTAG_PRIORITY, iPriority);
                        lpTSCall1Req14->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                        lpTSCall1Req14->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                        lpTSCall1Req14->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                        lpTSCall1Req14->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                        lpTSCall1Req14->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                        lpTSCall1Req14->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                        lpTSCall1Req14->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                        lpTSCall1Req14->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
                        lpTSCall1Req14->SetDouble(LDBIZ_BUY_MIN_FEE_FLOAT,v_buy_min_fee);
                        lpTSCall1Req14->SetDouble(LDBIZ_SELL_MIN_FEE_FLOAT,v_sell_min_fee);
                        lpTSCall1Req14->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
                        lpTSCall1Req14->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
                        lpTSCall1Req14->SetDouble(LDBIZ_BUY_FEE_RATIO_FLOAT,v_buy_fee_ratio);
                        lpTSCall1Req14->SetDouble(LDBIZ_SELL_FEE_RATIO_FLOAT,v_sell_fee_ratio);
                        glpTSSubcallSerives->SubCall(lpTSCall1Req14, &lpTSCall1Ans14, 5000);
                        if(!lpTSCall1Ans14)  //  超时错误
                        {
                            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.6.99]subcall timed out!");
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
                        v_all_fee = lpTSCall1Ans14->GetDouble(LDBIZ_ALL_FEE_FLOAT);


                        // set @订单冻结金额# =  @订单价格# * @订单数量# + @全部费用#;
                        v_order_frozen_amt =  v_order_price * v_order_qty + v_all_fee;

                        // set @全部费用临时值#=@全部费用#;
                        v_all_fee_for_tmp=v_all_fee;
                    //T0费用增加 明细。Modify by wjp 20181017
                        //调用过程[事务_公共_公共接口_计算证券订单费用]
                        //组织事务请求
                        if(lpTSCall1Ans15)
                        {
                          lpTSCall1Ans15->FreeMsg();
                          lpTSCall1Ans15=NULL;
                        }
                        lpTSCall1Req15=glpFastMsgFactory->CreateFastMessage("pubT.24.203", 0);
                        lpTSCall1Req15->SetInt32(LDTAG_PRIORITY, iPriority);
                        lpTSCall1Req15->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                        lpTSCall1Req15->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                        lpTSCall1Req15->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                        lpTSCall1Req15->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                        lpTSCall1Req15->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                        lpTSCall1Req15->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                        lpTSCall1Req15->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                        lpTSCall1Req15->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
                        lpTSCall1Req15->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                        lpTSCall1Req15->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                        lpTSCall1Req15->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                        lpTSCall1Req15->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
                        lpTSCall1Req15->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
                        lpTSCall1Req15->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
                        lpTSCall1Req15->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
                        lpTSCall1Req15->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
                        lpTSCall1Req15->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
                        lpTSCall1Req15->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
                        lpTSCall1Req15->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
                        glpTSSubcallSerives->SubCall(lpTSCall1Req15, &lpTSCall1Ans15, 5000);
                        if(!lpTSCall1Ans15)  //  超时错误
                        {
                            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.203]subcall timed out!");
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
                        //获取输出参数值
                        strcpy(v_error_code, lpTSCall1Ans15->GetString(LDBIZ_ERROR_CODE_STR));
                        strcpy(v_error_info, lpTSCall1Ans15->GetString(LDBIZ_ERROR_INFO_STR));
                        v_trade_commis = lpTSCall1Ans15->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
                        v_all_fee = lpTSCall1Ans15->GetDouble(LDBIZ_ALL_FEE_FLOAT);
                        v_stamp_tax = lpTSCall1Ans15->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
                        v_trans_fee = lpTSCall1Ans15->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
                        v_brkage_fee = lpTSCall1Ans15->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
                        v_SEC_charges = lpTSCall1Ans15->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
                        v_other_fee = lpTSCall1Ans15->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
                        v_other_commis = lpTSCall1Ans15->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
                        v_trade_tax = lpTSCall1Ans15->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
                        v_trade_cost_fee = lpTSCall1Ans15->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
                        v_trade_system_use_fee = lpTSCall1Ans15->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
                        v_stock_settle_fee = lpTSCall1Ans15->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);
                        v_order_frozen_amt = lpTSCall1Ans15->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);


                        // set @全部费用#=@全部费用#+@全部费用临时值#-@交易佣金#;
                        v_all_fee=v_all_fee+v_all_fee_for_tmp-v_trade_commis;

                        // set @交易佣金#=@全部费用临时值#;
                        v_trade_commis=v_all_fee_for_tmp;
                    }
                    // else
                    else
                    {

                         //调用过程[事务_公共_公共接口_计算证券订单费用]
                         //组织事务请求
                         if(lpTSCall1Ans16)
                         {
                           lpTSCall1Ans16->FreeMsg();
                           lpTSCall1Ans16=NULL;
                         }
                         lpTSCall1Req16=glpFastMsgFactory->CreateFastMessage("pubT.24.203", 0);
                         lpTSCall1Req16->SetInt32(LDTAG_PRIORITY, iPriority);
                         lpTSCall1Req16->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                         lpTSCall1Req16->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                         lpTSCall1Req16->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                         lpTSCall1Req16->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                         lpTSCall1Req16->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                         lpTSCall1Req16->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                         lpTSCall1Req16->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                         lpTSCall1Req16->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
                         lpTSCall1Req16->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                         lpTSCall1Req16->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                         lpTSCall1Req16->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                         lpTSCall1Req16->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
                         lpTSCall1Req16->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
                         lpTSCall1Req16->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
                         lpTSCall1Req16->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
                         lpTSCall1Req16->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
                         lpTSCall1Req16->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
                         lpTSCall1Req16->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
                         lpTSCall1Req16->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
                         glpTSSubcallSerives->SubCall(lpTSCall1Req16, &lpTSCall1Ans16, 5000);
                         if(!lpTSCall1Ans16)  //  超时错误
                         {
                             lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                             lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.203]subcall timed out!");
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
                         v_trade_commis = lpTSCall1Ans16->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
                         v_all_fee = lpTSCall1Ans16->GetDouble(LDBIZ_ALL_FEE_FLOAT);
                         v_stamp_tax = lpTSCall1Ans16->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
                         v_trans_fee = lpTSCall1Ans16->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
                         v_brkage_fee = lpTSCall1Ans16->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
                         v_SEC_charges = lpTSCall1Ans16->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
                         v_other_fee = lpTSCall1Ans16->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
                         v_other_commis = lpTSCall1Ans16->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
                         v_trade_tax = lpTSCall1Ans16->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
                         v_trade_cost_fee = lpTSCall1Ans16->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
                         v_trade_system_use_fee = lpTSCall1Ans16->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
                         v_stock_settle_fee = lpTSCall1Ans16->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);
                         v_order_frozen_amt = lpTSCall1Ans16->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);

                    // end if;
                    }

                }
                // else
                else
                {

                    //调用过程[事务_公共_公共接口_计算证券订单费用]
                    //组织事务请求
                    if(lpTSCall1Ans17)
                    {
                      lpTSCall1Ans17->FreeMsg();
                      lpTSCall1Ans17=NULL;
                    }
                    lpTSCall1Req17=glpFastMsgFactory->CreateFastMessage("pubT.24.203", 0);
                    lpTSCall1Req17->SetInt32(LDTAG_PRIORITY, iPriority);
                    lpTSCall1Req17->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                    lpTSCall1Req17->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                    lpTSCall1Req17->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                    lpTSCall1Req17->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                    lpTSCall1Req17->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                    lpTSCall1Req17->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                    lpTSCall1Req17->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                    lpTSCall1Req17->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
                    lpTSCall1Req17->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                    lpTSCall1Req17->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                    lpTSCall1Req17->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                    lpTSCall1Req17->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
                    lpTSCall1Req17->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
                    lpTSCall1Req17->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
                    lpTSCall1Req17->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
                    lpTSCall1Req17->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
                    lpTSCall1Req17->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
                    lpTSCall1Req17->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
                    lpTSCall1Req17->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
                    glpTSSubcallSerives->SubCall(lpTSCall1Req17, &lpTSCall1Ans17, 5000);
                    if(!lpTSCall1Ans17)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.203]subcall timed out!");
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
                    v_trade_commis = lpTSCall1Ans17->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
                    v_all_fee = lpTSCall1Ans17->GetDouble(LDBIZ_ALL_FEE_FLOAT);
                    v_stamp_tax = lpTSCall1Ans17->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
                    v_trans_fee = lpTSCall1Ans17->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
                    v_brkage_fee = lpTSCall1Ans17->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
                    v_SEC_charges = lpTSCall1Ans17->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
                    v_other_fee = lpTSCall1Ans17->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
                    v_other_commis = lpTSCall1Ans17->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
                    v_trade_tax = lpTSCall1Ans17->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
                    v_trade_cost_fee = lpTSCall1Ans17->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
                    v_trade_system_use_fee = lpTSCall1Ans17->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
                    v_stock_settle_fee = lpTSCall1Ans17->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);
                    v_order_frozen_amt = lpTSCall1Ans17->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);

                // end if;
                }

            // end if;
            }


            // if @错误编码# = "0" then
            if (strcmp(v_error_code , "0")==0)
            {

                // set @触发阶段类型# = 《触发阶段类型-交易端》;
                v_trig_stage_type = 2;
                //调用过程[事务_风控证券_接口_检查客户风险]
                //组织事务请求
                if(lpTSCall1Ans18)
                {
                  lpTSCall1Ans18->FreeMsg();
                  lpTSCall1Ans18=NULL;
                }
                lpTSCall1Req18=glpFastMsgFactory->CreateFastMessage("rksecuT.5.9", 0);
                lpTSCall1Req18->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req18->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req18->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req18->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req18->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req18->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req18->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req18->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req18->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpTSCall1Req18->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpTSCall1Req18->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                lpTSCall1Req18->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpTSCall1Req18->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpTSCall1Req18->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
                lpTSCall1Req18->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                lpTSCall1Req18->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
                lpTSCall1Req18->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
                lpTSCall1Req18->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
                lpTSCall1Req18->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
                lpTSCall1Req18->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
                lpTSCall1Req18->SetInt32(LDBIZ_TRIG_STAGE_TYPE_INT,v_trig_stage_type);
                glpTSSubcallSerives->SubCall(lpTSCall1Req18, &lpTSCall1Ans18, 5000);
                if(!lpTSCall1Ans18)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.5.9]subcall timed out!");
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
                //获取输出参数值
                strcpy(v_error_code, lpTSCall1Ans18->GetString(LDBIZ_ERROR_CODE_STR));
                strcpy(v_error_info, lpTSCall1Ans18->GetString(LDBIZ_ERROR_INFO_STR));
                v_compli_trig_id = lpTSCall1Ans18->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);

                //set @合规触警序号// = 0;
            // end if;
            }


            // if @错误编码# = "0" then
            if (strcmp(v_error_code , "0")==0)
            {
                //调用过程[事务_交易证券_交易_新增订单]
                //组织事务请求
                if(lpTSCall1Ans19)
                {
                  lpTSCall1Ans19->FreeMsg();
                  lpTSCall1Ans19=NULL;
                }
                lpTSCall1Req19=glpFastMsgFactory->CreateFastMessage("tdsecuT.4.11", 0);
                lpTSCall1Req19->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req19->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req19->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req19->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req19->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req19->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req19->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req19->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req19->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
                lpTSCall1Req19->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                lpTSCall1Req19->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpTSCall1Req19->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpTSCall1Req19->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                lpTSCall1Req19->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpTSCall1Req19->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
                lpTSCall1Req19->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
                lpTSCall1Req19->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
                lpTSCall1Req19->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
                lpTSCall1Req19->SetDouble(LDBIZ_BUY_REF_RATE_FLOAT,v_buy_ref_rate);
                lpTSCall1Req19->SetDouble(LDBIZ_SELL_REF_RATE_FLOAT,v_sell_ref_rate);
                lpTSCall1Req19->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpTSCall1Req19->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                lpTSCall1Req19->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
                lpTSCall1Req19->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                lpTSCall1Req19->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
                lpTSCall1Req19->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
                lpTSCall1Req19->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
                lpTSCall1Req19->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
                lpTSCall1Req19->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
                lpTSCall1Req19->SetString(LDBIZ_BUSI_LIMIT_STR_STR,v_busi_limit_str);
                lpTSCall1Req19->SetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR,v_exgp_busi_config_str);
                lpTSCall1Req19->SetDouble(LDBIZ_EXGP_AVAIL_AMT_FLOAT,v_exgp_avail_amt);
                lpTSCall1Req19->SetDouble(LDBIZ_EXGP_T_HK_BUY_TOTAL_AMT_FLOAT,v_exgp_T_hk_buy_total_amt);
                lpTSCall1Req19->SetDouble(LDBIZ_EXGP_T_HK_SELL_TOTAL_AMT_FLOAT,v_exgp_T_hk_sell_total_amt);
                lpTSCall1Req19->SetDouble(LDBIZ_EXGP_T1_HK_BUY_TOTAL_AMT_FLOAT,v_exgp_T1_hk_buy_total_amt);
                lpTSCall1Req19->SetDouble(LDBIZ_EXGP_T1_HK_SELL_TOTAL_AMT_FLOAT,v_exgp_T1_hk_sell_total_amt);
                lpTSCall1Req19->SetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR,v_asac_busi_config_str);
                lpTSCall1Req19->SetDouble(LDBIZ_ASAC_AVAIL_AMT_FLOAT,v_asac_avail_amt);
                lpTSCall1Req19->SetDouble(LDBIZ_ASAC_T_HK_BUY_TOTAL_AMT_FLOAT,v_asac_T_hk_buy_total_amt);
                lpTSCall1Req19->SetDouble(LDBIZ_ASAC_T_HK_SELL_TOTAL_AMT_FLOAT,v_asac_T_hk_sell_total_amt);
                lpTSCall1Req19->SetDouble(LDBIZ_ASAC_T1_HK_BUY_TOTAL_AMT_FLOAT,v_asac_T1_hk_buy_total_amt);
                lpTSCall1Req19->SetDouble(LDBIZ_ASAC_T1_HK_SELL_TOTAL_AMT_FLOAT,v_asac_T1_hk_sell_total_amt);
                lpTSCall1Req19->SetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT,v_exgp_avail_qty);
                lpTSCall1Req19->SetDouble(LDBIZ_EXGP_TARGET_CODE_AVAIL_QTY_FLOAT,v_exgp_target_code_avail_qty);
                lpTSCall1Req19->SetDouble(LDBIZ_EXGP_TRADE_CODE_AVAIL_QTY_FLOAT,v_exgp_trade_code_avail_qty);
                lpTSCall1Req19->SetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT,v_asac_avail_qty);
                lpTSCall1Req19->SetDouble(LDBIZ_ASAC_TARGET_CODE_AVAIL_QTY_FLOAT,v_asac_target_code_avail_qty);
                lpTSCall1Req19->SetDouble(LDBIZ_ASAC_TRADE_CODE_AVAIL_QTY_FLOAT,v_asac_trade_code_avail_qty);
                lpTSCall1Req19->SetDouble(LDBIZ_MARKET_PRICE_RATIO_FLOAT,v_market_price_ratio);
                lpTSCall1Req19->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
                lpTSCall1Req19->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
                lpTSCall1Req19->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
                lpTSCall1Req19->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
                lpTSCall1Req19->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
                lpTSCall1Req19->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
                lpTSCall1Req19->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
                lpTSCall1Req19->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
                lpTSCall1Req19->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
                lpTSCall1Req19->SetInt32(LDBIZ_INTRST_DAYS_INT,v_intrst_days);
                lpTSCall1Req19->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
                lpTSCall1Req19->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
                lpTSCall1Req19->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
                lpTSCall1Req19->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
                lpTSCall1Req19->SetInt32(LDBIZ_MIN_UNIT_INT,v_min_unit);
                lpTSCall1Req19->SetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT,v_up_limit_price);
                lpTSCall1Req19->SetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT,v_down_limit_price);
                lpTSCall1Req19->SetDouble(LDBIZ_LAST_PRICE_FLOAT,v_last_price);
                lpTSCall1Req19->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
                lpTSCall1Req19->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
                lpTSCall1Req19->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
                lpTSCall1Req19->SetInt32(LDBIZ_COST_CALC_TYPE_INT,v_cost_calc_type);
                lpTSCall1Req19->SetInt64(LDBIZ_COMPLI_TRIG_ID_INT64,v_compli_trig_id);
                lpTSCall1Req19->SetInt32(LDBIZ_ORDER_LIMIT_TIME_INT,v_order_limit_time);
                lpTSCall1Req19->SetDouble(LDBIZ_ORDER_CTRL_QTY_FLOAT,v_order_ctrl_qty);
                lpTSCall1Req19->SetDouble(LDBIZ_ORDER_CTRL_AMT_FLOAT,v_order_ctrl_amt);
                lpTSCall1Req19->SetInt32(LDBIZ_OPEN_CLOSE_PERMISSION_INT,v_open_close_permission);
                lpTSCall1Req19->SetDouble(LDBIZ_PER_SECU_POSI_RATIO_FLOAT,v_per_secu_posi_ratio);
                lpTSCall1Req19->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
                lpTSCall1Req19->SetInt64(LDBIZ_COMBO_POSI_ID_INT64,v_combo_posi_id);
                lpTSCall1Req19->SetInt32(LDBIZ_SUBSCRIPTION_TRADE_MARK_INT,v_subscription_trade_mark);
                lpTSCall1Req19->SetInt32(LDBIZ_PURCHASE_TRADE_MARK_INT,v_purchase_trade_mark);
                lpTSCall1Req19->SetInt32(LDBIZ_REDE_TRADE_MARK_INT,v_rede_trade_mark);
                lpTSCall1Req19->SetDouble(LDBIZ_FIRST_MINIMUM_AMT_FLOAT,v_first_minimum_amt);
                lpTSCall1Req19->SetDouble(LDBIZ_MINIMUM_PURCHASE_AMT_FLOAT,v_minimum_purchase_amt);
                lpTSCall1Req19->SetDouble(LDBIZ_MINIMUM_SUBSCRIPTION_AMT_FLOAT,v_minimum_subscription_amt);
                lpTSCall1Req19->SetDouble(LDBIZ_MINIMUM_REDE_SHARE_FLOAT,v_minimum_rede_share);
                lpTSCall1Req19->SetDouble(LDBIZ_MINIMUM_HOLDING_SHARE_FLOAT,v_minimum_holding_share);
                lpTSCall1Req19->SetInt32(LDBIZ_RECORD_COUNT_INT,v_record_count);
                lpTSCall1Req19->SetString(LDBIZ_TARGET_STOCK_CODE_STR,v_target_stock_code);
                lpTSCall1Req19->SetInt32(LDBIZ_TARGET_STOCK_CODE_NO_INT,v_target_stock_code_no);
                lpTSCall1Req19->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
                lpTSCall1Req19->SetInt32(LDBIZ_ASSET_ACCO_TYPE_INT,v_asset_acco_type);
                glpTSSubcallSerives->SubCall(lpTSCall1Req19, &lpTSCall1Ans19, 5000);
                if(!lpTSCall1Ans19)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.4.11]subcall timed out!");
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
                //获取输出参数值
                strcpy(v_error_code, lpTSCall1Ans19->GetString(LDBIZ_ERROR_CODE_STR));
                strcpy(v_error_info, lpTSCall1Ans19->GetString(LDBIZ_ERROR_INFO_STR));
                v_order_id = lpTSCall1Ans19->GetInt64(LDBIZ_ORDER_ID_INT64);
                strcpy(v_order_status, lpTSCall1Ans19->GetString(LDBIZ_ORDER_STATUS_STR));
                v_order_date = lpTSCall1Ans19->GetInt32(LDBIZ_ORDER_DATE_INT);
                v_order_frozen_amt = lpTSCall1Ans19->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
                v_order_frozen_qty = lpTSCall1Ans19->GetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT);
                v_comm_batch_no = lpTSCall1Ans19->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
                v_order_time = lpTSCall1Ans19->GetInt32(LDBIZ_ORDER_TIME_INT);
                v_comm_date = lpTSCall1Ans19->GetInt32(LDBIZ_COMM_DATE_INT);
                v_comm_executor = lpTSCall1Ans19->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
                v_report_date = lpTSCall1Ans19->GetInt32(LDBIZ_REPORT_DATE_INT);
                v_report_time = lpTSCall1Ans19->GetInt32(LDBIZ_REPORT_TIME_INT);
                strcpy(v_report_no, lpTSCall1Ans19->GetString(LDBIZ_REPORT_NO_STR));
                v_update_times = lpTSCall1Ans19->GetInt32(LDBIZ_UPDATE_TIMES_INT);

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

              // set @策略序号# = 0;
              v_strategy_id = 0;

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

              // set @登记机构# = "";
              strcpy(v_registration_agency,"");
              //set @撤单状态// = "0";
              //主动推送

              // [主动推送][secu.modifyorder][证券主推_订单_改单主推消息]
              lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.908", 0);
              lpPubMsg->SetInt64(LDBIZ_ORI_ORDER_ID_INT64,v_ori_order_id);
              lpPubMsg->SetInt64(LDBIZ_NEW_ORDER_ID_INT64,v_new_order_id);
              glpPubSub_Interface->PubTopics("secu.modifyorder", lpPubMsg);

              //调用过程[事务_交易证券_交易_根据交易时间控制报盘主推]
              //组织事务请求
              if(lpTSCall1Ans20)
              {
                lpTSCall1Ans20->FreeMsg();
                lpTSCall1Ans20=NULL;
              }
              lpTSCall1Req20=glpFastMsgFactory->CreateFastMessage("tdsecuT.4.124", 0);
              lpTSCall1Req20->SetInt32(LDTAG_PRIORITY, iPriority);
              lpTSCall1Req20->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
              lpTSCall1Req20->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
              lpTSCall1Req20->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
              lpTSCall1Req20->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
              lpTSCall1Req20->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
              lpTSCall1Req20->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
              lpTSCall1Req20->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
              lpTSCall1Req20->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
              lpTSCall1Req20->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
              glpTSSubcallSerives->SubCall(lpTSCall1Req20, &lpTSCall1Ans20, 5000);
              if(!lpTSCall1Ans20)  //  超时错误
              {
                  lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                  lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.4.124]subcall timed out!");
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
              v_trade_time_flag = lpTSCall1Ans20->GetInt32(LDBIZ_TRADE_TIME_FLAG_INT);


              // if @交易时间标志# =1 then
              if (v_trade_time_flag ==1)
              {

                 // [主动推送][secu.ztrptorder][证券主推_报盘_中泰订单主推报盘消息]
                 lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.926", 0);
                 lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
                 lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                 lpPubMsg->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                 lpPubMsg->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                 lpPubMsg->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                 lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                 lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                 lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                 lpPubMsg->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
                 lpPubMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
                 lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
                 lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
                 lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
                 lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
                 lpPubMsg->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
                 lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
                 lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
                 lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
                 lpPubMsg->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
                 lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
                 lpPubMsg->SetString(LDBIZ_TRADE_ACCO_STR,v_trade_acco);
                 lpPubMsg->SetString(LDBIZ_REGISTRATION_AGENCY_STR,v_registration_agency);
                 lpPubMsg->SetString(LDBIZ_LONG_TOKEN_STR,v_long_token);
                 lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
                 glpPubSub_Interface->PubTopics("secu.ztrptorder", lpPubMsg);

              // end if;
              }


              // [主动推送][secu.order][证券主推_订单_订单主推消息]
              lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.20", 0);
              lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
              lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
              lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
              lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
              lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
              lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
              lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
              lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
              lpPubMsg->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
              lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
              lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
              lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
              lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
              lpPubMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
              lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
              lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
              lpPubMsg->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
              lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
              lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
              lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
              lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
              lpPubMsg->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
              lpPubMsg->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
              lpPubMsg->SetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT,v_order_frozen_amt);
              lpPubMsg->SetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT,v_order_frozen_qty);
              lpPubMsg->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
              lpPubMsg->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
              lpPubMsg->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
              lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
              lpPubMsg->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
              lpPubMsg->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
              lpPubMsg->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
              lpPubMsg->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
              lpPubMsg->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
              lpPubMsg->SetString(LDBIZ_RSP_INFO_STR,v_rsp_info);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
              lpPubMsg->SetDouble(LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT,v_strike_bond_accr_intrst);
              lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
              lpPubMsg->SetDouble(LDBIZ_CURR_STRIKE_QTY_FLOAT,v_curr_strike_qty);
              lpPubMsg->SetDouble(LDBIZ_CURR_STRIKE_AMT_FLOAT,v_curr_strike_amt);
              lpPubMsg->SetDouble(LDBIZ_CURR_STRIKE_PRICE_FLOAT,v_curr_strike_price);
              lpPubMsg->SetInt64(LDBIZ_STRIKE_ID_INT64,v_strike_id);
              lpPubMsg->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
              lpPubMsg->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
              lpPubMsg->SetInt64(LDBIZ_COMBO_POSI_ID_INT64,v_combo_posi_id);
              lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_TYPE_INT,v_asset_acco_type);
              lpPubMsg->SetString(LDBIZ_CONTRA_NO_STR,v_contra_no);
              lpPubMsg->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
              lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
              glpPubSub_Interface->PubTopics("secu.order", lpPubMsg);


              // if  @订单批号# > 0 then
              if ( v_order_batch_no > 0)
              {

                  // set @成交序号# = 0;
                  v_strike_id = 0;
                  //调用过程[事务_交易证券_主推接口_获取汇总订单成交信息]
                  //组织事务请求
                  if(lpTSCall1Ans21)
                  {
                    lpTSCall1Ans21->FreeMsg();
                    lpTSCall1Ans21=NULL;
                  }
                  lpTSCall1Req21=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.21", 0);
                  lpTSCall1Req21->SetInt32(LDTAG_PRIORITY, iPriority);
                  lpTSCall1Req21->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                  lpTSCall1Req21->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                  lpTSCall1Req21->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                  lpTSCall1Req21->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                  lpTSCall1Req21->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                  lpTSCall1Req21->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                  lpTSCall1Req21->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                  lpTSCall1Req21->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                  lpTSCall1Req21->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
                  lpTSCall1Req21->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
                  lpTSCall1Req21->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
                  lpTSCall1Req21->SetInt64(LDBIZ_STRIKE_ID_INT64,v_strike_id);
                  glpTSSubcallSerives->SubCall(lpTSCall1Req21, &lpTSCall1Ans21, 5000);
                  if(!lpTSCall1Ans21)  //  超时错误
                  {
                      lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                      lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.21]subcall timed out!");
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
                  v_sum_order_row_id = lpTSCall1Ans21->GetInt64(LDBIZ_SUM_ORDER_ROW_ID_INT64);
                  v_sum_order_opor_no = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_ORDER_OPOR_NO_INT);
                  v_sum_order_co_no = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_ORDER_CO_NO_INT);
                  v_sum_order_pd_no = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_ORDER_PD_NO_INT);
                  v_sum_order_exch_group_no = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_ORDER_EXCH_GROUP_NO_INT);
                  v_sum_order_asset_acco_no = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_ORDER_ASSET_ACCO_NO_INT);
                  v_sum_order_pass_no = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_ORDER_PASS_NO_INT);
                  strcpy(v_sum_order_exch_crncy_type, lpTSCall1Ans21->GetString(LDBIZ_SUM_ORDER_EXCH_CRNCY_TYPE_STR));
                  v_sum_order_stock_code_no = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_ORDER_STOCK_CODE_NO_INT);
                  v_sum_order_trade_code_no = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_ORDER_TRADE_CODE_NO_INT);
                  v_sum_order_target_code_no = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_ORDER_TARGET_CODE_NO_INT);
                  v_sum_order_external_no = lpTSCall1Ans21->GetInt64(LDBIZ_SUM_ORDER_EXTERNAL_NO_INT64);
                  v_sum_order_date = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_ORDER_DATE_INT);
                  v_sum_order_batch_no = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_ORDER_BATCH_NO_INT);
                  v_sum_order_dir = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_ORDER_DIR_INT);
                  v_sum_order_price_type = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_ORDER_PRICE_TYPE_INT);
                  v_sum_order_price = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_ORDER_PRICE_FLOAT);
                  v_sum_order_qty = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_ORDER_QTY_FLOAT);
                  strcpy(v_order_sum_status, lpTSCall1Ans21->GetString(LDBIZ_ORDER_SUM_STATUS_STR));
                  v_sum_order_wtdraw_qty = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_ORDER_WTDRAW_QTY_FLOAT);
                  v_sum_order_waste_qty = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_ORDER_WASTE_QTY_FLOAT);
                  v_sum_order_strike_amt = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_ORDER_STRIKE_AMT_FLOAT);
                  v_sum_order_strike_qty = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_ORDER_STRIKE_QTY_FLOAT);
                  v_sum_order_strike_aver_price = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_ORDER_STRIKE_AVER_PRICE_FLOAT);
                  v_sum_order_net_price_flag = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_ORDER_NET_PRICE_FLAG_INT);
                  v_sum_order_bond_accr_intrst = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_ORDER_BOND_ACCR_INTRST_FLOAT);
                  v_sum_order_bond_rate_type = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_ORDER_BOND_RATE_TYPE_INT);
                  v_sum_order_par_value = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_ORDER_PAR_VALUE_FLOAT);
                  v_sum_order_impawn_ratio = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_ORDER_IMPAWN_RATIO_FLOAT);
                  strcpy(v_sum_order_oper_way, lpTSCall1Ans21->GetString(LDBIZ_SUM_ORDER_OPER_WAY_STR));
                  v_sum_order_update_times = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_ORDER_UPDATE_TIMES_INT);
                  v_sum_strike_row_id = lpTSCall1Ans21->GetInt64(LDBIZ_SUM_STRIKE_ROW_ID_INT64);
                  v_sum_strike_opor_no = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_STRIKE_OPOR_NO_INT);
                  v_sum_strike_co_no = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_STRIKE_CO_NO_INT);
                  v_sum_strike_pd_no = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_STRIKE_PD_NO_INT);
                  v_sum_strike_exch_group_no = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_STRIKE_EXCH_GROUP_NO_INT);
                  v_sum_strike_asset_acco_no = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_STRIKE_ASSET_ACCO_NO_INT);
                  v_sum_strike_pass_no = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_STRIKE_PASS_NO_INT);
                  strcpy(v_sum_strike_out_acco, lpTSCall1Ans21->GetString(LDBIZ_SUM_STRIKE_OUT_ACCO_STR));
                  v_sum_strike_stock_acco_no = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_STRIKE_STOCK_ACCO_NO_INT);
                  v_sum_strike_stock_code_no = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_STRIKE_STOCK_CODE_NO_INT);
                  v_sum_strike_comm_id = lpTSCall1Ans21->GetInt64(LDBIZ_SUM_STRIKE_COMM_ID_INT64);
                  v_sum_strike_report_date = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_STRIKE_REPORT_DATE_INT);
                  strcpy(v_sum_strike_report_no, lpTSCall1Ans21->GetString(LDBIZ_SUM_STRIKE_REPORT_NO_STR));
                  v_sum_strike_order_date = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_STRIKE_ORDER_DATE_INT);
                  v_sum_strike_order_id = lpTSCall1Ans21->GetInt64(LDBIZ_SUM_STRIKE_ORDER_ID_INT64);
                  v_sum_strike_order_dir = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_STRIKE_ORDER_DIR_INT);
                  v_sum_strike_order_price = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_STRIKE_ORDER_PRICE_FLOAT);
                  v_sum_strike_order_qty = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_STRIKE_ORDER_QTY_FLOAT);
                  v_sum_strike_strike_qty = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_STRIKE_STRIKE_QTY_FLOAT);
                  v_sum_strike_strike_amt = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_STRIKE_STRIKE_AMT_FLOAT);
                  v_sum_strike_all_fee = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_STRIKE_ALL_FEE_FLOAT);
                  v_sum_strike_stamp_tax = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_STRIKE_STAMP_TAX_FLOAT);
                  v_sum_strike_trans_fee = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_STRIKE_TRANS_FEE_FLOAT);
                  v_sum_strike_brkage_fee = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_STRIKE_BRKAGE_FEE_FLOAT);
                  v_sum_strike_SEC_charges = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_STRIKE_SEC_CHARGES_FLOAT);
                  v_sum_strike_other_fee = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_STRIKE_OTHER_FEE_FLOAT);
                  v_sum_strike_trade_commis = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_STRIKE_TRADE_COMMIS_FLOAT);
                  v_sum_strike_other_commis = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_STRIKE_OTHER_COMMIS_FLOAT);
                  v_sum_trade_tax = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_TRADE_TAX_FLOAT);
                  v_sum_trade_cost_fee = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_TRADE_COST_FEE_FLOAT);
                  v_sum_trade_system_use_fee = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_TRADE_SYSTEM_USE_FEE_FLOAT);
                  v_sum_stock_settle_fee = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_STOCK_SETTLE_FEE_FLOAT);
                  v_sum_strike_net_price_flag = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_STRIKE_NET_PRICE_FLAG_INT);
                  v_sum_strike_bond_accr_intrst = lpTSCall1Ans21->GetDouble(LDBIZ_SUM_STRIKE_BOND_ACCR_INTRST_FLOAT);
                  v_sum_strike_bond_rate_type = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_STRIKE_BOND_RATE_TYPE_INT);
                  strcpy(v_sum_strike_order_oper_way, lpTSCall1Ans21->GetString(LDBIZ_SUM_STRIKE_ORDER_OPER_WAY_STR));
                  v_sum_strike_exter_comm_flag = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_STRIKE_EXTER_COMM_FLAG_INT);
                  v_sum_strike_update_times = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_STRIKE_UPDATE_TIMES_INT);
                  v_sum_strike_order_batch_no = lpTSCall1Ans21->GetInt32(LDBIZ_SUM_STRIKE_ORDER_BATCH_NO_INT);
                  v_sum_external_no = lpTSCall1Ans21->GetInt64(LDBIZ_SUM_EXTERNAL_NO_INT64);


                  // [主动推送][secu.ordertotal][证券主推_订单_订单汇总主推消息]
                  lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.21", 0);
                  lpPubMsg->SetInt64(LDBIZ_SUM_ORDER_ROW_ID_INT64,v_sum_order_row_id);
                  lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_OPOR_NO_INT,v_sum_order_opor_no);
                  lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_CO_NO_INT,v_sum_order_co_no);
                  lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_PD_NO_INT,v_sum_order_pd_no);
                  lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_EXCH_GROUP_NO_INT,v_sum_order_exch_group_no);
                  lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_ASSET_ACCO_NO_INT,v_sum_order_asset_acco_no);
                  lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_PASS_NO_INT,v_sum_order_pass_no);
                  lpPubMsg->SetString(LDBIZ_SUM_ORDER_EXCH_CRNCY_TYPE_STR,v_sum_order_exch_crncy_type);
                  lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_STOCK_CODE_NO_INT,v_sum_order_stock_code_no);
                  lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_TRADE_CODE_NO_INT,v_sum_order_trade_code_no);
                  lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_TARGET_CODE_NO_INT,v_sum_order_target_code_no);
                  lpPubMsg->SetInt64(LDBIZ_SUM_ORDER_EXTERNAL_NO_INT64,v_sum_order_external_no);
                  lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_DATE_INT,v_sum_order_date);
                  lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_BATCH_NO_INT,v_sum_order_batch_no);
                  lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_DIR_INT,v_sum_order_dir);
                  lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_PRICE_TYPE_INT,v_sum_order_price_type);
                  lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_PRICE_FLOAT,v_sum_order_price);
                  lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_QTY_FLOAT,v_sum_order_qty);
                  lpPubMsg->SetString(LDBIZ_ORDER_SUM_STATUS_STR,v_order_sum_status);
                  lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_WTDRAW_QTY_FLOAT,v_sum_order_wtdraw_qty);
                  lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_WASTE_QTY_FLOAT,v_sum_order_waste_qty);
                  lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_STRIKE_AMT_FLOAT,v_sum_order_strike_amt);
                  lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_STRIKE_QTY_FLOAT,v_sum_order_strike_qty);
                  lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_STRIKE_AVER_PRICE_FLOAT,v_sum_order_strike_aver_price);
                  lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_NET_PRICE_FLAG_INT,v_sum_order_net_price_flag);
                  lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_BOND_ACCR_INTRST_FLOAT,v_sum_order_bond_accr_intrst);
                  lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_BOND_RATE_TYPE_INT,v_sum_order_bond_rate_type);
                  lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_PAR_VALUE_FLOAT,v_sum_order_par_value);
                  lpPubMsg->SetDouble(LDBIZ_SUM_ORDER_IMPAWN_RATIO_FLOAT,v_sum_order_impawn_ratio);
                  lpPubMsg->SetString(LDBIZ_SUM_ORDER_OPER_WAY_STR,v_sum_order_oper_way);
                  lpPubMsg->SetInt32(LDBIZ_SUM_ORDER_UPDATE_TIMES_INT,v_sum_order_update_times);
                  glpPubSub_Interface->PubTopics("secu.ordertotal", lpPubMsg);

              // end if;
              }


              // if @指令序号# > 0 then
              if (v_comm_id > 0)
              {
                  //调用过程[事务_交易证券_主推接口_获取指令混合信息]
                  //组织事务请求
                  if(lpTSCall1Ans22)
                  {
                    lpTSCall1Ans22->FreeMsg();
                    lpTSCall1Ans22=NULL;
                  }
                  lpTSCall1Req22=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.3", 0);
                  lpTSCall1Req22->SetInt32(LDTAG_PRIORITY, iPriority);
                  lpTSCall1Req22->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                  lpTSCall1Req22->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                  lpTSCall1Req22->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                  lpTSCall1Req22->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                  lpTSCall1Req22->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                  lpTSCall1Req22->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                  lpTSCall1Req22->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                  lpTSCall1Req22->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
                  glpTSSubcallSerives->SubCall(lpTSCall1Req22, &lpTSCall1Ans22, 5000);
                  if(!lpTSCall1Ans22)  //  超时错误
                  {
                      lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                      lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.3]subcall timed out!");
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
                  v_init_date = lpTSCall1Ans22->GetInt32(LDBIZ_INIT_DATE_INT);
                  v_co_no = lpTSCall1Ans22->GetInt32(LDBIZ_CO_NO_INT);
                  v_pd_no = lpTSCall1Ans22->GetInt32(LDBIZ_PD_NO_INT);
                  v_exch_group_no = lpTSCall1Ans22->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
                  v_asset_acco_no = lpTSCall1Ans22->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
                  v_pass_no = lpTSCall1Ans22->GetInt32(LDBIZ_PASS_NO_INT);
                  strcpy(v_out_acco, lpTSCall1Ans22->GetString(LDBIZ_OUT_ACCO_STR));
                  strcpy(v_exch_crncy_type, lpTSCall1Ans22->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
                  v_stock_acco_no = lpTSCall1Ans22->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
                  v_stock_code_no = lpTSCall1Ans22->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
                  v_stock_type = lpTSCall1Ans22->GetInt32(LDBIZ_STOCK_TYPE_INT);
                  v_comm_date = lpTSCall1Ans22->GetInt32(LDBIZ_COMM_DATE_INT);
                  v_comm_time = lpTSCall1Ans22->GetInt32(LDBIZ_COMM_TIME_INT);
                  v_comm_batch_no = lpTSCall1Ans22->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
                  v_comm_opor = lpTSCall1Ans22->GetInt32(LDBIZ_COMM_OPOR_INT);
                  v_comm_executor = lpTSCall1Ans22->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
                  v_comm_dir = lpTSCall1Ans22->GetInt32(LDBIZ_COMM_DIR_INT);
                  v_comm_limit_price = lpTSCall1Ans22->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                  v_limit_actual_price = lpTSCall1Ans22->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                  v_comm_qty = lpTSCall1Ans22->GetDouble(LDBIZ_COMM_QTY_FLOAT);
                  v_comm_amt = lpTSCall1Ans22->GetDouble(LDBIZ_COMM_AMT_FLOAT);
                  v_order_qty = lpTSCall1Ans22->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
                  v_comm_cancel_qty = lpTSCall1Ans22->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
                  v_strike_amt = lpTSCall1Ans22->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
                  v_strike_qty = lpTSCall1Ans22->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
                  v_comm_frozen_amt = lpTSCall1Ans22->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
                  v_comm_frozen_qty = lpTSCall1Ans22->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
                  strcpy(v_strike_status, lpTSCall1Ans22->GetString(LDBIZ_STRIKE_STATUS_STR));
                  strcpy(v_comm_status, lpTSCall1Ans22->GetString(LDBIZ_COMM_STATUS_STR));
                  v_comm_begin_date = lpTSCall1Ans22->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
                  v_comm_end_date = lpTSCall1Ans22->GetInt32(LDBIZ_COMM_END_DATE_INT);
                  v_comm_begin_time = lpTSCall1Ans22->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
                  v_comm_end_time = lpTSCall1Ans22->GetInt32(LDBIZ_COMM_END_TIME_INT);
                  v_comm_comple_date = lpTSCall1Ans22->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
                  v_comm_comple_time = lpTSCall1Ans22->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
                  v_comm_appr_date = lpTSCall1Ans22->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
                  v_comm_appr_time = lpTSCall1Ans22->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
                  strcpy(v_comm_appr_status, lpTSCall1Ans22->GetString(LDBIZ_COMM_APPR_STATUS_STR));
                  v_comm_appr_oper = lpTSCall1Ans22->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
                  strcpy(v_comm_appr_remark, lpTSCall1Ans22->GetString(LDBIZ_COMM_APPR_REMARK_STR));
                  v_basket_id = lpTSCall1Ans22->GetInt64(LDBIZ_BASKET_ID_INT64);
                  v_net_price_flag = lpTSCall1Ans22->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
                  v_bond_accr_intrst = lpTSCall1Ans22->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
                  v_bond_rate_type = lpTSCall1Ans22->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
                  strcpy(v_comm_oper_way, lpTSCall1Ans22->GetString(LDBIZ_COMM_OPER_WAY_STR));
                  v_exter_comm_flag = lpTSCall1Ans22->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
                  v_comm_comple_flag = lpTSCall1Ans22->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
                  v_strategy_capt_qty = lpTSCall1Ans22->GetDouble(LDBIZ_STRATEGY_CAPT_QTY_FLOAT);
                  v_strategy_order_qty = lpTSCall1Ans22->GetDouble(LDBIZ_STRATEGY_ORDER_QTY_FLOAT);
                  strcpy(v_contra_no, lpTSCall1Ans22->GetString(LDBIZ_CONTRA_NO_STR));
                  strcpy(v_comm_remark_info, lpTSCall1Ans22->GetString(LDBIZ_COMM_REMARK_INFO_STR));
                  v_disp_opor = lpTSCall1Ans22->GetInt32(LDBIZ_DISP_OPOR_INT);
                  v_disp_status = lpTSCall1Ans22->GetInt32(LDBIZ_DISP_STATUS_INT);
                  v_read_flag = lpTSCall1Ans22->GetInt32(LDBIZ_READ_FLAG_INT);
                  v_update_times = lpTSCall1Ans22->GetInt32(LDBIZ_UPDATE_TIMES_INT);
                  v_sum_comm_row_id = lpTSCall1Ans22->GetInt64(LDBIZ_SUM_COMM_ROW_ID_INT64);
                  v_sum_comm_co_no = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_CO_NO_INT);
                  v_sum_comm_pd_no = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_PD_NO_INT);
                  v_sum_comm_exch_group_no = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_EXCH_GROUP_NO_INT);
                  v_sum_comm_asset_acco_no = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_ASSET_ACCO_NO_INT);
                  v_sum_comm_pass_no = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_PASS_NO_INT);
                  strcpy(v_sum_comm_out_acco, lpTSCall1Ans22->GetString(LDBIZ_SUM_COMM_OUT_ACCO_STR));
                  strcpy(v_sum_comm_exch_crncy_type, lpTSCall1Ans22->GetString(LDBIZ_SUM_COMM_EXCH_CRNCY_TYPE_STR));
                  v_sum_comm_stock_code_no = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_STOCK_CODE_NO_INT);
                  v_sum_comm_date = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_DATE_INT);
                  v_sum_comm_time = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_TIME_INT);
                  v_sum_comm_batch_no = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_BATCH_NO_INT);
                  v_sum_comm_opor = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_OPOR_INT);
                  v_sum_comm_executor = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_EXECUTOR_INT);
                  v_sum_comm_dir = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_DIR_INT);
                  v_sum_comm_limit_price = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_COMM_LIMIT_PRICE_FLOAT);
                  v_sum_comm_qty = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_COMM_QTY_FLOAT);
                  v_sum_comm_amt = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_COMM_AMT_FLOAT);
                  v_sum_comm_order_qty = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_COMM_ORDER_QTY_FLOAT);
                  v_sum_comm_cancel_qty = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_COMM_CANCEL_QTY_FLOAT);
                  v_sum_comm_await_cancel_qty = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_COMM_AWAIT_CANCEL_QTY_FLOAT);
                  v_sum_comm_strike_amt = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_COMM_STRIKE_AMT_FLOAT);
                  v_sum_comm_strike_qty = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_COMM_STRIKE_QTY_FLOAT);
                  strcpy(v_sum_comm_strike_status, lpTSCall1Ans22->GetString(LDBIZ_SUM_COMM_STRIKE_STATUS_STR));
                  strcpy(v_comm_sum_status, lpTSCall1Ans22->GetString(LDBIZ_COMM_SUM_STATUS_STR));
                  v_sum_comm_begin_date = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_BEGIN_DATE_INT);
                  v_sum_comm_end_date = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_END_DATE_INT);
                  v_sum_comm_begin_time = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_BEGIN_TIME_INT);
                  v_sum_comm_end_time = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_END_TIME_INT);
                  v_sum_comm_comple_date = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_COMPLE_DATE_INT);
                  v_sum_comm_comple_time = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_COMPLE_TIME_INT);
                  v_sum_comm_max_comm_comple_date = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_DATE_INT);
                  v_sum_comm_max_comm_comple_time = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_TIME_INT);
                  v_sum_comm_appr_date = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_APPR_DATE_INT);
                  v_sum_comm_appr_time = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_APPR_TIME_INT);
                  v_sum_comm_appr_qty = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_COMM_APPR_QTY_FLOAT);
                  strcpy(v_comm_sum_approve_status, lpTSCall1Ans22->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
                  v_sum_comm_basket_id = lpTSCall1Ans22->GetInt64(LDBIZ_SUM_COMM_BASKET_ID_INT64);
                  v_sum_comm_net_price_flag = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_NET_PRICE_FLAG_INT);
                  v_sum_comm_bond_accr_intrst = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_COMM_BOND_ACCR_INTRST_FLOAT);
                  v_sum_comm_bond_rate_type = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_BOND_RATE_TYPE_INT);
                  strcpy(v_sum_comm_oper_way, lpTSCall1Ans22->GetString(LDBIZ_SUM_COMM_OPER_WAY_STR));
                  v_sum_comm_exter_comm_flag = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_EXTER_COMM_FLAG_INT);
                  v_sum_buy_order_qty = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_BUY_ORDER_QTY_FLOAT);
                  v_sum_sell_order_qty = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_SELL_ORDER_QTY_FLOAT);
                  v_sum_buy_comm_qty = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_BUY_COMM_QTY_FLOAT);
                  v_sum_sell_comm_qty = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_SELL_COMM_QTY_FLOAT);
                  v_sum_buy_strike_qty = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_BUY_STRIKE_QTY_FLOAT);
                  v_sum_sell_strike_qty = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_SELL_STRIKE_QTY_FLOAT);
                  v_sum_buy_strike_amt = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_BUY_STRIKE_AMT_FLOAT);
                  v_sum_sell_strike_amt = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_SELL_STRIKE_AMT_FLOAT);
                  v_sum_buy_comm_amt = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_BUY_COMM_AMT_FLOAT);
                  v_sum_sell_comm_amt = lpTSCall1Ans22->GetDouble(LDBIZ_SUM_SELL_COMM_AMT_FLOAT);
                  strcpy(v_sum_comm_remark_info, lpTSCall1Ans22->GetString(LDBIZ_SUM_COMM_REMARK_INFO_STR));
                  v_sum_comm_update_times = lpTSCall1Ans22->GetInt32(LDBIZ_SUM_COMM_UPDATE_TIMES_INT);
                  strcpy(v_acco_concat_info, lpTSCall1Ans22->GetString(LDBIZ_ACCO_CONCAT_INFO_STR));
                  strcpy(v_combo_code, lpTSCall1Ans22->GetString(LDBIZ_COMBO_CODE_STR));


                  // [主动推送][secu.comm][证券主推_指令_指令主推消息]
                  lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.40", 0);
                  lpPubMsg->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                  lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                  lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                  lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                  lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                  lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
                  lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
                  lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
                  lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                  lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                  lpPubMsg->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
                  lpPubMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
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
                  lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT,v_comm_frozen_amt);
                  lpPubMsg->SetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT,v_comm_frozen_qty);
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
                  lpPubMsg->SetInt64(LDBIZ_BASKET_ID_INT64,v_basket_id);
                  lpPubMsg->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
                  lpPubMsg->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
                  lpPubMsg->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
                  lpPubMsg->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
                  lpPubMsg->SetInt32(LDBIZ_EXTER_COMM_FLAG_INT,v_exter_comm_flag);
                  lpPubMsg->SetInt32(LDBIZ_COMM_COMPLE_FLAG_INT,v_comm_comple_flag);
                  lpPubMsg->SetDouble(LDBIZ_STRATEGY_CAPT_QTY_FLOAT,v_strategy_capt_qty);
                  lpPubMsg->SetDouble(LDBIZ_STRATEGY_ORDER_QTY_FLOAT,v_strategy_order_qty);
                  lpPubMsg->SetString(LDBIZ_CONTRA_NO_STR,v_contra_no);
                  lpPubMsg->SetString(LDBIZ_COMM_REMARK_INFO_STR,v_comm_remark_info);
                  lpPubMsg->SetInt32(LDBIZ_DISP_OPOR_INT,v_disp_opor);
                  lpPubMsg->SetInt32(LDBIZ_DISP_STATUS_INT,v_disp_status);
                  lpPubMsg->SetInt32(LDBIZ_READ_FLAG_INT,v_read_flag);
                  lpPubMsg->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
                  lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
                  glpPubSub_Interface->PubTopics("secu.comm", lpPubMsg);


                  // if @指令批号# > 0 then
                  if (v_comm_batch_no > 0)
                  {

                      // set @指令备注信息# = @汇总指令备注信息#;
                      strcpy(v_comm_remark_info,v_sum_comm_remark_info);

                      // [主动推送][secu.commtotal][证券主推_指令_指令汇总主推消息]
                      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.41", 0);
                      lpPubMsg->SetInt64(LDBIZ_SUM_COMM_ROW_ID_INT64,v_sum_comm_row_id);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_CO_NO_INT,v_sum_comm_co_no);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_PD_NO_INT,v_sum_comm_pd_no);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_EXCH_GROUP_NO_INT,v_sum_comm_exch_group_no);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_ASSET_ACCO_NO_INT,v_sum_comm_asset_acco_no);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_PASS_NO_INT,v_sum_comm_pass_no);
                      lpPubMsg->SetString(LDBIZ_SUM_COMM_OUT_ACCO_STR,v_sum_comm_out_acco);
                      lpPubMsg->SetString(LDBIZ_SUM_COMM_EXCH_CRNCY_TYPE_STR,v_sum_comm_exch_crncy_type);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_STOCK_CODE_NO_INT,v_sum_comm_stock_code_no);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_DATE_INT,v_sum_comm_date);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_TIME_INT,v_sum_comm_time);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BATCH_NO_INT,v_sum_comm_batch_no);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_OPOR_INT,v_sum_comm_opor);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_EXECUTOR_INT,v_sum_comm_executor);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_DIR_INT,v_sum_comm_dir);
                      lpPubMsg->SetDouble(LDBIZ_SUM_COMM_LIMIT_PRICE_FLOAT,v_sum_comm_limit_price);
                      lpPubMsg->SetDouble(LDBIZ_SUM_COMM_QTY_FLOAT,v_sum_comm_qty);
                      lpPubMsg->SetDouble(LDBIZ_SUM_COMM_AMT_FLOAT,v_sum_comm_amt);
                      lpPubMsg->SetDouble(LDBIZ_SUM_COMM_ORDER_QTY_FLOAT,v_sum_comm_order_qty);
                      lpPubMsg->SetDouble(LDBIZ_SUM_COMM_CANCEL_QTY_FLOAT,v_sum_comm_cancel_qty);
                      lpPubMsg->SetDouble(LDBIZ_SUM_COMM_AWAIT_CANCEL_QTY_FLOAT,v_sum_comm_await_cancel_qty);
                      lpPubMsg->SetDouble(LDBIZ_SUM_COMM_STRIKE_AMT_FLOAT,v_sum_comm_strike_amt);
                      lpPubMsg->SetDouble(LDBIZ_SUM_COMM_STRIKE_QTY_FLOAT,v_sum_comm_strike_qty);
                      lpPubMsg->SetString(LDBIZ_SUM_COMM_STRIKE_STATUS_STR,v_sum_comm_strike_status);
                      lpPubMsg->SetString(LDBIZ_COMM_SUM_STATUS_STR,v_comm_sum_status);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BEGIN_DATE_INT,v_sum_comm_begin_date);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_END_DATE_INT,v_sum_comm_end_date);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BEGIN_TIME_INT,v_sum_comm_begin_time);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_END_TIME_INT,v_sum_comm_end_time);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_COMPLE_DATE_INT,v_sum_comm_comple_date);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_COMPLE_TIME_INT,v_sum_comm_comple_time);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_DATE_INT,v_sum_comm_max_comm_comple_date);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_TIME_INT,v_sum_comm_max_comm_comple_time);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_APPR_DATE_INT,v_sum_comm_appr_date);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_APPR_TIME_INT,v_sum_comm_appr_time);
                      lpPubMsg->SetDouble(LDBIZ_SUM_COMM_APPR_QTY_FLOAT,v_sum_comm_appr_qty);
                      lpPubMsg->SetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR,v_comm_sum_approve_status);
                      lpPubMsg->SetInt64(LDBIZ_SUM_COMM_BASKET_ID_INT64,v_sum_comm_basket_id);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_NET_PRICE_FLAG_INT,v_sum_comm_net_price_flag);
                      lpPubMsg->SetDouble(LDBIZ_SUM_COMM_BOND_ACCR_INTRST_FLOAT,v_sum_comm_bond_accr_intrst);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_BOND_RATE_TYPE_INT,v_sum_comm_bond_rate_type);
                      lpPubMsg->SetString(LDBIZ_SUM_COMM_OPER_WAY_STR,v_sum_comm_oper_way);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_EXTER_COMM_FLAG_INT,v_sum_comm_exter_comm_flag);
                      lpPubMsg->SetDouble(LDBIZ_SUM_BUY_ORDER_QTY_FLOAT,v_sum_buy_order_qty);
                      lpPubMsg->SetDouble(LDBIZ_SUM_SELL_ORDER_QTY_FLOAT,v_sum_sell_order_qty);
                      lpPubMsg->SetDouble(LDBIZ_SUM_BUY_COMM_QTY_FLOAT,v_sum_buy_comm_qty);
                      lpPubMsg->SetDouble(LDBIZ_SUM_SELL_COMM_QTY_FLOAT,v_sum_sell_comm_qty);
                      lpPubMsg->SetDouble(LDBIZ_SUM_BUY_STRIKE_QTY_FLOAT,v_sum_buy_strike_qty);
                      lpPubMsg->SetDouble(LDBIZ_SUM_SELL_STRIKE_QTY_FLOAT,v_sum_sell_strike_qty);
                      lpPubMsg->SetDouble(LDBIZ_SUM_BUY_STRIKE_AMT_FLOAT,v_sum_buy_strike_amt);
                      lpPubMsg->SetDouble(LDBIZ_SUM_SELL_STRIKE_AMT_FLOAT,v_sum_sell_strike_amt);
                      lpPubMsg->SetDouble(LDBIZ_SUM_BUY_COMM_AMT_FLOAT,v_sum_buy_comm_amt);
                      lpPubMsg->SetDouble(LDBIZ_SUM_SELL_COMM_AMT_FLOAT,v_sum_sell_comm_amt);
                      lpPubMsg->SetString(LDBIZ_COMM_REMARK_INFO_STR,v_comm_remark_info);
                      lpPubMsg->SetInt32(LDBIZ_READ_FLAG_INT,v_read_flag);
                      lpPubMsg->SetString(LDBIZ_ACCO_CONCAT_INFO_STR,v_acco_concat_info);
                      lpPubMsg->SetInt32(LDBIZ_SUM_COMM_UPDATE_TIMES_INT,v_sum_comm_update_times);
                      glpPubSub_Interface->PubTopics("secu.commtotal", lpPubMsg);

                  // end if;
                  }

              // end if;
              }

              //质押提交和质押转回，要推交易代码和标准券代码

              // if @订单方向# = 《订单方向-质押提交》 or @订单方向# = 《订单方向-质押转回》 then
              if (v_order_dir == 21 || v_order_dir == 22)
              {
                //调用过程[事务_交易证券_主推接口_获取资金和质押持仓信息]
                //组织事务请求
                if(lpTSCall1Ans23)
                {
                  lpTSCall1Ans23->FreeMsg();
                  lpTSCall1Ans23=NULL;
                }
                lpTSCall1Req23=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.28", 0);
                lpTSCall1Req23->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req23->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req23->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req23->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req23->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req23->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req23->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req23->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req23->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpTSCall1Req23->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpTSCall1Req23->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                lpTSCall1Req23->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpTSCall1Req23->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                lpTSCall1Req23->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
                lpTSCall1Req23->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
                lpTSCall1Req23->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
                glpTSSubcallSerives->SubCall(lpTSCall1Req23, &lpTSCall1Ans23, 5000);
                if(!lpTSCall1Ans23)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.28]subcall timed out!");
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
                v_exgp_cash_id = lpTSCall1Ans23->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
                v_exgp_frozen_amt = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
                v_exgp_unfroz_amt = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
                v_exgp_comm_frozen_amt = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
                v_exgp_comm_unfroz_amt = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
                v_exgp_comm_capt_amt = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
                v_exgp_comm_releas_amt = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
                v_exgp_trade_frozen_amt = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT);
                v_exgp_trade_unfroz_amt = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT);
                v_exgp_trade_capt_amt = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
                v_exgp_trade_releas_amt = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
                v_exgp_strike_capt_amt = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
                v_exgp_strike_releas_amt = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
                v_exgp_cash_update_times = lpTSCall1Ans23->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
                v_exgp_posi_id = lpTSCall1Ans23->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
                v_exgp_frozen_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
                v_exgp_unfroz_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
                v_exgp_comm_frozen_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT);
                v_exgp_comm_unfroz_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT);
                v_exgp_comm_capt_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT);
                v_exgp_comm_releas_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
                v_exgp_trade_frozen_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT);
                v_exgp_trade_unfroz_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT);
                v_exgp_trade_capt_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT);
                v_exgp_trade_releas_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
                v_exgp_strike_capt_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT);
                v_exgp_strike_releas_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
                v_exgp_strike_frozen_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT);
                v_exgp_strike_unfroz_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT);
                v_exgp_realize_pandl = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
                v_exgp_cost_amt = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
                v_exgp_intrst_cost_amt = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
                v_exgp_intrst_pandl = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
                v_exgp_posi_update_times = lpTSCall1Ans23->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
                v_asac_cash_id = lpTSCall1Ans23->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
                v_asac_frozen_amt = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
                v_asac_unfroz_amt = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
                v_asac_comm_frozen_amt = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
                v_asac_comm_unfroz_amt = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
                v_asac_comm_capt_amt = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
                v_asac_comm_releas_amt = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
                v_asac_trade_frozen_amt = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT);
                v_asac_trade_unfroz_amt = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT);
                v_asac_trade_capt_amt = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
                v_asac_trade_releas_amt = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
                v_asac_strike_capt_amt = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
                v_asac_strike_releas_amt = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
                v_asac_cash_update_times = lpTSCall1Ans23->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);
                v_asac_posi_id = lpTSCall1Ans23->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
                v_asac_frozen_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
                v_asac_unfroz_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
                v_asac_comm_frozen_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT);
                v_asac_comm_unfroz_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT);
                v_asac_comm_capt_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT);
                v_asac_comm_releas_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
                v_asac_trade_frozen_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT);
                v_asac_trade_unfroz_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT);
                v_asac_trade_capt_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT);
                v_asac_trade_releas_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
                v_asac_strike_capt_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT);
                v_asac_strike_releas_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
                v_asac_strike_frozen_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT);
                v_asac_strike_unfroz_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT);
                v_asac_realize_pandl = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
                v_asac_cost_amt = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
                v_asac_intrst_cost_amt = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
                v_asac_intrst_pandl = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
                v_asac_posi_update_times = lpTSCall1Ans23->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);
                v_exgp_target_posi_id = lpTSCall1Ans23->GetInt64(LDBIZ_EXGP_TARGET_POSI_ID_INT64);
                v_exgp_target_frozen_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TARGET_FROZEN_QTY_FLOAT);
                v_exgp_target_unfroz_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TARGET_UNFROZ_QTY_FLOAT);
                v_exgp_target_comm_frozen_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TARGET_COMM_FROZEN_QTY_FLOAT);
                v_exgp_target_comm_unfroz_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TARGET_COMM_UNFROZ_QTY_FLOAT);
                v_exgp_target_comm_capt_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TARGET_COMM_CAPT_QTY_FLOAT);
                v_exgp_target_comm_releas_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TARGET_COMM_RELEAS_QTY_FLOAT);
                v_exgp_target_trade_frozen_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TARGET_TRADE_FROZEN_QTY_FLOAT);
                v_exgp_target_trade_unfroz_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TARGET_TRADE_UNFROZ_QTY_FLOAT);
                v_exgp_target_trade_capt_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TARGET_TRADE_CAPT_QTY_FLOAT);
                v_exgp_target_trade_releas_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TARGET_TRADE_RELEAS_QTY_FLOAT);
                v_exgp_target_strike_capt_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_CAPT_QTY_FLOAT);
                v_exgp_target_strike_releas_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_RELEAS_QTY_FLOAT);
                v_exgp_target_strike_frozen_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_FROZEN_QTY_FLOAT);
                v_exgp_target_strike_unfroz_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_UNFROZ_QTY_FLOAT);
                v_exgp_target_realize_pandl = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TARGET_REALIZE_PANDL_FLOAT);
                v_exgp_target_cost_amt = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TARGET_COST_AMT_FLOAT);
                v_exgp_target_intrst_cost_amt = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TARGET_INTRST_COST_AMT_FLOAT);
                v_exgp_target_intrst_pandl = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_TARGET_INTRST_PANDL_FLOAT);
                v_exgp_target_posi_update_times = lpTSCall1Ans23->GetInt32(LDBIZ_EXGP_TARGET_POSI_UPDATE_TIMES_INT);
                v_asac_target_posi_id = lpTSCall1Ans23->GetInt64(LDBIZ_ASAC_TARGET_POSI_ID_INT64);
                v_asac_target_frozen_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TARGET_FROZEN_QTY_FLOAT);
                v_asac_target_unfroz_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TARGET_UNFROZ_QTY_FLOAT);
                v_asac_target_comm_frozen_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TARGET_COMM_FROZEN_QTY_FLOAT);
                v_asac_target_comm_unfroz_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TARGET_COMM_UNFROZ_QTY_FLOAT);
                v_asac_target_comm_capt_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TARGET_COMM_CAPT_QTY_FLOAT);
                v_asac_target_comm_releas_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TARGET_COMM_RELEAS_QTY_FLOAT);
                v_asac_target_trade_frozen_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TARGET_TRADE_FROZEN_QTY_FLOAT);
                v_asac_target_trade_unfroz_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TARGET_TRADE_UNFROZ_QTY_FLOAT);
                v_asac_target_trade_capt_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TARGET_TRADE_CAPT_QTY_FLOAT);
                v_asac_target_trade_releas_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TARGET_TRADE_RELEAS_QTY_FLOAT);
                v_asac_target_strike_capt_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_CAPT_QTY_FLOAT);
                v_asac_target_strike_releas_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_RELEAS_QTY_FLOAT);
                v_asac_target_strike_frozen_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_FROZEN_QTY_FLOAT);
                v_asac_target_strike_unfroz_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_UNFROZ_QTY_FLOAT);
                v_asac_target_realize_pandl = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TARGET_REALIZE_PANDL_FLOAT);
                v_asac_target_cost_amt = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TARGET_COST_AMT_FLOAT);
                v_asac_target_intrst_cost_amt = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TARGET_INTRST_COST_AMT_FLOAT);
                v_asac_target_intrst_pandl = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_TARGET_INTRST_PANDL_FLOAT);
                v_asac_target_posi_update_times = lpTSCall1Ans23->GetInt32(LDBIZ_ASAC_TARGET_POSI_UPDATE_TIMES_INT);
                v_exgp_put_impawn_qty = lpTSCall1Ans23->GetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT);
                v_asac_put_impawn_qty = lpTSCall1Ans23->GetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT);


                // set @证券代码编号# = @交易代码编号#;
                v_stock_code_no = v_trade_code_no;

                // [主动推送][secu.exgpcapital][证券主推_资金_交易组资金主推消息]
                lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.50", 0);
                lpPubMsg->SetInt64(LDBIZ_EXGP_CASH_ID_INT64,v_exgp_cash_id);
                lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
                lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT,v_exgp_comm_frozen_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT,v_exgp_comm_unfroz_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT,v_exgp_comm_capt_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT,v_exgp_comm_releas_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT,v_exgp_trade_frozen_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT,v_exgp_trade_unfroz_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT,v_exgp_trade_capt_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT,v_exgp_trade_releas_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT,v_exgp_strike_capt_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT,v_exgp_strike_releas_amt);
                lpPubMsg->SetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT,v_exgp_cash_update_times);
                glpPubSub_Interface->PubTopics("secu.exgpcapital", lpPubMsg);


                // [主动推送][secu.exgpposi][证券主推_持仓_交易组持仓主推消息]
                lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.60", 0);
                lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
                lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT,v_exgp_comm_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT,v_exgp_comm_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT,v_exgp_comm_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT,v_exgp_trade_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT,v_exgp_trade_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT,v_exgp_trade_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT,v_exgp_strike_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT,v_exgp_strike_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT,v_exgp_strike_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
                lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
                lpPubMsg->SetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT,v_exgp_put_impawn_qty);
                glpPubSub_Interface->PubTopics("secu.exgpposi", lpPubMsg);


                // [主动推送][secu.asaccapital][证券主推_资金_资产账户资金主推消息]
                lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.51", 0);
                lpPubMsg->SetInt64(LDBIZ_ASAC_CASH_ID_INT64,v_asac_cash_id);
                lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
                lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT,v_asac_frozen_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT,v_asac_unfroz_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT,v_asac_comm_frozen_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT,v_asac_comm_unfroz_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT,v_asac_comm_capt_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT,v_asac_comm_releas_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT,v_asac_trade_frozen_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT,v_asac_trade_unfroz_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT,v_asac_trade_capt_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT,v_asac_trade_releas_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT,v_asac_strike_capt_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT,v_asac_strike_releas_amt);
                lpPubMsg->SetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT,v_asac_cash_update_times);
                glpPubSub_Interface->PubTopics("secu.asaccapital", lpPubMsg);


                // [主动推送][secu.asacposi][证券主推_持仓_资产账户持仓主推消息]
                lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.61", 0);
                lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
                lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT,v_asac_comm_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT,v_asac_comm_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT,v_asac_comm_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT,v_asac_trade_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT,v_asac_trade_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT,v_asac_trade_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT,v_asac_strike_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT,v_asac_strike_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT,v_asac_strike_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
                lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
                lpPubMsg->SetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT,v_asac_put_impawn_qty);
                glpPubSub_Interface->PubTopics("secu.asacposi", lpPubMsg);


                // set @证券代码编号# = @标的代码编号#;
                v_stock_code_no = v_target_code_no;

                // set @交易组提交质押数量# = 0;
                v_exgp_put_impawn_qty = 0;

                // set @资产账户提交质押数量# = 0;
                v_asac_put_impawn_qty = 0;

                // set @交易组持仓序号# = @交易组标的持仓序号#;
                v_exgp_posi_id = v_exgp_target_posi_id;

                // set @交易组冻结数量# = @交易组标的冻结数量#;
                v_exgp_frozen_qty = v_exgp_target_frozen_qty;

                // set @交易组解冻数量# = @交易组标的解冻数量#;
                v_exgp_unfroz_qty = v_exgp_target_unfroz_qty;

                // set @交易组指令冻结数量# = @交易组标的指令冻结数量#;
                v_exgp_comm_frozen_qty = v_exgp_target_comm_frozen_qty;

                // set @交易组指令解冻数量# = @交易组标的指令解冻数量#;
                v_exgp_comm_unfroz_qty = v_exgp_target_comm_unfroz_qty;

                // set @交易组指令占用数量# = @交易组标的指令占用数量#;
                v_exgp_comm_capt_qty = v_exgp_target_comm_capt_qty;

                // set @交易组指令释放数量# = @交易组标的指令释放数量#;
                v_exgp_comm_releas_qty = v_exgp_target_comm_releas_qty;

                // set @交易组交易冻结数量# = @交易组标的交易冻结数量#;
                v_exgp_trade_frozen_qty = v_exgp_target_trade_frozen_qty;

                // set @交易组交易解冻数量# = @交易组标的交易解冻数量#;
                v_exgp_trade_unfroz_qty = v_exgp_target_trade_unfroz_qty;

                // set @交易组交易占用数量# = @交易组标的交易占用数量#;
                v_exgp_trade_capt_qty = v_exgp_target_trade_capt_qty;

                // set @交易组交易释放数量# = @交易组标的交易释放数量#;
                v_exgp_trade_releas_qty = v_exgp_target_trade_releas_qty;

                // set @交易组成交占用数量# = @交易组标的成交占用数量#;
                v_exgp_strike_capt_qty = v_exgp_target_strike_capt_qty;

                // set @交易组成交释放数量# = @交易组标的成交释放数量#;
                v_exgp_strike_releas_qty = v_exgp_target_strike_releas_qty;

                // set @交易组成交冻结数量# = @交易组标的成交冻结数量#;
                v_exgp_strike_frozen_qty = v_exgp_target_strike_frozen_qty;

                // set @交易组成交解冻数量# = @交易组标的成交解冻数量#;
                v_exgp_strike_unfroz_qty = v_exgp_target_strike_unfroz_qty;

                // set @交易组实现盈亏# = @交易组标的实现盈亏#;
                v_exgp_realize_pandl = v_exgp_target_realize_pandl;

                // set @交易组成本金额# = @交易组标的成本金额#;
                v_exgp_cost_amt = v_exgp_target_cost_amt;

                // set @交易组利息成本金额# = @交易组标的利息成本金额#;
                v_exgp_intrst_cost_amt = v_exgp_target_intrst_cost_amt;

                // set @交易组利息收益# = @交易组标的利息收益#;
                v_exgp_intrst_pandl = v_exgp_target_intrst_pandl;

                // set @交易组持仓更新次数# = @交易组标的持仓更新次数#;
                v_exgp_posi_update_times = v_exgp_target_posi_update_times;

                // set @资产账户持仓序号# = @资产账户标的持仓序号#;
                v_asac_posi_id = v_asac_target_posi_id;

                // set @资产账户冻结数量# = @资产账户标的冻结数量#;
                v_asac_frozen_qty = v_asac_target_frozen_qty;

                // set @资产账户解冻数量# = @资产账户标的解冻数量#;
                v_asac_unfroz_qty = v_asac_target_unfroz_qty;

                // set @资产账户指令冻结数量# = @资产账户标的指令冻结数量#;
                v_asac_comm_frozen_qty = v_asac_target_comm_frozen_qty;

                // set @资产账户指令解冻数量# = @资产账户标的指令解冻数量#;
                v_asac_comm_unfroz_qty = v_asac_target_comm_unfroz_qty;

                // set @资产账户指令占用数量# = @资产账户标的指令占用数量#;
                v_asac_comm_capt_qty = v_asac_target_comm_capt_qty;

                // set @资产账户指令释放数量# = @资产账户标的指令释放数量#;
                v_asac_comm_releas_qty = v_asac_target_comm_releas_qty;

                // set @资产账户交易冻结数量# = @资产账户标的交易冻结数量#;
                v_asac_trade_frozen_qty = v_asac_target_trade_frozen_qty;

                // set @资产账户交易解冻数量# = @资产账户标的交易解冻数量#;
                v_asac_trade_unfroz_qty = v_asac_target_trade_unfroz_qty;

                // set @资产账户交易占用数量# = @资产账户标的交易占用数量#;
                v_asac_trade_capt_qty = v_asac_target_trade_capt_qty;

                // set @资产账户交易释放数量# = @资产账户标的交易释放数量#;
                v_asac_trade_releas_qty = v_asac_target_trade_releas_qty;

                // set @资产账户成交占用数量# = @资产账户标的成交占用数量#;
                v_asac_strike_capt_qty = v_asac_target_strike_capt_qty;

                // set @资产账户成交释放数量# = @资产账户标的成交释放数量#;
                v_asac_strike_releas_qty = v_asac_target_strike_releas_qty;

                // set @资产账户成交冻结数量# = @资产账户标的成交冻结数量#;
                v_asac_strike_frozen_qty = v_asac_target_strike_frozen_qty;

                // set @资产账户成交解冻数量# = @资产账户标的成交解冻数量#;
                v_asac_strike_unfroz_qty = v_asac_target_strike_unfroz_qty;

                // set @资产账户实现盈亏# = @资产账户标的实现盈亏#;
                v_asac_realize_pandl = v_asac_target_realize_pandl;

                // set @资产账户成本金额# = @资产账户标的成本金额#;
                v_asac_cost_amt = v_asac_target_cost_amt;

                // set @资产账户利息成本金额# = @资产账户标的利息成本金额#;
                v_asac_intrst_cost_amt = v_asac_target_intrst_cost_amt;

                // set @资产账户利息收益# = @资产账户标的利息收益#;
                v_asac_intrst_pandl = v_asac_target_intrst_pandl;

                // set @资产账户持仓更新次数# = @资产账户标的持仓更新次数#;
                v_asac_posi_update_times = v_asac_target_posi_update_times;

                // [主动推送][secu.exgpposi][证券主推_持仓_交易组持仓主推消息]
                lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.60", 0);
                lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
                lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT,v_exgp_comm_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT,v_exgp_comm_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT,v_exgp_comm_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT,v_exgp_trade_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT,v_exgp_trade_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT,v_exgp_trade_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT,v_exgp_strike_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT,v_exgp_strike_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT,v_exgp_strike_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
                lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
                lpPubMsg->SetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT,v_exgp_put_impawn_qty);
                glpPubSub_Interface->PubTopics("secu.exgpposi", lpPubMsg);


                // [主动推送][secu.asacposi][证券主推_持仓_资产账户持仓主推消息]
                lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.61", 0);
                lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
                lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT,v_asac_comm_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT,v_asac_comm_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT,v_asac_comm_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT,v_asac_trade_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT,v_asac_trade_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT,v_asac_trade_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT,v_asac_strike_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT,v_asac_strike_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT,v_asac_strike_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
                lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
                lpPubMsg->SetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT,v_asac_put_impawn_qty);
                glpPubSub_Interface->PubTopics("secu.asacposi", lpPubMsg);


              }
              // else if @订单方向# = 《订单方向-融资回购》 or @订单方向# = 《订单方向-融券回购》 then
              else if (v_order_dir == 3 || v_order_dir == 4)
              {

                // set @证券代码编号# = @标的代码编号#;
                v_stock_code_no = v_target_code_no;
                //调用过程[事务_交易证券_主推接口_获取资金持仓信息]
                //组织事务请求
                if(lpTSCall1Ans24)
                {
                  lpTSCall1Ans24->FreeMsg();
                  lpTSCall1Ans24=NULL;
                }
                lpTSCall1Req24=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.13", 0);
                lpTSCall1Req24->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req24->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req24->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req24->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req24->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req24->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req24->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req24->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req24->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpTSCall1Req24->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpTSCall1Req24->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                lpTSCall1Req24->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpTSCall1Req24->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                lpTSCall1Req24->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                lpTSCall1Req24->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
                glpTSSubcallSerives->SubCall(lpTSCall1Req24, &lpTSCall1Ans24, 5000);
                if(!lpTSCall1Ans24)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.13]subcall timed out!");
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
                v_exgp_cash_id = lpTSCall1Ans24->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
                v_exgp_frozen_amt = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
                v_exgp_unfroz_amt = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
                v_exgp_comm_frozen_amt = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
                v_exgp_comm_unfroz_amt = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
                v_exgp_comm_capt_amt = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
                v_exgp_comm_releas_amt = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
                v_exgp_trade_frozen_amt = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT);
                v_exgp_trade_unfroz_amt = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT);
                v_exgp_trade_capt_amt = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
                v_exgp_trade_releas_amt = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
                v_exgp_strike_capt_amt = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
                v_exgp_strike_releas_amt = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
                v_exgp_cash_update_times = lpTSCall1Ans24->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
                v_exgp_posi_id = lpTSCall1Ans24->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
                v_exgp_frozen_qty = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
                v_exgp_unfroz_qty = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
                v_exgp_comm_frozen_qty = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT);
                v_exgp_comm_unfroz_qty = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT);
                v_exgp_comm_capt_qty = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT);
                v_exgp_comm_releas_qty = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
                v_exgp_trade_frozen_qty = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT);
                v_exgp_trade_unfroz_qty = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT);
                v_exgp_trade_capt_qty = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT);
                v_exgp_trade_releas_qty = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
                v_exgp_strike_capt_qty = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT);
                v_exgp_strike_releas_qty = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
                v_exgp_strike_frozen_qty = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT);
                v_exgp_strike_unfroz_qty = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT);
                v_exgp_realize_pandl = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
                v_exgp_cost_amt = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
                v_exgp_intrst_cost_amt = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
                v_exgp_intrst_pandl = lpTSCall1Ans24->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
                v_exgp_posi_update_times = lpTSCall1Ans24->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
                v_asac_cash_id = lpTSCall1Ans24->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
                v_asac_frozen_amt = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
                v_asac_unfroz_amt = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
                v_asac_comm_frozen_amt = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
                v_asac_comm_unfroz_amt = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
                v_asac_comm_capt_amt = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
                v_asac_comm_releas_amt = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
                v_asac_trade_frozen_amt = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT);
                v_asac_trade_unfroz_amt = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT);
                v_asac_trade_capt_amt = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
                v_asac_trade_releas_amt = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
                v_asac_strike_capt_amt = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
                v_asac_strike_releas_amt = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
                v_asac_cash_update_times = lpTSCall1Ans24->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);
                v_asac_posi_id = lpTSCall1Ans24->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
                v_asac_frozen_qty = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
                v_asac_unfroz_qty = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
                v_asac_comm_frozen_qty = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT);
                v_asac_comm_unfroz_qty = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT);
                v_asac_comm_capt_qty = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT);
                v_asac_comm_releas_qty = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
                v_asac_trade_frozen_qty = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT);
                v_asac_trade_unfroz_qty = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT);
                v_asac_trade_capt_qty = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT);
                v_asac_trade_releas_qty = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
                v_asac_strike_capt_qty = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT);
                v_asac_strike_releas_qty = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
                v_asac_strike_frozen_qty = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT);
                v_asac_strike_unfroz_qty = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT);
                v_asac_realize_pandl = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
                v_asac_cost_amt = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
                v_asac_intrst_cost_amt = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
                v_asac_intrst_pandl = lpTSCall1Ans24->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
                v_asac_posi_update_times = lpTSCall1Ans24->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


                // [主动推送][secu.exgpcapital][证券主推_资金_交易组资金主推消息]
                lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.50", 0);
                lpPubMsg->SetInt64(LDBIZ_EXGP_CASH_ID_INT64,v_exgp_cash_id);
                lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
                lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT,v_exgp_comm_frozen_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT,v_exgp_comm_unfroz_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT,v_exgp_comm_capt_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT,v_exgp_comm_releas_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT,v_exgp_trade_frozen_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT,v_exgp_trade_unfroz_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT,v_exgp_trade_capt_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT,v_exgp_trade_releas_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT,v_exgp_strike_capt_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT,v_exgp_strike_releas_amt);
                lpPubMsg->SetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT,v_exgp_cash_update_times);
                glpPubSub_Interface->PubTopics("secu.exgpcapital", lpPubMsg);


                // [主动推送][secu.exgpposi][证券主推_持仓_交易组持仓主推消息]
                lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.60", 0);
                lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
                lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT,v_exgp_comm_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT,v_exgp_comm_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT,v_exgp_comm_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT,v_exgp_trade_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT,v_exgp_trade_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT,v_exgp_trade_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT,v_exgp_strike_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT,v_exgp_strike_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT,v_exgp_strike_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
                lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
                lpPubMsg->SetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT,v_exgp_put_impawn_qty);
                glpPubSub_Interface->PubTopics("secu.exgpposi", lpPubMsg);


                // [主动推送][secu.asaccapital][证券主推_资金_资产账户资金主推消息]
                lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.51", 0);
                lpPubMsg->SetInt64(LDBIZ_ASAC_CASH_ID_INT64,v_asac_cash_id);
                lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
                lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT,v_asac_frozen_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT,v_asac_unfroz_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT,v_asac_comm_frozen_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT,v_asac_comm_unfroz_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT,v_asac_comm_capt_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT,v_asac_comm_releas_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT,v_asac_trade_frozen_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT,v_asac_trade_unfroz_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT,v_asac_trade_capt_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT,v_asac_trade_releas_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT,v_asac_strike_capt_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT,v_asac_strike_releas_amt);
                lpPubMsg->SetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT,v_asac_cash_update_times);
                glpPubSub_Interface->PubTopics("secu.asaccapital", lpPubMsg);


                // [主动推送][secu.asacposi][证券主推_持仓_资产账户持仓主推消息]
                lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.61", 0);
                lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
                lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT,v_asac_comm_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT,v_asac_comm_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT,v_asac_comm_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT,v_asac_trade_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT,v_asac_trade_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT,v_asac_trade_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT,v_asac_strike_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT,v_asac_strike_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT,v_asac_strike_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
                lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
                lpPubMsg->SetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT,v_asac_put_impawn_qty);
                glpPubSub_Interface->PubTopics("secu.asacposi", lpPubMsg);

              }
              // else
              else
              {

                //调用过程[事务_交易证券_主推接口_获取资金持仓信息]
                //组织事务请求
                if(lpTSCall1Ans25)
                {
                  lpTSCall1Ans25->FreeMsg();
                  lpTSCall1Ans25=NULL;
                }
                lpTSCall1Req25=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.13", 0);
                lpTSCall1Req25->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req25->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req25->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req25->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req25->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req25->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req25->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req25->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req25->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpTSCall1Req25->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpTSCall1Req25->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                lpTSCall1Req25->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpTSCall1Req25->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                lpTSCall1Req25->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                lpTSCall1Req25->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
                glpTSSubcallSerives->SubCall(lpTSCall1Req25, &lpTSCall1Ans25, 5000);
                if(!lpTSCall1Ans25)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.13]subcall timed out!");
                    iRet=-2;
                    goto ENDSYS;
                }
                else if(lpTSCall1Ans25->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans25->GetInt32(LDTAG_ERRORNO));
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans25->GetString(LDTAG_ERRORINFO));
                    iRet=-2;
                    goto ENDSYS;
                }
                else if(strcmp(lpTSCall1Ans25->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
                {
                    strcpy(v_error_code, lpTSCall1Ans25->GetString(LDBIZ_ERROR_CODE_STR));
                    strcpy(v_error_info, lpTSCall1Ans25->GetString(LDBIZ_ERROR_INFO_STR));
                    iRet=-1;
                    goto END;
                }
                //获取输出参数值
                strcpy(v_error_code, lpTSCall1Ans25->GetString(LDBIZ_ERROR_CODE_STR));
                strcpy(v_error_info, lpTSCall1Ans25->GetString(LDBIZ_ERROR_INFO_STR));
                v_exgp_cash_id = lpTSCall1Ans25->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
                v_exgp_frozen_amt = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
                v_exgp_unfroz_amt = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
                v_exgp_comm_frozen_amt = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
                v_exgp_comm_unfroz_amt = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
                v_exgp_comm_capt_amt = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
                v_exgp_comm_releas_amt = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
                v_exgp_trade_frozen_amt = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT);
                v_exgp_trade_unfroz_amt = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT);
                v_exgp_trade_capt_amt = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
                v_exgp_trade_releas_amt = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
                v_exgp_strike_capt_amt = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
                v_exgp_strike_releas_amt = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
                v_exgp_cash_update_times = lpTSCall1Ans25->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
                v_exgp_posi_id = lpTSCall1Ans25->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
                v_exgp_frozen_qty = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
                v_exgp_unfroz_qty = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
                v_exgp_comm_frozen_qty = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT);
                v_exgp_comm_unfroz_qty = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT);
                v_exgp_comm_capt_qty = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT);
                v_exgp_comm_releas_qty = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
                v_exgp_trade_frozen_qty = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT);
                v_exgp_trade_unfroz_qty = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT);
                v_exgp_trade_capt_qty = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT);
                v_exgp_trade_releas_qty = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
                v_exgp_strike_capt_qty = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT);
                v_exgp_strike_releas_qty = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
                v_exgp_strike_frozen_qty = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT);
                v_exgp_strike_unfroz_qty = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT);
                v_exgp_realize_pandl = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
                v_exgp_cost_amt = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
                v_exgp_intrst_cost_amt = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
                v_exgp_intrst_pandl = lpTSCall1Ans25->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
                v_exgp_posi_update_times = lpTSCall1Ans25->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
                v_asac_cash_id = lpTSCall1Ans25->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
                v_asac_frozen_amt = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
                v_asac_unfroz_amt = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
                v_asac_comm_frozen_amt = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
                v_asac_comm_unfroz_amt = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
                v_asac_comm_capt_amt = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
                v_asac_comm_releas_amt = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
                v_asac_trade_frozen_amt = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT);
                v_asac_trade_unfroz_amt = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT);
                v_asac_trade_capt_amt = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
                v_asac_trade_releas_amt = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
                v_asac_strike_capt_amt = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
                v_asac_strike_releas_amt = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
                v_asac_cash_update_times = lpTSCall1Ans25->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);
                v_asac_posi_id = lpTSCall1Ans25->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
                v_asac_frozen_qty = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
                v_asac_unfroz_qty = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
                v_asac_comm_frozen_qty = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT);
                v_asac_comm_unfroz_qty = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT);
                v_asac_comm_capt_qty = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT);
                v_asac_comm_releas_qty = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
                v_asac_trade_frozen_qty = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT);
                v_asac_trade_unfroz_qty = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT);
                v_asac_trade_capt_qty = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT);
                v_asac_trade_releas_qty = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
                v_asac_strike_capt_qty = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT);
                v_asac_strike_releas_qty = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
                v_asac_strike_frozen_qty = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT);
                v_asac_strike_unfroz_qty = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT);
                v_asac_realize_pandl = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
                v_asac_cost_amt = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
                v_asac_intrst_cost_amt = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
                v_asac_intrst_pandl = lpTSCall1Ans25->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
                v_asac_posi_update_times = lpTSCall1Ans25->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


                // set @交易组提交质押数量# = 0;
                v_exgp_put_impawn_qty = 0;

                // set @资产账户提交质押数量# = 0;
                v_asac_put_impawn_qty = 0;

                // [主动推送][secu.exgpcapital][证券主推_资金_交易组资金主推消息]
                lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.50", 0);
                lpPubMsg->SetInt64(LDBIZ_EXGP_CASH_ID_INT64,v_exgp_cash_id);
                lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
                lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT,v_exgp_frozen_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT,v_exgp_unfroz_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT,v_exgp_comm_frozen_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT,v_exgp_comm_unfroz_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT,v_exgp_comm_capt_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT,v_exgp_comm_releas_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT,v_exgp_trade_frozen_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT,v_exgp_trade_unfroz_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT,v_exgp_trade_capt_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT,v_exgp_trade_releas_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT,v_exgp_strike_capt_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT,v_exgp_strike_releas_amt);
                lpPubMsg->SetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT,v_exgp_cash_update_times);
                glpPubSub_Interface->PubTopics("secu.exgpcapital", lpPubMsg);


                // [主动推送][secu.exgpposi][证券主推_持仓_交易组持仓主推消息]
                lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.60", 0);
                lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
                lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT,v_exgp_comm_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT,v_exgp_comm_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT,v_exgp_comm_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT,v_exgp_comm_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT,v_exgp_trade_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT,v_exgp_trade_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT,v_exgp_trade_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT,v_exgp_trade_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT,v_exgp_strike_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT,v_exgp_strike_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT,v_exgp_strike_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT,v_exgp_strike_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
                lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
                lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
                lpPubMsg->SetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT,v_exgp_posi_update_times);
                lpPubMsg->SetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT,v_exgp_put_impawn_qty);
                glpPubSub_Interface->PubTopics("secu.exgpposi", lpPubMsg);


                // [主动推送][secu.asaccapital][证券主推_资金_资产账户资金主推消息]
                lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.51", 0);
                lpPubMsg->SetInt64(LDBIZ_ASAC_CASH_ID_INT64,v_asac_cash_id);
                lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
                lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT,v_asac_frozen_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT,v_asac_unfroz_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT,v_asac_comm_frozen_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT,v_asac_comm_unfroz_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT,v_asac_comm_capt_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT,v_asac_comm_releas_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT,v_asac_trade_frozen_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT,v_asac_trade_unfroz_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT,v_asac_trade_capt_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT,v_asac_trade_releas_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT,v_asac_strike_capt_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT,v_asac_strike_releas_amt);
                lpPubMsg->SetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT,v_asac_cash_update_times);
                glpPubSub_Interface->PubTopics("secu.asaccapital", lpPubMsg);


                // [主动推送][secu.asacposi][证券主推_持仓_资产账户持仓主推消息]
                lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.61", 0);
                lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
                lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT,v_asac_comm_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT,v_asac_comm_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT,v_asac_comm_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT,v_asac_comm_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT,v_asac_trade_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT,v_asac_trade_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT,v_asac_trade_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT,v_asac_trade_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT,v_asac_strike_capt_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT,v_asac_strike_releas_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT,v_asac_strike_frozen_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT,v_asac_strike_unfroz_qty);
                lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
                lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
                lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
                lpPubMsg->SetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT,v_asac_posi_update_times);
                lpPubMsg->SetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT,v_asac_put_impawn_qty);
                glpPubSub_Interface->PubTopics("secu.asacposi", lpPubMsg);

              // end if;
              }

            // end if;
            }

            //调用过程[事务_交易证券_交易_更新改单状态]
            //组织事务请求
            if(lpTSCall1Ans26)
            {
              lpTSCall1Ans26->FreeMsg();
              lpTSCall1Ans26=NULL;
            }
            lpTSCall1Req26=glpFastMsgFactory->CreateFastMessage("tdsecuT.4.61", 0);
            lpTSCall1Req26->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req26->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req26->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req26->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req26->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req26->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req26->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req26->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req26->SetInt32(LDBIZ_MODI_ORDER_DATE_INT,v_modi_order_date);
            lpTSCall1Req26->SetInt64(LDBIZ_MODI_ORDER_ID_INT64,v_modi_order_id);
            lpTSCall1Req26->SetString(LDBIZ_MODI_ORDER_STATUS_STR,v_modi_order_status);
            lpTSCall1Req26->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
            lpTSCall1Req26->SetInt64(LDBIZ_NEW_ORDER_ID_INT64,v_new_order_id);
            glpTSSubcallSerives->SubCall(lpTSCall1Req26, &lpTSCall1Ans26, 5000);
            if(!lpTSCall1Ans26)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.4.61]subcall timed out!");
                iRet=-2;
                goto ENDSYS;
            }
            else if(lpTSCall1Ans26->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans26->GetInt32(LDTAG_ERRORNO));
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans26->GetString(LDTAG_ERRORINFO));
                iRet=-2;
                goto ENDSYS;
            }
            else if(strcmp(lpTSCall1Ans26->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
            {
                strcpy(v_error_code, lpTSCall1Ans26->GetString(LDBIZ_ERROR_CODE_STR));
                strcpy(v_error_info, lpTSCall1Ans26->GetString(LDBIZ_ERROR_INFO_STR));
                iRet=-1;
                goto END;
            }
            //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans26->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans26->GetString(LDBIZ_ERROR_INFO_STR));

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
            //调用过程[事务_交易证券_交易_更新改单状态]
            //组织事务请求
            if(lpTSCall1Ans27)
            {
              lpTSCall1Ans27->FreeMsg();
              lpTSCall1Ans27=NULL;
            }
            lpTSCall1Req27=glpFastMsgFactory->CreateFastMessage("tdsecuT.4.61", 0);
            lpTSCall1Req27->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req27->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req27->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req27->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req27->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req27->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req27->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req27->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req27->SetInt32(LDBIZ_MODI_ORDER_DATE_INT,v_modi_order_date);
            lpTSCall1Req27->SetInt64(LDBIZ_MODI_ORDER_ID_INT64,v_modi_order_id);
            lpTSCall1Req27->SetString(LDBIZ_MODI_ORDER_STATUS_STR,v_modi_order_status);
            lpTSCall1Req27->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
            lpTSCall1Req27->SetInt64(LDBIZ_NEW_ORDER_ID_INT64,v_new_order_id);
            glpTSSubcallSerives->SubCall(lpTSCall1Req27, &lpTSCall1Ans27, 5000);
            if(!lpTSCall1Ans27)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.4.61]subcall timed out!");
                iRet=-2;
                goto ENDSYS;
            }
            else if(lpTSCall1Ans27->GetInt32(LDTAG_ERRORNO)!=0)  //  中间件层面错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, lpTSCall1Ans27->GetInt32(LDTAG_ERRORNO));
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, lpTSCall1Ans27->GetString(LDTAG_ERRORINFO));
                iRet=-2;
                goto ENDSYS;
            }
            else if(strcmp(lpTSCall1Ans27->GetString(LDBIZ_ERROR_CODE_STR), "0")!=0) //  业务层面错误
            {
                strcpy(v_error_code, lpTSCall1Ans27->GetString(LDBIZ_ERROR_CODE_STR));
                strcpy(v_error_info, lpTSCall1Ans27->GetString(LDBIZ_ERROR_INFO_STR));
                iRet=-1;
                goto END;
            }
            //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans27->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans27->GetString(LDBIZ_ERROR_INFO_STR));


            // [报错返回][715][@订单数量#]
                strcpy(v_error_code,"tdsecuL.7.5.715");
                snprintf(v_error_info, sizeof(v_error_info), "%s%018.2f","订单数量=",v_order_qty);
                iRet = -1;
                goto END;

          // end if;
          }

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
        if(lpTSCall1Ans28)
        {
          lpTSCall1Ans28->FreeMsg();
          lpTSCall1Ans28=NULL;
        }
        lpTSCall1Req28=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req28->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req28->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req28->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req28->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req28->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req28->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req28->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req28->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req28->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req28->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req28, &lpTSCall1Ans28, 5000);
        if (lpTSCall1Ans28)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans28->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans28->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans28->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans28->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans28->GetString(LDBIZ_ERROR_DEAL_STR));
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
    lpOutBizMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpOutBizMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
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
    if(lpTSCall1Ans26)
        lpTSCall1Ans26->FreeMsg();
    if(lpTSCall1Ans27)
        lpTSCall1Ans27->FreeMsg();
    if(lpTSCall1Ans28)
        lpTSCall1Ans28->FreeMsg();
    return iRet;
}

//逻辑_交易证券_中泰_指令有效期处理
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

    //调用过程[事务_交易证券_账户_超出期限处理失败组合状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.2.84", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.2.84]subcall timed out!");
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

