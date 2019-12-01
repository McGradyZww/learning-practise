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
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.1");
        bizFuncInfo->lpFunc = fnFunc0;
    }
    else if (iFunIndex==1)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.2");
        bizFuncInfo->lpFunc = fnFunc1;
    }
    else if (iFunIndex==2)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.3");
        bizFuncInfo->lpFunc = fnFunc2;
    }
    else if (iFunIndex==3)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.4");
        bizFuncInfo->lpFunc = fnFunc3;
    }
    else if (iFunIndex==4)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.11");
        bizFuncInfo->lpFunc = fnFunc4;
    }
    else if (iFunIndex==5)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.13");
        bizFuncInfo->lpFunc = fnFunc5;
    }
    else if (iFunIndex==6)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.15");
        bizFuncInfo->lpFunc = fnFunc6;
    }
    else if (iFunIndex==7)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.23");
        bizFuncInfo->lpFunc = fnFunc7;
    }
    else if (iFunIndex==8)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.24");
        bizFuncInfo->lpFunc = fnFunc8;
    }
    else if (iFunIndex==9)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.25");
        bizFuncInfo->lpFunc = fnFunc9;
    }
    else if (iFunIndex==10)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.151");
        bizFuncInfo->lpFunc = fnFunc10;
    }
    else if (iFunIndex==11)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.153");
        bizFuncInfo->lpFunc = fnFunc11;
    }
    else if (iFunIndex==12)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.154");
        bizFuncInfo->lpFunc = fnFunc12;
    }
    else if (iFunIndex==13)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.201");
        bizFuncInfo->lpFunc = fnFunc13;
    }
    else if (iFunIndex==14)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.202");
        bizFuncInfo->lpFunc = fnFunc14;
    }
    else if (iFunIndex==15)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.203");
        bizFuncInfo->lpFunc = fnFunc15;
    }
    else if (iFunIndex==16)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.204");
        bizFuncInfo->lpFunc = fnFunc16;
    }
    else if (iFunIndex==17)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.205");
        bizFuncInfo->lpFunc = fnFunc17;
    }
    else if (iFunIndex==18)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.206");
        bizFuncInfo->lpFunc = fnFunc18;
    }
    else if (iFunIndex==19)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.207");
        bizFuncInfo->lpFunc = fnFunc19;
    }
    else if (iFunIndex==20)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.208");
        bizFuncInfo->lpFunc = fnFunc20;
    }
    else if (iFunIndex==21)
    {
        strcpy(bizFuncInfo->szFuncName, "clsecuL.2.209");
        bizFuncInfo->lpFunc = fnFunc21;
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
    return "20190726";
}

//逻辑_清算证券_清算_转入成交记录
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
    int v_qry_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_record_count;
    char v_deal_info[256];
    int64 v_row_id;
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_undo_error_no;
    double v_pre_entry_qty;
    double v_pre_entry_amt;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    char v_stock_code[7];
    int v_target_stock_code_no;
    char v_target_stock_code[7];
    int v_stock_type;
    int v_asset_type;
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_no;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    double v_all_fee;
    int v_trade_code_no;
    int v_target_code_no;
    int v_capit_reback_days;
    int v_posi_reback_days;
    int v_net_price_flag;
    int v_intrst_days;
    double v_par_value;
    double v_bond_accr_intrst;
    int v_bond_rate_type;
    double v_impawn_ratio;
    int v_strike_deal_type;
    double v_stamp_tax;
    double v_trans_fee;
    double v_brkage_fee;
    double v_SEC_charges;
    double v_other_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_trade_tax;
    double v_trade_cost_fee;
    double v_trade_system_use_fee;
    double v_stock_settle_fee;
    char v_remark_info[256];
    int64 v_busi_jour_no;
    int v_clear_entry_type;
    double v_fee_qty;
    double v_fee_price;
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    double v_settle_buy_rate;
    double v_settle_sell_rate;
    int v_deal_flag;
    int v_settle_date;
    int v_arrive_date;
    int64 v_repo_pd_jour_no;
    int v_repo_days;
    int v_repo_first_settle_date;
    int v_repo_back_date;
    int v_cash_capt_days;
    char v_target_code[7];
    int v_target_code_stock_type;
    int v_target_code_asset_type;
    double v_repo_rate;
    double v_repo_amt;
    double v_repo_qty;
    double v_repo_back_intrst;
    int v_repo_trade_date;
    int v_repo_cale_days;
    int v_repo_back_trade_date;
    int64 v_repo_order_id;
    double v_exch_rate;
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
    v_qry_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_record_count=0;
    strcpy(v_deal_info, " ");
    v_row_id=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_undo_error_no=0;
    v_pre_entry_qty=0;
    v_pre_entry_amt=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    strcpy(v_stock_code, " ");
    v_target_stock_code_no=0;
    strcpy(v_target_stock_code, " ");
    v_stock_type=0;
    v_asset_type=0;
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_no=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_all_fee=0;
    v_trade_code_no=0;
    v_target_code_no=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    v_net_price_flag=0;
    v_intrst_days=0;
    v_par_value=0;
    v_bond_accr_intrst=0;
    v_bond_rate_type=0;
    v_impawn_ratio=0;
    v_strike_deal_type=0;
    v_stamp_tax=0;
    v_trans_fee=0;
    v_brkage_fee=0;
    v_SEC_charges=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_trade_tax=0;
    v_trade_cost_fee=0;
    v_trade_system_use_fee=0;
    v_stock_settle_fee=0;
    strcpy(v_remark_info, " ");
    v_busi_jour_no=0;
    v_clear_entry_type=0;
    v_fee_qty=0;
    v_fee_price=0;
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_settle_buy_rate=0;
    v_settle_sell_rate=0;
    v_deal_flag=0;
    v_settle_date=0;
    v_arrive_date=0;
    v_repo_pd_jour_no=0;
    v_repo_days=0;
    v_repo_first_settle_date=0;
    v_repo_back_date=0;
    v_cash_capt_days=0;
    strcpy(v_target_code, " ");
    v_target_code_stock_type=0;
    v_target_code_asset_type=0;
    v_repo_rate=0;
    v_repo_amt=0;
    v_repo_qty=0;
    v_repo_back_intrst=0;
    v_repo_trade_date=0;
    v_repo_cale_days=0;
    v_repo_back_trade_date=0;
    v_repo_order_id=0;
    v_exch_rate=0;
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
    v_qry_no = lpInBizMsg->GetInt32(LDBIZ_QRY_NO_INT);

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


    // set @回滚异常节点# = 1;
    v_undo_error_no = 1;

    // set @待入账数量# = 0;
    v_pre_entry_qty = 0;

    // set @待入账金额# = 0;
    v_pre_entry_amt = 0;
    //单记录转入方式，以便前台并发处理
    //调用过程[事务_交易证券_接口_处理清算成交回报]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.20.1", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req1->SetInt32(LDBIZ_QRY_NO_INT,v_qry_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.20.1]subcall timed out!");
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
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
    v_record_count = lpTSCall1Ans1->GetInt32(LDBIZ_RECORD_COUNT_INT);
    v_row_id = lpTSCall1Ans1->GetInt64(LDBIZ_ROW_ID_INT64);
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans1->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans1->GetString(LDBIZ_OUT_ACCO_STR));
    v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strcpy(v_stock_code, lpTSCall1Ans1->GetString(LDBIZ_STOCK_CODE_STR));
    v_target_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TARGET_STOCK_CODE_NO_INT);
    strcpy(v_target_stock_code, lpTSCall1Ans1->GetString(LDBIZ_TARGET_STOCK_CODE_STR));
    v_stock_type = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_strike_date = lpTSCall1Ans1->GetInt32(LDBIZ_STRIKE_DATE_INT);
    v_strike_time = lpTSCall1Ans1->GetInt32(LDBIZ_STRIKE_TIME_INT);
    strcpy(v_strike_no, lpTSCall1Ans1->GetString(LDBIZ_STRIKE_NO_STR));
    v_report_date = lpTSCall1Ans1->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpTSCall1Ans1->GetInt32(LDBIZ_REPORT_TIME_INT);
    strcpy(v_report_no, lpTSCall1Ans1->GetString(LDBIZ_REPORT_NO_STR));
    v_order_date = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_order_time = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_order_no = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_NO_INT);
    v_order_dir = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_order_price = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_strike_price = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
    v_strike_qty = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_all_fee = lpTSCall1Ans1->GetDouble(LDBIZ_ALL_FEE_FLOAT);
    v_trade_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
    v_target_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
    v_capit_reback_days = lpTSCall1Ans1->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans1->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    v_net_price_flag = lpTSCall1Ans1->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
    v_intrst_days = lpTSCall1Ans1->GetInt32(LDBIZ_INTRST_DAYS_INT);
    v_par_value = lpTSCall1Ans1->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
    v_bond_accr_intrst = lpTSCall1Ans1->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
    v_bond_rate_type = lpTSCall1Ans1->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
    v_impawn_ratio = lpTSCall1Ans1->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
    v_strike_deal_type = lpTSCall1Ans1->GetInt32(LDBIZ_STRIKE_DEAL_TYPE_INT);
    v_stamp_tax = lpTSCall1Ans1->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
    v_trans_fee = lpTSCall1Ans1->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
    v_brkage_fee = lpTSCall1Ans1->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
    v_SEC_charges = lpTSCall1Ans1->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
    v_other_fee = lpTSCall1Ans1->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
    v_trade_commis = lpTSCall1Ans1->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_other_commis = lpTSCall1Ans1->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    v_trade_tax = lpTSCall1Ans1->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
    v_trade_cost_fee = lpTSCall1Ans1->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
    v_trade_system_use_fee = lpTSCall1Ans1->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
    v_stock_settle_fee = lpTSCall1Ans1->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);


    // if @错误编码# <> "0" then
    if (strcmp(v_error_code , "0")!=0)
    {

        // set @备注信息# = concat("获取成交回报失败:",@错误信息#);
        snprintf(v_remark_info,sizeof(v_remark_info),"%s%s","获取成交回报失败:",v_error_info);
        //调用过程[事务_清算证券_清算_入账异常处理]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
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
        lpTSCall1Req2->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req2->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req2->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req2->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req2->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
        lpTSCall1Req2->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 30000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));

        //set @错误编码// = "0";
        //set @错误信息// = " ";
        // leave label_pro;
        goto END;


    }
    // elseif @记录个数# = 0 then
    else if (v_record_count == 0)
    {

        // set @错误编码# = "0";
        strcpy(v_error_code,"0");

        // set @错误信息# = " ";
        strcpy(v_error_info," ");
        // leave label_pro;
        goto END;

    // end if;
    }


    // set @成交流水号# = @记录序号#;
    v_busi_jour_no = v_row_id;
    //调用过程[事务_公共_清算接口_获取机构业务控制配置串]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.26.71", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.71]subcall timed out!");
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
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
    strcpy(v_co_busi_config_str, lpTSCall1Ans3->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));

    //机构业务控制配置串第9位，清算入账类型
    //set @清算入账类型//=substring(@机构业务控制配置串//, 9,1);

    // set @清算入账类型# = 1;
    v_clear_entry_type = 1;

    // if @市场编号# <>《市场编号-场外交易市场》 then
    if (v_exch_no !=5)
    {

        // set @费用数量# = @成交数量#;
        v_fee_qty = v_strike_qty;

        // set @费用价格# = @成交价格#;
        v_fee_price = v_strike_price;

        // set @成交金额# = @成交价格# * @成交数量#;
        v_strike_amt = v_strike_price * v_strike_qty;
        //获取市场本币币种、交易币种、汇率，并计算证券费用，后续按汇率转换
        //调用过程[事务_公共_清算接口_计算证券清算费用]
        //组织事务请求
        if(lpTSCall1Ans4)
        {
          lpTSCall1Ans4->FreeMsg();
          lpTSCall1Ans4=NULL;
        }
        lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pubT.26.21", 0);
        lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req4->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
        lpTSCall1Req4->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req4->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
        lpTSCall1Req4->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req4->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req4->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpTSCall1Req4->SetDouble(LDBIZ_FEE_QTY_FLOAT,v_fee_qty);
        lpTSCall1Req4->SetDouble(LDBIZ_FEE_PRICE_FLOAT,v_fee_price);
        lpTSCall1Req4->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
        lpTSCall1Req4->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
        lpTSCall1Req4->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
        lpTSCall1Req4->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
        glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
        if(!lpTSCall1Ans4)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.21]subcall timed out!");
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
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans4->GetString(LDBIZ_ERROR_INFO_STR));
        strcpy(v_crncy_type, lpTSCall1Ans4->GetString(LDBIZ_CRNCY_TYPE_STR));
        strcpy(v_exch_crncy_type, lpTSCall1Ans4->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_stamp_tax = lpTSCall1Ans4->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
        v_trans_fee = lpTSCall1Ans4->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
        v_brkage_fee = lpTSCall1Ans4->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
        v_SEC_charges = lpTSCall1Ans4->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
        v_other_fee = lpTSCall1Ans4->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
        v_trade_commis = lpTSCall1Ans4->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_other_commis = lpTSCall1Ans4->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_trade_tax = lpTSCall1Ans4->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
        v_trade_cost_fee = lpTSCall1Ans4->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
        v_trade_system_use_fee = lpTSCall1Ans4->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
        v_stock_settle_fee = lpTSCall1Ans4->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);
        v_settle_buy_rate = lpTSCall1Ans4->GetDouble(LDBIZ_SETTLE_BUY_RATE_FLOAT);
        v_settle_sell_rate = lpTSCall1Ans4->GetDouble(LDBIZ_SETTLE_SELL_RATE_FLOAT);


        // if @错误编码# <> "0" then
        if (strcmp(v_error_code , "0")!=0)
        {

            // set @备注信息# = concat("计算清算费用错误|错误编码=", @错误编码#,"错误信息=", @错误信息#);
            snprintf(v_remark_info,sizeof(v_remark_info),"%s%s%s%s","计算清算费用错误|错误编码=",v_error_code,"错误信息=",v_error_info);
            //调用过程[事务_清算证券_清算_入账异常处理]
            //组织事务请求
            if(lpTSCall1Ans5)
            {
              lpTSCall1Ans5->FreeMsg();
              lpTSCall1Ans5=NULL;
            }
            lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
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
            lpTSCall1Req5->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
            lpTSCall1Req5->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpTSCall1Req5->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req5->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
            lpTSCall1Req5->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
            lpTSCall1Req5->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
            lpTSCall1Req5->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
            lpTSCall1Req5->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
            glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 30000);
            if(!lpTSCall1Ans5)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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
            //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans5->GetString(LDBIZ_ERROR_INFO_STR));


            // set @处理标志# = 《处理标志-处理失败》;
            v_deal_flag = 4;
            //调用过程[事务_交易证券_接口_设置单记录成交回报记录处理标志]
            //组织事务请求
            if(lpTSCall1Ans6)
            {
              lpTSCall1Ans6->FreeMsg();
              lpTSCall1Ans6=NULL;
            }
            lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdsecuT.20.2", 0);
            lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req6->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
            lpTSCall1Req6->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
            lpTSCall1Req6->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
            glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
            if(!lpTSCall1Ans6)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.20.2]subcall timed out!");
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
            //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans6->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans6->GetString(LDBIZ_ERROR_INFO_STR));


            // set @错误编码# = "0";
            strcpy(v_error_code,"0");

            // set @错误信息# = " ";
            strcpy(v_error_info," ");
            // leave label_pro;
            goto END;

        // end if;
        }


        // if @市场编号# =《市场编号-沪港通证券交易所》 or @市场编号# = 《市场编号-深港通证券交易所》 then
        if (v_exch_no ==3 || v_exch_no == 4)
        {
            //调用过程[事务_公共_清算接口_获取港股通交收日期]
            //组织事务请求
            if(lpTSCall1Ans7)
            {
              lpTSCall1Ans7->FreeMsg();
              lpTSCall1Ans7=NULL;
            }
            lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("pubT.26.82", 0);
            lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req7->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
            lpTSCall1Req7->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
            if(!lpTSCall1Ans7)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.82]subcall timed out!");
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
            //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans7->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans7->GetString(LDBIZ_ERROR_INFO_STR));
            v_settle_date = lpTSCall1Ans7->GetInt32(LDBIZ_SETTLE_DATE_INT);


            // if @错误编码# <> "0" then
            if (strcmp(v_error_code , "0")!=0)
            {

                // set @备注信息# = concat("获取港股交收日失败|错误编码=", @错误编码#,"错误信息=", @错误信息#);
                snprintf(v_remark_info,sizeof(v_remark_info),"%s%s%s%s","获取港股交收日失败|错误编码=",v_error_code,"错误信息=",v_error_info);
                //调用过程[事务_清算证券_清算_入账异常处理]
                //组织事务请求
                if(lpTSCall1Ans8)
                {
                  lpTSCall1Ans8->FreeMsg();
                  lpTSCall1Ans8=NULL;
                }
                lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
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
                lpTSCall1Req8->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                lpTSCall1Req8->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                lpTSCall1Req8->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
                lpTSCall1Req8->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
                lpTSCall1Req8->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
                glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 30000);
                if(!lpTSCall1Ans8)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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


                // set @处理标志# = 《处理标志-处理失败》;
                v_deal_flag = 4;
                //调用过程[事务_交易证券_接口_设置单记录成交回报记录处理标志]
                //组织事务请求
                if(lpTSCall1Ans9)
                {
                  lpTSCall1Ans9->FreeMsg();
                  lpTSCall1Ans9=NULL;
                }
                lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("tdsecuT.20.2", 0);
                lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req9->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                lpTSCall1Req9->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
                lpTSCall1Req9->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
                glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
                if(!lpTSCall1Ans9)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.20.2]subcall timed out!");
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
                //获取输出参数值
                strcpy(v_error_code, lpTSCall1Ans9->GetString(LDBIZ_ERROR_CODE_STR));
                strcpy(v_error_info, lpTSCall1Ans9->GetString(LDBIZ_ERROR_INFO_STR));


                // set @错误编码# = "0";
                strcpy(v_error_code,"0");

                // set @错误信息# = " ";
                strcpy(v_error_info," ");
                // leave label_pro;
                goto END;

            // end if;
            }


            // set @到账日期# = @交收日期#;
            v_arrive_date = v_settle_date;
        // end if;
        }


        // if @订单方向# = 《订单方向-质押提交》 or @订单方向# = 《订单方向-质押转回》 then
        if (v_order_dir == 21 || v_order_dir == 22)
        {
            //调用过程[事务_公共_公共接口_获取交易代码编号信息]
            //组织事务请求
            if(lpTSCall1Ans10)
            {
              lpTSCall1Ans10->FreeMsg();
              lpTSCall1Ans10=NULL;
            }
            lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("pubT.24.108", 0);
            lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req10->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
            glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
            if(!lpTSCall1Ans10)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.108]subcall timed out!");
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
            v_stock_type = lpTSCall1Ans10->GetInt32(LDBIZ_STOCK_TYPE_INT);
            v_asset_type = lpTSCall1Ans10->GetInt32(LDBIZ_ASSET_TYPE_INT);

        // end if;
        }


        // set @回购流水号# =0;
        v_repo_pd_jour_no =0;

        // if @订单方向# = 《订单方向-融资回购》 or @订单方向# = 《订单方向-融券回购》 then
        if (v_order_dir == 3 || v_order_dir == 4)
        {
            //回购成交处理, 写入账户系统
            //第一步, 获取回购代码信息
            //调用过程[事务_公共_公共接口_获取编号回购参数信息]
            //组织事务请求
            if(lpTSCall1Ans11)
            {
              lpTSCall1Ans11->FreeMsg();
              lpTSCall1Ans11=NULL;
            }
            lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("pubT.24.107", 0);
            lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req11->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req11->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
            glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
            if(!lpTSCall1Ans11)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.107]subcall timed out!");
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
            v_repo_days = lpTSCall1Ans11->GetInt32(LDBIZ_REPO_DAYS_INT);
            v_repo_first_settle_date = lpTSCall1Ans11->GetInt32(LDBIZ_REPO_FIRST_SETTLE_DATE_INT);
            v_repo_back_date = lpTSCall1Ans11->GetInt32(LDBIZ_REPO_BACK_DATE_INT);
            v_cash_capt_days = lpTSCall1Ans11->GetInt32(LDBIZ_CASH_CAPT_DAYS_INT);
            v_target_code_no = lpTSCall1Ans11->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
            strcpy(v_target_code, lpTSCall1Ans11->GetString(LDBIZ_TARGET_CODE_STR));
            v_target_code_stock_type = lpTSCall1Ans11->GetInt32(LDBIZ_TARGET_CODE_STOCK_TYPE_INT);
            v_target_code_asset_type = lpTSCall1Ans11->GetInt32(LDBIZ_TARGET_CODE_ASSET_TYPE_INT);


            // if @错误编码# <> "0" then
            if (strcmp(v_error_code , "0")!=0)
            {

                // set @备注信息# = concat("获取回购参数失败|错误编码=", @错误编码#,"错误信息=", @错误信息#);
                snprintf(v_remark_info,sizeof(v_remark_info),"%s%s%s%s","获取回购参数失败|错误编码=",v_error_code,"错误信息=",v_error_info);
                //调用过程[事务_清算证券_清算_入账异常处理]
                //组织事务请求
                if(lpTSCall1Ans12)
                {
                  lpTSCall1Ans12->FreeMsg();
                  lpTSCall1Ans12=NULL;
                }
                lpTSCall1Req12=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
                lpTSCall1Req12->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req12->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req12->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req12->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req12->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req12->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req12->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req12->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req12->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                lpTSCall1Req12->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpTSCall1Req12->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpTSCall1Req12->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                lpTSCall1Req12->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpTSCall1Req12->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpTSCall1Req12->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                lpTSCall1Req12->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                lpTSCall1Req12->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
                lpTSCall1Req12->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
                lpTSCall1Req12->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
                glpTSSubcallSerives->SubCall(lpTSCall1Req12, &lpTSCall1Ans12, 30000);
                if(!lpTSCall1Ans12)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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
                //获取输出参数值
                strcpy(v_error_code, lpTSCall1Ans12->GetString(LDBIZ_ERROR_CODE_STR));
                strcpy(v_error_info, lpTSCall1Ans12->GetString(LDBIZ_ERROR_INFO_STR));


                // set @错误编码# = "0";
                strcpy(v_error_code,"0");

                // set @错误信息# = " ";
                strcpy(v_error_info," ");
                // leave label_pro;
                goto END;

            // end if;
            }

            //20180201 证券类型和资产类型, 更改为标的代码的

            // set @证券类型# = @标的代码证券类型#;
            v_stock_type = v_target_code_stock_type;

            // set @资产类型# = @标的代码资产类型#;
            v_asset_type = v_target_code_asset_type;

            // set @证券代码# = @标的代码#;
            strcpy(v_stock_code,v_target_code);
            //第二步, 计算到期利息

            // set @回购利率# = @成交价格#;
            v_repo_rate = v_strike_price;

            // set @回购金额# = @成交数量# * 100;
            v_repo_amt = v_strike_qty * 100;

            // set @回购数量# =@成交数量#;
            v_repo_qty =v_strike_qty;

            // set @回购购回利息# = @回购数量# * @回购利率#;
            v_repo_back_intrst = v_repo_qty * v_repo_rate;

            // set @回购购回利息# = @回购购回利息# * @资金占款天数#;
            v_repo_back_intrst = v_repo_back_intrst * v_cash_capt_days;

            // set @回购购回利息# = @回购购回利息#/365;
            v_repo_back_intrst = v_repo_back_intrst/365;

            // set @回购交易日期# = @成交日期#;
            v_repo_trade_date = v_strike_date;

            // set @回购实际天数# = @资金占款天数#;
            v_repo_cale_days = v_cash_capt_days;

            // set @实际回购到期日期# = @回购到期日期#;
            v_repo_back_trade_date = v_repo_back_date;

            // set @到账日期#=@回购到期日期#;
            v_arrive_date=v_repo_back_date;

            // set @回购委托序号#=@订单编号#;
            v_repo_order_id=v_order_no;
            //第三步, 写入账户系统
            //调用过程[事务_产品证券_清算接口_写入回购记录]
            //组织事务请求
            if(lpTSCall1Ans13)
            {
              lpTSCall1Ans13->FreeMsg();
              lpTSCall1Ans13=NULL;
            }
            lpTSCall1Req13=glpFastMsgFactory->CreateFastMessage("pdsecuT.5.111", 0);
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
            lpTSCall1Req13->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req13->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
            lpTSCall1Req13->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
            lpTSCall1Req13->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
            lpTSCall1Req13->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
            lpTSCall1Req13->SetString(LDBIZ_TARGET_CODE_STR,v_target_code);
            lpTSCall1Req13->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
            lpTSCall1Req13->SetDouble(LDBIZ_REPO_QTY_FLOAT,v_repo_qty);
            lpTSCall1Req13->SetDouble(LDBIZ_REPO_AMT_FLOAT,v_repo_amt);
            lpTSCall1Req13->SetDouble(LDBIZ_REPO_RATE_FLOAT,v_repo_rate);
            lpTSCall1Req13->SetInt32(LDBIZ_REPO_TRADE_DATE_INT,v_repo_trade_date);
            lpTSCall1Req13->SetInt32(LDBIZ_REPO_DAYS_INT,v_repo_days);
            lpTSCall1Req13->SetInt32(LDBIZ_REPO_CALE_DAYS_INT,v_repo_cale_days);
            lpTSCall1Req13->SetDouble(LDBIZ_REPO_BACK_INTRST_FLOAT,v_repo_back_intrst);
            lpTSCall1Req13->SetInt64(LDBIZ_REPO_ORDER_ID_INT64,v_repo_order_id);
            lpTSCall1Req13->SetInt32(LDBIZ_STRIKE_DEAL_TYPE_INT,v_strike_deal_type);
            lpTSCall1Req13->SetInt32(LDBIZ_REPO_BACK_TRADE_DATE_INT,v_repo_back_trade_date);
            lpTSCall1Req13->SetInt32(LDBIZ_REPO_FIRST_SETTLE_DATE_INT,v_repo_first_settle_date);
            glpTSSubcallSerives->SubCall(lpTSCall1Req13, &lpTSCall1Ans13, 5000);
            if(!lpTSCall1Ans13)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.5.111]subcall timed out!");
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


            // if @错误编码# <> "0" then
            if (strcmp(v_error_code , "0")!=0)
            {

                // set @备注信息# = concat("回写产品库回购记录失败| 错误编码=", @错误编码#,"错误信息=", @错误信息#);
                snprintf(v_remark_info,sizeof(v_remark_info),"%s%s%s%s","回写产品库回购记录失败| 错误编码=",v_error_code,"错误信息=",v_error_info);
                //调用过程[事务_清算证券_清算_入账异常处理]
                //组织事务请求
                if(lpTSCall1Ans14)
                {
                  lpTSCall1Ans14->FreeMsg();
                  lpTSCall1Ans14=NULL;
                }
                lpTSCall1Req14=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
                lpTSCall1Req14->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req14->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req14->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req14->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req14->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req14->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req14->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req14->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req14->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                lpTSCall1Req14->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpTSCall1Req14->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpTSCall1Req14->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                lpTSCall1Req14->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpTSCall1Req14->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpTSCall1Req14->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                lpTSCall1Req14->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                lpTSCall1Req14->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
                lpTSCall1Req14->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
                lpTSCall1Req14->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
                glpTSSubcallSerives->SubCall(lpTSCall1Req14, &lpTSCall1Ans14, 30000);
                if(!lpTSCall1Ans14)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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
                //获取输出参数值
                strcpy(v_error_code, lpTSCall1Ans14->GetString(LDBIZ_ERROR_CODE_STR));
                strcpy(v_error_info, lpTSCall1Ans14->GetString(LDBIZ_ERROR_INFO_STR));


                // set @错误编码# = "0";
                strcpy(v_error_code,"0");

                // set @错误信息# = " ";
                strcpy(v_error_info," ");
                // leave label_pro;
                goto END;

            }
            // else
            else
            {


                // set  @回购流水号# = @记录序号#;
                 v_repo_pd_jour_no = v_row_id;
            // end if;
            }

        // end if;
        }


        // set @记录序号# = @成交流水号#;
        v_row_id = v_busi_jour_no;
        //汇率转换

        // if @订单方向# = 《订单方向-买入》 then
        if (v_order_dir == 1)
        {

            // set @汇率# = @卖出结算汇率#;
            v_exch_rate = v_settle_sell_rate;
        }
        // else
        else
        {


            // set @汇率# = @买入结算汇率#;
            v_exch_rate = v_settle_buy_rate;
        // end if;
        }

    }
    // else
    else
    {

    //场外基金成交处理,所有的费用从成交表中获取,不计算

        // set @汇率#=1;
        v_exch_rate=1;

        // set @回购流水号#=0;
        v_repo_pd_jour_no=0;

        // set @到账日期#=@初始化日期#;
        v_arrive_date=v_init_date;
    // end if;
    }

    //调用过程[事务_清算证券_清算_转入成交记录]
    //组织事务请求
    if(lpTSCall1Ans15)
    {
      lpTSCall1Ans15->FreeMsg();
      lpTSCall1Ans15=NULL;
    }
    lpTSCall1Req15=glpFastMsgFactory->CreateFastMessage("clsecuT.2.1", 0);
    lpTSCall1Req15->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req15->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req15->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req15->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req15->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req15->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req15->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req15->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req15->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req15->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req15->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req15->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req15->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req15->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req15->SetDouble(LDBIZ_EXCH_RATE_FLOAT,v_exch_rate);
    lpTSCall1Req15->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req15->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req15->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req15->SetInt32(LDBIZ_TARGET_STOCK_CODE_NO_INT,v_target_stock_code_no);
    lpTSCall1Req15->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req15->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpTSCall1Req15->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
    lpTSCall1Req15->SetInt32(LDBIZ_STRIKE_TIME_INT,v_strike_time);
    lpTSCall1Req15->SetString(LDBIZ_STRIKE_NO_STR,v_strike_no);
    lpTSCall1Req15->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpTSCall1Req15->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
    lpTSCall1Req15->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpTSCall1Req15->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req15->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
    lpTSCall1Req15->SetInt32(LDBIZ_ORDER_NO_INT,v_order_no);
    lpTSCall1Req15->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req15->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req15->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req15->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
    lpTSCall1Req15->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
    lpTSCall1Req15->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
    lpTSCall1Req15->SetDouble(LDBIZ_STAMP_TAX_FLOAT,v_stamp_tax);
    lpTSCall1Req15->SetDouble(LDBIZ_TRANS_FEE_FLOAT,v_trans_fee);
    lpTSCall1Req15->SetDouble(LDBIZ_BRKAGE_FEE_FLOAT,v_brkage_fee);
    lpTSCall1Req15->SetDouble(LDBIZ_SEC_CHARGES_FLOAT,v_SEC_charges);
    lpTSCall1Req15->SetDouble(LDBIZ_OTHER_FEE_FLOAT,v_other_fee);
    lpTSCall1Req15->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
    lpTSCall1Req15->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
    lpTSCall1Req15->SetDouble(LDBIZ_TRADE_TAX_FLOAT,v_trade_tax);
    lpTSCall1Req15->SetDouble(LDBIZ_TRADE_COST_FEE_FLOAT,v_trade_cost_fee);
    lpTSCall1Req15->SetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT,v_trade_system_use_fee);
    lpTSCall1Req15->SetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT,v_stock_settle_fee);
    lpTSCall1Req15->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
    lpTSCall1Req15->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
    lpTSCall1Req15->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
    lpTSCall1Req15->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
    lpTSCall1Req15->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
    lpTSCall1Req15->SetInt32(LDBIZ_ARRIVE_DATE_INT,v_arrive_date);
    lpTSCall1Req15->SetInt32(LDBIZ_INTRST_DAYS_INT,v_intrst_days);
    lpTSCall1Req15->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
    lpTSCall1Req15->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
    lpTSCall1Req15->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
    lpTSCall1Req15->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
    lpTSCall1Req15->SetInt32(LDBIZ_CLEAR_ENTRY_TYPE_INT,v_clear_entry_type);
    lpTSCall1Req15->SetInt32(LDBIZ_STRIKE_DEAL_TYPE_INT,v_strike_deal_type);
    lpTSCall1Req15->SetInt64(LDBIZ_BUSI_JOUR_NO_INT64,v_busi_jour_no);
    lpTSCall1Req15->SetInt64(LDBIZ_REPO_PD_JOUR_NO_INT64,v_repo_pd_jour_no);
    lpTSCall1Req15->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req15, &lpTSCall1Ans15, 5000);
    if(!lpTSCall1Ans15)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.1]subcall timed out!");
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


    // if @错误编码# <> "0"  then
    if (strcmp(v_error_code , "0" )!=0)
    {

        // set @备注信息# = concat("转入成交失败|错误编码=", @错误编码#,"错误信息=", @错误信息#);
        snprintf(v_remark_info,sizeof(v_remark_info),"%s%s%s%s","转入成交失败|错误编码=",v_error_code,"错误信息=",v_error_info);
        //调用过程[事务_清算证券_清算_入账异常处理]
        //组织事务请求
        if(lpTSCall1Ans16)
        {
          lpTSCall1Ans16->FreeMsg();
          lpTSCall1Ans16=NULL;
        }
        lpTSCall1Req16=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
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
        lpTSCall1Req16->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req16->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req16->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req16->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req16->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req16->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
        lpTSCall1Req16->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req16, &lpTSCall1Ans16, 30000);
        if(!lpTSCall1Ans16)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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


        // set @处理标志# = 《处理标志-处理失败》;
        v_deal_flag = 4;
        //调用过程[事务_交易证券_接口_设置单记录成交回报记录处理标志]
        //组织事务请求
        if(lpTSCall1Ans17)
        {
          lpTSCall1Ans17->FreeMsg();
          lpTSCall1Ans17=NULL;
        }
        lpTSCall1Req17=glpFastMsgFactory->CreateFastMessage("tdsecuT.20.2", 0);
        lpTSCall1Req17->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req17->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req17->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req17->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req17->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req17->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req17->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req17->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req17->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req17->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpTSCall1Req17->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
        glpTSSubcallSerives->SubCall(lpTSCall1Req17, &lpTSCall1Ans17, 5000);
        if(!lpTSCall1Ans17)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.20.2]subcall timed out!");
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

        //set @错误编码// = "0";
        //set @错误信息// = " ";
        // leave label_pro;
        goto END;

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
    lpOutBizMsg->SetInt32(LDBIZ_RECORD_COUNT_INT,v_record_count);
    lpOutBizMsg->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
    lpOutBizMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
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

//逻辑_清算证券_清算_转入基金交易记录
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
    int v_qry_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_record_count;
    char v_deal_info[256];
    int64 v_row_id;
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_arrive_date;
    int v_undo_error_no;
    double v_pre_entry_qty;
    double v_pre_entry_amt;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    int v_target_stock_code_no;
    int v_stock_type;
    int v_asset_type;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_no;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    double v_strike_qty;
    double v_strike_amt;
    double v_all_fee;
    double v_stamp_tax;
    double v_trans_fee;
    double v_brkage_fee;
    double v_SEC_charges;
    double v_other_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_trade_tax;
    double v_trade_cost_fee;
    double v_trade_system_use_fee;
    double v_stock_settle_fee;
    int v_busi_flag;
    int v_trade_code_no;
    int v_target_code_no;
    int v_intrst_days;
    double v_bond_accr_intrst;
    int v_bond_rate_type;
    double v_impawn_ratio;
    char v_remark_info[256];
    int v_clear_entry_type;
    double v_exch_rate;
    int v_strike_num;
    double v_strike_price;
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    int64 v_busi_jour_no;
    int64 v_entry_money_jour_no;
    int64 v_entry_exgp_posi_jour_no;
    int64 v_entry_asac_posi_jour_no;
    char v_entry_status[3];
    char v_undo_status[3];
    int v_deal_flag;
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
    v_qry_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_record_count=0;
    strcpy(v_deal_info, " ");
    v_row_id=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_arrive_date=0;
    v_undo_error_no=0;
    v_pre_entry_qty=0;
    v_pre_entry_amt=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_target_stock_code_no=0;
    v_stock_type=0;
    v_asset_type=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_no=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_all_fee=0;
    v_stamp_tax=0;
    v_trans_fee=0;
    v_brkage_fee=0;
    v_SEC_charges=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_trade_tax=0;
    v_trade_cost_fee=0;
    v_trade_system_use_fee=0;
    v_stock_settle_fee=0;
    v_busi_flag=0;
    v_trade_code_no=0;
    v_target_code_no=0;
    v_intrst_days=0;
    v_bond_accr_intrst=0;
    v_bond_rate_type=0;
    v_impawn_ratio=0;
    strcpy(v_remark_info, " ");
    v_clear_entry_type=0;
    v_exch_rate=0;
    v_strike_num=0;
    v_strike_price=0;
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_busi_jour_no=0;
    v_entry_money_jour_no=0;
    v_entry_exgp_posi_jour_no=0;
    v_entry_asac_posi_jour_no=0;
    strcpy(v_entry_status, "0");
    strcpy(v_undo_status, "0");
    v_deal_flag=0;
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
    v_qry_no = lpInBizMsg->GetInt32(LDBIZ_QRY_NO_INT);

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

    //调用过程[事务_公共_公共接口_获取基金交易到账日期]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.24.79", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req1->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.79]subcall timed out!");
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
    strcpy(v_co_busi_config_str, lpTSCall1Ans1->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));
    v_arrive_date = lpTSCall1Ans1->GetInt32(LDBIZ_ARRIVE_DATE_INT);


    // set @回滚异常节点# = 3;
    v_undo_error_no = 3;

    // set @待入账数量# = 0;
    v_pre_entry_qty = 0;

    // set @待入账金额# = 0;
    v_pre_entry_amt = 0;
    //单记录转入方式，以便前台并发处理
    //调用过程[事务_交易证券_接口_处理基金交易记录]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("tdsecuT.20.13", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req2->SetInt32(LDBIZ_QRY_NO_INT,v_qry_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.20.13]subcall timed out!");
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
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
    v_row_id = lpTSCall1Ans2->GetInt64(LDBIZ_ROW_ID_INT64);
    v_record_count = lpTSCall1Ans2->GetInt32(LDBIZ_RECORD_COUNT_INT);
    v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans2->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_target_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_TARGET_STOCK_CODE_NO_INT);
    v_stock_type = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_report_date = lpTSCall1Ans2->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpTSCall1Ans2->GetInt32(LDBIZ_REPORT_TIME_INT);
    strcpy(v_report_no, lpTSCall1Ans2->GetString(LDBIZ_REPORT_NO_STR));
    v_order_date = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_order_time = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_order_no = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_NO_INT);
    v_order_dir = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_order_price = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_all_fee = lpTSCall1Ans2->GetDouble(LDBIZ_ALL_FEE_FLOAT);
    v_stamp_tax = lpTSCall1Ans2->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
    v_trans_fee = lpTSCall1Ans2->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
    v_brkage_fee = lpTSCall1Ans2->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
    v_SEC_charges = lpTSCall1Ans2->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
    v_other_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
    v_trade_commis = lpTSCall1Ans2->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_other_commis = lpTSCall1Ans2->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    v_trade_tax = lpTSCall1Ans2->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
    v_trade_cost_fee = lpTSCall1Ans2->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
    v_trade_system_use_fee = lpTSCall1Ans2->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
    v_stock_settle_fee = lpTSCall1Ans2->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);
    v_busi_flag = lpTSCall1Ans2->GetInt32(LDBIZ_BUSI_FLAG_INT);
    v_trade_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
    v_target_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
    v_intrst_days = lpTSCall1Ans2->GetInt32(LDBIZ_INTRST_DAYS_INT);
    v_bond_accr_intrst = lpTSCall1Ans2->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
    v_bond_rate_type = lpTSCall1Ans2->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
    v_impawn_ratio = lpTSCall1Ans2->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
    v_pre_entry_amt = lpTSCall1Ans2->GetDouble(LDBIZ_PRE_ENTRY_AMT_FLOAT);
    v_pre_entry_qty = lpTSCall1Ans2->GetDouble(LDBIZ_PRE_ENTRY_QTY_FLOAT);


    // if @错误编码# <> "0" then
    if (strcmp(v_error_code , "0")!=0)
    {

        // set @备注信息# = concat("获取基金交易数据失败:",@错误信息#);
        snprintf(v_remark_info,sizeof(v_remark_info),"%s%s","获取基金交易数据失败:",v_error_info);
        //调用过程[事务_清算证券_清算_入账异常处理]
        //组织事务请求
        if(lpTSCall1Ans3)
        {
          lpTSCall1Ans3->FreeMsg();
          lpTSCall1Ans3=NULL;
        }
        lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
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
        lpTSCall1Req3->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req3->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req3->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req3->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req3->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
        lpTSCall1Req3->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 30000);
        if(!lpTSCall1Ans3)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));


        // set @错误编码# = "0";
        strcpy(v_error_code,"0");

        // set @错误信息# = " ";
        strcpy(v_error_info," ");
        // leave label_pro;
        goto END;


    }
    // elseif @记录个数# = 0 then
    else if (v_record_count == 0)
    {

        // set @错误编码# = "0";
        strcpy(v_error_code,"0");

        // set @错误信息# = " ";
        strcpy(v_error_info," ");
        // leave label_pro;
        goto END;

    // end if;
    }


    // set @清算入账类型# = 1;
    v_clear_entry_type = 1;

    // set @汇率# = 1;
    v_exch_rate = 1;

    // set @成交笔数#=0;
    v_strike_num=0;

    // set @成交价格#=0;
    v_strike_price=0;

    // set @成交日期#=0;
    v_strike_date=0;

    // set @成交时间#=0;
    v_strike_time=0;

    // set @成交编号#=0;
    strcpy(v_strike_no,"0");

    // set @成交流水号# = 0;
    v_busi_jour_no = 0;

    // set @入账资金流水号#=0;
    v_entry_money_jour_no=0;

    // set @入账交易组持仓流水号#=0;
    v_entry_exgp_posi_jour_no=0;

    // set @入账资产账户持仓流水号#=0;
    v_entry_asac_posi_jour_no=0;

    // set @入账状态# = 《入账状态-未入账》;
    strcpy(v_entry_status,"2");

    // set @回滚状态# = 《回滚状态-未回滚》;
    strcpy(v_undo_status,"2");
    //调用过程[事务_清算证券_清算_转入基金待入账记录]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("clsecuT.2.6", 0);
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
    lpTSCall1Req4->SetDouble(LDBIZ_EXCH_RATE_FLOAT,v_exch_rate);
    lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req4->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req4->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req4->SetInt32(LDBIZ_TARGET_STOCK_CODE_NO_INT,v_target_stock_code_no);
    lpTSCall1Req4->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req4->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpTSCall1Req4->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
    lpTSCall1Req4->SetInt32(LDBIZ_STRIKE_TIME_INT,v_strike_time);
    lpTSCall1Req4->SetString(LDBIZ_STRIKE_NO_STR,v_strike_no);
    lpTSCall1Req4->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpTSCall1Req4->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
    lpTSCall1Req4->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_NO_INT,v_order_no);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req4->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req4->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req4->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
    lpTSCall1Req4->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
    lpTSCall1Req4->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
    lpTSCall1Req4->SetInt32(LDBIZ_STRIKE_NUM_INT,v_strike_num);
    lpTSCall1Req4->SetDouble(LDBIZ_PRE_ENTRY_QTY_FLOAT,v_pre_entry_qty);
    lpTSCall1Req4->SetDouble(LDBIZ_PRE_ENTRY_AMT_FLOAT,v_pre_entry_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
    lpTSCall1Req4->SetDouble(LDBIZ_STAMP_TAX_FLOAT,v_stamp_tax);
    lpTSCall1Req4->SetDouble(LDBIZ_TRANS_FEE_FLOAT,v_trans_fee);
    lpTSCall1Req4->SetDouble(LDBIZ_BRKAGE_FEE_FLOAT,v_brkage_fee);
    lpTSCall1Req4->SetDouble(LDBIZ_SEC_CHARGES_FLOAT,v_SEC_charges);
    lpTSCall1Req4->SetDouble(LDBIZ_OTHER_FEE_FLOAT,v_other_fee);
    lpTSCall1Req4->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
    lpTSCall1Req4->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
    lpTSCall1Req4->SetDouble(LDBIZ_TRADE_TAX_FLOAT,v_trade_tax);
    lpTSCall1Req4->SetDouble(LDBIZ_TRADE_COST_FEE_FLOAT,v_trade_cost_fee);
    lpTSCall1Req4->SetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT,v_trade_system_use_fee);
    lpTSCall1Req4->SetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT,v_stock_settle_fee);
    lpTSCall1Req4->SetInt32(LDBIZ_BUSI_FLAG_INT,v_busi_flag);
    lpTSCall1Req4->SetString(LDBIZ_ENTRY_STATUS_STR,v_entry_status);
    lpTSCall1Req4->SetString(LDBIZ_UNDO_STATUS_STR,v_undo_status);
    lpTSCall1Req4->SetInt64(LDBIZ_BUSI_JOUR_NO_INT64,v_busi_jour_no);
    lpTSCall1Req4->SetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64,v_entry_money_jour_no);
    lpTSCall1Req4->SetInt64(LDBIZ_ENTRY_EXGP_POSI_JOUR_NO_INT64,v_entry_exgp_posi_jour_no);
    lpTSCall1Req4->SetInt64(LDBIZ_ENTRY_ASAC_POSI_JOUR_NO_INT64,v_entry_asac_posi_jour_no);
    lpTSCall1Req4->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
    lpTSCall1Req4->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
    lpTSCall1Req4->SetInt32(LDBIZ_INTRST_DAYS_INT,v_intrst_days);
    lpTSCall1Req4->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
    lpTSCall1Req4->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
    lpTSCall1Req4->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
    lpTSCall1Req4->SetInt32(LDBIZ_ARRIVE_DATE_INT,v_arrive_date);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.6]subcall timed out!");
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
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans4->GetString(LDBIZ_ERROR_INFO_STR));


    // if @错误编码# <> "0"  then
    if (strcmp(v_error_code , "0" )!=0)
    {

        // set @备注信息# = concat("转入基金交易数据失败|错误编码=", @错误编码#,"错误信息=", @错误信息#);
        snprintf(v_remark_info,sizeof(v_remark_info),"%s%s%s%s","转入基金交易数据失败|错误编码=",v_error_code,"错误信息=",v_error_info);
        //调用过程[事务_清算证券_清算_入账异常处理]
        //组织事务请求
        if(lpTSCall1Ans5)
        {
          lpTSCall1Ans5->FreeMsg();
          lpTSCall1Ans5=NULL;
        }
        lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
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
        lpTSCall1Req5->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpTSCall1Req5->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req5->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req5->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req5->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req5->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req5->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
        lpTSCall1Req5->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 30000);
        if(!lpTSCall1Ans5)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans5->GetString(LDBIZ_ERROR_INFO_STR));


        // set @处理标志# = 《处理标志-处理失败》;
        v_deal_flag = 4;
        //调用过程[事务_交易证券_接口_设置单记录订单记录处理标志]
        //组织事务请求
        if(lpTSCall1Ans6)
        {
          lpTSCall1Ans6->FreeMsg();
          lpTSCall1Ans6=NULL;
        }
        lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdsecuT.20.14", 0);
        lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req6->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req6->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpTSCall1Req6->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
        glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
        if(!lpTSCall1Ans6)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.20.14]subcall timed out!");
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
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans6->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans6->GetString(LDBIZ_ERROR_INFO_STR));


        // set @错误编码# = "0";
        strcpy(v_error_code,"0");

        // set @错误信息# = " ";
        strcpy(v_error_info," ");
        // leave label_pro;
        goto END;

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
        if(lpTSCall1Ans7)
        {
          lpTSCall1Ans7->FreeMsg();
          lpTSCall1Ans7=NULL;
        }
        lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req7->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req7->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
        if (lpTSCall1Ans7)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans7->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans7->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans7->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans7->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans7->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
    lpOutBizMsg->SetInt32(LDBIZ_RECORD_COUNT_INT,v_record_count);
    lpOutBizMsg->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
    lpOutBizMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
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
    return iRet;
}

//逻辑_清算证券_清算_查询成交记录
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
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    char v_exch_no_str[2049];
    int v_stock_acco_no;
    int v_stock_code_no;
    int v_strike_date;
    char v_strike_no[65];
    char v_order_dir_str[1025];
    int v_deal_flag;
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    double v_exch_rate;
    int v_exch_no;
    int v_stock_type;
    int v_strike_time;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_no;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    double v_stamp_tax;
    double v_trans_fee;
    double v_brkage_fee;
    double v_SEC_charges;
    double v_other_fee;
    double v_trade_commis;
    double v_other_commis;
    int v_trade_code_no;
    int v_target_code_no;
    int v_capit_reback_days;
    int v_posi_reback_days;
    int v_net_price_flag;
    int v_intrst_days;
    double v_par_value;
    double v_bond_accr_intrst;
    double v_impawn_ratio;
    int v_clear_entry_type;
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
    strcpy(v_exch_no_str, " ");
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_strike_date=0;
    strcpy(v_strike_no, " ");
    strcpy(v_order_dir_str, " ");
    v_deal_flag=0;
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    v_exch_rate=0;
    v_exch_no=0;
    v_stock_type=0;
    v_strike_time=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_no=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_stamp_tax=0;
    v_trans_fee=0;
    v_brkage_fee=0;
    v_SEC_charges=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_trade_code_no=0;
    v_target_code_no=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    v_net_price_flag=0;
    v_intrst_days=0;
    v_par_value=0;
    v_bond_accr_intrst=0;
    v_impawn_ratio=0;
    v_clear_entry_type=0;
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
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_strike_date = lpInBizMsg->GetInt32(LDBIZ_STRIKE_DATE_INT);
    strncpy(v_strike_no, lpInBizMsg->GetString(LDBIZ_STRIKE_NO_STR),64);
    v_strike_no[64] = '\0';
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    v_deal_flag = lpInBizMsg->GetInt32(LDBIZ_DEAL_FLAG_INT);
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

    //调用过程[事务_清算证券_清算_查询成交记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clsecuT.2.3", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req1->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
    lpTSCall1Req1->SetString(LDBIZ_STRIKE_NO_STR,v_strike_no);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.3]subcall timed out!");
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

//逻辑_清算证券_清算_查询转入成交记录
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
    int v_sett_flag;
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
    char v_out_acco[33];
    int v_exch_no;
    char v_stock_acco[17];
    char v_stock_code[7];
    int v_strike_time;
    char v_strike_no[65];
    int v_report_time;
    char v_report_no[33];
    int v_order_dir;
    double v_order_qty;
    double v_strike_qty;
    char v_remark_info[256];
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
    v_sett_flag=0;
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
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    strcpy(v_stock_acco, " ");
    strcpy(v_stock_code, " ");
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_dir=0;
    v_order_qty=0;
    v_strike_qty=0;
    strcpy(v_remark_info, " ");
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
    v_sett_flag = lpInBizMsg->GetInt32(LDBIZ_SETT_FLAG_INT);

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

    //调用过程[事务_交易证券_接口_查询转入失败成交记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.20.7", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_SETT_FLAG_INT,v_sett_flag);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.20.7]subcall timed out!");
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

//逻辑_清算证券_清算_清算处理
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
    int v_qry_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_record_count;
    char v_deal_info[256];
    int64 v_row_id;
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_undo_error_no;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    int v_stock_type;
    char v_remark_info[256];
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
    v_qry_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_record_count=0;
    strcpy(v_deal_info, " ");
    v_row_id=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_undo_error_no=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_stock_type=0;
    strcpy(v_remark_info, " ");
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
    v_qry_no = lpInBizMsg->GetInt32(LDBIZ_QRY_NO_INT);

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


    // set @回滚异常节点# = 2;
    v_undo_error_no = 2;
    //调用过程[事务_清算证券_清算_清算处理]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clsecuT.2.11", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req1->SetInt32(LDBIZ_QRY_NO_INT,v_qry_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.11]subcall timed out!");
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
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
    v_row_id = lpTSCall1Ans1->GetInt64(LDBIZ_ROW_ID_INT64);
    v_record_count = lpTSCall1Ans1->GetInt32(LDBIZ_RECORD_COUNT_INT);
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_stock_type = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_TYPE_INT);


    // if @错误编码# <> "0" and @记录个数# = 0 then
    if (strcmp(v_error_code , "0")!=0 && v_record_count == 0)
    {

        // set @备注信息# = concat("清算处理-获取成交失败|error_code:",@错误编码#,"|error_info:",@错误信息#);
        snprintf(v_remark_info,sizeof(v_remark_info),"%s%s%s%s","清算处理-获取成交失败|error_code:",v_error_code,"|error_info:",v_error_info);
        //调用过程[事务_清算证券_清算_入账异常处理]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
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
        lpTSCall1Req2->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req2->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req2->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req2->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req2->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
        lpTSCall1Req2->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 30000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));

        //set @错误编码// = "0";
        //set @错误信息// = " ";
        // leave label_pro;
        goto END;

    // end if;
    }


    // if @错误编码# <> "0" and @记录个数# <> 0 then
    if (strcmp(v_error_code , "0")!=0 && v_record_count != 0)
    {

        // set @记录序号# = @查询序号# + 1;
        v_row_id = v_qry_no + 1;

        // set @备注信息# = concat("清算处理失败| 错误编码=", @错误编码#,"错误信息=", @错误信息#);
        snprintf(v_remark_info,sizeof(v_remark_info),"%s%s%s%s","清算处理失败| 错误编码=",v_error_code,"错误信息=",v_error_info);
        //调用过程[事务_清算证券_清算_入账异常处理]
        //组织事务请求
        if(lpTSCall1Ans3)
        {
          lpTSCall1Ans3->FreeMsg();
          lpTSCall1Ans3=NULL;
        }
        lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
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
        lpTSCall1Req3->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req3->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req3->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req3->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req3->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
        lpTSCall1Req3->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 30000);
        if(!lpTSCall1Ans3)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));

        //set @错误编码// = "0";
        //set @错误信息// = " ";
        // leave label_pro;
        goto END;

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
    lpOutBizMsg->SetInt32(LDBIZ_RECORD_COUNT_INT,v_record_count);
    lpOutBizMsg->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
    lpOutBizMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
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

//逻辑_清算证券_清算_查询合并清算记录
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
    int v_strike_date;
    int v_busi_flag;
    int v_deal_flag;
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    double v_exch_rate;
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    int v_strike_time;
    char v_strike_no[65];
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_no;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    int v_strike_num;
    double v_strike_aver_price;
    double v_pre_entry_qty;
    double v_pre_entry_amt;
    double v_split_strike_qty;
    double v_split_strike_amt;
    double v_split_stamp_tax;
    double v_split_trans_fee;
    double v_split_brkage;
    double v_split_SEC_charges;
    double v_split_other_fee;
    double v_split_brkage_commis;
    double v_split_chann_commis;
    double v_split_divi_commis;
    double v_split_other_commis;
    int v_stock_type;
    int v_trade_code_no;
    int v_target_code_no;
    int v_capit_reback_days;
    int v_posi_reback_days;
    int v_net_price_flag;
    int v_intrst_days;
    double v_par_value;
    double v_bond_accr_intrst;
    double v_impawn_ratio;
    int v_clear_entry_type;
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
    v_strike_date=0;
    v_busi_flag=0;
    v_deal_flag=0;
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    v_exch_rate=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_no=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_strike_num=0;
    v_strike_aver_price=0;
    v_pre_entry_qty=0;
    v_pre_entry_amt=0;
    v_split_strike_qty=0;
    v_split_strike_amt=0;
    v_split_stamp_tax=0;
    v_split_trans_fee=0;
    v_split_brkage=0;
    v_split_SEC_charges=0;
    v_split_other_fee=0;
    v_split_brkage_commis=0;
    v_split_chann_commis=0;
    v_split_divi_commis=0;
    v_split_other_commis=0;
    v_stock_type=0;
    v_trade_code_no=0;
    v_target_code_no=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    v_net_price_flag=0;
    v_intrst_days=0;
    v_par_value=0;
    v_bond_accr_intrst=0;
    v_impawn_ratio=0;
    v_clear_entry_type=0;
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
    v_strike_date = lpInBizMsg->GetInt32(LDBIZ_STRIKE_DATE_INT);
    v_busi_flag = lpInBizMsg->GetInt32(LDBIZ_BUSI_FLAG_INT);
    v_deal_flag = lpInBizMsg->GetInt32(LDBIZ_DEAL_FLAG_INT);
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

    //调用过程[事务_清算证券_清算_查询合并清算记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clsecuT.2.14", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
    lpTSCall1Req1->SetInt32(LDBIZ_BUSI_FLAG_INT,v_busi_flag);
    lpTSCall1Req1->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.14]subcall timed out!");
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

//逻辑_清算证券_清算_合并清算处理
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
    int v_qry_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_record_count;
    char v_deal_info[256];
    int64 v_row_id;
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_undo_error_no;
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    double v_exch_rate;
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_no;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    int v_strike_num;
    double v_strike_aver_price;
    double v_pre_entry_qty;
    double v_pre_entry_amt;
    double v_split_strike_qty;
    double v_split_strike_amt;
    double v_split_stamp_tax;
    double v_split_trans_fee;
    double v_split_brkage;
    double v_split_SEC_charges;
    double v_split_other_fee;
    double v_split_brkage_commis;
    double v_split_chann_commis;
    double v_split_divi_commis;
    double v_split_other_commis;
    double v_split_trade_tax;
    double v_split_trade_cost_fee;
    double v_split_trade_system_use_fee;
    double v_split_stock_settle_fee;
    int v_stock_type;
    int v_asset_type;
    int v_trade_code_no;
    int v_target_code_no;
    int v_capit_reback_days;
    int v_posi_reback_days;
    int v_net_price_flag;
    int v_intrst_days;
    double v_par_value;
    double v_bond_accr_intrst;
    double v_impawn_ratio;
    int v_clear_entry_type;
    int v_bond_rate_type;
    int v_busi_flag;
    int v_deal_flag;
    int v_arrive_date;
    char v_remark_info[256];
    double v_fee_qty;
    double v_fee_price;
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    double v_stamp_tax;
    double v_trans_fee;
    double v_brkage_fee;
    double v_SEC_charges;
    double v_other_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_trade_tax;
    double v_trade_cost_fee;
    double v_trade_system_use_fee;
    double v_stock_settle_fee;
    double v_settle_buy_rate;
    double v_settle_sell_rate;
    char v_split_fee_typr_str[65];
    int64 v_entry_jour_no;
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
    v_qry_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_record_count=0;
    strcpy(v_deal_info, " ");
    v_row_id=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_undo_error_no=0;
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    v_exch_rate=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_no=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_strike_num=0;
    v_strike_aver_price=0;
    v_pre_entry_qty=0;
    v_pre_entry_amt=0;
    v_split_strike_qty=0;
    v_split_strike_amt=0;
    v_split_stamp_tax=0;
    v_split_trans_fee=0;
    v_split_brkage=0;
    v_split_SEC_charges=0;
    v_split_other_fee=0;
    v_split_brkage_commis=0;
    v_split_chann_commis=0;
    v_split_divi_commis=0;
    v_split_other_commis=0;
    v_split_trade_tax=0;
    v_split_trade_cost_fee=0;
    v_split_trade_system_use_fee=0;
    v_split_stock_settle_fee=0;
    v_stock_type=0;
    v_asset_type=0;
    v_trade_code_no=0;
    v_target_code_no=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    v_net_price_flag=0;
    v_intrst_days=0;
    v_par_value=0;
    v_bond_accr_intrst=0;
    v_impawn_ratio=0;
    v_clear_entry_type=0;
    v_bond_rate_type=0;
    v_busi_flag=0;
    v_deal_flag=0;
    v_arrive_date=0;
    strcpy(v_remark_info, " ");
    v_fee_qty=0;
    v_fee_price=0;
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_stamp_tax=0;
    v_trans_fee=0;
    v_brkage_fee=0;
    v_SEC_charges=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_trade_tax=0;
    v_trade_cost_fee=0;
    v_trade_system_use_fee=0;
    v_stock_settle_fee=0;
    v_settle_buy_rate=0;
    v_settle_sell_rate=0;
    strcpy(v_split_fee_typr_str, " ");
    v_entry_jour_no=0;
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
    v_qry_no = lpInBizMsg->GetInt32(LDBIZ_QRY_NO_INT);

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


    // set @回滚异常节点# = 3;
    v_undo_error_no = 3;

    // set @成交价格# = 0;
    v_strike_price = 0;

    // set @成交数量# = 0 ;
    v_strike_qty = 0 ;

    // set @成交金额# = 0;
    v_strike_amt = 0;
    //调用过程[事务_清算证券_清算_更新获取合并清算记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clsecuT.2.12", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_QRY_NO_INT,v_qry_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.12]subcall timed out!");
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
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
    v_record_count = lpTSCall1Ans1->GetInt32(LDBIZ_RECORD_COUNT_INT);
    v_row_id = lpTSCall1Ans1->GetInt64(LDBIZ_ROW_ID_INT64);
    v_init_date = lpTSCall1Ans1->GetInt32(LDBIZ_INIT_DATE_INT);
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans1->GetInt32(LDBIZ_PASS_NO_INT);
    v_exch_rate = lpTSCall1Ans1->GetDouble(LDBIZ_EXCH_RATE_FLOAT);
    v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_strike_date = lpTSCall1Ans1->GetInt32(LDBIZ_STRIKE_DATE_INT);
    v_strike_time = lpTSCall1Ans1->GetInt32(LDBIZ_STRIKE_TIME_INT);
    strcpy(v_strike_no, lpTSCall1Ans1->GetString(LDBIZ_STRIKE_NO_STR));
    v_report_date = lpTSCall1Ans1->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpTSCall1Ans1->GetInt32(LDBIZ_REPORT_TIME_INT);
    strcpy(v_report_no, lpTSCall1Ans1->GetString(LDBIZ_REPORT_NO_STR));
    v_order_date = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_order_time = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_order_no = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_NO_INT);
    v_order_dir = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_order_price = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_strike_num = lpTSCall1Ans1->GetInt32(LDBIZ_STRIKE_NUM_INT);
    v_strike_aver_price = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_AVER_PRICE_FLOAT);
    v_pre_entry_qty = lpTSCall1Ans1->GetDouble(LDBIZ_PRE_ENTRY_QTY_FLOAT);
    v_pre_entry_amt = lpTSCall1Ans1->GetDouble(LDBIZ_PRE_ENTRY_AMT_FLOAT);
    v_split_strike_qty = lpTSCall1Ans1->GetDouble(LDBIZ_SPLIT_STRIKE_QTY_FLOAT);
    v_split_strike_amt = lpTSCall1Ans1->GetDouble(LDBIZ_SPLIT_STRIKE_AMT_FLOAT);
    v_split_stamp_tax = lpTSCall1Ans1->GetDouble(LDBIZ_SPLIT_STAMP_TAX_FLOAT);
    v_split_trans_fee = lpTSCall1Ans1->GetDouble(LDBIZ_SPLIT_TRANS_FEE_FLOAT);
    v_split_brkage = lpTSCall1Ans1->GetDouble(LDBIZ_SPLIT_BRKAGE_FLOAT);
    v_split_SEC_charges = lpTSCall1Ans1->GetDouble(LDBIZ_SPLIT_SEC_CHARGES_FLOAT);
    v_split_other_fee = lpTSCall1Ans1->GetDouble(LDBIZ_SPLIT_OTHER_FEE_FLOAT);
    v_split_brkage_commis = lpTSCall1Ans1->GetDouble(LDBIZ_SPLIT_BRKAGE_COMMIS_FLOAT);
    v_split_chann_commis = lpTSCall1Ans1->GetDouble(LDBIZ_SPLIT_CHANN_COMMIS_FLOAT);
    v_split_divi_commis = lpTSCall1Ans1->GetDouble(LDBIZ_SPLIT_DIVI_COMMIS_FLOAT);
    v_split_other_commis = lpTSCall1Ans1->GetDouble(LDBIZ_SPLIT_OTHER_COMMIS_FLOAT);
    v_split_trade_tax = lpTSCall1Ans1->GetDouble(LDBIZ_SPLIT_TRADE_TAX_FLOAT);
    v_split_trade_cost_fee = lpTSCall1Ans1->GetDouble(LDBIZ_SPLIT_TRADE_COST_FEE_FLOAT);
    v_split_trade_system_use_fee = lpTSCall1Ans1->GetDouble(LDBIZ_SPLIT_TRADE_SYSTEM_USE_FEE_FLOAT);
    v_split_stock_settle_fee = lpTSCall1Ans1->GetDouble(LDBIZ_SPLIT_STOCK_SETTLE_FEE_FLOAT);
    v_stock_type = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_trade_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
    v_target_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
    v_capit_reback_days = lpTSCall1Ans1->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans1->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    v_net_price_flag = lpTSCall1Ans1->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
    v_intrst_days = lpTSCall1Ans1->GetInt32(LDBIZ_INTRST_DAYS_INT);
    v_par_value = lpTSCall1Ans1->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
    v_bond_accr_intrst = lpTSCall1Ans1->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
    v_impawn_ratio = lpTSCall1Ans1->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
    v_clear_entry_type = lpTSCall1Ans1->GetInt32(LDBIZ_CLEAR_ENTRY_TYPE_INT);
    v_bond_rate_type = lpTSCall1Ans1->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
    v_busi_flag = lpTSCall1Ans1->GetInt32(LDBIZ_BUSI_FLAG_INT);
    v_deal_flag = lpTSCall1Ans1->GetInt32(LDBIZ_DEAL_FLAG_INT);
    v_arrive_date = lpTSCall1Ans1->GetInt32(LDBIZ_ARRIVE_DATE_INT);


    // if @错误编码# <> "0" and @记录个数# = 0 then
    if (strcmp(v_error_code , "0")!=0 && v_record_count == 0)
    {

        // set @备注信息# = concat("更新获取合并清算失败|error_code:",@错误编码#,"|error_info:",@错误信息#);
        snprintf(v_remark_info,sizeof(v_remark_info),"%s%s%s%s","更新获取合并清算失败|error_code:",v_error_code,"|error_info:",v_error_info);
        //调用过程[事务_清算证券_清算_入账异常处理]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
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
        lpTSCall1Req2->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req2->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req2->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req2->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req2->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
        lpTSCall1Req2->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 30000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));

        //set @错误编码// = "0";
        //set @错误信息// = " ";
        // leave label_pro;
        goto END;

    // end if;
    }


    // set @费用数量#=@分笔累计成交数量#;
    v_fee_qty=v_split_strike_qty;

    // set @费用价格#=@成交均价#;
    v_fee_price=v_strike_aver_price;
    //计算合并清算证券费用
    //调用过程[事务_公共_清算接口_计算证券清算费用]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.26.21", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
    lpTSCall1Req3->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req3->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req3->SetDouble(LDBIZ_FEE_QTY_FLOAT,v_fee_qty);
    lpTSCall1Req3->SetDouble(LDBIZ_FEE_PRICE_FLOAT,v_fee_price);
    lpTSCall1Req3->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
    lpTSCall1Req3->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
    lpTSCall1Req3->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
    lpTSCall1Req3->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.21]subcall timed out!");
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
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
    strcpy(v_crncy_type, lpTSCall1Ans3->GetString(LDBIZ_CRNCY_TYPE_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans3->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_stamp_tax = lpTSCall1Ans3->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
    v_trans_fee = lpTSCall1Ans3->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
    v_brkage_fee = lpTSCall1Ans3->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
    v_SEC_charges = lpTSCall1Ans3->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
    v_other_fee = lpTSCall1Ans3->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
    v_trade_commis = lpTSCall1Ans3->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_other_commis = lpTSCall1Ans3->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    v_trade_tax = lpTSCall1Ans3->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
    v_trade_cost_fee = lpTSCall1Ans3->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
    v_trade_system_use_fee = lpTSCall1Ans3->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
    v_stock_settle_fee = lpTSCall1Ans3->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);
    v_settle_buy_rate = lpTSCall1Ans3->GetDouble(LDBIZ_SETTLE_BUY_RATE_FLOAT);
    v_settle_sell_rate = lpTSCall1Ans3->GetDouble(LDBIZ_SETTLE_SELL_RATE_FLOAT);


    // if @错误编码# <> "0" then
    if (strcmp(v_error_code , "0")!=0)
    {

        // set @处理信息# = concat("错误编码=", @错误编码#,"错误信息=", @错误信息#);
        snprintf(v_deal_info,sizeof(v_deal_info),"%s%s%s%s","错误编码=",v_error_code,"错误信息=",v_error_info);

        // set @处理标志# = 《处理标志-处理失败》;
        v_deal_flag = 4;
        //调用过程[事务_清算证券_清算_设置合并清算记录处理标志]
        //组织事务请求
        if(lpTSCall1Ans4)
        {
          lpTSCall1Ans4->FreeMsg();
          lpTSCall1Ans4=NULL;
        }
        lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("clsecuT.2.13", 0);
        lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req4->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpTSCall1Req4->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
        glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
        if(!lpTSCall1Ans4)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.13]subcall timed out!");
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
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans4->GetString(LDBIZ_ERROR_INFO_STR));


        // set @记录序号# = @查询序号# + 1;
        v_row_id = v_qry_no + 1;

        // set @错误编码# = "0";
        strcpy(v_error_code,"0");

        // set @错误信息# = " ";
        strcpy(v_error_info," ");
        // leave label_pro;
        goto END;

    // end if;
    }

    //取系统配置分笔费用类型
    //调用过程[事务_产品_清算接口_获取资产账户分笔费用类型串]
    //组织事务请求
    if(lpTSCall1Ans5)
    {
      lpTSCall1Ans5->FreeMsg();
      lpTSCall1Ans5=NULL;
    }
    lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("prodT.7.33", 0);
    lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req5->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 60000);
    if(!lpTSCall1Ans5)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.7.33]subcall timed out!");
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
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans5->GetString(LDBIZ_ERROR_INFO_STR));
    strcpy(v_split_fee_typr_str, lpTSCall1Ans5->GetString(LDBIZ_SPLIT_FEE_TYPR_STR_STR));


    // if @错误编码# <> "0" then
    if (strcmp(v_error_code , "0")!=0)
    {

        // set @分笔费用类型串#="";
        strcpy(v_split_fee_typr_str,"");
    }
    // else
    else
    {


        // set @分笔费用类型串#=concat(";", @分笔费用类型串#, ";");
        snprintf(v_split_fee_typr_str,sizeof(v_split_fee_typr_str),"%s%s%s",";",v_split_fee_typr_str,";");
    // end if;
    }

    //调用过程[事务_清算证券_清算_合并清算处理]
    //组织事务请求
    if(lpTSCall1Ans6)
    {
      lpTSCall1Ans6->FreeMsg();
      lpTSCall1Ans6=NULL;
    }
    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("clsecuT.2.15", 0);
    lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req6->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req6->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req6->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req6->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req6->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req6->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req6->SetDouble(LDBIZ_EXCH_RATE_FLOAT,v_exch_rate);
    lpTSCall1Req6->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req6->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req6->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req6->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
    lpTSCall1Req6->SetInt32(LDBIZ_STRIKE_TIME_INT,v_strike_time);
    lpTSCall1Req6->SetString(LDBIZ_STRIKE_NO_STR,v_strike_no);
    lpTSCall1Req6->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpTSCall1Req6->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
    lpTSCall1Req6->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpTSCall1Req6->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req6->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
    lpTSCall1Req6->SetInt32(LDBIZ_ORDER_NO_INT,v_order_no);
    lpTSCall1Req6->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req6->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req6->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req6->SetDouble(LDBIZ_STRIKE_AVER_PRICE_FLOAT,v_strike_aver_price);
    lpTSCall1Req6->SetInt32(LDBIZ_STRIKE_NUM_INT,v_strike_num);
    lpTSCall1Req6->SetDouble(LDBIZ_SPLIT_STRIKE_QTY_FLOAT,v_split_strike_qty);
    lpTSCall1Req6->SetDouble(LDBIZ_SPLIT_STRIKE_AMT_FLOAT,v_split_strike_amt);
    lpTSCall1Req6->SetDouble(LDBIZ_SPLIT_STAMP_TAX_FLOAT,v_split_stamp_tax);
    lpTSCall1Req6->SetDouble(LDBIZ_SPLIT_TRANS_FEE_FLOAT,v_split_trans_fee);
    lpTSCall1Req6->SetDouble(LDBIZ_SPLIT_BRKAGE_FLOAT,v_split_brkage);
    lpTSCall1Req6->SetDouble(LDBIZ_SPLIT_SEC_CHARGES_FLOAT,v_split_SEC_charges);
    lpTSCall1Req6->SetDouble(LDBIZ_SPLIT_OTHER_FEE_FLOAT,v_split_other_fee);
    lpTSCall1Req6->SetDouble(LDBIZ_SPLIT_BRKAGE_COMMIS_FLOAT,v_split_brkage_commis);
    lpTSCall1Req6->SetDouble(LDBIZ_SPLIT_OTHER_COMMIS_FLOAT,v_split_other_commis);
    lpTSCall1Req6->SetDouble(LDBIZ_SPLIT_TRADE_TAX_FLOAT,v_split_trade_tax);
    lpTSCall1Req6->SetDouble(LDBIZ_SPLIT_TRADE_COST_FEE_FLOAT,v_split_trade_cost_fee);
    lpTSCall1Req6->SetDouble(LDBIZ_SPLIT_TRADE_SYSTEM_USE_FEE_FLOAT,v_split_trade_system_use_fee);
    lpTSCall1Req6->SetDouble(LDBIZ_SPLIT_STOCK_SETTLE_FEE_FLOAT,v_split_stock_settle_fee);
    lpTSCall1Req6->SetDouble(LDBIZ_STAMP_TAX_FLOAT,v_stamp_tax);
    lpTSCall1Req6->SetDouble(LDBIZ_TRANS_FEE_FLOAT,v_trans_fee);
    lpTSCall1Req6->SetDouble(LDBIZ_BRKAGE_FEE_FLOAT,v_brkage_fee);
    lpTSCall1Req6->SetDouble(LDBIZ_SEC_CHARGES_FLOAT,v_SEC_charges);
    lpTSCall1Req6->SetDouble(LDBIZ_OTHER_FEE_FLOAT,v_other_fee);
    lpTSCall1Req6->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
    lpTSCall1Req6->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
    lpTSCall1Req6->SetDouble(LDBIZ_TRADE_TAX_FLOAT,v_trade_tax);
    lpTSCall1Req6->SetDouble(LDBIZ_TRADE_COST_FEE_FLOAT,v_trade_cost_fee);
    lpTSCall1Req6->SetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT,v_trade_system_use_fee);
    lpTSCall1Req6->SetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT,v_stock_settle_fee);
    lpTSCall1Req6->SetInt32(LDBIZ_BUSI_FLAG_INT,v_busi_flag);
    lpTSCall1Req6->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
    lpTSCall1Req6->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
    lpTSCall1Req6->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
    lpTSCall1Req6->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
    lpTSCall1Req6->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req6->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpTSCall1Req6->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
    lpTSCall1Req6->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
    lpTSCall1Req6->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
    lpTSCall1Req6->SetInt32(LDBIZ_ARRIVE_DATE_INT,v_arrive_date);
    lpTSCall1Req6->SetInt32(LDBIZ_INTRST_DAYS_INT,v_intrst_days);
    lpTSCall1Req6->SetInt32(LDBIZ_CLEAR_ENTRY_TYPE_INT,v_clear_entry_type);
    lpTSCall1Req6->SetString(LDBIZ_SPLIT_FEE_TYPR_STR_STR,v_split_fee_typr_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
    if(!lpTSCall1Ans6)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.15]subcall timed out!");
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
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans6->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans6->GetString(LDBIZ_ERROR_INFO_STR));
    v_entry_jour_no = lpTSCall1Ans6->GetInt64(LDBIZ_ENTRY_JOUR_NO_INT64);


    // if @错误编码# <> "0" then
    if (strcmp(v_error_code , "0")!=0)
    {

        // set @记录序号# = @查询序号# + 1;
        v_row_id = v_qry_no + 1;

        // set @备注信息# = concat("合并清算处理失败|错误编码=", @错误编码#,"错误信息=", @错误信息#);
        snprintf(v_remark_info,sizeof(v_remark_info),"%s%s%s%s","合并清算处理失败|错误编码=",v_error_code,"错误信息=",v_error_info);
        //调用过程[事务_清算证券_清算_入账异常处理]
        //组织事务请求
        if(lpTSCall1Ans7)
        {
          lpTSCall1Ans7->FreeMsg();
          lpTSCall1Ans7=NULL;
        }
        lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
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
        lpTSCall1Req7->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req7->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req7->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req7->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req7->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
        lpTSCall1Req7->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 30000);
        if(!lpTSCall1Ans7)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans7->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans7->GetString(LDBIZ_ERROR_INFO_STR));

        //调用过程[事务_清算证券_清算_设置合并清算记录处理标志]
        //组织事务请求
        if(lpTSCall1Ans8)
        {
          lpTSCall1Ans8->FreeMsg();
          lpTSCall1Ans8=NULL;
        }
        lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("clsecuT.2.13", 0);
        lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req8->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpTSCall1Req8->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
        glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
        if(!lpTSCall1Ans8)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.13]subcall timed out!");
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


        // set @记录序号# = @查询序号# + 1;
        v_row_id = v_qry_no + 1;
        //set @错误编码// = "0";
        //set @错误信息// = " ";
        // leave label_pro;
        goto END;

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
    lpOutBizMsg->SetInt32(LDBIZ_RECORD_COUNT_INT,v_record_count);
    lpOutBizMsg->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
    lpOutBizMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
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

//逻辑_清算证券_清算_查询待入账记录
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
    int v_asset_acco_no;
    char v_exch_no_str[2049];
    int v_stock_acco_no;
    int v_stock_code_no;
    char v_crncy_type_str[2049];
    char v_entry_status[3];
    char v_undo_status[3];
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    double v_exch_rate;
    int v_exch_no;
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_no;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    int v_strike_num;
    double v_pre_entry_qty;
    double v_pre_entry_amt;
    double v_all_fee;
    double v_stamp_tax;
    double v_trans_fee;
    double v_brkage_fee;
    double v_SEC_charges;
    double v_other_fee;
    double v_trade_commis;
    double v_other_commis;
    int v_busi_flag;
    int64 v_busi_jour_no;
    int64 v_entry_money_jour_no;
    int v_stock_type;
    int v_trade_code_no;
    int v_target_code_no;
    int v_intrst_days;
    double v_bond_accr_intrst;
    double v_impawn_ratio;
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
    strcpy(v_exch_no_str, " ");
    v_stock_acco_no=0;
    v_stock_code_no=0;
    strcpy(v_crncy_type_str, " ");
    strcpy(v_entry_status, "0");
    strcpy(v_undo_status, "0");
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    v_exch_rate=0;
    v_exch_no=0;
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_no=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_strike_num=0;
    v_pre_entry_qty=0;
    v_pre_entry_amt=0;
    v_all_fee=0;
    v_stamp_tax=0;
    v_trans_fee=0;
    v_brkage_fee=0;
    v_SEC_charges=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_busi_flag=0;
    v_busi_jour_no=0;
    v_entry_money_jour_no=0;
    v_stock_type=0;
    v_trade_code_no=0;
    v_target_code_no=0;
    v_intrst_days=0;
    v_bond_accr_intrst=0;
    v_impawn_ratio=0;
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
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strncpy(v_crncy_type_str, lpInBizMsg->GetString(LDBIZ_CRNCY_TYPE_STR_STR),2048);
    v_crncy_type_str[2048] = '\0';
    strncpy(v_entry_status, lpInBizMsg->GetString(LDBIZ_ENTRY_STATUS_STR),2);
    v_entry_status[2] = '\0';
    strncpy(v_undo_status, lpInBizMsg->GetString(LDBIZ_UNDO_STATUS_STR),2);
    v_undo_status[2] = '\0';
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

    //调用过程[事务_清算证券_清算_查询待入账记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clsecuT.2.26", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req1->SetString(LDBIZ_CRNCY_TYPE_STR_STR,v_crncy_type_str);
    lpTSCall1Req1->SetString(LDBIZ_ENTRY_STATUS_STR,v_entry_status);
    lpTSCall1Req1->SetString(LDBIZ_UNDO_STATUS_STR,v_undo_status);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.26]subcall timed out!");
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

//逻辑_清算证券_清算_入账处理
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
    int v_qry_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_record_count;
    int64 v_row_id;
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_undo_error_no;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    double v_exch_rate;
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    int v_target_stock_code_no;
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_no;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    int v_strike_num;
    double v_pre_entry_qty;
    double v_pre_entry_amt;
    double v_all_fee;
    double v_stamp_tax;
    double v_trans_fee;
    double v_brkage_fee;
    double v_SEC_charges;
    double v_other_fee;
    double v_trade_commis;
    double v_chann_commis;
    double v_divi_commis;
    double v_other_commis;
    int v_busi_flag;
    char v_entry_status[3];
    char v_undo_status[3];
    int64 v_busi_jour_no;
    int64 v_entry_money_jour_no;
    int64 v_entry_posi_jour_no;
    int64 v_deli_jour_no;
    int v_stock_type;
    int v_asset_type;
    int v_trade_code_no;
    int v_target_code_no;
    int v_intrst_days;
    double v_bond_accr_intrst;
    int v_bond_rate_type;
    double v_impawn_ratio;
    int v_arrive_date;
    int v_repo_back_date;
    char v_remark_info[256];
    int v_cost_calc_type;
    int v_intrst_entry_type;
    char v_tmp_error_info[256];
    double v_occur_amt;
    double v_occur_qty;
    int64 v_entry_exgp_posi_jour_no;
    int64 v_entry_asac_posi_jour_no;
    double v_curr_amt;
    double v_frozen_amt;
    double v_unfroz_amt;
    double v_total_rece_amt;
    double v_total_payab_amt;
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
    v_qry_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_record_count=0;
    v_row_id=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_undo_error_no=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_rate=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_target_stock_code_no=0;
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_no=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_strike_num=0;
    v_pre_entry_qty=0;
    v_pre_entry_amt=0;
    v_all_fee=0;
    v_stamp_tax=0;
    v_trans_fee=0;
    v_brkage_fee=0;
    v_SEC_charges=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_chann_commis=0;
    v_divi_commis=0;
    v_other_commis=0;
    v_busi_flag=0;
    strcpy(v_entry_status, "0");
    strcpy(v_undo_status, "0");
    v_busi_jour_no=0;
    v_entry_money_jour_no=0;
    v_entry_posi_jour_no=0;
    v_deli_jour_no=0;
    v_stock_type=0;
    v_asset_type=0;
    v_trade_code_no=0;
    v_target_code_no=0;
    v_intrst_days=0;
    v_bond_accr_intrst=0;
    v_bond_rate_type=0;
    v_impawn_ratio=0;
    v_arrive_date=0;
    v_repo_back_date=0;
    strcpy(v_remark_info, " ");
    v_cost_calc_type=0;
    v_intrst_entry_type=0;
    strcpy(v_tmp_error_info, " ");
    v_occur_amt=0;
    v_occur_qty=0;
    v_entry_exgp_posi_jour_no=0;
    v_entry_asac_posi_jour_no=0;
    v_curr_amt=0;
    v_frozen_amt=0;
    v_unfroz_amt=0;
    v_total_rece_amt=0;
    v_total_payab_amt=0;
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
    v_qry_no = lpInBizMsg->GetInt32(LDBIZ_QRY_NO_INT);

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


    // set @回滚异常节点# = 4;
    v_undo_error_no = 4;
    //调用过程[事务_清算证券_清算_更新获取待入账记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clsecuT.2.24", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req1->SetInt32(LDBIZ_QRY_NO_INT,v_qry_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 30000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.24]subcall timed out!");
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
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
    v_record_count = lpTSCall1Ans1->GetInt32(LDBIZ_RECORD_COUNT_INT);
    v_row_id = lpTSCall1Ans1->GetInt64(LDBIZ_ROW_ID_INT64);
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_rate = lpTSCall1Ans1->GetDouble(LDBIZ_EXCH_RATE_FLOAT);
    v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_target_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TARGET_STOCK_CODE_NO_INT);
    v_strike_date = lpTSCall1Ans1->GetInt32(LDBIZ_STRIKE_DATE_INT);
    v_strike_time = lpTSCall1Ans1->GetInt32(LDBIZ_STRIKE_TIME_INT);
    strcpy(v_strike_no, lpTSCall1Ans1->GetString(LDBIZ_STRIKE_NO_STR));
    v_report_date = lpTSCall1Ans1->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpTSCall1Ans1->GetInt32(LDBIZ_REPORT_TIME_INT);
    strcpy(v_report_no, lpTSCall1Ans1->GetString(LDBIZ_REPORT_NO_STR));
    v_order_date = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_order_time = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_order_no = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_NO_INT);
    v_order_dir = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_order_price = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_strike_price = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
    v_strike_qty = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_num = lpTSCall1Ans1->GetInt32(LDBIZ_STRIKE_NUM_INT);
    v_pre_entry_qty = lpTSCall1Ans1->GetDouble(LDBIZ_PRE_ENTRY_QTY_FLOAT);
    v_pre_entry_amt = lpTSCall1Ans1->GetDouble(LDBIZ_PRE_ENTRY_AMT_FLOAT);
    v_all_fee = lpTSCall1Ans1->GetDouble(LDBIZ_ALL_FEE_FLOAT);
    v_stamp_tax = lpTSCall1Ans1->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
    v_trans_fee = lpTSCall1Ans1->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
    v_brkage_fee = lpTSCall1Ans1->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
    v_SEC_charges = lpTSCall1Ans1->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
    v_other_fee = lpTSCall1Ans1->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
    v_trade_commis = lpTSCall1Ans1->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_chann_commis = lpTSCall1Ans1->GetDouble(LDBIZ_CHANN_COMMIS_FLOAT);
    v_divi_commis = lpTSCall1Ans1->GetDouble(LDBIZ_DIVI_COMMIS_FLOAT);
    v_other_commis = lpTSCall1Ans1->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    v_busi_flag = lpTSCall1Ans1->GetInt32(LDBIZ_BUSI_FLAG_INT);
    strcpy(v_entry_status, lpTSCall1Ans1->GetString(LDBIZ_ENTRY_STATUS_STR));
    strcpy(v_undo_status, lpTSCall1Ans1->GetString(LDBIZ_UNDO_STATUS_STR));
    v_busi_jour_no = lpTSCall1Ans1->GetInt64(LDBIZ_BUSI_JOUR_NO_INT64);
    v_entry_money_jour_no = lpTSCall1Ans1->GetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
    v_entry_posi_jour_no = lpTSCall1Ans1->GetInt64(LDBIZ_ENTRY_POSI_JOUR_NO_INT64);
    v_deli_jour_no = lpTSCall1Ans1->GetInt64(LDBIZ_DELI_JOUR_NO_INT64);
    v_stock_type = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_trade_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
    v_target_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
    v_intrst_days = lpTSCall1Ans1->GetInt32(LDBIZ_INTRST_DAYS_INT);
    v_bond_accr_intrst = lpTSCall1Ans1->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
    v_bond_rate_type = lpTSCall1Ans1->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
    v_impawn_ratio = lpTSCall1Ans1->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
    v_arrive_date = lpTSCall1Ans1->GetInt32(LDBIZ_ARRIVE_DATE_INT);
    v_repo_back_date = lpTSCall1Ans1->GetInt32(LDBIZ_REPO_BACK_DATE_INT);


    // if @错误编码# <> "0" then
    if (strcmp(v_error_code , "0")!=0)
    {

        // set @备注信息# = concat("入账处理-更新获取待入账失败|error_code:",@错误编码#,"|error_info:",@错误信息#);
        snprintf(v_remark_info,sizeof(v_remark_info),"%s%s%s%s","入账处理-更新获取待入账失败|error_code:",v_error_code,"|error_info:",v_error_info);
        //调用过程[事务_清算证券_清算_入账异常处理]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
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
        lpTSCall1Req2->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req2->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req2->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req2->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req2->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
        lpTSCall1Req2->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 30000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));

        //set @错误编码// = "0";
        //set @错误信息// = " ";
        // leave label_pro;
        goto END;

    // end if;
    }

    //调用过程[事务_产品_清算接口_获取产品成本计算方式]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("prodT.7.41", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 30000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.7.41]subcall timed out!");
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
    //获取输出参数值
    strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
    strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
    v_cost_calc_type = lpTSCall1Ans3->GetInt32(LDBIZ_COST_CALC_TYPE_INT);

    //[事务_公共_清算接口_获取机构业务控制配置串][N]
    //机构业务控制配置串第8位，红利入账成本盈亏计算方式

    // set @红利入账成本盈亏计算方式#=substring(@机构业务控制配置串#, 8,1);
    v_intrst_entry_type=v_co_busi_config_str[7];
    //机构业务控制配置串第9位，清算入账类型
    //set @清算入账类型//=substring(@机构业务控制配置串//, 9,1);

    // set @临时_错误信息#="";
    strcpy(v_tmp_error_info,"");
    //证券资金入账处理，红股、购回不处理

    // if @待入账金额# <> 0 or @待入账数量# <> 0 then
    if (v_pre_entry_amt != 0 || v_pre_entry_qty != 0)
    {

        // set @变动金额#=@待入账金额#;
        v_occur_amt=v_pre_entry_amt;

        // set @变动数量#=@待入账数量#;
        v_occur_qty=v_pre_entry_qty;

        // set @备注信息#="清算证券清算入账处理";
        strcpy(v_remark_info,"清算证券清算入账处理");
        //调用过程[事务_产品证券_清算接口_清算资金持仓入账]
        //组织事务请求
        if(lpTSCall1Ans4)
        {
          lpTSCall1Ans4->FreeMsg();
          lpTSCall1Ans4=NULL;
        }
        lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pdsecuT.5.101", 0);
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
        lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req4->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req4->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req4->SetInt32(LDBIZ_TARGET_STOCK_CODE_NO_INT,v_target_stock_code_no);
        lpTSCall1Req4->SetDouble(LDBIZ_OCCUR_AMT_FLOAT,v_occur_amt);
        lpTSCall1Req4->SetDouble(LDBIZ_OCCUR_QTY_FLOAT,v_occur_qty);
        lpTSCall1Req4->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpTSCall1Req4->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req4->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
        lpTSCall1Req4->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
        lpTSCall1Req4->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
        lpTSCall1Req4->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
        lpTSCall1Req4->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
        lpTSCall1Req4->SetInt32(LDBIZ_COST_CALC_TYPE_INT,v_cost_calc_type);
        lpTSCall1Req4->SetInt32(LDBIZ_INTRST_ENTRY_TYPE_INT,v_intrst_entry_type);
        lpTSCall1Req4->SetInt32(LDBIZ_BUSI_FLAG_INT,v_busi_flag);
        lpTSCall1Req4->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
        lpTSCall1Req4->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
        lpTSCall1Req4->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
        lpTSCall1Req4->SetInt32(LDBIZ_ARRIVE_DATE_INT,v_arrive_date);
        lpTSCall1Req4->SetInt32(LDBIZ_ORDER_NO_INT,v_order_no);
        lpTSCall1Req4->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 30000);
        if(!lpTSCall1Ans4)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.5.101]subcall timed out!");
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
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans4->GetString(LDBIZ_ERROR_INFO_STR));
        v_entry_money_jour_no = lpTSCall1Ans4->GetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
        v_entry_exgp_posi_jour_no = lpTSCall1Ans4->GetInt64(LDBIZ_ENTRY_EXGP_POSI_JOUR_NO_INT64);
        v_entry_asac_posi_jour_no = lpTSCall1Ans4->GetInt64(LDBIZ_ENTRY_ASAC_POSI_JOUR_NO_INT64);


        // if @错误编码# <> "0" then
        if (strcmp(v_error_code , "0")!=0)
        {

            // set @备注信息# = concat("清算入账处理失败|错误编码=", @错误编码#,"错误信息=", @错误信息#);
            snprintf(v_remark_info,sizeof(v_remark_info),"%s%s%s%s","清算入账处理失败|错误编码=",v_error_code,"错误信息=",v_error_info);
            //调用过程[事务_清算证券_清算_入账异常处理]
            //组织事务请求
            if(lpTSCall1Ans5)
            {
              lpTSCall1Ans5->FreeMsg();
              lpTSCall1Ans5=NULL;
            }
            lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
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
            lpTSCall1Req5->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
            lpTSCall1Req5->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpTSCall1Req5->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req5->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
            lpTSCall1Req5->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
            lpTSCall1Req5->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
            lpTSCall1Req5->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
            lpTSCall1Req5->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
            glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 30000);
            if(!lpTSCall1Ans5)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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


            // set @入账状态# = 《入账状态-处理失败》;
            strcpy(v_entry_status,"4");
            //调用过程[事务_清算证券_清算_更新待入账记录入账状态]
            //组织事务请求
            if(lpTSCall1Ans6)
            {
              lpTSCall1Ans6->FreeMsg();
              lpTSCall1Ans6=NULL;
            }
            lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("clsecuT.2.21", 0);
            lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req6->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
            lpTSCall1Req6->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
            lpTSCall1Req6->SetString(LDBIZ_ENTRY_STATUS_STR,v_entry_status);
            glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
            if(!lpTSCall1Ans6)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.21]subcall timed out!");
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


            // set @错误编码# = "0";
            strcpy(v_error_code,"0");

            // set @错误信息# = " ";
            strcpy(v_error_info," ");
            // leave label_pro;
            goto END;

        }
        // else
        else
        {

            //调用过程[事务_清算证券_清算_回写入账流水号]
            //组织事务请求
            if(lpTSCall1Ans7)
            {
              lpTSCall1Ans7->FreeMsg();
              lpTSCall1Ans7=NULL;
            }
            lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("clsecuT.2.28", 0);
            lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req7->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
            lpTSCall1Req7->SetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64,v_entry_money_jour_no);
            lpTSCall1Req7->SetInt64(LDBIZ_ENTRY_EXGP_POSI_JOUR_NO_INT64,v_entry_exgp_posi_jour_no);
            lpTSCall1Req7->SetInt64(LDBIZ_ENTRY_ASAC_POSI_JOUR_NO_INT64,v_entry_asac_posi_jour_no);
            glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
            if(!lpTSCall1Ans7)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.28]subcall timed out!");
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


            // set @当前金额#=@待入账金额#;
            v_curr_amt=v_pre_entry_amt;

            // set @冻结金额#=0;
            v_frozen_amt=0;

            // set @解冻金额#=0;
            v_unfroz_amt=0;

            // set @累计应收金额#=0;
            v_total_rece_amt=0;

            // set @累计应付金额#=0;
            v_total_payab_amt=0;
            //调用过程[事务_产品_清算接口_产品资金入账]
            //组织事务请求
            if(lpTSCall1Ans8)
            {
              lpTSCall1Ans8->FreeMsg();
              lpTSCall1Ans8=NULL;
            }
            lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("prodT.7.2", 0);
            lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req8->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
            lpTSCall1Req8->SetInt32(LDBIZ_ARRIVE_DATE_INT,v_arrive_date);
            lpTSCall1Req8->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpTSCall1Req8->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
            lpTSCall1Req8->SetInt32(LDBIZ_BUSI_FLAG_INT,v_busi_flag);
            lpTSCall1Req8->SetDouble(LDBIZ_OCCUR_AMT_FLOAT,v_occur_amt);
            lpTSCall1Req8->SetDouble(LDBIZ_CURR_AMT_FLOAT,v_curr_amt);
            lpTSCall1Req8->SetDouble(LDBIZ_FROZEN_AMT_FLOAT,v_frozen_amt);
            lpTSCall1Req8->SetDouble(LDBIZ_UNFROZ_AMT_FLOAT,v_unfroz_amt);
            lpTSCall1Req8->SetDouble(LDBIZ_TOTAL_RECE_AMT_FLOAT,v_total_rece_amt);
            lpTSCall1Req8->SetDouble(LDBIZ_TOTAL_PAYAB_AMT_FLOAT,v_total_payab_amt);
            lpTSCall1Req8->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req8->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
            glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 30000);
            if(!lpTSCall1Ans8)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.7.2]subcall timed out!");
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
    lpOutBizMsg->SetInt32(LDBIZ_RECORD_COUNT_INT,v_record_count);
    lpOutBizMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
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

//逻辑_清算证券_清算_入账回滚处理
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
    int64 v_query_row_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_asset_acco_no;
    int v_exch_no;
    int v_report_date;
    char v_report_no[33];
    int v_arrive_date;
    int64 v_row_id;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    double v_exch_rate;
    int v_stock_acco_no;
    int v_stock_code_no;
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    int v_report_time;
    int v_order_date;
    int v_order_time;
    int v_order_no;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    int v_strike_num;
    double v_pre_entry_qty;
    double v_pre_entry_amt;
    double v_all_fee;
    double v_stamp_tax;
    double v_trans_fee;
    double v_brkage_fee;
    double v_SEC_charges;
    double v_other_fee;
    double v_trade_commis;
    double v_chann_commis;
    double v_divi_commis;
    double v_other_commis;
    int v_busi_flag;
    char v_entry_status[3];
    char v_undo_status[3];
    int64 v_entry_money_jour_no;
    int64 v_entry_exgp_posi_jour_no;
    int64 v_entry_asac_posi_jour_no;
    int64 v_busi_jour_no;
    int64 v_deli_jour_no;
    int v_stock_type;
    int v_trade_code_no;
    int v_target_code_no;
    int v_intrst_days;
    double v_bond_accr_intrst;
    double v_impawn_ratio;
    int v_repo_back_date;
    int v_clear_entry_type;
    char v_remark_info[256];
    char v_tmp_error_code[33];
    char v_tmp_error_info[256];
    int64 v_repo_pd_jour_no;
    double v_curr_amt;
    double v_occur_amt;
    double v_frozen_amt;
    double v_unfroz_amt;
    double v_total_rece_amt;
    double v_total_payab_amt;
    int v_valid_flag;
    int v_deal_flag;
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
    v_query_row_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_asset_acco_no=0;
    v_exch_no=0;
    v_report_date=0;
    strcpy(v_report_no, " ");
    v_arrive_date=0;
    v_row_id=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_exch_rate=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_report_time=0;
    v_order_date=0;
    v_order_time=0;
    v_order_no=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_strike_num=0;
    v_pre_entry_qty=0;
    v_pre_entry_amt=0;
    v_all_fee=0;
    v_stamp_tax=0;
    v_trans_fee=0;
    v_brkage_fee=0;
    v_SEC_charges=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_chann_commis=0;
    v_divi_commis=0;
    v_other_commis=0;
    v_busi_flag=0;
    strcpy(v_entry_status, "0");
    strcpy(v_undo_status, "0");
    v_entry_money_jour_no=0;
    v_entry_exgp_posi_jour_no=0;
    v_entry_asac_posi_jour_no=0;
    v_busi_jour_no=0;
    v_deli_jour_no=0;
    v_stock_type=0;
    v_trade_code_no=0;
    v_target_code_no=0;
    v_intrst_days=0;
    v_bond_accr_intrst=0;
    v_impawn_ratio=0;
    v_repo_back_date=0;
    v_clear_entry_type=0;
    strcpy(v_remark_info, " ");
    strcpy(v_tmp_error_code, "0");
    strcpy(v_tmp_error_info, " ");
    v_repo_pd_jour_no=0;
    v_curr_amt=0;
    v_occur_amt=0;
    v_frozen_amt=0;
    v_unfroz_amt=0;
    v_total_rece_amt=0;
    v_total_payab_amt=0;
    v_valid_flag=0;
    v_deal_flag=0;
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
    v_query_row_id = lpInBizMsg->GetInt64(LDBIZ_QUERY_ROW_ID_INT64);

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

    //调用过程[事务_清算证券_清算_获取回滚入账信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clsecuT.2.30", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt64(LDBIZ_QUERY_ROW_ID_INT64,v_query_row_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.30]subcall timed out!");
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
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
    v_report_date = lpTSCall1Ans1->GetInt32(LDBIZ_REPORT_DATE_INT);
    strcpy(v_report_no, lpTSCall1Ans1->GetString(LDBIZ_REPORT_NO_STR));
    v_arrive_date = lpTSCall1Ans1->GetInt32(LDBIZ_ARRIVE_DATE_INT);

    // loop_label:loop
    while (true)
    {

        //根据申报编号,回滚所有同一笔委托的入账记录

        // set @记录序号# = 0;
        v_row_id = 0;
        //调用过程[事务_清算证券_清算_更新获取回滚待入账记录]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("clsecuT.2.25", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req2->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
        lpTSCall1Req2->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.25]subcall timed out!");
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
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
        v_row_id = lpTSCall1Ans2->GetInt64(LDBIZ_ROW_ID_INT64);
        v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans2->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_exch_rate = lpTSCall1Ans2->GetDouble(LDBIZ_EXCH_RATE_FLOAT);
        v_stock_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
        v_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        v_strike_date = lpTSCall1Ans2->GetInt32(LDBIZ_STRIKE_DATE_INT);
        v_strike_time = lpTSCall1Ans2->GetInt32(LDBIZ_STRIKE_TIME_INT);
        strcpy(v_strike_no, lpTSCall1Ans2->GetString(LDBIZ_STRIKE_NO_STR));
        v_report_time = lpTSCall1Ans2->GetInt32(LDBIZ_REPORT_TIME_INT);
        v_order_date = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_DATE_INT);
        v_order_time = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_TIME_INT);
        v_order_no = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_NO_INT);
        v_order_dir = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_DIR_INT);
        v_order_price = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_strike_price = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
        v_strike_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_strike_num = lpTSCall1Ans2->GetInt32(LDBIZ_STRIKE_NUM_INT);
        v_pre_entry_qty = lpTSCall1Ans2->GetDouble(LDBIZ_PRE_ENTRY_QTY_FLOAT);
        v_pre_entry_amt = lpTSCall1Ans2->GetDouble(LDBIZ_PRE_ENTRY_AMT_FLOAT);
        v_all_fee = lpTSCall1Ans2->GetDouble(LDBIZ_ALL_FEE_FLOAT);
        v_stamp_tax = lpTSCall1Ans2->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
        v_trans_fee = lpTSCall1Ans2->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
        v_brkage_fee = lpTSCall1Ans2->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
        v_SEC_charges = lpTSCall1Ans2->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
        v_other_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
        v_trade_commis = lpTSCall1Ans2->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_chann_commis = lpTSCall1Ans2->GetDouble(LDBIZ_CHANN_COMMIS_FLOAT);
        v_divi_commis = lpTSCall1Ans2->GetDouble(LDBIZ_DIVI_COMMIS_FLOAT);
        v_other_commis = lpTSCall1Ans2->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_busi_flag = lpTSCall1Ans2->GetInt32(LDBIZ_BUSI_FLAG_INT);
        strcpy(v_entry_status, lpTSCall1Ans2->GetString(LDBIZ_ENTRY_STATUS_STR));
        strcpy(v_undo_status, lpTSCall1Ans2->GetString(LDBIZ_UNDO_STATUS_STR));
        v_entry_money_jour_no = lpTSCall1Ans2->GetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
        v_entry_exgp_posi_jour_no = lpTSCall1Ans2->GetInt64(LDBIZ_ENTRY_EXGP_POSI_JOUR_NO_INT64);
        v_entry_asac_posi_jour_no = lpTSCall1Ans2->GetInt64(LDBIZ_ENTRY_ASAC_POSI_JOUR_NO_INT64);
        v_busi_jour_no = lpTSCall1Ans2->GetInt64(LDBIZ_BUSI_JOUR_NO_INT64);
        v_deli_jour_no = lpTSCall1Ans2->GetInt64(LDBIZ_DELI_JOUR_NO_INT64);
        v_stock_type = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_TYPE_INT);
        v_trade_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
        v_target_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
        v_intrst_days = lpTSCall1Ans2->GetInt32(LDBIZ_INTRST_DAYS_INT);
        v_bond_accr_intrst = lpTSCall1Ans2->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
        v_impawn_ratio = lpTSCall1Ans2->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
        v_repo_back_date = lpTSCall1Ans2->GetInt32(LDBIZ_REPO_BACK_DATE_INT);
        v_clear_entry_type = lpTSCall1Ans2->GetInt32(LDBIZ_CLEAR_ENTRY_TYPE_INT);


        // if @记录序号# = 0 then
        if (v_row_id == 0)
        {

            // set @错误编码# = "0";
            strcpy(v_error_code,"0");

            // set @错误信息# = " ";
            strcpy(v_error_info," ");
            // leave loop_label;
            break;

        // end if;
        }

        //如果入账资金流水号或入账持仓流水号不为0，则做回滚处理

        // if @入账资金流水号# <> 0 or @入账交易组持仓流水号# <> 0 then
        if (v_entry_money_jour_no != 0 || v_entry_exgp_posi_jour_no != 0)
        {

            // set @备注信息#="回滚清算证券清算入账处理";
            strcpy(v_remark_info,"回滚清算证券清算入账处理");
            //调用过程[事务_产品证券_清算接口_回滚清算资金持仓入账]
            //组织事务请求
            if(lpTSCall1Ans3)
            {
              lpTSCall1Ans3->FreeMsg();
              lpTSCall1Ans3=NULL;
            }
            lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdsecuT.5.102", 0);
            lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req3->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
            lpTSCall1Req3->SetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64,v_entry_money_jour_no);
            lpTSCall1Req3->SetInt64(LDBIZ_ENTRY_ASAC_POSI_JOUR_NO_INT64,v_entry_asac_posi_jour_no);
            lpTSCall1Req3->SetInt64(LDBIZ_ENTRY_EXGP_POSI_JOUR_NO_INT64,v_entry_exgp_posi_jour_no);
            lpTSCall1Req3->SetInt32(LDBIZ_BUSI_FLAG_INT,v_busi_flag);
            lpTSCall1Req3->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
            lpTSCall1Req3->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
            lpTSCall1Req3->SetInt32(LDBIZ_ORDER_NO_INT,v_order_no);
            lpTSCall1Req3->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
            glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
            if(!lpTSCall1Ans3)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.5.102]subcall timed out!");
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
            //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));


            // if @错误编码# <> "0" then
            if (strcmp(v_error_code , "0")!=0)
            {

                // set @临时_错误编码# = @错误编码#;
                strcpy(v_tmp_error_code,v_error_code);

                // set @临时_错误信息# = @错误信息#;
                strcpy(v_tmp_error_info,v_error_info);

                // set @回滚状态# = 《回滚状态-未回滚》;
                strcpy(v_undo_status,"2");
                //调用过程[事务_清算证券_清算_更新待入账记录回滚状态]
                //组织事务请求
                if(lpTSCall1Ans4)
                {
                  lpTSCall1Ans4->FreeMsg();
                  lpTSCall1Ans4=NULL;
                }
                lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("clsecuT.2.22", 0);
                lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req4->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                lpTSCall1Req4->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
                lpTSCall1Req4->SetString(LDBIZ_UNDO_STATUS_STR,v_undo_status);
                glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
                if(!lpTSCall1Ans4)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.22]subcall timed out!");
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
                v_repo_pd_jour_no = lpTSCall1Ans4->GetInt64(LDBIZ_REPO_PD_JOUR_NO_INT64);


                // set @错误编码# = @临时_错误编码#;
                strcpy(v_error_code,v_tmp_error_code);

                // set @错误信息# = @临时_错误信息#;
                strcpy(v_error_info,v_tmp_error_info);
                // leave loop_label;
                break;

            }
            // else
            else
            {


                // set @当前金额#=-@待入账金额#;
                v_curr_amt=-v_pre_entry_amt;

                // set @变动金额#=-@待入账金额#;
                v_occur_amt=-v_pre_entry_amt;

                // set @冻结金额#=0;
                v_frozen_amt=0;

                // set @解冻金额#=0;
                v_unfroz_amt=0;

                // set @累计应收金额#=0;
                v_total_rece_amt=0;

                // set @累计应付金额#=0;
                v_total_payab_amt=0;
                //调用过程[事务_产品_清算接口_产品资金入账]
                //组织事务请求
                if(lpTSCall1Ans5)
                {
                  lpTSCall1Ans5->FreeMsg();
                  lpTSCall1Ans5=NULL;
                }
                lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("prodT.7.2", 0);
                lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req5->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                lpTSCall1Req5->SetInt32(LDBIZ_ARRIVE_DATE_INT,v_arrive_date);
                lpTSCall1Req5->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                lpTSCall1Req5->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                lpTSCall1Req5->SetInt32(LDBIZ_BUSI_FLAG_INT,v_busi_flag);
                lpTSCall1Req5->SetDouble(LDBIZ_OCCUR_AMT_FLOAT,v_occur_amt);
                lpTSCall1Req5->SetDouble(LDBIZ_CURR_AMT_FLOAT,v_curr_amt);
                lpTSCall1Req5->SetDouble(LDBIZ_FROZEN_AMT_FLOAT,v_frozen_amt);
                lpTSCall1Req5->SetDouble(LDBIZ_UNFROZ_AMT_FLOAT,v_unfroz_amt);
                lpTSCall1Req5->SetDouble(LDBIZ_TOTAL_RECE_AMT_FLOAT,v_total_rece_amt);
                lpTSCall1Req5->SetDouble(LDBIZ_TOTAL_PAYAB_AMT_FLOAT,v_total_payab_amt);
                lpTSCall1Req5->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpTSCall1Req5->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
                glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 30000);
                if(!lpTSCall1Ans5)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.7.2]subcall timed out!");
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

            // end if;
            }

        // end if;
        }

        // loop_label:loop
        while (true)
        {

            //调用过程[事务_清算证券_清算_入账记录回滚处理]
            //组织事务请求
            if(lpTSCall1Ans6)
            {
              lpTSCall1Ans6->FreeMsg();
              lpTSCall1Ans6=NULL;
            }
            lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("clsecuT.2.29", 0);
            lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req6->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
            lpTSCall1Req6->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req6->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
            lpTSCall1Req6->SetInt32(LDBIZ_ORDER_NO_INT,v_order_no);
            lpTSCall1Req6->SetInt32(LDBIZ_CLEAR_ENTRY_TYPE_INT,v_clear_entry_type);
            glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
            if(!lpTSCall1Ans6)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.29]subcall timed out!");
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
            //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans6->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans6->GetString(LDBIZ_ERROR_INFO_STR));
            v_busi_jour_no = lpTSCall1Ans6->GetInt64(LDBIZ_BUSI_JOUR_NO_INT64);
            v_repo_pd_jour_no = lpTSCall1Ans6->GetInt64(LDBIZ_REPO_PD_JOUR_NO_INT64);
            v_valid_flag = lpTSCall1Ans6->GetInt32(LDBIZ_VALID_FLAG_INT);


            // if @成交流水号# > 0 then
            if (v_busi_jour_no > 0)
            {

                // set @处理标志# = 《处理标志-未处理》;
                v_deal_flag = 2;

                // set @记录序号# = @成交流水号#;
                v_row_id = v_busi_jour_no;
                //调用过程[事务_交易证券_接口_设置单记录成交回报记录处理标志]
                //组织事务请求
                if(lpTSCall1Ans7)
                {
                  lpTSCall1Ans7->FreeMsg();
                  lpTSCall1Ans7=NULL;
                }
                lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("tdsecuT.20.2", 0);
                lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req7->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                lpTSCall1Req7->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
                lpTSCall1Req7->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
                glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
                if(!lpTSCall1Ans7)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.20.2]subcall timed out!");
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
                //获取输出参数值
                strcpy(v_error_code, lpTSCall1Ans7->GetString(LDBIZ_ERROR_CODE_STR));
                strcpy(v_error_info, lpTSCall1Ans7->GetString(LDBIZ_ERROR_INFO_STR));


                // set @错误编码# = "0";
                strcpy(v_error_code,"0");

                // set @错误信息# = " ";
                strcpy(v_error_info," ");
            // end if;
            }


            // if @回购流水号# > 0 then
            if (v_repo_pd_jour_no > 0)
            {

                // set @记录序号# = @回购流水号#;
                v_row_id = v_repo_pd_jour_no;
                //调用过程[事务_产品证券_清算接口_写入回购记录回滚]
                //组织事务请求
                if(lpTSCall1Ans8)
                {
                  lpTSCall1Ans8->FreeMsg();
                  lpTSCall1Ans8=NULL;
                }
                lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("pdsecuT.5.112", 0);
                lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req8->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
                glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
                if(!lpTSCall1Ans8)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.5.112]subcall timed out!");
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
            // end if;
            }


            // if @有效标志# = 0 then
            if (v_valid_flag == 0)
            {
                // leave loop_label;
                break;

            // end if;
            }

        // end loop;
        }

    // end loop;
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

//逻辑_清算证券_清算_成交转入定时任务
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
    int v_task_no;
    int v_exec_count;
    int v_exec_date;
    int v_exec_time;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_task_strike_status[3];
    int v_qry_no;
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_clear_entry_type;
    int v_record_count;
    int64 v_row_id;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    char v_stock_code[7];
    int v_target_stock_code_no;
    char v_target_stock_code[7];
    int v_stock_type;
    int v_asset_type;
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_no;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    double v_all_fee;
    int v_trade_code_no;
    int v_target_code_no;
    int v_capit_reback_days;
    int v_posi_reback_days;
    int v_net_price_flag;
    int v_intrst_days;
    double v_par_value;
    double v_bond_accr_intrst;
    int v_bond_rate_type;
    double v_impawn_ratio;
    int v_strike_deal_type;
    double v_stamp_tax;
    double v_trans_fee;
    double v_brkage_fee;
    double v_SEC_charges;
    double v_other_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_trade_tax;
    double v_trade_cost_fee;
    double v_trade_system_use_fee;
    double v_stock_settle_fee;
    double v_fee_qty;
    double v_fee_price;
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    double v_settle_buy_rate;
    double v_settle_sell_rate;
    int v_sett_flow_step;
    char v_sett_deal_status[3];
    char v_remark_info[256];
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
    v_task_no=0;
    v_exec_count=0;
    v_exec_date=0;
    v_exec_time=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_task_strike_status, "0");
    v_qry_no=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_clear_entry_type=0;
    v_record_count=0;
    v_row_id=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    strcpy(v_stock_code, " ");
    v_target_stock_code_no=0;
    strcpy(v_target_stock_code, " ");
    v_stock_type=0;
    v_asset_type=0;
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_no=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_all_fee=0;
    v_trade_code_no=0;
    v_target_code_no=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    v_net_price_flag=0;
    v_intrst_days=0;
    v_par_value=0;
    v_bond_accr_intrst=0;
    v_bond_rate_type=0;
    v_impawn_ratio=0;
    v_strike_deal_type=0;
    v_stamp_tax=0;
    v_trans_fee=0;
    v_brkage_fee=0;
    v_SEC_charges=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_trade_tax=0;
    v_trade_cost_fee=0;
    v_trade_system_use_fee=0;
    v_stock_settle_fee=0;
    v_fee_qty=0;
    v_fee_price=0;
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_settle_buy_rate=0;
    v_settle_sell_rate=0;
    v_sett_flow_step=0;
    strcpy(v_sett_deal_status, "0");
    strcpy(v_remark_info, " ");
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
    v_task_no = lpInBizMsg->GetInt32(LDBIZ_TASK_NO_INT);
    v_exec_count = lpInBizMsg->GetInt32(LDBIZ_EXEC_COUNT_INT);
    v_exec_date = lpInBizMsg->GetInt32(LDBIZ_EXEC_DATE_INT);
    v_exec_time = lpInBizMsg->GetInt32(LDBIZ_EXEC_TIME_INT);

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

    //机构业务控制配置串第9位，清算入账类型

    // set @清算入账类型#=substring(@机构业务控制配置串#, 9,1);
    v_clear_entry_type=v_co_busi_config_str[8];
    //调用过程[事务_公共_公共接口_开始计划任务]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.24.151", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_TASK_NO_INT,v_task_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXEC_COUNT_INT,v_exec_count);
    lpTSCall1Req1->SetInt32(LDBIZ_EXEC_DATE_INT,v_exec_date);
    lpTSCall1Req1->SetInt32(LDBIZ_EXEC_TIME_INT,v_exec_time);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.151]subcall timed out!");
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

    //交易系统保证查询时无论数据在当前还是在历史中，都由一个过程返回
    // loop_label:loop
    while (true)
    {

        //单记录转入方式，以便前台并发处理

        // set @查询序号# = 0;
        v_qry_no = 0;
        //调用过程[事务_交易证券_接口_自动处理清算成交回报]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("tdsecuT.20.27", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req2->SetInt32(LDBIZ_QRY_NO_INT,v_qry_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.20.27]subcall timed out!");
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
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
        v_record_count = lpTSCall1Ans2->GetInt32(LDBIZ_RECORD_COUNT_INT);
        v_row_id = lpTSCall1Ans2->GetInt64(LDBIZ_ROW_ID_INT64);
        v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans2->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans2->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_out_acco, lpTSCall1Ans2->GetString(LDBIZ_OUT_ACCO_STR));
        v_exch_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_NO_INT);
        v_stock_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
        v_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        strcpy(v_stock_code, lpTSCall1Ans2->GetString(LDBIZ_STOCK_CODE_STR));
        v_target_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_TARGET_STOCK_CODE_NO_INT);
        strcpy(v_target_stock_code, lpTSCall1Ans2->GetString(LDBIZ_TARGET_STOCK_CODE_STR));
        v_stock_type = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_TYPE_INT);
        v_asset_type = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_strike_date = lpTSCall1Ans2->GetInt32(LDBIZ_STRIKE_DATE_INT);
        v_strike_time = lpTSCall1Ans2->GetInt32(LDBIZ_STRIKE_TIME_INT);
        strcpy(v_strike_no, lpTSCall1Ans2->GetString(LDBIZ_STRIKE_NO_STR));
        v_report_date = lpTSCall1Ans2->GetInt32(LDBIZ_REPORT_DATE_INT);
        v_report_time = lpTSCall1Ans2->GetInt32(LDBIZ_REPORT_TIME_INT);
        strcpy(v_report_no, lpTSCall1Ans2->GetString(LDBIZ_REPORT_NO_STR));
        v_order_date = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_DATE_INT);
        v_order_time = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_TIME_INT);
        v_order_no = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_NO_INT);
        v_order_dir = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_DIR_INT);
        v_order_price = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_strike_price = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
        v_strike_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_all_fee = lpTSCall1Ans2->GetDouble(LDBIZ_ALL_FEE_FLOAT);
        v_trade_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
        v_target_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
        v_capit_reback_days = lpTSCall1Ans2->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
        v_posi_reback_days = lpTSCall1Ans2->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
        v_net_price_flag = lpTSCall1Ans2->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
        v_intrst_days = lpTSCall1Ans2->GetInt32(LDBIZ_INTRST_DAYS_INT);
        v_par_value = lpTSCall1Ans2->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
        v_bond_accr_intrst = lpTSCall1Ans2->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
        v_bond_rate_type = lpTSCall1Ans2->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
        v_impawn_ratio = lpTSCall1Ans2->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
        v_strike_deal_type = lpTSCall1Ans2->GetInt32(LDBIZ_STRIKE_DEAL_TYPE_INT);
        v_stamp_tax = lpTSCall1Ans2->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
        v_trans_fee = lpTSCall1Ans2->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
        v_brkage_fee = lpTSCall1Ans2->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
        v_SEC_charges = lpTSCall1Ans2->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
        v_other_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
        v_trade_commis = lpTSCall1Ans2->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_other_commis = lpTSCall1Ans2->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_trade_tax = lpTSCall1Ans2->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
        v_trade_cost_fee = lpTSCall1Ans2->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
        v_trade_system_use_fee = lpTSCall1Ans2->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
        v_stock_settle_fee = lpTSCall1Ans2->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);


        // if @错误编码# = "0" then
        if (strcmp(v_error_code , "0")==0)
        {
            //调用过程[事务_公共_清算接口_获取机构业务控制配置串]
            //组织事务请求
            if(lpTSCall1Ans3)
            {
              lpTSCall1Ans3->FreeMsg();
              lpTSCall1Ans3=NULL;
            }
            lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.26.71", 0);
            lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req3->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
            if(!lpTSCall1Ans3)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.71]subcall timed out!");
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
            strcpy(v_co_busi_config_str, lpTSCall1Ans3->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));

            //机构业务控制配置串第9位，清算入账类型

            // set @清算入账类型#=substring(@机构业务控制配置串#, 9,1);
            v_clear_entry_type=v_co_busi_config_str[8];

            // set @查询序号# = @记录序号#;
            v_qry_no = v_row_id;

            // set @费用数量# = @成交数量#;
            v_fee_qty = v_strike_qty;

            // set @费用价格# = @成交价格#;
            v_fee_price = v_strike_price;
            //获取市场本币币种、交易币种、汇率，并计算证券费用，后续按汇率转换
            //调用过程[事务_公共_清算接口_计算证券清算费用]
            //组织事务请求
            if(lpTSCall1Ans4)
            {
              lpTSCall1Ans4->FreeMsg();
              lpTSCall1Ans4=NULL;
            }
            lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pubT.26.21", 0);
            lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req4->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
            lpTSCall1Req4->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpTSCall1Req4->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
            lpTSCall1Req4->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req4->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
            lpTSCall1Req4->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
            lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
            lpTSCall1Req4->SetDouble(LDBIZ_FEE_QTY_FLOAT,v_fee_qty);
            lpTSCall1Req4->SetDouble(LDBIZ_FEE_PRICE_FLOAT,v_fee_price);
            lpTSCall1Req4->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
            lpTSCall1Req4->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
            lpTSCall1Req4->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
            lpTSCall1Req4->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
            glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
            if(!lpTSCall1Ans4)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.21]subcall timed out!");
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
            strcpy(v_crncy_type, lpTSCall1Ans4->GetString(LDBIZ_CRNCY_TYPE_STR));
            strcpy(v_exch_crncy_type, lpTSCall1Ans4->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
            v_stamp_tax = lpTSCall1Ans4->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
            v_trans_fee = lpTSCall1Ans4->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
            v_brkage_fee = lpTSCall1Ans4->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
            v_SEC_charges = lpTSCall1Ans4->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
            v_other_fee = lpTSCall1Ans4->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
            v_trade_commis = lpTSCall1Ans4->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
            v_other_commis = lpTSCall1Ans4->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
            v_trade_tax = lpTSCall1Ans4->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
            v_trade_cost_fee = lpTSCall1Ans4->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
            v_trade_system_use_fee = lpTSCall1Ans4->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
            v_stock_settle_fee = lpTSCall1Ans4->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);
            v_settle_buy_rate = lpTSCall1Ans4->GetDouble(LDBIZ_SETTLE_BUY_RATE_FLOAT);
            v_settle_sell_rate = lpTSCall1Ans4->GetDouble(LDBIZ_SETTLE_SELL_RATE_FLOAT);

            //[事务_清算证券_清算_转入成交记录]
        }
        // else
        else
        {


            // if @记录个数# <> 0 then
            if (v_record_count != 0)
            {
                // leave label_pro;
                goto END;

            }
            // else
            else
            {


                // set @错误编码# = "0";
                strcpy(v_error_code,"0");

                // set @错误信息# = " ";
                strcpy(v_error_info," ");
                // leave loop_label;
                break;

            // end if;
            }

        // end if;
        }

    // end loop;
    }


    // set @清算步骤# = 《清算步骤-成交转入》;
    v_sett_flow_step = 1;

    // set @清算结算处理状态# = 《清算结算处理状态-已完成》;
    strcpy(v_sett_deal_status,"2");

    // set @备注信息# = "证券成交转入处理正常！";
    strcpy(v_remark_info,"证券成交转入处理正常！");
    //调用过程[事务_清算证券_公用_更新处理状态]
    //组织事务请求
    if(lpTSCall1Ans5)
    {
      lpTSCall1Ans5->FreeMsg();
      lpTSCall1Ans5=NULL;
    }
    lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("clsecuT.1.12", 0);
    lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req5->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req5->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req5->SetInt32(LDBIZ_SETT_FLOW_STEP_INT,v_sett_flow_step);
    lpTSCall1Req5->SetString(LDBIZ_SETT_DEAL_STATUS_STR,v_sett_deal_status);
    lpTSCall1Req5->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
    if(!lpTSCall1Ans5)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.1.12]subcall timed out!");
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

    //调用过程[事务_公共_公共接口_完成计划任务]
    //组织事务请求
    if(lpTSCall1Ans6)
    {
      lpTSCall1Ans6->FreeMsg();
      lpTSCall1Ans6=NULL;
    }
    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("pubT.24.152", 0);
    lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req6->SetInt32(LDBIZ_TASK_NO_INT,v_task_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
    if(!lpTSCall1Ans6)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.152]subcall timed out!");
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
    strcpy(v_task_strike_status, lpTSCall1Ans6->GetString(LDBIZ_TASK_STRIKE_STATUS_STR));


END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans7)
        {
          lpTSCall1Ans7->FreeMsg();
          lpTSCall1Ans7=NULL;
        }
        lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req7->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req7->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
        if (lpTSCall1Ans7)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans7->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans7->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans7->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans7->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans7->GetString(LDBIZ_ERROR_DEAL_STR));
        }

    }
    lpOutBizMsg->SetInt32(LDBIZ_ERROR_LEVEL_INT,v_error_level);
    lpOutBizMsg->SetString(LDBIZ_ERROR_DEAL_STR,v_error_deal);
    lpOutBizMsg->SetString(LDBIZ_ERROR_PROMPT_STR,v_error_prompt);
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_TASK_STRIKE_STATUS_STR,v_task_strike_status);
    lpOutBizMsg->SetInt32(LDBIZ_QRY_NO_INT,v_qry_no);
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
    return iRet;
}

//逻辑_清算证券_清算_清算处理定时任务
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
    int v_task_no;
    int v_exec_count;
    int v_exec_date;
    int v_exec_time;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_task_strike_status[3];
    int v_qry_no;
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_row_id;
    int v_record_count;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    int v_stock_type;
    char v_tmp_error_code[33];
    char v_tmp_error_info[256];
    int v_deal_flag;
    int v_pass_no;
    double v_exch_rate;
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_no;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    int v_strike_num;
    double v_strike_aver_price;
    double v_pre_entry_qty;
    double v_pre_entry_amt;
    double v_split_strike_qty;
    double v_split_strike_amt;
    double v_split_stamp_tax;
    double v_split_trans_fee;
    double v_split_brkage;
    double v_split_SEC_charges;
    double v_split_other_fee;
    double v_split_brkage_commis;
    double v_split_chann_commis;
    double v_split_divi_commis;
    double v_split_other_commis;
    double v_split_trade_tax;
    double v_split_trade_cost_fee;
    double v_split_trade_system_use_fee;
    double v_split_stock_settle_fee;
    int v_asset_type;
    int v_trade_code_no;
    int v_target_code_no;
    int v_capit_reback_days;
    int v_posi_reback_days;
    int v_net_price_flag;
    int v_intrst_days;
    double v_par_value;
    double v_bond_accr_intrst;
    double v_impawn_ratio;
    int v_clear_entry_type;
    int v_bond_rate_type;
    int v_busi_flag;
    int v_arrive_date;
    double v_fee_qty;
    double v_fee_price;
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    double v_stamp_tax;
    double v_trans_fee;
    double v_brkage_fee;
    double v_SEC_charges;
    double v_other_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_trade_tax;
    double v_trade_cost_fee;
    double v_trade_system_use_fee;
    double v_stock_settle_fee;
    double v_settle_buy_rate;
    double v_settle_sell_rate;
    char v_split_fee_typr_str[65];
    int64 v_entry_jour_no;
    int v_sett_flow_step;
    char v_sett_deal_status[3];
    char v_remark_info[256];
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
    v_task_no=0;
    v_exec_count=0;
    v_exec_date=0;
    v_exec_time=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_task_strike_status, "0");
    v_qry_no=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_row_id=0;
    v_record_count=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_stock_type=0;
    strcpy(v_tmp_error_code, "0");
    strcpy(v_tmp_error_info, " ");
    v_deal_flag=0;
    v_pass_no=0;
    v_exch_rate=0;
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_no=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_strike_num=0;
    v_strike_aver_price=0;
    v_pre_entry_qty=0;
    v_pre_entry_amt=0;
    v_split_strike_qty=0;
    v_split_strike_amt=0;
    v_split_stamp_tax=0;
    v_split_trans_fee=0;
    v_split_brkage=0;
    v_split_SEC_charges=0;
    v_split_other_fee=0;
    v_split_brkage_commis=0;
    v_split_chann_commis=0;
    v_split_divi_commis=0;
    v_split_other_commis=0;
    v_split_trade_tax=0;
    v_split_trade_cost_fee=0;
    v_split_trade_system_use_fee=0;
    v_split_stock_settle_fee=0;
    v_asset_type=0;
    v_trade_code_no=0;
    v_target_code_no=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    v_net_price_flag=0;
    v_intrst_days=0;
    v_par_value=0;
    v_bond_accr_intrst=0;
    v_impawn_ratio=0;
    v_clear_entry_type=0;
    v_bond_rate_type=0;
    v_busi_flag=0;
    v_arrive_date=0;
    v_fee_qty=0;
    v_fee_price=0;
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_stamp_tax=0;
    v_trans_fee=0;
    v_brkage_fee=0;
    v_SEC_charges=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_trade_tax=0;
    v_trade_cost_fee=0;
    v_trade_system_use_fee=0;
    v_stock_settle_fee=0;
    v_settle_buy_rate=0;
    v_settle_sell_rate=0;
    strcpy(v_split_fee_typr_str, " ");
    v_entry_jour_no=0;
    v_sett_flow_step=0;
    strcpy(v_sett_deal_status, "0");
    strcpy(v_remark_info, " ");
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
    v_task_no = lpInBizMsg->GetInt32(LDBIZ_TASK_NO_INT);
    v_exec_count = lpInBizMsg->GetInt32(LDBIZ_EXEC_COUNT_INT);
    v_exec_date = lpInBizMsg->GetInt32(LDBIZ_EXEC_DATE_INT);
    v_exec_time = lpInBizMsg->GetInt32(LDBIZ_EXEC_TIME_INT);

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

    //调用过程[事务_公共_公共接口_开始计划任务]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.24.151", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_TASK_NO_INT,v_task_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXEC_COUNT_INT,v_exec_count);
    lpTSCall1Req1->SetInt32(LDBIZ_EXEC_DATE_INT,v_exec_date);
    lpTSCall1Req1->SetInt32(LDBIZ_EXEC_TIME_INT,v_exec_time);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.151]subcall timed out!");
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

    //处理外部证券成交表清算数据
    // loop_label:loop
    while (true)
    {


        // set  @查询序号# = 0;
         v_qry_no = 0;
        //调用过程[事务_清算证券_清算_自动清算处理]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("clsecuT.2.207", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req2->SetInt32(LDBIZ_QRY_NO_INT,v_qry_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.207]subcall timed out!");
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
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));
        v_row_id = lpTSCall1Ans2->GetInt64(LDBIZ_ROW_ID_INT64);
        v_record_count = lpTSCall1Ans2->GetInt32(LDBIZ_RECORD_COUNT_INT);
        v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans2->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_exch_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_NO_INT);
        v_stock_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
        v_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        v_stock_type = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_TYPE_INT);


        // set  @查询序号# = @记录序号#;
         v_qry_no = v_row_id;

        // if @错误编码# <> "0" then
        if (strcmp(v_error_code , "0")!=0)
        {

            // if @记录个数# <> 0 then
            if (v_record_count != 0)
            {

                // set @临时_错误编码# = @错误编码#;
                strcpy(v_tmp_error_code,v_error_code);

                // set @临时_错误信息# = @错误信息#;
                strcpy(v_tmp_error_info,v_error_info);

                // set @处理标志# = 《处理标志-处理失败》;
                v_deal_flag = 4;
                //调用过程[事务_清算证券_清算_设置成交记录处理标志]
                //组织事务请求
                if(lpTSCall1Ans3)
                {
                  lpTSCall1Ans3->FreeMsg();
                  lpTSCall1Ans3=NULL;
                }
                lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("clsecuT.2.5", 0);
                lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req3->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
                lpTSCall1Req3->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
                glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
                if(!lpTSCall1Ans3)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.5]subcall timed out!");
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


                // set @错误编码# = @临时_错误编码#;
                strcpy(v_error_code,v_tmp_error_code);

                // set @错误信息# = @临时_错误信息#;
                strcpy(v_error_info,v_tmp_error_info);
                // leave label_pro;
                goto END;

            }
            // else
            else
            {


                // set @错误编码# = "0";
                strcpy(v_error_code,"0");

                // set @错误信息# = " ";
                strcpy(v_error_info," ");
                // leave loop_label;
                break;

            // end if;
            }

        // end if;
        }

    // end loop;
    }

    //处理证券合并清算表数据
    // loop_label:loop
    while (true)
    {


        // set @查询序号# =0;
        v_qry_no =0;
        //调用过程[事务_清算证券_清算_自动更新获取合并清算记录]
        //组织事务请求
        if(lpTSCall1Ans4)
        {
          lpTSCall1Ans4->FreeMsg();
          lpTSCall1Ans4=NULL;
        }
        lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("clsecuT.2.208", 0);
        lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req4->SetInt32(LDBIZ_QRY_NO_INT,v_qry_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
        if(!lpTSCall1Ans4)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.208]subcall timed out!");
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
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans4->GetString(LDBIZ_ERROR_INFO_STR));
        v_record_count = lpTSCall1Ans4->GetInt32(LDBIZ_RECORD_COUNT_INT);
        v_row_id = lpTSCall1Ans4->GetInt64(LDBIZ_ROW_ID_INT64);
        v_init_date = lpTSCall1Ans4->GetInt32(LDBIZ_INIT_DATE_INT);
        v_co_no = lpTSCall1Ans4->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans4->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans4->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans4->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans4->GetInt32(LDBIZ_PASS_NO_INT);
        v_exch_rate = lpTSCall1Ans4->GetDouble(LDBIZ_EXCH_RATE_FLOAT);
        v_exch_no = lpTSCall1Ans4->GetInt32(LDBIZ_EXCH_NO_INT);
        v_stock_acco_no = lpTSCall1Ans4->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
        v_stock_code_no = lpTSCall1Ans4->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        v_strike_date = lpTSCall1Ans4->GetInt32(LDBIZ_STRIKE_DATE_INT);
        v_strike_time = lpTSCall1Ans4->GetInt32(LDBIZ_STRIKE_TIME_INT);
        strcpy(v_strike_no, lpTSCall1Ans4->GetString(LDBIZ_STRIKE_NO_STR));
        v_report_date = lpTSCall1Ans4->GetInt32(LDBIZ_REPORT_DATE_INT);
        v_report_time = lpTSCall1Ans4->GetInt32(LDBIZ_REPORT_TIME_INT);
        strcpy(v_report_no, lpTSCall1Ans4->GetString(LDBIZ_REPORT_NO_STR));
        v_order_date = lpTSCall1Ans4->GetInt32(LDBIZ_ORDER_DATE_INT);
        v_order_time = lpTSCall1Ans4->GetInt32(LDBIZ_ORDER_TIME_INT);
        v_order_no = lpTSCall1Ans4->GetInt32(LDBIZ_ORDER_NO_INT);
        v_order_dir = lpTSCall1Ans4->GetInt32(LDBIZ_ORDER_DIR_INT);
        v_order_price = lpTSCall1Ans4->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_strike_num = lpTSCall1Ans4->GetInt32(LDBIZ_STRIKE_NUM_INT);
        v_strike_aver_price = lpTSCall1Ans4->GetDouble(LDBIZ_STRIKE_AVER_PRICE_FLOAT);
        v_pre_entry_qty = lpTSCall1Ans4->GetDouble(LDBIZ_PRE_ENTRY_QTY_FLOAT);
        v_pre_entry_amt = lpTSCall1Ans4->GetDouble(LDBIZ_PRE_ENTRY_AMT_FLOAT);
        v_split_strike_qty = lpTSCall1Ans4->GetDouble(LDBIZ_SPLIT_STRIKE_QTY_FLOAT);
        v_split_strike_amt = lpTSCall1Ans4->GetDouble(LDBIZ_SPLIT_STRIKE_AMT_FLOAT);
        v_split_stamp_tax = lpTSCall1Ans4->GetDouble(LDBIZ_SPLIT_STAMP_TAX_FLOAT);
        v_split_trans_fee = lpTSCall1Ans4->GetDouble(LDBIZ_SPLIT_TRANS_FEE_FLOAT);
        v_split_brkage = lpTSCall1Ans4->GetDouble(LDBIZ_SPLIT_BRKAGE_FLOAT);
        v_split_SEC_charges = lpTSCall1Ans4->GetDouble(LDBIZ_SPLIT_SEC_CHARGES_FLOAT);
        v_split_other_fee = lpTSCall1Ans4->GetDouble(LDBIZ_SPLIT_OTHER_FEE_FLOAT);
        v_split_brkage_commis = lpTSCall1Ans4->GetDouble(LDBIZ_SPLIT_BRKAGE_COMMIS_FLOAT);
        v_split_chann_commis = lpTSCall1Ans4->GetDouble(LDBIZ_SPLIT_CHANN_COMMIS_FLOAT);
        v_split_divi_commis = lpTSCall1Ans4->GetDouble(LDBIZ_SPLIT_DIVI_COMMIS_FLOAT);
        v_split_other_commis = lpTSCall1Ans4->GetDouble(LDBIZ_SPLIT_OTHER_COMMIS_FLOAT);
        v_split_trade_tax = lpTSCall1Ans4->GetDouble(LDBIZ_SPLIT_TRADE_TAX_FLOAT);
        v_split_trade_cost_fee = lpTSCall1Ans4->GetDouble(LDBIZ_SPLIT_TRADE_COST_FEE_FLOAT);
        v_split_trade_system_use_fee = lpTSCall1Ans4->GetDouble(LDBIZ_SPLIT_TRADE_SYSTEM_USE_FEE_FLOAT);
        v_split_stock_settle_fee = lpTSCall1Ans4->GetDouble(LDBIZ_SPLIT_STOCK_SETTLE_FEE_FLOAT);
        v_stock_type = lpTSCall1Ans4->GetInt32(LDBIZ_STOCK_TYPE_INT);
        v_asset_type = lpTSCall1Ans4->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_trade_code_no = lpTSCall1Ans4->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
        v_target_code_no = lpTSCall1Ans4->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
        v_capit_reback_days = lpTSCall1Ans4->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
        v_posi_reback_days = lpTSCall1Ans4->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
        v_net_price_flag = lpTSCall1Ans4->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
        v_intrst_days = lpTSCall1Ans4->GetInt32(LDBIZ_INTRST_DAYS_INT);
        v_par_value = lpTSCall1Ans4->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
        v_bond_accr_intrst = lpTSCall1Ans4->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
        v_impawn_ratio = lpTSCall1Ans4->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
        v_clear_entry_type = lpTSCall1Ans4->GetInt32(LDBIZ_CLEAR_ENTRY_TYPE_INT);
        v_bond_rate_type = lpTSCall1Ans4->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
        v_busi_flag = lpTSCall1Ans4->GetInt32(LDBIZ_BUSI_FLAG_INT);
        v_deal_flag = lpTSCall1Ans4->GetInt32(LDBIZ_DEAL_FLAG_INT);
        v_arrive_date = lpTSCall1Ans4->GetInt32(LDBIZ_ARRIVE_DATE_INT);


        // set @查询序号# =@记录序号#;
        v_qry_no =v_row_id;

        // if @记录个数# = 1 then
        if (v_record_count == 1)
        {

            // set @费用数量#=@分笔累计成交数量#;
            v_fee_qty=v_split_strike_qty;

            // set @费用价格#=@成交均价#;
            v_fee_price=v_strike_aver_price;
            //计算合并清算证券费用
            //调用过程[事务_公共_清算接口_计算证券清算费用]
            //组织事务请求
            if(lpTSCall1Ans5)
            {
              lpTSCall1Ans5->FreeMsg();
              lpTSCall1Ans5=NULL;
            }
            lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pubT.26.21", 0);
            lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req5->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
            lpTSCall1Req5->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpTSCall1Req5->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
            lpTSCall1Req5->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpTSCall1Req5->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req5->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
            lpTSCall1Req5->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
            lpTSCall1Req5->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
            lpTSCall1Req5->SetDouble(LDBIZ_FEE_QTY_FLOAT,v_fee_qty);
            lpTSCall1Req5->SetDouble(LDBIZ_FEE_PRICE_FLOAT,v_fee_price);
            lpTSCall1Req5->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
            lpTSCall1Req5->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
            lpTSCall1Req5->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
            lpTSCall1Req5->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
            glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
            if(!lpTSCall1Ans5)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.21]subcall timed out!");
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
            //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans5->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_crncy_type, lpTSCall1Ans5->GetString(LDBIZ_CRNCY_TYPE_STR));
            strcpy(v_exch_crncy_type, lpTSCall1Ans5->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
            v_stamp_tax = lpTSCall1Ans5->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
            v_trans_fee = lpTSCall1Ans5->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
            v_brkage_fee = lpTSCall1Ans5->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
            v_SEC_charges = lpTSCall1Ans5->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
            v_other_fee = lpTSCall1Ans5->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
            v_trade_commis = lpTSCall1Ans5->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
            v_other_commis = lpTSCall1Ans5->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
            v_trade_tax = lpTSCall1Ans5->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
            v_trade_cost_fee = lpTSCall1Ans5->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
            v_trade_system_use_fee = lpTSCall1Ans5->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
            v_stock_settle_fee = lpTSCall1Ans5->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);
            v_settle_buy_rate = lpTSCall1Ans5->GetDouble(LDBIZ_SETTLE_BUY_RATE_FLOAT);
            v_settle_sell_rate = lpTSCall1Ans5->GetDouble(LDBIZ_SETTLE_SELL_RATE_FLOAT);


            // if @错误编码# <> "0" then
            if (strcmp(v_error_code , "0")!=0)
            {

                // set @临时_错误编码# = @错误编码#;
                strcpy(v_tmp_error_code,v_error_code);

                // set @临时_错误信息# = @错误信息#;
                strcpy(v_tmp_error_info,v_error_info);

                // set @处理标志# = 《处理标志-处理失败》;
                v_deal_flag = 4;
                //调用过程[事务_清算证券_清算_设置合并清算记录处理标志]
                //组织事务请求
                if(lpTSCall1Ans6)
                {
                  lpTSCall1Ans6->FreeMsg();
                  lpTSCall1Ans6=NULL;
                }
                lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("clsecuT.2.13", 0);
                lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req6->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
                lpTSCall1Req6->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
                glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
                if(!lpTSCall1Ans6)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.13]subcall timed out!");
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


                // set @错误编码# = @临时_错误编码#;
                strcpy(v_error_code,v_tmp_error_code);

                // set @错误信息# = @临时_错误信息#;
                strcpy(v_error_info,v_tmp_error_info);
                // leave label_pro;
                goto END;

            // end if;
            }

            //取系统配置分笔费用类型
            //调用过程[事务_产品_清算接口_获取资产账户分笔费用类型串]
            //组织事务请求
            if(lpTSCall1Ans7)
            {
              lpTSCall1Ans7->FreeMsg();
              lpTSCall1Ans7=NULL;
            }
            lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("prodT.7.33", 0);
            lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req7->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 60000);
            if(!lpTSCall1Ans7)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.7.33]subcall timed out!");
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
            //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans7->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans7->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_split_fee_typr_str, lpTSCall1Ans7->GetString(LDBIZ_SPLIT_FEE_TYPR_STR_STR));


            // if @错误编码# <> "0" then
            if (strcmp(v_error_code , "0")!=0)
            {

                // set @分笔费用类型串#="";
                strcpy(v_split_fee_typr_str,"");
            }
            // else
            else
            {


                // set @分笔费用类型串#=concat(";", @分笔费用类型串#, ";");
                snprintf(v_split_fee_typr_str,sizeof(v_split_fee_typr_str),"%s%s%s",";",v_split_fee_typr_str,";");
            // end if;
            }

            //调用过程[事务_清算证券_清算_合并清算处理]
            //组织事务请求
            if(lpTSCall1Ans8)
            {
              lpTSCall1Ans8->FreeMsg();
              lpTSCall1Ans8=NULL;
            }
            lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("clsecuT.2.15", 0);
            lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req8->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
            lpTSCall1Req8->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
            lpTSCall1Req8->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpTSCall1Req8->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
            lpTSCall1Req8->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
            lpTSCall1Req8->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpTSCall1Req8->SetDouble(LDBIZ_EXCH_RATE_FLOAT,v_exch_rate);
            lpTSCall1Req8->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req8->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
            lpTSCall1Req8->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
            lpTSCall1Req8->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
            lpTSCall1Req8->SetInt32(LDBIZ_STRIKE_TIME_INT,v_strike_time);
            lpTSCall1Req8->SetString(LDBIZ_STRIKE_NO_STR,v_strike_no);
            lpTSCall1Req8->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
            lpTSCall1Req8->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
            lpTSCall1Req8->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
            lpTSCall1Req8->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
            lpTSCall1Req8->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
            lpTSCall1Req8->SetInt32(LDBIZ_ORDER_NO_INT,v_order_no);
            lpTSCall1Req8->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
            lpTSCall1Req8->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
            lpTSCall1Req8->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
            lpTSCall1Req8->SetDouble(LDBIZ_STRIKE_AVER_PRICE_FLOAT,v_strike_aver_price);
            lpTSCall1Req8->SetInt32(LDBIZ_STRIKE_NUM_INT,v_strike_num);
            lpTSCall1Req8->SetDouble(LDBIZ_SPLIT_STRIKE_QTY_FLOAT,v_split_strike_qty);
            lpTSCall1Req8->SetDouble(LDBIZ_SPLIT_STRIKE_AMT_FLOAT,v_split_strike_amt);
            lpTSCall1Req8->SetDouble(LDBIZ_SPLIT_STAMP_TAX_FLOAT,v_split_stamp_tax);
            lpTSCall1Req8->SetDouble(LDBIZ_SPLIT_TRANS_FEE_FLOAT,v_split_trans_fee);
            lpTSCall1Req8->SetDouble(LDBIZ_SPLIT_BRKAGE_FLOAT,v_split_brkage);
            lpTSCall1Req8->SetDouble(LDBIZ_SPLIT_SEC_CHARGES_FLOAT,v_split_SEC_charges);
            lpTSCall1Req8->SetDouble(LDBIZ_SPLIT_OTHER_FEE_FLOAT,v_split_other_fee);
            lpTSCall1Req8->SetDouble(LDBIZ_SPLIT_BRKAGE_COMMIS_FLOAT,v_split_brkage_commis);
            lpTSCall1Req8->SetDouble(LDBIZ_SPLIT_OTHER_COMMIS_FLOAT,v_split_other_commis);
            lpTSCall1Req8->SetDouble(LDBIZ_SPLIT_TRADE_TAX_FLOAT,v_split_trade_tax);
            lpTSCall1Req8->SetDouble(LDBIZ_SPLIT_TRADE_COST_FEE_FLOAT,v_split_trade_cost_fee);
            lpTSCall1Req8->SetDouble(LDBIZ_SPLIT_TRADE_SYSTEM_USE_FEE_FLOAT,v_split_trade_system_use_fee);
            lpTSCall1Req8->SetDouble(LDBIZ_SPLIT_STOCK_SETTLE_FEE_FLOAT,v_split_stock_settle_fee);
            lpTSCall1Req8->SetDouble(LDBIZ_STAMP_TAX_FLOAT,v_stamp_tax);
            lpTSCall1Req8->SetDouble(LDBIZ_TRANS_FEE_FLOAT,v_trans_fee);
            lpTSCall1Req8->SetDouble(LDBIZ_BRKAGE_FEE_FLOAT,v_brkage_fee);
            lpTSCall1Req8->SetDouble(LDBIZ_SEC_CHARGES_FLOAT,v_SEC_charges);
            lpTSCall1Req8->SetDouble(LDBIZ_OTHER_FEE_FLOAT,v_other_fee);
            lpTSCall1Req8->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
            lpTSCall1Req8->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
            lpTSCall1Req8->SetDouble(LDBIZ_TRADE_TAX_FLOAT,v_trade_tax);
            lpTSCall1Req8->SetDouble(LDBIZ_TRADE_COST_FEE_FLOAT,v_trade_cost_fee);
            lpTSCall1Req8->SetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT,v_trade_system_use_fee);
            lpTSCall1Req8->SetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT,v_stock_settle_fee);
            lpTSCall1Req8->SetInt32(LDBIZ_BUSI_FLAG_INT,v_busi_flag);
            lpTSCall1Req8->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
            lpTSCall1Req8->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
            lpTSCall1Req8->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
            lpTSCall1Req8->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
            lpTSCall1Req8->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
            lpTSCall1Req8->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
            lpTSCall1Req8->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
            lpTSCall1Req8->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
            lpTSCall1Req8->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
            lpTSCall1Req8->SetInt32(LDBIZ_ARRIVE_DATE_INT,v_arrive_date);
            lpTSCall1Req8->SetInt32(LDBIZ_INTRST_DAYS_INT,v_intrst_days);
            lpTSCall1Req8->SetInt32(LDBIZ_CLEAR_ENTRY_TYPE_INT,v_clear_entry_type);
            lpTSCall1Req8->SetString(LDBIZ_SPLIT_FEE_TYPR_STR_STR,v_split_fee_typr_str);
            glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
            if(!lpTSCall1Ans8)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.15]subcall timed out!");
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
            v_entry_jour_no = lpTSCall1Ans8->GetInt64(LDBIZ_ENTRY_JOUR_NO_INT64);


            // if @错误编码# <> "0" then
            if (strcmp(v_error_code , "0")!=0)
            {

                // set @临时_错误编码# = @错误编码#;
                strcpy(v_tmp_error_code,v_error_code);

                // set @临时_错误信息# = @错误信息#;
                strcpy(v_tmp_error_info,v_error_info);

                // set @处理标志# = 《处理标志-处理失败》;
                v_deal_flag = 4;
                //调用过程[事务_清算证券_清算_设置合并清算记录处理标志]
                //组织事务请求
                if(lpTSCall1Ans9)
                {
                  lpTSCall1Ans9->FreeMsg();
                  lpTSCall1Ans9=NULL;
                }
                lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("clsecuT.2.13", 0);
                lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req9->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
                lpTSCall1Req9->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
                glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
                if(!lpTSCall1Ans9)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.13]subcall timed out!");
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
                //获取输出参数值
                strcpy(v_error_code, lpTSCall1Ans9->GetString(LDBIZ_ERROR_CODE_STR));
                strcpy(v_error_info, lpTSCall1Ans9->GetString(LDBIZ_ERROR_INFO_STR));


                // set @错误编码# = @临时_错误编码#;
                strcpy(v_error_code,v_tmp_error_code);

                // set @错误信息# = @临时_错误信息#;
                strcpy(v_error_info,v_tmp_error_info);
                // leave label_pro;
                goto END;

            // end if;
            }

        }
        // else
        else
        {


            // set @错误编码# = "0";
            strcpy(v_error_code,"0");

            // set @错误信息# = " ";
            strcpy(v_error_info," ");
            // leave loop_label;
            break;

        // end if;
        }

    // end loop;
    }


    // set @清算步骤# = 《清算步骤-清算处理》;
    v_sett_flow_step = 2;

    // set @清算结算处理状态# = 《清算结算处理状态-已完成》;
    strcpy(v_sett_deal_status,"2");

    // set @备注信息# = "证券成交清算处理正常！";
    strcpy(v_remark_info,"证券成交清算处理正常！");
    //调用过程[事务_清算证券_公用_更新处理状态]
    //组织事务请求
    if(lpTSCall1Ans10)
    {
      lpTSCall1Ans10->FreeMsg();
      lpTSCall1Ans10=NULL;
    }
    lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("clsecuT.1.12", 0);
    lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req10->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req10->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req10->SetInt32(LDBIZ_SETT_FLOW_STEP_INT,v_sett_flow_step);
    lpTSCall1Req10->SetString(LDBIZ_SETT_DEAL_STATUS_STR,v_sett_deal_status);
    lpTSCall1Req10->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
    if(!lpTSCall1Ans10)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.1.12]subcall timed out!");
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

    //调用过程[事务_公共_公共接口_完成计划任务]
    //组织事务请求
    if(lpTSCall1Ans11)
    {
      lpTSCall1Ans11->FreeMsg();
      lpTSCall1Ans11=NULL;
    }
    lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("pubT.24.152", 0);
    lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req11->SetInt32(LDBIZ_TASK_NO_INT,v_task_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
    if(!lpTSCall1Ans11)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.152]subcall timed out!");
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
    strcpy(v_task_strike_status, lpTSCall1Ans11->GetString(LDBIZ_TASK_STRIKE_STATUS_STR));


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
    lpOutBizMsg->SetString(LDBIZ_TASK_STRIKE_STATUS_STR,v_task_strike_status);
    lpOutBizMsg->SetInt32(LDBIZ_QRY_NO_INT,v_qry_no);
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

//逻辑_清算证券_清算_入账处理定时任务
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
    int v_task_no;
    int v_exec_count;
    int v_exec_date;
    int v_exec_time;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_task_strike_status[3];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_intrst_entry_type;
    int v_qry_no;
    int v_record_count;
    int64 v_row_id;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    double v_exch_rate;
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    int v_target_stock_code_no;
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_no;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    int v_strike_num;
    double v_pre_entry_qty;
    double v_pre_entry_amt;
    double v_all_fee;
    double v_stamp_tax;
    double v_trans_fee;
    double v_brkage_fee;
    double v_SEC_charges;
    double v_other_fee;
    double v_trade_commis;
    double v_chann_commis;
    double v_divi_commis;
    double v_other_commis;
    int v_busi_flag;
    char v_entry_status[3];
    char v_undo_status[3];
    int64 v_busi_jour_no;
    int64 v_entry_money_jour_no;
    int64 v_entry_posi_jour_no;
    int64 v_deli_jour_no;
    int v_stock_type;
    int v_asset_type;
    int v_trade_code_no;
    int v_target_code_no;
    int v_intrst_days;
    double v_bond_accr_intrst;
    int v_bond_rate_type;
    double v_impawn_ratio;
    int v_arrive_date;
    int v_repo_back_date;
    char v_tmp_error_info[256];
    int v_cost_calc_type;
    int v_clear_entry_type;
    double v_occur_amt;
    double v_occur_qty;
    char v_remark_info[256];
    int64 v_entry_exgp_posi_jour_no;
    int64 v_entry_asac_posi_jour_no;
    char v_tmp_error_code[33];
    double v_curr_amt;
    double v_frozen_amt;
    double v_unfroz_amt;
    double v_total_rece_amt;
    double v_total_payab_amt;
    int v_sett_flow_step;
    char v_sett_deal_status[3];
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
    v_task_no=0;
    v_exec_count=0;
    v_exec_date=0;
    v_exec_time=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_task_strike_status, "0");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_intrst_entry_type=0;
    v_qry_no=0;
    v_record_count=0;
    v_row_id=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_rate=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_target_stock_code_no=0;
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_no=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_strike_num=0;
    v_pre_entry_qty=0;
    v_pre_entry_amt=0;
    v_all_fee=0;
    v_stamp_tax=0;
    v_trans_fee=0;
    v_brkage_fee=0;
    v_SEC_charges=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_chann_commis=0;
    v_divi_commis=0;
    v_other_commis=0;
    v_busi_flag=0;
    strcpy(v_entry_status, "0");
    strcpy(v_undo_status, "0");
    v_busi_jour_no=0;
    v_entry_money_jour_no=0;
    v_entry_posi_jour_no=0;
    v_deli_jour_no=0;
    v_stock_type=0;
    v_asset_type=0;
    v_trade_code_no=0;
    v_target_code_no=0;
    v_intrst_days=0;
    v_bond_accr_intrst=0;
    v_bond_rate_type=0;
    v_impawn_ratio=0;
    v_arrive_date=0;
    v_repo_back_date=0;
    strcpy(v_tmp_error_info, " ");
    v_cost_calc_type=0;
    v_clear_entry_type=0;
    v_occur_amt=0;
    v_occur_qty=0;
    strcpy(v_remark_info, " ");
    v_entry_exgp_posi_jour_no=0;
    v_entry_asac_posi_jour_no=0;
    strcpy(v_tmp_error_code, "0");
    v_curr_amt=0;
    v_frozen_amt=0;
    v_unfroz_amt=0;
    v_total_rece_amt=0;
    v_total_payab_amt=0;
    v_sett_flow_step=0;
    strcpy(v_sett_deal_status, "0");
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
    v_task_no = lpInBizMsg->GetInt32(LDBIZ_TASK_NO_INT);
    v_exec_count = lpInBizMsg->GetInt32(LDBIZ_EXEC_COUNT_INT);
    v_exec_date = lpInBizMsg->GetInt32(LDBIZ_EXEC_DATE_INT);
    v_exec_time = lpInBizMsg->GetInt32(LDBIZ_EXEC_TIME_INT);

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

    //机构业务控制配置串第8位，红利入账成本盈亏计算方式

    // set @红利入账成本盈亏计算方式#=substring(@机构业务控制配置串#, 8,1);
    v_intrst_entry_type=v_co_busi_config_str[7];
    //调用过程[事务_公共_公共接口_开始计划任务]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.24.151", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_TASK_NO_INT,v_task_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXEC_COUNT_INT,v_exec_count);
    lpTSCall1Req1->SetInt32(LDBIZ_EXEC_DATE_INT,v_exec_date);
    lpTSCall1Req1->SetInt32(LDBIZ_EXEC_TIME_INT,v_exec_time);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.151]subcall timed out!");
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

    //处理待入账记录表数据
    // loop_label:loop
    while (true)
    {


        // set @查询序号# =0;
        v_qry_no =0;
        //调用过程[事务_清算证券_清算_自动更新获取待入账记录]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("clsecuT.2.209", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req2->SetInt32(LDBIZ_QRY_NO_INT,v_qry_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.209]subcall timed out!");
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
        v_row_id = lpTSCall1Ans2->GetInt64(LDBIZ_ROW_ID_INT64);
        v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans2->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_exch_rate = lpTSCall1Ans2->GetDouble(LDBIZ_EXCH_RATE_FLOAT);
        v_exch_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_NO_INT);
        v_stock_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
        v_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        v_target_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_TARGET_STOCK_CODE_NO_INT);
        v_strike_date = lpTSCall1Ans2->GetInt32(LDBIZ_STRIKE_DATE_INT);
        v_strike_time = lpTSCall1Ans2->GetInt32(LDBIZ_STRIKE_TIME_INT);
        strcpy(v_strike_no, lpTSCall1Ans2->GetString(LDBIZ_STRIKE_NO_STR));
        v_report_date = lpTSCall1Ans2->GetInt32(LDBIZ_REPORT_DATE_INT);
        v_report_time = lpTSCall1Ans2->GetInt32(LDBIZ_REPORT_TIME_INT);
        strcpy(v_report_no, lpTSCall1Ans2->GetString(LDBIZ_REPORT_NO_STR));
        v_order_date = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_DATE_INT);
        v_order_time = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_TIME_INT);
        v_order_no = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_NO_INT);
        v_order_dir = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_DIR_INT);
        v_order_price = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_strike_price = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
        v_strike_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_strike_num = lpTSCall1Ans2->GetInt32(LDBIZ_STRIKE_NUM_INT);
        v_pre_entry_qty = lpTSCall1Ans2->GetDouble(LDBIZ_PRE_ENTRY_QTY_FLOAT);
        v_pre_entry_amt = lpTSCall1Ans2->GetDouble(LDBIZ_PRE_ENTRY_AMT_FLOAT);
        v_all_fee = lpTSCall1Ans2->GetDouble(LDBIZ_ALL_FEE_FLOAT);
        v_stamp_tax = lpTSCall1Ans2->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
        v_trans_fee = lpTSCall1Ans2->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
        v_brkage_fee = lpTSCall1Ans2->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
        v_SEC_charges = lpTSCall1Ans2->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
        v_other_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
        v_trade_commis = lpTSCall1Ans2->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_chann_commis = lpTSCall1Ans2->GetDouble(LDBIZ_CHANN_COMMIS_FLOAT);
        v_divi_commis = lpTSCall1Ans2->GetDouble(LDBIZ_DIVI_COMMIS_FLOAT);
        v_other_commis = lpTSCall1Ans2->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_busi_flag = lpTSCall1Ans2->GetInt32(LDBIZ_BUSI_FLAG_INT);
        strcpy(v_entry_status, lpTSCall1Ans2->GetString(LDBIZ_ENTRY_STATUS_STR));
        strcpy(v_undo_status, lpTSCall1Ans2->GetString(LDBIZ_UNDO_STATUS_STR));
        v_busi_jour_no = lpTSCall1Ans2->GetInt64(LDBIZ_BUSI_JOUR_NO_INT64);
        v_entry_money_jour_no = lpTSCall1Ans2->GetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
        v_entry_posi_jour_no = lpTSCall1Ans2->GetInt64(LDBIZ_ENTRY_POSI_JOUR_NO_INT64);
        v_deli_jour_no = lpTSCall1Ans2->GetInt64(LDBIZ_DELI_JOUR_NO_INT64);
        v_stock_type = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_TYPE_INT);
        v_asset_type = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_trade_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
        v_target_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
        v_intrst_days = lpTSCall1Ans2->GetInt32(LDBIZ_INTRST_DAYS_INT);
        v_bond_accr_intrst = lpTSCall1Ans2->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
        v_bond_rate_type = lpTSCall1Ans2->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
        v_impawn_ratio = lpTSCall1Ans2->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
        v_arrive_date = lpTSCall1Ans2->GetInt32(LDBIZ_ARRIVE_DATE_INT);
        v_repo_back_date = lpTSCall1Ans2->GetInt32(LDBIZ_REPO_BACK_DATE_INT);


        // set @查询序号# =@记录序号#;
        v_qry_no =v_row_id;

        // if @记录个数# = 1 then
        if (v_record_count == 1)
        {

            // set @临时_错误信息#="";
            strcpy(v_tmp_error_info,"");
            //调用过程[事务_产品_清算接口_获取产品成本计算方式]
            //组织事务请求
            if(lpTSCall1Ans3)
            {
              lpTSCall1Ans3->FreeMsg();
              lpTSCall1Ans3=NULL;
            }
            lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("prodT.7.41", 0);
            lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req3->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
            glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 30000);
            if(!lpTSCall1Ans3)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.7.41]subcall timed out!");
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
            v_cost_calc_type = lpTSCall1Ans3->GetInt32(LDBIZ_COST_CALC_TYPE_INT);

            //调用过程[事务_公共_清算接口_获取机构业务控制配置串]
            //组织事务请求
            if(lpTSCall1Ans4)
            {
              lpTSCall1Ans4->FreeMsg();
              lpTSCall1Ans4=NULL;
            }
            lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pubT.26.71", 0);
            lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req4->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
            if(!lpTSCall1Ans4)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.71]subcall timed out!");
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
            strcpy(v_co_busi_config_str, lpTSCall1Ans4->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));

            //机构业务控制配置串第9位，清算入账类型

            // set @清算入账类型#=substring(@机构业务控制配置串#, 9,1);
            v_clear_entry_type=v_co_busi_config_str[8];
            //如果待入账金额和待入账数量都有值，则统一事务入账

            // if @待入账金额# <> 0 or @待入账数量# <> 0 then
            if (v_pre_entry_amt != 0 || v_pre_entry_qty != 0)
            {

                // set @变动金额#=@待入账金额#;
                v_occur_amt=v_pre_entry_amt;

                // set @变动数量#=@待入账数量#;
                v_occur_qty=v_pre_entry_qty;

                // set @备注信息#="清算证券清算入账处理";
                strcpy(v_remark_info,"清算证券清算入账处理");
                //调用过程[事务_产品证券_清算接口_清算资金持仓入账]
                //组织事务请求
                if(lpTSCall1Ans5)
                {
                  lpTSCall1Ans5->FreeMsg();
                  lpTSCall1Ans5=NULL;
                }
                lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pdsecuT.5.101", 0);
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
                lpTSCall1Req5->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                lpTSCall1Req5->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpTSCall1Req5->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpTSCall1Req5->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                lpTSCall1Req5->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                lpTSCall1Req5->SetInt32(LDBIZ_TARGET_STOCK_CODE_NO_INT,v_target_stock_code_no);
                lpTSCall1Req5->SetDouble(LDBIZ_OCCUR_AMT_FLOAT,v_occur_amt);
                lpTSCall1Req5->SetDouble(LDBIZ_OCCUR_QTY_FLOAT,v_occur_qty);
                lpTSCall1Req5->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
                lpTSCall1Req5->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
                lpTSCall1Req5->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
                lpTSCall1Req5->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
                lpTSCall1Req5->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
                lpTSCall1Req5->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
                lpTSCall1Req5->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
                lpTSCall1Req5->SetInt32(LDBIZ_COST_CALC_TYPE_INT,v_cost_calc_type);
                lpTSCall1Req5->SetInt32(LDBIZ_INTRST_ENTRY_TYPE_INT,v_intrst_entry_type);
                lpTSCall1Req5->SetInt32(LDBIZ_BUSI_FLAG_INT,v_busi_flag);
                lpTSCall1Req5->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
                lpTSCall1Req5->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
                lpTSCall1Req5->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
                lpTSCall1Req5->SetInt32(LDBIZ_ARRIVE_DATE_INT,v_arrive_date);
                lpTSCall1Req5->SetInt32(LDBIZ_ORDER_NO_INT,v_order_no);
                lpTSCall1Req5->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
                glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 30000);
                if(!lpTSCall1Ans5)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.5.101]subcall timed out!");
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
                //获取输出参数值
                strcpy(v_error_code, lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR));
                strcpy(v_error_info, lpTSCall1Ans5->GetString(LDBIZ_ERROR_INFO_STR));
                v_entry_money_jour_no = lpTSCall1Ans5->GetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
                v_entry_exgp_posi_jour_no = lpTSCall1Ans5->GetInt64(LDBIZ_ENTRY_EXGP_POSI_JOUR_NO_INT64);
                v_entry_asac_posi_jour_no = lpTSCall1Ans5->GetInt64(LDBIZ_ENTRY_ASAC_POSI_JOUR_NO_INT64);


                // if @错误编码# <> "0" then
                if (strcmp(v_error_code , "0")!=0)
                {

                    // set @临时_错误编码# = @错误编码#;
                    strcpy(v_tmp_error_code,v_error_code);

                    // set @临时_错误信息# = @错误信息#;
                    strcpy(v_tmp_error_info,v_error_info);

                    // set @入账状态# = 《入账状态-处理失败》;
                    strcpy(v_entry_status,"4");
                    //调用过程[事务_清算证券_清算_更新待入账记录入账状态]
                    //组织事务请求
                    if(lpTSCall1Ans6)
                    {
                      lpTSCall1Ans6->FreeMsg();
                      lpTSCall1Ans6=NULL;
                    }
                    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("clsecuT.2.21", 0);
                    lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
                    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                    lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                    lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                    lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                    lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                    lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                    lpTSCall1Req6->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                    lpTSCall1Req6->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
                    lpTSCall1Req6->SetString(LDBIZ_ENTRY_STATUS_STR,v_entry_status);
                    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
                    if(!lpTSCall1Ans6)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.21]subcall timed out!");
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


                    // set @错误编码# = @临时_错误编码#;
                    strcpy(v_error_code,v_tmp_error_code);

                    // set @错误信息# = @临时_错误信息#;
                    strcpy(v_error_info,v_tmp_error_info);
                    // leave label_pro;
                    goto END;

                }
                // else
                else
                {

                    //调用过程[事务_清算证券_清算_回写入账流水号]
                    //组织事务请求
                    if(lpTSCall1Ans7)
                    {
                      lpTSCall1Ans7->FreeMsg();
                      lpTSCall1Ans7=NULL;
                    }
                    lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("clsecuT.2.28", 0);
                    lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
                    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                    lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                    lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                    lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                    lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                    lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                    lpTSCall1Req7->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
                    lpTSCall1Req7->SetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64,v_entry_money_jour_no);
                    lpTSCall1Req7->SetInt64(LDBIZ_ENTRY_EXGP_POSI_JOUR_NO_INT64,v_entry_exgp_posi_jour_no);
                    lpTSCall1Req7->SetInt64(LDBIZ_ENTRY_ASAC_POSI_JOUR_NO_INT64,v_entry_asac_posi_jour_no);
                    glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
                    if(!lpTSCall1Ans7)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.28]subcall timed out!");
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


                    // set @当前金额#=@待入账金额#;
                    v_curr_amt=v_pre_entry_amt;

                    // set @冻结金额#=0;
                    v_frozen_amt=0;

                    // set @解冻金额#=0;
                    v_unfroz_amt=0;

                    // set @累计应收金额#=0;
                    v_total_rece_amt=0;

                    // set @累计应付金额#=0;
                    v_total_payab_amt=0;
                    //调用过程[事务_产品_清算接口_产品资金入账]
                    //组织事务请求
                    if(lpTSCall1Ans8)
                    {
                      lpTSCall1Ans8->FreeMsg();
                      lpTSCall1Ans8=NULL;
                    }
                    lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("prodT.7.2", 0);
                    lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
                    lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                    lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                    lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                    lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                    lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                    lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                    lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                    lpTSCall1Req8->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                    lpTSCall1Req8->SetInt32(LDBIZ_ARRIVE_DATE_INT,v_arrive_date);
                    lpTSCall1Req8->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                    lpTSCall1Req8->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                    lpTSCall1Req8->SetInt32(LDBIZ_BUSI_FLAG_INT,v_busi_flag);
                    lpTSCall1Req8->SetDouble(LDBIZ_OCCUR_AMT_FLOAT,v_occur_amt);
                    lpTSCall1Req8->SetDouble(LDBIZ_CURR_AMT_FLOAT,v_curr_amt);
                    lpTSCall1Req8->SetDouble(LDBIZ_FROZEN_AMT_FLOAT,v_frozen_amt);
                    lpTSCall1Req8->SetDouble(LDBIZ_UNFROZ_AMT_FLOAT,v_unfroz_amt);
                    lpTSCall1Req8->SetDouble(LDBIZ_TOTAL_RECE_AMT_FLOAT,v_total_rece_amt);
                    lpTSCall1Req8->SetDouble(LDBIZ_TOTAL_PAYAB_AMT_FLOAT,v_total_payab_amt);
                    lpTSCall1Req8->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                    lpTSCall1Req8->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
                    glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 30000);
                    if(!lpTSCall1Ans8)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.7.2]subcall timed out!");
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

                // end if;
                }

            // end if;
            }

        }
        // else
        else
        {


            // set @错误编码# = "0";
            strcpy(v_error_code,"0");

            // set @错误信息# = " ";
            strcpy(v_error_info," ");
            // leave loop_label;
            break;

        // end if;
        }

    // end loop;
    }


    // set @清算步骤# = 《清算步骤-清算入账》;
    v_sett_flow_step = 4;

    // set @清算结算处理状态# = 《清算结算处理状态-已完成》;
    strcpy(v_sett_deal_status,"2");

    // set @备注信息# = "证券成交清算处理正常！";
    strcpy(v_remark_info,"证券成交清算处理正常！");
    //调用过程[事务_清算证券_公用_更新处理状态]
    //组织事务请求
    if(lpTSCall1Ans9)
    {
      lpTSCall1Ans9->FreeMsg();
      lpTSCall1Ans9=NULL;
    }
    lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("clsecuT.1.12", 0);
    lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req9->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req9->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req9->SetInt32(LDBIZ_SETT_FLOW_STEP_INT,v_sett_flow_step);
    lpTSCall1Req9->SetString(LDBIZ_SETT_DEAL_STATUS_STR,v_sett_deal_status);
    lpTSCall1Req9->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
    if(!lpTSCall1Ans9)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.1.12]subcall timed out!");
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

    //调用过程[事务_公共_公共接口_完成计划任务]
    //组织事务请求
    if(lpTSCall1Ans10)
    {
      lpTSCall1Ans10->FreeMsg();
      lpTSCall1Ans10=NULL;
    }
    lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("pubT.24.152", 0);
    lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req10->SetInt32(LDBIZ_TASK_NO_INT,v_task_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
    if(!lpTSCall1Ans10)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.152]subcall timed out!");
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
    strcpy(v_task_strike_status, lpTSCall1Ans10->GetString(LDBIZ_TASK_STRIKE_STATUS_STR));


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
    lpOutBizMsg->SetString(LDBIZ_TASK_STRIKE_STATUS_STR,v_task_strike_status);
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

//逻辑_清算证券_清算_数据统计
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

    //调用过程[事务_清算证券_清算_数据统计]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clsecuT.2.201", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.201]subcall timed out!");
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

//逻辑_清算证券_清算_查询统计数据
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
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    char v_exch_no_str[2049];
    int v_stock_acco_no;
    int v_stock_code_no;
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    int v_busi_flag;
    int v_exch_no;
    int v_clear_num;
    int v_order_dir;
    int v_strike_num;
    double v_strike_aver_price;
    double v_strike_qty;
    double v_strike_amt;
    double v_entry_qty;
    double v_entry_amt;
    double v_all_fee;
    double v_stamp_tax;
    double v_trans_fee;
    double v_brkage_fee;
    double v_SEC_charges;
    double v_other_fee;
    double v_trade_commis;
    double v_chann_commis;
    double v_divi_commis;
    double v_other_commis;
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
    strcpy(v_exch_no_str, " ");
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    v_busi_flag=0;
    v_exch_no=0;
    v_clear_num=0;
    v_order_dir=0;
    v_strike_num=0;
    v_strike_aver_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_entry_qty=0;
    v_entry_amt=0;
    v_all_fee=0;
    v_stamp_tax=0;
    v_trans_fee=0;
    v_brkage_fee=0;
    v_SEC_charges=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_chann_commis=0;
    v_divi_commis=0;
    v_other_commis=0;
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
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
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

    //调用过程[事务_清算证券_清算_查询统计数据]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clsecuT.2.202", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.202]subcall timed out!");
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

//逻辑_清算证券_清算_获取汇总统计值
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
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    double v_pre_switch_strike_qty;
    double v_alr_switch_strike_qty;
    double v_pre_clr_strike_qty;
    double v_alr_clr_strike_qty;
    double v_pre_entry_record_qty;
    double v_alr_entry_record_qty;
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
    v_pre_switch_strike_qty=0;
    v_alr_switch_strike_qty=0;
    v_pre_clr_strike_qty=0;
    v_alr_clr_strike_qty=0;
    v_pre_entry_record_qty=0;
    v_alr_entry_record_qty=0;
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

    //调用过程[事务_交易证券_接口_获取清算转入成交统计]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.20.6", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.20.6]subcall timed out!");
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
    v_pre_switch_strike_qty = lpTSCall1Ans1->GetDouble(LDBIZ_PRE_SWITCH_STRIKE_QTY_FLOAT);
    v_alr_switch_strike_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ALR_SWITCH_STRIKE_QTY_FLOAT);

    //调用过程[事务_清算证券_清算_获取清算处理统计值]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("clsecuT.2.203", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.203]subcall timed out!");
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
    v_pre_clr_strike_qty = lpTSCall1Ans2->GetDouble(LDBIZ_PRE_CLR_STRIKE_QTY_FLOAT);
    v_alr_clr_strike_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ALR_CLR_STRIKE_QTY_FLOAT);
    v_pre_entry_record_qty = lpTSCall1Ans2->GetDouble(LDBIZ_PRE_ENTRY_RECORD_QTY_FLOAT);
    v_alr_entry_record_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ALR_ENTRY_RECORD_QTY_FLOAT);


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
    lpOutBizMsg->SetDouble(LDBIZ_PRE_SWITCH_STRIKE_QTY_FLOAT,v_pre_switch_strike_qty);
    lpOutBizMsg->SetDouble(LDBIZ_ALR_SWITCH_STRIKE_QTY_FLOAT,v_alr_switch_strike_qty);
    lpOutBizMsg->SetDouble(LDBIZ_PRE_CLR_STRIKE_QTY_FLOAT,v_pre_clr_strike_qty);
    lpOutBizMsg->SetDouble(LDBIZ_ALR_CLR_STRIKE_QTY_FLOAT,v_alr_clr_strike_qty);
    lpOutBizMsg->SetDouble(LDBIZ_PRE_ENTRY_RECORD_QTY_FLOAT,v_pre_entry_record_qty);
    lpOutBizMsg->SetDouble(LDBIZ_ALR_ENTRY_RECORD_QTY_FLOAT,v_alr_entry_record_qty);
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

//逻辑_清算证券_清算_查询成交记录序号
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
    int v_qry_no;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_sys_status[3];
    char v_oper_remark_info[256];
    int v_update_times;
    char v_old_sys_status[3];
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
    v_qry_no=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_row_id=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_sys_status, "0");
    strcpy(v_oper_remark_info, " ");
    v_update_times=1;
    strcpy(v_old_sys_status, "0");
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
    v_qry_no = lpInBizMsg->GetInt32(LDBIZ_QRY_NO_INT);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);

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

    //调用过程[事务_交易证券_接口_查询成交记录序号]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.20.15", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_QRY_NO_INT,v_qry_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.20.15]subcall timed out!");
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


    // set @系统状态# = 《系统状态-清算中》;
    strcpy(v_sys_status,"4");

    // set @操作备注# = "清算处理中!";
    strcpy(v_oper_remark_info,"清算处理中!");
    //调用过程[事务_公共_公共接口_更新系统状态]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.232", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req2->SetString(LDBIZ_SYS_STATUS_STR,v_sys_status);
    lpTSCall1Req2->SetString(LDBIZ_OPER_REMARK_INFO_STR,v_oper_remark_info);
    lpTSCall1Req2->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.232]subcall timed out!");
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
    v_update_times = lpTSCall1Ans2->GetInt32(LDBIZ_UPDATE_TIMES_INT);
    strcpy(v_old_sys_status, lpTSCall1Ans2->GetString(LDBIZ_OLD_SYS_STATUS_STR));


    // [主动推送][sys.systemstatus][系统主推_系统_系统状态主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.945", 0);
    lpPubMsg->SetString(LDBIZ_SYS_STATUS_STR,v_sys_status);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("sys.systemstatus", lpPubMsg);


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

//逻辑_清算证券_清算_查询清算成交记录序号
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
    int v_qry_no;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
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
    v_qry_no=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_row_id=0;
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
    v_qry_no = lpInBizMsg->GetInt32(LDBIZ_QRY_NO_INT);
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

    //调用过程[事务_清算证券_清算_查询清算成交记录序号]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clsecuT.2.204", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_QRY_NO_INT,v_qry_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.204]subcall timed out!");
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

//逻辑_清算证券_清算_查询合并清算记录序号
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
    int v_qry_no;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
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
    v_qry_no=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_row_id=0;
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
    v_qry_no = lpInBizMsg->GetInt32(LDBIZ_QRY_NO_INT);
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

    //调用过程[事务_清算证券_清算_查询合并清算记录序号]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clsecuT.2.205", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_QRY_NO_INT,v_qry_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.205]subcall timed out!");
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

//逻辑_清算证券_清算_查询待入账记录序号
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
    int v_qry_no;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
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
    v_qry_no=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_row_id=0;
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
    v_qry_no = lpInBizMsg->GetInt32(LDBIZ_QRY_NO_INT);
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

    //调用过程[事务_清算证券_清算_查询待入账记录序号]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clsecuT.2.206", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_QRY_NO_INT,v_qry_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.206]subcall timed out!");
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

//逻辑_清算证券_清算_A股入账前检查
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
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_sum_strike_count;
    int v_split_strike_count;
    int v_split_order_count;
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
    v_sum_strike_count=0;
    v_split_strike_count=0;
    v_split_order_count=0;
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

    //调用过程[事务_交易证券_接口_A股入账前检查统计]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.20.26", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.20.26]subcall timed out!");
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
    v_sum_strike_count = lpTSCall1Ans1->GetInt32(LDBIZ_SUM_STRIKE_COUNT_INT);
    v_split_strike_count = lpTSCall1Ans1->GetInt32(LDBIZ_SPLIT_STRIKE_COUNT_INT);
    v_split_order_count = lpTSCall1Ans1->GetInt32(LDBIZ_SPLIT_ORDER_COUNT_INT);

    //调用过程[事务_清算证券_清算_A股入账前检查]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("clsecuT.2.210", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req2->SetInt32(LDBIZ_SUM_STRIKE_COUNT_INT,v_sum_strike_count);
    lpTSCall1Req2->SetInt32(LDBIZ_SPLIT_STRIKE_COUNT_INT,v_split_strike_count);
    lpTSCall1Req2->SetInt32(LDBIZ_SPLIT_ORDER_COUNT_INT,v_split_order_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.210]subcall timed out!");
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

//逻辑_清算证券_清算_批量转入成交记录
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
    char v_row_id_str[2049];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_record_count;
    char v_deal_info[256];
    int64 v_row_id;
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_undo_error_no;
    double v_pre_entry_qty;
    double v_pre_entry_amt;
    char v_split_str[5];
    int v_qry_no;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    char v_stock_code[7];
    int v_target_stock_code_no;
    char v_target_stock_code[7];
    int v_stock_type;
    int v_asset_type;
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_no;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    double v_all_fee;
    int v_trade_code_no;
    int v_target_code_no;
    int v_capit_reback_days;
    int v_posi_reback_days;
    int v_net_price_flag;
    int v_intrst_days;
    double v_par_value;
    double v_bond_accr_intrst;
    int v_bond_rate_type;
    double v_impawn_ratio;
    int v_strike_deal_type;
    double v_stamp_tax;
    double v_trans_fee;
    double v_brkage_fee;
    double v_SEC_charges;
    double v_other_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_trade_tax;
    double v_trade_cost_fee;
    double v_trade_system_use_fee;
    double v_stock_settle_fee;
    char v_remark_info[256];
    int64 v_busi_jour_no;
    int v_clear_entry_type;
    double v_fee_qty;
    double v_fee_price;
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    double v_settle_buy_rate;
    double v_settle_sell_rate;
    int v_deal_flag;
    int v_settle_date;
    int v_arrive_date;
    int64 v_repo_pd_jour_no;
    int v_repo_days;
    int v_repo_first_settle_date;
    int v_repo_back_date;
    int v_cash_capt_days;
    char v_target_code[7];
    int v_target_code_stock_type;
    int v_target_code_asset_type;
    double v_repo_rate;
    double v_repo_amt;
    double v_repo_qty;
    double v_repo_back_intrst;
    int v_repo_trade_date;
    int v_repo_cale_days;
    int v_repo_back_trade_date;
    int64 v_repo_order_id;
    double v_exch_rate;
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
    strcpy(v_row_id_str, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_record_count=0;
    strcpy(v_deal_info, " ");
    v_row_id=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_undo_error_no=0;
    v_pre_entry_qty=0;
    v_pre_entry_amt=0;
    strcpy(v_split_str, " ");
    v_qry_no=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    strcpy(v_stock_code, " ");
    v_target_stock_code_no=0;
    strcpy(v_target_stock_code, " ");
    v_stock_type=0;
    v_asset_type=0;
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_no=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_all_fee=0;
    v_trade_code_no=0;
    v_target_code_no=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    v_net_price_flag=0;
    v_intrst_days=0;
    v_par_value=0;
    v_bond_accr_intrst=0;
    v_bond_rate_type=0;
    v_impawn_ratio=0;
    v_strike_deal_type=0;
    v_stamp_tax=0;
    v_trans_fee=0;
    v_brkage_fee=0;
    v_SEC_charges=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_trade_tax=0;
    v_trade_cost_fee=0;
    v_trade_system_use_fee=0;
    v_stock_settle_fee=0;
    strcpy(v_remark_info, " ");
    v_busi_jour_no=0;
    v_clear_entry_type=0;
    v_fee_qty=0;
    v_fee_price=0;
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_settle_buy_rate=0;
    v_settle_sell_rate=0;
    v_deal_flag=0;
    v_settle_date=0;
    v_arrive_date=0;
    v_repo_pd_jour_no=0;
    v_repo_days=0;
    v_repo_first_settle_date=0;
    v_repo_back_date=0;
    v_cash_capt_days=0;
    strcpy(v_target_code, " ");
    v_target_code_stock_type=0;
    v_target_code_asset_type=0;
    v_repo_rate=0;
    v_repo_amt=0;
    v_repo_qty=0;
    v_repo_back_intrst=0;
    v_repo_trade_date=0;
    v_repo_cale_days=0;
    v_repo_back_trade_date=0;
    v_repo_order_id=0;
    v_exch_rate=0;
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
    strncpy(v_row_id_str, lpInBizMsg->GetString(LDBIZ_ROW_ID_STR_STR),2048);
    v_row_id_str[2048] = '\0';

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


    // set @回滚异常节点# = 1;
    v_undo_error_no = 1;

    // set @待入账数量# = 0;
    v_pre_entry_qty = 0;

    // set @待入账金额# = 0;
    v_pre_entry_amt = 0;

    // set @分隔符# = ";";
    strcpy(v_split_str,";");

    // [真代码][char *p;]
    char *p;


    // [真代码][p=strtok(v_row_id_str, v_split_str);]
    p=strtok(v_row_id_str, v_split_str);


    // [while循环开始][p != NULL]
    while (p != NULL)
    {


        // set @查询序号# = atoi(p);
        v_qry_no = atoi(p);
        //单记录转入方式，以便前台并发处理
        //调用过程[事务_交易证券_接口_处理清算成交回报]
        //组织事务请求
        if(lpTSCall1Ans1)
        {
          lpTSCall1Ans1->FreeMsg();
          lpTSCall1Ans1=NULL;
        }
        lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.20.1", 0);
        lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req1->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req1->SetInt32(LDBIZ_QRY_NO_INT,v_qry_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
        if(!lpTSCall1Ans1)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.20.1]subcall timed out!");
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
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
        v_record_count = lpTSCall1Ans1->GetInt32(LDBIZ_RECORD_COUNT_INT);
        v_row_id = lpTSCall1Ans1->GetInt64(LDBIZ_ROW_ID_INT64);
        v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans1->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_out_acco, lpTSCall1Ans1->GetString(LDBIZ_OUT_ACCO_STR));
        v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
        v_stock_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
        v_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        strcpy(v_stock_code, lpTSCall1Ans1->GetString(LDBIZ_STOCK_CODE_STR));
        v_target_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TARGET_STOCK_CODE_NO_INT);
        strcpy(v_target_stock_code, lpTSCall1Ans1->GetString(LDBIZ_TARGET_STOCK_CODE_STR));
        v_stock_type = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_TYPE_INT);
        v_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_strike_date = lpTSCall1Ans1->GetInt32(LDBIZ_STRIKE_DATE_INT);
        v_strike_time = lpTSCall1Ans1->GetInt32(LDBIZ_STRIKE_TIME_INT);
        strcpy(v_strike_no, lpTSCall1Ans1->GetString(LDBIZ_STRIKE_NO_STR));
        v_report_date = lpTSCall1Ans1->GetInt32(LDBIZ_REPORT_DATE_INT);
        v_report_time = lpTSCall1Ans1->GetInt32(LDBIZ_REPORT_TIME_INT);
        strcpy(v_report_no, lpTSCall1Ans1->GetString(LDBIZ_REPORT_NO_STR));
        v_order_date = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_DATE_INT);
        v_order_time = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_TIME_INT);
        v_order_no = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_NO_INT);
        v_order_dir = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_DIR_INT);
        v_order_price = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_strike_price = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
        v_strike_qty = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_all_fee = lpTSCall1Ans1->GetDouble(LDBIZ_ALL_FEE_FLOAT);
        v_trade_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
        v_target_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
        v_capit_reback_days = lpTSCall1Ans1->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
        v_posi_reback_days = lpTSCall1Ans1->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
        v_net_price_flag = lpTSCall1Ans1->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
        v_intrst_days = lpTSCall1Ans1->GetInt32(LDBIZ_INTRST_DAYS_INT);
        v_par_value = lpTSCall1Ans1->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
        v_bond_accr_intrst = lpTSCall1Ans1->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
        v_bond_rate_type = lpTSCall1Ans1->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
        v_impawn_ratio = lpTSCall1Ans1->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
        v_strike_deal_type = lpTSCall1Ans1->GetInt32(LDBIZ_STRIKE_DEAL_TYPE_INT);
        v_stamp_tax = lpTSCall1Ans1->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
        v_trans_fee = lpTSCall1Ans1->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
        v_brkage_fee = lpTSCall1Ans1->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
        v_SEC_charges = lpTSCall1Ans1->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
        v_other_fee = lpTSCall1Ans1->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
        v_trade_commis = lpTSCall1Ans1->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_other_commis = lpTSCall1Ans1->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_trade_tax = lpTSCall1Ans1->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
        v_trade_cost_fee = lpTSCall1Ans1->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
        v_trade_system_use_fee = lpTSCall1Ans1->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
        v_stock_settle_fee = lpTSCall1Ans1->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);


        // if @错误编码# <> "0" then
        if (strcmp(v_error_code , "0")!=0)
        {

            // set @备注信息# = concat("获取成交回报失败:",@错误信息#);
            snprintf(v_remark_info,sizeof(v_remark_info),"%s%s","获取成交回报失败:",v_error_info);
            //调用过程[事务_清算证券_清算_入账异常处理]
            //组织事务请求
            if(lpTSCall1Ans2)
            {
              lpTSCall1Ans2->FreeMsg();
              lpTSCall1Ans2=NULL;
            }
            lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
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
            lpTSCall1Req2->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
            lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req2->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
            lpTSCall1Req2->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
            lpTSCall1Req2->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
            lpTSCall1Req2->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
            lpTSCall1Req2->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
            glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 30000);
            if(!lpTSCall1Ans2)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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
            //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans2->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans2->GetString(LDBIZ_ERROR_INFO_STR));

            //set @错误编码// = "0";
            //set @错误信息// = " ";
            // leave label_pro;
            goto END;


        }
        // elseif @记录个数# = 0 then
        else if (v_record_count == 0)
        {

            // set @错误编码# = "0";
            strcpy(v_error_code,"0");

            // set @错误信息# = " ";
            strcpy(v_error_info," ");
            // leave label_pro;
            goto END;

        // end if;
        }


        // set @成交流水号# = @记录序号#;
        v_busi_jour_no = v_row_id;
        //调用过程[事务_公共_清算接口_获取机构业务控制配置串]
        //组织事务请求
        if(lpTSCall1Ans3)
        {
          lpTSCall1Ans3->FreeMsg();
          lpTSCall1Ans3=NULL;
        }
        lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.26.71", 0);
        lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req3->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
        if(!lpTSCall1Ans3)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.71]subcall timed out!");
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
        //获取输出参数值
        strcpy(v_error_code, lpTSCall1Ans3->GetString(LDBIZ_ERROR_CODE_STR));
        strcpy(v_error_info, lpTSCall1Ans3->GetString(LDBIZ_ERROR_INFO_STR));
        strcpy(v_co_busi_config_str, lpTSCall1Ans3->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));

        //机构业务控制配置串第9位，清算入账类型
        //set @清算入账类型//=substring(@机构业务控制配置串//, 9,1);

        // set @清算入账类型# = 1;
        v_clear_entry_type = 1;

        // if @市场编号# <>《市场编号-场外交易市场》 then
        if (v_exch_no !=5)
        {

            // set @费用数量# = @成交数量#;
            v_fee_qty = v_strike_qty;

            // set @费用价格# = @成交价格#;
            v_fee_price = v_strike_price;

            // set @成交金额# = @成交价格# * @成交数量#;
            v_strike_amt = v_strike_price * v_strike_qty;
            //获取市场本币币种、交易币种、汇率，并计算证券费用，后续按汇率转换
            //调用过程[事务_公共_清算接口_计算证券清算费用]
            //组织事务请求
            if(lpTSCall1Ans4)
            {
              lpTSCall1Ans4->FreeMsg();
              lpTSCall1Ans4=NULL;
            }
            lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pubT.26.21", 0);
            lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req4->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
            lpTSCall1Req4->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpTSCall1Req4->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
            lpTSCall1Req4->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req4->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
            lpTSCall1Req4->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
            lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
            lpTSCall1Req4->SetDouble(LDBIZ_FEE_QTY_FLOAT,v_fee_qty);
            lpTSCall1Req4->SetDouble(LDBIZ_FEE_PRICE_FLOAT,v_fee_price);
            lpTSCall1Req4->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
            lpTSCall1Req4->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
            lpTSCall1Req4->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
            lpTSCall1Req4->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
            glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
            if(!lpTSCall1Ans4)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.21]subcall timed out!");
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
            //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans4->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans4->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_crncy_type, lpTSCall1Ans4->GetString(LDBIZ_CRNCY_TYPE_STR));
            strcpy(v_exch_crncy_type, lpTSCall1Ans4->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
            v_stamp_tax = lpTSCall1Ans4->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
            v_trans_fee = lpTSCall1Ans4->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
            v_brkage_fee = lpTSCall1Ans4->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
            v_SEC_charges = lpTSCall1Ans4->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
            v_other_fee = lpTSCall1Ans4->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
            v_trade_commis = lpTSCall1Ans4->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
            v_other_commis = lpTSCall1Ans4->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
            v_trade_tax = lpTSCall1Ans4->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
            v_trade_cost_fee = lpTSCall1Ans4->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
            v_trade_system_use_fee = lpTSCall1Ans4->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
            v_stock_settle_fee = lpTSCall1Ans4->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);
            v_settle_buy_rate = lpTSCall1Ans4->GetDouble(LDBIZ_SETTLE_BUY_RATE_FLOAT);
            v_settle_sell_rate = lpTSCall1Ans4->GetDouble(LDBIZ_SETTLE_SELL_RATE_FLOAT);


            // if @错误编码# <> "0" then
            if (strcmp(v_error_code , "0")!=0)
            {

                // set @备注信息# = concat("计算清算费用错误|错误编码=", @错误编码#,"错误信息=", @错误信息#);
                snprintf(v_remark_info,sizeof(v_remark_info),"%s%s%s%s","计算清算费用错误|错误编码=",v_error_code,"错误信息=",v_error_info);
                //调用过程[事务_清算证券_清算_入账异常处理]
                //组织事务请求
                if(lpTSCall1Ans5)
                {
                  lpTSCall1Ans5->FreeMsg();
                  lpTSCall1Ans5=NULL;
                }
                lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
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
                lpTSCall1Req5->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                lpTSCall1Req5->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                lpTSCall1Req5->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpTSCall1Req5->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                lpTSCall1Req5->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                lpTSCall1Req5->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
                lpTSCall1Req5->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
                lpTSCall1Req5->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
                glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 30000);
                if(!lpTSCall1Ans5)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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
                //获取输出参数值
                strcpy(v_error_code, lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR));
                strcpy(v_error_info, lpTSCall1Ans5->GetString(LDBIZ_ERROR_INFO_STR));


                // set @处理标志# = 《处理标志-处理失败》;
                v_deal_flag = 4;
                //调用过程[事务_交易证券_接口_设置单记录成交回报记录处理标志]
                //组织事务请求
                if(lpTSCall1Ans6)
                {
                  lpTSCall1Ans6->FreeMsg();
                  lpTSCall1Ans6=NULL;
                }
                lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdsecuT.20.2", 0);
                lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req6->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                lpTSCall1Req6->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
                lpTSCall1Req6->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
                glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
                if(!lpTSCall1Ans6)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.20.2]subcall timed out!");
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
                //获取输出参数值
                strcpy(v_error_code, lpTSCall1Ans6->GetString(LDBIZ_ERROR_CODE_STR));
                strcpy(v_error_info, lpTSCall1Ans6->GetString(LDBIZ_ERROR_INFO_STR));


                // set @错误编码# = "0";
                strcpy(v_error_code,"0");

                // set @错误信息# = " ";
                strcpy(v_error_info," ");
                // leave label_pro;
                goto END;

            // end if;
            }


            // if @市场编号# =《市场编号-沪港通证券交易所》 or @市场编号# = 《市场编号-深港通证券交易所》 then
            if (v_exch_no ==3 || v_exch_no == 4)
            {
                //调用过程[事务_公共_清算接口_获取港股通交收日期]
                //组织事务请求
                if(lpTSCall1Ans7)
                {
                  lpTSCall1Ans7->FreeMsg();
                  lpTSCall1Ans7=NULL;
                }
                lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("pubT.26.82", 0);
                lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req7->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                lpTSCall1Req7->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
                if(!lpTSCall1Ans7)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.82]subcall timed out!");
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
                //获取输出参数值
                strcpy(v_error_code, lpTSCall1Ans7->GetString(LDBIZ_ERROR_CODE_STR));
                strcpy(v_error_info, lpTSCall1Ans7->GetString(LDBIZ_ERROR_INFO_STR));
                v_settle_date = lpTSCall1Ans7->GetInt32(LDBIZ_SETTLE_DATE_INT);


                // if @错误编码# <> "0" then
                if (strcmp(v_error_code , "0")!=0)
                {

                    // set @备注信息# = concat("获取港股交收日失败|错误编码=", @错误编码#,"错误信息=", @错误信息#);
                    snprintf(v_remark_info,sizeof(v_remark_info),"%s%s%s%s","获取港股交收日失败|错误编码=",v_error_code,"错误信息=",v_error_info);
                    //调用过程[事务_清算证券_清算_入账异常处理]
                    //组织事务请求
                    if(lpTSCall1Ans8)
                    {
                      lpTSCall1Ans8->FreeMsg();
                      lpTSCall1Ans8=NULL;
                    }
                    lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
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
                    lpTSCall1Req8->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                    lpTSCall1Req8->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                    lpTSCall1Req8->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
                    lpTSCall1Req8->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
                    lpTSCall1Req8->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
                    glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 30000);
                    if(!lpTSCall1Ans8)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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


                    // set @处理标志# = 《处理标志-处理失败》;
                    v_deal_flag = 4;
                    //调用过程[事务_交易证券_接口_设置单记录成交回报记录处理标志]
                    //组织事务请求
                    if(lpTSCall1Ans9)
                    {
                      lpTSCall1Ans9->FreeMsg();
                      lpTSCall1Ans9=NULL;
                    }
                    lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("tdsecuT.20.2", 0);
                    lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
                    lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                    lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                    lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                    lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                    lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                    lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                    lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                    lpTSCall1Req9->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                    lpTSCall1Req9->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
                    lpTSCall1Req9->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
                    glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
                    if(!lpTSCall1Ans9)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.20.2]subcall timed out!");
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
                    //获取输出参数值
                    strcpy(v_error_code, lpTSCall1Ans9->GetString(LDBIZ_ERROR_CODE_STR));
                    strcpy(v_error_info, lpTSCall1Ans9->GetString(LDBIZ_ERROR_INFO_STR));


                    // set @错误编码# = "0";
                    strcpy(v_error_code,"0");

                    // set @错误信息# = " ";
                    strcpy(v_error_info," ");
                    // leave label_pro;
                    goto END;

                // end if;
                }


                // set @到账日期# = @交收日期#;
                v_arrive_date = v_settle_date;
            // end if;
            }


            // if @订单方向# = 《订单方向-质押提交》 or @订单方向# = 《订单方向-质押转回》 then
            if (v_order_dir == 21 || v_order_dir == 22)
            {
                //调用过程[事务_公共_公共接口_获取交易代码编号信息]
                //组织事务请求
                if(lpTSCall1Ans10)
                {
                  lpTSCall1Ans10->FreeMsg();
                  lpTSCall1Ans10=NULL;
                }
                lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("pubT.24.108", 0);
                lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req10->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
                glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
                if(!lpTSCall1Ans10)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.108]subcall timed out!");
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
                v_stock_type = lpTSCall1Ans10->GetInt32(LDBIZ_STOCK_TYPE_INT);
                v_asset_type = lpTSCall1Ans10->GetInt32(LDBIZ_ASSET_TYPE_INT);

            // end if;
            }


            // set @回购流水号# =0;
            v_repo_pd_jour_no =0;

            // if @订单方向# = 《订单方向-融资回购》 or @订单方向# = 《订单方向-融券回购》 then
            if (v_order_dir == 3 || v_order_dir == 4)
            {
                //回购成交处理, 写入账户系统
                //第一步, 获取回购代码信息
                //调用过程[事务_公共_公共接口_获取编号回购参数信息]
                //组织事务请求
                if(lpTSCall1Ans11)
                {
                  lpTSCall1Ans11->FreeMsg();
                  lpTSCall1Ans11=NULL;
                }
                lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("pubT.24.107", 0);
                lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req11->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpTSCall1Req11->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
                if(!lpTSCall1Ans11)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.107]subcall timed out!");
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
                v_repo_days = lpTSCall1Ans11->GetInt32(LDBIZ_REPO_DAYS_INT);
                v_repo_first_settle_date = lpTSCall1Ans11->GetInt32(LDBIZ_REPO_FIRST_SETTLE_DATE_INT);
                v_repo_back_date = lpTSCall1Ans11->GetInt32(LDBIZ_REPO_BACK_DATE_INT);
                v_cash_capt_days = lpTSCall1Ans11->GetInt32(LDBIZ_CASH_CAPT_DAYS_INT);
                v_target_code_no = lpTSCall1Ans11->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
                strcpy(v_target_code, lpTSCall1Ans11->GetString(LDBIZ_TARGET_CODE_STR));
                v_target_code_stock_type = lpTSCall1Ans11->GetInt32(LDBIZ_TARGET_CODE_STOCK_TYPE_INT);
                v_target_code_asset_type = lpTSCall1Ans11->GetInt32(LDBIZ_TARGET_CODE_ASSET_TYPE_INT);


                // if @错误编码# <> "0" then
                if (strcmp(v_error_code , "0")!=0)
                {

                    // set @备注信息# = concat("获取回购参数失败|错误编码=", @错误编码#,"错误信息=", @错误信息#);
                    snprintf(v_remark_info,sizeof(v_remark_info),"%s%s%s%s","获取回购参数失败|错误编码=",v_error_code,"错误信息=",v_error_info);
                    //调用过程[事务_清算证券_清算_入账异常处理]
                    //组织事务请求
                    if(lpTSCall1Ans12)
                    {
                      lpTSCall1Ans12->FreeMsg();
                      lpTSCall1Ans12=NULL;
                    }
                    lpTSCall1Req12=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
                    lpTSCall1Req12->SetInt32(LDTAG_PRIORITY, iPriority);
                    lpTSCall1Req12->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                    lpTSCall1Req12->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                    lpTSCall1Req12->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                    lpTSCall1Req12->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                    lpTSCall1Req12->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                    lpTSCall1Req12->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                    lpTSCall1Req12->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                    lpTSCall1Req12->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                    lpTSCall1Req12->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                    lpTSCall1Req12->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                    lpTSCall1Req12->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                    lpTSCall1Req12->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                    lpTSCall1Req12->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                    lpTSCall1Req12->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                    lpTSCall1Req12->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                    lpTSCall1Req12->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
                    lpTSCall1Req12->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
                    lpTSCall1Req12->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
                    glpTSSubcallSerives->SubCall(lpTSCall1Req12, &lpTSCall1Ans12, 30000);
                    if(!lpTSCall1Ans12)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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
                    //获取输出参数值
                    strcpy(v_error_code, lpTSCall1Ans12->GetString(LDBIZ_ERROR_CODE_STR));
                    strcpy(v_error_info, lpTSCall1Ans12->GetString(LDBIZ_ERROR_INFO_STR));


                    // set @错误编码# = "0";
                    strcpy(v_error_code,"0");

                    // set @错误信息# = " ";
                    strcpy(v_error_info," ");
                    // leave label_pro;
                    goto END;

                // end if;
                }

                //20180201 证券类型和资产类型, 更改为标的代码的

                // set @证券类型# = @标的代码证券类型#;
                v_stock_type = v_target_code_stock_type;

                // set @资产类型# = @标的代码资产类型#;
                v_asset_type = v_target_code_asset_type;

                // set @证券代码# = @标的代码#;
                strcpy(v_stock_code,v_target_code);
                //第二步, 计算到期利息

                // set @回购利率# = @成交价格#;
                v_repo_rate = v_strike_price;

                // set @回购金额# = @成交数量# * 100;
                v_repo_amt = v_strike_qty * 100;

                // set @回购数量# =@成交数量#;
                v_repo_qty =v_strike_qty;

                // set @回购购回利息# = @回购数量# * @回购利率#;
                v_repo_back_intrst = v_repo_qty * v_repo_rate;

                // set @回购购回利息# = @回购购回利息# * @资金占款天数#;
                v_repo_back_intrst = v_repo_back_intrst * v_cash_capt_days;

                // set @回购购回利息# = @回购购回利息#/365;
                v_repo_back_intrst = v_repo_back_intrst/365;

                // set @回购交易日期# = @成交日期#;
                v_repo_trade_date = v_strike_date;

                // set @回购实际天数# = @资金占款天数#;
                v_repo_cale_days = v_cash_capt_days;

                // set @实际回购到期日期# = @回购到期日期#;
                v_repo_back_trade_date = v_repo_back_date;

                // set @到账日期#=@回购到期日期#;
                v_arrive_date=v_repo_back_date;

                // set @回购委托序号#=@订单编号#;
                v_repo_order_id=v_order_no;
                //第三步, 写入账户系统
                //调用过程[事务_产品证券_清算接口_写入回购记录]
                //组织事务请求
                if(lpTSCall1Ans13)
                {
                  lpTSCall1Ans13->FreeMsg();
                  lpTSCall1Ans13=NULL;
                }
                lpTSCall1Req13=glpFastMsgFactory->CreateFastMessage("pdsecuT.5.111", 0);
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
                lpTSCall1Req13->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpTSCall1Req13->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                lpTSCall1Req13->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                lpTSCall1Req13->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
                lpTSCall1Req13->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
                lpTSCall1Req13->SetString(LDBIZ_TARGET_CODE_STR,v_target_code);
                lpTSCall1Req13->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
                lpTSCall1Req13->SetDouble(LDBIZ_REPO_QTY_FLOAT,v_repo_qty);
                lpTSCall1Req13->SetDouble(LDBIZ_REPO_AMT_FLOAT,v_repo_amt);
                lpTSCall1Req13->SetDouble(LDBIZ_REPO_RATE_FLOAT,v_repo_rate);
                lpTSCall1Req13->SetInt32(LDBIZ_REPO_TRADE_DATE_INT,v_repo_trade_date);
                lpTSCall1Req13->SetInt32(LDBIZ_REPO_DAYS_INT,v_repo_days);
                lpTSCall1Req13->SetInt32(LDBIZ_REPO_CALE_DAYS_INT,v_repo_cale_days);
                lpTSCall1Req13->SetDouble(LDBIZ_REPO_BACK_INTRST_FLOAT,v_repo_back_intrst);
                lpTSCall1Req13->SetInt64(LDBIZ_REPO_ORDER_ID_INT64,v_repo_order_id);
                lpTSCall1Req13->SetInt32(LDBIZ_STRIKE_DEAL_TYPE_INT,v_strike_deal_type);
                lpTSCall1Req13->SetInt32(LDBIZ_REPO_BACK_TRADE_DATE_INT,v_repo_back_trade_date);
                lpTSCall1Req13->SetInt32(LDBIZ_REPO_FIRST_SETTLE_DATE_INT,v_repo_first_settle_date);
                glpTSSubcallSerives->SubCall(lpTSCall1Req13, &lpTSCall1Ans13, 5000);
                if(!lpTSCall1Ans13)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.5.111]subcall timed out!");
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


                // if @错误编码# <> "0" then
                if (strcmp(v_error_code , "0")!=0)
                {

                    // set @备注信息# = concat("回写产品库回购记录失败| 错误编码=", @错误编码#,"错误信息=", @错误信息#);
                    snprintf(v_remark_info,sizeof(v_remark_info),"%s%s%s%s","回写产品库回购记录失败| 错误编码=",v_error_code,"错误信息=",v_error_info);
                    //调用过程[事务_清算证券_清算_入账异常处理]
                    //组织事务请求
                    if(lpTSCall1Ans14)
                    {
                      lpTSCall1Ans14->FreeMsg();
                      lpTSCall1Ans14=NULL;
                    }
                    lpTSCall1Req14=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
                    lpTSCall1Req14->SetInt32(LDTAG_PRIORITY, iPriority);
                    lpTSCall1Req14->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                    lpTSCall1Req14->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                    lpTSCall1Req14->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                    lpTSCall1Req14->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                    lpTSCall1Req14->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                    lpTSCall1Req14->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                    lpTSCall1Req14->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                    lpTSCall1Req14->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                    lpTSCall1Req14->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                    lpTSCall1Req14->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                    lpTSCall1Req14->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                    lpTSCall1Req14->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                    lpTSCall1Req14->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                    lpTSCall1Req14->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                    lpTSCall1Req14->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                    lpTSCall1Req14->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
                    lpTSCall1Req14->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
                    lpTSCall1Req14->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
                    glpTSSubcallSerives->SubCall(lpTSCall1Req14, &lpTSCall1Ans14, 30000);
                    if(!lpTSCall1Ans14)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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
                    //获取输出参数值
                    strcpy(v_error_code, lpTSCall1Ans14->GetString(LDBIZ_ERROR_CODE_STR));
                    strcpy(v_error_info, lpTSCall1Ans14->GetString(LDBIZ_ERROR_INFO_STR));


                    // set @错误编码# = "0";
                    strcpy(v_error_code,"0");

                    // set @错误信息# = " ";
                    strcpy(v_error_info," ");
                    // leave label_pro;
                    goto END;

                }
                // else
                else
                {


                    // set  @回购流水号# = @记录序号#;
                     v_repo_pd_jour_no = v_row_id;
                // end if;
                }

            // end if;
            }


            // set @记录序号# = @成交流水号#;
            v_row_id = v_busi_jour_no;
            //汇率转换

            // if @订单方向# = 《订单方向-买入》 then
            if (v_order_dir == 1)
            {

                // set @汇率# = @卖出结算汇率#;
                v_exch_rate = v_settle_sell_rate;
            }
            // else
            else
            {


                // set @汇率# = @买入结算汇率#;
                v_exch_rate = v_settle_buy_rate;
            // end if;
            }

        }
        // else
        else
        {

        //场外基金成交处理,所有的费用从成交表中获取,不计算

            // set @汇率#=1;
            v_exch_rate=1;

            // set @回购流水号#=0;
            v_repo_pd_jour_no=0;

            // set @到账日期#=@初始化日期#;
            v_arrive_date=v_init_date;
        // end if;
        }

        //调用过程[事务_清算证券_清算_转入成交记录]
        //组织事务请求
        if(lpTSCall1Ans15)
        {
          lpTSCall1Ans15->FreeMsg();
          lpTSCall1Ans15=NULL;
        }
        lpTSCall1Req15=glpFastMsgFactory->CreateFastMessage("clsecuT.2.1", 0);
        lpTSCall1Req15->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req15->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req15->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req15->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req15->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req15->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req15->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req15->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req15->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req15->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req15->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpTSCall1Req15->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpTSCall1Req15->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req15->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
        lpTSCall1Req15->SetDouble(LDBIZ_EXCH_RATE_FLOAT,v_exch_rate);
        lpTSCall1Req15->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req15->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req15->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req15->SetInt32(LDBIZ_TARGET_STOCK_CODE_NO_INT,v_target_stock_code_no);
        lpTSCall1Req15->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req15->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
        lpTSCall1Req15->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
        lpTSCall1Req15->SetInt32(LDBIZ_STRIKE_TIME_INT,v_strike_time);
        lpTSCall1Req15->SetString(LDBIZ_STRIKE_NO_STR,v_strike_no);
        lpTSCall1Req15->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
        lpTSCall1Req15->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
        lpTSCall1Req15->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
        lpTSCall1Req15->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpTSCall1Req15->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
        lpTSCall1Req15->SetInt32(LDBIZ_ORDER_NO_INT,v_order_no);
        lpTSCall1Req15->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpTSCall1Req15->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
        lpTSCall1Req15->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpTSCall1Req15->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
        lpTSCall1Req15->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
        lpTSCall1Req15->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
        lpTSCall1Req15->SetDouble(LDBIZ_STAMP_TAX_FLOAT,v_stamp_tax);
        lpTSCall1Req15->SetDouble(LDBIZ_TRANS_FEE_FLOAT,v_trans_fee);
        lpTSCall1Req15->SetDouble(LDBIZ_BRKAGE_FEE_FLOAT,v_brkage_fee);
        lpTSCall1Req15->SetDouble(LDBIZ_SEC_CHARGES_FLOAT,v_SEC_charges);
        lpTSCall1Req15->SetDouble(LDBIZ_OTHER_FEE_FLOAT,v_other_fee);
        lpTSCall1Req15->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
        lpTSCall1Req15->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
        lpTSCall1Req15->SetDouble(LDBIZ_TRADE_TAX_FLOAT,v_trade_tax);
        lpTSCall1Req15->SetDouble(LDBIZ_TRADE_COST_FEE_FLOAT,v_trade_cost_fee);
        lpTSCall1Req15->SetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT,v_trade_system_use_fee);
        lpTSCall1Req15->SetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT,v_stock_settle_fee);
        lpTSCall1Req15->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
        lpTSCall1Req15->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
        lpTSCall1Req15->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
        lpTSCall1Req15->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
        lpTSCall1Req15->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
        lpTSCall1Req15->SetInt32(LDBIZ_ARRIVE_DATE_INT,v_arrive_date);
        lpTSCall1Req15->SetInt32(LDBIZ_INTRST_DAYS_INT,v_intrst_days);
        lpTSCall1Req15->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
        lpTSCall1Req15->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
        lpTSCall1Req15->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
        lpTSCall1Req15->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
        lpTSCall1Req15->SetInt32(LDBIZ_CLEAR_ENTRY_TYPE_INT,v_clear_entry_type);
        lpTSCall1Req15->SetInt32(LDBIZ_STRIKE_DEAL_TYPE_INT,v_strike_deal_type);
        lpTSCall1Req15->SetInt64(LDBIZ_BUSI_JOUR_NO_INT64,v_busi_jour_no);
        lpTSCall1Req15->SetInt64(LDBIZ_REPO_PD_JOUR_NO_INT64,v_repo_pd_jour_no);
        lpTSCall1Req15->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
        glpTSSubcallSerives->SubCall(lpTSCall1Req15, &lpTSCall1Ans15, 5000);
        if(!lpTSCall1Ans15)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.1]subcall timed out!");
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


        // if @错误编码# <> "0"  then
        if (strcmp(v_error_code , "0" )!=0)
        {

            // set @备注信息# = concat("转入成交失败|错误编码=", @错误编码#,"错误信息=", @错误信息#);
            snprintf(v_remark_info,sizeof(v_remark_info),"%s%s%s%s","转入成交失败|错误编码=",v_error_code,"错误信息=",v_error_info);
            //调用过程[事务_清算证券_清算_入账异常处理]
            //组织事务请求
            if(lpTSCall1Ans16)
            {
              lpTSCall1Ans16->FreeMsg();
              lpTSCall1Ans16=NULL;
            }
            lpTSCall1Req16=glpFastMsgFactory->CreateFastMessage("clsecuT.2.27", 0);
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
            lpTSCall1Req16->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpTSCall1Req16->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req16->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
            lpTSCall1Req16->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
            lpTSCall1Req16->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
            lpTSCall1Req16->SetInt32(LDBIZ_UNDO_ERROR_NO_INT,v_undo_error_no);
            lpTSCall1Req16->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
            glpTSSubcallSerives->SubCall(lpTSCall1Req16, &lpTSCall1Ans16, 30000);
            if(!lpTSCall1Ans16)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clsecuT.2.27]subcall timed out!");
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


            // set @处理标志# = 《处理标志-处理失败》;
            v_deal_flag = 4;
            //调用过程[事务_交易证券_接口_设置单记录成交回报记录处理标志]
            //组织事务请求
            if(lpTSCall1Ans17)
            {
              lpTSCall1Ans17->FreeMsg();
              lpTSCall1Ans17=NULL;
            }
            lpTSCall1Req17=glpFastMsgFactory->CreateFastMessage("tdsecuT.20.2", 0);
            lpTSCall1Req17->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req17->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req17->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req17->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req17->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req17->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req17->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req17->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req17->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
            lpTSCall1Req17->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
            lpTSCall1Req17->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
            glpTSSubcallSerives->SubCall(lpTSCall1Req17, &lpTSCall1Ans17, 5000);
            if(!lpTSCall1Ans17)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.20.2]subcall timed out!");
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

            //set @错误编码// = "0";
            //set @错误信息// = " ";
            // leave label_pro;
            goto END;

        // end if;
        }

        // p = strtok(NULL, v_split_str);
        p = strtok(NULL, v_split_str);


    // [while循环结束]
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
    lpOutBizMsg->SetInt32(LDBIZ_RECORD_COUNT_INT,v_record_count);
    lpOutBizMsg->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
    lpOutBizMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
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

