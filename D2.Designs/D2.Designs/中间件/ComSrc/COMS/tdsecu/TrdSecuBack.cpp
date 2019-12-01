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
int LD_CALL_MODE fnFunc25(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc26(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc27(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc28(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);

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
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.31");
        bizFuncInfo->lpFunc = fnFunc0;
    }
    else if (iFunIndex==1)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.32");
        bizFuncInfo->lpFunc = fnFunc1;
    }
    else if (iFunIndex==2)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.41");
        bizFuncInfo->lpFunc = fnFunc2;
    }
    else if (iFunIndex==3)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.42");
        bizFuncInfo->lpFunc = fnFunc3;
    }
    else if (iFunIndex==4)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.51");
        bizFuncInfo->lpFunc = fnFunc4;
    }
    else if (iFunIndex==5)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.52");
        bizFuncInfo->lpFunc = fnFunc5;
    }
    else if (iFunIndex==6)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.53");
        bizFuncInfo->lpFunc = fnFunc6;
    }
    else if (iFunIndex==7)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.54");
        bizFuncInfo->lpFunc = fnFunc7;
    }
    else if (iFunIndex==8)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.55");
        bizFuncInfo->lpFunc = fnFunc8;
    }
    else if (iFunIndex==9)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.56");
        bizFuncInfo->lpFunc = fnFunc9;
    }
    else if (iFunIndex==10)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.57");
        bizFuncInfo->lpFunc = fnFunc10;
    }
    else if (iFunIndex==11)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.58");
        bizFuncInfo->lpFunc = fnFunc11;
    }
    else if (iFunIndex==12)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.59");
        bizFuncInfo->lpFunc = fnFunc12;
    }
    else if (iFunIndex==13)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.60");
        bizFuncInfo->lpFunc = fnFunc13;
    }
    else if (iFunIndex==14)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.61");
        bizFuncInfo->lpFunc = fnFunc14;
    }
    else if (iFunIndex==15)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.62");
        bizFuncInfo->lpFunc = fnFunc15;
    }
    else if (iFunIndex==16)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.63");
        bizFuncInfo->lpFunc = fnFunc16;
    }
    else if (iFunIndex==17)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.64");
        bizFuncInfo->lpFunc = fnFunc17;
    }
    else if (iFunIndex==18)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.65");
        bizFuncInfo->lpFunc = fnFunc18;
    }
    else if (iFunIndex==19)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.66");
        bizFuncInfo->lpFunc = fnFunc19;
    }
    else if (iFunIndex==20)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.67");
        bizFuncInfo->lpFunc = fnFunc20;
    }
    else if (iFunIndex==21)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.68");
        bizFuncInfo->lpFunc = fnFunc21;
    }
    else if (iFunIndex==22)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.69");
        bizFuncInfo->lpFunc = fnFunc22;
    }
    else if (iFunIndex==23)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.70");
        bizFuncInfo->lpFunc = fnFunc23;
    }
    else if (iFunIndex==24)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.71");
        bizFuncInfo->lpFunc = fnFunc24;
    }
    else if (iFunIndex==25)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.72");
        bizFuncInfo->lpFunc = fnFunc25;
    }
    else if (iFunIndex==26)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.73");
        bizFuncInfo->lpFunc = fnFunc26;
    }
    else if (iFunIndex==27)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.74");
        bizFuncInfo->lpFunc = fnFunc27;
    }
    else if (iFunIndex==28)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.10.75");
        bizFuncInfo->lpFunc = fnFunc28;
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

//逻辑_交易证券_交易运维_查询指令
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
    int v_stock_code_no;
    char v_stock_type_str[2049];
    char v_asset_type_str[2049];
    char v_comm_dir_str[2049];
    char v_comm_status_str[65];
    char v_strike_status_str[65];
    int64 v_basket_id;
    char v_comm_oper_way[3];
    int v_exter_comm_flag;
    int v_comm_comple_flag;
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
    int v_asset_type;
    int v_stock_type;
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
    double v_comm_frozen_amt;
    double v_comm_frozen_qty;
    int v_net_price_flag;
    double v_par_value;
    double v_bond_accr_intrst;
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
    int v_update_times;
    char v_busi_ctrl_str[65];
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
    v_stock_code_no=0;
    strcpy(v_stock_type_str, " ");
    strcpy(v_asset_type_str, " ");
    strcpy(v_comm_dir_str, " ");
    strcpy(v_comm_status_str, " ");
    strcpy(v_strike_status_str, " ");
    v_basket_id=0;
    strcpy(v_comm_oper_way, " ");
    v_exter_comm_flag=0;
    v_comm_comple_flag=0;
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
    v_asset_type=0;
    v_stock_type=0;
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
    v_comm_frozen_amt=0;
    v_comm_frozen_qty=0;
    v_net_price_flag=0;
    v_par_value=0;
    v_bond_accr_intrst=0;
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
    v_update_times=1;
    strcpy(v_busi_ctrl_str, " ");
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
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strncpy(v_stock_type_str, lpInBizMsg->GetString(LDBIZ_STOCK_TYPE_STR_STR),2048);
    v_stock_type_str[2048] = '\0';
    strncpy(v_asset_type_str, lpInBizMsg->GetString(LDBIZ_ASSET_TYPE_STR_STR),2048);
    v_asset_type_str[2048] = '\0';
    strncpy(v_comm_dir_str, lpInBizMsg->GetString(LDBIZ_COMM_DIR_STR_STR),2048);
    v_comm_dir_str[2048] = '\0';
    strncpy(v_comm_status_str, lpInBizMsg->GetString(LDBIZ_COMM_STATUS_STR_STR),64);
    v_comm_status_str[64] = '\0';
    strncpy(v_strike_status_str, lpInBizMsg->GetString(LDBIZ_STRIKE_STATUS_STR_STR),64);
    v_strike_status_str[64] = '\0';
    v_basket_id = lpInBizMsg->GetInt64(LDBIZ_BASKET_ID_INT64);
    strncpy(v_comm_oper_way, lpInBizMsg->GetString(LDBIZ_COMM_OPER_WAY_STR),2);
    v_comm_oper_way[2] = '\0';
    v_exter_comm_flag = lpInBizMsg->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_comm_comple_flag = lpInBizMsg->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
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

    //调用过程[事务_交易证券_交易运维_查询指令]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.31", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_TYPE_STR_STR,v_asset_type_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_DIR_STR_STR,v_comm_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_STATUS_STR_STR,v_comm_status_str);
    lpTSCall1Req1->SetString(LDBIZ_STRIKE_STATUS_STR_STR,v_strike_status_str);
    lpTSCall1Req1->SetInt64(LDBIZ_BASKET_ID_INT64,v_basket_id);
    lpTSCall1Req1->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
    lpTSCall1Req1->SetInt32(LDBIZ_EXTER_COMM_FLAG_INT,v_exter_comm_flag);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_COMPLE_FLAG_INT,v_comm_comple_flag);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetInt32(LDBIZ_SORT_TYPE_INT,v_sort_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.31]subcall timed out!");
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

//逻辑_交易证券_交易运维_查询指令历史
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
    int v_stock_code_no;
    char v_stock_type_str[2049];
    char v_asset_type_str[2049];
    char v_comm_dir_str[2049];
    char v_comm_status_str[65];
    char v_strike_status_str[65];
    int64 v_basket_id;
    char v_comm_oper_way[3];
    int v_exter_comm_flag;
    int v_comm_comple_flag;
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
    int v_asset_type;
    int v_stock_type;
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
    double v_comm_frozen_amt;
    double v_comm_frozen_qty;
    int v_net_price_flag;
    double v_par_value;
    double v_bond_accr_intrst;
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
    int v_update_times;
    char v_busi_ctrl_str[65];
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
    v_stock_code_no=0;
    strcpy(v_stock_type_str, " ");
    strcpy(v_asset_type_str, " ");
    strcpy(v_comm_dir_str, " ");
    strcpy(v_comm_status_str, " ");
    strcpy(v_strike_status_str, " ");
    v_basket_id=0;
    strcpy(v_comm_oper_way, " ");
    v_exter_comm_flag=0;
    v_comm_comple_flag=0;
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
    v_asset_type=0;
    v_stock_type=0;
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
    v_comm_frozen_amt=0;
    v_comm_frozen_qty=0;
    v_net_price_flag=0;
    v_par_value=0;
    v_bond_accr_intrst=0;
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
    v_update_times=1;
    strcpy(v_busi_ctrl_str, " ");
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
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strncpy(v_stock_type_str, lpInBizMsg->GetString(LDBIZ_STOCK_TYPE_STR_STR),2048);
    v_stock_type_str[2048] = '\0';
    strncpy(v_asset_type_str, lpInBizMsg->GetString(LDBIZ_ASSET_TYPE_STR_STR),2048);
    v_asset_type_str[2048] = '\0';
    strncpy(v_comm_dir_str, lpInBizMsg->GetString(LDBIZ_COMM_DIR_STR_STR),2048);
    v_comm_dir_str[2048] = '\0';
    strncpy(v_comm_status_str, lpInBizMsg->GetString(LDBIZ_COMM_STATUS_STR_STR),64);
    v_comm_status_str[64] = '\0';
    strncpy(v_strike_status_str, lpInBizMsg->GetString(LDBIZ_STRIKE_STATUS_STR_STR),64);
    v_strike_status_str[64] = '\0';
    v_basket_id = lpInBizMsg->GetInt64(LDBIZ_BASKET_ID_INT64);
    strncpy(v_comm_oper_way, lpInBizMsg->GetString(LDBIZ_COMM_OPER_WAY_STR),2);
    v_comm_oper_way[2] = '\0';
    v_exter_comm_flag = lpInBizMsg->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_comm_comple_flag = lpInBizMsg->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
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

    //调用过程[事务_交易证券_交易运维_查询指令历史]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.32", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_TYPE_STR_STR,v_asset_type_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_DIR_STR_STR,v_comm_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_STATUS_STR_STR,v_comm_status_str);
    lpTSCall1Req1->SetString(LDBIZ_STRIKE_STATUS_STR_STR,v_strike_status_str);
    lpTSCall1Req1->SetInt64(LDBIZ_BASKET_ID_INT64,v_basket_id);
    lpTSCall1Req1->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
    lpTSCall1Req1->SetInt32(LDBIZ_EXTER_COMM_FLAG_INT,v_exter_comm_flag);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_COMPLE_FLAG_INT,v_comm_comple_flag);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.32]subcall timed out!");
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

//逻辑_交易证券_交易运维_查询订单
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
    int v_busi_opor_no;
    char v_order_oper_way_str[1025];
    int v_co_no;
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    int v_pass_no;
    char v_exch_no_str[2049];
    int v_stock_code_no;
    char v_stock_type_str[2049];
    int64 v_comm_id;
    int v_comm_batch_no;
    int v_comm_opor;
    int64 v_external_no;
    int v_order_batch_no;
    int64 v_order_id;
    char v_order_dir_str[1025];
    char v_order_status_str[65];
    char v_price_type_str[2049];
    int64 v_row_id;
    int v_row_count;
    int v_sort_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    char v_out_acco[33];
    int v_exch_no;
    int v_stock_acco_no;
    int v_asset_type;
    int v_stock_type;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_dir;
    int v_price_type;
    double v_order_price;
    double v_order_qty;
    char v_order_status[3];
    double v_wtdraw_qty;
    double v_strike_amt;
    double v_strike_qty;
    double v_all_fee;
    double v_stamp_tax;
    double v_trans_fee;
    double v_brkage_fee;
    double v_SEC_charges;
    double v_other_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_bond_accr_intrst;
    int v_net_price_flag;
    double v_order_frozen_amt;
    double v_order_frozen_qty;
    char v_rsp_info[256];
    int64 v_compli_trig_id;
    char v_remark_info[256];
    char v_order_oper_way[3];
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
    v_busi_opor_no=0;
    strcpy(v_order_oper_way_str, " ");
    v_co_no=0;
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    v_pass_no=0;
    strcpy(v_exch_no_str, " ");
    v_stock_code_no=0;
    strcpy(v_stock_type_str, " ");
    v_comm_id=0;
    v_comm_batch_no=0;
    v_comm_opor=0;
    v_external_no=0;
    v_order_batch_no=0;
    v_order_id=0;
    strcpy(v_order_dir_str, " ");
    strcpy(v_order_status_str, " ");
    strcpy(v_price_type_str, " ");
    v_row_id=0;
    v_row_count=-1;
    v_sort_type=1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    v_stock_acco_no=0;
    v_asset_type=0;
    v_stock_type=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_dir=0;
    v_price_type=0;
    v_order_price=0;
    v_order_qty=0;
    strcpy(v_order_status, "0");
    v_wtdraw_qty=0;
    v_strike_amt=0;
    v_strike_qty=0;
    v_all_fee=0;
    v_stamp_tax=0;
    v_trans_fee=0;
    v_brkage_fee=0;
    v_SEC_charges=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_bond_accr_intrst=0;
    v_net_price_flag=0;
    v_order_frozen_amt=0;
    v_order_frozen_qty=0;
    strcpy(v_rsp_info, " ");
    v_compli_trig_id=0;
    strcpy(v_remark_info, " ");
    strcpy(v_order_oper_way, " ");
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
    v_busi_opor_no = lpInBizMsg->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    strncpy(v_order_oper_way_str, lpInBizMsg->GetString(LDBIZ_ORDER_OPER_WAY_STR_STR),1024);
    v_order_oper_way_str[1024] = '\0';
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    strncpy(v_pd_no_str, lpInBizMsg->GetString(LDBIZ_PD_NO_STR_STR),2048);
    v_pd_no_str[2048] = '\0';
    strncpy(v_exch_group_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR),2048);
    v_exch_group_no_str[2048] = '\0';
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strncpy(v_stock_type_str, lpInBizMsg->GetString(LDBIZ_STOCK_TYPE_STR_STR),2048);
    v_stock_type_str[2048] = '\0';
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
    strncpy(v_price_type_str, lpInBizMsg->GetString(LDBIZ_PRICE_TYPE_STR_STR),2048);
    v_price_type_str[2048] = '\0';
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
    //set @业务控制串// = "111";
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

    //调用过程[事务_交易证券_交易运维_查询订单]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.41", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_OPER_WAY_STR_STR,v_order_oper_way_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_STR_STR,v_exch_group_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req1->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpTSCall1Req1->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpTSCall1Req1->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_STATUS_STR_STR,v_order_status_str);
    lpTSCall1Req1->SetString(LDBIZ_PRICE_TYPE_STR_STR,v_price_type_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetInt32(LDBIZ_SORT_TYPE_INT,v_sort_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.41]subcall timed out!");
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

//逻辑_交易证券_交易运维_查询订单历史
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
    int v_begin_date;
    int v_end_date;
    int v_busi_opor_no;
    char v_order_oper_way_str[1025];
    int v_co_no;
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    int v_pass_no;
    char v_exch_no_str[2049];
    int v_stock_code_no;
    char v_stock_type_str[2049];
    int64 v_comm_id;
    int v_comm_batch_no;
    int v_comm_opor;
    int64 v_external_no;
    int v_order_batch_no;
    int64 v_order_id;
    char v_order_dir_str[1025];
    char v_order_status_str[65];
    char v_price_type_str[2049];
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    char v_out_acco[33];
    int v_exch_no;
    int v_stock_acco_no;
    int v_asset_type;
    int v_stock_type;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_dir;
    int v_price_type;
    double v_order_price;
    double v_order_qty;
    char v_order_status[3];
    double v_wtdraw_qty;
    double v_strike_amt;
    double v_strike_qty;
    double v_all_fee;
    double v_stamp_tax;
    double v_trans_fee;
    double v_brkage_fee;
    double v_SEC_charges;
    double v_other_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_bond_accr_intrst;
    int v_net_price_flag;
    double v_order_frozen_amt;
    double v_order_frozen_qty;
    char v_rsp_info[256];
    int64 v_compli_trig_id;
    char v_remark_info[256];
    char v_order_oper_way[3];
    int v_update_times;
    char v_busi_ctrl_str[65];
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
    v_busi_opor_no=0;
    strcpy(v_order_oper_way_str, " ");
    v_co_no=0;
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    v_pass_no=0;
    strcpy(v_exch_no_str, " ");
    v_stock_code_no=0;
    strcpy(v_stock_type_str, " ");
    v_comm_id=0;
    v_comm_batch_no=0;
    v_comm_opor=0;
    v_external_no=0;
    v_order_batch_no=0;
    v_order_id=0;
    strcpy(v_order_dir_str, " ");
    strcpy(v_order_status_str, " ");
    strcpy(v_price_type_str, " ");
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    v_stock_acco_no=0;
    v_asset_type=0;
    v_stock_type=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_dir=0;
    v_price_type=0;
    v_order_price=0;
    v_order_qty=0;
    strcpy(v_order_status, "0");
    v_wtdraw_qty=0;
    v_strike_amt=0;
    v_strike_qty=0;
    v_all_fee=0;
    v_stamp_tax=0;
    v_trans_fee=0;
    v_brkage_fee=0;
    v_SEC_charges=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_bond_accr_intrst=0;
    v_net_price_flag=0;
    v_order_frozen_amt=0;
    v_order_frozen_qty=0;
    strcpy(v_rsp_info, " ");
    v_compli_trig_id=0;
    strcpy(v_remark_info, " ");
    strcpy(v_order_oper_way, " ");
    v_update_times=1;
    strcpy(v_busi_ctrl_str, " ");
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
    v_busi_opor_no = lpInBizMsg->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    strncpy(v_order_oper_way_str, lpInBizMsg->GetString(LDBIZ_ORDER_OPER_WAY_STR_STR),1024);
    v_order_oper_way_str[1024] = '\0';
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    strncpy(v_pd_no_str, lpInBizMsg->GetString(LDBIZ_PD_NO_STR_STR),2048);
    v_pd_no_str[2048] = '\0';
    strncpy(v_exch_group_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR),2048);
    v_exch_group_no_str[2048] = '\0';
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strncpy(v_stock_type_str, lpInBizMsg->GetString(LDBIZ_STOCK_TYPE_STR_STR),2048);
    v_stock_type_str[2048] = '\0';
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
    strncpy(v_price_type_str, lpInBizMsg->GetString(LDBIZ_PRICE_TYPE_STR_STR),2048);
    v_price_type_str[2048] = '\0';
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

    //调用过程[事务_交易证券_交易运维_查询订单历史]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.42", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_ORDER_OPER_WAY_STR_STR,v_order_oper_way_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_STR_STR,v_exch_group_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req1->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpTSCall1Req1->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpTSCall1Req1->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_STATUS_STR_STR,v_order_status_str);
    lpTSCall1Req1->SetString(LDBIZ_PRICE_TYPE_STR_STR,v_price_type_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.42]subcall timed out!");
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

//逻辑_交易证券_交易运维_查询订单回报
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
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    char v_exch_no_str[2049];
    char v_stock_acco[17];
    char v_stock_code[7];
    char v_order_dir_str[1025];
    char v_order_rsp_status_str[65];
    char v_deal_status_str[65];
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_asset_acco_no;
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
    int v_price_type;
    char v_order_rsp_status[3];
    char v_rsp_info[256];
    char v_deal_status[3];
    int v_update_times;
    char v_busi_ctrl_str[65];
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
    strcpy(v_exch_no_str, " ");
    strcpy(v_stock_acco, " ");
    strcpy(v_stock_code, " ");
    strcpy(v_order_dir_str, " ");
    strcpy(v_order_rsp_status_str, " ");
    strcpy(v_deal_status_str, " ");
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_asset_acco_no=0;
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
    v_price_type=0;
    strcpy(v_order_rsp_status, "0");
    strcpy(v_rsp_info, " ");
    strcpy(v_deal_status, "0");
    v_update_times=1;
    strcpy(v_busi_ctrl_str, " ");
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
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    strncpy(v_stock_acco, lpInBizMsg->GetString(LDBIZ_STOCK_ACCO_STR),16);
    v_stock_acco[16] = '\0';
    strncpy(v_stock_code, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR),6);
    v_stock_code[6] = '\0';
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    strncpy(v_order_rsp_status_str, lpInBizMsg->GetString(LDBIZ_ORDER_RSP_STATUS_STR_STR),64);
    v_order_rsp_status_str[64] = '\0';
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

    //调用过程[事务_交易证券_交易运维_查询订单回报]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.51", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_RSP_STATUS_STR_STR,v_order_rsp_status_str);
    lpTSCall1Req1->SetString(LDBIZ_DEAL_STATUS_STR_STR,v_deal_status_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.51]subcall timed out!");
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

//逻辑_交易证券_交易运维_查询成交回报
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
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    char v_exch_no_str[2049];
    char v_stock_acco[17];
    char v_stock_code[7];
    char v_order_dir_str[1025];
    char v_deal_status_str[65];
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_asset_acco_no;
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
    int v_report_date;
    char v_busi_ctrl_str[65];
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
    strcpy(v_exch_no_str, " ");
    strcpy(v_stock_acco, " ");
    strcpy(v_stock_code, " ");
    strcpy(v_order_dir_str, " ");
    strcpy(v_deal_status_str, " ");
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_asset_acco_no=0;
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
    v_report_date=0;
    strcpy(v_busi_ctrl_str, " ");
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
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    strncpy(v_stock_acco, lpInBizMsg->GetString(LDBIZ_STOCK_ACCO_STR),16);
    v_stock_acco[16] = '\0';
    strncpy(v_stock_code, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR),6);
    v_stock_code[6] = '\0';
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

    //调用过程[事务_交易证券_交易运维_查询成交回报]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.52", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_DEAL_STATUS_STR_STR,v_deal_status_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.52]subcall timed out!");
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

//逻辑_交易证券_交易运维_查询成交明细
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
    int v_busi_opor_no;
    char v_order_oper_way_str[1025];
    int v_co_no;
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    char v_exch_no_str[2049];
    int v_stock_code_no;
    char v_stock_type_str[2049];
    int64 v_comm_id;
    int v_comm_batch_no;
    char v_order_dir_str[1025];
    int v_exter_comm_flag;
    int v_record_valid_flag;
    int64 v_row_id;
    int v_row_count;
    int v_sort_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_type;
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    int v_report_date;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int64 v_order_id;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    double v_strike_qty;
    double v_strike_price;
    double v_strike_amt;
    double v_all_fee;
    double v_stamp_tax;
    double v_trans_fee;
    double v_brkage_fee;
    double v_SEC_charges;
    double v_other_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_bond_accr_intrst;
    double v_strike_bond_accr_intrst;
    int v_net_price_flag;
    char v_order_oper_way[3];
    int v_update_times;
    char v_busi_ctrl_str[65];
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
    v_busi_opor_no=0;
    strcpy(v_order_oper_way_str, " ");
    v_co_no=0;
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    strcpy(v_exch_no_str, " ");
    v_stock_code_no=0;
    strcpy(v_stock_type_str, " ");
    v_comm_id=0;
    v_comm_batch_no=0;
    strcpy(v_order_dir_str, " ");
    v_exter_comm_flag=0;
    v_record_valid_flag=0;
    v_row_id=0;
    v_row_count=-1;
    v_sort_type=1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_type=0;
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_report_date=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_id=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_strike_qty=0;
    v_strike_price=0;
    v_strike_amt=0;
    v_all_fee=0;
    v_stamp_tax=0;
    v_trans_fee=0;
    v_brkage_fee=0;
    v_SEC_charges=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_bond_accr_intrst=0;
    v_strike_bond_accr_intrst=0;
    v_net_price_flag=0;
    strcpy(v_order_oper_way, " ");
    v_update_times=1;
    strcpy(v_busi_ctrl_str, " ");
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
    v_busi_opor_no = lpInBizMsg->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    strncpy(v_order_oper_way_str, lpInBizMsg->GetString(LDBIZ_ORDER_OPER_WAY_STR_STR),1024);
    v_order_oper_way_str[1024] = '\0';
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    strncpy(v_pd_no_str, lpInBizMsg->GetString(LDBIZ_PD_NO_STR_STR),2048);
    v_pd_no_str[2048] = '\0';
    strncpy(v_exch_group_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR),2048);
    v_exch_group_no_str[2048] = '\0';
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strncpy(v_stock_type_str, lpInBizMsg->GetString(LDBIZ_STOCK_TYPE_STR_STR),2048);
    v_stock_type_str[2048] = '\0';
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpInBizMsg->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    v_exter_comm_flag = lpInBizMsg->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_record_valid_flag = lpInBizMsg->GetInt32(LDBIZ_RECORD_VALID_FLAG_INT);
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

    //调用过程[事务_交易证券_交易运维_查询成交明细]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.53", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_OPER_WAY_STR_STR,v_order_oper_way_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_STR_STR,v_exch_group_no_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req1->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetInt32(LDBIZ_EXTER_COMM_FLAG_INT,v_exter_comm_flag);
    lpTSCall1Req1->SetInt32(LDBIZ_RECORD_VALID_FLAG_INT,v_record_valid_flag);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetInt32(LDBIZ_SORT_TYPE_INT,v_sort_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.53]subcall timed out!");
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

//逻辑_交易证券_交易运维_查询成交明细历史
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
    int v_busi_opor_no;
    char v_order_oper_way_str[1025];
    int v_co_no;
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    char v_exch_no_str[2049];
    int v_stock_code_no;
    char v_stock_type_str[2049];
    int64 v_comm_id;
    int v_comm_batch_no;
    char v_order_dir_str[1025];
    int v_exter_comm_flag;
    int v_record_valid_flag;
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_type;
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    int v_report_date;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int64 v_order_id;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    double v_strike_qty;
    double v_strike_price;
    double v_strike_amt;
    double v_all_fee;
    double v_stamp_tax;
    double v_trans_fee;
    double v_brkage_fee;
    double v_SEC_charges;
    double v_other_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_bond_accr_intrst;
    int v_net_price_flag;
    double v_strike_bond_accr_intrst;
    char v_order_oper_way[3];
    int v_update_times;
    char v_busi_ctrl_str[65];
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
    v_busi_opor_no=0;
    strcpy(v_order_oper_way_str, " ");
    v_co_no=0;
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    strcpy(v_exch_no_str, " ");
    v_stock_code_no=0;
    strcpy(v_stock_type_str, " ");
    v_comm_id=0;
    v_comm_batch_no=0;
    strcpy(v_order_dir_str, " ");
    v_exter_comm_flag=0;
    v_record_valid_flag=0;
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_type=0;
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_report_date=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_id=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_strike_qty=0;
    v_strike_price=0;
    v_strike_amt=0;
    v_all_fee=0;
    v_stamp_tax=0;
    v_trans_fee=0;
    v_brkage_fee=0;
    v_SEC_charges=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_bond_accr_intrst=0;
    v_net_price_flag=0;
    v_strike_bond_accr_intrst=0;
    strcpy(v_order_oper_way, " ");
    v_update_times=1;
    strcpy(v_busi_ctrl_str, " ");
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
    v_busi_opor_no = lpInBizMsg->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    strncpy(v_order_oper_way_str, lpInBizMsg->GetString(LDBIZ_ORDER_OPER_WAY_STR_STR),1024);
    v_order_oper_way_str[1024] = '\0';
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    strncpy(v_pd_no_str, lpInBizMsg->GetString(LDBIZ_PD_NO_STR_STR),2048);
    v_pd_no_str[2048] = '\0';
    strncpy(v_exch_group_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR),2048);
    v_exch_group_no_str[2048] = '\0';
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strncpy(v_stock_type_str, lpInBizMsg->GetString(LDBIZ_STOCK_TYPE_STR_STR),2048);
    v_stock_type_str[2048] = '\0';
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpInBizMsg->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    v_exter_comm_flag = lpInBizMsg->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_record_valid_flag = lpInBizMsg->GetInt32(LDBIZ_RECORD_VALID_FLAG_INT);
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

    //调用过程[事务_交易证券_交易运维_查询成交明细历史]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.54", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_ORDER_OPER_WAY_STR_STR,v_order_oper_way_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_STR_STR,v_exch_group_no_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req1->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetInt32(LDBIZ_EXTER_COMM_FLAG_INT,v_exter_comm_flag);
    lpTSCall1Req1->SetInt32(LDBIZ_RECORD_VALID_FLAG_INT,v_record_valid_flag);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.54]subcall timed out!");
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

//逻辑_交易证券_交易运维_查询机构统计订单
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
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
    int v_co_no;
    char v_order_status[3];
    char v_order_oper_way[3];
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
    v_row_id=0;
    v_co_no=0;
    strcpy(v_order_status, "0");
    strcpy(v_order_oper_way, " ");
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

    //调用过程[事务_交易证券_交易运维_查询机构统计订单]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.55", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.55]subcall timed out!");
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

//逻辑_交易证券_交易运维_计算资产账户持仓数量同步产品库
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
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_asset_acco_no;
    char v_exch_no_str[2049];
    int v_stock_acco_no;
    char v_stock_code_no_str[4097];
    char v_pd_no_rights_str[2049];
    int v_posi_reback_days;
    int64 v_row_id;
    int v_row_count;
    int v_create_date;
    int v_create_time;
    int v_update_date;
    int v_update_time;
    int v_exch_no;
    int v_stock_code_no;
    double v_begin_qty;
    double v_curr_qty;
    double v_frozen_qty;
    double v_unfroz_qty;
    double v_comm_frozen_qty;
    double v_comm_unfroz_qty;
    double v_comm_capt_qty;
    double v_comm_releas_qty;
    double v_trade_frozen_qty;
    double v_trade_unfroz_qty;
    double v_trade_capt_qty;
    double v_trade_releas_qty;
    double v_strike_capt_qty;
    double v_strike_releas_qty;
    double v_strike_frozen_qty;
    double v_strike_unfroz_qty;
    double v_cost_amt;
    double v_intrst_cost_amt;
    int v_update_times;
    double v_realize_pandl;
    double v_intrst_pandl;
    double v_posi_qty;
    int v_exch_group_no;
    char v_stock_type_str[2049];
    char v_exch_group_no_rights_str[2049];
    char v_log_error_code[33];
    char v_log_error_info[256];

    IGroup* lpMainMsg=NULL;
    int iRecordCount = 0;
    IGroup* lpMainMsg2=NULL;

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
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_asset_acco_no=0;
    strcpy(v_exch_no_str, " ");
    v_stock_acco_no=0;
    strcpy(v_stock_code_no_str, " ");
    strcpy(v_pd_no_rights_str, " ");
    v_posi_reback_days=0;
    v_row_id=0;
    v_row_count=-1;
    v_create_date=0;
    v_create_time=0;
    v_update_date=0;
    v_update_time=0;
    v_exch_no=0;
    v_stock_code_no=0;
    v_begin_qty=0;
    v_curr_qty=0;
    v_frozen_qty=0;
    v_unfroz_qty=0;
    v_comm_frozen_qty=0;
    v_comm_unfroz_qty=0;
    v_comm_capt_qty=0;
    v_comm_releas_qty=0;
    v_trade_frozen_qty=0;
    v_trade_unfroz_qty=0;
    v_trade_capt_qty=0;
    v_trade_releas_qty=0;
    v_strike_capt_qty=0;
    v_strike_releas_qty=0;
    v_strike_frozen_qty=0;
    v_strike_unfroz_qty=0;
    v_cost_amt=0;
    v_intrst_cost_amt=0;
    v_update_times=1;
    v_realize_pandl=0;
    v_intrst_pandl=0;
    v_posi_qty=0;
    v_exch_group_no=0;
    strcpy(v_stock_type_str, " ");
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


    // set @资产账户编号# = 0;
    v_asset_acco_no = 0;

    // set @市场编号串# = " ";
    strcpy(v_exch_no_str," ");

    // set @股东代码编号# = 0;
    v_stock_acco_no = 0;

    // set @证券代码编号串# = " ";
    strcpy(v_stock_code_no_str," ");

    // set @产品编号权限串# = " ";
    strcpy(v_pd_no_rights_str," ");

    // set @持仓回转天数# = 0;
    v_posi_reback_days = 0;

    // set @记录序号# = 0;
    v_row_id = 0;

    // set @指定行数# = -1;
    v_row_count = -1;
    //调用过程[事务_交易证券_账户_查询资产账户持仓]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.2.8", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_NO_STR_STR,v_stock_code_no_str);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.2.8]subcall timed out!");
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
            v_row_id = lpRecord->GetInt64(LDBIZ_ROW_ID_INT64);
            v_create_date = lpRecord->GetInt32(LDBIZ_CREATE_DATE_INT);
            v_create_time = lpRecord->GetInt32(LDBIZ_CREATE_TIME_INT);
            v_update_date = lpRecord->GetInt32(LDBIZ_UPDATE_DATE_INT);
            v_update_time = lpRecord->GetInt32(LDBIZ_UPDATE_TIME_INT);
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
            v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
            v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
            v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
            v_begin_qty = lpRecord->GetDouble(LDBIZ_BEGIN_QTY_FLOAT);
            v_curr_qty = lpRecord->GetDouble(LDBIZ_CURR_QTY_FLOAT);
            v_frozen_qty = lpRecord->GetDouble(LDBIZ_FROZEN_QTY_FLOAT);
            v_unfroz_qty = lpRecord->GetDouble(LDBIZ_UNFROZ_QTY_FLOAT);
            v_comm_frozen_qty = lpRecord->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
            v_comm_unfroz_qty = lpRecord->GetDouble(LDBIZ_COMM_UNFROZ_QTY_FLOAT);
            v_comm_capt_qty = lpRecord->GetDouble(LDBIZ_COMM_CAPT_QTY_FLOAT);
            v_comm_releas_qty = lpRecord->GetDouble(LDBIZ_COMM_RELEAS_QTY_FLOAT);
            v_trade_frozen_qty = lpRecord->GetDouble(LDBIZ_TRADE_FROZEN_QTY_FLOAT);
            v_trade_unfroz_qty = lpRecord->GetDouble(LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
            v_trade_capt_qty = lpRecord->GetDouble(LDBIZ_TRADE_CAPT_QTY_FLOAT);
            v_trade_releas_qty = lpRecord->GetDouble(LDBIZ_TRADE_RELEAS_QTY_FLOAT);
            v_strike_capt_qty = lpRecord->GetDouble(LDBIZ_STRIKE_CAPT_QTY_FLOAT);
            v_strike_releas_qty = lpRecord->GetDouble(LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
            v_strike_frozen_qty = lpRecord->GetDouble(LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
            v_strike_unfroz_qty = lpRecord->GetDouble(LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
            v_cost_amt = lpRecord->GetDouble(LDBIZ_COST_AMT_FLOAT);
            v_intrst_cost_amt = lpRecord->GetDouble(LDBIZ_INTRST_COST_AMT_FLOAT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);
            v_realize_pandl = lpRecord->GetDouble(LDBIZ_REALIZE_PANDL_FLOAT);
            v_intrst_pandl = lpRecord->GetDouble(LDBIZ_INTRST_PANDL_FLOAT);

        //调用过程[事务_交易证券_账户_计算资产账户持仓数量]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("tdsecuT.2.45", 0);
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
        lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req2->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req2->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.2.45]subcall timed out!");
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
        v_posi_qty = lpTSCall1Ans2->GetDouble(LDBIZ_POSI_QTY_FLOAT);

        //调用过程[事务_产品证券_持仓_更新交易持仓]
        //组织事务请求
        if(lpTSCall1Ans3)
        {
          lpTSCall1Ans3->FreeMsg();
          lpTSCall1Ans3=NULL;
        }
        lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdsecuT.3.505", 0);
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
        lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req3->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req3->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req3->SetDouble(LDBIZ_POSI_QTY_FLOAT,v_posi_qty);
        lpTSCall1Req3->SetDouble(LDBIZ_COST_AMT_FLOAT,v_cost_amt);
        glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
        if(!lpTSCall1Ans3)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.3.505]subcall timed out!");
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


    // [遍历结果集结束][lpMainMsg]
        }
    }


    // set @交易组编号# = 0;
    v_exch_group_no = 0;

    // set @证券类型串# = " ";
    strcpy(v_stock_type_str," ");

    // set @记录序号# = 0;
    v_row_id = 0;

    // set @指定行数# = -1;
    v_row_count = -1;

    // set @交易组编号权限串# = " ";
    strcpy(v_exch_group_no_rights_str," ");

    // set @资产账户编号# = 0;
    v_asset_acco_no = 0;

    // set @股东代码编号# = 0;
    v_stock_acco_no = 0;
    //调用过程[事务_交易证券_账户_查询交易组持仓]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("tdsecuT.2.7", 0);
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
    lpTSCall1Req4->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req4->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req4->SetString(LDBIZ_STOCK_CODE_NO_STR_STR,v_stock_code_no_str);
    lpTSCall1Req4->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req4->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req4->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req4->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.2.7]subcall timed out!");
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


    // [获取结果集][lpMainMsg2]
    lpMainMsg2=lpTSCall1Ans4->GetGroup(LDTAG_NO_RESULTSET);


    // [遍历结果集开始][lpMainMsg2]
    iRecordCount = lpMainMsg2->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpMainMsg2->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            v_row_id = lpRecord->GetInt64(LDBIZ_ROW_ID_INT64);
            v_create_date = lpRecord->GetInt32(LDBIZ_CREATE_DATE_INT);
            v_create_time = lpRecord->GetInt32(LDBIZ_CREATE_TIME_INT);
            v_update_date = lpRecord->GetInt32(LDBIZ_UPDATE_DATE_INT);
            v_update_time = lpRecord->GetInt32(LDBIZ_UPDATE_TIME_INT);
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
            v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
            v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
            v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
            v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
            v_begin_qty = lpRecord->GetDouble(LDBIZ_BEGIN_QTY_FLOAT);
            v_curr_qty = lpRecord->GetDouble(LDBIZ_CURR_QTY_FLOAT);
            v_frozen_qty = lpRecord->GetDouble(LDBIZ_FROZEN_QTY_FLOAT);
            v_unfroz_qty = lpRecord->GetDouble(LDBIZ_UNFROZ_QTY_FLOAT);
            v_comm_frozen_qty = lpRecord->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
            v_comm_unfroz_qty = lpRecord->GetDouble(LDBIZ_COMM_UNFROZ_QTY_FLOAT);
            v_comm_capt_qty = lpRecord->GetDouble(LDBIZ_COMM_CAPT_QTY_FLOAT);
            v_comm_releas_qty = lpRecord->GetDouble(LDBIZ_COMM_RELEAS_QTY_FLOAT);
            v_trade_frozen_qty = lpRecord->GetDouble(LDBIZ_TRADE_FROZEN_QTY_FLOAT);
            v_trade_unfroz_qty = lpRecord->GetDouble(LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
            v_trade_capt_qty = lpRecord->GetDouble(LDBIZ_TRADE_CAPT_QTY_FLOAT);
            v_trade_releas_qty = lpRecord->GetDouble(LDBIZ_TRADE_RELEAS_QTY_FLOAT);
            v_strike_capt_qty = lpRecord->GetDouble(LDBIZ_STRIKE_CAPT_QTY_FLOAT);
            v_strike_releas_qty = lpRecord->GetDouble(LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
            v_strike_frozen_qty = lpRecord->GetDouble(LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
            v_strike_unfroz_qty = lpRecord->GetDouble(LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
            v_cost_amt = lpRecord->GetDouble(LDBIZ_COST_AMT_FLOAT);
            v_intrst_cost_amt = lpRecord->GetDouble(LDBIZ_INTRST_COST_AMT_FLOAT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);
            v_realize_pandl = lpRecord->GetDouble(LDBIZ_REALIZE_PANDL_FLOAT);
            v_intrst_pandl = lpRecord->GetDouble(LDBIZ_INTRST_PANDL_FLOAT);

        //调用过程[事务_交易证券_账户_计算交易组持仓数量]
        //组织事务请求
        if(lpTSCall1Ans5)
        {
          lpTSCall1Ans5->FreeMsg();
          lpTSCall1Ans5=NULL;
        }
        lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("tdsecuT.2.44", 0);
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
        lpTSCall1Req5->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req5->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req5->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
        if(!lpTSCall1Ans5)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.2.44]subcall timed out!");
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
        v_posi_qty = lpTSCall1Ans5->GetDouble(LDBIZ_POSI_QTY_FLOAT);

        //调用过程[事务_产品证券_持仓_更新交易库交易组持仓]
        //组织事务请求
        if(lpTSCall1Ans6)
        {
          lpTSCall1Ans6->FreeMsg();
          lpTSCall1Ans6=NULL;
        }
        lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("pdsecuT.3.506", 0);
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
        lpTSCall1Req6->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req6->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req6->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req6->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req6->SetDouble(LDBIZ_POSI_QTY_FLOAT,v_posi_qty);
        lpTSCall1Req6->SetDouble(LDBIZ_COST_AMT_FLOAT,v_cost_amt);
        glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
        if(!lpTSCall1Ans6)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.3.506]subcall timed out!");
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

//逻辑_交易证券_交易运维_计算资产账户资金可用同步产品库
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
    int v_co_no;
    int v_pd_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_asset_acco_no;
    char v_exch_crncy_type[4];
    int64 v_row_id;
    int v_row_count;
    char v_pd_no_rights_str[2049];
    int v_capit_reback_days;
    double v_buy_ref_rate;
    double v_sell_ref_rate;
    char v_sys_config_str[65];
    int v_create_date;
    int v_create_time;
    int v_update_date;
    int v_update_time;
    double v_begin_amt;
    double v_curr_amt;
    double v_frozen_amt;
    double v_unfroz_amt;
    double v_comm_frozen_amt;
    double v_comm_unfroz_amt;
    double v_comm_capt_amt;
    double v_comm_releas_amt;
    double v_trade_frozen_amt;
    double v_trade_unfroz_amt;
    double v_trade_capt_amt;
    double v_trade_releas_amt;
    double v_strike_capt_amt;
    double v_strike_releas_amt;
    int v_update_times;
    double v_shsz_avail_amt;
    double v_hk_avail_amt;
    double v_static_avail_amt;
    int v_exch_group_no;
    char v_exch_group_no_rights_str[2049];
    char v_log_error_code[33];
    char v_log_error_info[256];

    IGroup* lpMainMsg=NULL;
    int iRecordCount = 0;
    IGroup* lpMainMsg2=NULL;

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
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_asset_acco_no=0;
    strcpy(v_exch_crncy_type, "CNY");
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_pd_no_rights_str, " ");
    v_capit_reback_days=0;
    v_buy_ref_rate=0;
    v_sell_ref_rate=0;
    strcpy(v_sys_config_str, " ");
    v_create_date=0;
    v_create_time=0;
    v_update_date=0;
    v_update_time=0;
    v_begin_amt=0;
    v_curr_amt=0;
    v_frozen_amt=0;
    v_unfroz_amt=0;
    v_comm_frozen_amt=0;
    v_comm_unfroz_amt=0;
    v_comm_capt_amt=0;
    v_comm_releas_amt=0;
    v_trade_frozen_amt=0;
    v_trade_unfroz_amt=0;
    v_trade_capt_amt=0;
    v_trade_releas_amt=0;
    v_strike_capt_amt=0;
    v_strike_releas_amt=0;
    v_update_times=1;
    v_shsz_avail_amt=0;
    v_hk_avail_amt=0;
    v_static_avail_amt=0;
    v_exch_group_no=0;
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


    // set @资产账户编号# = 0;
    v_asset_acco_no = 0;

    // set @交易币种# = " ";
    strcpy(v_exch_crncy_type," ");

    // set @记录序号# = 0;
    v_row_id = 0;

    // set @指定行数# = -1;
    v_row_count = -1;

    // set @产品编号权限串# = " ";
    strcpy(v_pd_no_rights_str," ");

    // set @资金回转天数# = 0;
    v_capit_reback_days = 0;
    //调用过程[事务_公共_公共接口_获取港股参考汇率]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.24.41", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.41]subcall timed out!");
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
    v_buy_ref_rate = lpTSCall1Ans1->GetDouble(LDBIZ_BUY_REF_RATE_FLOAT);
    v_sell_ref_rate = lpTSCall1Ans1->GetDouble(LDBIZ_SELL_REF_RATE_FLOAT);
    strcpy(v_sys_config_str, lpTSCall1Ans1->GetString(LDBIZ_SYS_CONFIG_STR_STR));

    //调用过程[事务_交易证券_账户_查询资产账户资金]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("tdsecuT.2.6", 0);
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
    lpTSCall1Req2->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req2->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req2->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req2->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.2.6]subcall timed out!");
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


    // [遍历结果集开始][lpMainMsg]
    iRecordCount = lpMainMsg->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpMainMsg->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            v_row_id = lpRecord->GetInt64(LDBIZ_ROW_ID_INT64);
            v_create_date = lpRecord->GetInt32(LDBIZ_CREATE_DATE_INT);
            v_create_time = lpRecord->GetInt32(LDBIZ_CREATE_TIME_INT);
            v_update_date = lpRecord->GetInt32(LDBIZ_UPDATE_DATE_INT);
            v_update_time = lpRecord->GetInt32(LDBIZ_UPDATE_TIME_INT);
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
            v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            strcpy(v_exch_crncy_type, lpRecord->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
            v_begin_amt = lpRecord->GetDouble(LDBIZ_BEGIN_AMT_FLOAT);
            v_curr_amt = lpRecord->GetDouble(LDBIZ_CURR_AMT_FLOAT);
            v_frozen_amt = lpRecord->GetDouble(LDBIZ_FROZEN_AMT_FLOAT);
            v_unfroz_amt = lpRecord->GetDouble(LDBIZ_UNFROZ_AMT_FLOAT);
            v_comm_frozen_amt = lpRecord->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
            v_comm_unfroz_amt = lpRecord->GetDouble(LDBIZ_COMM_UNFROZ_AMT_FLOAT);
            v_comm_capt_amt = lpRecord->GetDouble(LDBIZ_COMM_CAPT_AMT_FLOAT);
            v_comm_releas_amt = lpRecord->GetDouble(LDBIZ_COMM_RELEAS_AMT_FLOAT);
            v_trade_frozen_amt = lpRecord->GetDouble(LDBIZ_TRADE_FROZEN_AMT_FLOAT);
            v_trade_unfroz_amt = lpRecord->GetDouble(LDBIZ_TRADE_UNFROZ_AMT_FLOAT);
            v_trade_capt_amt = lpRecord->GetDouble(LDBIZ_TRADE_CAPT_AMT_FLOAT);
            v_trade_releas_amt = lpRecord->GetDouble(LDBIZ_TRADE_RELEAS_AMT_FLOAT);
            v_strike_capt_amt = lpRecord->GetDouble(LDBIZ_STRIKE_CAPT_AMT_FLOAT);
            v_strike_releas_amt = lpRecord->GetDouble(LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);

        //调用过程[事务_交易证券_账户_计算资产账户资金可用同步产品库]
        //组织事务请求
        if(lpTSCall1Ans3)
        {
          lpTSCall1Ans3->FreeMsg();
          lpTSCall1Ans3=NULL;
        }
        lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("tdsecuT.2.56", 0);
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
        lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req3->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpTSCall1Req3->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
        lpTSCall1Req3->SetDouble(LDBIZ_BUY_REF_RATE_FLOAT,v_buy_ref_rate);
        lpTSCall1Req3->SetDouble(LDBIZ_SELL_REF_RATE_FLOAT,v_sell_ref_rate);
        glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
        if(!lpTSCall1Ans3)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.2.56]subcall timed out!");
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
        v_shsz_avail_amt = lpTSCall1Ans3->GetDouble(LDBIZ_SHSZ_AVAIL_AMT_FLOAT);
        v_hk_avail_amt = lpTSCall1Ans3->GetDouble(LDBIZ_HK_AVAIL_AMT_FLOAT);
        v_static_avail_amt = lpTSCall1Ans3->GetDouble(LDBIZ_STATIC_AVAIL_AMT_FLOAT);

        //调用过程[事务_产品证券_资金_更新交易资金]
        //组织事务请求
        if(lpTSCall1Ans4)
        {
          lpTSCall1Ans4->FreeMsg();
          lpTSCall1Ans4=NULL;
        }
        lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pdsecuT.2.257", 0);
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
        lpTSCall1Req4->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req4->SetDouble(LDBIZ_SHSZ_AVAIL_AMT_FLOAT,v_shsz_avail_amt);
        lpTSCall1Req4->SetDouble(LDBIZ_HK_AVAIL_AMT_FLOAT,v_hk_avail_amt);
        lpTSCall1Req4->SetDouble(LDBIZ_STATIC_AVAIL_AMT_FLOAT,v_static_avail_amt);
        glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
        if(!lpTSCall1Ans4)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.2.257]subcall timed out!");
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


    // [遍历结果集结束][lpMainMsg]
        }
    }


    // set @交易组编号# = 0;
    v_exch_group_no = 0;

    // set @交易组编号权限串# = " ";
    strcpy(v_exch_group_no_rights_str," ");

    // set @记录序号# = 0;
    v_row_id = 0;

    // set @指定行数# = -1;
    v_row_count = -1;

    // set @资产账户编号# = 0;
    v_asset_acco_no = 0;

    // set @交易币种# = " ";
    strcpy(v_exch_crncy_type," ");
    //调用过程[事务_交易证券_账户_查询交易组资金]
    //组织事务请求
    if(lpTSCall1Ans5)
    {
      lpTSCall1Ans5->FreeMsg();
      lpTSCall1Ans5=NULL;
    }
    lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("tdsecuT.2.5", 0);
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
    lpTSCall1Req5->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req5->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req5->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req5->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
    if(!lpTSCall1Ans5)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.2.5]subcall timed out!");
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


    // [获取结果集][lpMainMsg2]
    lpMainMsg2=lpTSCall1Ans5->GetGroup(LDTAG_NO_RESULTSET);


    // [遍历结果集开始][lpMainMsg2]
    iRecordCount = lpMainMsg2->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpMainMsg2->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            v_row_id = lpRecord->GetInt64(LDBIZ_ROW_ID_INT64);
            v_create_date = lpRecord->GetInt32(LDBIZ_CREATE_DATE_INT);
            v_create_time = lpRecord->GetInt32(LDBIZ_CREATE_TIME_INT);
            v_update_date = lpRecord->GetInt32(LDBIZ_UPDATE_DATE_INT);
            v_update_time = lpRecord->GetInt32(LDBIZ_UPDATE_TIME_INT);
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
            v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
            v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            strcpy(v_exch_crncy_type, lpRecord->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
            v_begin_amt = lpRecord->GetDouble(LDBIZ_BEGIN_AMT_FLOAT);
            v_curr_amt = lpRecord->GetDouble(LDBIZ_CURR_AMT_FLOAT);
            v_frozen_amt = lpRecord->GetDouble(LDBIZ_FROZEN_AMT_FLOAT);
            v_unfroz_amt = lpRecord->GetDouble(LDBIZ_UNFROZ_AMT_FLOAT);
            v_comm_frozen_amt = lpRecord->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
            v_comm_unfroz_amt = lpRecord->GetDouble(LDBIZ_COMM_UNFROZ_AMT_FLOAT);
            v_comm_capt_amt = lpRecord->GetDouble(LDBIZ_COMM_CAPT_AMT_FLOAT);
            v_comm_releas_amt = lpRecord->GetDouble(LDBIZ_COMM_RELEAS_AMT_FLOAT);
            v_trade_frozen_amt = lpRecord->GetDouble(LDBIZ_TRADE_FROZEN_AMT_FLOAT);
            v_trade_unfroz_amt = lpRecord->GetDouble(LDBIZ_TRADE_UNFROZ_AMT_FLOAT);
            v_trade_capt_amt = lpRecord->GetDouble(LDBIZ_TRADE_CAPT_AMT_FLOAT);
            v_trade_releas_amt = lpRecord->GetDouble(LDBIZ_TRADE_RELEAS_AMT_FLOAT);
            v_strike_capt_amt = lpRecord->GetDouble(LDBIZ_STRIKE_CAPT_AMT_FLOAT);
            v_strike_releas_amt = lpRecord->GetDouble(LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);

        //调用过程[事务_交易证券_账户_计算交易组资金可用同步产品库]
        //组织事务请求
        if(lpTSCall1Ans6)
        {
          lpTSCall1Ans6->FreeMsg();
          lpTSCall1Ans6=NULL;
        }
        lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdsecuT.2.55", 0);
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
        lpTSCall1Req6->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req6->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpTSCall1Req6->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
        lpTSCall1Req6->SetDouble(LDBIZ_BUY_REF_RATE_FLOAT,v_buy_ref_rate);
        lpTSCall1Req6->SetDouble(LDBIZ_SELL_REF_RATE_FLOAT,v_sell_ref_rate);
        glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
        if(!lpTSCall1Ans6)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.2.55]subcall timed out!");
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
        v_shsz_avail_amt = lpTSCall1Ans6->GetDouble(LDBIZ_SHSZ_AVAIL_AMT_FLOAT);
        v_hk_avail_amt = lpTSCall1Ans6->GetDouble(LDBIZ_HK_AVAIL_AMT_FLOAT);
        v_static_avail_amt = lpTSCall1Ans6->GetDouble(LDBIZ_STATIC_AVAIL_AMT_FLOAT);

        //调用过程[事务_产品证券_资金_更新交易库交易组资金]
        //组织事务请求
        if(lpTSCall1Ans7)
        {
          lpTSCall1Ans7->FreeMsg();
          lpTSCall1Ans7=NULL;
        }
        lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("pdsecuT.2.258", 0);
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
        lpTSCall1Req7->SetDouble(LDBIZ_SHSZ_AVAIL_AMT_FLOAT,v_shsz_avail_amt);
        lpTSCall1Req7->SetDouble(LDBIZ_HK_AVAIL_AMT_FLOAT,v_hk_avail_amt);
        lpTSCall1Req7->SetDouble(LDBIZ_STATIC_AVAIL_AMT_FLOAT,v_static_avail_amt);
        glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
        if(!lpTSCall1Ans7)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.2.258]subcall timed out!");
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

//逻辑_交易证券_交易运维_计算债券质押同步产品库
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
    int v_co_no;
    int v_pd_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_asset_acco_no;
    char v_exch_no_str[2049];
    int v_stock_acco_no;
    int v_stock_code_no;
    char v_pd_no_rights_str[2049];
    int64 v_row_id;
    int v_row_count;
    int v_exch_no;
    double v_begin_qty;
    double v_curr_qty;
    double v_put_impawn_qty;
    double v_get_impawn_qty;
    int v_update_times;
    double v_posi_qty;
    int v_exch_group_no;
    char v_co_no_rights_str[2049];
    char v_exch_group_no_rights_str[2049];
    char v_log_error_code[33];
    char v_log_error_info[256];

    IGroup* lpMainMsg=NULL;
    int iRecordCount = 0;
    IGroup* lpMainMsg2=NULL;

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
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_asset_acco_no=0;
    strcpy(v_exch_no_str, " ");
    v_stock_acco_no=0;
    v_stock_code_no=0;
    strcpy(v_pd_no_rights_str, " ");
    v_row_id=0;
    v_row_count=-1;
    v_exch_no=0;
    v_begin_qty=0;
    v_curr_qty=0;
    v_put_impawn_qty=0;
    v_get_impawn_qty=0;
    v_update_times=1;
    v_posi_qty=0;
    v_exch_group_no=0;
    strcpy(v_co_no_rights_str, " ");
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


    // set @资产账户编号# = 0;
    v_asset_acco_no = 0;

    // set @市场编号串# = " ";
    strcpy(v_exch_no_str," ");

    // set @股东代码编号# = 0;
    v_stock_acco_no = 0;

    // set @证券代码编号# = 0;
    v_stock_code_no = 0;

    // set @产品编号权限串# = " ";
    strcpy(v_pd_no_rights_str," ");

    // set @记录序号# = 0;
    v_row_id = 0;

    // set @指定行数# = -1;
    v_row_count = -1;
    //调用过程[事务_交易证券_账户_查询资产账户债券质押]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.2.34", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.2.34]subcall timed out!");
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
            v_row_id = lpRecord->GetInt64(LDBIZ_ROW_ID_INT64);
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
            v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
            v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
            v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
            v_begin_qty = lpRecord->GetDouble(LDBIZ_BEGIN_QTY_FLOAT);
            v_curr_qty = lpRecord->GetDouble(LDBIZ_CURR_QTY_FLOAT);
            v_put_impawn_qty = lpRecord->GetDouble(LDBIZ_PUT_IMPAWN_QTY_FLOAT);
            v_get_impawn_qty = lpRecord->GetDouble(LDBIZ_GET_IMPAWN_QTY_FLOAT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


        // set @持仓数量# = @提交质押数量# - @转回质押数量#;
        v_posi_qty = v_put_impawn_qty - v_get_impawn_qty;
        //调用过程[事务_产品证券_交易接口_更新交易库资产账户债券质押]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.6.17", 0);
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
        lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req2->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req2->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req2->SetDouble(LDBIZ_POSI_QTY_FLOAT,v_posi_qty);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 60000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.6.17]subcall timed out!");
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


    // [遍历结果集结束][lpMainMsg]
        }
    }


    // set @交易组编号# = 0;
    v_exch_group_no = 0;

    // set @资产账户编号# = 0;
    v_asset_acco_no = 0;

    // set @市场编号串# = " ";
    strcpy(v_exch_no_str," ");

    // set @股东代码编号# = 0;
    v_stock_acco_no = 0;

    // set @证券代码编号# = 0;
    v_stock_code_no = 0;

    // set @机构编号权限串# = " ";
    strcpy(v_co_no_rights_str," ");

    // set @产品编号权限串# = " ";
    strcpy(v_pd_no_rights_str," ");

    // set @交易组编号权限串# = " ";
    strcpy(v_exch_group_no_rights_str," ");

    // set @记录序号# = 0;
    v_row_id = 0;

    // set @指定行数# = -1;
    v_row_count = -1;
    //调用过程[事务_交易证券_账户_查询交易组债券质押]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("tdsecuT.2.33", 0);
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
    lpTSCall1Req3->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req3->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req3->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req3->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req3->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req3->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.2.33]subcall timed out!");
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


    // [获取结果集][lpMainMsg2]
    lpMainMsg2=lpTSCall1Ans3->GetGroup(LDTAG_NO_RESULTSET);


    // [遍历结果集开始][lpMainMsg2]
    iRecordCount = lpMainMsg2->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpMainMsg2->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            v_row_id = lpRecord->GetInt64(LDBIZ_ROW_ID_INT64);
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
            v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
            v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
            v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
            v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
            v_begin_qty = lpRecord->GetDouble(LDBIZ_BEGIN_QTY_FLOAT);
            v_curr_qty = lpRecord->GetDouble(LDBIZ_CURR_QTY_FLOAT);
            v_put_impawn_qty = lpRecord->GetDouble(LDBIZ_PUT_IMPAWN_QTY_FLOAT);
            v_get_impawn_qty = lpRecord->GetDouble(LDBIZ_GET_IMPAWN_QTY_FLOAT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


        // set @持仓数量# = @提交质押数量# - @转回质押数量#;
        v_posi_qty = v_put_impawn_qty - v_get_impawn_qty;
        //调用过程[事务_产品证券_交易接口_更新交易库交易组债券质押]
        //组织事务请求
        if(lpTSCall1Ans4)
        {
          lpTSCall1Ans4->FreeMsg();
          lpTSCall1Ans4=NULL;
        }
        lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pdsecuT.6.18", 0);
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
        lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req4->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req4->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req4->SetDouble(LDBIZ_POSI_QTY_FLOAT,v_posi_qty);
        glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 60000);
        if(!lpTSCall1Ans4)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.6.18]subcall timed out!");
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
        if(lpTSCall1Ans5)
        {
          lpTSCall1Ans5->FreeMsg();
          lpTSCall1Ans5=NULL;
        }
        lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req5->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req5->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
        if (lpTSCall1Ans5)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans5->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans5->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans5->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans5->GetString(LDBIZ_ERROR_DEAL_STR));
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
    return iRet;
}

//逻辑_交易证券_交易运维_补单关联订单
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
    int64 v_order_id;
    int64 v_new_order_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_order_date;
    int v_busi_opor_no;
    char v_order_oper_way[3];
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    int v_exch_no;
    int v_stock_acco_no;
    char v_stock_acco[17];
    int v_stock_code_no;
    char v_stock_code[7];
    int v_stock_type;
    int v_asset_type;
    int64 v_comm_id;
    int v_comm_batch_no;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_time;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    double v_order_frozen_qty;
    double v_order_frozen_amt;
    char v_order_status[3];
    int v_price_type;
    double v_strike_qty;
    double v_strike_amt;
    double v_all_fee;
    double v_wtdraw_qty;
    int v_wtdraw_time;
    int v_exter_comm_flag;
    int v_cost_calc_type;
    char v_combo_code[33];
    int64 v_combo_posi_id;
    int64 v_strategy_id;
    int v_order_batch_no;
    char v_out_acco[33];
    int v_asset_acco_type;
    char v_contra_no[33];
    int v_exist_debt_flag;
    int v_update_times;
    int v_strike_date;
    char v_sys_config_str[65];
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    double v_buy_ref_rate;
    double v_sell_ref_rate;
    int v_capit_reback_days;
    int v_posi_reback_days;
    int v_trade_code_no;
    int v_target_code_no;
    int v_intrst_days;
    int v_net_price_flag;
    double v_bond_accr_intrst;
    int v_bond_rate_type;
    double v_par_value;
    double v_impawn_ratio;
    int v_repo_days;
    int v_repo_cale_days;
    int v_repo_back_date;
    int v_bond_qty_unit_set;
    int v_apply_date;
    double v_exgp_cost_amt;
    double v_exgp_intrst_cost_amt;
    double v_exgp_curr_qty;
    double v_asac_cost_amt;
    double v_asac_intrst_cost_amt;
    double v_asac_curr_qty;
    int v_invest_type;
    int64 v_strike_id;
    int64 v_external_no;
    double v_curr_strike_price;
    double v_curr_strike_amt;
    double v_curr_strike_qty;
    char v_rsp_info[256];
    double v_strike_bond_accr_intrst;
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
    double v_exgp_put_impawn_qty;
    double v_asac_put_impawn_qty;
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
    double v_asac_intrst_pandl;
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
    v_order_id=0;
    v_new_order_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_order_date=0;
    v_busi_opor_no=0;
    strcpy(v_order_oper_way, " ");
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    strcpy(v_stock_acco, " ");
    v_stock_code_no=0;
    strcpy(v_stock_code, " ");
    v_stock_type=0;
    v_asset_type=0;
    v_comm_id=0;
    v_comm_batch_no=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_time=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_order_frozen_qty=0;
    v_order_frozen_amt=0;
    strcpy(v_order_status, "0");
    v_price_type=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_all_fee=0;
    v_wtdraw_qty=0;
    v_wtdraw_time=0;
    v_exter_comm_flag=0;
    v_cost_calc_type=0;
    strcpy(v_combo_code, " ");
    v_combo_posi_id=0;
    v_strategy_id=0;
    v_order_batch_no=0;
    strcpy(v_out_acco, " ");
    v_asset_acco_type=0;
    strcpy(v_contra_no, " ");
    v_exist_debt_flag=0;
    v_update_times=1;
    v_strike_date=0;
    strcpy(v_sys_config_str, " ");
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_buy_ref_rate=0;
    v_sell_ref_rate=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    v_trade_code_no=0;
    v_target_code_no=0;
    v_intrst_days=0;
    v_net_price_flag=0;
    v_bond_accr_intrst=0;
    v_bond_rate_type=0;
    v_par_value=0;
    v_impawn_ratio=0;
    v_repo_days=0;
    v_repo_cale_days=0;
    v_repo_back_date=0;
    v_bond_qty_unit_set=0;
    v_apply_date=0;
    v_exgp_cost_amt=0;
    v_exgp_intrst_cost_amt=0;
    v_exgp_curr_qty=0;
    v_asac_cost_amt=0;
    v_asac_intrst_cost_amt=0;
    v_asac_curr_qty=0;
    v_invest_type=0;
    v_strike_id=0;
    v_external_no=0;
    v_curr_strike_price=0;
    v_curr_strike_amt=0;
    v_curr_strike_qty=0;
    strcpy(v_rsp_info, " ");
    v_strike_bond_accr_intrst=0;
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
    v_exgp_put_impawn_qty=0;
    v_asac_put_impawn_qty=0;
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
    v_asac_intrst_pandl=0;
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
    v_order_id = lpInBizMsg->GetInt64(LDBIZ_ORDER_ID_INT64);
    v_new_order_id = lpInBizMsg->GetInt64(LDBIZ_NEW_ORDER_ID_INT64);

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


    // set @订单日期# = 0;
    v_order_date = 0;
    //调用过程[事务_交易证券_交易_获取订单信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.4.71", 0);
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
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.4.71]subcall timed out!");
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
    v_busi_opor_no = lpTSCall1Ans1->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    strcpy(v_order_oper_way, lpTSCall1Ans1->GetString(LDBIZ_ORDER_OPER_WAY_STR));
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans1->GetInt32(LDBIZ_PASS_NO_INT);
    v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans1->GetString(LDBIZ_STOCK_ACCO_STR));
    v_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strcpy(v_stock_code, lpTSCall1Ans1->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_type = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_comm_id = lpTSCall1Ans1->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_report_date = lpTSCall1Ans1->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpTSCall1Ans1->GetInt32(LDBIZ_REPORT_TIME_INT);
    strcpy(v_report_no, lpTSCall1Ans1->GetString(LDBIZ_REPORT_NO_STR));
    v_order_time = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_order_dir = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_order_price = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_frozen_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT);
    v_order_frozen_amt = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
    strcpy(v_order_status, lpTSCall1Ans1->GetString(LDBIZ_ORDER_STATUS_STR));
    v_price_type = lpTSCall1Ans1->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strike_qty = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_all_fee = lpTSCall1Ans1->GetDouble(LDBIZ_ALL_FEE_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans1->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_wtdraw_time = lpTSCall1Ans1->GetInt32(LDBIZ_WTDRAW_TIME_INT);
    v_exter_comm_flag = lpTSCall1Ans1->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_cost_calc_type = lpTSCall1Ans1->GetInt32(LDBIZ_COST_CALC_TYPE_INT);
    strcpy(v_combo_code, lpTSCall1Ans1->GetString(LDBIZ_COMBO_CODE_STR));
    v_combo_posi_id = lpTSCall1Ans1->GetInt64(LDBIZ_COMBO_POSI_ID_INT64);
    v_strategy_id = lpTSCall1Ans1->GetInt64(LDBIZ_STRATEGY_ID_INT64);
    v_order_batch_no = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans1->GetString(LDBIZ_OUT_ACCO_STR));
    v_asset_acco_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);
    strcpy(v_contra_no, lpTSCall1Ans1->GetString(LDBIZ_CONTRA_NO_STR));
    v_exist_debt_flag = lpTSCall1Ans1->GetInt32(LDBIZ_EXIST_DEBT_FLAG_INT);
    v_update_times = lpTSCall1Ans1->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // set @成交日期# = @申报日期#;
    v_strike_date = v_report_date;
    //调用过程[事务_公共_交易接口_检查成交回报业务控制]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.25.32", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req2->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req2->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
    lpTSCall1Req2->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.32]subcall timed out!");
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
    strcpy(v_sys_config_str, lpTSCall1Ans2->GetString(LDBIZ_SYS_CONFIG_STR_STR));
    strcpy(v_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_CRNCY_TYPE_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_buy_ref_rate = lpTSCall1Ans2->GetDouble(LDBIZ_BUY_REF_RATE_FLOAT);
    v_sell_ref_rate = lpTSCall1Ans2->GetDouble(LDBIZ_SELL_REF_RATE_FLOAT);
    v_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_stock_type = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_capit_reback_days = lpTSCall1Ans2->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans2->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    v_trade_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
    v_target_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
    v_intrst_days = lpTSCall1Ans2->GetInt32(LDBIZ_INTRST_DAYS_INT);
    v_net_price_flag = lpTSCall1Ans2->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
    v_bond_accr_intrst = lpTSCall1Ans2->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
    v_bond_rate_type = lpTSCall1Ans2->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
    v_par_value = lpTSCall1Ans2->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
    v_impawn_ratio = lpTSCall1Ans2->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
    v_repo_days = lpTSCall1Ans2->GetInt32(LDBIZ_REPO_DAYS_INT);
    v_repo_cale_days = lpTSCall1Ans2->GetInt32(LDBIZ_REPO_CALE_DAYS_INT);
    v_repo_back_date = lpTSCall1Ans2->GetInt32(LDBIZ_REPO_BACK_DATE_INT);
    v_bond_qty_unit_set = lpTSCall1Ans2->GetInt32(LDBIZ_BOND_QTY_UNIT_SET_INT);
    v_apply_date = lpTSCall1Ans2->GetInt32(LDBIZ_APPLY_DATE_INT);


    // set @订单日期# = @初始化日期#;
    v_order_date = v_init_date;
    //调用过程[事务_产品证券_交易接口_获取成交回报证券持仓成本]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdsecuT.6.3", 0);
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
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req3->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.6.3]subcall timed out!");
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
    v_exgp_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
    v_exgp_intrst_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
    v_exgp_curr_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT);
    v_asac_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
    v_asac_intrst_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
    v_asac_curr_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT);


    // set @投资类型# = 1;
    v_invest_type = 1;
    //调用过程[事务_交易证券_交易运维_补单关联订单]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.56", 0);
    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req4->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req4->SetInt64(LDBIZ_NEW_ORDER_ID_INT64,v_new_order_id);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpTSCall1Req4->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
    lpTSCall1Req4->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
    lpTSCall1Req4->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
    lpTSCall1Req4->SetInt32(LDBIZ_INTRST_DAYS_INT,v_intrst_days);
    lpTSCall1Req4->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
    lpTSCall1Req4->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
    lpTSCall1Req4->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req4->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req4->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req4->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req4->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req4->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req4->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req4->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req4->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req4->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req4->SetInt32(LDBIZ_INVEST_TYPE_INT,v_invest_type);
    lpTSCall1Req4->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req4->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req4->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpTSCall1Req4->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req4->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
    lpTSCall1Req4->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
    lpTSCall1Req4->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
    lpTSCall1Req4->SetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT,v_order_frozen_amt);
    lpTSCall1Req4->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
    lpTSCall1Req4->SetDouble(LDBIZ_BUY_REF_RATE_FLOAT,v_buy_ref_rate);
    lpTSCall1Req4->SetDouble(LDBIZ_SELL_REF_RATE_FLOAT,v_sell_ref_rate);
    lpTSCall1Req4->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
    lpTSCall1Req4->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
    lpTSCall1Req4->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT,v_exgp_curr_qty);
    lpTSCall1Req4->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT,v_asac_curr_qty);
    lpTSCall1Req4->SetInt32(LDBIZ_REPO_DAYS_INT,v_repo_days);
    lpTSCall1Req4->SetInt32(LDBIZ_REPO_CALE_DAYS_INT,v_repo_cale_days);
    lpTSCall1Req4->SetInt32(LDBIZ_REPO_BACK_DATE_INT,v_repo_back_date);
    lpTSCall1Req4->SetInt32(LDBIZ_COST_CALC_TYPE_INT,v_cost_calc_type);
    lpTSCall1Req4->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.56]subcall timed out!");
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
    v_strike_id = lpTSCall1Ans4->GetInt64(LDBIZ_STRIKE_ID_INT64);

    //调用过程[事务_交易证券_交易_获取订单信息]
    //组织事务请求
    if(lpTSCall1Ans5)
    {
      lpTSCall1Ans5->FreeMsg();
      lpTSCall1Ans5=NULL;
    }
    lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("tdsecuT.4.71", 0);
    lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req5->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req5->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
    if(!lpTSCall1Ans5)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.4.71]subcall timed out!");
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
    v_busi_opor_no = lpTSCall1Ans5->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    strcpy(v_order_oper_way, lpTSCall1Ans5->GetString(LDBIZ_ORDER_OPER_WAY_STR));
    v_co_no = lpTSCall1Ans5->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans5->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans5->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans5->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans5->GetInt32(LDBIZ_PASS_NO_INT);
    v_exch_no = lpTSCall1Ans5->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans5->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans5->GetString(LDBIZ_STOCK_ACCO_STR));
    v_stock_code_no = lpTSCall1Ans5->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strcpy(v_stock_code, lpTSCall1Ans5->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_type = lpTSCall1Ans5->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans5->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_comm_id = lpTSCall1Ans5->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_report_date = lpTSCall1Ans5->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpTSCall1Ans5->GetInt32(LDBIZ_REPORT_TIME_INT);
    strcpy(v_report_no, lpTSCall1Ans5->GetString(LDBIZ_REPORT_NO_STR));
    v_order_time = lpTSCall1Ans5->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_order_dir = lpTSCall1Ans5->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_order_price = lpTSCall1Ans5->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_frozen_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT);
    v_order_frozen_amt = lpTSCall1Ans5->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
    strcpy(v_order_status, lpTSCall1Ans5->GetString(LDBIZ_ORDER_STATUS_STR));
    v_price_type = lpTSCall1Ans5->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strike_qty = lpTSCall1Ans5->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans5->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_all_fee = lpTSCall1Ans5->GetDouble(LDBIZ_ALL_FEE_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans5->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_wtdraw_time = lpTSCall1Ans5->GetInt32(LDBIZ_WTDRAW_TIME_INT);
    v_exter_comm_flag = lpTSCall1Ans5->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_cost_calc_type = lpTSCall1Ans5->GetInt32(LDBIZ_COST_CALC_TYPE_INT);
    strcpy(v_combo_code, lpTSCall1Ans5->GetString(LDBIZ_COMBO_CODE_STR));
    v_combo_posi_id = lpTSCall1Ans5->GetInt64(LDBIZ_COMBO_POSI_ID_INT64);
    v_strategy_id = lpTSCall1Ans5->GetInt64(LDBIZ_STRATEGY_ID_INT64);
    v_order_batch_no = lpTSCall1Ans5->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans5->GetString(LDBIZ_OUT_ACCO_STR));
    v_asset_acco_type = lpTSCall1Ans5->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);
    strcpy(v_contra_no, lpTSCall1Ans5->GetString(LDBIZ_CONTRA_NO_STR));
    v_exist_debt_flag = lpTSCall1Ans5->GetInt32(LDBIZ_EXIST_DEBT_FLAG_INT);
    v_update_times = lpTSCall1Ans5->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // set @外部编号# = 0;
    v_external_no = 0;

    // set @当笔成交价格# = 0;
    v_curr_strike_price = 0;

    // set @当笔成交金额# = 0;
    v_curr_strike_amt = 0;

    // set @当笔成交数量# = 0;
    v_curr_strike_qty = 0;

    // set @回报信息# = " ";
    strcpy(v_rsp_info," ");

    // set @成交债券计提利息# = 0;
    v_strike_bond_accr_intrst = 0;

    // set @操作员编号# = @业务操作员编号#;
    v_opor_no = v_busi_opor_no;

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
        if(lpTSCall1Ans6)
        {
          lpTSCall1Ans6->FreeMsg();
          lpTSCall1Ans6=NULL;
        }
        lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.21", 0);
        lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req6->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req6->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
        lpTSCall1Req6->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
        lpTSCall1Req6->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
        lpTSCall1Req6->SetInt64(LDBIZ_STRIKE_ID_INT64,v_strike_id);
        glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
        if(!lpTSCall1Ans6)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.21]subcall timed out!");
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
        v_sum_order_row_id = lpTSCall1Ans6->GetInt64(LDBIZ_SUM_ORDER_ROW_ID_INT64);
        v_sum_order_opor_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_ORDER_OPOR_NO_INT);
        v_sum_order_co_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_ORDER_CO_NO_INT);
        v_sum_order_pd_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_ORDER_PD_NO_INT);
        v_sum_order_exch_group_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_ORDER_EXCH_GROUP_NO_INT);
        v_sum_order_asset_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_ORDER_ASSET_ACCO_NO_INT);
        v_sum_order_pass_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_ORDER_PASS_NO_INT);
        strcpy(v_sum_order_exch_crncy_type, lpTSCall1Ans6->GetString(LDBIZ_SUM_ORDER_EXCH_CRNCY_TYPE_STR));
        v_sum_order_stock_code_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_ORDER_STOCK_CODE_NO_INT);
        v_sum_order_trade_code_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_ORDER_TRADE_CODE_NO_INT);
        v_sum_order_target_code_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_ORDER_TARGET_CODE_NO_INT);
        v_sum_order_external_no = lpTSCall1Ans6->GetInt64(LDBIZ_SUM_ORDER_EXTERNAL_NO_INT64);
        v_sum_order_date = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_ORDER_DATE_INT);
        v_sum_order_batch_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_ORDER_BATCH_NO_INT);
        v_sum_order_dir = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_ORDER_DIR_INT);
        v_sum_order_price_type = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_ORDER_PRICE_TYPE_INT);
        v_sum_order_price = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_ORDER_PRICE_FLOAT);
        v_sum_order_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_ORDER_QTY_FLOAT);
        strcpy(v_order_sum_status, lpTSCall1Ans6->GetString(LDBIZ_ORDER_SUM_STATUS_STR));
        v_sum_order_wtdraw_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_ORDER_WTDRAW_QTY_FLOAT);
        v_sum_order_waste_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_ORDER_WASTE_QTY_FLOAT);
        v_sum_order_strike_amt = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_ORDER_STRIKE_AMT_FLOAT);
        v_sum_order_strike_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_ORDER_STRIKE_QTY_FLOAT);
        v_sum_order_strike_aver_price = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_ORDER_STRIKE_AVER_PRICE_FLOAT);
        v_sum_order_net_price_flag = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_ORDER_NET_PRICE_FLAG_INT);
        v_sum_order_bond_accr_intrst = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_ORDER_BOND_ACCR_INTRST_FLOAT);
        v_sum_order_bond_rate_type = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_ORDER_BOND_RATE_TYPE_INT);
        v_sum_order_par_value = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_ORDER_PAR_VALUE_FLOAT);
        v_sum_order_impawn_ratio = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_ORDER_IMPAWN_RATIO_FLOAT);
        strcpy(v_sum_order_oper_way, lpTSCall1Ans6->GetString(LDBIZ_SUM_ORDER_OPER_WAY_STR));
        v_sum_order_update_times = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_ORDER_UPDATE_TIMES_INT);
        v_sum_strike_row_id = lpTSCall1Ans6->GetInt64(LDBIZ_SUM_STRIKE_ROW_ID_INT64);
        v_sum_strike_opor_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_STRIKE_OPOR_NO_INT);
        v_sum_strike_co_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_STRIKE_CO_NO_INT);
        v_sum_strike_pd_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_STRIKE_PD_NO_INT);
        v_sum_strike_exch_group_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_STRIKE_EXCH_GROUP_NO_INT);
        v_sum_strike_asset_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_STRIKE_ASSET_ACCO_NO_INT);
        v_sum_strike_pass_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_STRIKE_PASS_NO_INT);
        strcpy(v_sum_strike_out_acco, lpTSCall1Ans6->GetString(LDBIZ_SUM_STRIKE_OUT_ACCO_STR));
        v_sum_strike_stock_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_STRIKE_STOCK_ACCO_NO_INT);
        v_sum_strike_stock_code_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_STRIKE_STOCK_CODE_NO_INT);
        v_sum_strike_comm_id = lpTSCall1Ans6->GetInt64(LDBIZ_SUM_STRIKE_COMM_ID_INT64);
        v_sum_strike_report_date = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_STRIKE_REPORT_DATE_INT);
        strcpy(v_sum_strike_report_no, lpTSCall1Ans6->GetString(LDBIZ_SUM_STRIKE_REPORT_NO_STR));
        v_sum_strike_order_date = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_STRIKE_ORDER_DATE_INT);
        v_sum_strike_order_id = lpTSCall1Ans6->GetInt64(LDBIZ_SUM_STRIKE_ORDER_ID_INT64);
        v_sum_strike_order_dir = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_STRIKE_ORDER_DIR_INT);
        v_sum_strike_order_price = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_STRIKE_ORDER_PRICE_FLOAT);
        v_sum_strike_order_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_STRIKE_ORDER_QTY_FLOAT);
        v_sum_strike_strike_qty = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_STRIKE_STRIKE_QTY_FLOAT);
        v_sum_strike_strike_amt = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_STRIKE_STRIKE_AMT_FLOAT);
        v_sum_strike_all_fee = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_STRIKE_ALL_FEE_FLOAT);
        v_sum_strike_stamp_tax = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_STRIKE_STAMP_TAX_FLOAT);
        v_sum_strike_trans_fee = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_STRIKE_TRANS_FEE_FLOAT);
        v_sum_strike_brkage_fee = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_STRIKE_BRKAGE_FEE_FLOAT);
        v_sum_strike_SEC_charges = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_STRIKE_SEC_CHARGES_FLOAT);
        v_sum_strike_other_fee = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_STRIKE_OTHER_FEE_FLOAT);
        v_sum_strike_trade_commis = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_STRIKE_TRADE_COMMIS_FLOAT);
        v_sum_strike_other_commis = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_STRIKE_OTHER_COMMIS_FLOAT);
        v_sum_trade_tax = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_TRADE_TAX_FLOAT);
        v_sum_trade_cost_fee = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_TRADE_COST_FEE_FLOAT);
        v_sum_trade_system_use_fee = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_TRADE_SYSTEM_USE_FEE_FLOAT);
        v_sum_stock_settle_fee = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_STOCK_SETTLE_FEE_FLOAT);
        v_sum_strike_net_price_flag = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_STRIKE_NET_PRICE_FLAG_INT);
        v_sum_strike_bond_accr_intrst = lpTSCall1Ans6->GetDouble(LDBIZ_SUM_STRIKE_BOND_ACCR_INTRST_FLOAT);
        v_sum_strike_bond_rate_type = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_STRIKE_BOND_RATE_TYPE_INT);
        strcpy(v_sum_strike_order_oper_way, lpTSCall1Ans6->GetString(LDBIZ_SUM_STRIKE_ORDER_OPER_WAY_STR));
        v_sum_strike_exter_comm_flag = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_STRIKE_EXTER_COMM_FLAG_INT);
        v_sum_strike_update_times = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_STRIKE_UPDATE_TIMES_INT);
        v_sum_strike_order_batch_no = lpTSCall1Ans6->GetInt32(LDBIZ_SUM_STRIKE_ORDER_BATCH_NO_INT);
        v_sum_external_no = lpTSCall1Ans6->GetInt64(LDBIZ_SUM_EXTERNAL_NO_INT64);


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
        if(lpTSCall1Ans7)
        {
          lpTSCall1Ans7->FreeMsg();
          lpTSCall1Ans7=NULL;
        }
        lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.3", 0);
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
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.3]subcall timed out!");
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
        v_init_date = lpTSCall1Ans7->GetInt32(LDBIZ_INIT_DATE_INT);
        v_co_no = lpTSCall1Ans7->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans7->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans7->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans7->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans7->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_out_acco, lpTSCall1Ans7->GetString(LDBIZ_OUT_ACCO_STR));
        strcpy(v_exch_crncy_type, lpTSCall1Ans7->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_stock_acco_no = lpTSCall1Ans7->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
        v_stock_code_no = lpTSCall1Ans7->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        v_stock_type = lpTSCall1Ans7->GetInt32(LDBIZ_STOCK_TYPE_INT);
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
        v_comm_appr_oper = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
        strcpy(v_comm_appr_remark, lpTSCall1Ans7->GetString(LDBIZ_COMM_APPR_REMARK_STR));
        v_basket_id = lpTSCall1Ans7->GetInt64(LDBIZ_BASKET_ID_INT64);
        v_net_price_flag = lpTSCall1Ans7->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
        v_bond_accr_intrst = lpTSCall1Ans7->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
        v_bond_rate_type = lpTSCall1Ans7->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
        strcpy(v_comm_oper_way, lpTSCall1Ans7->GetString(LDBIZ_COMM_OPER_WAY_STR));
        v_exter_comm_flag = lpTSCall1Ans7->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
        v_comm_comple_flag = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
        v_strategy_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_STRATEGY_CAPT_QTY_FLOAT);
        v_strategy_order_qty = lpTSCall1Ans7->GetDouble(LDBIZ_STRATEGY_ORDER_QTY_FLOAT);
        strcpy(v_contra_no, lpTSCall1Ans7->GetString(LDBIZ_CONTRA_NO_STR));
        strcpy(v_comm_remark_info, lpTSCall1Ans7->GetString(LDBIZ_COMM_REMARK_INFO_STR));
        v_disp_opor = lpTSCall1Ans7->GetInt32(LDBIZ_DISP_OPOR_INT);
        v_disp_status = lpTSCall1Ans7->GetInt32(LDBIZ_DISP_STATUS_INT);
        v_read_flag = lpTSCall1Ans7->GetInt32(LDBIZ_READ_FLAG_INT);
        v_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_UPDATE_TIMES_INT);
        v_sum_comm_row_id = lpTSCall1Ans7->GetInt64(LDBIZ_SUM_COMM_ROW_ID_INT64);
        v_sum_comm_co_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_CO_NO_INT);
        v_sum_comm_pd_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_PD_NO_INT);
        v_sum_comm_exch_group_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_EXCH_GROUP_NO_INT);
        v_sum_comm_asset_acco_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_ASSET_ACCO_NO_INT);
        v_sum_comm_pass_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_PASS_NO_INT);
        strcpy(v_sum_comm_out_acco, lpTSCall1Ans7->GetString(LDBIZ_SUM_COMM_OUT_ACCO_STR));
        strcpy(v_sum_comm_exch_crncy_type, lpTSCall1Ans7->GetString(LDBIZ_SUM_COMM_EXCH_CRNCY_TYPE_STR));
        v_sum_comm_stock_code_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_STOCK_CODE_NO_INT);
        v_sum_comm_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_DATE_INT);
        v_sum_comm_time = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_TIME_INT);
        v_sum_comm_batch_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_BATCH_NO_INT);
        v_sum_comm_opor = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_OPOR_INT);
        v_sum_comm_executor = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_EXECUTOR_INT);
        v_sum_comm_dir = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_DIR_INT);
        v_sum_comm_limit_price = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_LIMIT_PRICE_FLOAT);
        v_sum_comm_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_QTY_FLOAT);
        v_sum_comm_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_AMT_FLOAT);
        v_sum_comm_order_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_ORDER_QTY_FLOAT);
        v_sum_comm_cancel_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_CANCEL_QTY_FLOAT);
        v_sum_comm_await_cancel_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_AWAIT_CANCEL_QTY_FLOAT);
        v_sum_comm_strike_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_STRIKE_AMT_FLOAT);
        v_sum_comm_strike_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_STRIKE_QTY_FLOAT);
        strcpy(v_sum_comm_strike_status, lpTSCall1Ans7->GetString(LDBIZ_SUM_COMM_STRIKE_STATUS_STR));
        strcpy(v_comm_sum_status, lpTSCall1Ans7->GetString(LDBIZ_COMM_SUM_STATUS_STR));
        v_sum_comm_begin_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_BEGIN_DATE_INT);
        v_sum_comm_end_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_END_DATE_INT);
        v_sum_comm_begin_time = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_BEGIN_TIME_INT);
        v_sum_comm_end_time = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_END_TIME_INT);
        v_sum_comm_comple_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_COMPLE_DATE_INT);
        v_sum_comm_comple_time = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_COMPLE_TIME_INT);
        v_sum_comm_max_comm_comple_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_DATE_INT);
        v_sum_comm_max_comm_comple_time = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_TIME_INT);
        v_sum_comm_appr_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_APPR_DATE_INT);
        v_sum_comm_appr_time = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_APPR_TIME_INT);
        v_sum_comm_appr_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_APPR_QTY_FLOAT);
        strcpy(v_comm_sum_approve_status, lpTSCall1Ans7->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
        v_sum_comm_basket_id = lpTSCall1Ans7->GetInt64(LDBIZ_SUM_COMM_BASKET_ID_INT64);
        v_sum_comm_net_price_flag = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_NET_PRICE_FLAG_INT);
        v_sum_comm_bond_accr_intrst = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_BOND_ACCR_INTRST_FLOAT);
        v_sum_comm_bond_rate_type = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_BOND_RATE_TYPE_INT);
        strcpy(v_sum_comm_oper_way, lpTSCall1Ans7->GetString(LDBIZ_SUM_COMM_OPER_WAY_STR));
        v_sum_comm_exter_comm_flag = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_EXTER_COMM_FLAG_INT);
        v_sum_buy_order_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_BUY_ORDER_QTY_FLOAT);
        v_sum_sell_order_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_SELL_ORDER_QTY_FLOAT);
        v_sum_buy_comm_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_BUY_COMM_QTY_FLOAT);
        v_sum_sell_comm_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_SELL_COMM_QTY_FLOAT);
        v_sum_buy_strike_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_BUY_STRIKE_QTY_FLOAT);
        v_sum_sell_strike_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_SELL_STRIKE_QTY_FLOAT);
        v_sum_buy_strike_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_BUY_STRIKE_AMT_FLOAT);
        v_sum_sell_strike_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_SELL_STRIKE_AMT_FLOAT);
        v_sum_buy_comm_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_BUY_COMM_AMT_FLOAT);
        v_sum_sell_comm_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_SELL_COMM_AMT_FLOAT);
        strcpy(v_sum_comm_remark_info, lpTSCall1Ans7->GetString(LDBIZ_SUM_COMM_REMARK_INFO_STR));
        v_sum_comm_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_UPDATE_TIMES_INT);
        strcpy(v_acco_concat_info, lpTSCall1Ans7->GetString(LDBIZ_ACCO_CONCAT_INFO_STR));
        strcpy(v_combo_code, lpTSCall1Ans7->GetString(LDBIZ_COMBO_CODE_STR));


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


    // set @交易组提交质押数量# = 0;
    v_exgp_put_impawn_qty = 0;

    // set @资产账户提交质押数量# = 0;
    v_asac_put_impawn_qty = 0;
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

//逻辑_交易证券_交易运维_查询机构统计异常订单
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
    int v_order_date;
    int v_auth_time;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_co_no;
    int v_no_report_cnt;
    int v_already_report_cnt;
    int v_wait_report_cnt;
    int v_wait_report_except_cnt;
    int v_in_report_cnt;
    int v_in_report_except_cnt;
    int v_wait_cancel_cnt;
    int v_wait_cancel_except_cnt;
    int v_part_cancel_cnt;
    int v_all_cancel_cnt;
    int v_part_strike_cnt;
    int v_all_strike_cnt;
    int v_abolish_cnt;
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
    v_order_date=0;
    v_auth_time=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_co_no=0;
    v_no_report_cnt=0;
    v_already_report_cnt=0;
    v_wait_report_cnt=0;
    v_wait_report_except_cnt=0;
    v_in_report_cnt=0;
    v_in_report_except_cnt=0;
    v_wait_cancel_cnt=0;
    v_wait_cancel_except_cnt=0;
    v_part_cancel_cnt=0;
    v_all_cancel_cnt=0;
    v_part_strike_cnt=0;
    v_all_strike_cnt=0;
    v_abolish_cnt=0;
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
    v_order_date = lpInBizMsg->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_auth_time = lpInBizMsg->GetInt32(LDBIZ_AUTH_TIME_INT);

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

    //调用过程[事务_交易证券_交易运维_查询机构统计异常订单]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.57", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req1->SetInt32(LDBIZ_AUTH_TIME_INT,v_auth_time);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.57]subcall timed out!");
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

//逻辑_交易证券_交易运维_查询指令汇总考核
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
    int v_comm_date;
    int v_comm_batch_no;
    int v_comm_opor;
    int v_comm_executor;
    char v_comm_sum_appr_status_str[65];
    char v_exch_no_str[2049];
    int v_stock_code_no;
    char v_stock_type_str[2049];
    char v_asset_type_str[2049];
    char v_comm_dir_str[2049];
    char v_comm_sum_status_str[65];
    char v_strike_status_str[65];
    int64 v_basket_id;
    char v_comm_oper_way[3];
    int v_exter_comm_flag;
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
    int v_net_price_flag;
    double v_par_value;
    double v_bond_accr_intrst;
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
    double v_valid_aver_price;
    double v_valid_aver_price_allday;
    double v_exec_price_diff;
    double v_exec_price_diff_allday;
    double v_valid_ratio;
    double v_valid_ratio_allday;
    double v_valid_qty;
    double v_valid_qty_allday;
    int v_update_times;
    char v_comm_remark_info[1025];
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
    v_stock_code_no=0;
    strcpy(v_stock_type_str, " ");
    strcpy(v_asset_type_str, " ");
    strcpy(v_comm_dir_str, " ");
    strcpy(v_comm_sum_status_str, " ");
    strcpy(v_strike_status_str, " ");
    v_basket_id=0;
    strcpy(v_comm_oper_way, " ");
    v_exter_comm_flag=0;
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
    v_net_price_flag=0;
    v_par_value=0;
    v_bond_accr_intrst=0;
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
    v_valid_aver_price=0;
    v_valid_aver_price_allday=0;
    v_exec_price_diff=0;
    v_exec_price_diff_allday=0;
    v_valid_ratio=0;
    v_valid_ratio_allday=0;
    v_valid_qty=0;
    v_valid_qty_allday=0;
    v_update_times=1;
    strcpy(v_comm_remark_info, " ");
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
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strncpy(v_stock_type_str, lpInBizMsg->GetString(LDBIZ_STOCK_TYPE_STR_STR),2048);
    v_stock_type_str[2048] = '\0';
    strncpy(v_asset_type_str, lpInBizMsg->GetString(LDBIZ_ASSET_TYPE_STR_STR),2048);
    v_asset_type_str[2048] = '\0';
    strncpy(v_comm_dir_str, lpInBizMsg->GetString(LDBIZ_COMM_DIR_STR_STR),2048);
    v_comm_dir_str[2048] = '\0';
    strncpy(v_comm_sum_status_str, lpInBizMsg->GetString(LDBIZ_COMM_SUM_STATUS_STR_STR),64);
    v_comm_sum_status_str[64] = '\0';
    strncpy(v_strike_status_str, lpInBizMsg->GetString(LDBIZ_STRIKE_STATUS_STR_STR),64);
    v_strike_status_str[64] = '\0';
    v_basket_id = lpInBizMsg->GetInt64(LDBIZ_BASKET_ID_INT64);
    strncpy(v_comm_oper_way, lpInBizMsg->GetString(LDBIZ_COMM_OPER_WAY_STR),2);
    v_comm_oper_way[2] = '\0';
    v_exter_comm_flag = lpInBizMsg->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
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

    //调用过程[事务_交易证券_交易运维_查询指令汇总考核]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.58", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_TYPE_STR_STR,v_asset_type_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_DIR_STR_STR,v_comm_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_SUM_STATUS_STR_STR,v_comm_sum_status_str);
    lpTSCall1Req1->SetString(LDBIZ_STRIKE_STATUS_STR_STR,v_strike_status_str);
    lpTSCall1Req1->SetInt64(LDBIZ_BASKET_ID_INT64,v_basket_id);
    lpTSCall1Req1->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
    lpTSCall1Req1->SetInt32(LDBIZ_EXTER_COMM_FLAG_INT,v_exter_comm_flag);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.58]subcall timed out!");
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

//逻辑_交易证券_交易运维_查询指令汇总考核历史
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
    int v_begin_date;
    int v_end_date;
    int v_comm_date;
    int v_comm_batch_no;
    int v_comm_opor;
    int v_comm_executor;
    char v_comm_sum_appr_status_str[65];
    char v_exch_no_str[2049];
    int v_stock_code_no;
    char v_stock_type_str[2049];
    char v_asset_type_str[2049];
    char v_comm_dir_str[2049];
    char v_comm_sum_status_str[65];
    char v_strike_status_str[65];
    int64 v_basket_id;
    char v_comm_oper_way[3];
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
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_asset_type;
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
    int v_net_price_flag;
    double v_par_value;
    double v_bond_accr_intrst;
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
    double v_valid_aver_price;
    double v_valid_aver_price_allday;
    double v_exec_price_diff;
    double v_exec_price_diff_allday;
    double v_valid_ratio;
    double v_valid_ratio_allday;
    double v_valid_qty;
    double v_valid_qty_allday;
    int v_update_times;
    char v_comm_remark_info[1025];
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
    v_stock_code_no=0;
    strcpy(v_stock_type_str, " ");
    strcpy(v_asset_type_str, " ");
    strcpy(v_comm_dir_str, " ");
    strcpy(v_comm_sum_status_str, " ");
    strcpy(v_strike_status_str, " ");
    v_basket_id=0;
    strcpy(v_comm_oper_way, " ");
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
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_asset_type=0;
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
    v_net_price_flag=0;
    v_par_value=0;
    v_bond_accr_intrst=0;
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
    v_valid_aver_price=0;
    v_valid_aver_price_allday=0;
    v_exec_price_diff=0;
    v_exec_price_diff_allday=0;
    v_valid_ratio=0;
    v_valid_ratio_allday=0;
    v_valid_qty=0;
    v_valid_qty_allday=0;
    v_update_times=1;
    strcpy(v_comm_remark_info, " ");
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
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strncpy(v_stock_type_str, lpInBizMsg->GetString(LDBIZ_STOCK_TYPE_STR_STR),2048);
    v_stock_type_str[2048] = '\0';
    strncpy(v_asset_type_str, lpInBizMsg->GetString(LDBIZ_ASSET_TYPE_STR_STR),2048);
    v_asset_type_str[2048] = '\0';
    strncpy(v_comm_dir_str, lpInBizMsg->GetString(LDBIZ_COMM_DIR_STR_STR),2048);
    v_comm_dir_str[2048] = '\0';
    strncpy(v_comm_sum_status_str, lpInBizMsg->GetString(LDBIZ_COMM_SUM_STATUS_STR_STR),64);
    v_comm_sum_status_str[64] = '\0';
    strncpy(v_strike_status_str, lpInBizMsg->GetString(LDBIZ_STRIKE_STATUS_STR_STR),64);
    v_strike_status_str[64] = '\0';
    v_basket_id = lpInBizMsg->GetInt64(LDBIZ_BASKET_ID_INT64);
    strncpy(v_comm_oper_way, lpInBizMsg->GetString(LDBIZ_COMM_OPER_WAY_STR),2);
    v_comm_oper_way[2] = '\0';
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

    //调用过程[事务_交易证券_交易运维_查询指令汇总考核历史]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.59", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_TYPE_STR_STR,v_asset_type_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_DIR_STR_STR,v_comm_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_COMM_SUM_STATUS_STR_STR,v_comm_sum_status_str);
    lpTSCall1Req1->SetString(LDBIZ_STRIKE_STATUS_STR_STR,v_strike_status_str);
    lpTSCall1Req1->SetInt64(LDBIZ_BASKET_ID_INT64,v_basket_id);
    lpTSCall1Req1->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
    lpTSCall1Req1->SetInt32(LDBIZ_EXTER_COMM_FLAG_INT,v_exter_comm_flag);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.59]subcall timed out!");
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

//逻辑_交易证券_交易运维_更新查询指令汇总考核
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
    int v_co_no;
    int v_comm_date;
    int v_comm_batch_no;
    int v_comm_executor;
    double v_valid_aver_price;
    double v_valid_aver_price_allday;
    double v_exec_price_diff;
    double v_exec_price_diff_allday;
    double v_valid_ratio;
    double v_valid_ratio_allday;
    double v_valid_qty;
    double v_valid_qty_allday;
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
    v_comm_date=0;
    v_comm_batch_no=0;
    v_comm_executor=0;
    v_valid_aver_price=0;
    v_valid_aver_price_allday=0;
    v_exec_price_diff=0;
    v_exec_price_diff_allday=0;
    v_valid_ratio=0;
    v_valid_ratio_allday=0;
    v_valid_qty=0;
    v_valid_qty_allday=0;
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
    v_comm_date = lpInBizMsg->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_batch_no = lpInBizMsg->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_executor = lpInBizMsg->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_valid_aver_price = lpInBizMsg->GetDouble(LDBIZ_VALID_AVER_PRICE_FLOAT);
    v_valid_aver_price_allday = lpInBizMsg->GetDouble(LDBIZ_VALID_AVER_PRICE_ALLDAY_FLOAT);
    v_exec_price_diff = lpInBizMsg->GetDouble(LDBIZ_EXEC_PRICE_DIFF_FLOAT);
    v_exec_price_diff_allday = lpInBizMsg->GetDouble(LDBIZ_EXEC_PRICE_DIFF_ALLDAY_FLOAT);
    v_valid_ratio = lpInBizMsg->GetDouble(LDBIZ_VALID_RATIO_FLOAT);
    v_valid_ratio_allday = lpInBizMsg->GetDouble(LDBIZ_VALID_RATIO_ALLDAY_FLOAT);
    v_valid_qty = lpInBizMsg->GetDouble(LDBIZ_VALID_QTY_FLOAT);
    v_valid_qty_allday = lpInBizMsg->GetDouble(LDBIZ_VALID_QTY_ALLDAY_FLOAT);

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

    //调用过程[事务_交易证券_交易运维_更新查询指令汇总考核]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.60", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpTSCall1Req1->SetDouble(LDBIZ_VALID_AVER_PRICE_FLOAT,v_valid_aver_price);
    lpTSCall1Req1->SetDouble(LDBIZ_VALID_AVER_PRICE_ALLDAY_FLOAT,v_valid_aver_price_allday);
    lpTSCall1Req1->SetDouble(LDBIZ_EXEC_PRICE_DIFF_FLOAT,v_exec_price_diff);
    lpTSCall1Req1->SetDouble(LDBIZ_EXEC_PRICE_DIFF_ALLDAY_FLOAT,v_exec_price_diff_allday);
    lpTSCall1Req1->SetDouble(LDBIZ_VALID_RATIO_FLOAT,v_valid_ratio);
    lpTSCall1Req1->SetDouble(LDBIZ_VALID_RATIO_ALLDAY_FLOAT,v_valid_ratio_allday);
    lpTSCall1Req1->SetDouble(LDBIZ_VALID_QTY_FLOAT,v_valid_qty);
    lpTSCall1Req1->SetDouble(LDBIZ_VALID_QTY_ALLDAY_FLOAT,v_valid_qty_allday);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.60]subcall timed out!");
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

//逻辑_交易证券_交易运维_查询所有指令汇总
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
    int v_co_no;
    int v_comm_date;
    int v_comm_batch_no;
    int v_comm_executor;
    int v_stock_code_no;
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
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_asset_type;
    int v_stock_type;
    int v_comm_opor;
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
    int v_net_price_flag;
    double v_par_value;
    double v_bond_accr_intrst;
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
    int64 v_basket_id;
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
    char v_comm_oper_way[3];
    int v_exter_comm_flag;
    char v_exch_crncy_type[4];
    int v_update_times;
    char v_comm_remark_info[1025];
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
    v_comm_date=0;
    v_comm_batch_no=0;
    v_comm_executor=0;
    v_stock_code_no=0;
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
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_asset_type=0;
    v_stock_type=0;
    v_comm_opor=0;
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
    v_net_price_flag=0;
    v_par_value=0;
    v_bond_accr_intrst=0;
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
    v_basket_id=0;
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
    strcpy(v_comm_oper_way, " ");
    v_exter_comm_flag=0;
    strcpy(v_exch_crncy_type, "CNY");
    v_update_times=1;
    strcpy(v_comm_remark_info, " ");
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
    v_comm_date = lpInBizMsg->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_batch_no = lpInBizMsg->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_executor = lpInBizMsg->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);
    v_sort_type = lpInBizMsg->GetInt32(LDBIZ_SORT_TYPE_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //不进行权限控制
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

    //调用过程[事务_交易证券_交易运维_查询所有指令汇总]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.61", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetInt32(LDBIZ_SORT_TYPE_INT,v_sort_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.61]subcall timed out!");
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

//逻辑_交易证券_交易运维_查询运维订单回报
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
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    char v_exch_no_str[2049];
    char v_stock_acco[17];
    char v_stock_code[7];
    char v_order_dir_str[1025];
    char v_order_rsp_status_str[65];
    char v_deal_status_str[65];
    int v_pass_no;
    char v_report_no[33];
    int64 v_order_id;
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_asset_acco_no;
    int v_init_date;
    char v_out_acco[33];
    int v_exch_no;
    int v_report_date;
    int v_report_time;
    int v_order_date;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    int v_price_type;
    char v_order_rsp_status[3];
    char v_rsp_info[256];
    char v_deal_status[3];
    int v_update_times;
    char v_busi_ctrl_str[65];
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
    strcpy(v_exch_no_str, " ");
    strcpy(v_stock_acco, " ");
    strcpy(v_stock_code, " ");
    strcpy(v_order_dir_str, " ");
    strcpy(v_order_rsp_status_str, " ");
    strcpy(v_deal_status_str, " ");
    v_pass_no=0;
    strcpy(v_report_no, " ");
    v_order_id=0;
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_asset_acco_no=0;
    v_init_date=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    v_report_date=0;
    v_report_time=0;
    v_order_date=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_price_type=0;
    strcpy(v_order_rsp_status, "0");
    strcpy(v_rsp_info, " ");
    strcpy(v_deal_status, "0");
    v_update_times=1;
    strcpy(v_busi_ctrl_str, " ");
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
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    strncpy(v_stock_acco, lpInBizMsg->GetString(LDBIZ_STOCK_ACCO_STR),16);
    v_stock_acco[16] = '\0';
    strncpy(v_stock_code, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR),6);
    v_stock_code[6] = '\0';
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    strncpy(v_order_rsp_status_str, lpInBizMsg->GetString(LDBIZ_ORDER_RSP_STATUS_STR_STR),64);
    v_order_rsp_status_str[64] = '\0';
    strncpy(v_deal_status_str, lpInBizMsg->GetString(LDBIZ_DEAL_STATUS_STR_STR),64);
    v_deal_status_str[64] = '\0';
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    strncpy(v_report_no, lpInBizMsg->GetString(LDBIZ_REPORT_NO_STR),32);
    v_report_no[32] = '\0';
    v_order_id = lpInBizMsg->GetInt64(LDBIZ_ORDER_ID_INT64);
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

    //调用过程[事务_交易证券_交易运维_查询运维订单回报]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.62", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_RSP_STATUS_STR_STR,v_order_rsp_status_str);
    lpTSCall1Req1->SetString(LDBIZ_DEAL_STATUS_STR_STR,v_deal_status_str);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpTSCall1Req1->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.62]subcall timed out!");
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

//逻辑_交易证券_交易运维_查询运维成交回报
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
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    char v_exch_no_str[2049];
    char v_stock_acco[17];
    char v_stock_code[7];
    char v_order_dir_str[1025];
    char v_deal_status_str[65];
    int v_pass_no;
    char v_report_no[33];
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_asset_acco_no;
    int v_init_date;
    char v_out_acco[33];
    int v_exch_no;
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    int v_order_dir;
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    int v_strike_deal_type;
    char v_rsp_info[256];
    char v_deal_status[3];
    int v_update_times;
    int v_report_date;
    char v_busi_ctrl_str[65];
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
    strcpy(v_exch_no_str, " ");
    strcpy(v_stock_acco, " ");
    strcpy(v_stock_code, " ");
    strcpy(v_order_dir_str, " ");
    strcpy(v_deal_status_str, " ");
    v_pass_no=0;
    strcpy(v_report_no, " ");
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_asset_acco_no=0;
    v_init_date=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_order_dir=0;
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_strike_deal_type=0;
    strcpy(v_rsp_info, " ");
    strcpy(v_deal_status, "0");
    v_update_times=1;
    v_report_date=0;
    strcpy(v_busi_ctrl_str, " ");
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
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    strncpy(v_stock_acco, lpInBizMsg->GetString(LDBIZ_STOCK_ACCO_STR),16);
    v_stock_acco[16] = '\0';
    strncpy(v_stock_code, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR),6);
    v_stock_code[6] = '\0';
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    strncpy(v_deal_status_str, lpInBizMsg->GetString(LDBIZ_DEAL_STATUS_STR_STR),64);
    v_deal_status_str[64] = '\0';
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    strncpy(v_report_no, lpInBizMsg->GetString(LDBIZ_REPORT_NO_STR),32);
    v_report_no[32] = '\0';
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

    //调用过程[事务_交易证券_交易运维_查询运维成交回报]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.63", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_DEAL_STATUS_STR_STR,v_deal_status_str);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.63]subcall timed out!");
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

//逻辑_交易证券_交易运维_查询运维成交明细
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
    int v_busi_opor_no;
    char v_order_oper_way_str[1025];
    int v_co_no;
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    char v_exch_no_str[2049];
    int v_stock_code_no;
    char v_stock_type_str[2049];
    int64 v_comm_id;
    int v_comm_batch_no;
    char v_order_dir_str[1025];
    int v_exter_comm_flag;
    int v_record_valid_flag;
    int v_pass_no;
    char v_report_no[33];
    int64 v_order_id;
    int64 v_row_id;
    int v_row_count;
    int v_sort_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    char v_out_acco[33];
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_type;
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    int v_report_date;
    int v_order_date;
    int v_order_time;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    double v_strike_qty;
    double v_strike_price;
    double v_strike_amt;
    double v_all_fee;
    double v_stamp_tax;
    double v_trans_fee;
    double v_brkage_fee;
    double v_SEC_charges;
    double v_other_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_bond_accr_intrst;
    double v_strike_bond_accr_intrst;
    int v_net_price_flag;
    char v_order_oper_way[3];
    int v_update_times;
    char v_busi_ctrl_str[65];
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
    v_busi_opor_no=0;
    strcpy(v_order_oper_way_str, " ");
    v_co_no=0;
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    strcpy(v_exch_no_str, " ");
    v_stock_code_no=0;
    strcpy(v_stock_type_str, " ");
    v_comm_id=0;
    v_comm_batch_no=0;
    strcpy(v_order_dir_str, " ");
    v_exter_comm_flag=0;
    v_record_valid_flag=0;
    v_pass_no=0;
    strcpy(v_report_no, " ");
    v_order_id=0;
    v_row_id=0;
    v_row_count=-1;
    v_sort_type=1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_type=0;
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_report_date=0;
    v_order_date=0;
    v_order_time=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_strike_qty=0;
    v_strike_price=0;
    v_strike_amt=0;
    v_all_fee=0;
    v_stamp_tax=0;
    v_trans_fee=0;
    v_brkage_fee=0;
    v_SEC_charges=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_bond_accr_intrst=0;
    v_strike_bond_accr_intrst=0;
    v_net_price_flag=0;
    strcpy(v_order_oper_way, " ");
    v_update_times=1;
    strcpy(v_busi_ctrl_str, " ");
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
    v_busi_opor_no = lpInBizMsg->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    strncpy(v_order_oper_way_str, lpInBizMsg->GetString(LDBIZ_ORDER_OPER_WAY_STR_STR),1024);
    v_order_oper_way_str[1024] = '\0';
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    strncpy(v_pd_no_str, lpInBizMsg->GetString(LDBIZ_PD_NO_STR_STR),2048);
    v_pd_no_str[2048] = '\0';
    strncpy(v_exch_group_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR),2048);
    v_exch_group_no_str[2048] = '\0';
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strncpy(v_stock_type_str, lpInBizMsg->GetString(LDBIZ_STOCK_TYPE_STR_STR),2048);
    v_stock_type_str[2048] = '\0';
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpInBizMsg->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    v_exter_comm_flag = lpInBizMsg->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_record_valid_flag = lpInBizMsg->GetInt32(LDBIZ_RECORD_VALID_FLAG_INT);
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    strncpy(v_report_no, lpInBizMsg->GetString(LDBIZ_REPORT_NO_STR),32);
    v_report_no[32] = '\0';
    v_order_id = lpInBizMsg->GetInt64(LDBIZ_ORDER_ID_INT64);
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

    //调用过程[事务_交易证券_交易运维_查询运维成交明细]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.64", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_OPER_WAY_STR_STR,v_order_oper_way_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_STR_STR,v_exch_group_no_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req1->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetInt32(LDBIZ_EXTER_COMM_FLAG_INT,v_exter_comm_flag);
    lpTSCall1Req1->SetInt32(LDBIZ_RECORD_VALID_FLAG_INT,v_record_valid_flag);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpTSCall1Req1->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetInt32(LDBIZ_SORT_TYPE_INT,v_sort_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.64]subcall timed out!");
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

//逻辑_交易证券_交易运维_查询报盘信息
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
    int v_pass_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
    char v_offer_type[33];
    char v_offer_name[33];
    char v_offer_server_name[65];
    char v_offer_server_ip[65];
    int v_offer_server_port;
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
    v_pass_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_row_id=0;
    strcpy(v_offer_type, " ");
    strcpy(v_offer_name, " ");
    strcpy(v_offer_server_name, " ");
    strcpy(v_offer_server_ip, " ");
    v_offer_server_port=0;
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
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //公共子系统检查，检查交易日期时间
    //set @业务控制串// = "111";
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

    //调用过程[事务_交易证券_交易运维_查询报盘信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.65", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.65]subcall timed out!");
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

//逻辑_交易证券_交易运维_查询运维撤单流水
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
    char v_exch_no_str[2049];
    char v_stock_acco[17];
    char v_stock_code[7];
    char v_order_dir_str[1025];
    int v_pass_no;
    char v_report_no[33];
    int64 v_order_id;
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_oper_func_code[17];
    int v_init_date;
    int v_asset_acco_no;
    char v_out_acco[33];
    char v_exch_crncy_type[4];
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    int64 v_external_no;
    int v_wtdraw_batch_no;
    int v_wtdraw_date;
    int v_wtdraw_time;
    int v_order_date;
    int v_report_date;
    int v_report_time;
    char v_wtdraw_status[3];
    double v_wtdraw_qty;
    char v_wtdraw_remark[256];
    double v_order_price;
    int v_update_times;
    char v_busi_ctrl_str[65];
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
    strcpy(v_exch_no_str, " ");
    strcpy(v_stock_acco, " ");
    strcpy(v_stock_code, " ");
    strcpy(v_order_dir_str, " ");
    v_pass_no=0;
    strcpy(v_report_no, " ");
    v_order_id=0;
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_oper_func_code, " ");
    v_init_date=0;
    v_asset_acco_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_exch_crncy_type, "CNY");
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_external_no=0;
    v_wtdraw_batch_no=0;
    v_wtdraw_date=0;
    v_wtdraw_time=0;
    v_order_date=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_wtdraw_status, "0");
    v_wtdraw_qty=0;
    strcpy(v_wtdraw_remark, " ");
    v_order_price=0;
    v_update_times=1;
    strcpy(v_busi_ctrl_str, " ");
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
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    strncpy(v_stock_acco, lpInBizMsg->GetString(LDBIZ_STOCK_ACCO_STR),16);
    v_stock_acco[16] = '\0';
    strncpy(v_stock_code, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR),6);
    v_stock_code[6] = '\0';
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    strncpy(v_report_no, lpInBizMsg->GetString(LDBIZ_REPORT_NO_STR),32);
    v_report_no[32] = '\0';
    v_order_id = lpInBizMsg->GetInt64(LDBIZ_ORDER_ID_INT64);
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

    //调用过程[事务_交易证券_交易运维_查询运维撤单流水]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.66", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpTSCall1Req1->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.66]subcall timed out!");
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

//逻辑_交易证券_交易运维_同步场外基金成交回报表
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
    char v_out_acco[33];
    int v_report_date;
    char v_report_no[33];
    char v_strike_no[65];
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    int v_exch_no;
    char v_rsp_info[256];
    int v_strike_deal_type;
    int v_strike_date;
    int v_strike_time;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_pass_no;
    char v_stock_acco[17];
    char v_stock_code[7];
    int64 v_row_id;
    int v_order_dir;
    char v_log_error_code[33];
    char v_log_error_info[256];

    IGroup* lpSetFuMsg=NULL;
    int iRecordCount = 0;

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
    strcpy(v_out_acco, " ");
    v_report_date=0;
    strcpy(v_report_no, " ");
    strcpy(v_strike_no, " ");
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_exch_no=0;
    strcpy(v_rsp_info, " ");
    v_strike_deal_type=0;
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_pass_no=0;
    strcpy(v_stock_acco, " ");
    strcpy(v_stock_code, " ");
    v_row_id=0;
    v_order_dir=0;
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
    strncpy(v_out_acco, lpInBizMsg->GetString(LDBIZ_OUT_ACCO_STR),32);
    v_out_acco[32] = '\0';
    v_report_date = lpInBizMsg->GetInt32(LDBIZ_REPORT_DATE_INT);
    strncpy(v_report_no, lpInBizMsg->GetString(LDBIZ_REPORT_NO_STR),32);
    v_report_no[32] = '\0';
    strncpy(v_strike_no, lpInBizMsg->GetString(LDBIZ_STRIKE_NO_STR),64);
    v_strike_no[64] = '\0';
    v_strike_price = lpInBizMsg->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
    v_strike_qty = lpInBizMsg->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpInBizMsg->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    strncpy(v_rsp_info, lpInBizMsg->GetString(LDBIZ_RSP_INFO_STR),255);
    v_rsp_info[255] = '\0';
    v_strike_deal_type = lpInBizMsg->GetInt32(LDBIZ_STRIKE_DEAL_TYPE_INT);
    v_strike_date = lpInBizMsg->GetInt32(LDBIZ_STRIKE_DATE_INT);
    v_strike_time = lpInBizMsg->GetInt32(LDBIZ_STRIKE_TIME_INT);

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

    //调用过程[事务_交易证券_交易运维_获取结算资金股份流水]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.67", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.67]subcall timed out!");
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


    // [获取结果集][lpSetFuMsg]
    lpSetFuMsg=lpTSCall1Ans1->GetGroup(LDTAG_NO_RESULTSET);


    // [遍历结果集开始][lpSetFuMsg]
    iRecordCount = lpSetFuMsg->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpSetFuMsg->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            strcpy(v_out_acco, lpRecord->GetString(LDBIZ_OUT_ACCO_STR));
            v_report_date = lpRecord->GetInt32(LDBIZ_REPORT_DATE_INT);
            strcpy(v_report_no, lpRecord->GetString(LDBIZ_REPORT_NO_STR));
            strcpy(v_strike_no, lpRecord->GetString(LDBIZ_STRIKE_NO_STR));
            v_strike_price = lpRecord->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
            v_strike_qty = lpRecord->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
            v_strike_amt = lpRecord->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);

         //调用过程[事务_公共_公共接口_获取系统初始化日期]
         //组织事务请求
         if(lpTSCall1Ans2)
         {
           lpTSCall1Ans2->FreeMsg();
           lpTSCall1Ans2=NULL;
         }
         lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.53", 0);
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
             lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.53]subcall timed out!");
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


         // set @市场编号# = 《市场编号-场外交易市场》;
         v_exch_no = 5;

         // set @回报信息# = "场外基金成交处理";
         strcpy(v_rsp_info,"场外基金成交处理");

         // set @成交处理方式# = 《成交处理方式-分笔》;
         v_strike_deal_type = 1;
        //调用过程[事务_交易证券_交易_查询部分订单信息]
        //组织事务请求
        if(lpTSCall1Ans3)
        {
          lpTSCall1Ans3->FreeMsg();
          lpTSCall1Ans3=NULL;
        }
        lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("tdsecuT.4.126", 0);
        lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req3->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
        lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req3->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
        lpTSCall1Req3->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
        glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
        if(!lpTSCall1Ans3)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.4.126]subcall timed out!");
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
        v_pass_no = lpTSCall1Ans3->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_stock_acco, lpTSCall1Ans3->GetString(LDBIZ_STOCK_ACCO_STR));
        strcpy(v_stock_code, lpTSCall1Ans3->GetString(LDBIZ_STOCK_CODE_STR));
        v_row_id = lpTSCall1Ans3->GetInt64(LDBIZ_ROW_ID_INT64);
        v_order_dir = lpTSCall1Ans3->GetInt32(LDBIZ_ORDER_DIR_INT);


        // if @记录序号# >0 then
        if (v_row_id >0)
        {
            //调用过程[事务_交易证券_交易运维_同步场外基金成交回报表]
            //组织事务请求
            if(lpTSCall1Ans4)
            {
              lpTSCall1Ans4->FreeMsg();
              lpTSCall1Ans4=NULL;
            }
            lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.68", 0);
            lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req4->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
            lpTSCall1Req4->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
            lpTSCall1Req4->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
            lpTSCall1Req4->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
            lpTSCall1Req4->SetString(LDBIZ_STRIKE_NO_STR,v_strike_no);
            lpTSCall1Req4->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
            lpTSCall1Req4->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
            lpTSCall1Req4->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
            lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req4->SetString(LDBIZ_RSP_INFO_STR,v_rsp_info);
            lpTSCall1Req4->SetInt32(LDBIZ_STRIKE_DEAL_TYPE_INT,v_strike_deal_type);
            lpTSCall1Req4->SetInt32(LDBIZ_STRIKE_TIME_INT,v_strike_time);
            lpTSCall1Req4->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
            lpTSCall1Req4->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
            lpTSCall1Req4->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
            lpTSCall1Req4->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
            lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
            glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
            if(!lpTSCall1Ans4)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.68]subcall timed out!");
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

        // end if;
        }


    // [遍历结果集结束]
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
        if(lpTSCall1Ans5)
        {
          lpTSCall1Ans5->FreeMsg();
          lpTSCall1Ans5=NULL;
        }
        lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req5->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req5->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
        if (lpTSCall1Ans5)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans5->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans5->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans5->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans5->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans5->GetString(LDBIZ_ERROR_DEAL_STR));
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
    return iRet;
}

//逻辑_交易证券_交易运维_查询场外基金成交回报表
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
    char v_stock_code[7];
    int v_exch_no;
    int v_order_dir;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_pass_no;
    char v_out_acco[33];
    char v_stock_acco[17];
    int v_report_date;
    char v_report_no[33];
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    int v_strike_deal_type;
    char v_rsp_info[256];
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
    strcpy(v_stock_code, " ");
    v_exch_no=0;
    v_order_dir=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_stock_acco, " ");
    v_report_date=0;
    strcpy(v_report_no, " ");
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_strike_deal_type=0;
    strcpy(v_rsp_info, " ");
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
    strncpy(v_stock_code, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR),6);
    v_stock_code[6] = '\0';
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    v_order_dir = lpInBizMsg->GetInt32(LDBIZ_ORDER_DIR_INT);

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

             //调用过程[事务_交易证券_交易运维_查询场外基金成交回报表]
             //组织事务请求
             if(lpTSCall1Ans1)
             {
               lpTSCall1Ans1->FreeMsg();
               lpTSCall1Ans1=NULL;
             }
             lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.69", 0);
             lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
             lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
             lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
             lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
             lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
             lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
             lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
             lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
             lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
             lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
             lpTSCall1Req1->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
             glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
             if(!lpTSCall1Ans1)  //  超时错误
             {
                 lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                 lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.69]subcall timed out!");
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

//逻辑_交易证券_交易运维_错单修改成交回溯
int LD_CALL_MODE fnFunc25(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int64 v_row_id;
    char v_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_strike_id;
    int v_init_date;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    int v_exch_no;
    char v_combo_code[33];
    int v_stock_acco_no;
    char v_stock_code[7];
    int v_stock_code_no;
    int v_stock_type;
    int64 v_comm_id;
    int v_comm_batch_no;
    int v_strike_date;
    int v_strike_time;
    char v_strike_no[65];
    int v_report_date;
    char v_report_no[33];
    int v_order_date;
    int64 v_order_id;
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    double v_strike_qty;
    double v_strike_price;
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
    int v_net_price_flag;
    int v_intrst_days;
    double v_par_value;
    double v_bond_accr_intrst;
    int v_bond_rate_type;
    double v_impawn_ratio;
    int v_trade_code_no;
    int v_target_code_no;
    char v_order_oper_way[3];
    int v_exter_comm_flag;
    int v_record_valid_flag;
    int v_busi_opor_no;
    int v_update_times;
    int v_order_batch_no;
    int64 v_external_no;
    int v_tmp_update_times;
    int v_price_type;
    char v_sys_config_str[65];
    char v_co_busi_config_str[65];
    char v_exgp_busi_config_str[65];
    int v_asset_type;
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    double v_buy_ref_rate;
    double v_sell_ref_rate;
    int v_min_unit;
    double v_up_limit_price;
    double v_down_limit_price;
    double v_last_price;
    int v_repo_days;
    int v_repo_back_date;
    int v_capit_reback_days;
    int v_posi_reback_days;
    int v_bond_qty_unit_set;
    int v_apply_date;
    char v_trade_acco[33];
    char v_busi_config_str[65];
    char v_busi_ctrl_str[65];
    char v_asac_busi_config_str[65];
    char v_split_fee_typr_str[65];
    char v_busi_limit_str[2049];
    double v_nav_asset;
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
    int v_asset_acco_type;
    int v_sell_auto_back_debt;
    char v_stock_acco[17];
    double v_exgp_cost_amt;
    double v_exgp_intrst_cost_amt;
    double v_exgp_curr_qty;
    double v_asac_cost_amt;
    double v_asac_intrst_cost_amt;
    double v_asac_curr_qty;
    int64 v_repo_strike_id;
    int v_repo_cale_days;
    double v_strike_bond_accr_intrst;
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
    char v_contra_no[33];
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
    int v_report_time;
    int v_order_time;
    char v_order_status[3];
    double v_wtdraw_qty;
    double v_order_frozen_amt;
    double v_order_frozen_qty;
    char v_rsp_info[256];
    int64 v_compli_trig_id;
    int64 v_combo_posi_id;
    int64 v_strategy_id;
    double v_curr_strike_price;
    double v_curr_strike_amt;
    double v_curr_strike_qty;
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
    double v_exch_rate;
    double v_repo_qty;
    double v_repo_amt;
    double v_repo_rate;
    int v_repo_trade_date;
    int64 v_repo_order_id;
    double v_repo_back_amt;
    double v_repo_back_intrst;
    int v_repo_back_trade_date;
    char v_repo_status[3];
    int64 v_bond_repo_id;
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
    v_row_id=0;
    strcpy(v_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_strike_id=0;
    v_init_date=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    strcpy(v_combo_code, " ");
    v_stock_acco_no=0;
    strcpy(v_stock_code, " ");
    v_stock_code_no=0;
    v_stock_type=0;
    v_comm_id=0;
    v_comm_batch_no=0;
    v_strike_date=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    v_report_date=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_id=0;
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_strike_qty=0;
    v_strike_price=0;
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
    v_net_price_flag=0;
    v_intrst_days=0;
    v_par_value=0;
    v_bond_accr_intrst=0;
    v_bond_rate_type=0;
    v_impawn_ratio=0;
    v_trade_code_no=0;
    v_target_code_no=0;
    strcpy(v_order_oper_way, " ");
    v_exter_comm_flag=0;
    v_record_valid_flag=0;
    v_busi_opor_no=0;
    v_update_times=1;
    v_order_batch_no=0;
    v_external_no=0;
    v_tmp_update_times=1;
    v_price_type=0;
    strcpy(v_sys_config_str, " ");
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_exgp_busi_config_str, " ");
    v_asset_type=0;
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_buy_ref_rate=0;
    v_sell_ref_rate=0;
    v_min_unit=0;
    v_up_limit_price=0;
    v_down_limit_price=0;
    v_last_price=0;
    v_repo_days=0;
    v_repo_back_date=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    v_bond_qty_unit_set=0;
    v_apply_date=0;
    strcpy(v_trade_acco, " ");
    strcpy(v_busi_config_str, " ");
    strcpy(v_busi_ctrl_str, " ");
    strcpy(v_asac_busi_config_str, " ");
    strcpy(v_split_fee_typr_str, " ");
    strcpy(v_busi_limit_str, " ");
    v_nav_asset=0;
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
    v_asset_acco_type=0;
    v_sell_auto_back_debt=0;
    strcpy(v_stock_acco, " ");
    v_exgp_cost_amt=0;
    v_exgp_intrst_cost_amt=0;
    v_exgp_curr_qty=0;
    v_asac_cost_amt=0;
    v_asac_intrst_cost_amt=0;
    v_asac_curr_qty=0;
    v_repo_strike_id=0;
    v_repo_cale_days=0;
    v_strike_bond_accr_intrst=0;
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
    strcpy(v_contra_no, " ");
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
    v_report_time=0;
    v_order_time=0;
    strcpy(v_order_status, "0");
    v_wtdraw_qty=0;
    v_order_frozen_amt=0;
    v_order_frozen_qty=0;
    strcpy(v_rsp_info, " ");
    v_compli_trig_id=0;
    v_combo_posi_id=0;
    v_strategy_id=0;
    v_curr_strike_price=0;
    v_curr_strike_amt=0;
    v_curr_strike_qty=0;
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
    v_exch_rate=0;
    v_repo_qty=0;
    v_repo_amt=0;
    v_repo_rate=0;
    v_repo_trade_date=0;
    v_repo_order_id=0;
    v_repo_back_amt=0;
    v_repo_back_intrst=0;
    v_repo_back_trade_date=0;
    strcpy(v_repo_status, "0");
    v_bond_repo_id=0;
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
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
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


    // set @成交序号#= @记录序号#;
    v_strike_id= v_row_id;
    //调用过程[事务_交易证券_交易运维_回溯取错单修改成交]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.70", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt64(LDBIZ_STRIKE_ID_INT64,v_strike_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.70]subcall timed out!");
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
    v_co_no = lpTSCall1Ans0->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans0->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans0->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans0->GetString(LDBIZ_OUT_ACCO_STR));
    v_exch_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_NO_INT);
    strcpy(v_combo_code, lpTSCall1Ans0->GetString(LDBIZ_COMBO_CODE_STR));
    v_stock_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_code, lpTSCall1Ans0->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_stock_type = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_comm_id = lpTSCall1Ans0->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_strike_date = lpTSCall1Ans0->GetInt32(LDBIZ_STRIKE_DATE_INT);
    v_strike_time = lpTSCall1Ans0->GetInt32(LDBIZ_STRIKE_TIME_INT);
    strcpy(v_strike_no, lpTSCall1Ans0->GetString(LDBIZ_STRIKE_NO_STR));
    v_report_date = lpTSCall1Ans0->GetInt32(LDBIZ_REPORT_DATE_INT);
    strcpy(v_report_no, lpTSCall1Ans0->GetString(LDBIZ_REPORT_NO_STR));
    v_order_date = lpTSCall1Ans0->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_order_id = lpTSCall1Ans0->GetInt64(LDBIZ_ORDER_ID_INT64);
    v_order_dir = lpTSCall1Ans0->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_order_price = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_price = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
    v_strike_amt = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_all_fee = lpTSCall1Ans0->GetDouble(LDBIZ_ALL_FEE_FLOAT);
    v_stamp_tax = lpTSCall1Ans0->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
    v_trans_fee = lpTSCall1Ans0->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
    v_brkage_fee = lpTSCall1Ans0->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
    v_SEC_charges = lpTSCall1Ans0->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
    v_other_fee = lpTSCall1Ans0->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
    v_trade_commis = lpTSCall1Ans0->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_other_commis = lpTSCall1Ans0->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    v_trade_tax = lpTSCall1Ans0->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
    v_trade_cost_fee = lpTSCall1Ans0->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
    v_trade_system_use_fee = lpTSCall1Ans0->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
    v_stock_settle_fee = lpTSCall1Ans0->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);
    v_net_price_flag = lpTSCall1Ans0->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
    v_intrst_days = lpTSCall1Ans0->GetInt32(LDBIZ_INTRST_DAYS_INT);
    v_par_value = lpTSCall1Ans0->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
    v_bond_accr_intrst = lpTSCall1Ans0->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
    v_bond_rate_type = lpTSCall1Ans0->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
    v_impawn_ratio = lpTSCall1Ans0->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
    v_trade_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
    v_target_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
    strcpy(v_order_oper_way, lpTSCall1Ans0->GetString(LDBIZ_ORDER_OPER_WAY_STR));
    v_exter_comm_flag = lpTSCall1Ans0->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_record_valid_flag = lpTSCall1Ans0->GetInt32(LDBIZ_RECORD_VALID_FLAG_INT);
    v_busi_opor_no = lpTSCall1Ans0->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_update_times = lpTSCall1Ans0->GetInt32(LDBIZ_UPDATE_TIMES_INT);
    v_order_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_external_no = lpTSCall1Ans0->GetInt64(LDBIZ_EXTERNAL_NO_INT64);


    // set @临时_更新次数#=@更新次数#;
    v_tmp_update_times=v_update_times;

    // [检查报错返回][@订单操作方式# = 《订单操作方式-增强交易》 or @订单操作方式# = 《订单操作方式-增强交易平仓》 or @订单操作方式# = 《订单操作方式-金纳算法交易》 or @订单操作方式# = 《订单操作方式-多账户算法交易》 or @订单操作方式# = 《订单操作方式-港股通算法交易》 or @订单操作方式# = 《订单操作方式-指令算法交易》 or @订单操作方式# = 《订单操作方式-调仓算法交易》  or @订单操作方式# = 《订单操作方式-调仓指令算法交易》 or @订单操作方式# = 《订单操作方式-组合买入》  or @订单操作方式# = 《订单操作方式-组合卖出》  or @订单操作方式# = 《订单操作方式-组合调仓》 or @订单操作方式# = 《订单操作方式-篮子买入算法交易》 or @订单操作方式# = 《订单操作方式-篮子卖出算法交易》 or @订单操作方式# = 《订单操作方式-预埋单交易》 or @订单操作方式# = 《订单操作方式-体外指令》][624][@订单操作方式#]
    if (strcmp(v_order_oper_way , "14")==0 || strcmp(v_order_oper_way , "51")==0 || strcmp(v_order_oper_way , "61")==0 || strcmp(v_order_oper_way , "62")==0 || strcmp(v_order_oper_way , "63")==0 || strcmp(v_order_oper_way , "65")==0 || strcmp(v_order_oper_way , "66")==0  || strcmp(v_order_oper_way , "67")==0 || strcmp(v_order_oper_way , "26")==0  || strcmp(v_order_oper_way , "27")==0  || strcmp(v_order_oper_way , "28")==0 || strcmp(v_order_oper_way , "79")==0 || strcmp(v_order_oper_way , "80")==0 || strcmp(v_order_oper_way , "34")==0 || strcmp(v_order_oper_way , "41")==0)
    {
        strcpy(v_error_code, "tdsecuL.10.72.624");
        snprintf(v_error_info, sizeof(v_error_info), "%s%s","订单操作方式=",v_order_oper_way);
        iRet = -1;
        goto END;
    }


    // [检查报错返回][@记录有效标志# = 《记录有效标志-无效》][761][@记录有效标志#]
    if (v_record_valid_flag == 2)
    {
        strcpy(v_error_code, "tdsecuL.10.72.761");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d","记录有效标志=",v_record_valid_flag);
        iRet = -1;
        goto END;
    }


    // set @价格类型# = 《价格类型-限价》;
    v_price_type = 1;
    //公共子系统检查
    //调用过程[事务_公共_交易接口_检查系统状态交易业务]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.25.27", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req1->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req1->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    lpTSCall1Req1->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
    lpTSCall1Req1->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.27]subcall timed out!");
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
    v_bond_accr_intrst = lpTSCall1Ans1->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
    v_bond_rate_type = lpTSCall1Ans1->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
    v_trade_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
    v_target_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
    v_min_unit = lpTSCall1Ans1->GetInt32(LDBIZ_MIN_UNIT_INT);
    v_up_limit_price = lpTSCall1Ans1->GetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT);
    v_down_limit_price = lpTSCall1Ans1->GetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
    v_last_price = lpTSCall1Ans1->GetDouble(LDBIZ_LAST_PRICE_FLOAT);
    v_repo_days = lpTSCall1Ans1->GetInt32(LDBIZ_REPO_DAYS_INT);
    v_repo_back_date = lpTSCall1Ans1->GetInt32(LDBIZ_REPO_BACK_DATE_INT);
    v_capit_reback_days = lpTSCall1Ans1->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans1->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    v_bond_qty_unit_set = lpTSCall1Ans1->GetInt32(LDBIZ_BOND_QTY_UNIT_SET_INT);
    v_apply_date = lpTSCall1Ans1->GetInt32(LDBIZ_APPLY_DATE_INT);
    strcpy(v_trade_acco, lpTSCall1Ans1->GetString(LDBIZ_TRADE_ACCO_STR));


    // set @业务控制配置串# = @交易组业务控制配置串#;
    strcpy(v_busi_config_str,v_exgp_busi_config_str);

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

    //获取股东代码
    //调用过程[事务_产品证券_交易接口_检查股东账户状态获取持仓成本]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdsecuT.6.4", 0);
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
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req3->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.6.4]subcall timed out!");
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
    v_stock_acco_no = lpTSCall1Ans3->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans3->GetString(LDBIZ_STOCK_ACCO_STR));
    v_exgp_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
    v_exgp_intrst_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
    v_exgp_curr_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT);
    v_asac_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
    v_asac_intrst_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
    v_asac_curr_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT);


    // set @回购成交序号# = @成交序号#;
    v_repo_strike_id = v_strike_id;

    // set @回购天数# = 0;
    v_repo_days = 0;

    // set @回购实际天数# = 0;
    v_repo_cale_days = 0;

    // set @回购到期日期# = 0;
    v_repo_back_date = 0;
    //调用过程[事务_交易证券_交易运维_错单修改成交回溯]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.71", 0);
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
    lpTSCall1Req4->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req4->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req4->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req4->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req4->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req4->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
    lpTSCall1Req4->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req4->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req4->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
    lpTSCall1Req4->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
    lpTSCall1Req4->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
    lpTSCall1Req4->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpTSCall1Req4->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req4->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpTSCall1Req4->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req4->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req4->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req4->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req4->SetInt64(LDBIZ_STRIKE_ID_INT64,v_strike_id);
    lpTSCall1Req4->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
    lpTSCall1Req4->SetInt32(LDBIZ_STRIKE_TIME_INT,v_strike_time);
    lpTSCall1Req4->SetString(LDBIZ_STRIKE_NO_STR,v_strike_no);
    lpTSCall1Req4->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
    lpTSCall1Req4->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
    lpTSCall1Req4->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
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
    lpTSCall1Req4->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
    lpTSCall1Req4->SetInt32(LDBIZ_INTRST_DAYS_INT,v_intrst_days);
    lpTSCall1Req4->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
    lpTSCall1Req4->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
    lpTSCall1Req4->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
    lpTSCall1Req4->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
    lpTSCall1Req4->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    lpTSCall1Req4->SetInt64(LDBIZ_REPO_STRIKE_ID_INT64,v_repo_strike_id);
    lpTSCall1Req4->SetInt32(LDBIZ_REPO_DAYS_INT,v_repo_days);
    lpTSCall1Req4->SetInt32(LDBIZ_REPO_CALE_DAYS_INT,v_repo_cale_days);
    lpTSCall1Req4->SetInt32(LDBIZ_REPO_BACK_DATE_INT,v_repo_back_date);
    lpTSCall1Req4->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
    lpTSCall1Req4->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
    lpTSCall1Req4->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
    lpTSCall1Req4->SetInt32(LDBIZ_COST_CALC_TYPE_INT,v_cost_calc_type);
    lpTSCall1Req4->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT,v_exgp_curr_qty);
    lpTSCall1Req4->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT,v_asac_curr_qty);
    lpTSCall1Req4->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
    lpTSCall1Req4->SetDouble(LDBIZ_BUY_REF_RATE_FLOAT,v_buy_ref_rate);
    lpTSCall1Req4->SetDouble(LDBIZ_SELL_REF_RATE_FLOAT,v_sell_ref_rate);
    lpTSCall1Req4->SetString(LDBIZ_SYS_CONFIG_STR_STR,v_sys_config_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.71]subcall timed out!");
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


    // set @组合代码# = " ";
    strcpy(v_combo_code," ");

    // set @成交债券计提利息# = 0;
    v_strike_bond_accr_intrst = 0;

    // set @操作员编号#=@业务操作员编号#;
    v_opor_no=v_busi_opor_no;

    // set @记录有效标志# =《记录有效标志-无效》;
    v_record_valid_flag =2;

    // set @更新次数#=@临时_更新次数#+1;
    v_update_times=v_tmp_update_times+1;

    // [主动推送][secu.rptstrike][证券主推_报盘_成交主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.33", 0);
    lpPubMsg->SetInt64(LDBIZ_STRIKE_ID_INT64,v_strike_id);
    lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpPubMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpPubMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpPubMsg->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
    lpPubMsg->SetInt32(LDBIZ_STRIKE_TIME_INT,v_strike_time);
    lpPubMsg->SetString(LDBIZ_STRIKE_NO_STR,v_strike_no);
    lpPubMsg->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpPubMsg->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpPubMsg->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpPubMsg->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpPubMsg->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpPubMsg->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
    lpPubMsg->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
    lpPubMsg->SetDouble(LDBIZ_STAMP_TAX_FLOAT,v_stamp_tax);
    lpPubMsg->SetDouble(LDBIZ_TRANS_FEE_FLOAT,v_trans_fee);
    lpPubMsg->SetDouble(LDBIZ_BRKAGE_FEE_FLOAT,v_brkage_fee);
    lpPubMsg->SetDouble(LDBIZ_SEC_CHARGES_FLOAT,v_SEC_charges);
    lpPubMsg->SetDouble(LDBIZ_OTHER_FEE_FLOAT,v_other_fee);
    lpPubMsg->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
    lpPubMsg->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
    lpPubMsg->SetDouble(LDBIZ_TRADE_TAX_FLOAT,v_trade_tax);
    lpPubMsg->SetDouble(LDBIZ_TRADE_COST_FEE_FLOAT,v_trade_cost_fee);
    lpPubMsg->SetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT,v_trade_system_use_fee);
    lpPubMsg->SetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT,v_stock_settle_fee);
    lpPubMsg->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
    lpPubMsg->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
    lpPubMsg->SetDouble(LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT,v_strike_bond_accr_intrst);
    lpPubMsg->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
    lpPubMsg->SetString(LDBIZ_ORDER_OPER_WAY_STR,v_order_oper_way);
    lpPubMsg->SetInt32(LDBIZ_EXTER_COMM_FLAG_INT,v_exter_comm_flag);
    lpPubMsg->SetInt32(LDBIZ_RECORD_VALID_FLAG_INT,v_record_valid_flag);
    lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpPubMsg->SetString(LDBIZ_COMBO_CODE_STR,v_combo_code);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("secu.rptstrike", lpPubMsg);


    // if @指令序号# > 0 then
    if (v_comm_id > 0)
    {
        //调用过程[事务_交易证券_主推接口_获取指令混合信息]
        //组织事务请求
        if(lpTSCall1Ans5)
        {
          lpTSCall1Ans5->FreeMsg();
          lpTSCall1Ans5=NULL;
        }
        lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.3", 0);
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
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.3]subcall timed out!");
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
        v_init_date = lpTSCall1Ans5->GetInt32(LDBIZ_INIT_DATE_INT);
        v_co_no = lpTSCall1Ans5->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans5->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans5->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans5->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans5->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_out_acco, lpTSCall1Ans5->GetString(LDBIZ_OUT_ACCO_STR));
        strcpy(v_exch_crncy_type, lpTSCall1Ans5->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_stock_acco_no = lpTSCall1Ans5->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
        v_stock_code_no = lpTSCall1Ans5->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        v_stock_type = lpTSCall1Ans5->GetInt32(LDBIZ_STOCK_TYPE_INT);
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
        v_comm_appr_oper = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
        strcpy(v_comm_appr_remark, lpTSCall1Ans5->GetString(LDBIZ_COMM_APPR_REMARK_STR));
        v_basket_id = lpTSCall1Ans5->GetInt64(LDBIZ_BASKET_ID_INT64);
        v_net_price_flag = lpTSCall1Ans5->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
        v_bond_accr_intrst = lpTSCall1Ans5->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
        v_bond_rate_type = lpTSCall1Ans5->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
        strcpy(v_comm_oper_way, lpTSCall1Ans5->GetString(LDBIZ_COMM_OPER_WAY_STR));
        v_exter_comm_flag = lpTSCall1Ans5->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
        v_comm_comple_flag = lpTSCall1Ans5->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
        v_strategy_capt_qty = lpTSCall1Ans5->GetDouble(LDBIZ_STRATEGY_CAPT_QTY_FLOAT);
        v_strategy_order_qty = lpTSCall1Ans5->GetDouble(LDBIZ_STRATEGY_ORDER_QTY_FLOAT);
        strcpy(v_contra_no, lpTSCall1Ans5->GetString(LDBIZ_CONTRA_NO_STR));
        strcpy(v_comm_remark_info, lpTSCall1Ans5->GetString(LDBIZ_COMM_REMARK_INFO_STR));
        v_disp_opor = lpTSCall1Ans5->GetInt32(LDBIZ_DISP_OPOR_INT);
        v_disp_status = lpTSCall1Ans5->GetInt32(LDBIZ_DISP_STATUS_INT);
        v_read_flag = lpTSCall1Ans5->GetInt32(LDBIZ_READ_FLAG_INT);
        v_update_times = lpTSCall1Ans5->GetInt32(LDBIZ_UPDATE_TIMES_INT);
        v_sum_comm_row_id = lpTSCall1Ans5->GetInt64(LDBIZ_SUM_COMM_ROW_ID_INT64);
        v_sum_comm_co_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_CO_NO_INT);
        v_sum_comm_pd_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_PD_NO_INT);
        v_sum_comm_exch_group_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_EXCH_GROUP_NO_INT);
        v_sum_comm_asset_acco_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_ASSET_ACCO_NO_INT);
        v_sum_comm_pass_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_PASS_NO_INT);
        strcpy(v_sum_comm_out_acco, lpTSCall1Ans5->GetString(LDBIZ_SUM_COMM_OUT_ACCO_STR));
        strcpy(v_sum_comm_exch_crncy_type, lpTSCall1Ans5->GetString(LDBIZ_SUM_COMM_EXCH_CRNCY_TYPE_STR));
        v_sum_comm_stock_code_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_STOCK_CODE_NO_INT);
        v_sum_comm_date = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_DATE_INT);
        v_sum_comm_time = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_TIME_INT);
        v_sum_comm_batch_no = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_BATCH_NO_INT);
        v_sum_comm_opor = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_OPOR_INT);
        v_sum_comm_executor = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_EXECUTOR_INT);
        v_sum_comm_dir = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_DIR_INT);
        v_sum_comm_limit_price = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_COMM_LIMIT_PRICE_FLOAT);
        v_sum_comm_qty = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_COMM_QTY_FLOAT);
        v_sum_comm_amt = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_COMM_AMT_FLOAT);
        v_sum_comm_order_qty = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_COMM_ORDER_QTY_FLOAT);
        v_sum_comm_cancel_qty = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_COMM_CANCEL_QTY_FLOAT);
        v_sum_comm_await_cancel_qty = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_COMM_AWAIT_CANCEL_QTY_FLOAT);
        v_sum_comm_strike_amt = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_COMM_STRIKE_AMT_FLOAT);
        v_sum_comm_strike_qty = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_COMM_STRIKE_QTY_FLOAT);
        strcpy(v_sum_comm_strike_status, lpTSCall1Ans5->GetString(LDBIZ_SUM_COMM_STRIKE_STATUS_STR));
        strcpy(v_comm_sum_status, lpTSCall1Ans5->GetString(LDBIZ_COMM_SUM_STATUS_STR));
        v_sum_comm_begin_date = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_BEGIN_DATE_INT);
        v_sum_comm_end_date = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_END_DATE_INT);
        v_sum_comm_begin_time = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_BEGIN_TIME_INT);
        v_sum_comm_end_time = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_END_TIME_INT);
        v_sum_comm_comple_date = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_COMPLE_DATE_INT);
        v_sum_comm_comple_time = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_COMPLE_TIME_INT);
        v_sum_comm_max_comm_comple_date = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_DATE_INT);
        v_sum_comm_max_comm_comple_time = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_TIME_INT);
        v_sum_comm_appr_date = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_APPR_DATE_INT);
        v_sum_comm_appr_time = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_APPR_TIME_INT);
        v_sum_comm_appr_qty = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_COMM_APPR_QTY_FLOAT);
        strcpy(v_comm_sum_approve_status, lpTSCall1Ans5->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
        v_sum_comm_basket_id = lpTSCall1Ans5->GetInt64(LDBIZ_SUM_COMM_BASKET_ID_INT64);
        v_sum_comm_net_price_flag = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_NET_PRICE_FLAG_INT);
        v_sum_comm_bond_accr_intrst = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_COMM_BOND_ACCR_INTRST_FLOAT);
        v_sum_comm_bond_rate_type = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_BOND_RATE_TYPE_INT);
        strcpy(v_sum_comm_oper_way, lpTSCall1Ans5->GetString(LDBIZ_SUM_COMM_OPER_WAY_STR));
        v_sum_comm_exter_comm_flag = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_EXTER_COMM_FLAG_INT);
        v_sum_buy_order_qty = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_BUY_ORDER_QTY_FLOAT);
        v_sum_sell_order_qty = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_SELL_ORDER_QTY_FLOAT);
        v_sum_buy_comm_qty = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_BUY_COMM_QTY_FLOAT);
        v_sum_sell_comm_qty = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_SELL_COMM_QTY_FLOAT);
        v_sum_buy_strike_qty = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_BUY_STRIKE_QTY_FLOAT);
        v_sum_sell_strike_qty = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_SELL_STRIKE_QTY_FLOAT);
        v_sum_buy_strike_amt = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_BUY_STRIKE_AMT_FLOAT);
        v_sum_sell_strike_amt = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_SELL_STRIKE_AMT_FLOAT);
        v_sum_buy_comm_amt = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_BUY_COMM_AMT_FLOAT);
        v_sum_sell_comm_amt = lpTSCall1Ans5->GetDouble(LDBIZ_SUM_SELL_COMM_AMT_FLOAT);
        strcpy(v_sum_comm_remark_info, lpTSCall1Ans5->GetString(LDBIZ_SUM_COMM_REMARK_INFO_STR));
        v_sum_comm_update_times = lpTSCall1Ans5->GetInt32(LDBIZ_SUM_COMM_UPDATE_TIMES_INT);
        strcpy(v_acco_concat_info, lpTSCall1Ans5->GetString(LDBIZ_ACCO_CONCAT_INFO_STR));
        strcpy(v_combo_code, lpTSCall1Ans5->GetString(LDBIZ_COMBO_CODE_STR));


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

    //订单及订单汇总的主推

    // if @订单序号# > 0 then
    if (v_order_id > 0)
    {
        //调用过程[事务_交易证券_主推接口_获取订单信息]
        //组织事务请求
        if(lpTSCall1Ans6)
        {
          lpTSCall1Ans6->FreeMsg();
          lpTSCall1Ans6=NULL;
        }
        lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.45", 0);
        lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req6->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
        glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
        if(!lpTSCall1Ans6)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.45]subcall timed out!");
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
        v_busi_opor_no = lpTSCall1Ans6->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
        v_pd_no = lpTSCall1Ans6->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans6->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans6->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_out_acco, lpTSCall1Ans6->GetString(LDBIZ_OUT_ACCO_STR));
        strcpy(v_exch_crncy_type, lpTSCall1Ans6->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans6->GetInt32(LDBIZ_EXCH_NO_INT);
        v_stock_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
        strcpy(v_stock_acco, lpTSCall1Ans6->GetString(LDBIZ_STOCK_ACCO_STR));
        v_stock_code_no = lpTSCall1Ans6->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        strcpy(v_stock_code, lpTSCall1Ans6->GetString(LDBIZ_STOCK_CODE_STR));
        v_trade_code_no = lpTSCall1Ans6->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
        v_target_code_no = lpTSCall1Ans6->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
        v_stock_type = lpTSCall1Ans6->GetInt32(LDBIZ_STOCK_TYPE_INT);
        v_asset_type = lpTSCall1Ans6->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_external_no = lpTSCall1Ans6->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
        v_comm_id = lpTSCall1Ans6->GetInt64(LDBIZ_COMM_ID_INT64);
        v_comm_batch_no = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
        v_comm_opor = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_OPOR_INT);
        v_report_date = lpTSCall1Ans6->GetInt32(LDBIZ_REPORT_DATE_INT);
        v_report_time = lpTSCall1Ans6->GetInt32(LDBIZ_REPORT_TIME_INT);
        strcpy(v_report_no, lpTSCall1Ans6->GetString(LDBIZ_REPORT_NO_STR));
        v_order_date = lpTSCall1Ans6->GetInt32(LDBIZ_ORDER_DATE_INT);
        v_order_time = lpTSCall1Ans6->GetInt32(LDBIZ_ORDER_TIME_INT);
        v_order_batch_no = lpTSCall1Ans6->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
        v_order_dir = lpTSCall1Ans6->GetInt32(LDBIZ_ORDER_DIR_INT);
        v_price_type = lpTSCall1Ans6->GetInt32(LDBIZ_PRICE_TYPE_INT);
        v_order_price = lpTSCall1Ans6->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans6->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        strcpy(v_order_status, lpTSCall1Ans6->GetString(LDBIZ_ORDER_STATUS_STR));
        v_wtdraw_qty = lpTSCall1Ans6->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans6->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_strike_qty = lpTSCall1Ans6->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_all_fee = lpTSCall1Ans6->GetDouble(LDBIZ_ALL_FEE_FLOAT);
        v_stamp_tax = lpTSCall1Ans6->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
        v_trans_fee = lpTSCall1Ans6->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
        v_brkage_fee = lpTSCall1Ans6->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
        v_SEC_charges = lpTSCall1Ans6->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
        v_other_fee = lpTSCall1Ans6->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
        v_trade_commis = lpTSCall1Ans6->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_other_commis = lpTSCall1Ans6->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_trade_tax = lpTSCall1Ans6->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
        v_trade_cost_fee = lpTSCall1Ans6->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
        v_trade_system_use_fee = lpTSCall1Ans6->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
        v_stock_settle_fee = lpTSCall1Ans6->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);
        v_net_price_flag = lpTSCall1Ans6->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
        v_intrst_days = lpTSCall1Ans6->GetInt32(LDBIZ_INTRST_DAYS_INT);
        v_par_value = lpTSCall1Ans6->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
        v_bond_accr_intrst = lpTSCall1Ans6->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
        v_bond_rate_type = lpTSCall1Ans6->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
        v_strike_bond_accr_intrst = lpTSCall1Ans6->GetDouble(LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
        v_impawn_ratio = lpTSCall1Ans6->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
        v_order_frozen_amt = lpTSCall1Ans6->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
        v_order_frozen_qty = lpTSCall1Ans6->GetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT);
        strcpy(v_rsp_info, lpTSCall1Ans6->GetString(LDBIZ_RSP_INFO_STR));
        v_compli_trig_id = lpTSCall1Ans6->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);
        strcpy(v_remark_info, lpTSCall1Ans6->GetString(LDBIZ_REMARK_INFO_STR));
        v_cost_calc_type = lpTSCall1Ans6->GetInt32(LDBIZ_COST_CALC_TYPE_INT);
        strcpy(v_order_oper_way, lpTSCall1Ans6->GetString(LDBIZ_ORDER_OPER_WAY_STR));
        v_exter_comm_flag = lpTSCall1Ans6->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
        v_record_valid_flag = lpTSCall1Ans6->GetInt32(LDBIZ_RECORD_VALID_FLAG_INT);
        strcpy(v_combo_code, lpTSCall1Ans6->GetString(LDBIZ_COMBO_CODE_STR));
        v_combo_posi_id = lpTSCall1Ans6->GetInt64(LDBIZ_COMBO_POSI_ID_INT64);
        v_strategy_id = lpTSCall1Ans6->GetInt64(LDBIZ_STRATEGY_ID_INT64);
        v_asset_acco_type = lpTSCall1Ans6->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);
        strcpy(v_contra_no, lpTSCall1Ans6->GetString(LDBIZ_CONTRA_NO_STR));
        v_update_times = lpTSCall1Ans6->GetInt32(LDBIZ_UPDATE_TIMES_INT);


        // set @操作员编号# = @业务操作员编号#;
        v_opor_no = v_busi_opor_no;

        // set @当笔成交价格#=0;
        v_curr_strike_price=0;

        // set @当笔成交金额#=0;
        v_curr_strike_amt=0;

        // set @当笔成交数量#=0;
        v_curr_strike_qty=0;

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


        // if @订单批号# > 0 then
        if (v_order_batch_no > 0)
        {
            //调用过程[事务_交易证券_主推接口_获取订单汇总信息]
            //组织事务请求
            if(lpTSCall1Ans7)
            {
              lpTSCall1Ans7->FreeMsg();
              lpTSCall1Ans7=NULL;
            }
            lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.47", 0);
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
            lpTSCall1Req7->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
            glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
            if(!lpTSCall1Ans7)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.47]subcall timed out!");
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


      // set @回购成交序号# = @成交序号#;
      v_repo_strike_id = v_strike_id;
      //调用过程[事务_交易证券_主推接口_获取债券回购信息]
      //组织事务请求
      if(lpTSCall1Ans10)
      {
        lpTSCall1Ans10->FreeMsg();
        lpTSCall1Ans10=NULL;
      }
      lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.30", 0);
      lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
      lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
      lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
      lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
      lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
      lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
      lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
      lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
      lpTSCall1Req10->SetInt64(LDBIZ_REPO_STRIKE_ID_INT64,v_repo_strike_id);
      glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
      if(!lpTSCall1Ans10)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.30]subcall timed out!");
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
      v_init_date = lpTSCall1Ans10->GetInt32(LDBIZ_INIT_DATE_INT);
      v_co_no = lpTSCall1Ans10->GetInt32(LDBIZ_CO_NO_INT);
      v_pd_no = lpTSCall1Ans10->GetInt32(LDBIZ_PD_NO_INT);
      v_exch_group_no = lpTSCall1Ans10->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
      v_asset_acco_no = lpTSCall1Ans10->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
      strcpy(v_crncy_type, lpTSCall1Ans10->GetString(LDBIZ_CRNCY_TYPE_STR));
      strcpy(v_exch_crncy_type, lpTSCall1Ans10->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
      v_exch_rate = lpTSCall1Ans10->GetDouble(LDBIZ_EXCH_RATE_FLOAT);
      v_exch_no = lpTSCall1Ans10->GetInt32(LDBIZ_EXCH_NO_INT);
      v_stock_acco_no = lpTSCall1Ans10->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
      v_stock_code_no = lpTSCall1Ans10->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
      v_target_code_no = lpTSCall1Ans10->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
      v_comm_id = lpTSCall1Ans10->GetInt64(LDBIZ_COMM_ID_INT64);
      v_order_dir = lpTSCall1Ans10->GetInt32(LDBIZ_ORDER_DIR_INT);
      v_repo_qty = lpTSCall1Ans10->GetDouble(LDBIZ_REPO_QTY_FLOAT);
      v_repo_amt = lpTSCall1Ans10->GetDouble(LDBIZ_REPO_AMT_FLOAT);
      v_repo_rate = lpTSCall1Ans10->GetDouble(LDBIZ_REPO_RATE_FLOAT);
      v_repo_trade_date = lpTSCall1Ans10->GetInt32(LDBIZ_REPO_TRADE_DATE_INT);
      v_repo_order_id = lpTSCall1Ans10->GetInt64(LDBIZ_REPO_ORDER_ID_INT64);
      v_repo_days = lpTSCall1Ans10->GetInt32(LDBIZ_REPO_DAYS_INT);
      v_repo_cale_days = lpTSCall1Ans10->GetInt32(LDBIZ_REPO_CALE_DAYS_INT);
      v_repo_back_date = lpTSCall1Ans10->GetInt32(LDBIZ_REPO_BACK_DATE_INT);
      v_repo_back_amt = lpTSCall1Ans10->GetDouble(LDBIZ_REPO_BACK_AMT_FLOAT);
      v_repo_back_intrst = lpTSCall1Ans10->GetDouble(LDBIZ_REPO_BACK_INTRST_FLOAT);
      v_repo_back_trade_date = lpTSCall1Ans10->GetInt32(LDBIZ_REPO_BACK_TRADE_DATE_INT);
      strcpy(v_repo_status, lpTSCall1Ans10->GetString(LDBIZ_REPO_STATUS_STR));
      v_bond_repo_id = lpTSCall1Ans10->GetInt64(LDBIZ_BOND_REPO_ID_INT64);
      v_update_times = lpTSCall1Ans10->GetInt32(LDBIZ_UPDATE_TIMES_INT);


      // [主动推送][secu.exgpbondrepo][证券主推_持仓_交易组债券回购主推消息]
      lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.82", 0);
      lpPubMsg->SetInt64(LDBIZ_BOND_REPO_ID_INT64,v_bond_repo_id);
      lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
      lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
      lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
      lpPubMsg->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
      lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      lpPubMsg->SetDouble(LDBIZ_EXCH_RATE_FLOAT,v_exch_rate);
      lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
      lpPubMsg->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
      lpPubMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
      lpPubMsg->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
      lpPubMsg->SetDouble(LDBIZ_REPO_QTY_FLOAT,v_repo_qty);
      lpPubMsg->SetDouble(LDBIZ_REPO_AMT_FLOAT,v_repo_amt);
      lpPubMsg->SetDouble(LDBIZ_REPO_RATE_FLOAT,v_repo_rate);
      lpPubMsg->SetInt32(LDBIZ_REPO_TRADE_DATE_INT,v_repo_trade_date);
      lpPubMsg->SetInt64(LDBIZ_REPO_ORDER_ID_INT64,v_repo_order_id);
      lpPubMsg->SetInt64(LDBIZ_REPO_STRIKE_ID_INT64,v_repo_strike_id);
      lpPubMsg->SetInt32(LDBIZ_REPO_DAYS_INT,v_repo_days);
      lpPubMsg->SetInt32(LDBIZ_REPO_CALE_DAYS_INT,v_repo_cale_days);
      lpPubMsg->SetInt32(LDBIZ_REPO_BACK_DATE_INT,v_repo_back_date);
      lpPubMsg->SetDouble(LDBIZ_REPO_BACK_AMT_FLOAT,v_repo_back_amt);
      lpPubMsg->SetDouble(LDBIZ_REPO_BACK_INTRST_FLOAT,v_repo_back_intrst);
      lpPubMsg->SetInt32(LDBIZ_REPO_BACK_TRADE_DATE_INT,v_repo_back_trade_date);
      lpPubMsg->SetString(LDBIZ_REPO_STATUS_STR,v_repo_status);
      lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
      glpPubSub_Interface->PubTopics("secu.exgpbondrepo", lpPubMsg);

    }
    // else
    else
    {

      //调用过程[事务_交易证券_主推接口_获取资金持仓信息]
      //组织事务请求
      if(lpTSCall1Ans11)
      {
        lpTSCall1Ans11->FreeMsg();
        lpTSCall1Ans11=NULL;
      }
      lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.13", 0);
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
      lpTSCall1Req11->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpTSCall1Req11->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
      lpTSCall1Req11->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
      if(!lpTSCall1Ans11)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.13]subcall timed out!");
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
      v_exgp_cash_id = lpTSCall1Ans11->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
      v_exgp_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
      v_exgp_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
      v_exgp_comm_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
      v_exgp_comm_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
      v_exgp_comm_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
      v_exgp_comm_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
      v_exgp_trade_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT);
      v_exgp_trade_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT);
      v_exgp_trade_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
      v_exgp_trade_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
      v_exgp_strike_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
      v_exgp_strike_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
      v_exgp_cash_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
      v_exgp_posi_id = lpTSCall1Ans11->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
      v_exgp_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
      v_exgp_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
      v_exgp_comm_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT);
      v_exgp_comm_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT);
      v_exgp_comm_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT);
      v_exgp_comm_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
      v_exgp_trade_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT);
      v_exgp_trade_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT);
      v_exgp_trade_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT);
      v_exgp_trade_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
      v_exgp_strike_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT);
      v_exgp_strike_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
      v_exgp_strike_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT);
      v_exgp_strike_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT);
      v_exgp_realize_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
      v_exgp_cost_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
      v_exgp_intrst_cost_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
      v_exgp_intrst_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
      v_exgp_posi_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
      v_asac_cash_id = lpTSCall1Ans11->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
      v_asac_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
      v_asac_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
      v_asac_comm_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
      v_asac_comm_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
      v_asac_comm_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
      v_asac_comm_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
      v_asac_trade_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT);
      v_asac_trade_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT);
      v_asac_trade_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
      v_asac_trade_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
      v_asac_strike_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
      v_asac_strike_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
      v_asac_cash_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);
      v_asac_posi_id = lpTSCall1Ans11->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
      v_asac_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
      v_asac_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
      v_asac_comm_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT);
      v_asac_comm_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT);
      v_asac_comm_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT);
      v_asac_comm_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
      v_asac_trade_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT);
      v_asac_trade_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT);
      v_asac_trade_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT);
      v_asac_trade_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
      v_asac_strike_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT);
      v_asac_strike_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
      v_asac_strike_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT);
      v_asac_strike_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT);
      v_asac_realize_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
      v_asac_cost_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
      v_asac_intrst_cost_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
      v_asac_intrst_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
      v_asac_posi_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


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

//逻辑_交易证券_交易运维_查询所有交易组持仓
int LD_CALL_MODE fnFunc26(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    char v_stock_code_no_str[4097];
    char v_stock_type_str[2049];
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
    int v_exch_no;
    int v_stock_code_no;
    double v_begin_qty;
    double v_curr_qty;
    double v_frozen_qty;
    double v_unfroz_qty;
    double v_comm_frozen_qty;
    double v_comm_unfroz_qty;
    double v_comm_capt_qty;
    double v_comm_releas_qty;
    double v_trade_frozen_qty;
    double v_trade_unfroz_qty;
    double v_trade_capt_qty;
    double v_trade_releas_qty;
    double v_strike_capt_qty;
    double v_strike_releas_qty;
    double v_strike_frozen_qty;
    double v_strike_unfroz_qty;
    double v_cost_amt;
    double v_intrst_cost_amt;
    int v_update_times;
    double v_realize_pandl;
    double v_intrst_pandl;
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
    strcpy(v_exch_no_str, " ");
    v_stock_acco_no=0;
    strcpy(v_stock_code_no_str, " ");
    strcpy(v_stock_type_str, " ");
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
    v_exch_no=0;
    v_stock_code_no=0;
    v_begin_qty=0;
    v_curr_qty=0;
    v_frozen_qty=0;
    v_unfroz_qty=0;
    v_comm_frozen_qty=0;
    v_comm_unfroz_qty=0;
    v_comm_capt_qty=0;
    v_comm_releas_qty=0;
    v_trade_frozen_qty=0;
    v_trade_unfroz_qty=0;
    v_trade_capt_qty=0;
    v_trade_releas_qty=0;
    v_strike_capt_qty=0;
    v_strike_releas_qty=0;
    v_strike_frozen_qty=0;
    v_strike_unfroz_qty=0;
    v_cost_amt=0;
    v_intrst_cost_amt=0;
    v_update_times=1;
    v_realize_pandl=0;
    v_intrst_pandl=0;
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
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strncpy(v_stock_code_no_str, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_NO_STR_STR),4096);
    v_stock_code_no_str[4096] = '\0';
    strncpy(v_stock_type_str, lpInBizMsg->GetString(LDBIZ_STOCK_TYPE_STR_STR),2048);
    v_stock_type_str[2048] = '\0';
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

    //set @业务控制串// = "001";
    //[事务_公共_公共接口_检查系统状态查询权限身份获取操作员权限串]

    // if @操作员机构编号# != 9999 then
    if (v_opor_co_no != 9999)
    {
    //set @机构编号// = @操作员机构编号//;
    // end if;
    }

    //调用过程[事务_交易证券_交易运维_查询所有交易组持仓]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.72", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_NO_STR_STR,v_stock_code_no_str);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.72]subcall timed out!");
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

//逻辑_交易证券_交易运维_错单修改撤单回退
int LD_CALL_MODE fnFunc27(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    char v_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_tmp_opor_no;
    int v_tmp_opor_co_no;
    int v_co_no;
    int v_busi_opor_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    char v_exch_crncy_type[4];
    int v_exch_no;
    int v_stock_acco_no;
    char v_stock_acco[17];
    int v_stock_code_no;
    char v_stock_code[7];
    int v_trade_code_no;
    int v_target_code_no;
    int v_stock_type;
    int v_asset_type;
    int64 v_external_no;
    int64 v_comm_id;
    int v_comm_batch_no;
    int v_comm_opor;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_batch_no;
    int v_order_dir;
    int v_price_type;
    double v_order_price;
    double v_order_qty;
    char v_order_status[3];
    double v_wtdraw_qty;
    double v_strike_amt;
    double v_strike_qty;
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
    int v_net_price_flag;
    int v_intrst_days;
    double v_par_value;
    double v_bond_accr_intrst;
    int v_bond_rate_type;
    double v_strike_bond_accr_intrst;
    double v_impawn_ratio;
    double v_order_frozen_amt;
    double v_order_frozen_qty;
    char v_rsp_info[256];
    int64 v_compli_trig_id;
    int v_cost_calc_type;
    char v_order_oper_way[3];
    int v_exter_comm_flag;
    int v_record_valid_flag;
    char v_combo_code[33];
    int64 v_combo_posi_id;
    int64 v_strategy_id;
    int v_asset_acco_type;
    char v_contra_no[33];
    int v_update_times;
    char v_sys_config_str[65];
    char v_exgp_busi_config_str[65];
    char v_crncy_type[4];
    double v_buy_ref_rate;
    double v_sell_ref_rate;
    char v_target_code[7];
    int v_target_code_stock_type;
    int v_target_code_asset_type;
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
    double v_exgp_cost_amt;
    double v_exgp_intrst_cost_amt;
    double v_exgp_curr_qty;
    double v_asac_cost_amt;
    double v_asac_intrst_cost_amt;
    double v_asac_curr_qty;
    int64 v_strike_id;
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
    double v_curr_strike_price;
    double v_curr_strike_amt;
    double v_curr_strike_qty;
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
    int64 v_wtdraw_id;
    int v_wtdraw_batch_no;
    int v_wtdraw_date;
    int v_wtdraw_time;
    char v_wtdraw_status[3];
    char v_wtdraw_remark[256];
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
    strcpy(v_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_tmp_opor_no=0;
    v_tmp_opor_co_no=0;
    v_co_no=0;
    v_busi_opor_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_exch_crncy_type, "CNY");
    v_exch_no=0;
    v_stock_acco_no=0;
    strcpy(v_stock_acco, " ");
    v_stock_code_no=0;
    strcpy(v_stock_code, " ");
    v_trade_code_no=0;
    v_target_code_no=0;
    v_stock_type=0;
    v_asset_type=0;
    v_external_no=0;
    v_comm_id=0;
    v_comm_batch_no=0;
    v_comm_opor=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_batch_no=0;
    v_order_dir=0;
    v_price_type=0;
    v_order_price=0;
    v_order_qty=0;
    strcpy(v_order_status, "0");
    v_wtdraw_qty=0;
    v_strike_amt=0;
    v_strike_qty=0;
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
    v_net_price_flag=0;
    v_intrst_days=0;
    v_par_value=0;
    v_bond_accr_intrst=0;
    v_bond_rate_type=0;
    v_strike_bond_accr_intrst=0;
    v_impawn_ratio=0;
    v_order_frozen_amt=0;
    v_order_frozen_qty=0;
    strcpy(v_rsp_info, " ");
    v_compli_trig_id=0;
    v_cost_calc_type=0;
    strcpy(v_order_oper_way, " ");
    v_exter_comm_flag=0;
    v_record_valid_flag=0;
    strcpy(v_combo_code, " ");
    v_combo_posi_id=0;
    v_strategy_id=0;
    v_asset_acco_type=0;
    strcpy(v_contra_no, " ");
    v_update_times=1;
    strcpy(v_sys_config_str, " ");
    strcpy(v_exgp_busi_config_str, " ");
    strcpy(v_crncy_type, "CNY");
    v_buy_ref_rate=0;
    v_sell_ref_rate=0;
    strcpy(v_target_code, " ");
    v_target_code_stock_type=0;
    v_target_code_asset_type=0;
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
    v_exgp_cost_amt=0;
    v_exgp_intrst_cost_amt=0;
    v_exgp_curr_qty=0;
    v_asac_cost_amt=0;
    v_asac_intrst_cost_amt=0;
    v_asac_curr_qty=0;
    v_strike_id=0;
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
    v_curr_strike_price=0;
    v_curr_strike_amt=0;
    v_curr_strike_qty=0;
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
    v_wtdraw_id=0;
    v_wtdraw_batch_no=0;
    v_wtdraw_date=0;
    v_wtdraw_time=0;
    strcpy(v_wtdraw_status, "0");
    strcpy(v_wtdraw_remark, " ");
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


    // set @临时_操作员编号# = @操作员编号#;
    v_tmp_opor_no = v_opor_no;

    // set @临时_操作员机构编号# = @操作员机构编号#;
    v_tmp_opor_co_no = v_opor_co_no;
    //调用过程[事务_交易证券_主推接口_获取订单信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.45", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.45]subcall timed out!");
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
    v_busi_opor_no = lpTSCall1Ans1->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans1->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans1->GetString(LDBIZ_OUT_ACCO_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans1->GetString(LDBIZ_STOCK_ACCO_STR));
    v_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strcpy(v_stock_code, lpTSCall1Ans1->GetString(LDBIZ_STOCK_CODE_STR));
    v_trade_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
    v_target_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
    v_stock_type = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_external_no = lpTSCall1Ans1->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_comm_id = lpTSCall1Ans1->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_opor = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_report_date = lpTSCall1Ans1->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpTSCall1Ans1->GetInt32(LDBIZ_REPORT_TIME_INT);
    strcpy(v_report_no, lpTSCall1Ans1->GetString(LDBIZ_REPORT_NO_STR));
    v_order_date = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_order_time = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_order_batch_no = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_order_dir = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_price_type = lpTSCall1Ans1->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_order_price = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    strcpy(v_order_status, lpTSCall1Ans1->GetString(LDBIZ_ORDER_STATUS_STR));
    v_wtdraw_qty = lpTSCall1Ans1->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_qty = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_all_fee = lpTSCall1Ans1->GetDouble(LDBIZ_ALL_FEE_FLOAT);
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
    v_net_price_flag = lpTSCall1Ans1->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
    v_intrst_days = lpTSCall1Ans1->GetInt32(LDBIZ_INTRST_DAYS_INT);
    v_par_value = lpTSCall1Ans1->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
    v_bond_accr_intrst = lpTSCall1Ans1->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
    v_bond_rate_type = lpTSCall1Ans1->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
    v_strike_bond_accr_intrst = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
    v_impawn_ratio = lpTSCall1Ans1->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
    v_order_frozen_amt = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
    v_order_frozen_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT);
    strcpy(v_rsp_info, lpTSCall1Ans1->GetString(LDBIZ_RSP_INFO_STR));
    v_compli_trig_id = lpTSCall1Ans1->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);
    strcpy(v_remark_info, lpTSCall1Ans1->GetString(LDBIZ_REMARK_INFO_STR));
    v_cost_calc_type = lpTSCall1Ans1->GetInt32(LDBIZ_COST_CALC_TYPE_INT);
    strcpy(v_order_oper_way, lpTSCall1Ans1->GetString(LDBIZ_ORDER_OPER_WAY_STR));
    v_exter_comm_flag = lpTSCall1Ans1->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_record_valid_flag = lpTSCall1Ans1->GetInt32(LDBIZ_RECORD_VALID_FLAG_INT);
    strcpy(v_combo_code, lpTSCall1Ans1->GetString(LDBIZ_COMBO_CODE_STR));
    v_combo_posi_id = lpTSCall1Ans1->GetInt64(LDBIZ_COMBO_POSI_ID_INT64);
    v_strategy_id = lpTSCall1Ans1->GetInt64(LDBIZ_STRATEGY_ID_INT64);
    v_asset_acco_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);
    strcpy(v_contra_no, lpTSCall1Ans1->GetString(LDBIZ_CONTRA_NO_STR));
    v_update_times = lpTSCall1Ans1->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // [检查报错返回][@订单状态# <>《订单状态-已撤》 and @订单状态# <>  《订单状态-部撤》][1]["该订单状态不支持撤单回退！"]
    if (strcmp(v_order_status ,"4")!=0 && strcmp(v_order_status ,  "7")!=0)
    {
        strcpy(v_error_code, "tdsecuL.10.74.1");
        snprintf(v_error_info, sizeof(v_error_info), "该订单状态不支持撤单回退！");
        iRet = -1;
        goto END;
    }


    // [检查报错返回][@订单操作方式# = 《订单操作方式-增强交易》 or @订单操作方式# = 《订单操作方式-增强交易平仓》 or @订单操作方式# = 《订单操作方式-金纳算法交易》 or @订单操作方式# = 《订单操作方式-多账户算法交易》 or @订单操作方式# = 《订单操作方式-港股通算法交易》 or @订单操作方式# = 《订单操作方式-指令算法交易》 or @订单操作方式# = 《订单操作方式-调仓算法交易》  or @订单操作方式# = 《订单操作方式-调仓指令算法交易》 or @订单操作方式# = 《订单操作方式-组合买入》  or @订单操作方式# = 《订单操作方式-组合卖出》  or @订单操作方式# = 《订单操作方式-组合调仓》 or @订单操作方式# = 《订单操作方式-篮子买入算法交易》 or @订单操作方式# = 《订单操作方式-篮子卖出算法交易》 or @订单操作方式# = 《订单操作方式-预埋单交易》 or @订单操作方式# = 《订单操作方式-体外指令》][624][@订单操作方式#]
    if (strcmp(v_order_oper_way , "14")==0 || strcmp(v_order_oper_way , "51")==0 || strcmp(v_order_oper_way , "61")==0 || strcmp(v_order_oper_way , "62")==0 || strcmp(v_order_oper_way , "63")==0 || strcmp(v_order_oper_way , "65")==0 || strcmp(v_order_oper_way , "66")==0  || strcmp(v_order_oper_way , "67")==0 || strcmp(v_order_oper_way , "26")==0  || strcmp(v_order_oper_way , "27")==0  || strcmp(v_order_oper_way , "28")==0 || strcmp(v_order_oper_way , "79")==0 || strcmp(v_order_oper_way , "80")==0 || strcmp(v_order_oper_way , "34")==0 || strcmp(v_order_oper_way , "41")==0)
    {
        strcpy(v_error_code, "tdsecuL.10.74.624");
        snprintf(v_error_info, sizeof(v_error_info), "%s%s","订单操作方式=",v_order_oper_way);
        iRet = -1;
        goto END;
    }


    // [检查报错返回][@记录有效标志# = 《记录有效标志-无效》][761][@记录有效标志#]
    if (v_record_valid_flag == 2)
    {
        strcpy(v_error_code, "tdsecuL.10.74.761");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d","记录有效标志=",v_record_valid_flag);
        iRet = -1;
        goto END;
    }


    // set @价格类型# = 《价格类型-限价》;
    v_price_type = 1;
    //公共子系统检查
    //[事务_公共_交易接口_检查系统状态交易业务]

    // set @操作员编号#= @业务操作员编号#;
    v_opor_no= v_busi_opor_no;

    // set @操作员机构编号# = @机构编号#;
    v_opor_co_no = v_co_no;
    //调用过程[事务_公共_交易接口_检查交易市场状态权限身份无密码]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.25.235", 0);
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
    lpTSCall1Req2->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req2->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req2->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req2->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.235]subcall timed out!");
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
    strcpy(v_sys_config_str, lpTSCall1Ans2->GetString(LDBIZ_SYS_CONFIG_STR_STR));
    v_pd_no = lpTSCall1Ans2->GetInt32(LDBIZ_PD_NO_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans2->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));
    strcpy(v_exgp_busi_config_str, lpTSCall1Ans2->GetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR));
    v_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_stock_type = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_CRNCY_TYPE_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_buy_ref_rate = lpTSCall1Ans2->GetDouble(LDBIZ_BUY_REF_RATE_FLOAT);
    v_sell_ref_rate = lpTSCall1Ans2->GetDouble(LDBIZ_SELL_REF_RATE_FLOAT);
    v_par_value = lpTSCall1Ans2->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
    v_impawn_ratio = lpTSCall1Ans2->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
    v_net_price_flag = lpTSCall1Ans2->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
    v_intrst_days = lpTSCall1Ans2->GetInt32(LDBIZ_INTRST_DAYS_INT);
    v_bond_rate_type = lpTSCall1Ans2->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
    v_bond_accr_intrst = lpTSCall1Ans2->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
    v_target_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
    strcpy(v_target_code, lpTSCall1Ans2->GetString(LDBIZ_TARGET_CODE_STR));
    v_target_code_stock_type = lpTSCall1Ans2->GetInt32(LDBIZ_TARGET_CODE_STOCK_TYPE_INT);
    v_target_code_asset_type = lpTSCall1Ans2->GetInt32(LDBIZ_TARGET_CODE_ASSET_TYPE_INT);
    v_trade_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
    strcpy(v_trade_code, lpTSCall1Ans2->GetString(LDBIZ_TRADE_CODE_STR));
    v_trade_code_stock_type = lpTSCall1Ans2->GetInt32(LDBIZ_TRADE_CODE_STOCK_TYPE_INT);
    v_trade_code_asset_type = lpTSCall1Ans2->GetInt32(LDBIZ_TRADE_CODE_ASSET_TYPE_INT);
    v_min_unit = lpTSCall1Ans2->GetInt32(LDBIZ_MIN_UNIT_INT);
    v_up_limit_price = lpTSCall1Ans2->GetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT);
    v_down_limit_price = lpTSCall1Ans2->GetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
    v_last_price = lpTSCall1Ans2->GetDouble(LDBIZ_LAST_PRICE_FLOAT);
    v_capit_reback_days = lpTSCall1Ans2->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans2->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    v_apply_date = lpTSCall1Ans2->GetInt32(LDBIZ_APPLY_DATE_INT);
    v_subscription_trade_mark = lpTSCall1Ans2->GetInt32(LDBIZ_SUBSCRIPTION_TRADE_MARK_INT);
    v_purchase_trade_mark = lpTSCall1Ans2->GetInt32(LDBIZ_PURCHASE_TRADE_MARK_INT);
    v_rede_trade_mark = lpTSCall1Ans2->GetInt32(LDBIZ_REDE_TRADE_MARK_INT);
    v_first_minimum_amt = lpTSCall1Ans2->GetDouble(LDBIZ_FIRST_MINIMUM_AMT_FLOAT);
    v_minimum_purchase_amt = lpTSCall1Ans2->GetDouble(LDBIZ_MINIMUM_PURCHASE_AMT_FLOAT);
    v_minimum_subscription_amt = lpTSCall1Ans2->GetDouble(LDBIZ_MINIMUM_SUBSCRIPTION_AMT_FLOAT);
    v_minimum_rede_share = lpTSCall1Ans2->GetDouble(LDBIZ_MINIMUM_REDE_SHARE_FLOAT);
    v_minimum_holding_share = lpTSCall1Ans2->GetDouble(LDBIZ_MINIMUM_HOLDING_SHARE_FLOAT);
    strcpy(v_trade_acco, lpTSCall1Ans2->GetString(LDBIZ_TRADE_ACCO_STR));


    // set @业务控制配置串# = @交易组业务控制配置串#;
    strcpy(v_busi_config_str,v_exgp_busi_config_str);

    // set @操作员编号#= @临时_操作员编号#;
    v_opor_no= v_tmp_opor_no;

    // set @业务控制串# = "11111";
    strcpy(v_busi_ctrl_str,"11111");
    //调用过程[事务_产品_交易接口_检查交易产品账户信息]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("prodT.8.21", 0);
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
    lpTSCall1Req3->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req3->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req3->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req3->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req3->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    lpTSCall1Req3->SetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT,v_up_limit_price);
    lpTSCall1Req3->SetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT,v_down_limit_price);
    lpTSCall1Req3->SetDouble(LDBIZ_LAST_PRICE_FLOAT,v_last_price);
    lpTSCall1Req3->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
    lpTSCall1Req3->SetString(LDBIZ_BUSI_CONFIG_STR_STR,v_busi_config_str);
    lpTSCall1Req3->SetString(LDBIZ_SYS_CONFIG_STR_STR,v_sys_config_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.8.21]subcall timed out!");
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
    v_exter_comm_flag = lpTSCall1Ans3->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_market_price_ratio = lpTSCall1Ans3->GetDouble(LDBIZ_MARKET_PRICE_RATIO_FLOAT);
    v_market_price_type = lpTSCall1Ans3->GetInt32(LDBIZ_MARKET_PRICE_TYPE_INT);
    v_cost_calc_type = lpTSCall1Ans3->GetInt32(LDBIZ_COST_CALC_TYPE_INT);
    v_order_market_price = lpTSCall1Ans3->GetDouble(LDBIZ_ORDER_MARKET_PRICE_FLOAT);
    v_sys_type = lpTSCall1Ans3->GetInt32(LDBIZ_SYS_TYPE_INT);
    strcpy(v_opor_no_str1, lpTSCall1Ans3->GetString(LDBIZ_OPOR_NO_STR1_STR));
    strcpy(v_opor_no_str2, lpTSCall1Ans3->GetString(LDBIZ_OPOR_NO_STR2_STR));
    strcpy(v_opor_no_str3, lpTSCall1Ans3->GetString(LDBIZ_OPOR_NO_STR3_STR));
    v_fina_limit_max = lpTSCall1Ans3->GetDouble(LDBIZ_FINA_LIMIT_MAX_FLOAT);
    v_loan_limit_max = lpTSCall1Ans3->GetDouble(LDBIZ_LOAN_LIMIT_MAX_FLOAT);
    v_asset_acco_type = lpTSCall1Ans3->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);
    v_sell_auto_back_debt = lpTSCall1Ans3->GetInt32(LDBIZ_SELL_AUTO_BACK_DEBT_INT);

    //获取股东代码
    //调用过程[事务_产品证券_交易接口_检查股东账户状态获取持仓成本]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pdsecuT.6.4", 0);
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
    lpTSCall1Req4->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req4->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.6.4]subcall timed out!");
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
    v_stock_acco_no = lpTSCall1Ans4->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans4->GetString(LDBIZ_STOCK_ACCO_STR));
    v_exgp_cost_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
    v_exgp_intrst_cost_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
    v_exgp_curr_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT);
    v_asac_cost_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
    v_asac_intrst_cost_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
    v_asac_curr_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT);

    //计算该订单的费用。

    // if @订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-融券回购》 or @订单方向# = 《订单方向-融资买入》   then
    if (v_order_dir == 1 || v_order_dir == 4 || v_order_dir == 5  )
    {
        //调用过程[事务_公共_公共接口_计算证券订单费用]
        //组织事务请求
        if(lpTSCall1Ans5)
        {
          lpTSCall1Ans5->FreeMsg();
          lpTSCall1Ans5=NULL;
        }
        lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pubT.24.203", 0);
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
        lpTSCall1Req5->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req5->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req5->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpTSCall1Req5->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpTSCall1Req5->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
        lpTSCall1Req5->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
        lpTSCall1Req5->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
        lpTSCall1Req5->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
        lpTSCall1Req5->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
        glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
        if(!lpTSCall1Ans5)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.203]subcall timed out!");
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
        v_trade_commis = lpTSCall1Ans5->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_all_fee = lpTSCall1Ans5->GetDouble(LDBIZ_ALL_FEE_FLOAT);
        v_stamp_tax = lpTSCall1Ans5->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
        v_trans_fee = lpTSCall1Ans5->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
        v_brkage_fee = lpTSCall1Ans5->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
        v_SEC_charges = lpTSCall1Ans5->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
        v_other_fee = lpTSCall1Ans5->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
        v_other_commis = lpTSCall1Ans5->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_trade_tax = lpTSCall1Ans5->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
        v_trade_cost_fee = lpTSCall1Ans5->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
        v_trade_system_use_fee = lpTSCall1Ans5->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
        v_stock_settle_fee = lpTSCall1Ans5->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);
        v_order_frozen_amt = lpTSCall1Ans5->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);

    // end if;
    }

    //调用过程[事务_交易证券_交易运维_错单修改撤单回退]
    //组织事务请求
    if(lpTSCall1Ans6)
    {
      lpTSCall1Ans6->FreeMsg();
      lpTSCall1Ans6=NULL;
    }
    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.73", 0);
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
    lpTSCall1Req6->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req6->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req6->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req6->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req6->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req6->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req6->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req6->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req6->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req6->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req6->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
    lpTSCall1Req6->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req6->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req6->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
    lpTSCall1Req6->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
    lpTSCall1Req6->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpTSCall1Req6->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req6->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpTSCall1Req6->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpTSCall1Req6->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req6->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req6->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req6->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req6->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req6->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
    lpTSCall1Req6->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
    lpTSCall1Req6->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
    lpTSCall1Req6->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
    lpTSCall1Req6->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
    lpTSCall1Req6->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
    lpTSCall1Req6->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
    lpTSCall1Req6->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
    lpTSCall1Req6->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    lpTSCall1Req6->SetString(LDBIZ_SYS_CONFIG_STR_STR,v_sys_config_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
    if(!lpTSCall1Ans6)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.73]subcall timed out!");
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
    v_strike_id = lpTSCall1Ans6->GetInt64(LDBIZ_STRIKE_ID_INT64);


    // if @指令序号# > 0 then
    if (v_comm_id > 0)
    {
        //调用过程[事务_交易证券_主推接口_获取指令混合信息]
        //组织事务请求
        if(lpTSCall1Ans7)
        {
          lpTSCall1Ans7->FreeMsg();
          lpTSCall1Ans7=NULL;
        }
        lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.3", 0);
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
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.3]subcall timed out!");
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
        v_init_date = lpTSCall1Ans7->GetInt32(LDBIZ_INIT_DATE_INT);
        v_co_no = lpTSCall1Ans7->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans7->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans7->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans7->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans7->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_out_acco, lpTSCall1Ans7->GetString(LDBIZ_OUT_ACCO_STR));
        strcpy(v_exch_crncy_type, lpTSCall1Ans7->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_stock_acco_no = lpTSCall1Ans7->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
        v_stock_code_no = lpTSCall1Ans7->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        v_stock_type = lpTSCall1Ans7->GetInt32(LDBIZ_STOCK_TYPE_INT);
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
        v_comm_appr_oper = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
        strcpy(v_comm_appr_remark, lpTSCall1Ans7->GetString(LDBIZ_COMM_APPR_REMARK_STR));
        v_basket_id = lpTSCall1Ans7->GetInt64(LDBIZ_BASKET_ID_INT64);
        v_net_price_flag = lpTSCall1Ans7->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
        v_bond_accr_intrst = lpTSCall1Ans7->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
        v_bond_rate_type = lpTSCall1Ans7->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
        strcpy(v_comm_oper_way, lpTSCall1Ans7->GetString(LDBIZ_COMM_OPER_WAY_STR));
        v_exter_comm_flag = lpTSCall1Ans7->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
        v_comm_comple_flag = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
        v_strategy_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_STRATEGY_CAPT_QTY_FLOAT);
        v_strategy_order_qty = lpTSCall1Ans7->GetDouble(LDBIZ_STRATEGY_ORDER_QTY_FLOAT);
        strcpy(v_contra_no, lpTSCall1Ans7->GetString(LDBIZ_CONTRA_NO_STR));
        strcpy(v_comm_remark_info, lpTSCall1Ans7->GetString(LDBIZ_COMM_REMARK_INFO_STR));
        v_disp_opor = lpTSCall1Ans7->GetInt32(LDBIZ_DISP_OPOR_INT);
        v_disp_status = lpTSCall1Ans7->GetInt32(LDBIZ_DISP_STATUS_INT);
        v_read_flag = lpTSCall1Ans7->GetInt32(LDBIZ_READ_FLAG_INT);
        v_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_UPDATE_TIMES_INT);
        v_sum_comm_row_id = lpTSCall1Ans7->GetInt64(LDBIZ_SUM_COMM_ROW_ID_INT64);
        v_sum_comm_co_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_CO_NO_INT);
        v_sum_comm_pd_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_PD_NO_INT);
        v_sum_comm_exch_group_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_EXCH_GROUP_NO_INT);
        v_sum_comm_asset_acco_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_ASSET_ACCO_NO_INT);
        v_sum_comm_pass_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_PASS_NO_INT);
        strcpy(v_sum_comm_out_acco, lpTSCall1Ans7->GetString(LDBIZ_SUM_COMM_OUT_ACCO_STR));
        strcpy(v_sum_comm_exch_crncy_type, lpTSCall1Ans7->GetString(LDBIZ_SUM_COMM_EXCH_CRNCY_TYPE_STR));
        v_sum_comm_stock_code_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_STOCK_CODE_NO_INT);
        v_sum_comm_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_DATE_INT);
        v_sum_comm_time = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_TIME_INT);
        v_sum_comm_batch_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_BATCH_NO_INT);
        v_sum_comm_opor = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_OPOR_INT);
        v_sum_comm_executor = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_EXECUTOR_INT);
        v_sum_comm_dir = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_DIR_INT);
        v_sum_comm_limit_price = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_LIMIT_PRICE_FLOAT);
        v_sum_comm_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_QTY_FLOAT);
        v_sum_comm_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_AMT_FLOAT);
        v_sum_comm_order_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_ORDER_QTY_FLOAT);
        v_sum_comm_cancel_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_CANCEL_QTY_FLOAT);
        v_sum_comm_await_cancel_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_AWAIT_CANCEL_QTY_FLOAT);
        v_sum_comm_strike_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_STRIKE_AMT_FLOAT);
        v_sum_comm_strike_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_STRIKE_QTY_FLOAT);
        strcpy(v_sum_comm_strike_status, lpTSCall1Ans7->GetString(LDBIZ_SUM_COMM_STRIKE_STATUS_STR));
        strcpy(v_comm_sum_status, lpTSCall1Ans7->GetString(LDBIZ_COMM_SUM_STATUS_STR));
        v_sum_comm_begin_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_BEGIN_DATE_INT);
        v_sum_comm_end_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_END_DATE_INT);
        v_sum_comm_begin_time = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_BEGIN_TIME_INT);
        v_sum_comm_end_time = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_END_TIME_INT);
        v_sum_comm_comple_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_COMPLE_DATE_INT);
        v_sum_comm_comple_time = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_COMPLE_TIME_INT);
        v_sum_comm_max_comm_comple_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_DATE_INT);
        v_sum_comm_max_comm_comple_time = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_TIME_INT);
        v_sum_comm_appr_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_APPR_DATE_INT);
        v_sum_comm_appr_time = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_APPR_TIME_INT);
        v_sum_comm_appr_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_APPR_QTY_FLOAT);
        strcpy(v_comm_sum_approve_status, lpTSCall1Ans7->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
        v_sum_comm_basket_id = lpTSCall1Ans7->GetInt64(LDBIZ_SUM_COMM_BASKET_ID_INT64);
        v_sum_comm_net_price_flag = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_NET_PRICE_FLAG_INT);
        v_sum_comm_bond_accr_intrst = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_BOND_ACCR_INTRST_FLOAT);
        v_sum_comm_bond_rate_type = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_BOND_RATE_TYPE_INT);
        strcpy(v_sum_comm_oper_way, lpTSCall1Ans7->GetString(LDBIZ_SUM_COMM_OPER_WAY_STR));
        v_sum_comm_exter_comm_flag = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_EXTER_COMM_FLAG_INT);
        v_sum_buy_order_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_BUY_ORDER_QTY_FLOAT);
        v_sum_sell_order_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_SELL_ORDER_QTY_FLOAT);
        v_sum_buy_comm_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_BUY_COMM_QTY_FLOAT);
        v_sum_sell_comm_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_SELL_COMM_QTY_FLOAT);
        v_sum_buy_strike_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_BUY_STRIKE_QTY_FLOAT);
        v_sum_sell_strike_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_SELL_STRIKE_QTY_FLOAT);
        v_sum_buy_strike_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_BUY_STRIKE_AMT_FLOAT);
        v_sum_sell_strike_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_SELL_STRIKE_AMT_FLOAT);
        v_sum_buy_comm_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_BUY_COMM_AMT_FLOAT);
        v_sum_sell_comm_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_SELL_COMM_AMT_FLOAT);
        strcpy(v_sum_comm_remark_info, lpTSCall1Ans7->GetString(LDBIZ_SUM_COMM_REMARK_INFO_STR));
        v_sum_comm_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_UPDATE_TIMES_INT);
        strcpy(v_acco_concat_info, lpTSCall1Ans7->GetString(LDBIZ_ACCO_CONCAT_INFO_STR));
        strcpy(v_combo_code, lpTSCall1Ans7->GetString(LDBIZ_COMBO_CODE_STR));


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

    //订单及订单汇总的主推

    // if @订单序号# > 0 then
    if (v_order_id > 0)
    {
        //调用过程[事务_交易证券_主推接口_获取订单信息]
        //组织事务请求
        if(lpTSCall1Ans8)
        {
          lpTSCall1Ans8->FreeMsg();
          lpTSCall1Ans8=NULL;
        }
        lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.45", 0);
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
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.45]subcall timed out!");
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
        v_co_no = lpTSCall1Ans8->GetInt32(LDBIZ_CO_NO_INT);
        v_busi_opor_no = lpTSCall1Ans8->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
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
        v_trade_code_no = lpTSCall1Ans8->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
        v_target_code_no = lpTSCall1Ans8->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
        v_stock_type = lpTSCall1Ans8->GetInt32(LDBIZ_STOCK_TYPE_INT);
        v_asset_type = lpTSCall1Ans8->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_external_no = lpTSCall1Ans8->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
        v_comm_id = lpTSCall1Ans8->GetInt64(LDBIZ_COMM_ID_INT64);
        v_comm_batch_no = lpTSCall1Ans8->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
        v_comm_opor = lpTSCall1Ans8->GetInt32(LDBIZ_COMM_OPOR_INT);
        v_report_date = lpTSCall1Ans8->GetInt32(LDBIZ_REPORT_DATE_INT);
        v_report_time = lpTSCall1Ans8->GetInt32(LDBIZ_REPORT_TIME_INT);
        strcpy(v_report_no, lpTSCall1Ans8->GetString(LDBIZ_REPORT_NO_STR));
        v_order_date = lpTSCall1Ans8->GetInt32(LDBIZ_ORDER_DATE_INT);
        v_order_time = lpTSCall1Ans8->GetInt32(LDBIZ_ORDER_TIME_INT);
        v_order_batch_no = lpTSCall1Ans8->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
        v_order_dir = lpTSCall1Ans8->GetInt32(LDBIZ_ORDER_DIR_INT);
        v_price_type = lpTSCall1Ans8->GetInt32(LDBIZ_PRICE_TYPE_INT);
        v_order_price = lpTSCall1Ans8->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        strcpy(v_order_status, lpTSCall1Ans8->GetString(LDBIZ_ORDER_STATUS_STR));
        v_wtdraw_qty = lpTSCall1Ans8->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans8->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_strike_qty = lpTSCall1Ans8->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_all_fee = lpTSCall1Ans8->GetDouble(LDBIZ_ALL_FEE_FLOAT);
        v_stamp_tax = lpTSCall1Ans8->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
        v_trans_fee = lpTSCall1Ans8->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
        v_brkage_fee = lpTSCall1Ans8->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
        v_SEC_charges = lpTSCall1Ans8->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
        v_other_fee = lpTSCall1Ans8->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
        v_trade_commis = lpTSCall1Ans8->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_other_commis = lpTSCall1Ans8->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_trade_tax = lpTSCall1Ans8->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
        v_trade_cost_fee = lpTSCall1Ans8->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
        v_trade_system_use_fee = lpTSCall1Ans8->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
        v_stock_settle_fee = lpTSCall1Ans8->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);
        v_net_price_flag = lpTSCall1Ans8->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
        v_intrst_days = lpTSCall1Ans8->GetInt32(LDBIZ_INTRST_DAYS_INT);
        v_par_value = lpTSCall1Ans8->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
        v_bond_accr_intrst = lpTSCall1Ans8->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
        v_bond_rate_type = lpTSCall1Ans8->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
        v_strike_bond_accr_intrst = lpTSCall1Ans8->GetDouble(LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
        v_impawn_ratio = lpTSCall1Ans8->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
        v_order_frozen_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
        v_order_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT);
        strcpy(v_rsp_info, lpTSCall1Ans8->GetString(LDBIZ_RSP_INFO_STR));
        v_compli_trig_id = lpTSCall1Ans8->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);
        strcpy(v_remark_info, lpTSCall1Ans8->GetString(LDBIZ_REMARK_INFO_STR));
        v_cost_calc_type = lpTSCall1Ans8->GetInt32(LDBIZ_COST_CALC_TYPE_INT);
        strcpy(v_order_oper_way, lpTSCall1Ans8->GetString(LDBIZ_ORDER_OPER_WAY_STR));
        v_exter_comm_flag = lpTSCall1Ans8->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
        v_record_valid_flag = lpTSCall1Ans8->GetInt32(LDBIZ_RECORD_VALID_FLAG_INT);
        strcpy(v_combo_code, lpTSCall1Ans8->GetString(LDBIZ_COMBO_CODE_STR));
        v_combo_posi_id = lpTSCall1Ans8->GetInt64(LDBIZ_COMBO_POSI_ID_INT64);
        v_strategy_id = lpTSCall1Ans8->GetInt64(LDBIZ_STRATEGY_ID_INT64);
        v_asset_acco_type = lpTSCall1Ans8->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);
        strcpy(v_contra_no, lpTSCall1Ans8->GetString(LDBIZ_CONTRA_NO_STR));
        v_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_UPDATE_TIMES_INT);


        // set @操作员编号# = @业务操作员编号#;
        v_opor_no = v_busi_opor_no;

        // set @当笔成交价格#=0;
        v_curr_strike_price=0;

        // set @当笔成交金额#=0;
        v_curr_strike_amt=0;

        // set @当笔成交数量#=0;
        v_curr_strike_qty=0;

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


        // if @订单批号# > 0 then
        if (v_order_batch_no > 0)
        {
            //调用过程[事务_交易证券_主推接口_获取订单汇总信息]
            //组织事务请求
            if(lpTSCall1Ans9)
            {
              lpTSCall1Ans9->FreeMsg();
              lpTSCall1Ans9=NULL;
            }
            lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.47", 0);
            lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req9->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpTSCall1Req9->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
            lpTSCall1Req9->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
            glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
            if(!lpTSCall1Ans9)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.47]subcall timed out!");
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
            v_sum_order_row_id = lpTSCall1Ans9->GetInt64(LDBIZ_SUM_ORDER_ROW_ID_INT64);
            v_sum_order_opor_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_OPOR_NO_INT);
            v_sum_order_co_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_CO_NO_INT);
            v_sum_order_pd_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_PD_NO_INT);
            v_sum_order_exch_group_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_EXCH_GROUP_NO_INT);
            v_sum_order_asset_acco_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_ASSET_ACCO_NO_INT);
            v_sum_order_pass_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_PASS_NO_INT);
            strcpy(v_sum_order_exch_crncy_type, lpTSCall1Ans9->GetString(LDBIZ_SUM_ORDER_EXCH_CRNCY_TYPE_STR));
            v_sum_order_stock_code_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_STOCK_CODE_NO_INT);
            v_sum_order_trade_code_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_TRADE_CODE_NO_INT);
            v_sum_order_target_code_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_TARGET_CODE_NO_INT);
            v_sum_order_external_no = lpTSCall1Ans9->GetInt64(LDBIZ_SUM_ORDER_EXTERNAL_NO_INT64);
            v_sum_order_date = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_DATE_INT);
            v_sum_order_batch_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_BATCH_NO_INT);
            v_sum_order_dir = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_DIR_INT);
            v_sum_order_price_type = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_PRICE_TYPE_INT);
            v_sum_order_price = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_PRICE_FLOAT);
            v_sum_order_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_QTY_FLOAT);
            strcpy(v_order_sum_status, lpTSCall1Ans9->GetString(LDBIZ_ORDER_SUM_STATUS_STR));
            v_sum_order_wtdraw_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_WTDRAW_QTY_FLOAT);
            v_sum_order_waste_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_WASTE_QTY_FLOAT);
            v_sum_order_strike_amt = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_STRIKE_AMT_FLOAT);
            v_sum_order_strike_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_STRIKE_QTY_FLOAT);
            v_sum_order_strike_aver_price = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_STRIKE_AVER_PRICE_FLOAT);
            v_sum_order_net_price_flag = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_NET_PRICE_FLAG_INT);
            v_sum_order_bond_accr_intrst = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_BOND_ACCR_INTRST_FLOAT);
            v_sum_order_bond_rate_type = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_BOND_RATE_TYPE_INT);
            v_sum_order_par_value = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_PAR_VALUE_FLOAT);
            v_sum_order_impawn_ratio = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_IMPAWN_RATIO_FLOAT);
            strcpy(v_sum_order_oper_way, lpTSCall1Ans9->GetString(LDBIZ_SUM_ORDER_OPER_WAY_STR));
            v_sum_order_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_UPDATE_TIMES_INT);


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

    // end if;
    }

    //调用过程[事务_交易证券_主推接口_获取撤单信息]
    //组织事务请求
    if(lpTSCall1Ans10)
    {
      lpTSCall1Ans10->FreeMsg();
      lpTSCall1Ans10=NULL;
    }
    lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.48", 0);
    lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req10->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
    if(!lpTSCall1Ans10)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.48]subcall timed out!");
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
    v_wtdraw_id = lpTSCall1Ans10->GetInt64(LDBIZ_WTDRAW_ID_INT64);
    v_busi_opor_no = lpTSCall1Ans10->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_init_date = lpTSCall1Ans10->GetInt32(LDBIZ_INIT_DATE_INT);
    v_co_no = lpTSCall1Ans10->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans10->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans10->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans10->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans10->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans10->GetString(LDBIZ_OUT_ACCO_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans10->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_exch_no = lpTSCall1Ans10->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans10->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans10->GetString(LDBIZ_STOCK_ACCO_STR));
    v_stock_code_no = lpTSCall1Ans10->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strcpy(v_stock_code, lpTSCall1Ans10->GetString(LDBIZ_STOCK_CODE_STR));
    v_external_no = lpTSCall1Ans10->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_wtdraw_batch_no = lpTSCall1Ans10->GetInt32(LDBIZ_WTDRAW_BATCH_NO_INT);
    v_wtdraw_date = lpTSCall1Ans10->GetInt32(LDBIZ_WTDRAW_DATE_INT);
    v_wtdraw_time = lpTSCall1Ans10->GetInt32(LDBIZ_WTDRAW_TIME_INT);
    v_order_date = lpTSCall1Ans10->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_report_date = lpTSCall1Ans10->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpTSCall1Ans10->GetInt32(LDBIZ_REPORT_TIME_INT);
    strcpy(v_report_no, lpTSCall1Ans10->GetString(LDBIZ_REPORT_NO_STR));
    strcpy(v_wtdraw_status, lpTSCall1Ans10->GetString(LDBIZ_WTDRAW_STATUS_STR));
    v_wtdraw_qty = lpTSCall1Ans10->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    strcpy(v_wtdraw_remark, lpTSCall1Ans10->GetString(LDBIZ_WTDRAW_REMARK_STR));
    v_order_price = lpTSCall1Ans10->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    strcpy(v_trade_acco, lpTSCall1Ans10->GetString(LDBIZ_TRADE_ACCO_STR));
    v_update_times = lpTSCall1Ans10->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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

    //质押提交和质押转回，要推交易代码和标准券代码

    // if @订单方向# = 《订单方向-质押提交》 or @订单方向# = 《订单方向-质押转回》 then
    if (v_order_dir == 21 || v_order_dir == 22)
    {
      //调用过程[事务_交易证券_主推接口_获取资金和质押持仓信息]
      //组织事务请求
      if(lpTSCall1Ans11)
      {
        lpTSCall1Ans11->FreeMsg();
        lpTSCall1Ans11=NULL;
      }
      lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.28", 0);
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
      lpTSCall1Req11->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpTSCall1Req11->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
      lpTSCall1Req11->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      lpTSCall1Req11->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
      glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
      if(!lpTSCall1Ans11)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.28]subcall timed out!");
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
      v_exgp_cash_id = lpTSCall1Ans11->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
      v_exgp_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
      v_exgp_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
      v_exgp_comm_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
      v_exgp_comm_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
      v_exgp_comm_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
      v_exgp_comm_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
      v_exgp_trade_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT);
      v_exgp_trade_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT);
      v_exgp_trade_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
      v_exgp_trade_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
      v_exgp_strike_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
      v_exgp_strike_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
      v_exgp_cash_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
      v_exgp_posi_id = lpTSCall1Ans11->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
      v_exgp_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
      v_exgp_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
      v_exgp_comm_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT);
      v_exgp_comm_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT);
      v_exgp_comm_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT);
      v_exgp_comm_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
      v_exgp_trade_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT);
      v_exgp_trade_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT);
      v_exgp_trade_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT);
      v_exgp_trade_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
      v_exgp_strike_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT);
      v_exgp_strike_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
      v_exgp_strike_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT);
      v_exgp_strike_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT);
      v_exgp_realize_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
      v_exgp_cost_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
      v_exgp_intrst_cost_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
      v_exgp_intrst_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
      v_exgp_posi_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
      v_asac_cash_id = lpTSCall1Ans11->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
      v_asac_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
      v_asac_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
      v_asac_comm_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
      v_asac_comm_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
      v_asac_comm_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
      v_asac_comm_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
      v_asac_trade_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT);
      v_asac_trade_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT);
      v_asac_trade_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
      v_asac_trade_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
      v_asac_strike_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
      v_asac_strike_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
      v_asac_cash_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);
      v_asac_posi_id = lpTSCall1Ans11->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
      v_asac_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
      v_asac_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
      v_asac_comm_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT);
      v_asac_comm_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT);
      v_asac_comm_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT);
      v_asac_comm_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
      v_asac_trade_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT);
      v_asac_trade_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT);
      v_asac_trade_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT);
      v_asac_trade_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
      v_asac_strike_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT);
      v_asac_strike_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
      v_asac_strike_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT);
      v_asac_strike_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT);
      v_asac_realize_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
      v_asac_cost_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
      v_asac_intrst_cost_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
      v_asac_intrst_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
      v_asac_posi_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);
      v_exgp_target_posi_id = lpTSCall1Ans11->GetInt64(LDBIZ_EXGP_TARGET_POSI_ID_INT64);
      v_exgp_target_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TARGET_FROZEN_QTY_FLOAT);
      v_exgp_target_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TARGET_UNFROZ_QTY_FLOAT);
      v_exgp_target_comm_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TARGET_COMM_FROZEN_QTY_FLOAT);
      v_exgp_target_comm_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TARGET_COMM_UNFROZ_QTY_FLOAT);
      v_exgp_target_comm_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TARGET_COMM_CAPT_QTY_FLOAT);
      v_exgp_target_comm_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TARGET_COMM_RELEAS_QTY_FLOAT);
      v_exgp_target_trade_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TARGET_TRADE_FROZEN_QTY_FLOAT);
      v_exgp_target_trade_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TARGET_TRADE_UNFROZ_QTY_FLOAT);
      v_exgp_target_trade_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TARGET_TRADE_CAPT_QTY_FLOAT);
      v_exgp_target_trade_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TARGET_TRADE_RELEAS_QTY_FLOAT);
      v_exgp_target_strike_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_CAPT_QTY_FLOAT);
      v_exgp_target_strike_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_RELEAS_QTY_FLOAT);
      v_exgp_target_strike_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_FROZEN_QTY_FLOAT);
      v_exgp_target_strike_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_UNFROZ_QTY_FLOAT);
      v_exgp_target_realize_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TARGET_REALIZE_PANDL_FLOAT);
      v_exgp_target_cost_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TARGET_COST_AMT_FLOAT);
      v_exgp_target_intrst_cost_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TARGET_INTRST_COST_AMT_FLOAT);
      v_exgp_target_intrst_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TARGET_INTRST_PANDL_FLOAT);
      v_exgp_target_posi_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_EXGP_TARGET_POSI_UPDATE_TIMES_INT);
      v_asac_target_posi_id = lpTSCall1Ans11->GetInt64(LDBIZ_ASAC_TARGET_POSI_ID_INT64);
      v_asac_target_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TARGET_FROZEN_QTY_FLOAT);
      v_asac_target_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TARGET_UNFROZ_QTY_FLOAT);
      v_asac_target_comm_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TARGET_COMM_FROZEN_QTY_FLOAT);
      v_asac_target_comm_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TARGET_COMM_UNFROZ_QTY_FLOAT);
      v_asac_target_comm_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TARGET_COMM_CAPT_QTY_FLOAT);
      v_asac_target_comm_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TARGET_COMM_RELEAS_QTY_FLOAT);
      v_asac_target_trade_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TARGET_TRADE_FROZEN_QTY_FLOAT);
      v_asac_target_trade_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TARGET_TRADE_UNFROZ_QTY_FLOAT);
      v_asac_target_trade_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TARGET_TRADE_CAPT_QTY_FLOAT);
      v_asac_target_trade_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TARGET_TRADE_RELEAS_QTY_FLOAT);
      v_asac_target_strike_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_CAPT_QTY_FLOAT);
      v_asac_target_strike_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_RELEAS_QTY_FLOAT);
      v_asac_target_strike_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_FROZEN_QTY_FLOAT);
      v_asac_target_strike_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_UNFROZ_QTY_FLOAT);
      v_asac_target_realize_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TARGET_REALIZE_PANDL_FLOAT);
      v_asac_target_cost_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TARGET_COST_AMT_FLOAT);
      v_asac_target_intrst_cost_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TARGET_INTRST_COST_AMT_FLOAT);
      v_asac_target_intrst_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TARGET_INTRST_PANDL_FLOAT);
      v_asac_target_posi_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_ASAC_TARGET_POSI_UPDATE_TIMES_INT);
      v_exgp_put_impawn_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT);
      v_asac_put_impawn_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT);


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
    // else if @订单方向# = 《订单方向-融资回购》 or @订单方向# = 《订单方向-融券回购》 then
    else if (v_order_dir == 3 || v_order_dir == 4)
    {

      // set @证券代码编号# = @标的代码编号#;
      v_stock_code_no = v_target_code_no;
      //调用过程[事务_交易证券_主推接口_获取资金持仓信息]
      //组织事务请求
      if(lpTSCall1Ans12)
      {
        lpTSCall1Ans12->FreeMsg();
        lpTSCall1Ans12=NULL;
      }
      lpTSCall1Req12=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.13", 0);
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
      lpTSCall1Req12->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpTSCall1Req12->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
      lpTSCall1Req12->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      glpTSSubcallSerives->SubCall(lpTSCall1Req12, &lpTSCall1Ans12, 5000);
      if(!lpTSCall1Ans12)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.13]subcall timed out!");
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
      v_exgp_cash_id = lpTSCall1Ans12->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
      v_exgp_frozen_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
      v_exgp_unfroz_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
      v_exgp_comm_frozen_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
      v_exgp_comm_unfroz_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
      v_exgp_comm_capt_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
      v_exgp_comm_releas_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
      v_exgp_trade_frozen_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT);
      v_exgp_trade_unfroz_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT);
      v_exgp_trade_capt_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
      v_exgp_trade_releas_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
      v_exgp_strike_capt_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
      v_exgp_strike_releas_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
      v_exgp_cash_update_times = lpTSCall1Ans12->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
      v_exgp_posi_id = lpTSCall1Ans12->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
      v_exgp_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
      v_exgp_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
      v_exgp_comm_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT);
      v_exgp_comm_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT);
      v_exgp_comm_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT);
      v_exgp_comm_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
      v_exgp_trade_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT);
      v_exgp_trade_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT);
      v_exgp_trade_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT);
      v_exgp_trade_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
      v_exgp_strike_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT);
      v_exgp_strike_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
      v_exgp_strike_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT);
      v_exgp_strike_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT);
      v_exgp_realize_pandl = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
      v_exgp_cost_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
      v_exgp_intrst_cost_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
      v_exgp_intrst_pandl = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
      v_exgp_posi_update_times = lpTSCall1Ans12->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
      v_asac_cash_id = lpTSCall1Ans12->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
      v_asac_frozen_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
      v_asac_unfroz_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
      v_asac_comm_frozen_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
      v_asac_comm_unfroz_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
      v_asac_comm_capt_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
      v_asac_comm_releas_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
      v_asac_trade_frozen_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT);
      v_asac_trade_unfroz_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT);
      v_asac_trade_capt_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
      v_asac_trade_releas_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
      v_asac_strike_capt_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
      v_asac_strike_releas_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
      v_asac_cash_update_times = lpTSCall1Ans12->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);
      v_asac_posi_id = lpTSCall1Ans12->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
      v_asac_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
      v_asac_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
      v_asac_comm_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT);
      v_asac_comm_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT);
      v_asac_comm_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT);
      v_asac_comm_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
      v_asac_trade_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT);
      v_asac_trade_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT);
      v_asac_trade_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT);
      v_asac_trade_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
      v_asac_strike_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT);
      v_asac_strike_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
      v_asac_strike_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT);
      v_asac_strike_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT);
      v_asac_realize_pandl = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
      v_asac_cost_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
      v_asac_intrst_cost_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
      v_asac_intrst_pandl = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
      v_asac_posi_update_times = lpTSCall1Ans12->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


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

      //set @回购成交序号// = @成交序号//;
      //[事务_交易证券_主推接口_获取债券回购信息]
      //[主动推送][secu.exgpbondrepo][证券主推_持仓_交易组债券回购主推消息]
    }
    // else
    else
    {

      //调用过程[事务_交易证券_主推接口_获取资金持仓信息]
      //组织事务请求
      if(lpTSCall1Ans13)
      {
        lpTSCall1Ans13->FreeMsg();
        lpTSCall1Ans13=NULL;
      }
      lpTSCall1Req13=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.13", 0);
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
      lpTSCall1Req13->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpTSCall1Req13->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
      lpTSCall1Req13->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      glpTSSubcallSerives->SubCall(lpTSCall1Req13, &lpTSCall1Ans13, 5000);
      if(!lpTSCall1Ans13)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.13]subcall timed out!");
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
      v_exgp_cash_id = lpTSCall1Ans13->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
      v_exgp_frozen_amt = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
      v_exgp_unfroz_amt = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
      v_exgp_comm_frozen_amt = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
      v_exgp_comm_unfroz_amt = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
      v_exgp_comm_capt_amt = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
      v_exgp_comm_releas_amt = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
      v_exgp_trade_frozen_amt = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT);
      v_exgp_trade_unfroz_amt = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT);
      v_exgp_trade_capt_amt = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
      v_exgp_trade_releas_amt = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
      v_exgp_strike_capt_amt = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
      v_exgp_strike_releas_amt = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
      v_exgp_cash_update_times = lpTSCall1Ans13->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
      v_exgp_posi_id = lpTSCall1Ans13->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
      v_exgp_frozen_qty = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
      v_exgp_unfroz_qty = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
      v_exgp_comm_frozen_qty = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT);
      v_exgp_comm_unfroz_qty = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT);
      v_exgp_comm_capt_qty = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT);
      v_exgp_comm_releas_qty = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
      v_exgp_trade_frozen_qty = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT);
      v_exgp_trade_unfroz_qty = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT);
      v_exgp_trade_capt_qty = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT);
      v_exgp_trade_releas_qty = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
      v_exgp_strike_capt_qty = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT);
      v_exgp_strike_releas_qty = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
      v_exgp_strike_frozen_qty = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT);
      v_exgp_strike_unfroz_qty = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT);
      v_exgp_realize_pandl = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
      v_exgp_cost_amt = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
      v_exgp_intrst_cost_amt = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
      v_exgp_intrst_pandl = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
      v_exgp_posi_update_times = lpTSCall1Ans13->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
      v_asac_cash_id = lpTSCall1Ans13->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
      v_asac_frozen_amt = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
      v_asac_unfroz_amt = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
      v_asac_comm_frozen_amt = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
      v_asac_comm_unfroz_amt = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
      v_asac_comm_capt_amt = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
      v_asac_comm_releas_amt = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
      v_asac_trade_frozen_amt = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT);
      v_asac_trade_unfroz_amt = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT);
      v_asac_trade_capt_amt = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
      v_asac_trade_releas_amt = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
      v_asac_strike_capt_amt = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
      v_asac_strike_releas_amt = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
      v_asac_cash_update_times = lpTSCall1Ans13->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);
      v_asac_posi_id = lpTSCall1Ans13->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
      v_asac_frozen_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
      v_asac_unfroz_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
      v_asac_comm_frozen_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT);
      v_asac_comm_unfroz_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT);
      v_asac_comm_capt_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT);
      v_asac_comm_releas_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
      v_asac_trade_frozen_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT);
      v_asac_trade_unfroz_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT);
      v_asac_trade_capt_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT);
      v_asac_trade_releas_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
      v_asac_strike_capt_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT);
      v_asac_strike_releas_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
      v_asac_strike_frozen_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT);
      v_asac_strike_unfroz_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT);
      v_asac_realize_pandl = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
      v_asac_cost_amt = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
      v_asac_intrst_cost_amt = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
      v_asac_intrst_pandl = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
      v_asac_posi_update_times = lpTSCall1Ans13->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


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

//逻辑_交易证券_交易运维_错单修改废单回退
int LD_CALL_MODE fnFunc28(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    char v_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_tmp_opor_no;
    int v_tmp_opor_co_no;
    int v_co_no;
    int v_busi_opor_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    char v_exch_crncy_type[4];
    int v_exch_no;
    int v_stock_acco_no;
    char v_stock_acco[17];
    int v_stock_code_no;
    char v_stock_code[7];
    int v_trade_code_no;
    int v_target_code_no;
    int v_stock_type;
    int v_asset_type;
    int64 v_external_no;
    int64 v_comm_id;
    int v_comm_batch_no;
    int v_comm_opor;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_batch_no;
    int v_order_dir;
    int v_price_type;
    double v_order_price;
    double v_order_qty;
    char v_order_status[3];
    double v_wtdraw_qty;
    double v_strike_amt;
    double v_strike_qty;
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
    int v_net_price_flag;
    int v_intrst_days;
    double v_par_value;
    double v_bond_accr_intrst;
    int v_bond_rate_type;
    double v_strike_bond_accr_intrst;
    double v_impawn_ratio;
    double v_order_frozen_amt;
    double v_order_frozen_qty;
    char v_rsp_info[256];
    int64 v_compli_trig_id;
    int v_cost_calc_type;
    char v_order_oper_way[3];
    int v_exter_comm_flag;
    int v_record_valid_flag;
    char v_combo_code[33];
    int64 v_combo_posi_id;
    int64 v_strategy_id;
    int v_asset_acco_type;
    char v_contra_no[33];
    int v_update_times;
    char v_sys_config_str[65];
    char v_exgp_busi_config_str[65];
    char v_crncy_type[4];
    double v_buy_ref_rate;
    double v_sell_ref_rate;
    char v_target_code[7];
    int v_target_code_stock_type;
    int v_target_code_asset_type;
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
    double v_exgp_cost_amt;
    double v_exgp_intrst_cost_amt;
    double v_exgp_curr_qty;
    double v_asac_cost_amt;
    double v_asac_intrst_cost_amt;
    double v_asac_curr_qty;
    int64 v_strike_id;
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
    double v_curr_strike_price;
    double v_curr_strike_amt;
    double v_curr_strike_qty;
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
    strcpy(v_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_tmp_opor_no=0;
    v_tmp_opor_co_no=0;
    v_co_no=0;
    v_busi_opor_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_exch_crncy_type, "CNY");
    v_exch_no=0;
    v_stock_acco_no=0;
    strcpy(v_stock_acco, " ");
    v_stock_code_no=0;
    strcpy(v_stock_code, " ");
    v_trade_code_no=0;
    v_target_code_no=0;
    v_stock_type=0;
    v_asset_type=0;
    v_external_no=0;
    v_comm_id=0;
    v_comm_batch_no=0;
    v_comm_opor=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_batch_no=0;
    v_order_dir=0;
    v_price_type=0;
    v_order_price=0;
    v_order_qty=0;
    strcpy(v_order_status, "0");
    v_wtdraw_qty=0;
    v_strike_amt=0;
    v_strike_qty=0;
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
    v_net_price_flag=0;
    v_intrst_days=0;
    v_par_value=0;
    v_bond_accr_intrst=0;
    v_bond_rate_type=0;
    v_strike_bond_accr_intrst=0;
    v_impawn_ratio=0;
    v_order_frozen_amt=0;
    v_order_frozen_qty=0;
    strcpy(v_rsp_info, " ");
    v_compli_trig_id=0;
    v_cost_calc_type=0;
    strcpy(v_order_oper_way, " ");
    v_exter_comm_flag=0;
    v_record_valid_flag=0;
    strcpy(v_combo_code, " ");
    v_combo_posi_id=0;
    v_strategy_id=0;
    v_asset_acco_type=0;
    strcpy(v_contra_no, " ");
    v_update_times=1;
    strcpy(v_sys_config_str, " ");
    strcpy(v_exgp_busi_config_str, " ");
    strcpy(v_crncy_type, "CNY");
    v_buy_ref_rate=0;
    v_sell_ref_rate=0;
    strcpy(v_target_code, " ");
    v_target_code_stock_type=0;
    v_target_code_asset_type=0;
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
    v_exgp_cost_amt=0;
    v_exgp_intrst_cost_amt=0;
    v_exgp_curr_qty=0;
    v_asac_cost_amt=0;
    v_asac_intrst_cost_amt=0;
    v_asac_curr_qty=0;
    v_strike_id=0;
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
    v_curr_strike_price=0;
    v_curr_strike_amt=0;
    v_curr_strike_qty=0;
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


    // set @临时_操作员编号# = @操作员编号#;
    v_tmp_opor_no = v_opor_no;

    // set @临时_操作员机构编号# = @操作员机构编号#;
    v_tmp_opor_co_no = v_opor_co_no;
    //调用过程[事务_交易证券_主推接口_获取订单信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.45", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.45]subcall timed out!");
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
    v_busi_opor_no = lpTSCall1Ans1->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans1->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans1->GetString(LDBIZ_OUT_ACCO_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans1->GetString(LDBIZ_STOCK_ACCO_STR));
    v_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strcpy(v_stock_code, lpTSCall1Ans1->GetString(LDBIZ_STOCK_CODE_STR));
    v_trade_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
    v_target_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
    v_stock_type = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_external_no = lpTSCall1Ans1->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_comm_id = lpTSCall1Ans1->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_opor = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_report_date = lpTSCall1Ans1->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpTSCall1Ans1->GetInt32(LDBIZ_REPORT_TIME_INT);
    strcpy(v_report_no, lpTSCall1Ans1->GetString(LDBIZ_REPORT_NO_STR));
    v_order_date = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_order_time = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_order_batch_no = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_order_dir = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_price_type = lpTSCall1Ans1->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_order_price = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    strcpy(v_order_status, lpTSCall1Ans1->GetString(LDBIZ_ORDER_STATUS_STR));
    v_wtdraw_qty = lpTSCall1Ans1->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_qty = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_all_fee = lpTSCall1Ans1->GetDouble(LDBIZ_ALL_FEE_FLOAT);
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
    v_net_price_flag = lpTSCall1Ans1->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
    v_intrst_days = lpTSCall1Ans1->GetInt32(LDBIZ_INTRST_DAYS_INT);
    v_par_value = lpTSCall1Ans1->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
    v_bond_accr_intrst = lpTSCall1Ans1->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
    v_bond_rate_type = lpTSCall1Ans1->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
    v_strike_bond_accr_intrst = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
    v_impawn_ratio = lpTSCall1Ans1->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
    v_order_frozen_amt = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
    v_order_frozen_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT);
    strcpy(v_rsp_info, lpTSCall1Ans1->GetString(LDBIZ_RSP_INFO_STR));
    v_compli_trig_id = lpTSCall1Ans1->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);
    strcpy(v_remark_info, lpTSCall1Ans1->GetString(LDBIZ_REMARK_INFO_STR));
    v_cost_calc_type = lpTSCall1Ans1->GetInt32(LDBIZ_COST_CALC_TYPE_INT);
    strcpy(v_order_oper_way, lpTSCall1Ans1->GetString(LDBIZ_ORDER_OPER_WAY_STR));
    v_exter_comm_flag = lpTSCall1Ans1->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_record_valid_flag = lpTSCall1Ans1->GetInt32(LDBIZ_RECORD_VALID_FLAG_INT);
    strcpy(v_combo_code, lpTSCall1Ans1->GetString(LDBIZ_COMBO_CODE_STR));
    v_combo_posi_id = lpTSCall1Ans1->GetInt64(LDBIZ_COMBO_POSI_ID_INT64);
    v_strategy_id = lpTSCall1Ans1->GetInt64(LDBIZ_STRATEGY_ID_INT64);
    v_asset_acco_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);
    strcpy(v_contra_no, lpTSCall1Ans1->GetString(LDBIZ_CONTRA_NO_STR));
    v_update_times = lpTSCall1Ans1->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // [检查报错返回][@订单状态# <>《订单状态-废单》][1]["该订单状态不支持废单回退！"]
    if (strcmp(v_order_status ,"8")!=0)
    {
        strcpy(v_error_code, "tdsecuL.10.75.1");
        snprintf(v_error_info, sizeof(v_error_info), "该订单状态不支持废单回退！");
        iRet = -1;
        goto END;
    }


    // [检查报错返回][@订单操作方式# = 《订单操作方式-增强交易》 or @订单操作方式# = 《订单操作方式-增强交易平仓》 or @订单操作方式# = 《订单操作方式-金纳算法交易》 or @订单操作方式# = 《订单操作方式-多账户算法交易》 or @订单操作方式# = 《订单操作方式-港股通算法交易》 or @订单操作方式# = 《订单操作方式-指令算法交易》 or @订单操作方式# = 《订单操作方式-调仓算法交易》  or @订单操作方式# = 《订单操作方式-调仓指令算法交易》 or @订单操作方式# = 《订单操作方式-组合买入》  or @订单操作方式# = 《订单操作方式-组合卖出》  or @订单操作方式# = 《订单操作方式-组合调仓》 or @订单操作方式# = 《订单操作方式-篮子买入算法交易》 or @订单操作方式# = 《订单操作方式-篮子卖出算法交易》 or @订单操作方式# = 《订单操作方式-预埋单交易》 or @订单操作方式# = 《订单操作方式-体外指令》][624][@订单操作方式#]
    if (strcmp(v_order_oper_way , "14")==0 || strcmp(v_order_oper_way , "51")==0 || strcmp(v_order_oper_way , "61")==0 || strcmp(v_order_oper_way , "62")==0 || strcmp(v_order_oper_way , "63")==0 || strcmp(v_order_oper_way , "65")==0 || strcmp(v_order_oper_way , "66")==0  || strcmp(v_order_oper_way , "67")==0 || strcmp(v_order_oper_way , "26")==0  || strcmp(v_order_oper_way , "27")==0  || strcmp(v_order_oper_way , "28")==0 || strcmp(v_order_oper_way , "79")==0 || strcmp(v_order_oper_way , "80")==0 || strcmp(v_order_oper_way , "34")==0 || strcmp(v_order_oper_way , "41")==0)
    {
        strcpy(v_error_code, "tdsecuL.10.75.624");
        snprintf(v_error_info, sizeof(v_error_info), "%s%s","订单操作方式=",v_order_oper_way);
        iRet = -1;
        goto END;
    }


    // [检查报错返回][@记录有效标志# = 《记录有效标志-无效》][761][@记录有效标志#]
    if (v_record_valid_flag == 2)
    {
        strcpy(v_error_code, "tdsecuL.10.75.761");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d","记录有效标志=",v_record_valid_flag);
        iRet = -1;
        goto END;
    }


    // set @价格类型# = 《价格类型-限价》;
    v_price_type = 1;
    //公共子系统检查
    //[事务_公共_交易接口_检查系统状态交易业务]

    // set @操作员编号#= @业务操作员编号#;
    v_opor_no= v_busi_opor_no;

    // set @操作员机构编号# = @机构编号#;
    v_opor_co_no = v_co_no;
    //调用过程[事务_公共_交易接口_检查交易市场状态权限身份无密码]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.25.235", 0);
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
    lpTSCall1Req2->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req2->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req2->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req2->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.235]subcall timed out!");
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
    strcpy(v_sys_config_str, lpTSCall1Ans2->GetString(LDBIZ_SYS_CONFIG_STR_STR));
    v_pd_no = lpTSCall1Ans2->GetInt32(LDBIZ_PD_NO_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans2->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));
    strcpy(v_exgp_busi_config_str, lpTSCall1Ans2->GetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR));
    v_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_stock_type = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_CRNCY_TYPE_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_buy_ref_rate = lpTSCall1Ans2->GetDouble(LDBIZ_BUY_REF_RATE_FLOAT);
    v_sell_ref_rate = lpTSCall1Ans2->GetDouble(LDBIZ_SELL_REF_RATE_FLOAT);
    v_par_value = lpTSCall1Ans2->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
    v_impawn_ratio = lpTSCall1Ans2->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
    v_net_price_flag = lpTSCall1Ans2->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
    v_intrst_days = lpTSCall1Ans2->GetInt32(LDBIZ_INTRST_DAYS_INT);
    v_bond_rate_type = lpTSCall1Ans2->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
    v_bond_accr_intrst = lpTSCall1Ans2->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
    v_target_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
    strcpy(v_target_code, lpTSCall1Ans2->GetString(LDBIZ_TARGET_CODE_STR));
    v_target_code_stock_type = lpTSCall1Ans2->GetInt32(LDBIZ_TARGET_CODE_STOCK_TYPE_INT);
    v_target_code_asset_type = lpTSCall1Ans2->GetInt32(LDBIZ_TARGET_CODE_ASSET_TYPE_INT);
    v_trade_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
    strcpy(v_trade_code, lpTSCall1Ans2->GetString(LDBIZ_TRADE_CODE_STR));
    v_trade_code_stock_type = lpTSCall1Ans2->GetInt32(LDBIZ_TRADE_CODE_STOCK_TYPE_INT);
    v_trade_code_asset_type = lpTSCall1Ans2->GetInt32(LDBIZ_TRADE_CODE_ASSET_TYPE_INT);
    v_min_unit = lpTSCall1Ans2->GetInt32(LDBIZ_MIN_UNIT_INT);
    v_up_limit_price = lpTSCall1Ans2->GetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT);
    v_down_limit_price = lpTSCall1Ans2->GetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
    v_last_price = lpTSCall1Ans2->GetDouble(LDBIZ_LAST_PRICE_FLOAT);
    v_capit_reback_days = lpTSCall1Ans2->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans2->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    v_apply_date = lpTSCall1Ans2->GetInt32(LDBIZ_APPLY_DATE_INT);
    v_subscription_trade_mark = lpTSCall1Ans2->GetInt32(LDBIZ_SUBSCRIPTION_TRADE_MARK_INT);
    v_purchase_trade_mark = lpTSCall1Ans2->GetInt32(LDBIZ_PURCHASE_TRADE_MARK_INT);
    v_rede_trade_mark = lpTSCall1Ans2->GetInt32(LDBIZ_REDE_TRADE_MARK_INT);
    v_first_minimum_amt = lpTSCall1Ans2->GetDouble(LDBIZ_FIRST_MINIMUM_AMT_FLOAT);
    v_minimum_purchase_amt = lpTSCall1Ans2->GetDouble(LDBIZ_MINIMUM_PURCHASE_AMT_FLOAT);
    v_minimum_subscription_amt = lpTSCall1Ans2->GetDouble(LDBIZ_MINIMUM_SUBSCRIPTION_AMT_FLOAT);
    v_minimum_rede_share = lpTSCall1Ans2->GetDouble(LDBIZ_MINIMUM_REDE_SHARE_FLOAT);
    v_minimum_holding_share = lpTSCall1Ans2->GetDouble(LDBIZ_MINIMUM_HOLDING_SHARE_FLOAT);
    strcpy(v_trade_acco, lpTSCall1Ans2->GetString(LDBIZ_TRADE_ACCO_STR));


    // set @业务控制配置串# = @交易组业务控制配置串#;
    strcpy(v_busi_config_str,v_exgp_busi_config_str);

    // set @操作员编号#= @临时_操作员编号#;
    v_opor_no= v_tmp_opor_no;

    // set @业务控制串# = "11111";
    strcpy(v_busi_ctrl_str,"11111");
    //调用过程[事务_产品_交易接口_检查交易产品账户信息]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("prodT.8.21", 0);
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
    lpTSCall1Req3->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req3->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req3->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req3->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req3->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    lpTSCall1Req3->SetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT,v_up_limit_price);
    lpTSCall1Req3->SetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT,v_down_limit_price);
    lpTSCall1Req3->SetDouble(LDBIZ_LAST_PRICE_FLOAT,v_last_price);
    lpTSCall1Req3->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
    lpTSCall1Req3->SetString(LDBIZ_BUSI_CONFIG_STR_STR,v_busi_config_str);
    lpTSCall1Req3->SetString(LDBIZ_SYS_CONFIG_STR_STR,v_sys_config_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.8.21]subcall timed out!");
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
    v_exter_comm_flag = lpTSCall1Ans3->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_market_price_ratio = lpTSCall1Ans3->GetDouble(LDBIZ_MARKET_PRICE_RATIO_FLOAT);
    v_market_price_type = lpTSCall1Ans3->GetInt32(LDBIZ_MARKET_PRICE_TYPE_INT);
    v_cost_calc_type = lpTSCall1Ans3->GetInt32(LDBIZ_COST_CALC_TYPE_INT);
    v_order_market_price = lpTSCall1Ans3->GetDouble(LDBIZ_ORDER_MARKET_PRICE_FLOAT);
    v_sys_type = lpTSCall1Ans3->GetInt32(LDBIZ_SYS_TYPE_INT);
    strcpy(v_opor_no_str1, lpTSCall1Ans3->GetString(LDBIZ_OPOR_NO_STR1_STR));
    strcpy(v_opor_no_str2, lpTSCall1Ans3->GetString(LDBIZ_OPOR_NO_STR2_STR));
    strcpy(v_opor_no_str3, lpTSCall1Ans3->GetString(LDBIZ_OPOR_NO_STR3_STR));
    v_fina_limit_max = lpTSCall1Ans3->GetDouble(LDBIZ_FINA_LIMIT_MAX_FLOAT);
    v_loan_limit_max = lpTSCall1Ans3->GetDouble(LDBIZ_LOAN_LIMIT_MAX_FLOAT);
    v_asset_acco_type = lpTSCall1Ans3->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);
    v_sell_auto_back_debt = lpTSCall1Ans3->GetInt32(LDBIZ_SELL_AUTO_BACK_DEBT_INT);

    //获取股东代码
    //调用过程[事务_产品证券_交易接口_检查股东账户状态获取持仓成本]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pdsecuT.6.4", 0);
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
    lpTSCall1Req4->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req4->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.6.4]subcall timed out!");
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
    v_stock_acco_no = lpTSCall1Ans4->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans4->GetString(LDBIZ_STOCK_ACCO_STR));
    v_exgp_cost_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
    v_exgp_intrst_cost_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
    v_exgp_curr_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT);
    v_asac_cost_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
    v_asac_intrst_cost_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
    v_asac_curr_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT);

    //计算该订单的费用。

    // if @订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-融券回购》 or @订单方向# = 《订单方向-融资买入》   then
    if (v_order_dir == 1 || v_order_dir == 4 || v_order_dir == 5  )
    {
        //调用过程[事务_公共_公共接口_计算证券订单费用]
        //组织事务请求
        if(lpTSCall1Ans5)
        {
          lpTSCall1Ans5->FreeMsg();
          lpTSCall1Ans5=NULL;
        }
        lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pubT.24.203", 0);
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
        lpTSCall1Req5->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req5->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req5->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpTSCall1Req5->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpTSCall1Req5->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
        lpTSCall1Req5->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
        lpTSCall1Req5->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
        lpTSCall1Req5->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
        lpTSCall1Req5->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
        glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
        if(!lpTSCall1Ans5)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.203]subcall timed out!");
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
        v_trade_commis = lpTSCall1Ans5->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_all_fee = lpTSCall1Ans5->GetDouble(LDBIZ_ALL_FEE_FLOAT);
        v_stamp_tax = lpTSCall1Ans5->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
        v_trans_fee = lpTSCall1Ans5->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
        v_brkage_fee = lpTSCall1Ans5->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
        v_SEC_charges = lpTSCall1Ans5->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
        v_other_fee = lpTSCall1Ans5->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
        v_other_commis = lpTSCall1Ans5->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_trade_tax = lpTSCall1Ans5->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
        v_trade_cost_fee = lpTSCall1Ans5->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
        v_trade_system_use_fee = lpTSCall1Ans5->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
        v_stock_settle_fee = lpTSCall1Ans5->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);
        v_order_frozen_amt = lpTSCall1Ans5->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);

    // end if;
    }

    //调用过程[事务_交易证券_交易运维_错单修改废单回退]
    //组织事务请求
    if(lpTSCall1Ans6)
    {
      lpTSCall1Ans6->FreeMsg();
      lpTSCall1Ans6=NULL;
    }
    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdsecuT.10.74", 0);
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
    lpTSCall1Req6->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req6->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req6->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req6->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req6->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req6->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req6->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req6->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req6->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req6->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req6->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
    lpTSCall1Req6->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req6->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req6->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
    lpTSCall1Req6->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
    lpTSCall1Req6->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpTSCall1Req6->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req6->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpTSCall1Req6->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpTSCall1Req6->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req6->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req6->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req6->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req6->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req6->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
    lpTSCall1Req6->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
    lpTSCall1Req6->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
    lpTSCall1Req6->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
    lpTSCall1Req6->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
    lpTSCall1Req6->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
    lpTSCall1Req6->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
    lpTSCall1Req6->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
    lpTSCall1Req6->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    lpTSCall1Req6->SetString(LDBIZ_SYS_CONFIG_STR_STR,v_sys_config_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
    if(!lpTSCall1Ans6)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.10.74]subcall timed out!");
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
    v_strike_id = lpTSCall1Ans6->GetInt64(LDBIZ_STRIKE_ID_INT64);


    // if @指令序号# > 0 then
    if (v_comm_id > 0)
    {
        //调用过程[事务_交易证券_主推接口_获取指令混合信息]
        //组织事务请求
        if(lpTSCall1Ans7)
        {
          lpTSCall1Ans7->FreeMsg();
          lpTSCall1Ans7=NULL;
        }
        lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.3", 0);
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
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.3]subcall timed out!");
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
        v_init_date = lpTSCall1Ans7->GetInt32(LDBIZ_INIT_DATE_INT);
        v_co_no = lpTSCall1Ans7->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans7->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans7->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans7->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans7->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_out_acco, lpTSCall1Ans7->GetString(LDBIZ_OUT_ACCO_STR));
        strcpy(v_exch_crncy_type, lpTSCall1Ans7->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_stock_acco_no = lpTSCall1Ans7->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
        v_stock_code_no = lpTSCall1Ans7->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        v_stock_type = lpTSCall1Ans7->GetInt32(LDBIZ_STOCK_TYPE_INT);
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
        v_comm_appr_oper = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
        strcpy(v_comm_appr_remark, lpTSCall1Ans7->GetString(LDBIZ_COMM_APPR_REMARK_STR));
        v_basket_id = lpTSCall1Ans7->GetInt64(LDBIZ_BASKET_ID_INT64);
        v_net_price_flag = lpTSCall1Ans7->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
        v_bond_accr_intrst = lpTSCall1Ans7->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
        v_bond_rate_type = lpTSCall1Ans7->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
        strcpy(v_comm_oper_way, lpTSCall1Ans7->GetString(LDBIZ_COMM_OPER_WAY_STR));
        v_exter_comm_flag = lpTSCall1Ans7->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
        v_comm_comple_flag = lpTSCall1Ans7->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
        v_strategy_capt_qty = lpTSCall1Ans7->GetDouble(LDBIZ_STRATEGY_CAPT_QTY_FLOAT);
        v_strategy_order_qty = lpTSCall1Ans7->GetDouble(LDBIZ_STRATEGY_ORDER_QTY_FLOAT);
        strcpy(v_contra_no, lpTSCall1Ans7->GetString(LDBIZ_CONTRA_NO_STR));
        strcpy(v_comm_remark_info, lpTSCall1Ans7->GetString(LDBIZ_COMM_REMARK_INFO_STR));
        v_disp_opor = lpTSCall1Ans7->GetInt32(LDBIZ_DISP_OPOR_INT);
        v_disp_status = lpTSCall1Ans7->GetInt32(LDBIZ_DISP_STATUS_INT);
        v_read_flag = lpTSCall1Ans7->GetInt32(LDBIZ_READ_FLAG_INT);
        v_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_UPDATE_TIMES_INT);
        v_sum_comm_row_id = lpTSCall1Ans7->GetInt64(LDBIZ_SUM_COMM_ROW_ID_INT64);
        v_sum_comm_co_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_CO_NO_INT);
        v_sum_comm_pd_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_PD_NO_INT);
        v_sum_comm_exch_group_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_EXCH_GROUP_NO_INT);
        v_sum_comm_asset_acco_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_ASSET_ACCO_NO_INT);
        v_sum_comm_pass_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_PASS_NO_INT);
        strcpy(v_sum_comm_out_acco, lpTSCall1Ans7->GetString(LDBIZ_SUM_COMM_OUT_ACCO_STR));
        strcpy(v_sum_comm_exch_crncy_type, lpTSCall1Ans7->GetString(LDBIZ_SUM_COMM_EXCH_CRNCY_TYPE_STR));
        v_sum_comm_stock_code_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_STOCK_CODE_NO_INT);
        v_sum_comm_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_DATE_INT);
        v_sum_comm_time = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_TIME_INT);
        v_sum_comm_batch_no = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_BATCH_NO_INT);
        v_sum_comm_opor = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_OPOR_INT);
        v_sum_comm_executor = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_EXECUTOR_INT);
        v_sum_comm_dir = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_DIR_INT);
        v_sum_comm_limit_price = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_LIMIT_PRICE_FLOAT);
        v_sum_comm_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_QTY_FLOAT);
        v_sum_comm_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_AMT_FLOAT);
        v_sum_comm_order_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_ORDER_QTY_FLOAT);
        v_sum_comm_cancel_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_CANCEL_QTY_FLOAT);
        v_sum_comm_await_cancel_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_AWAIT_CANCEL_QTY_FLOAT);
        v_sum_comm_strike_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_STRIKE_AMT_FLOAT);
        v_sum_comm_strike_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_STRIKE_QTY_FLOAT);
        strcpy(v_sum_comm_strike_status, lpTSCall1Ans7->GetString(LDBIZ_SUM_COMM_STRIKE_STATUS_STR));
        strcpy(v_comm_sum_status, lpTSCall1Ans7->GetString(LDBIZ_COMM_SUM_STATUS_STR));
        v_sum_comm_begin_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_BEGIN_DATE_INT);
        v_sum_comm_end_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_END_DATE_INT);
        v_sum_comm_begin_time = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_BEGIN_TIME_INT);
        v_sum_comm_end_time = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_END_TIME_INT);
        v_sum_comm_comple_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_COMPLE_DATE_INT);
        v_sum_comm_comple_time = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_COMPLE_TIME_INT);
        v_sum_comm_max_comm_comple_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_DATE_INT);
        v_sum_comm_max_comm_comple_time = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_TIME_INT);
        v_sum_comm_appr_date = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_APPR_DATE_INT);
        v_sum_comm_appr_time = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_APPR_TIME_INT);
        v_sum_comm_appr_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_APPR_QTY_FLOAT);
        strcpy(v_comm_sum_approve_status, lpTSCall1Ans7->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
        v_sum_comm_basket_id = lpTSCall1Ans7->GetInt64(LDBIZ_SUM_COMM_BASKET_ID_INT64);
        v_sum_comm_net_price_flag = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_NET_PRICE_FLAG_INT);
        v_sum_comm_bond_accr_intrst = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_COMM_BOND_ACCR_INTRST_FLOAT);
        v_sum_comm_bond_rate_type = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_BOND_RATE_TYPE_INT);
        strcpy(v_sum_comm_oper_way, lpTSCall1Ans7->GetString(LDBIZ_SUM_COMM_OPER_WAY_STR));
        v_sum_comm_exter_comm_flag = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_EXTER_COMM_FLAG_INT);
        v_sum_buy_order_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_BUY_ORDER_QTY_FLOAT);
        v_sum_sell_order_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_SELL_ORDER_QTY_FLOAT);
        v_sum_buy_comm_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_BUY_COMM_QTY_FLOAT);
        v_sum_sell_comm_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_SELL_COMM_QTY_FLOAT);
        v_sum_buy_strike_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_BUY_STRIKE_QTY_FLOAT);
        v_sum_sell_strike_qty = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_SELL_STRIKE_QTY_FLOAT);
        v_sum_buy_strike_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_BUY_STRIKE_AMT_FLOAT);
        v_sum_sell_strike_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_SELL_STRIKE_AMT_FLOAT);
        v_sum_buy_comm_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_BUY_COMM_AMT_FLOAT);
        v_sum_sell_comm_amt = lpTSCall1Ans7->GetDouble(LDBIZ_SUM_SELL_COMM_AMT_FLOAT);
        strcpy(v_sum_comm_remark_info, lpTSCall1Ans7->GetString(LDBIZ_SUM_COMM_REMARK_INFO_STR));
        v_sum_comm_update_times = lpTSCall1Ans7->GetInt32(LDBIZ_SUM_COMM_UPDATE_TIMES_INT);
        strcpy(v_acco_concat_info, lpTSCall1Ans7->GetString(LDBIZ_ACCO_CONCAT_INFO_STR));
        strcpy(v_combo_code, lpTSCall1Ans7->GetString(LDBIZ_COMBO_CODE_STR));


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

    //订单及订单汇总的主推

    // if @订单序号# > 0 then
    if (v_order_id > 0)
    {
        //调用过程[事务_交易证券_主推接口_获取订单信息]
        //组织事务请求
        if(lpTSCall1Ans8)
        {
          lpTSCall1Ans8->FreeMsg();
          lpTSCall1Ans8=NULL;
        }
        lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.45", 0);
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
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.45]subcall timed out!");
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
        v_co_no = lpTSCall1Ans8->GetInt32(LDBIZ_CO_NO_INT);
        v_busi_opor_no = lpTSCall1Ans8->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
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
        v_trade_code_no = lpTSCall1Ans8->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
        v_target_code_no = lpTSCall1Ans8->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
        v_stock_type = lpTSCall1Ans8->GetInt32(LDBIZ_STOCK_TYPE_INT);
        v_asset_type = lpTSCall1Ans8->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_external_no = lpTSCall1Ans8->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
        v_comm_id = lpTSCall1Ans8->GetInt64(LDBIZ_COMM_ID_INT64);
        v_comm_batch_no = lpTSCall1Ans8->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
        v_comm_opor = lpTSCall1Ans8->GetInt32(LDBIZ_COMM_OPOR_INT);
        v_report_date = lpTSCall1Ans8->GetInt32(LDBIZ_REPORT_DATE_INT);
        v_report_time = lpTSCall1Ans8->GetInt32(LDBIZ_REPORT_TIME_INT);
        strcpy(v_report_no, lpTSCall1Ans8->GetString(LDBIZ_REPORT_NO_STR));
        v_order_date = lpTSCall1Ans8->GetInt32(LDBIZ_ORDER_DATE_INT);
        v_order_time = lpTSCall1Ans8->GetInt32(LDBIZ_ORDER_TIME_INT);
        v_order_batch_no = lpTSCall1Ans8->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
        v_order_dir = lpTSCall1Ans8->GetInt32(LDBIZ_ORDER_DIR_INT);
        v_price_type = lpTSCall1Ans8->GetInt32(LDBIZ_PRICE_TYPE_INT);
        v_order_price = lpTSCall1Ans8->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        strcpy(v_order_status, lpTSCall1Ans8->GetString(LDBIZ_ORDER_STATUS_STR));
        v_wtdraw_qty = lpTSCall1Ans8->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans8->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_strike_qty = lpTSCall1Ans8->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_all_fee = lpTSCall1Ans8->GetDouble(LDBIZ_ALL_FEE_FLOAT);
        v_stamp_tax = lpTSCall1Ans8->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
        v_trans_fee = lpTSCall1Ans8->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
        v_brkage_fee = lpTSCall1Ans8->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
        v_SEC_charges = lpTSCall1Ans8->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
        v_other_fee = lpTSCall1Ans8->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
        v_trade_commis = lpTSCall1Ans8->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_other_commis = lpTSCall1Ans8->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_trade_tax = lpTSCall1Ans8->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
        v_trade_cost_fee = lpTSCall1Ans8->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
        v_trade_system_use_fee = lpTSCall1Ans8->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
        v_stock_settle_fee = lpTSCall1Ans8->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);
        v_net_price_flag = lpTSCall1Ans8->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
        v_intrst_days = lpTSCall1Ans8->GetInt32(LDBIZ_INTRST_DAYS_INT);
        v_par_value = lpTSCall1Ans8->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
        v_bond_accr_intrst = lpTSCall1Ans8->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
        v_bond_rate_type = lpTSCall1Ans8->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
        v_strike_bond_accr_intrst = lpTSCall1Ans8->GetDouble(LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
        v_impawn_ratio = lpTSCall1Ans8->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
        v_order_frozen_amt = lpTSCall1Ans8->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
        v_order_frozen_qty = lpTSCall1Ans8->GetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT);
        strcpy(v_rsp_info, lpTSCall1Ans8->GetString(LDBIZ_RSP_INFO_STR));
        v_compli_trig_id = lpTSCall1Ans8->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);
        strcpy(v_remark_info, lpTSCall1Ans8->GetString(LDBIZ_REMARK_INFO_STR));
        v_cost_calc_type = lpTSCall1Ans8->GetInt32(LDBIZ_COST_CALC_TYPE_INT);
        strcpy(v_order_oper_way, lpTSCall1Ans8->GetString(LDBIZ_ORDER_OPER_WAY_STR));
        v_exter_comm_flag = lpTSCall1Ans8->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
        v_record_valid_flag = lpTSCall1Ans8->GetInt32(LDBIZ_RECORD_VALID_FLAG_INT);
        strcpy(v_combo_code, lpTSCall1Ans8->GetString(LDBIZ_COMBO_CODE_STR));
        v_combo_posi_id = lpTSCall1Ans8->GetInt64(LDBIZ_COMBO_POSI_ID_INT64);
        v_strategy_id = lpTSCall1Ans8->GetInt64(LDBIZ_STRATEGY_ID_INT64);
        v_asset_acco_type = lpTSCall1Ans8->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);
        strcpy(v_contra_no, lpTSCall1Ans8->GetString(LDBIZ_CONTRA_NO_STR));
        v_update_times = lpTSCall1Ans8->GetInt32(LDBIZ_UPDATE_TIMES_INT);


        // set @操作员编号# = @业务操作员编号#;
        v_opor_no = v_busi_opor_no;

        // set @当笔成交价格#=0;
        v_curr_strike_price=0;

        // set @当笔成交金额#=0;
        v_curr_strike_amt=0;

        // set @当笔成交数量#=0;
        v_curr_strike_qty=0;

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


        // if @订单批号# > 0 then
        if (v_order_batch_no > 0)
        {
            //调用过程[事务_交易证券_主推接口_获取订单汇总信息]
            //组织事务请求
            if(lpTSCall1Ans9)
            {
              lpTSCall1Ans9->FreeMsg();
              lpTSCall1Ans9=NULL;
            }
            lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.47", 0);
            lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req9->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpTSCall1Req9->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
            lpTSCall1Req9->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
            glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
            if(!lpTSCall1Ans9)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.47]subcall timed out!");
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
            v_sum_order_row_id = lpTSCall1Ans9->GetInt64(LDBIZ_SUM_ORDER_ROW_ID_INT64);
            v_sum_order_opor_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_OPOR_NO_INT);
            v_sum_order_co_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_CO_NO_INT);
            v_sum_order_pd_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_PD_NO_INT);
            v_sum_order_exch_group_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_EXCH_GROUP_NO_INT);
            v_sum_order_asset_acco_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_ASSET_ACCO_NO_INT);
            v_sum_order_pass_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_PASS_NO_INT);
            strcpy(v_sum_order_exch_crncy_type, lpTSCall1Ans9->GetString(LDBIZ_SUM_ORDER_EXCH_CRNCY_TYPE_STR));
            v_sum_order_stock_code_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_STOCK_CODE_NO_INT);
            v_sum_order_trade_code_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_TRADE_CODE_NO_INT);
            v_sum_order_target_code_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_TARGET_CODE_NO_INT);
            v_sum_order_external_no = lpTSCall1Ans9->GetInt64(LDBIZ_SUM_ORDER_EXTERNAL_NO_INT64);
            v_sum_order_date = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_DATE_INT);
            v_sum_order_batch_no = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_BATCH_NO_INT);
            v_sum_order_dir = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_DIR_INT);
            v_sum_order_price_type = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_PRICE_TYPE_INT);
            v_sum_order_price = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_PRICE_FLOAT);
            v_sum_order_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_QTY_FLOAT);
            strcpy(v_order_sum_status, lpTSCall1Ans9->GetString(LDBIZ_ORDER_SUM_STATUS_STR));
            v_sum_order_wtdraw_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_WTDRAW_QTY_FLOAT);
            v_sum_order_waste_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_WASTE_QTY_FLOAT);
            v_sum_order_strike_amt = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_STRIKE_AMT_FLOAT);
            v_sum_order_strike_qty = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_STRIKE_QTY_FLOAT);
            v_sum_order_strike_aver_price = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_STRIKE_AVER_PRICE_FLOAT);
            v_sum_order_net_price_flag = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_NET_PRICE_FLAG_INT);
            v_sum_order_bond_accr_intrst = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_BOND_ACCR_INTRST_FLOAT);
            v_sum_order_bond_rate_type = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_BOND_RATE_TYPE_INT);
            v_sum_order_par_value = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_PAR_VALUE_FLOAT);
            v_sum_order_impawn_ratio = lpTSCall1Ans9->GetDouble(LDBIZ_SUM_ORDER_IMPAWN_RATIO_FLOAT);
            strcpy(v_sum_order_oper_way, lpTSCall1Ans9->GetString(LDBIZ_SUM_ORDER_OPER_WAY_STR));
            v_sum_order_update_times = lpTSCall1Ans9->GetInt32(LDBIZ_SUM_ORDER_UPDATE_TIMES_INT);


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

    // end if;
    }

    //质押提交和质押转回，要推交易代码和标准券代码

    // if @订单方向# = 《订单方向-质押提交》 or @订单方向# = 《订单方向-质押转回》 then
    if (v_order_dir == 21 || v_order_dir == 22)
    {
      //调用过程[事务_交易证券_主推接口_获取资金和质押持仓信息]
      //组织事务请求
      if(lpTSCall1Ans10)
      {
        lpTSCall1Ans10->FreeMsg();
        lpTSCall1Ans10=NULL;
      }
      lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.28", 0);
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
      lpTSCall1Req10->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
      lpTSCall1Req10->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      lpTSCall1Req10->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
      glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
      if(!lpTSCall1Ans10)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.28]subcall timed out!");
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
      v_exgp_target_posi_id = lpTSCall1Ans10->GetInt64(LDBIZ_EXGP_TARGET_POSI_ID_INT64);
      v_exgp_target_frozen_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TARGET_FROZEN_QTY_FLOAT);
      v_exgp_target_unfroz_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TARGET_UNFROZ_QTY_FLOAT);
      v_exgp_target_comm_frozen_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TARGET_COMM_FROZEN_QTY_FLOAT);
      v_exgp_target_comm_unfroz_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TARGET_COMM_UNFROZ_QTY_FLOAT);
      v_exgp_target_comm_capt_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TARGET_COMM_CAPT_QTY_FLOAT);
      v_exgp_target_comm_releas_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TARGET_COMM_RELEAS_QTY_FLOAT);
      v_exgp_target_trade_frozen_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TARGET_TRADE_FROZEN_QTY_FLOAT);
      v_exgp_target_trade_unfroz_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TARGET_TRADE_UNFROZ_QTY_FLOAT);
      v_exgp_target_trade_capt_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TARGET_TRADE_CAPT_QTY_FLOAT);
      v_exgp_target_trade_releas_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TARGET_TRADE_RELEAS_QTY_FLOAT);
      v_exgp_target_strike_capt_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_CAPT_QTY_FLOAT);
      v_exgp_target_strike_releas_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_RELEAS_QTY_FLOAT);
      v_exgp_target_strike_frozen_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_FROZEN_QTY_FLOAT);
      v_exgp_target_strike_unfroz_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TARGET_STRIKE_UNFROZ_QTY_FLOAT);
      v_exgp_target_realize_pandl = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TARGET_REALIZE_PANDL_FLOAT);
      v_exgp_target_cost_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TARGET_COST_AMT_FLOAT);
      v_exgp_target_intrst_cost_amt = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TARGET_INTRST_COST_AMT_FLOAT);
      v_exgp_target_intrst_pandl = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_TARGET_INTRST_PANDL_FLOAT);
      v_exgp_target_posi_update_times = lpTSCall1Ans10->GetInt32(LDBIZ_EXGP_TARGET_POSI_UPDATE_TIMES_INT);
      v_asac_target_posi_id = lpTSCall1Ans10->GetInt64(LDBIZ_ASAC_TARGET_POSI_ID_INT64);
      v_asac_target_frozen_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TARGET_FROZEN_QTY_FLOAT);
      v_asac_target_unfroz_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TARGET_UNFROZ_QTY_FLOAT);
      v_asac_target_comm_frozen_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TARGET_COMM_FROZEN_QTY_FLOAT);
      v_asac_target_comm_unfroz_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TARGET_COMM_UNFROZ_QTY_FLOAT);
      v_asac_target_comm_capt_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TARGET_COMM_CAPT_QTY_FLOAT);
      v_asac_target_comm_releas_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TARGET_COMM_RELEAS_QTY_FLOAT);
      v_asac_target_trade_frozen_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TARGET_TRADE_FROZEN_QTY_FLOAT);
      v_asac_target_trade_unfroz_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TARGET_TRADE_UNFROZ_QTY_FLOAT);
      v_asac_target_trade_capt_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TARGET_TRADE_CAPT_QTY_FLOAT);
      v_asac_target_trade_releas_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TARGET_TRADE_RELEAS_QTY_FLOAT);
      v_asac_target_strike_capt_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_CAPT_QTY_FLOAT);
      v_asac_target_strike_releas_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_RELEAS_QTY_FLOAT);
      v_asac_target_strike_frozen_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_FROZEN_QTY_FLOAT);
      v_asac_target_strike_unfroz_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TARGET_STRIKE_UNFROZ_QTY_FLOAT);
      v_asac_target_realize_pandl = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TARGET_REALIZE_PANDL_FLOAT);
      v_asac_target_cost_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TARGET_COST_AMT_FLOAT);
      v_asac_target_intrst_cost_amt = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TARGET_INTRST_COST_AMT_FLOAT);
      v_asac_target_intrst_pandl = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_TARGET_INTRST_PANDL_FLOAT);
      v_asac_target_posi_update_times = lpTSCall1Ans10->GetInt32(LDBIZ_ASAC_TARGET_POSI_UPDATE_TIMES_INT);
      v_exgp_put_impawn_qty = lpTSCall1Ans10->GetDouble(LDBIZ_EXGP_PUT_IMPAWN_QTY_FLOAT);
      v_asac_put_impawn_qty = lpTSCall1Ans10->GetDouble(LDBIZ_ASAC_PUT_IMPAWN_QTY_FLOAT);


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
    // else if @订单方向# = 《订单方向-融资回购》 or @订单方向# = 《订单方向-融券回购》 then
    else if (v_order_dir == 3 || v_order_dir == 4)
    {

      // set @证券代码编号# = @标的代码编号#;
      v_stock_code_no = v_target_code_no;
      //调用过程[事务_交易证券_主推接口_获取资金持仓信息]
      //组织事务请求
      if(lpTSCall1Ans11)
      {
        lpTSCall1Ans11->FreeMsg();
        lpTSCall1Ans11=NULL;
      }
      lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.13", 0);
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
      lpTSCall1Req11->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpTSCall1Req11->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
      lpTSCall1Req11->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
      if(!lpTSCall1Ans11)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.13]subcall timed out!");
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
      v_exgp_cash_id = lpTSCall1Ans11->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
      v_exgp_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
      v_exgp_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
      v_exgp_comm_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
      v_exgp_comm_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
      v_exgp_comm_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
      v_exgp_comm_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
      v_exgp_trade_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT);
      v_exgp_trade_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT);
      v_exgp_trade_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
      v_exgp_trade_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
      v_exgp_strike_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
      v_exgp_strike_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
      v_exgp_cash_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
      v_exgp_posi_id = lpTSCall1Ans11->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
      v_exgp_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
      v_exgp_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
      v_exgp_comm_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT);
      v_exgp_comm_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT);
      v_exgp_comm_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT);
      v_exgp_comm_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
      v_exgp_trade_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT);
      v_exgp_trade_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT);
      v_exgp_trade_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT);
      v_exgp_trade_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
      v_exgp_strike_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT);
      v_exgp_strike_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
      v_exgp_strike_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT);
      v_exgp_strike_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT);
      v_exgp_realize_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
      v_exgp_cost_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
      v_exgp_intrst_cost_amt = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
      v_exgp_intrst_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
      v_exgp_posi_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
      v_asac_cash_id = lpTSCall1Ans11->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
      v_asac_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
      v_asac_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
      v_asac_comm_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
      v_asac_comm_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
      v_asac_comm_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
      v_asac_comm_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
      v_asac_trade_frozen_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT);
      v_asac_trade_unfroz_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT);
      v_asac_trade_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
      v_asac_trade_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
      v_asac_strike_capt_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
      v_asac_strike_releas_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
      v_asac_cash_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);
      v_asac_posi_id = lpTSCall1Ans11->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
      v_asac_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
      v_asac_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
      v_asac_comm_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT);
      v_asac_comm_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT);
      v_asac_comm_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT);
      v_asac_comm_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
      v_asac_trade_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT);
      v_asac_trade_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT);
      v_asac_trade_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT);
      v_asac_trade_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
      v_asac_strike_capt_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT);
      v_asac_strike_releas_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
      v_asac_strike_frozen_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT);
      v_asac_strike_unfroz_qty = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT);
      v_asac_realize_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
      v_asac_cost_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
      v_asac_intrst_cost_amt = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
      v_asac_intrst_pandl = lpTSCall1Ans11->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
      v_asac_posi_update_times = lpTSCall1Ans11->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


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

      //set @回购成交序号// = @成交序号//;
      //[事务_交易证券_主推接口_获取债券回购信息]
      //[主动推送][secu.exgpbondrepo][证券主推_持仓_交易组债券回购主推消息]
    }
    // else
    else
    {

      //调用过程[事务_交易证券_主推接口_获取资金持仓信息]
      //组织事务请求
      if(lpTSCall1Ans12)
      {
        lpTSCall1Ans12->FreeMsg();
        lpTSCall1Ans12=NULL;
      }
      lpTSCall1Req12=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.13", 0);
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
      lpTSCall1Req12->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
      lpTSCall1Req12->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
      lpTSCall1Req12->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
      glpTSSubcallSerives->SubCall(lpTSCall1Req12, &lpTSCall1Ans12, 5000);
      if(!lpTSCall1Ans12)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.13]subcall timed out!");
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
      v_exgp_cash_id = lpTSCall1Ans12->GetInt64(LDBIZ_EXGP_CASH_ID_INT64);
      v_exgp_frozen_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_FROZEN_AMT_FLOAT);
      v_exgp_unfroz_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_UNFROZ_AMT_FLOAT);
      v_exgp_comm_frozen_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COMM_FROZEN_AMT_FLOAT);
      v_exgp_comm_unfroz_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_AMT_FLOAT);
      v_exgp_comm_capt_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COMM_CAPT_AMT_FLOAT);
      v_exgp_comm_releas_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COMM_RELEAS_AMT_FLOAT);
      v_exgp_trade_frozen_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_AMT_FLOAT);
      v_exgp_trade_unfroz_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_AMT_FLOAT);
      v_exgp_trade_capt_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TRADE_CAPT_AMT_FLOAT);
      v_exgp_trade_releas_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_AMT_FLOAT);
      v_exgp_strike_capt_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_AMT_FLOAT);
      v_exgp_strike_releas_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_AMT_FLOAT);
      v_exgp_cash_update_times = lpTSCall1Ans12->GetInt32(LDBIZ_EXGP_CASH_UPDATE_TIMES_INT);
      v_exgp_posi_id = lpTSCall1Ans12->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
      v_exgp_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
      v_exgp_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
      v_exgp_comm_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COMM_FROZEN_QTY_FLOAT);
      v_exgp_comm_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COMM_UNFROZ_QTY_FLOAT);
      v_exgp_comm_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COMM_CAPT_QTY_FLOAT);
      v_exgp_comm_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COMM_RELEAS_QTY_FLOAT);
      v_exgp_trade_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TRADE_FROZEN_QTY_FLOAT);
      v_exgp_trade_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TRADE_UNFROZ_QTY_FLOAT);
      v_exgp_trade_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TRADE_CAPT_QTY_FLOAT);
      v_exgp_trade_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_TRADE_RELEAS_QTY_FLOAT);
      v_exgp_strike_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_STRIKE_CAPT_QTY_FLOAT);
      v_exgp_strike_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_STRIKE_RELEAS_QTY_FLOAT);
      v_exgp_strike_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_STRIKE_FROZEN_QTY_FLOAT);
      v_exgp_strike_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_STRIKE_UNFROZ_QTY_FLOAT);
      v_exgp_realize_pandl = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
      v_exgp_cost_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
      v_exgp_intrst_cost_amt = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
      v_exgp_intrst_pandl = lpTSCall1Ans12->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
      v_exgp_posi_update_times = lpTSCall1Ans12->GetInt32(LDBIZ_EXGP_POSI_UPDATE_TIMES_INT);
      v_asac_cash_id = lpTSCall1Ans12->GetInt64(LDBIZ_ASAC_CASH_ID_INT64);
      v_asac_frozen_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_FROZEN_AMT_FLOAT);
      v_asac_unfroz_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_UNFROZ_AMT_FLOAT);
      v_asac_comm_frozen_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COMM_FROZEN_AMT_FLOAT);
      v_asac_comm_unfroz_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_AMT_FLOAT);
      v_asac_comm_capt_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COMM_CAPT_AMT_FLOAT);
      v_asac_comm_releas_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COMM_RELEAS_AMT_FLOAT);
      v_asac_trade_frozen_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_AMT_FLOAT);
      v_asac_trade_unfroz_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_AMT_FLOAT);
      v_asac_trade_capt_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TRADE_CAPT_AMT_FLOAT);
      v_asac_trade_releas_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_AMT_FLOAT);
      v_asac_strike_capt_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_AMT_FLOAT);
      v_asac_strike_releas_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_AMT_FLOAT);
      v_asac_cash_update_times = lpTSCall1Ans12->GetInt32(LDBIZ_ASAC_CASH_UPDATE_TIMES_INT);
      v_asac_posi_id = lpTSCall1Ans12->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
      v_asac_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
      v_asac_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
      v_asac_comm_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COMM_FROZEN_QTY_FLOAT);
      v_asac_comm_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COMM_UNFROZ_QTY_FLOAT);
      v_asac_comm_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COMM_CAPT_QTY_FLOAT);
      v_asac_comm_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COMM_RELEAS_QTY_FLOAT);
      v_asac_trade_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TRADE_FROZEN_QTY_FLOAT);
      v_asac_trade_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TRADE_UNFROZ_QTY_FLOAT);
      v_asac_trade_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TRADE_CAPT_QTY_FLOAT);
      v_asac_trade_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_TRADE_RELEAS_QTY_FLOAT);
      v_asac_strike_capt_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_STRIKE_CAPT_QTY_FLOAT);
      v_asac_strike_releas_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_STRIKE_RELEAS_QTY_FLOAT);
      v_asac_strike_frozen_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_STRIKE_FROZEN_QTY_FLOAT);
      v_asac_strike_unfroz_qty = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_STRIKE_UNFROZ_QTY_FLOAT);
      v_asac_realize_pandl = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
      v_asac_cost_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
      v_asac_intrst_cost_amt = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
      v_asac_intrst_pandl = lpTSCall1Ans12->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
      v_asac_posi_update_times = lpTSCall1Ans12->GetInt32(LDBIZ_ASAC_POSI_UPDATE_TIMES_INT);


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

