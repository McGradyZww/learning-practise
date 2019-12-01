﻿#include <Include/ld_db_interface.h>
#include <Include/modules_id.h>
#include <Include/tag_def.h>
#include <Include/ts_subcall_interface.h>
#include <Include/fastmsg_factory_interface.h>

#include <Include/comexport.h>
#include <Include/biz_tag_def.h>
#include <pub/ldstring.h>
#include <pub/lddate.h>
#include <math.h>

ITS_Subcall_interface* glpTSSubcallSerives = NULL;
IFastmsgFactory_Interface* glpFastMsgFactory = NULL;

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

API_EXPORT void LD_CALL_MODE Onload(char*, Icontainer_interface* lpContainer)
{
    IUnKnown* lpProcessor = lpContainer->GetMouleByName(MODULE_PROCESSOR);
    IUnKnown* lpTSSubcallSerives = NULL;
    lpProcessor->QueryInterface(TS_SUBCALL_INTERFACE, &lpTSSubcallSerives);
    glpTSSubcallSerives = (ITS_Subcall_interface*)lpTSSubcallSerives;
    glpFastMsgFactory = (IFastmsgFactory_Interface*)lpContainer->GetMouleByName(MODULE_FASTMSG);

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
        strcpy(bizFuncInfo->szFuncName, "clfutuL.2.1");
        bizFuncInfo->lpFunc = fnFunc0;
    }
    else if (iFunIndex==1)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.2.2");
        bizFuncInfo->lpFunc = fnFunc1;
    }
    else if (iFunIndex==2)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.2.6");
        bizFuncInfo->lpFunc = fnFunc2;
    }
    else if (iFunIndex==3)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.2.9");
        bizFuncInfo->lpFunc = fnFunc3;
    }
    else if (iFunIndex==4)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.2.21");
        bizFuncInfo->lpFunc = fnFunc4;
    }
    else if (iFunIndex==5)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.2.24");
        bizFuncInfo->lpFunc = fnFunc5;
    }
    else if (iFunIndex==6)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.2.37");
        bizFuncInfo->lpFunc = fnFunc6;
    }
    else if (iFunIndex==7)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.2.38");
        bizFuncInfo->lpFunc = fnFunc7;
    }
    else if (iFunIndex==8)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.2.58");
        bizFuncInfo->lpFunc = fnFunc8;
    }
    else if (iFunIndex==9)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.2.61");
        bizFuncInfo->lpFunc = fnFunc9;
    }
    else if (iFunIndex==10)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.2.62");
        bizFuncInfo->lpFunc = fnFunc10;
    }
    else if (iFunIndex==11)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.2.101");
        bizFuncInfo->lpFunc = fnFunc11;
    }
    else if (iFunIndex==12)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.2.103");
        bizFuncInfo->lpFunc = fnFunc12;
    }
    else if (iFunIndex==13)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.2.104");
        bizFuncInfo->lpFunc = fnFunc13;
    }
    else if (iFunIndex==14)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.2.107");
        bizFuncInfo->lpFunc = fnFunc14;
    }
    else if (iFunIndex==15)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.2.108");
        bizFuncInfo->lpFunc = fnFunc15;
    }
    else if (iFunIndex==16)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.2.109");
        bizFuncInfo->lpFunc = fnFunc16;
    }
    else if (iFunIndex==17)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.2.110");
        bizFuncInfo->lpFunc = fnFunc17;
    }
    else if (iFunIndex==18)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.2.111");
        bizFuncInfo->lpFunc = fnFunc18;
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

//逻辑_清算期货_清算_清算准备
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
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_record_count;
    char v_deal_info[256];
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
    v_record_count=0;
    strcpy(v_deal_info, " ");
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

    //调用过程[事务_清算期货_清算_清算准备]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clfutuT.2.2", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.2]subcall timed out!");
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
    v_record_count = lpTSCall1Ans1->GetInt32(LDBIZ_RECORD_COUNT_INT);
    strcpy(v_deal_info, lpTSCall1Ans1->GetString(LDBIZ_DEAL_INFO_STR));


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
    lpOutBizMsg->SetInt32(LDBIZ_RECORD_COUNT_INT,v_record_count);
    lpOutBizMsg->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    return iRet;
}

//逻辑_清算期货_清算_转入持仓记录
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
    int64 v_row_id;
    char v_deal_info[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_futu_acco_no;
    int v_contrc_code_no;
    int v_lngsht_type;
    int v_hedge_type;
    int v_contrc_type;
    int v_contrc_unit;
    char v_crncy_type[4];
    double v_begin_qty;
    double v_curr_qty;
    double v_pre_settle_price;
    char v_comb_code[7];
    double v_open_amount;
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
    v_row_id=0;
    strcpy(v_deal_info, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_futu_acco_no=0;
    v_contrc_code_no=0;
    v_lngsht_type=0;
    v_hedge_type=0;
    v_contrc_type=0;
    v_contrc_unit=0;
    strcpy(v_crncy_type, "CNY");
    v_begin_qty=0;
    v_curr_qty=0;
    v_pre_settle_price=0;
    strcpy(v_comb_code, " ");
    v_open_amount=0;
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

    //单记录转入方式，以便前台并发处理
    //调用过程[事务_产品期货_清算接口_更新获取交易组持仓信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdfutuT.5.80", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.5.80]subcall timed out!");
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
    v_futu_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    v_contrc_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_lngsht_type = lpTSCall1Ans1->GetInt32(LDBIZ_LNGSHT_TYPE_INT);
    v_hedge_type = lpTSCall1Ans1->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_contrc_type = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_unit = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_UNIT_INT);
    strcpy(v_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_CRNCY_TYPE_STR));
    v_begin_qty = lpTSCall1Ans1->GetDouble(LDBIZ_BEGIN_QTY_FLOAT);
    v_curr_qty = lpTSCall1Ans1->GetDouble(LDBIZ_CURR_QTY_FLOAT);
    v_pre_settle_price = lpTSCall1Ans1->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
    strcpy(v_comb_code, lpTSCall1Ans1->GetString(LDBIZ_COMB_CODE_STR));
    v_open_amount = lpTSCall1Ans1->GetDouble(LDBIZ_OPEN_AMOUNT_FLOAT);


    // if  @记录个数# = 0 then
    if ( v_record_count == 0)
    {

        // set @错误编码# = "0";
        strcpy(v_error_code,"0");

        // set @错误信息# = " ";
        strcpy(v_error_info," ");
        // leave label_pro;
        goto END;

    // end if;
    }

    //调用过程[事务_清算期货_清算_转入持仓记录]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("clfutuT.2.1", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req2->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpTSCall1Req2->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req2->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req2->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req2->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req2->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
    lpTSCall1Req2->SetDouble(LDBIZ_CURR_QTY_FLOAT,v_curr_qty);
    lpTSCall1Req2->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpTSCall1Req2->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    lpTSCall1Req2->SetDouble(LDBIZ_OPEN_AMOUNT_FLOAT,v_open_amount);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.1]subcall timed out!");
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


    // if @错误编码# <> "0" then
    if (strcmp(v_error_code , "0")!=0)
    {

        // set @处理信息# = concat("转入持仓失败: 错误编码=", @错误编码#,"错误信息=", @错误信息#);
        snprintf(v_deal_info,sizeof(v_deal_info),"%s%s%s%s","转入持仓失败: 错误编码=",v_error_code,"错误信息=",v_error_info);
        //调用过程[事务_清算期货_清算_记录处理信息]
        //组织事务请求
        if(lpTSCall1Ans3)
        {
          lpTSCall1Ans3->FreeMsg();
          lpTSCall1Ans3=NULL;
        }
        lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("clfutuT.2.81", 0);
        lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req3->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req3->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
        if(!lpTSCall1Ans3)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.81]subcall timed out!");
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


        // set @处理标志# = 《处理标志-处理失败》;
        v_deal_flag = 4;
        //调用过程[事务_产品期货_清算接口_设置持仓记录处理标志]
        //组织事务请求
        if(lpTSCall1Ans4)
        {
          lpTSCall1Ans4->FreeMsg();
          lpTSCall1Ans4=NULL;
        }
        lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pdfutuT.5.82", 0);
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
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.5.82]subcall timed out!");
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
    lpOutBizMsg->SetInt32(LDBIZ_RECORD_COUNT_INT,v_record_count);
    lpOutBizMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpOutBizMsg->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
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

//逻辑_清算期货_清算_转入订单记录
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
    int v_qry_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_record_count;
    int64 v_row_id;
    char v_deal_info[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    char v_crncy_type[4];
    int v_exch_no;
    int v_futu_acco_no;
    char v_futu_acco[17];
    int v_contrc_code_no;
    char v_contrc_code[7];
    int v_asset_type;
    int v_contrc_type;
    int v_contrc_unit;
    int64 v_external_no;
    int64 v_comm_id;
    int v_comm_batch_no;
    int v_comm_opor;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_batch_no;
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
    double v_all_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_rece_margin;
    char v_comb_code[7];
    double v_margin_ratio;
    char v_rsp_info[256];
    int64 v_compli_trig_id;
    int v_strike_date;
    double v_fee_qty;
    double v_fee_price;
    char v_exch_crncy_type[4];
    double v_exch_rate;
    double v_service_fee;
    double v_deli_fee;
    double v_other_fee;
    double v_out_rece_margin;
    double v_out_brkage_commis;
    double v_out_service_fee;
    double v_out_report_fee;
    double v_out_cancel_fee;
    double v_out_deli_fee;
    double v_out_other_fee;
    double v_out_other_commis;
    int v_deal_flag;
    int v_order_no;
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
    strcpy(v_deal_info, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_crncy_type, "CNY");
    v_exch_no=0;
    v_futu_acco_no=0;
    strcpy(v_futu_acco, " ");
    v_contrc_code_no=0;
    strcpy(v_contrc_code, " ");
    v_asset_type=0;
    v_contrc_type=0;
    v_contrc_unit=0;
    v_external_no=0;
    v_comm_id=0;
    v_comm_batch_no=0;
    v_comm_opor=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_batch_no=0;
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
    v_all_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_rece_margin=0;
    strcpy(v_comb_code, " ");
    v_margin_ratio=0;
    strcpy(v_rsp_info, " ");
    v_compli_trig_id=0;
    v_strike_date=0;
    v_fee_qty=0;
    v_fee_price=0;
    strcpy(v_exch_crncy_type, "CNY");
    v_exch_rate=0;
    v_service_fee=0;
    v_deli_fee=0;
    v_other_fee=0;
    v_out_rece_margin=0;
    v_out_brkage_commis=0;
    v_out_service_fee=0;
    v_out_report_fee=0;
    v_out_cancel_fee=0;
    v_out_deli_fee=0;
    v_out_other_fee=0;
    v_out_other_commis=0;
    v_deal_flag=0;
    v_order_no=0;
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

    //单记录转入方式，以便前台并发处理
    //调用过程[事务_交易期货_接口_处理清算订单记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.6.11", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.6.11]subcall timed out!");
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
    v_record_count = lpTSCall1Ans1->GetInt32(LDBIZ_RECORD_COUNT_INT);
    v_row_id = lpTSCall1Ans1->GetInt64(LDBIZ_ROW_ID_INT64);
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans1->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans1->GetString(LDBIZ_OUT_ACCO_STR));
    strcpy(v_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_CRNCY_TYPE_STR));
    v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
    v_futu_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    strcpy(v_futu_acco, lpTSCall1Ans1->GetString(LDBIZ_FUTU_ACCO_STR));
    v_contrc_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strcpy(v_contrc_code, lpTSCall1Ans1->GetString(LDBIZ_CONTRC_CODE_STR));
    v_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_contrc_type = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_unit = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_UNIT_INT);
    v_external_no = lpTSCall1Ans1->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_comm_id = lpTSCall1Ans1->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_opor = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_report_date = lpTSCall1Ans1->GetInt32(LDBIZ_REPORT_DATE_INT);
    v_report_time = lpTSCall1Ans1->GetInt32(LDBIZ_REPORT_TIME_INT);
    strcpy(v_report_no, lpTSCall1Ans1->GetString(LDBIZ_REPORT_NO_STR));
    v_order_batch_no = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_order_date = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_DATE_INT);
    v_order_time = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_TIME_INT);
    v_order_dir = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_contrc_dir = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpTSCall1Ans1->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_order_price = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    strcpy(v_order_status, lpTSCall1Ans1->GetString(LDBIZ_ORDER_STATUS_STR));
    v_wtdraw_qty = lpTSCall1Ans1->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_price = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
    v_strike_amt = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_all_fee = lpTSCall1Ans1->GetDouble(LDBIZ_ALL_FEE_FLOAT);
    v_trade_commis = lpTSCall1Ans1->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_other_commis = lpTSCall1Ans1->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    v_report_fee = lpTSCall1Ans1->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
    v_wtdraw_fee = lpTSCall1Ans1->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
    v_rece_margin = lpTSCall1Ans1->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    strcpy(v_comb_code, lpTSCall1Ans1->GetString(LDBIZ_COMB_CODE_STR));
    v_margin_ratio = lpTSCall1Ans1->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);
    strcpy(v_rsp_info, lpTSCall1Ans1->GetString(LDBIZ_RSP_INFO_STR));
    v_compli_trig_id = lpTSCall1Ans1->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);


    // set @成交日期# = @订单日期#;
    v_strike_date = v_order_date;

    // set @费用数量# = 0;
    v_fee_qty = 0;

    // set @费用价格# = 0;
    v_fee_price = 0;
    //获取市场本币币种、交易币种、汇率，并计算期货费用，后续按汇率转换
    //调用过程[事务_公共_清算接口_计算期货清算费用]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.26.61", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
    lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req2->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req2->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req2->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req2->SetDouble(LDBIZ_FEE_QTY_FLOAT,v_fee_qty);
    lpTSCall1Req2->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req2->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
    lpTSCall1Req2->SetDouble(LDBIZ_FEE_PRICE_FLOAT,v_fee_price);
    lpTSCall1Req2->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpTSCall1Req2->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.61]subcall timed out!");
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
    strcpy(v_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_CRNCY_TYPE_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_exch_rate = lpTSCall1Ans2->GetDouble(LDBIZ_EXCH_RATE_FLOAT);
    v_rece_margin = lpTSCall1Ans2->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_trade_commis = lpTSCall1Ans2->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_service_fee = lpTSCall1Ans2->GetDouble(LDBIZ_SERVICE_FEE_FLOAT);
    v_report_fee = lpTSCall1Ans2->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
    v_wtdraw_fee = lpTSCall1Ans2->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
    v_deli_fee = lpTSCall1Ans2->GetDouble(LDBIZ_DELI_FEE_FLOAT);
    v_other_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
    v_other_commis = lpTSCall1Ans2->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    v_out_rece_margin = lpTSCall1Ans2->GetDouble(LDBIZ_OUT_RECE_MARGIN_FLOAT);
    v_out_brkage_commis = lpTSCall1Ans2->GetDouble(LDBIZ_OUT_BRKAGE_COMMIS_FLOAT);
    v_out_service_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OUT_SERVICE_FEE_FLOAT);
    v_out_report_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OUT_REPORT_FEE_FLOAT);
    v_out_cancel_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OUT_CANCEL_FEE_FLOAT);
    v_out_deli_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OUT_DELI_FEE_FLOAT);
    v_out_other_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OUT_OTHER_FEE_FLOAT);
    v_out_other_commis = lpTSCall1Ans2->GetDouble(LDBIZ_OUT_OTHER_COMMIS_FLOAT);


    // if @错误编码# = "0" then
    if (strcmp(v_error_code , "0")==0)
    {

        // set @处理信息# = concat("错误编码=", @错误编码#,"错误信息=", @错误信息#);
        snprintf(v_deal_info,sizeof(v_deal_info),"%s%s%s%s","错误编码=",v_error_code,"错误信息=",v_error_info);

        // set @处理标志# = 《处理标志-处理失败》;
        v_deal_flag = 4;
        //调用过程[事务_交易期货_接口_设置订单记录处理标志]
        //组织事务请求
        if(lpTSCall1Ans3)
        {
          lpTSCall1Ans3->FreeMsg();
          lpTSCall1Ans3=NULL;
        }
        lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("tdfutuT.6.22", 0);
        lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req3->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req3->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpTSCall1Req3->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
        glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
        if(!lpTSCall1Ans3)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.6.22]subcall timed out!");
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


        // set @错误编码# = "0";
        strcpy(v_error_code,"0");

        // set @错误信息# = " ";
        strcpy(v_error_info," ");
        // leave label_pro;
        goto END;

    // end if;
    }


    // set @订单编号# = @记录序号#;
    v_order_no = v_row_id;
    //调用过程[事务_清算期货_清算_转入订单记录]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("clfutuT.2.6", 0);
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
    lpTSCall1Req4->SetDouble(LDBIZ_EXCH_RATE_FLOAT,v_exch_rate);
    lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req4->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpTSCall1Req4->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req4->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpTSCall1Req4->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
    lpTSCall1Req4->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_NO_INT,v_order_no);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req4->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req4->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req4->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req4->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
    lpTSCall1Req4->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
    lpTSCall1Req4->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
    lpTSCall1Req4->SetDouble(LDBIZ_REPORT_FEE_FLOAT,v_report_fee);
    lpTSCall1Req4->SetDouble(LDBIZ_WTDRAW_FEE_FLOAT,v_wtdraw_fee);
    lpTSCall1Req4->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.6]subcall timed out!");
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


    // if @错误编码# = "0" then
    if (strcmp(v_error_code , "0")==0)
    {

        // set @处理信息# = concat("错误编码=", @错误编码#,"错误信息=", @错误信息#);
        snprintf(v_deal_info,sizeof(v_deal_info),"%s%s%s%s","错误编码=",v_error_code,"错误信息=",v_error_info);

        // set @处理标志# = 《处理标志-处理失败》;
        v_deal_flag = 4;
        //调用过程[事务_交易期货_接口_设置订单记录处理标志]
        //组织事务请求
        if(lpTSCall1Ans5)
        {
          lpTSCall1Ans5->FreeMsg();
          lpTSCall1Ans5=NULL;
        }
        lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("tdfutuT.6.22", 0);
        lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req5->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req5->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpTSCall1Req5->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
        glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
        if(!lpTSCall1Ans5)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.6.22]subcall timed out!");
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
    lpOutBizMsg->SetInt32(LDBIZ_RECORD_COUNT_INT,v_record_count);
    lpOutBizMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpOutBizMsg->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
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

//逻辑_清算期货_清算_查询订单记录
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
    int v_order_no;
    int v_pass_no;
    char v_out_acco[33];
    char v_exch_no_str[2049];
    int v_futu_acco_no;
    int v_contrc_code_no;
    char v_order_dir_str[1025];
    char v_contrc_dir_str[65];
    int v_hedge_type;
    char v_order_status[3];
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
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    double v_exch_rate;
    int v_exch_no;
    int v_contrc_type;
    int v_contrc_unit;
    int64 v_comm_id;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_time;
    int v_order_batch_no;
    int v_order_dir;
    int v_contrc_dir;
    double v_order_price;
    double v_order_qty;
    double v_wtdraw_qty;
    double v_strike_amt;
    double v_strike_qty;
    double v_report_fee;
    double v_wtdraw_fee;
    int v_deal_flag;
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
    v_order_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_exch_no_str, " ");
    v_futu_acco_no=0;
    v_contrc_code_no=0;
    strcpy(v_order_dir_str, " ");
    strcpy(v_contrc_dir_str, " ");
    v_hedge_type=0;
    strcpy(v_order_status, "0");
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
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_exch_rate=0;
    v_exch_no=0;
    v_contrc_type=0;
    v_contrc_unit=0;
    v_comm_id=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_time=0;
    v_order_batch_no=0;
    v_order_dir=0;
    v_contrc_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_wtdraw_qty=0;
    v_strike_amt=0;
    v_strike_qty=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_deal_flag=0;
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
    v_order_no = lpInBizMsg->GetInt32(LDBIZ_ORDER_NO_INT);
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    strncpy(v_out_acco, lpInBizMsg->GetString(LDBIZ_OUT_ACCO_STR),32);
    v_out_acco[32] = '\0';
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_futu_acco_no = lpInBizMsg->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    v_contrc_code_no = lpInBizMsg->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    strncpy(v_contrc_dir_str, lpInBizMsg->GetString(LDBIZ_CONTRC_DIR_STR_STR),64);
    v_contrc_dir_str[64] = '\0';
    v_hedge_type = lpInBizMsg->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    strncpy(v_order_status, lpInBizMsg->GetString(LDBIZ_ORDER_STATUS_STR),2);
    v_order_status[2] = '\0';
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

    //调用过程[事务_清算期货_清算_查询订单记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clfutuT.2.9", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_NO_INT,v_order_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_CONTRC_DIR_STR_STR,v_contrc_dir_str);
    lpTSCall1Req1->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.9]subcall timed out!");
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

//逻辑_清算期货_清算_转入成交记录
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
    int64 v_row_id;
    char v_deal_info[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_clear_entry_type;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    int v_exch_no;
    int v_futu_acco_no;
    int v_contrc_code_no;
    int v_contrc_type;
    int v_contrc_unit;
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
    int v_contrc_dir;
    int v_hedge_type;
    double v_order_price;
    double v_order_qty;
    double v_wtdraw_qty;
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    double v_all_fee;
    double v_rece_margin;
    char v_comb_code[7];
    double v_margin_ratio;
    double v_fee_qty;
    double v_fee_price;
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    double v_exch_rate;
    double v_trade_commis;
    double v_service_fee;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_deli_fee;
    double v_other_fee;
    double v_other_commis;
    double v_out_rece_margin;
    double v_out_brkage_commis;
    double v_out_service_fee;
    double v_out_report_fee;
    double v_out_cancel_fee;
    double v_out_deli_fee;
    double v_out_other_fee;
    double v_out_other_commis;
    int v_deal_flag;
    char v_contrc_code[7];
    char v_contrc_name[65];
    int v_margin_pref;
    int v_capit_reback_days;
    int v_posi_reback_days;
    int v_expire_date;
    int v_begin_deli_date;
    int v_end_deli_date;
    double v_deli_price;
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
    strcpy(v_deal_info, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_clear_entry_type=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    v_futu_acco_no=0;
    v_contrc_code_no=0;
    v_contrc_type=0;
    v_contrc_unit=0;
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
    v_contrc_dir=0;
    v_hedge_type=0;
    v_order_price=0;
    v_order_qty=0;
    v_wtdraw_qty=0;
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_all_fee=0;
    v_rece_margin=0;
    strcpy(v_comb_code, " ");
    v_margin_ratio=0;
    v_fee_qty=0;
    v_fee_price=0;
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_exch_rate=0;
    v_trade_commis=0;
    v_service_fee=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_deli_fee=0;
    v_other_fee=0;
    v_other_commis=0;
    v_out_rece_margin=0;
    v_out_brkage_commis=0;
    v_out_service_fee=0;
    v_out_report_fee=0;
    v_out_cancel_fee=0;
    v_out_deli_fee=0;
    v_out_other_fee=0;
    v_out_other_commis=0;
    v_deal_flag=0;
    strcpy(v_contrc_code, " ");
    strcpy(v_contrc_name, " ");
    v_margin_pref=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    v_expire_date=0;
    v_begin_deli_date=0;
    v_end_deli_date=0;
    v_deli_price=0;
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
    //set @清算入账类型//=substring(@机构业务控制配置串//, 9,1);

    // set @清算入账类型# =1 ;
    v_clear_entry_type =1 ;
    //单记录转入方式，以便前台并发处理
    //调用过程[事务_交易期货_接口_处理清算成交回报]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.6.1", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.6.1]subcall timed out!");
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
    v_futu_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    v_contrc_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_contrc_type = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_unit = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_UNIT_INT);
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
    v_contrc_dir = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_hedge_type = lpTSCall1Ans1->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_order_price = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans1->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_price = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
    v_strike_qty = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_all_fee = lpTSCall1Ans1->GetDouble(LDBIZ_ALL_FEE_FLOAT);
    v_rece_margin = lpTSCall1Ans1->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    strcpy(v_comb_code, lpTSCall1Ans1->GetString(LDBIZ_COMB_CODE_STR));
    v_margin_ratio = lpTSCall1Ans1->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);


    // if @错误编码# <> "0" then
    if (strcmp(v_error_code , "0")!=0)
    {

        // set @处理信息# = concat("获取成交回报失败: 错误编码=", @错误编码#,"错误信息=", @错误信息#);
        snprintf(v_deal_info,sizeof(v_deal_info),"%s%s%s%s","获取成交回报失败: 错误编码=",v_error_code,"错误信息=",v_error_info);
        //调用过程[事务_清算期货_清算_记录处理信息]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("clfutuT.2.81", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req2->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.81]subcall timed out!");
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


    // set @费用数量# = @成交数量#;
    v_fee_qty = v_strike_qty;

    // set @费用价格# = @成交价格#;
    v_fee_price = v_strike_price;
    //获取市场本币币种、交易币种、汇率，并计算期货费用，后续按汇率转换
    //调用过程[事务_公共_清算接口_计算期货清算费用]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.26.61", 0);
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
    lpTSCall1Req3->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req3->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req3->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req3->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req3->SetDouble(LDBIZ_FEE_QTY_FLOAT,v_fee_qty);
    lpTSCall1Req3->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req3->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
    lpTSCall1Req3->SetDouble(LDBIZ_FEE_PRICE_FLOAT,v_fee_price);
    lpTSCall1Req3->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpTSCall1Req3->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.61]subcall timed out!");
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
    v_exch_rate = lpTSCall1Ans3->GetDouble(LDBIZ_EXCH_RATE_FLOAT);
    v_rece_margin = lpTSCall1Ans3->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    v_trade_commis = lpTSCall1Ans3->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_service_fee = lpTSCall1Ans3->GetDouble(LDBIZ_SERVICE_FEE_FLOAT);
    v_report_fee = lpTSCall1Ans3->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
    v_wtdraw_fee = lpTSCall1Ans3->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
    v_deli_fee = lpTSCall1Ans3->GetDouble(LDBIZ_DELI_FEE_FLOAT);
    v_other_fee = lpTSCall1Ans3->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
    v_other_commis = lpTSCall1Ans3->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    v_out_rece_margin = lpTSCall1Ans3->GetDouble(LDBIZ_OUT_RECE_MARGIN_FLOAT);
    v_out_brkage_commis = lpTSCall1Ans3->GetDouble(LDBIZ_OUT_BRKAGE_COMMIS_FLOAT);
    v_out_service_fee = lpTSCall1Ans3->GetDouble(LDBIZ_OUT_SERVICE_FEE_FLOAT);
    v_out_report_fee = lpTSCall1Ans3->GetDouble(LDBIZ_OUT_REPORT_FEE_FLOAT);
    v_out_cancel_fee = lpTSCall1Ans3->GetDouble(LDBIZ_OUT_CANCEL_FEE_FLOAT);
    v_out_deli_fee = lpTSCall1Ans3->GetDouble(LDBIZ_OUT_DELI_FEE_FLOAT);
    v_out_other_fee = lpTSCall1Ans3->GetDouble(LDBIZ_OUT_OTHER_FEE_FLOAT);
    v_out_other_commis = lpTSCall1Ans3->GetDouble(LDBIZ_OUT_OTHER_COMMIS_FLOAT);


    // if @错误编码# <> "0" then
    if (strcmp(v_error_code , "0")!=0)
    {

        // set @处理信息# = concat("计算费用失败: 错误编码=", @错误编码#,"错误信息=", @错误信息#);
        snprintf(v_deal_info,sizeof(v_deal_info),"%s%s%s%s","计算费用失败: 错误编码=",v_error_code,"错误信息=",v_error_info);
        //调用过程[事务_清算期货_清算_记录处理信息]
        //组织事务请求
        if(lpTSCall1Ans4)
        {
          lpTSCall1Ans4->FreeMsg();
          lpTSCall1Ans4=NULL;
        }
        lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("clfutuT.2.81", 0);
        lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req4->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req4->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
        if(!lpTSCall1Ans4)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.81]subcall timed out!");
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


        // set @处理标志# = 《处理标志-处理失败》;
        v_deal_flag = 4;
        //调用过程[事务_交易期货_接口_设置单记录成交回报记录处理标志]
        //组织事务请求
        if(lpTSCall1Ans5)
        {
          lpTSCall1Ans5->FreeMsg();
          lpTSCall1Ans5=NULL;
        }
        lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("tdfutuT.6.2", 0);
        lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req5->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req5->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpTSCall1Req5->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
        glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
        if(!lpTSCall1Ans5)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.6.2]subcall timed out!");
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


        // set @错误编码# = "0";
        strcpy(v_error_code,"0");

        // set @错误信息# = " ";
        strcpy(v_error_info," ");
        // leave label_pro;
        goto END;

    // end if;
    }

    //调用过程[事务_公共_清算接口_获取代码编号合约代码属性]
    //组织事务请求
    if(lpTSCall1Ans6)
    {
      lpTSCall1Ans6->FreeMsg();
      lpTSCall1Ans6=NULL;
    }
    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("pubT.26.65", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.65]subcall timed out!");
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
    v_exch_no = lpTSCall1Ans6->GetInt32(LDBIZ_EXCH_NO_INT);
    strcpy(v_contrc_code, lpTSCall1Ans6->GetString(LDBIZ_CONTRC_CODE_STR));
    strcpy(v_contrc_name, lpTSCall1Ans6->GetString(LDBIZ_CONTRC_NAME_STR));
    v_contrc_type = lpTSCall1Ans6->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_margin_pref = lpTSCall1Ans6->GetInt32(LDBIZ_MARGIN_PREF_INT);
    v_contrc_unit = lpTSCall1Ans6->GetInt32(LDBIZ_CONTRC_UNIT_INT);
    v_capit_reback_days = lpTSCall1Ans6->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans6->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    v_expire_date = lpTSCall1Ans6->GetInt32(LDBIZ_EXPIRE_DATE_INT);
    v_begin_deli_date = lpTSCall1Ans6->GetInt32(LDBIZ_BEGIN_DELI_DATE_INT);
    v_end_deli_date = lpTSCall1Ans6->GetInt32(LDBIZ_END_DELI_DATE_INT);
    v_deli_price = lpTSCall1Ans6->GetDouble(LDBIZ_DELI_PRICE_FLOAT);


    // if @错误编码# <> "0" then
    if (strcmp(v_error_code , "0")!=0)
    {

        // set @处理信息# = concat("获取合约属性失败: 错误编码=", @错误编码#,"错误信息=", @错误信息#);
        snprintf(v_deal_info,sizeof(v_deal_info),"%s%s%s%s","获取合约属性失败: 错误编码=",v_error_code,"错误信息=",v_error_info);
        //调用过程[事务_清算期货_清算_记录处理信息]
        //组织事务请求
        if(lpTSCall1Ans7)
        {
          lpTSCall1Ans7->FreeMsg();
          lpTSCall1Ans7=NULL;
        }
        lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("clfutuT.2.81", 0);
        lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req7->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req7->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
        if(!lpTSCall1Ans7)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.81]subcall timed out!");
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


        // set @处理标志# = 《处理标志-处理失败》;
        v_deal_flag = 4;
        //调用过程[事务_交易期货_接口_设置单记录成交回报记录处理标志]
        //组织事务请求
        if(lpTSCall1Ans8)
        {
          lpTSCall1Ans8->FreeMsg();
          lpTSCall1Ans8=NULL;
        }
        lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("tdfutuT.6.2", 0);
        lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req8->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req8->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpTSCall1Req8->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
        glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
        if(!lpTSCall1Ans8)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.6.2]subcall timed out!");
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
        // leave label_pro;
        goto END;

    // end if;
    }

    //调用过程[事务_清算期货_清算_转入成交记录]
    //组织事务请求
    if(lpTSCall1Ans9)
    {
      lpTSCall1Ans9->FreeMsg();
      lpTSCall1Ans9=NULL;
    }
    lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("clfutuT.2.21", 0);
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
    lpTSCall1Req9->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req9->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req9->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req9->SetDouble(LDBIZ_EXCH_RATE_FLOAT,v_exch_rate);
    lpTSCall1Req9->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req9->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req9->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
    lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
    lpTSCall1Req9->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
    lpTSCall1Req9->SetInt32(LDBIZ_STRIKE_TIME_INT,v_strike_time);
    lpTSCall1Req9->SetString(LDBIZ_STRIKE_NO_STR,v_strike_no);
    lpTSCall1Req9->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
    lpTSCall1Req9->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
    lpTSCall1Req9->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
    lpTSCall1Req9->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
    lpTSCall1Req9->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
    lpTSCall1Req9->SetInt32(LDBIZ_ORDER_NO_INT,v_order_no);
    lpTSCall1Req9->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
    lpTSCall1Req9->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req9->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req9->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req9->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
    lpTSCall1Req9->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
    lpTSCall1Req9->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
    lpTSCall1Req9->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
    lpTSCall1Req9->SetDouble(LDBIZ_REPORT_FEE_FLOAT,v_report_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_WTDRAW_FEE_FLOAT,v_wtdraw_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_DELI_FEE_FLOAT,v_deli_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_SERVICE_FEE_FLOAT,v_service_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_OTHER_FEE_FLOAT,v_other_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
    lpTSCall1Req9->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
    lpTSCall1Req9->SetDouble(LDBIZ_OUT_REPORT_FEE_FLOAT,v_out_report_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_OUT_CANCEL_FEE_FLOAT,v_out_cancel_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_OUT_DELI_FEE_FLOAT,v_out_deli_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_OUT_SERVICE_FEE_FLOAT,v_out_service_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_OUT_OTHER_FEE_FLOAT,v_out_other_fee);
    lpTSCall1Req9->SetDouble(LDBIZ_OUT_BRKAGE_COMMIS_FLOAT,v_out_brkage_commis);
    lpTSCall1Req9->SetDouble(LDBIZ_OUT_OTHER_COMMIS_FLOAT,v_out_other_commis);
    lpTSCall1Req9->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
    lpTSCall1Req9->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
    lpTSCall1Req9->SetInt32(LDBIZ_CLEAR_ENTRY_TYPE_INT,v_clear_entry_type);
    lpTSCall1Req9->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
    glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
    if(!lpTSCall1Ans9)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.21]subcall timed out!");
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


    // if @错误编码# <> "0" then
    if (strcmp(v_error_code , "0")!=0)
    {

        // set @处理信息# = concat("转入成交失败: 错误编码=", @错误编码#,"错误信息=", @错误信息#);
        snprintf(v_deal_info,sizeof(v_deal_info),"%s%s%s%s","转入成交失败: 错误编码=",v_error_code,"错误信息=",v_error_info);
         //调用过程[事务_清算期货_清算_记录处理信息]
         //组织事务请求
         if(lpTSCall1Ans10)
         {
           lpTSCall1Ans10->FreeMsg();
           lpTSCall1Ans10=NULL;
         }
         lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("clfutuT.2.81", 0);
         lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
         lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
         lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
         lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
         lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
         lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
         lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
         lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
         lpTSCall1Req10->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
         lpTSCall1Req10->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
         glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
         if(!lpTSCall1Ans10)  //  超时错误
         {
             lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
             lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.81]subcall timed out!");
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


        // set @处理标志# = 《处理标志-处理失败》;
        v_deal_flag = 4;
        //调用过程[事务_交易期货_接口_设置单记录成交回报记录处理标志]
        //组织事务请求
        if(lpTSCall1Ans11)
        {
          lpTSCall1Ans11->FreeMsg();
          lpTSCall1Ans11=NULL;
        }
        lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("tdfutuT.6.2", 0);
        lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req11->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req11->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpTSCall1Req11->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
        glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
        if(!lpTSCall1Ans11)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.6.2]subcall timed out!");
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
    lpOutBizMsg->SetInt32(LDBIZ_RECORD_COUNT_INT,v_record_count);
    lpOutBizMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpOutBizMsg->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
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

//逻辑_清算期货_清算_查询成交记录
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
    char v_strike_no[65];
    int v_pass_no;
    char v_out_acco[33];
    char v_exch_no_str[2049];
    char v_futu_acco[17];
    char v_contrc_code[7];
    char v_order_dir_str[1025];
    char v_contrc_dir_str[65];
    int v_hedge_type;
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    double v_exch_rate;
    int v_exch_no;
    int v_futu_acco_no;
    int v_contrc_code_no;
    int v_contrc_type;
    int v_contrc_unit;
    int v_strike_time;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_no;
    int v_order_dir;
    int v_contrc_dir;
    double v_order_price;
    double v_order_qty;
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    double v_rece_margin;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_deli_fee;
    double v_service_fee;
    double v_other_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_out_report_fee;
    double v_out_cancel_fee;
    double v_out_deli_fee;
    double v_out_service_fee;
    double v_out_other_fee;
    double v_out_brkage_commis;
    double v_out_other_commis;
    int v_capit_reback_days;
    int v_posi_reback_days;
    int v_clear_entry_type;
    int v_deal_flag;
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
    v_strike_date=0;
    strcpy(v_strike_no, " ");
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_exch_no_str, " ");
    strcpy(v_futu_acco, " ");
    strcpy(v_contrc_code, " ");
    strcpy(v_order_dir_str, " ");
    strcpy(v_contrc_dir_str, " ");
    v_hedge_type=0;
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_exch_rate=0;
    v_exch_no=0;
    v_futu_acco_no=0;
    v_contrc_code_no=0;
    v_contrc_type=0;
    v_contrc_unit=0;
    v_strike_time=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_no=0;
    v_order_dir=0;
    v_contrc_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_rece_margin=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_deli_fee=0;
    v_service_fee=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_out_report_fee=0;
    v_out_cancel_fee=0;
    v_out_deli_fee=0;
    v_out_service_fee=0;
    v_out_other_fee=0;
    v_out_brkage_commis=0;
    v_out_other_commis=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    v_clear_entry_type=0;
    v_deal_flag=0;
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
    v_strike_date = lpInBizMsg->GetInt32(LDBIZ_STRIKE_DATE_INT);
    strncpy(v_strike_no, lpInBizMsg->GetString(LDBIZ_STRIKE_NO_STR),64);
    v_strike_no[64] = '\0';
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    strncpy(v_out_acco, lpInBizMsg->GetString(LDBIZ_OUT_ACCO_STR),32);
    v_out_acco[32] = '\0';
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    strncpy(v_futu_acco, lpInBizMsg->GetString(LDBIZ_FUTU_ACCO_STR),16);
    v_futu_acco[16] = '\0';
    strncpy(v_contrc_code, lpInBizMsg->GetString(LDBIZ_CONTRC_CODE_STR),6);
    v_contrc_code[6] = '\0';
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    strncpy(v_contrc_dir_str, lpInBizMsg->GetString(LDBIZ_CONTRC_DIR_STR_STR),64);
    v_contrc_dir_str[64] = '\0';
    v_hedge_type = lpInBizMsg->GetInt32(LDBIZ_HEDGE_TYPE_INT);
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

    //调用过程[事务_清算期货_清算_查询成交记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clfutuT.2.24", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
    lpTSCall1Req1->SetString(LDBIZ_STRIKE_NO_STR,v_strike_no);
    lpTSCall1Req1->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetString(LDBIZ_FUTU_ACCO_STR,v_futu_acco);
    lpTSCall1Req1->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_CONTRC_DIR_STR_STR,v_contrc_dir_str);
    lpTSCall1Req1->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.24]subcall timed out!");
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

//逻辑_清算期货_清算_清算处理
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
    int64 v_row_id;
    char v_deal_info[256];
    int v_init_date;
    char v_co_busi_config_str[65];
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
    v_row_id=0;
    strcpy(v_deal_info, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
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

    //调用过程[事务_清算期货_清算_清算处理]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clfutuT.2.37", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.37]subcall timed out!");
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


    // if @错误编码# <> "0" and @记录个数# <> 0 then
    if (strcmp(v_error_code , "0")!=0 && v_record_count != 0)
    {

        // set @处理信息# = concat("错误编码=", @错误编码#,"错误信息=", @错误信息#);
        snprintf(v_deal_info,sizeof(v_deal_info),"%s%s%s%s","错误编码=",v_error_code,"错误信息=",v_error_info);

        // set @处理标志# = 《处理标志-处理失败》;
        v_deal_flag = 4;
        //调用过程[事务_清算期货_清算_设置成交记录处理标志]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("clfutuT.2.26", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpTSCall1Req2->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.26]subcall timed out!");
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
    lpOutBizMsg->SetInt32(LDBIZ_RECORD_COUNT_INT,v_record_count);
    lpOutBizMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpOutBizMsg->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
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

//逻辑_清算期货_清算_订单费用处理
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
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_record_count;
    char v_deal_info[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_row_id;
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
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_record_count=0;
    strcpy(v_deal_info, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_row_id=0;
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

    //调用过程[事务_清算期货_清算_订单费用处理]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clfutuT.2.38", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.38]subcall timed out!");
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


    // if @错误编码# <> "0" and @记录个数# <> 0 then
    if (strcmp(v_error_code , "0")!=0 && v_record_count != 0)
    {

        // set @处理信息# = concat("错误编码=", @错误编码#,"错误信息=", @错误信息#);
        snprintf(v_deal_info,sizeof(v_deal_info),"%s%s%s%s","错误编码=",v_error_code,"错误信息=",v_error_info);

        // set @处理标志# = 《处理标志-处理失败》;
        v_deal_flag = 4;
        //调用过程[事务_清算期货_清算_设置订单记录处理标志]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("clfutuT.2.11", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpTSCall1Req2->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.11]subcall timed out!");
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
    lpOutBizMsg->SetInt32(LDBIZ_RECORD_COUNT_INT,v_record_count);
    lpOutBizMsg->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
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

//逻辑_清算期货_清算_查询待入账记录
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
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    char v_exch_no_str[2049];
    int v_futu_acco_no;
    int v_contrc_code_no;
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
    int v_pass_no;
    char v_out_acco[33];
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    double v_exch_rate;
    int v_exch_no;
    int v_contrc_type;
    int v_contrc_unit;
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
    int v_contrc_dir;
    int v_lngsht_type;
    int v_hedge_type;
    double v_order_price;
    double v_order_qty;
    double v_pre_settle_price;
    double v_sett_price;
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    int v_strike_num;
    double v_pre_entry_qty;
    double v_pre_entry_amt;
    double v_rece_margin;
    char v_comb_code[7];
    double v_sett_close_pandl;
    double v_all_fee;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_deli_fee;
    double v_service_fee;
    double v_other_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_out_all_fee;
    double v_out_report_fee;
    double v_out_cancel_fee;
    double v_out_deli_fee;
    double v_out_service_fee;
    double v_out_other_fee;
    double v_out_brkage_commis;
    double v_out_other_commis;
    int v_busi_flag;
    int64 v_entry_money_jour_no;
    int64 v_entry_asac_posi_jour_no;
    int64 v_deli_jour_no;
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
    v_futu_acco_no=0;
    v_contrc_code_no=0;
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
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_exch_rate=0;
    v_exch_no=0;
    v_contrc_type=0;
    v_contrc_unit=0;
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
    v_contrc_dir=0;
    v_lngsht_type=0;
    v_hedge_type=0;
    v_order_price=0;
    v_order_qty=0;
    v_pre_settle_price=0;
    v_sett_price=0;
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_strike_num=0;
    v_pre_entry_qty=0;
    v_pre_entry_amt=0;
    v_rece_margin=0;
    strcpy(v_comb_code, " ");
    v_sett_close_pandl=0;
    v_all_fee=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_deli_fee=0;
    v_service_fee=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_out_all_fee=0;
    v_out_report_fee=0;
    v_out_cancel_fee=0;
    v_out_deli_fee=0;
    v_out_service_fee=0;
    v_out_other_fee=0;
    v_out_brkage_commis=0;
    v_out_other_commis=0;
    v_busi_flag=0;
    v_entry_money_jour_no=0;
    v_entry_asac_posi_jour_no=0;
    v_deli_jour_no=0;
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
    v_futu_acco_no = lpInBizMsg->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    v_contrc_code_no = lpInBizMsg->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
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

    //调用过程[事务_清算期货_清算_查询待入账记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clfutuT.2.58", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
    lpTSCall1Req1->SetString(LDBIZ_CRNCY_TYPE_STR_STR,v_crncy_type_str);
    lpTSCall1Req1->SetString(LDBIZ_ENTRY_STATUS_STR,v_entry_status);
    lpTSCall1Req1->SetString(LDBIZ_UNDO_STATUS_STR,v_undo_status);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.58]subcall timed out!");
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

//逻辑_清算期货_清算_入账处理
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
    int v_qry_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_record_count;
    int64 v_row_id;
    char v_deal_info[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    double v_exch_rate;
    int v_exch_no;
    int v_futu_acco_no;
    int v_contrc_code_no;
    int v_contrc_type;
    int v_contrc_unit;
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
    int v_contrc_dir;
    int v_lngsht_type;
    int v_hedge_type;
    double v_order_price;
    double v_order_qty;
    double v_pre_settle_price;
    double v_sett_price;
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    int v_strike_num;
    double v_pre_entry_qty;
    double v_pre_entry_amt;
    double v_rece_margin;
    char v_comb_code[7];
    double v_long_hold_margin;
    double v_short_hold_margin;
    double v_sett_capt_margin;
    double v_sett_close_pandl;
    double v_sett_marked_pandl;
    double v_sett_close_pandl_today;
    double v_all_fee;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_deli_fee;
    double v_service_fee;
    double v_other_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_out_all_fee;
    double v_out_report_fee;
    double v_out_cancel_fee;
    double v_out_deli_fee;
    double v_out_service_fee;
    double v_out_other_fee;
    double v_out_brkage_commis;
    double v_out_other_commis;
    int v_busi_flag;
    char v_entry_status[3];
    char v_undo_status[3];
    int64 v_entry_money_jour_no;
    int64 v_entry_posi_jour_no;
    int64 v_deli_jour_no;
    double v_open_amount;
    int v_arrive_date;
    char v_tmp_error_info[256];
    double v_sett_fee;
    double v_capt_margin;
    double v_occur_amt;
    double v_occur_qty;
    char v_remark_info[256];
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
    strcpy(v_deal_info, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_exch_rate=0;
    v_exch_no=0;
    v_futu_acco_no=0;
    v_contrc_code_no=0;
    v_contrc_type=0;
    v_contrc_unit=0;
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
    v_contrc_dir=0;
    v_lngsht_type=0;
    v_hedge_type=0;
    v_order_price=0;
    v_order_qty=0;
    v_pre_settle_price=0;
    v_sett_price=0;
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_strike_num=0;
    v_pre_entry_qty=0;
    v_pre_entry_amt=0;
    v_rece_margin=0;
    strcpy(v_comb_code, " ");
    v_long_hold_margin=0;
    v_short_hold_margin=0;
    v_sett_capt_margin=0;
    v_sett_close_pandl=0;
    v_sett_marked_pandl=0;
    v_sett_close_pandl_today=0;
    v_all_fee=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_deli_fee=0;
    v_service_fee=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_out_all_fee=0;
    v_out_report_fee=0;
    v_out_cancel_fee=0;
    v_out_deli_fee=0;
    v_out_service_fee=0;
    v_out_other_fee=0;
    v_out_brkage_commis=0;
    v_out_other_commis=0;
    v_busi_flag=0;
    strcpy(v_entry_status, "0");
    strcpy(v_undo_status, "0");
    v_entry_money_jour_no=0;
    v_entry_posi_jour_no=0;
    v_deli_jour_no=0;
    v_open_amount=0;
    v_arrive_date=0;
    strcpy(v_tmp_error_info, " ");
    v_sett_fee=0;
    v_capt_margin=0;
    v_occur_amt=0;
    v_occur_qty=0;
    strcpy(v_remark_info, " ");
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

    //调用过程[事务_清算期货_清算_更新获取待入账记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clfutuT.2.59", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.59]subcall timed out!");
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
    v_record_count = lpTSCall1Ans1->GetInt32(LDBIZ_RECORD_COUNT_INT);
    v_row_id = lpTSCall1Ans1->GetInt64(LDBIZ_ROW_ID_INT64);
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans1->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans1->GetString(LDBIZ_OUT_ACCO_STR));
    strcpy(v_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_CRNCY_TYPE_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_exch_rate = lpTSCall1Ans1->GetDouble(LDBIZ_EXCH_RATE_FLOAT);
    v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
    v_futu_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    v_contrc_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_contrc_type = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_unit = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_UNIT_INT);
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
    v_contrc_dir = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_lngsht_type = lpTSCall1Ans1->GetInt32(LDBIZ_LNGSHT_TYPE_INT);
    v_hedge_type = lpTSCall1Ans1->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_order_price = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_pre_settle_price = lpTSCall1Ans1->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
    v_sett_price = lpTSCall1Ans1->GetDouble(LDBIZ_SETT_PRICE_FLOAT);
    v_strike_price = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
    v_strike_qty = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_num = lpTSCall1Ans1->GetInt32(LDBIZ_STRIKE_NUM_INT);
    v_pre_entry_qty = lpTSCall1Ans1->GetDouble(LDBIZ_PRE_ENTRY_QTY_FLOAT);
    v_pre_entry_amt = lpTSCall1Ans1->GetDouble(LDBIZ_PRE_ENTRY_AMT_FLOAT);
    v_rece_margin = lpTSCall1Ans1->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    strcpy(v_comb_code, lpTSCall1Ans1->GetString(LDBIZ_COMB_CODE_STR));
    v_long_hold_margin = lpTSCall1Ans1->GetDouble(LDBIZ_LONG_HOLD_MARGIN_FLOAT);
    v_short_hold_margin = lpTSCall1Ans1->GetDouble(LDBIZ_SHORT_HOLD_MARGIN_FLOAT);
    v_sett_capt_margin = lpTSCall1Ans1->GetDouble(LDBIZ_SETT_CAPT_MARGIN_FLOAT);
    v_sett_close_pandl = lpTSCall1Ans1->GetDouble(LDBIZ_SETT_CLOSE_PANDL_FLOAT);
    v_sett_marked_pandl = lpTSCall1Ans1->GetDouble(LDBIZ_SETT_MARKED_PANDL_FLOAT);
    v_sett_close_pandl_today = lpTSCall1Ans1->GetDouble(LDBIZ_SETT_CLOSE_PANDL_TODAY_FLOAT);
    v_all_fee = lpTSCall1Ans1->GetDouble(LDBIZ_ALL_FEE_FLOAT);
    v_report_fee = lpTSCall1Ans1->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
    v_wtdraw_fee = lpTSCall1Ans1->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
    v_deli_fee = lpTSCall1Ans1->GetDouble(LDBIZ_DELI_FEE_FLOAT);
    v_service_fee = lpTSCall1Ans1->GetDouble(LDBIZ_SERVICE_FEE_FLOAT);
    v_other_fee = lpTSCall1Ans1->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
    v_trade_commis = lpTSCall1Ans1->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_other_commis = lpTSCall1Ans1->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    v_out_all_fee = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_ALL_FEE_FLOAT);
    v_out_report_fee = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_REPORT_FEE_FLOAT);
    v_out_cancel_fee = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_CANCEL_FEE_FLOAT);
    v_out_deli_fee = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_DELI_FEE_FLOAT);
    v_out_service_fee = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_SERVICE_FEE_FLOAT);
    v_out_other_fee = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_OTHER_FEE_FLOAT);
    v_out_brkage_commis = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_BRKAGE_COMMIS_FLOAT);
    v_out_other_commis = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_OTHER_COMMIS_FLOAT);
    v_busi_flag = lpTSCall1Ans1->GetInt32(LDBIZ_BUSI_FLAG_INT);
    strcpy(v_entry_status, lpTSCall1Ans1->GetString(LDBIZ_ENTRY_STATUS_STR));
    strcpy(v_undo_status, lpTSCall1Ans1->GetString(LDBIZ_UNDO_STATUS_STR));
    v_entry_money_jour_no = lpTSCall1Ans1->GetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
    v_entry_posi_jour_no = lpTSCall1Ans1->GetInt64(LDBIZ_ENTRY_POSI_JOUR_NO_INT64);
    v_deli_jour_no = lpTSCall1Ans1->GetInt64(LDBIZ_DELI_JOUR_NO_INT64);
    v_open_amount = lpTSCall1Ans1->GetDouble(LDBIZ_OPEN_AMOUNT_FLOAT);


    // if @记录个数# = 0 then
    if (v_record_count == 0)
    {
        //set @错误编码// = "0";
        //set @错误信息// = " ";
        // leave label_pro;
        goto END;

    // end if;
    }


    // [检查报错返回][@入账状态# = 《入账状态-已入账》][1]["该待入账记录已入账处理！"]
    if (strcmp(v_entry_status , "1")==0)
    {
        strcpy(v_error_code, "clfutuL.2.61.1");
        snprintf(v_error_info, sizeof(v_error_info), "该待入账记录已入账处理！");
        iRet = -1;
        goto END;
    }


    // set @到账日期#=0;
    v_arrive_date=0;

    // set @临时_错误信息#="";
    strcpy(v_tmp_error_info,"");
    //期货资金入账处理，包括成交清算、费用入账、盯市盈亏入账、占用保证金入账
    //盯市盈亏入账时，调用单独的事务_清算期货_清算_期货盯市盈亏入账处理，其他调用事务_产品期货_清算接口_清算资金入账处理

    // if (@待入账金额# <> 0) or (@待入账数量# <> 0)  then
    if ((v_pre_entry_amt != 0) || (v_pre_entry_qty != 0) )
    {

        // set @清算费用#=-@全部费用#;
        v_sett_fee=-v_all_fee;

        // set @占用保证金#=@清算占用保证金#;
        v_capt_margin=v_sett_capt_margin;

        // set @变动金额# = @待入账金额#;
        v_occur_amt = v_pre_entry_amt;

        // set @变动数量# = @待入账数量#;
        v_occur_qty = v_pre_entry_qty;

        // set @备注信息# = "清算资金持仓入账！";
        strcpy(v_remark_info,"清算资金持仓入账！");
        //调用过程[事务_产品期货_清算接口_清算资金持仓入账]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdfutuT.5.101", 0);
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
        lpTSCall1Req2->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
        lpTSCall1Req2->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req2->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
        lpTSCall1Req2->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
        lpTSCall1Req2->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
        lpTSCall1Req2->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
        lpTSCall1Req2->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
        lpTSCall1Req2->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
        lpTSCall1Req2->SetDouble(LDBIZ_OCCUR_QTY_FLOAT,v_occur_qty);
        lpTSCall1Req2->SetDouble(LDBIZ_OCCUR_AMT_FLOAT,v_occur_amt);
        lpTSCall1Req2->SetInt32(LDBIZ_BUSI_FLAG_INT,v_busi_flag);
        lpTSCall1Req2->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
        lpTSCall1Req2->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
        lpTSCall1Req2->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
        lpTSCall1Req2->SetDouble(LDBIZ_OPEN_AMOUNT_FLOAT,v_open_amount);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.5.101]subcall timed out!");
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
        v_entry_money_jour_no = lpTSCall1Ans2->GetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
        v_entry_exgp_posi_jour_no = lpTSCall1Ans2->GetInt64(LDBIZ_ENTRY_EXGP_POSI_JOUR_NO_INT64);
        v_entry_asac_posi_jour_no = lpTSCall1Ans2->GetInt64(LDBIZ_ENTRY_ASAC_POSI_JOUR_NO_INT64);


        // if @错误编码# <> "0" then
        if (strcmp(v_error_code , "0")!=0)
        {

            // set @处理信息# = concat("错误编码=", @错误编码#,"错误信息=", @错误信息#);
            snprintf(v_deal_info,sizeof(v_deal_info),"%s%s%s%s","错误编码=",v_error_code,"错误信息=",v_error_info);
            //调用过程[事务_清算期货_清算_记录处理信息]
            //组织事务请求
            if(lpTSCall1Ans3)
            {
              lpTSCall1Ans3->FreeMsg();
              lpTSCall1Ans3=NULL;
            }
            lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("clfutuT.2.81", 0);
            lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req3->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
            lpTSCall1Req3->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
            glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
            if(!lpTSCall1Ans3)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.81]subcall timed out!");
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


            // set @入账状态# = 《入账状态-处理失败》;
            strcpy(v_entry_status,"4");
            //调用过程[事务_清算期货_清算_更新待入账记录]
            //组织事务请求
            if(lpTSCall1Ans4)
            {
              lpTSCall1Ans4->FreeMsg();
              lpTSCall1Ans4=NULL;
            }
            lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("clfutuT.2.57", 0);
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
            lpTSCall1Req4->SetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64,v_entry_money_jour_no);
            lpTSCall1Req4->SetInt64(LDBIZ_ENTRY_EXGP_POSI_JOUR_NO_INT64,v_entry_exgp_posi_jour_no);
            lpTSCall1Req4->SetInt64(LDBIZ_ENTRY_ASAC_POSI_JOUR_NO_INT64,v_entry_asac_posi_jour_no);
            lpTSCall1Req4->SetString(LDBIZ_ENTRY_STATUS_STR,v_entry_status);
            lpTSCall1Req4->SetString(LDBIZ_UNDO_STATUS_STR,v_undo_status);
            glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
            if(!lpTSCall1Ans4)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.57]subcall timed out!");
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

            //调用过程[事务_清算期货_清算_回写入账流水号]
            //组织事务请求
            if(lpTSCall1Ans5)
            {
              lpTSCall1Ans5->FreeMsg();
              lpTSCall1Ans5=NULL;
            }
            lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("clfutuT.2.83", 0);
            lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req5->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
            lpTSCall1Req5->SetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64,v_entry_money_jour_no);
            lpTSCall1Req5->SetInt64(LDBIZ_ENTRY_EXGP_POSI_JOUR_NO_INT64,v_entry_exgp_posi_jour_no);
            lpTSCall1Req5->SetInt64(LDBIZ_ENTRY_ASAC_POSI_JOUR_NO_INT64,v_entry_asac_posi_jour_no);
            glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
            if(!lpTSCall1Ans5)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.83]subcall timed out!");
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
            if(lpTSCall1Ans6)
            {
              lpTSCall1Ans6->FreeMsg();
              lpTSCall1Ans6=NULL;
            }
            lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("prodT.7.2", 0);
            lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req6->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
            lpTSCall1Req6->SetInt32(LDBIZ_ARRIVE_DATE_INT,v_arrive_date);
            lpTSCall1Req6->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpTSCall1Req6->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
            lpTSCall1Req6->SetInt32(LDBIZ_BUSI_FLAG_INT,v_busi_flag);
            lpTSCall1Req6->SetDouble(LDBIZ_OCCUR_AMT_FLOAT,v_occur_amt);
            lpTSCall1Req6->SetDouble(LDBIZ_CURR_AMT_FLOAT,v_curr_amt);
            lpTSCall1Req6->SetDouble(LDBIZ_FROZEN_AMT_FLOAT,v_frozen_amt);
            lpTSCall1Req6->SetDouble(LDBIZ_UNFROZ_AMT_FLOAT,v_unfroz_amt);
            lpTSCall1Req6->SetDouble(LDBIZ_TOTAL_RECE_AMT_FLOAT,v_total_rece_amt);
            lpTSCall1Req6->SetDouble(LDBIZ_TOTAL_PAYAB_AMT_FLOAT,v_total_payab_amt);
            lpTSCall1Req6->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req6->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
            glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 30000);
            if(!lpTSCall1Ans6)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.7.2]subcall timed out!");
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
    lpOutBizMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpOutBizMsg->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
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

//逻辑_清算期货_清算_入账回滚处理
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
    int v_qry_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_record_count;
    int64 v_row_id;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    double v_exch_rate;
    int v_exch_no;
    int v_futu_acco_no;
    int v_contrc_code_no;
    int v_contrc_type;
    int v_contrc_unit;
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
    int v_contrc_dir;
    int v_lngsht_type;
    int v_hedge_type;
    double v_order_price;
    double v_order_qty;
    double v_pre_settle_price;
    double v_sett_price;
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    int v_strike_num;
    double v_pre_entry_qty;
    double v_pre_entry_amt;
    double v_rece_margin;
    char v_comb_code[7];
    double v_long_hold_margin;
    double v_short_hold_margin;
    double v_sett_capt_margin;
    double v_sett_close_pandl;
    double v_sett_marked_pandl;
    double v_sett_close_pandl_today;
    double v_all_fee;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_deli_fee;
    double v_service_fee;
    double v_other_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_out_all_fee;
    double v_out_report_fee;
    double v_out_cancel_fee;
    double v_out_deli_fee;
    double v_out_service_fee;
    double v_out_other_fee;
    double v_out_brkage_commis;
    double v_out_other_commis;
    int v_busi_flag;
    char v_entry_status[3];
    char v_undo_status[3];
    int64 v_entry_money_jour_no;
    int64 v_entry_exgp_posi_jour_no;
    int64 v_entry_asac_posi_jour_no;
    int64 v_deli_jour_no;
    int v_tmp_busi_flag;
    int v_arrive_date;
    double v_sett_fee;
    double v_capt_margin;
    double v_realize_pandl;
    char v_remark_info[256];
    double v_occur_amt;
    double v_occur_qty;
    char v_tmp_error_code[33];
    char v_tmp_error_info[256];
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
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_record_count=0;
    v_row_id=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_exch_rate=0;
    v_exch_no=0;
    v_futu_acco_no=0;
    v_contrc_code_no=0;
    v_contrc_type=0;
    v_contrc_unit=0;
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
    v_contrc_dir=0;
    v_lngsht_type=0;
    v_hedge_type=0;
    v_order_price=0;
    v_order_qty=0;
    v_pre_settle_price=0;
    v_sett_price=0;
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_strike_num=0;
    v_pre_entry_qty=0;
    v_pre_entry_amt=0;
    v_rece_margin=0;
    strcpy(v_comb_code, " ");
    v_long_hold_margin=0;
    v_short_hold_margin=0;
    v_sett_capt_margin=0;
    v_sett_close_pandl=0;
    v_sett_marked_pandl=0;
    v_sett_close_pandl_today=0;
    v_all_fee=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_deli_fee=0;
    v_service_fee=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_out_all_fee=0;
    v_out_report_fee=0;
    v_out_cancel_fee=0;
    v_out_deli_fee=0;
    v_out_service_fee=0;
    v_out_other_fee=0;
    v_out_brkage_commis=0;
    v_out_other_commis=0;
    v_busi_flag=0;
    strcpy(v_entry_status, "0");
    strcpy(v_undo_status, "0");
    v_entry_money_jour_no=0;
    v_entry_exgp_posi_jour_no=0;
    v_entry_asac_posi_jour_no=0;
    v_deli_jour_no=0;
    v_tmp_busi_flag=0;
    v_arrive_date=0;
    v_sett_fee=0;
    v_capt_margin=0;
    v_realize_pandl=0;
    strcpy(v_remark_info, " ");
    v_occur_amt=0;
    v_occur_qty=0;
    strcpy(v_tmp_error_code, "0");
    strcpy(v_tmp_error_info, " ");
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

    //调用过程[事务_清算期货_清算_更新获取回滚待入账记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clfutuT.2.60", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.60]subcall timed out!");
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
    v_record_count = lpTSCall1Ans1->GetInt32(LDBIZ_RECORD_COUNT_INT);
    v_row_id = lpTSCall1Ans1->GetInt64(LDBIZ_ROW_ID_INT64);
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans1->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans1->GetString(LDBIZ_OUT_ACCO_STR));
    strcpy(v_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_CRNCY_TYPE_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_exch_rate = lpTSCall1Ans1->GetDouble(LDBIZ_EXCH_RATE_FLOAT);
    v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
    v_futu_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
    v_contrc_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
    v_contrc_type = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_TYPE_INT);
    v_contrc_unit = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_UNIT_INT);
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
    v_contrc_dir = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_DIR_INT);
    v_lngsht_type = lpTSCall1Ans1->GetInt32(LDBIZ_LNGSHT_TYPE_INT);
    v_hedge_type = lpTSCall1Ans1->GetInt32(LDBIZ_HEDGE_TYPE_INT);
    v_order_price = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_pre_settle_price = lpTSCall1Ans1->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
    v_sett_price = lpTSCall1Ans1->GetDouble(LDBIZ_SETT_PRICE_FLOAT);
    v_strike_price = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
    v_strike_qty = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_num = lpTSCall1Ans1->GetInt32(LDBIZ_STRIKE_NUM_INT);
    v_pre_entry_qty = lpTSCall1Ans1->GetDouble(LDBIZ_PRE_ENTRY_QTY_FLOAT);
    v_pre_entry_amt = lpTSCall1Ans1->GetDouble(LDBIZ_PRE_ENTRY_AMT_FLOAT);
    v_rece_margin = lpTSCall1Ans1->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
    strcpy(v_comb_code, lpTSCall1Ans1->GetString(LDBIZ_COMB_CODE_STR));
    v_long_hold_margin = lpTSCall1Ans1->GetDouble(LDBIZ_LONG_HOLD_MARGIN_FLOAT);
    v_short_hold_margin = lpTSCall1Ans1->GetDouble(LDBIZ_SHORT_HOLD_MARGIN_FLOAT);
    v_sett_capt_margin = lpTSCall1Ans1->GetDouble(LDBIZ_SETT_CAPT_MARGIN_FLOAT);
    v_sett_close_pandl = lpTSCall1Ans1->GetDouble(LDBIZ_SETT_CLOSE_PANDL_FLOAT);
    v_sett_marked_pandl = lpTSCall1Ans1->GetDouble(LDBIZ_SETT_MARKED_PANDL_FLOAT);
    v_sett_close_pandl_today = lpTSCall1Ans1->GetDouble(LDBIZ_SETT_CLOSE_PANDL_TODAY_FLOAT);
    v_all_fee = lpTSCall1Ans1->GetDouble(LDBIZ_ALL_FEE_FLOAT);
    v_report_fee = lpTSCall1Ans1->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
    v_wtdraw_fee = lpTSCall1Ans1->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
    v_deli_fee = lpTSCall1Ans1->GetDouble(LDBIZ_DELI_FEE_FLOAT);
    v_service_fee = lpTSCall1Ans1->GetDouble(LDBIZ_SERVICE_FEE_FLOAT);
    v_other_fee = lpTSCall1Ans1->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
    v_trade_commis = lpTSCall1Ans1->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
    v_other_commis = lpTSCall1Ans1->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
    v_out_all_fee = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_ALL_FEE_FLOAT);
    v_out_report_fee = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_REPORT_FEE_FLOAT);
    v_out_cancel_fee = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_CANCEL_FEE_FLOAT);
    v_out_deli_fee = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_DELI_FEE_FLOAT);
    v_out_service_fee = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_SERVICE_FEE_FLOAT);
    v_out_other_fee = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_OTHER_FEE_FLOAT);
    v_out_brkage_commis = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_BRKAGE_COMMIS_FLOAT);
    v_out_other_commis = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_OTHER_COMMIS_FLOAT);
    v_busi_flag = lpTSCall1Ans1->GetInt32(LDBIZ_BUSI_FLAG_INT);
    strcpy(v_entry_status, lpTSCall1Ans1->GetString(LDBIZ_ENTRY_STATUS_STR));
    strcpy(v_undo_status, lpTSCall1Ans1->GetString(LDBIZ_UNDO_STATUS_STR));
    v_entry_money_jour_no = lpTSCall1Ans1->GetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
    v_entry_exgp_posi_jour_no = lpTSCall1Ans1->GetInt64(LDBIZ_ENTRY_EXGP_POSI_JOUR_NO_INT64);
    v_entry_asac_posi_jour_no = lpTSCall1Ans1->GetInt64(LDBIZ_ENTRY_ASAC_POSI_JOUR_NO_INT64);
    v_deli_jour_no = lpTSCall1Ans1->GetInt64(LDBIZ_DELI_JOUR_NO_INT64);


    // [检查报错返回][@回滚状态# = 《回滚状态-已回滚》][1]["该待入账记录已回滚处理！"]
    if (strcmp(v_undo_status , "1")==0)
    {
        strcpy(v_error_code, "clfutuL.2.62.1");
        snprintf(v_error_info, sizeof(v_error_info), "该待入账记录已回滚处理！");
        iRet = -1;
        goto END;
    }

    //如果入账资金流水号或入账持仓流水号不为0，则做回滚处理
    //先保留一下传进来的业务标志，以避免后续赋值把业务标志冲掉

    // set @临时_业务标志#=@业务标志#;
    v_tmp_busi_flag=v_busi_flag;

    // set @业务标志#= -@业务标志#;
    v_busi_flag= -v_busi_flag;

    // set @到账日期#=0;
    v_arrive_date=0;

    // set @结算价#=@昨结算价#;
    v_sett_price=v_pre_settle_price;

    // set @待入账金额# = -@待入账金额#;
    v_pre_entry_amt = -v_pre_entry_amt;

    // set @待入账数量# = -@待入账数量#;
    v_pre_entry_qty = -v_pre_entry_qty;

    // set @应收保证金# = -@应收保证金#;
    v_rece_margin = -v_rece_margin;

    // set @清算平仓盈亏# = -@清算平仓盈亏#;
    v_sett_close_pandl = -v_sett_close_pandl;

    // set @清算盯市盈亏# = -@清算盯市盈亏#;
    v_sett_marked_pandl = -v_sett_marked_pandl;
    //回滚时四个字段的反向处理。如果原处理时是字段加负号，则直接不变即可；如原处理是等于其他变量值，则要反向

    // set @清算费用#=@全部费用#;
    v_sett_fee=v_all_fee;

    // set @清算占用保证金#=-@清算占用保证金#;
    v_sett_capt_margin=-v_sett_capt_margin;

    // set @占用保证金#=@清算占用保证金#;
    v_capt_margin=v_sett_capt_margin;
    //期货资金入账处理，包括成交清算、费用入账、盯市盈亏入账、占用保证金入账
    //盯市盈亏入账时，调用单独的事务_清算期货_清算_期货盯市盈亏入账处理，其他调用事务_产品期货_清算接口_清算资金入账处理

    // if (@待入账金额# <> 0) or (@待入账数量# <> 0) or (@清算占用保证金# <> 0) or (@应收保证金# <> 0) then
    if ((v_pre_entry_amt != 0) || (v_pre_entry_qty != 0) || (v_sett_capt_margin != 0) || (v_rece_margin != 0))
    {
        //期货盯市盈亏入账处理
        //只有结算时才要清算盯市盈亏入账，清算时的清算盯市盈亏只用于记持仓的实现盈亏使用

        // if (@清算盯市盈亏# <> 0) then
        if ((v_sett_marked_pandl != 0))
        {

            // set @实现盈亏# = @清算盯市盈亏#;
            v_realize_pandl = v_sett_marked_pandl;

            // set @备注信息# = "清算回滚时持仓实现盈亏入账！";
            strcpy(v_remark_info,"清算回滚时持仓实现盈亏入账！");
    //        [事务_产品期货_清算接口_更新持仓实现盈亏][N]

        }
        // elseif @应收保证金# <> 0 then
        else if (v_rece_margin != 0)
        {

            // set @备注信息# = "清算回滚时持仓结算价应收保证金入账！";
            strcpy(v_remark_info,"清算回滚时持仓结算价应收保证金入账！");
            //调用过程[事务_产品期货_清算接口_更新持仓结算价应收保证金]
            //组织事务请求
            if(lpTSCall1Ans2)
            {
              lpTSCall1Ans2->FreeMsg();
              lpTSCall1Ans2=NULL;
            }
            lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdfutuT.5.76", 0);
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
            lpTSCall1Req2->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
            lpTSCall1Req2->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
            lpTSCall1Req2->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
            lpTSCall1Req2->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
            lpTSCall1Req2->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
            lpTSCall1Req2->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
            lpTSCall1Req2->SetDouble(LDBIZ_SETT_PRICE_FLOAT,v_sett_price);
            lpTSCall1Req2->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
            lpTSCall1Req2->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
            glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
            if(!lpTSCall1Ans2)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.5.76]subcall timed out!");
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

        }
        // else
        else
        {


            // set @变动金额# = @待入账金额#;
            v_occur_amt = v_pre_entry_amt;

            // set @变动数量# = @待入账数量#;
            v_occur_qty = v_pre_entry_qty;

            // set @备注信息# = "清算回滚时资金持仓入账！";
            strcpy(v_remark_info,"清算回滚时资金持仓入账！");
            //调用过程[事务_产品期货_清算接口_回滚清算资金持仓入账]
            //组织事务请求
            if(lpTSCall1Ans3)
            {
              lpTSCall1Ans3->FreeMsg();
              lpTSCall1Ans3=NULL;
            }
            lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdfutuT.5.102", 0);
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
            lpTSCall1Req3->SetInt64(LDBIZ_ENTRY_EXGP_POSI_JOUR_NO_INT64,v_entry_exgp_posi_jour_no);
            lpTSCall1Req3->SetInt64(LDBIZ_ENTRY_ASAC_POSI_JOUR_NO_INT64,v_entry_asac_posi_jour_no);
            lpTSCall1Req3->SetInt32(LDBIZ_BUSI_FLAG_INT,v_busi_flag);
            lpTSCall1Req3->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
            lpTSCall1Req3->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
            lpTSCall1Req3->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
            glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
            if(!lpTSCall1Ans3)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.5.102]subcall timed out!");
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

        // end if;
        }


        // if @错误编码# <> "0" then
        if (strcmp(v_error_code , "0")!=0)
        {

            // set @临时_错误编码# = @错误编码#;
            strcpy(v_tmp_error_code,v_error_code);

            // set @临时_错误信息# = @错误信息#;
            strcpy(v_tmp_error_info,v_error_info);

            // set @入账交易组持仓流水号# = 0;
            v_entry_exgp_posi_jour_no = 0;

            // set @入账资产账户持仓流水号# = 0;
            v_entry_asac_posi_jour_no = 0;

            // set @回滚状态# = 《回滚状态-未回滚》;
            strcpy(v_undo_status,"2");
            //调用过程[事务_清算期货_清算_更新待入账记录]
            //组织事务请求
            if(lpTSCall1Ans4)
            {
              lpTSCall1Ans4->FreeMsg();
              lpTSCall1Ans4=NULL;
            }
            lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("clfutuT.2.57", 0);
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
            lpTSCall1Req4->SetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64,v_entry_money_jour_no);
            lpTSCall1Req4->SetInt64(LDBIZ_ENTRY_EXGP_POSI_JOUR_NO_INT64,v_entry_exgp_posi_jour_no);
            lpTSCall1Req4->SetInt64(LDBIZ_ENTRY_ASAC_POSI_JOUR_NO_INT64,v_entry_asac_posi_jour_no);
            lpTSCall1Req4->SetString(LDBIZ_ENTRY_STATUS_STR,v_entry_status);
            lpTSCall1Req4->SetString(LDBIZ_UNDO_STATUS_STR,v_undo_status);
            glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
            if(!lpTSCall1Ans4)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.57]subcall timed out!");
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


            // set @入账资金流水号#=@记录序号#;
            v_entry_money_jour_no=v_row_id;

            // set @当前金额#=-@待入账金额#;
            v_curr_amt=-v_pre_entry_amt;

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

//逻辑_清算期货_清算_数据准备定时任务
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
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_clear_entry_type;
    int v_qry_no;
    int v_record_count;
    int64 v_row_id;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    char v_crncy_type[4];
    int v_exch_no;
    int v_futu_acco_no;
    char v_futu_acco[17];
    int v_contrc_code_no;
    char v_contrc_code[7];
    int v_asset_type;
    int v_contrc_type;
    int v_contrc_unit;
    int64 v_external_no;
    int64 v_comm_id;
    int v_comm_batch_no;
    int v_comm_opor;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_batch_no;
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
    double v_all_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_rece_margin;
    char v_comb_code[7];
    double v_margin_ratio;
    char v_rsp_info[256];
    int64 v_compli_trig_id;
    int v_strike_date;
    double v_fee_qty;
    double v_fee_price;
    char v_exch_crncy_type[4];
    double v_exch_rate;
    double v_service_fee;
    double v_deli_fee;
    double v_other_fee;
    double v_out_rece_margin;
    double v_out_brkage_commis;
    double v_out_service_fee;
    double v_out_report_fee;
    double v_out_cancel_fee;
    double v_out_deli_fee;
    double v_out_other_fee;
    double v_out_other_commis;
    int v_order_no;
    int v_strike_time;
    char v_strike_no[65];
    char v_contrc_name[65];
    int v_margin_pref;
    int v_capit_reback_days;
    int v_posi_reback_days;
    int v_expire_date;
    int v_begin_deli_date;
    int v_end_deli_date;
    double v_deli_price;
    double v_sett_price;
    double v_pre_settle_price;
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
    v_clear_entry_type=0;
    v_qry_no=0;
    v_record_count=0;
    v_row_id=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_crncy_type, "CNY");
    v_exch_no=0;
    v_futu_acco_no=0;
    strcpy(v_futu_acco, " ");
    v_contrc_code_no=0;
    strcpy(v_contrc_code, " ");
    v_asset_type=0;
    v_contrc_type=0;
    v_contrc_unit=0;
    v_external_no=0;
    v_comm_id=0;
    v_comm_batch_no=0;
    v_comm_opor=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_batch_no=0;
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
    v_all_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_rece_margin=0;
    strcpy(v_comb_code, " ");
    v_margin_ratio=0;
    strcpy(v_rsp_info, " ");
    v_compli_trig_id=0;
    v_strike_date=0;
    v_fee_qty=0;
    v_fee_price=0;
    strcpy(v_exch_crncy_type, "CNY");
    v_exch_rate=0;
    v_service_fee=0;
    v_deli_fee=0;
    v_other_fee=0;
    v_out_rece_margin=0;
    v_out_brkage_commis=0;
    v_out_service_fee=0;
    v_out_report_fee=0;
    v_out_cancel_fee=0;
    v_out_deli_fee=0;
    v_out_other_fee=0;
    v_out_other_commis=0;
    v_order_no=0;
    v_strike_time=0;
    strcpy(v_strike_no, " ");
    strcpy(v_contrc_name, " ");
    v_margin_pref=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    v_expire_date=0;
    v_begin_deli_date=0;
    v_end_deli_date=0;
    v_deli_price=0;
    v_sett_price=0;
    v_pre_settle_price=0;
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

    //转入订单记录

    // set @查询序号# = 0;
    v_qry_no = 0;
    // loop_label:loop
    while (true)
    {

        //单记录转入方式，以便前台并发处理
        //调用过程[事务_交易期货_接口_处理清算订单记录]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("tdfutuT.6.11", 0);
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
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.6.11]subcall timed out!");
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
        v_pass_no = lpTSCall1Ans2->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_out_acco, lpTSCall1Ans2->GetString(LDBIZ_OUT_ACCO_STR));
        strcpy(v_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_NO_INT);
        v_futu_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
        strcpy(v_futu_acco, lpTSCall1Ans2->GetString(LDBIZ_FUTU_ACCO_STR));
        v_contrc_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans2->GetString(LDBIZ_CONTRC_CODE_STR));
        v_asset_type = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_type = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_contrc_unit = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_UNIT_INT);
        v_external_no = lpTSCall1Ans2->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
        v_comm_id = lpTSCall1Ans2->GetInt64(LDBIZ_COMM_ID_INT64);
        v_comm_batch_no = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
        v_comm_opor = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_OPOR_INT);
        v_report_date = lpTSCall1Ans2->GetInt32(LDBIZ_REPORT_DATE_INT);
        v_report_time = lpTSCall1Ans2->GetInt32(LDBIZ_REPORT_TIME_INT);
        strcpy(v_report_no, lpTSCall1Ans2->GetString(LDBIZ_REPORT_NO_STR));
        v_order_batch_no = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
        v_order_date = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_DATE_INT);
        v_order_time = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_TIME_INT);
        v_order_dir = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_DIR_INT);
        v_contrc_dir = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans2->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_order_price = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        strcpy(v_order_status, lpTSCall1Ans2->GetString(LDBIZ_ORDER_STATUS_STR));
        v_wtdraw_qty = lpTSCall1Ans2->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
        v_strike_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_strike_price = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
        v_strike_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_all_fee = lpTSCall1Ans2->GetDouble(LDBIZ_ALL_FEE_FLOAT);
        v_trade_commis = lpTSCall1Ans2->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_other_commis = lpTSCall1Ans2->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_report_fee = lpTSCall1Ans2->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
        v_wtdraw_fee = lpTSCall1Ans2->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
        v_rece_margin = lpTSCall1Ans2->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_comb_code, lpTSCall1Ans2->GetString(LDBIZ_COMB_CODE_STR));
        v_margin_ratio = lpTSCall1Ans2->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);
        strcpy(v_rsp_info, lpTSCall1Ans2->GetString(LDBIZ_RSP_INFO_STR));
        v_compli_trig_id = lpTSCall1Ans2->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);


        // if @错误编码# = "0" then
        if (strcmp(v_error_code , "0")==0)
        {

            // set @查询序号# = @记录序号#;
            v_qry_no = v_row_id;

            // set @成交日期# = @订单日期#;
            v_strike_date = v_order_date;

            // set @费用数量# = 0;
            v_fee_qty = 0;

            // set @费用价格# = 0;
            v_fee_price = 0;
            //获取市场本币币种、交易币种、汇率，并计算期货费用，后续按汇率转换
            //调用过程[事务_公共_清算接口_计算期货清算费用]
            //组织事务请求
            if(lpTSCall1Ans3)
            {
              lpTSCall1Ans3->FreeMsg();
              lpTSCall1Ans3=NULL;
            }
            lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.26.61", 0);
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
            lpTSCall1Req3->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
            lpTSCall1Req3->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
            lpTSCall1Req3->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
            lpTSCall1Req3->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
            lpTSCall1Req3->SetDouble(LDBIZ_FEE_QTY_FLOAT,v_fee_qty);
            lpTSCall1Req3->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
            lpTSCall1Req3->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
            lpTSCall1Req3->SetDouble(LDBIZ_FEE_PRICE_FLOAT,v_fee_price);
            lpTSCall1Req3->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
            lpTSCall1Req3->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
            glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
            if(!lpTSCall1Ans3)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.61]subcall timed out!");
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
            strcpy(v_crncy_type, lpTSCall1Ans3->GetString(LDBIZ_CRNCY_TYPE_STR));
            strcpy(v_exch_crncy_type, lpTSCall1Ans3->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
            v_exch_rate = lpTSCall1Ans3->GetDouble(LDBIZ_EXCH_RATE_FLOAT);
            v_rece_margin = lpTSCall1Ans3->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
            v_trade_commis = lpTSCall1Ans3->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
            v_service_fee = lpTSCall1Ans3->GetDouble(LDBIZ_SERVICE_FEE_FLOAT);
            v_report_fee = lpTSCall1Ans3->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
            v_wtdraw_fee = lpTSCall1Ans3->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
            v_deli_fee = lpTSCall1Ans3->GetDouble(LDBIZ_DELI_FEE_FLOAT);
            v_other_fee = lpTSCall1Ans3->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
            v_other_commis = lpTSCall1Ans3->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
            v_out_rece_margin = lpTSCall1Ans3->GetDouble(LDBIZ_OUT_RECE_MARGIN_FLOAT);
            v_out_brkage_commis = lpTSCall1Ans3->GetDouble(LDBIZ_OUT_BRKAGE_COMMIS_FLOAT);
            v_out_service_fee = lpTSCall1Ans3->GetDouble(LDBIZ_OUT_SERVICE_FEE_FLOAT);
            v_out_report_fee = lpTSCall1Ans3->GetDouble(LDBIZ_OUT_REPORT_FEE_FLOAT);
            v_out_cancel_fee = lpTSCall1Ans3->GetDouble(LDBIZ_OUT_CANCEL_FEE_FLOAT);
            v_out_deli_fee = lpTSCall1Ans3->GetDouble(LDBIZ_OUT_DELI_FEE_FLOAT);
            v_out_other_fee = lpTSCall1Ans3->GetDouble(LDBIZ_OUT_OTHER_FEE_FLOAT);
            v_out_other_commis = lpTSCall1Ans3->GetDouble(LDBIZ_OUT_OTHER_COMMIS_FLOAT);


            // set @订单编号# = @记录序号#;
            v_order_no = v_row_id;
            //调用过程[事务_清算期货_清算_转入订单记录]
            //组织事务请求
            if(lpTSCall1Ans4)
            {
              lpTSCall1Ans4->FreeMsg();
              lpTSCall1Ans4=NULL;
            }
            lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("clfutuT.2.6", 0);
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
            lpTSCall1Req4->SetDouble(LDBIZ_EXCH_RATE_FLOAT,v_exch_rate);
            lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req4->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
            lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
            lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
            lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
            lpTSCall1Req4->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
            lpTSCall1Req4->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
            lpTSCall1Req4->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
            lpTSCall1Req4->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
            lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
            lpTSCall1Req4->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
            lpTSCall1Req4->SetInt32(LDBIZ_ORDER_NO_INT,v_order_no);
            lpTSCall1Req4->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
            lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
            lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
            lpTSCall1Req4->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
            lpTSCall1Req4->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
            lpTSCall1Req4->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
            lpTSCall1Req4->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
            lpTSCall1Req4->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
            lpTSCall1Req4->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
            lpTSCall1Req4->SetDouble(LDBIZ_REPORT_FEE_FLOAT,v_report_fee);
            lpTSCall1Req4->SetDouble(LDBIZ_WTDRAW_FEE_FLOAT,v_wtdraw_fee);
            lpTSCall1Req4->SetString(LDBIZ_ORDER_STATUS_STR,v_order_status);
            glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
            if(!lpTSCall1Ans4)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.6]subcall timed out!");
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

        }
        // else
        else
        {


            // if @记录个数# <> 0 then
            if (v_record_count != 0)
            {
                // leave loop_label;
                break;

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

    //转入成交记录

    // set @查询序号# = 0;
    v_qry_no = 0;
    // loop_label:loop
    while (true)
    {

        //单记录转入方式，以便前台并发处理
        //调用过程[事务_交易期货_接口_自动处理清算成交回报]
        //组织事务请求
        if(lpTSCall1Ans5)
        {
          lpTSCall1Ans5->FreeMsg();
          lpTSCall1Ans5=NULL;
        }
        lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("tdfutuT.6.25", 0);
        lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req5->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req5->SetInt32(LDBIZ_QRY_NO_INT,v_qry_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
        if(!lpTSCall1Ans5)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.6.25]subcall timed out!");
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
        v_record_count = lpTSCall1Ans5->GetInt32(LDBIZ_RECORD_COUNT_INT);
        v_row_id = lpTSCall1Ans5->GetInt64(LDBIZ_ROW_ID_INT64);
        v_co_no = lpTSCall1Ans5->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans5->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans5->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans5->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans5->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_out_acco, lpTSCall1Ans5->GetString(LDBIZ_OUT_ACCO_STR));
        v_exch_no = lpTSCall1Ans5->GetInt32(LDBIZ_EXCH_NO_INT);
        v_futu_acco_no = lpTSCall1Ans5->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
        v_contrc_code_no = lpTSCall1Ans5->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        v_contrc_type = lpTSCall1Ans5->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_contrc_unit = lpTSCall1Ans5->GetInt32(LDBIZ_CONTRC_UNIT_INT);
        v_strike_date = lpTSCall1Ans5->GetInt32(LDBIZ_STRIKE_DATE_INT);
        v_strike_time = lpTSCall1Ans5->GetInt32(LDBIZ_STRIKE_TIME_INT);
        strcpy(v_strike_no, lpTSCall1Ans5->GetString(LDBIZ_STRIKE_NO_STR));
        v_report_date = lpTSCall1Ans5->GetInt32(LDBIZ_REPORT_DATE_INT);
        v_report_time = lpTSCall1Ans5->GetInt32(LDBIZ_REPORT_TIME_INT);
        strcpy(v_report_no, lpTSCall1Ans5->GetString(LDBIZ_REPORT_NO_STR));
        v_order_date = lpTSCall1Ans5->GetInt32(LDBIZ_ORDER_DATE_INT);
        v_order_time = lpTSCall1Ans5->GetInt32(LDBIZ_ORDER_TIME_INT);
        v_order_no = lpTSCall1Ans5->GetInt32(LDBIZ_ORDER_NO_INT);
        v_order_dir = lpTSCall1Ans5->GetInt32(LDBIZ_ORDER_DIR_INT);
        v_contrc_dir = lpTSCall1Ans5->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans5->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_order_price = lpTSCall1Ans5->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_wtdraw_qty = lpTSCall1Ans5->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
        v_strike_price = lpTSCall1Ans5->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
        v_strike_qty = lpTSCall1Ans5->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans5->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_all_fee = lpTSCall1Ans5->GetDouble(LDBIZ_ALL_FEE_FLOAT);
        v_rece_margin = lpTSCall1Ans5->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_comb_code, lpTSCall1Ans5->GetString(LDBIZ_COMB_CODE_STR));
        v_margin_ratio = lpTSCall1Ans5->GetDouble(LDBIZ_MARGIN_RATIO_FLOAT);


        // if @错误编码# = "0" then
        if (strcmp(v_error_code , "0")==0)
        {

            // set @查询序号# = @记录序号#;
            v_qry_no = v_row_id;

            // set @费用数量# = @成交数量#;
            v_fee_qty = v_strike_qty;

            // set @费用价格# = @成交价格#;
            v_fee_price = v_strike_price;
            //获取市场本币币种、交易币种、汇率，并计算期货费用，后续按汇率转换
            //调用过程[事务_公共_清算接口_计算期货清算费用]
            //组织事务请求
            if(lpTSCall1Ans6)
            {
              lpTSCall1Ans6->FreeMsg();
              lpTSCall1Ans6=NULL;
            }
            lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("pubT.26.61", 0);
            lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req6->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
            lpTSCall1Req6->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpTSCall1Req6->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
            lpTSCall1Req6->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpTSCall1Req6->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req6->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
            lpTSCall1Req6->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
            lpTSCall1Req6->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
            lpTSCall1Req6->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
            lpTSCall1Req6->SetDouble(LDBIZ_FEE_QTY_FLOAT,v_fee_qty);
            lpTSCall1Req6->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
            lpTSCall1Req6->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
            lpTSCall1Req6->SetDouble(LDBIZ_FEE_PRICE_FLOAT,v_fee_price);
            lpTSCall1Req6->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
            lpTSCall1Req6->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
            glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
            if(!lpTSCall1Ans6)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.61]subcall timed out!");
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
            strcpy(v_crncy_type, lpTSCall1Ans6->GetString(LDBIZ_CRNCY_TYPE_STR));
            strcpy(v_exch_crncy_type, lpTSCall1Ans6->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
            v_exch_rate = lpTSCall1Ans6->GetDouble(LDBIZ_EXCH_RATE_FLOAT);
            v_rece_margin = lpTSCall1Ans6->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
            v_trade_commis = lpTSCall1Ans6->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
            v_service_fee = lpTSCall1Ans6->GetDouble(LDBIZ_SERVICE_FEE_FLOAT);
            v_report_fee = lpTSCall1Ans6->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
            v_wtdraw_fee = lpTSCall1Ans6->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
            v_deli_fee = lpTSCall1Ans6->GetDouble(LDBIZ_DELI_FEE_FLOAT);
            v_other_fee = lpTSCall1Ans6->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
            v_other_commis = lpTSCall1Ans6->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
            v_out_rece_margin = lpTSCall1Ans6->GetDouble(LDBIZ_OUT_RECE_MARGIN_FLOAT);
            v_out_brkage_commis = lpTSCall1Ans6->GetDouble(LDBIZ_OUT_BRKAGE_COMMIS_FLOAT);
            v_out_service_fee = lpTSCall1Ans6->GetDouble(LDBIZ_OUT_SERVICE_FEE_FLOAT);
            v_out_report_fee = lpTSCall1Ans6->GetDouble(LDBIZ_OUT_REPORT_FEE_FLOAT);
            v_out_cancel_fee = lpTSCall1Ans6->GetDouble(LDBIZ_OUT_CANCEL_FEE_FLOAT);
            v_out_deli_fee = lpTSCall1Ans6->GetDouble(LDBIZ_OUT_DELI_FEE_FLOAT);
            v_out_other_fee = lpTSCall1Ans6->GetDouble(LDBIZ_OUT_OTHER_FEE_FLOAT);
            v_out_other_commis = lpTSCall1Ans6->GetDouble(LDBIZ_OUT_OTHER_COMMIS_FLOAT);

            //调用过程[事务_公共_清算接口_获取代码编号合约代码属性]
            //组织事务请求
            if(lpTSCall1Ans7)
            {
              lpTSCall1Ans7->FreeMsg();
              lpTSCall1Ans7=NULL;
            }
            lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("pubT.26.65", 0);
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
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.65]subcall timed out!");
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
            v_exch_no = lpTSCall1Ans7->GetInt32(LDBIZ_EXCH_NO_INT);
            strcpy(v_contrc_code, lpTSCall1Ans7->GetString(LDBIZ_CONTRC_CODE_STR));
            strcpy(v_contrc_name, lpTSCall1Ans7->GetString(LDBIZ_CONTRC_NAME_STR));
            v_contrc_type = lpTSCall1Ans7->GetInt32(LDBIZ_CONTRC_TYPE_INT);
            v_margin_pref = lpTSCall1Ans7->GetInt32(LDBIZ_MARGIN_PREF_INT);
            v_contrc_unit = lpTSCall1Ans7->GetInt32(LDBIZ_CONTRC_UNIT_INT);
            v_capit_reback_days = lpTSCall1Ans7->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
            v_posi_reback_days = lpTSCall1Ans7->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
            v_expire_date = lpTSCall1Ans7->GetInt32(LDBIZ_EXPIRE_DATE_INT);
            v_begin_deli_date = lpTSCall1Ans7->GetInt32(LDBIZ_BEGIN_DELI_DATE_INT);
            v_end_deli_date = lpTSCall1Ans7->GetInt32(LDBIZ_END_DELI_DATE_INT);
            v_deli_price = lpTSCall1Ans7->GetDouble(LDBIZ_DELI_PRICE_FLOAT);

            //调用过程[事务_公共_清算接口_获取期货结算价]
            //组织事务请求
            if(lpTSCall1Ans8)
            {
              lpTSCall1Ans8->FreeMsg();
              lpTSCall1Ans8=NULL;
            }
            lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("pubT.26.66", 0);
            lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req8->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
            lpTSCall1Req8->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
            if(!lpTSCall1Ans8)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.66]subcall timed out!");
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
            v_sett_price = lpTSCall1Ans8->GetDouble(LDBIZ_SETT_PRICE_FLOAT);
            v_pre_settle_price = lpTSCall1Ans8->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);

            //调用过程[事务_清算期货_清算_转入成交记录]
            //组织事务请求
            if(lpTSCall1Ans9)
            {
              lpTSCall1Ans9->FreeMsg();
              lpTSCall1Ans9=NULL;
            }
            lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("clfutuT.2.21", 0);
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
            lpTSCall1Req9->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
            lpTSCall1Req9->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
            lpTSCall1Req9->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
            lpTSCall1Req9->SetDouble(LDBIZ_EXCH_RATE_FLOAT,v_exch_rate);
            lpTSCall1Req9->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req9->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
            lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
            lpTSCall1Req9->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
            lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
            lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
            lpTSCall1Req9->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
            lpTSCall1Req9->SetInt32(LDBIZ_STRIKE_TIME_INT,v_strike_time);
            lpTSCall1Req9->SetString(LDBIZ_STRIKE_NO_STR,v_strike_no);
            lpTSCall1Req9->SetInt32(LDBIZ_REPORT_DATE_INT,v_report_date);
            lpTSCall1Req9->SetInt32(LDBIZ_REPORT_TIME_INT,v_report_time);
            lpTSCall1Req9->SetString(LDBIZ_REPORT_NO_STR,v_report_no);
            lpTSCall1Req9->SetInt32(LDBIZ_ORDER_DATE_INT,v_order_date);
            lpTSCall1Req9->SetInt32(LDBIZ_ORDER_TIME_INT,v_order_time);
            lpTSCall1Req9->SetInt32(LDBIZ_ORDER_NO_INT,v_order_no);
            lpTSCall1Req9->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
            lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
            lpTSCall1Req9->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
            lpTSCall1Req9->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
            lpTSCall1Req9->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
            lpTSCall1Req9->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
            lpTSCall1Req9->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
            lpTSCall1Req9->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
            lpTSCall1Req9->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
            lpTSCall1Req9->SetDouble(LDBIZ_REPORT_FEE_FLOAT,v_report_fee);
            lpTSCall1Req9->SetDouble(LDBIZ_WTDRAW_FEE_FLOAT,v_wtdraw_fee);
            lpTSCall1Req9->SetDouble(LDBIZ_DELI_FEE_FLOAT,v_deli_fee);
            lpTSCall1Req9->SetDouble(LDBIZ_SERVICE_FEE_FLOAT,v_service_fee);
            lpTSCall1Req9->SetDouble(LDBIZ_OTHER_FEE_FLOAT,v_other_fee);
            lpTSCall1Req9->SetDouble(LDBIZ_TRADE_COMMIS_FLOAT,v_trade_commis);
            lpTSCall1Req9->SetDouble(LDBIZ_OTHER_COMMIS_FLOAT,v_other_commis);
            lpTSCall1Req9->SetDouble(LDBIZ_OUT_REPORT_FEE_FLOAT,v_out_report_fee);
            lpTSCall1Req9->SetDouble(LDBIZ_OUT_CANCEL_FEE_FLOAT,v_out_cancel_fee);
            lpTSCall1Req9->SetDouble(LDBIZ_OUT_DELI_FEE_FLOAT,v_out_deli_fee);
            lpTSCall1Req9->SetDouble(LDBIZ_OUT_SERVICE_FEE_FLOAT,v_out_service_fee);
            lpTSCall1Req9->SetDouble(LDBIZ_OUT_OTHER_FEE_FLOAT,v_out_other_fee);
            lpTSCall1Req9->SetDouble(LDBIZ_OUT_BRKAGE_COMMIS_FLOAT,v_out_brkage_commis);
            lpTSCall1Req9->SetDouble(LDBIZ_OUT_OTHER_COMMIS_FLOAT,v_out_other_commis);
            lpTSCall1Req9->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
            lpTSCall1Req9->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
            lpTSCall1Req9->SetInt32(LDBIZ_CLEAR_ENTRY_TYPE_INT,v_clear_entry_type);
            lpTSCall1Req9->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
            glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
            if(!lpTSCall1Ans9)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.21]subcall timed out!");
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

        }
        // else
        else
        {


            // if @记录个数# <> 0 then
            if (v_record_count != 0)
            {
                // leave loop_label;
                break;

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

//逻辑_清算期货_清算_清算处理定时任务
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
    int v_qry_no;
    int v_record_count;
    int64 v_row_id;
    char v_tmp_error_code[33];
    char v_tmp_error_info[256];
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
    v_qry_no=0;
    v_record_count=0;
    v_row_id=0;
    strcpy(v_tmp_error_code, "0");
    strcpy(v_tmp_error_info, " ");
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

    //处理外部期货成交表清算数据

    // set @查询序号# = 0;
    v_qry_no = 0;
    // loop_label:loop
    while (true)
    {

        //调用过程[事务_清算期货_清算_清算处理]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("clfutuT.2.37", 0);
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
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.37]subcall timed out!");
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


        // if @错误编码# <> "0"  then
        if (strcmp(v_error_code , "0" )!=0)
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
                //调用过程[事务_清算期货_清算_设置成交记录处理标志]
                //组织事务请求
                if(lpTSCall1Ans3)
                {
                  lpTSCall1Ans3->FreeMsg();
                  lpTSCall1Ans3=NULL;
                }
                lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("clfutuT.2.26", 0);
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
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.26]subcall timed out!");
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


        // set @查询序号# =@记录序号#;
        v_qry_no =v_row_id;
    // end loop;
    }

    //订单费用处理
    // loop_label:loop
    while (true)
    {

        //调用过程[事务_清算期货_清算_订单费用处理]
        //组织事务请求
        if(lpTSCall1Ans4)
        {
          lpTSCall1Ans4->FreeMsg();
          lpTSCall1Ans4=NULL;
        }
        lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("clfutuT.2.38", 0);
        lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req4->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
        if(!lpTSCall1Ans4)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.38]subcall timed out!");
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


        // if @错误编码# <> "0" and @记录个数# <> 0 then
        if (strcmp(v_error_code , "0")!=0 && v_record_count != 0)
        {

            // set @临时_错误编码# = @错误编码#;
            strcpy(v_tmp_error_code,v_error_code);

            // set @临时_错误信息# = @错误信息#;
            strcpy(v_tmp_error_info,v_error_info);

            // set @处理标志# = 《处理标志-处理失败》;
            v_deal_flag = 4;
            //调用过程[事务_清算期货_清算_设置订单记录处理标志]
            //组织事务请求
            if(lpTSCall1Ans5)
            {
              lpTSCall1Ans5->FreeMsg();
              lpTSCall1Ans5=NULL;
            }
            lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("clfutuT.2.11", 0);
            lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req5->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
            lpTSCall1Req5->SetInt32(LDBIZ_DEAL_FLAG_INT,v_deal_flag);
            glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
            if(!lpTSCall1Ans5)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.11]subcall timed out!");
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

    // end loop;
    }

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

//逻辑_清算期货_清算_入账处理定时任务
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
    int v_qry_no;
    int v_record_count;
    int64 v_row_id;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    double v_exch_rate;
    int v_exch_no;
    int v_futu_acco_no;
    int v_contrc_code_no;
    int v_contrc_type;
    int v_contrc_unit;
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
    int v_contrc_dir;
    int v_lngsht_type;
    int v_hedge_type;
    double v_order_price;
    double v_order_qty;
    double v_pre_settle_price;
    double v_sett_price;
    double v_strike_price;
    double v_strike_qty;
    double v_strike_amt;
    int v_strike_num;
    double v_pre_entry_qty;
    double v_pre_entry_amt;
    double v_rece_margin;
    char v_comb_code[7];
    double v_long_hold_margin;
    double v_short_hold_margin;
    double v_sett_capt_margin;
    double v_sett_close_pandl;
    double v_sett_marked_pandl;
    double v_sett_close_pandl_today;
    double v_all_fee;
    double v_report_fee;
    double v_wtdraw_fee;
    double v_deli_fee;
    double v_service_fee;
    double v_other_fee;
    double v_trade_commis;
    double v_other_commis;
    double v_out_all_fee;
    double v_out_report_fee;
    double v_out_cancel_fee;
    double v_out_deli_fee;
    double v_out_service_fee;
    double v_out_other_fee;
    double v_out_brkage_commis;
    double v_out_other_commis;
    int v_busi_flag;
    char v_entry_status[3];
    char v_undo_status[3];
    int64 v_entry_money_jour_no;
    int64 v_entry_posi_jour_no;
    int64 v_deli_jour_no;
    double v_open_amount;
    int v_arrive_date;
    char v_tmp_error_info[256];
    double v_sett_fee;
    double v_capt_margin;
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
    v_qry_no=0;
    v_record_count=0;
    v_row_id=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_exch_rate=0;
    v_exch_no=0;
    v_futu_acco_no=0;
    v_contrc_code_no=0;
    v_contrc_type=0;
    v_contrc_unit=0;
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
    v_contrc_dir=0;
    v_lngsht_type=0;
    v_hedge_type=0;
    v_order_price=0;
    v_order_qty=0;
    v_pre_settle_price=0;
    v_sett_price=0;
    v_strike_price=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_strike_num=0;
    v_pre_entry_qty=0;
    v_pre_entry_amt=0;
    v_rece_margin=0;
    strcpy(v_comb_code, " ");
    v_long_hold_margin=0;
    v_short_hold_margin=0;
    v_sett_capt_margin=0;
    v_sett_close_pandl=0;
    v_sett_marked_pandl=0;
    v_sett_close_pandl_today=0;
    v_all_fee=0;
    v_report_fee=0;
    v_wtdraw_fee=0;
    v_deli_fee=0;
    v_service_fee=0;
    v_other_fee=0;
    v_trade_commis=0;
    v_other_commis=0;
    v_out_all_fee=0;
    v_out_report_fee=0;
    v_out_cancel_fee=0;
    v_out_deli_fee=0;
    v_out_service_fee=0;
    v_out_other_fee=0;
    v_out_brkage_commis=0;
    v_out_other_commis=0;
    v_busi_flag=0;
    strcpy(v_entry_status, "0");
    strcpy(v_undo_status, "0");
    v_entry_money_jour_no=0;
    v_entry_posi_jour_no=0;
    v_deli_jour_no=0;
    v_open_amount=0;
    v_arrive_date=0;
    strcpy(v_tmp_error_info, " ");
    v_sett_fee=0;
    v_capt_margin=0;
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

    //处理期货清算结算待入账记录表数据

    // set @查询序号# =0;
    v_qry_no =0;
    // loop_label:loop
    while (true)
    {

        //调用过程[事务_清算期货_清算_自动更新获取待入账记录]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("clfutuT.2.86", 0);
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
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.86]subcall timed out!");
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
        v_pass_no = lpTSCall1Ans2->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_out_acco, lpTSCall1Ans2->GetString(LDBIZ_OUT_ACCO_STR));
        strcpy(v_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_CRNCY_TYPE_STR));
        strcpy(v_exch_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_exch_rate = lpTSCall1Ans2->GetDouble(LDBIZ_EXCH_RATE_FLOAT);
        v_exch_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_NO_INT);
        v_futu_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
        v_contrc_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        v_contrc_type = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_contrc_unit = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_UNIT_INT);
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
        v_contrc_dir = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_lngsht_type = lpTSCall1Ans2->GetInt32(LDBIZ_LNGSHT_TYPE_INT);
        v_hedge_type = lpTSCall1Ans2->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_order_price = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_pre_settle_price = lpTSCall1Ans2->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
        v_sett_price = lpTSCall1Ans2->GetDouble(LDBIZ_SETT_PRICE_FLOAT);
        v_strike_price = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
        v_strike_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
        v_strike_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
        v_strike_num = lpTSCall1Ans2->GetInt32(LDBIZ_STRIKE_NUM_INT);
        v_pre_entry_qty = lpTSCall1Ans2->GetDouble(LDBIZ_PRE_ENTRY_QTY_FLOAT);
        v_pre_entry_amt = lpTSCall1Ans2->GetDouble(LDBIZ_PRE_ENTRY_AMT_FLOAT);
        v_rece_margin = lpTSCall1Ans2->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_comb_code, lpTSCall1Ans2->GetString(LDBIZ_COMB_CODE_STR));
        v_long_hold_margin = lpTSCall1Ans2->GetDouble(LDBIZ_LONG_HOLD_MARGIN_FLOAT);
        v_short_hold_margin = lpTSCall1Ans2->GetDouble(LDBIZ_SHORT_HOLD_MARGIN_FLOAT);
        v_sett_capt_margin = lpTSCall1Ans2->GetDouble(LDBIZ_SETT_CAPT_MARGIN_FLOAT);
        v_sett_close_pandl = lpTSCall1Ans2->GetDouble(LDBIZ_SETT_CLOSE_PANDL_FLOAT);
        v_sett_marked_pandl = lpTSCall1Ans2->GetDouble(LDBIZ_SETT_MARKED_PANDL_FLOAT);
        v_sett_close_pandl_today = lpTSCall1Ans2->GetDouble(LDBIZ_SETT_CLOSE_PANDL_TODAY_FLOAT);
        v_all_fee = lpTSCall1Ans2->GetDouble(LDBIZ_ALL_FEE_FLOAT);
        v_report_fee = lpTSCall1Ans2->GetDouble(LDBIZ_REPORT_FEE_FLOAT);
        v_wtdraw_fee = lpTSCall1Ans2->GetDouble(LDBIZ_WTDRAW_FEE_FLOAT);
        v_deli_fee = lpTSCall1Ans2->GetDouble(LDBIZ_DELI_FEE_FLOAT);
        v_service_fee = lpTSCall1Ans2->GetDouble(LDBIZ_SERVICE_FEE_FLOAT);
        v_other_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
        v_trade_commis = lpTSCall1Ans2->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_other_commis = lpTSCall1Ans2->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_out_all_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OUT_ALL_FEE_FLOAT);
        v_out_report_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OUT_REPORT_FEE_FLOAT);
        v_out_cancel_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OUT_CANCEL_FEE_FLOAT);
        v_out_deli_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OUT_DELI_FEE_FLOAT);
        v_out_service_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OUT_SERVICE_FEE_FLOAT);
        v_out_other_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OUT_OTHER_FEE_FLOAT);
        v_out_brkage_commis = lpTSCall1Ans2->GetDouble(LDBIZ_OUT_BRKAGE_COMMIS_FLOAT);
        v_out_other_commis = lpTSCall1Ans2->GetDouble(LDBIZ_OUT_OTHER_COMMIS_FLOAT);
        v_busi_flag = lpTSCall1Ans2->GetInt32(LDBIZ_BUSI_FLAG_INT);
        strcpy(v_entry_status, lpTSCall1Ans2->GetString(LDBIZ_ENTRY_STATUS_STR));
        strcpy(v_undo_status, lpTSCall1Ans2->GetString(LDBIZ_UNDO_STATUS_STR));
        v_entry_money_jour_no = lpTSCall1Ans2->GetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
        v_entry_posi_jour_no = lpTSCall1Ans2->GetInt64(LDBIZ_ENTRY_POSI_JOUR_NO_INT64);
        v_deli_jour_no = lpTSCall1Ans2->GetInt64(LDBIZ_DELI_JOUR_NO_INT64);
        v_open_amount = lpTSCall1Ans2->GetDouble(LDBIZ_OPEN_AMOUNT_FLOAT);


        // set @到账日期#=0;
        v_arrive_date=0;

        // if @错误编码# = "0" then
        if (strcmp(v_error_code , "0")==0)
        {

            // set @查询序号# = @记录序号#;
            v_qry_no = v_row_id;

            // set @临时_错误信息#="";
            strcpy(v_tmp_error_info,"");
            //期货资金入账处理，包括成交清算、费用入账、盯市盈亏入账、占用保证金入账
            //盯市盈亏入账时，调用单独的事务_清算期货_清算_期货盯市盈亏入账处理，其他调用事务_产品期货_清算接口_清算资金入账处理

            // if (@待入账金额# <> 0) or (@待入账数量# <> 0)  then
            if ((v_pre_entry_amt != 0) || (v_pre_entry_qty != 0) )
            {

                // set @清算费用#=-@全部费用#;
                v_sett_fee=-v_all_fee;

                // set @占用保证金#=@清算占用保证金#;
                v_capt_margin=v_sett_capt_margin;

                // set @变动金额# = @待入账金额#;
                v_occur_amt = v_pre_entry_amt;

                // set @变动数量# = @待入账数量#;
                v_occur_qty = v_pre_entry_qty;

                // set @备注信息# = "清算资金持仓入账！";
                strcpy(v_remark_info,"清算资金持仓入账！");
                //调用过程[事务_产品期货_清算接口_清算资金持仓入账]
                //组织事务请求
                if(lpTSCall1Ans3)
                {
                  lpTSCall1Ans3->FreeMsg();
                  lpTSCall1Ans3=NULL;
                }
                lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdfutuT.5.101", 0);
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
                lpTSCall1Req3->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
                lpTSCall1Req3->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
                lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpTSCall1Req3->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
                lpTSCall1Req3->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
                lpTSCall1Req3->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
                lpTSCall1Req3->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
                lpTSCall1Req3->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
                lpTSCall1Req3->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
                lpTSCall1Req3->SetDouble(LDBIZ_OCCUR_QTY_FLOAT,v_occur_qty);
                lpTSCall1Req3->SetDouble(LDBIZ_OCCUR_AMT_FLOAT,v_occur_amt);
                lpTSCall1Req3->SetInt32(LDBIZ_BUSI_FLAG_INT,v_busi_flag);
                lpTSCall1Req3->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
                lpTSCall1Req3->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
                lpTSCall1Req3->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
                lpTSCall1Req3->SetDouble(LDBIZ_OPEN_AMOUNT_FLOAT,v_open_amount);
                glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
                if(!lpTSCall1Ans3)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.5.101]subcall timed out!");
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
                v_entry_money_jour_no = lpTSCall1Ans3->GetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
                v_entry_exgp_posi_jour_no = lpTSCall1Ans3->GetInt64(LDBIZ_ENTRY_EXGP_POSI_JOUR_NO_INT64);
                v_entry_asac_posi_jour_no = lpTSCall1Ans3->GetInt64(LDBIZ_ENTRY_ASAC_POSI_JOUR_NO_INT64);


                // if @错误编码# <> "0" then
                if (strcmp(v_error_code , "0")!=0)
                {

                    // set @临时_错误编码# = @错误编码#;
                    strcpy(v_tmp_error_code,v_error_code);

                    // set @临时_错误信息# = @错误信息#;
                    strcpy(v_tmp_error_info,v_error_info);

                    // set @入账状态# = 《入账状态-处理失败》;
                    strcpy(v_entry_status,"4");
                    //调用过程[事务_清算期货_清算_更新待入账记录]
                    //组织事务请求
                    if(lpTSCall1Ans4)
                    {
                      lpTSCall1Ans4->FreeMsg();
                      lpTSCall1Ans4=NULL;
                    }
                    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("clfutuT.2.57", 0);
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
                    lpTSCall1Req4->SetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64,v_entry_money_jour_no);
                    lpTSCall1Req4->SetInt64(LDBIZ_ENTRY_EXGP_POSI_JOUR_NO_INT64,v_entry_exgp_posi_jour_no);
                    lpTSCall1Req4->SetInt64(LDBIZ_ENTRY_ASAC_POSI_JOUR_NO_INT64,v_entry_asac_posi_jour_no);
                    lpTSCall1Req4->SetString(LDBIZ_ENTRY_STATUS_STR,v_entry_status);
                    lpTSCall1Req4->SetString(LDBIZ_UNDO_STATUS_STR,v_undo_status);
                    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
                    if(!lpTSCall1Ans4)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.57]subcall timed out!");
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


                    // set @入账资金流水号#=@记录序号#;
                    v_entry_money_jour_no=v_row_id;

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

//逻辑_清算期货_清算_获取汇总统计值
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

    //调用过程[事务_交易期货_接口_获取清算转入成交统计]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.6.23", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.6.23]subcall timed out!");
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

    //调用过程[事务_清算期货_清算_获取清算处理统计值]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("clfutuT.2.72", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.72]subcall timed out!");
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

//逻辑_清算期货_清算_查询交易组持仓序号
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

    //调用过程[事务_产品期货_清算接口_查询交易组持仓序号]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdfutuT.5.103", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.5.103]subcall timed out!");
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


    // set @指定行数# =2;
    v_row_count =2;

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

//逻辑_清算期货_清算_查询成交回报序号
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

    //调用过程[事务_交易期货_接口_查询成交回报记录序号]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.6.24", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.6.24]subcall timed out!");
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

//逻辑_清算期货_清算_查询成交序号
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

    //调用过程[事务_清算期货_清算_查询成交序号]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clfutuT.2.84", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.84]subcall timed out!");
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

//逻辑_清算期货_清算_查询待入账记录序号
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

    //调用过程[事务_清算期货_清算_查询待入账记录序号]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clfutuT.2.85", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.85]subcall timed out!");
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

