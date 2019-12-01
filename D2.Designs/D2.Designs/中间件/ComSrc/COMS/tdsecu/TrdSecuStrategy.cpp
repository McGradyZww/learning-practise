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
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.11.1");
        bizFuncInfo->lpFunc = fnFunc0;
    }
    else if (iFunIndex==1)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.11.2");
        bizFuncInfo->lpFunc = fnFunc1;
    }
    else if (iFunIndex==2)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.11.11");
        bizFuncInfo->lpFunc = fnFunc2;
    }
    else if (iFunIndex==3)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.11.12");
        bizFuncInfo->lpFunc = fnFunc3;
    }
    else if (iFunIndex==4)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.11.13");
        bizFuncInfo->lpFunc = fnFunc4;
    }
    else if (iFunIndex==5)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.11.14");
        bizFuncInfo->lpFunc = fnFunc5;
    }
    else if (iFunIndex==6)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.11.15");
        bizFuncInfo->lpFunc = fnFunc6;
    }
    else if (iFunIndex==7)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.11.16");
        bizFuncInfo->lpFunc = fnFunc7;
    }
    else if (iFunIndex==8)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.11.101");
        bizFuncInfo->lpFunc = fnFunc8;
    }
    else if (iFunIndex==9)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.11.102");
        bizFuncInfo->lpFunc = fnFunc9;
    }
    else if (iFunIndex==10)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.11.103");
        bizFuncInfo->lpFunc = fnFunc10;
    }
    else if (iFunIndex==11)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.11.104");
        bizFuncInfo->lpFunc = fnFunc11;
    }
    else if (iFunIndex==12)
    {
        strcpy(bizFuncInfo->szFuncName, "tdsecuL.11.105");
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
    return "20190723";
}

//逻辑_交易证券_策略_策略插件上线
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
    int v_strategy_plugin_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_strategy_plugin_status[3];
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
    v_strategy_plugin_type=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_strategy_plugin_status, " ");
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
    v_strategy_plugin_type = lpInBizMsg->GetInt32(LDBIZ_STRATEGY_PLUGIN_TYPE_INT);

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

    //调用过程[事务_交易证券_策略_策略插件上线]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.1", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_STRATEGY_PLUGIN_TYPE_INT,v_strategy_plugin_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.1]subcall timed out!");
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
    strcpy(v_strategy_plugin_status, lpTSCall1Ans1->GetString(LDBIZ_STRATEGY_PLUGIN_STATUS_STR));


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
    lpOutBizMsg->SetString(LDBIZ_STRATEGY_PLUGIN_STATUS_STR,v_strategy_plugin_status);
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    return iRet;
}

//逻辑_交易证券_策略_策略插件下线
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
    int v_strategy_plugin_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_strategy_plugin_status[3];
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
    v_strategy_plugin_type=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_strategy_plugin_status, " ");
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
    v_strategy_plugin_type = lpInBizMsg->GetInt32(LDBIZ_STRATEGY_PLUGIN_TYPE_INT);

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

    //调用过程[事务_交易证券_策略_策略插件下线]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.2", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_STRATEGY_PLUGIN_TYPE_INT,v_strategy_plugin_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.2]subcall timed out!");
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
    strcpy(v_strategy_plugin_status, lpTSCall1Ans1->GetString(LDBIZ_STRATEGY_PLUGIN_STATUS_STR));


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
    lpOutBizMsg->SetString(LDBIZ_STRATEGY_PLUGIN_STATUS_STR,v_strategy_plugin_status);
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    return iRet;
}

//逻辑_交易证券_策略_新增策略
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
    int v_comm_opor;
    int v_co_no;
    char v_pd_code[33];
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_strategy_batch_no;
    char v_strategy_exec_broker[17];
    char v_strategy_exec_comm_str[2049];
    int v_strategy_exec_kind;
    int v_exch_no;
    char v_stock_code[7];
    int v_strategy_dir;
    double v_strategy_qty;
    double v_cash_strategy_qty;
    double v_strategy_price;
    int v_price_type;
    double v_strategy_amt;
    int v_strategy_valid_type;
    char v_strategy_rule_way[5];
    char v_remark_info[256];
    int v_margin_trade_type;
    char v_target_strategy_type[17];
    char v_target_strategy_param[2049];
    int64 v_external_no;
    int v_order_batch_no;
    char v_strategy_oper_way[3];
    int v_strategy_price_type;
    int v_comm_batch_no;
    int64 v_comm_id;
    int64 v_basket_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_strategy_id;
    int v_strategy_time;
    int v_comm_dir;
    int v_order_dir;
    double v_comm_limit_price;
    double v_order_price;
    double v_comm_qty;
    double v_order_qty;
    int v_comm_executor;
    int v_init_date;
    char v_sys_config_str[65];
    int v_pd_no;
    char v_co_busi_config_str[65];
    char v_exgp_busi_config_str[65];
    int v_stock_code_no;
    int v_stock_type;
    int v_asset_type;
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
    int v_pass_no;
    char v_out_acco[33];
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
    int v_asset_acco_type;
    int v_sell_auto_back_debt;
    double v_limit_actual_price;
    int v_stock_acco_no;
    char v_stock_acco[17];
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
    double v_order_frozen_amt;
    int v_trig_stage_type;
    int64 v_compli_trig_id;
    int v_strategy_date;
    char v_strategy_status[3];
    int v_update_times;
    int64 v_row_id;
    int v_busi_opor_no;
    char v_strategy_contr_comm[2049];
    char v_strategy_sum_status[3];
    char v_strategy_deal_status[3];
    int v_strategy_deal_kind;
    double v_valid_order_qty;
    double v_order_amt;
    double v_wtdraw_qty;
    double v_valid_wtdraw_qty;
    double v_strike_qty;
    double v_strike_amt;
    double v_cancel_qty;
    double v_faild_qty;
    int v_comm_date;
    int v_comm_time;
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
    char v_combo_code[33];
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
    v_co_no=0;
    strcpy(v_pd_code, " ");
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_strategy_batch_no=0;
    strcpy(v_strategy_exec_broker, " ");
    strcpy(v_strategy_exec_comm_str, " ");
    v_strategy_exec_kind=0;
    v_exch_no=0;
    strcpy(v_stock_code, " ");
    v_strategy_dir=0;
    v_strategy_qty=0;
    v_cash_strategy_qty=0;
    v_strategy_price=0;
    v_price_type=0;
    v_strategy_amt=0;
    v_strategy_valid_type=0;
    strcpy(v_strategy_rule_way, " ");
    strcpy(v_remark_info, " ");
    v_margin_trade_type=0;
    strcpy(v_target_strategy_type, " ");
    strcpy(v_target_strategy_param, " ");
    v_external_no=0;
    v_order_batch_no=0;
    strcpy(v_strategy_oper_way, " ");
    v_strategy_price_type=0;
    v_comm_batch_no=0;
    v_comm_id=0;
    v_basket_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_strategy_id=0;
    v_strategy_time=0;
    v_comm_dir=0;
    v_order_dir=0;
    v_comm_limit_price=0;
    v_order_price=0;
    v_comm_qty=0;
    v_order_qty=0;
    v_comm_executor=0;
    v_init_date=0;
    strcpy(v_sys_config_str, " ");
    v_pd_no=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_exgp_busi_config_str, " ");
    v_stock_code_no=0;
    v_stock_type=0;
    v_asset_type=0;
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
    v_pass_no=0;
    strcpy(v_out_acco, " ");
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
    v_asset_acco_type=0;
    v_sell_auto_back_debt=0;
    v_limit_actual_price=0;
    v_stock_acco_no=0;
    strcpy(v_stock_acco, " ");
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
    v_order_frozen_amt=0;
    v_trig_stage_type=0;
    v_compli_trig_id=0;
    v_strategy_date=0;
    strcpy(v_strategy_status, " ");
    v_update_times=1;
    v_row_id=0;
    v_busi_opor_no=0;
    strcpy(v_strategy_contr_comm, " ");
    strcpy(v_strategy_sum_status, " ");
    strcpy(v_strategy_deal_status, " ");
    v_strategy_deal_kind=0;
    v_valid_order_qty=0;
    v_order_amt=0;
    v_wtdraw_qty=0;
    v_valid_wtdraw_qty=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_cancel_qty=0;
    v_faild_qty=0;
    v_comm_date=0;
    v_comm_time=0;
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
    strcpy(v_combo_code, " ");
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    strncpy(v_pd_code, lpInBizMsg->GetString(LDBIZ_PD_CODE_STR),32);
    v_pd_code[32] = '\0';
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_strategy_batch_no = lpInBizMsg->GetInt32(LDBIZ_STRATEGY_BATCH_NO_INT);
    strncpy(v_strategy_exec_broker, lpInBizMsg->GetString(LDBIZ_STRATEGY_EXEC_BROKER_STR),16);
    v_strategy_exec_broker[16] = '\0';
    strncpy(v_strategy_exec_comm_str, lpInBizMsg->GetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR),2048);
    v_strategy_exec_comm_str[2048] = '\0';
    v_strategy_exec_kind = lpInBizMsg->GetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    strncpy(v_stock_code, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR),6);
    v_stock_code[6] = '\0';
    v_strategy_dir = lpInBizMsg->GetInt32(LDBIZ_STRATEGY_DIR_INT);
    v_strategy_qty = lpInBizMsg->GetDouble(LDBIZ_STRATEGY_QTY_FLOAT);
    v_cash_strategy_qty = lpInBizMsg->GetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT);
    v_strategy_price = lpInBizMsg->GetDouble(LDBIZ_STRATEGY_PRICE_FLOAT);
    v_price_type = lpInBizMsg->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strategy_amt = lpInBizMsg->GetDouble(LDBIZ_STRATEGY_AMT_FLOAT);
    v_strategy_valid_type = lpInBizMsg->GetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT);
    strncpy(v_strategy_rule_way, lpInBizMsg->GetString(LDBIZ_STRATEGY_RULE_WAY_STR),4);
    v_strategy_rule_way[4] = '\0';
    strncpy(v_remark_info, lpInBizMsg->GetString(LDBIZ_REMARK_INFO_STR),255);
    v_remark_info[255] = '\0';
    v_margin_trade_type = lpInBizMsg->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
    strncpy(v_target_strategy_type, lpInBizMsg->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR),16);
    v_target_strategy_type[16] = '\0';
    strncpy(v_target_strategy_param, lpInBizMsg->GetString(LDBIZ_TARGET_STRATEGY_PARAM_STR),2048);
    v_target_strategy_param[2048] = '\0';
    v_external_no = lpInBizMsg->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpInBizMsg->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strncpy(v_strategy_oper_way, lpInBizMsg->GetString(LDBIZ_STRATEGY_OPER_WAY_STR),2);
    v_strategy_oper_way[2] = '\0';
    v_strategy_price_type = lpInBizMsg->GetInt32(LDBIZ_STRATEGY_PRICE_TYPE_INT);
    v_comm_batch_no = lpInBizMsg->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    v_basket_id = lpInBizMsg->GetInt64(LDBIZ_BASKET_ID_INT64);

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


    // set @指令方向# = @策略方向#;
    v_comm_dir = v_strategy_dir;

    // set @订单方向# = @策略方向#;
    v_order_dir = v_strategy_dir;

    // set @指令限价# = @策略价格#;
    v_comm_limit_price = v_strategy_price;

    // set @订单价格# = @策略价格#;
    v_order_price = v_strategy_price;

    // set @指令数量# = @策略数量#;
    v_comm_qty = v_strategy_qty;

    // set @订单数量# = @策略数量#;
    v_order_qty = v_strategy_qty;

    // set @指令执行人# = 0;
    v_comm_executor = 0;

    // if @指令下达人# = 0 then
    if (v_comm_opor == 0)
    {

        // set @指令下达人# = @操作员编号#;
        v_comm_opor = v_opor_no;
    // end if;
    }

    //公共子系统检查，检查状态、身份、权限等
    //调用过程[事务_公共_交易接口_检查交易市场状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.25.22", 0);
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
    lpTSCall1Req0->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req0->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req0->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req0->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.22]subcall timed out!");
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
    strcpy(v_sys_config_str, lpTSCall1Ans0->GetString(LDBIZ_SYS_CONFIG_STR_STR));
    v_pd_no = lpTSCall1Ans0->GetInt32(LDBIZ_PD_NO_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));
    strcpy(v_exgp_busi_config_str, lpTSCall1Ans0->GetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR));
    v_stock_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_stock_type = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_crncy_type, lpTSCall1Ans0->GetString(LDBIZ_CRNCY_TYPE_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans0->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_buy_ref_rate = lpTSCall1Ans0->GetDouble(LDBIZ_BUY_REF_RATE_FLOAT);
    v_sell_ref_rate = lpTSCall1Ans0->GetDouble(LDBIZ_SELL_REF_RATE_FLOAT);
    v_par_value = lpTSCall1Ans0->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
    v_impawn_ratio = lpTSCall1Ans0->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
    v_net_price_flag = lpTSCall1Ans0->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
    v_intrst_days = lpTSCall1Ans0->GetInt32(LDBIZ_INTRST_DAYS_INT);
    v_bond_rate_type = lpTSCall1Ans0->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
    v_bond_accr_intrst = lpTSCall1Ans0->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
    v_target_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
    strcpy(v_target_code, lpTSCall1Ans0->GetString(LDBIZ_TARGET_CODE_STR));
    v_target_code_stock_type = lpTSCall1Ans0->GetInt32(LDBIZ_TARGET_CODE_STOCK_TYPE_INT);
    v_target_code_asset_type = lpTSCall1Ans0->GetInt32(LDBIZ_TARGET_CODE_ASSET_TYPE_INT);
    v_trade_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
    strcpy(v_trade_code, lpTSCall1Ans0->GetString(LDBIZ_TRADE_CODE_STR));
    v_trade_code_stock_type = lpTSCall1Ans0->GetInt32(LDBIZ_TRADE_CODE_STOCK_TYPE_INT);
    v_trade_code_asset_type = lpTSCall1Ans0->GetInt32(LDBIZ_TRADE_CODE_ASSET_TYPE_INT);
    v_min_unit = lpTSCall1Ans0->GetInt32(LDBIZ_MIN_UNIT_INT);
    v_up_limit_price = lpTSCall1Ans0->GetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT);
    v_down_limit_price = lpTSCall1Ans0->GetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
    v_last_price = lpTSCall1Ans0->GetDouble(LDBIZ_LAST_PRICE_FLOAT);
    v_capit_reback_days = lpTSCall1Ans0->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
    v_posi_reback_days = lpTSCall1Ans0->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
    v_apply_date = lpTSCall1Ans0->GetInt32(LDBIZ_APPLY_DATE_INT);
    v_subscription_trade_mark = lpTSCall1Ans0->GetInt32(LDBIZ_SUBSCRIPTION_TRADE_MARK_INT);
    v_purchase_trade_mark = lpTSCall1Ans0->GetInt32(LDBIZ_PURCHASE_TRADE_MARK_INT);
    v_rede_trade_mark = lpTSCall1Ans0->GetInt32(LDBIZ_REDE_TRADE_MARK_INT);
    v_first_minimum_amt = lpTSCall1Ans0->GetDouble(LDBIZ_FIRST_MINIMUM_AMT_FLOAT);
    v_minimum_purchase_amt = lpTSCall1Ans0->GetDouble(LDBIZ_MINIMUM_PURCHASE_AMT_FLOAT);
    v_minimum_subscription_amt = lpTSCall1Ans0->GetDouble(LDBIZ_MINIMUM_SUBSCRIPTION_AMT_FLOAT);
    v_minimum_rede_share = lpTSCall1Ans0->GetDouble(LDBIZ_MINIMUM_REDE_SHARE_FLOAT);
    v_minimum_holding_share = lpTSCall1Ans0->GetDouble(LDBIZ_MINIMUM_HOLDING_SHARE_FLOAT);
    strcpy(v_trade_acco, lpTSCall1Ans0->GetString(LDBIZ_TRADE_ACCO_STR));


    // set @业务控制配置串# = @交易组业务控制配置串#;
    strcpy(v_busi_config_str,v_exgp_busi_config_str);

    // set @订单方向# = @指令方向#;
    v_order_dir = v_comm_dir;

    // set @业务控制串# = "11111";
    strcpy(v_busi_ctrl_str,"11111");
    //调用过程[事务_产品_交易接口_检查交易产品账户信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.8.21", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req1->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req1->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req1->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    lpTSCall1Req1->SetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT,v_up_limit_price);
    lpTSCall1Req1->SetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT,v_down_limit_price);
    lpTSCall1Req1->SetDouble(LDBIZ_LAST_PRICE_FLOAT,v_last_price);
    lpTSCall1Req1->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
    lpTSCall1Req1->SetString(LDBIZ_BUSI_CONFIG_STR_STR,v_busi_config_str);
    lpTSCall1Req1->SetString(LDBIZ_SYS_CONFIG_STR_STR,v_sys_config_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.8.21]subcall timed out!");
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
    v_order_market_price = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_MARKET_PRICE_FLOAT);
    v_sys_type = lpTSCall1Ans1->GetInt32(LDBIZ_SYS_TYPE_INT);
    strcpy(v_opor_no_str1, lpTSCall1Ans1->GetString(LDBIZ_OPOR_NO_STR1_STR));
    strcpy(v_opor_no_str2, lpTSCall1Ans1->GetString(LDBIZ_OPOR_NO_STR2_STR));
    strcpy(v_opor_no_str3, lpTSCall1Ans1->GetString(LDBIZ_OPOR_NO_STR3_STR));
    v_fina_limit_max = lpTSCall1Ans1->GetDouble(LDBIZ_FINA_LIMIT_MAX_FLOAT);
    v_loan_limit_max = lpTSCall1Ans1->GetDouble(LDBIZ_LOAN_LIMIT_MAX_FLOAT);
    v_asset_acco_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);
    v_sell_auto_back_debt = lpTSCall1Ans1->GetInt32(LDBIZ_SELL_AUTO_BACK_DEBT_INT);


    // set @指令实际限价#= @订单市价价格#;
    v_limit_actual_price= v_order_market_price;

    // set @订单方向# = @指令方向#;
    v_order_dir = v_comm_dir;

    // set @订单数量# = @指令数量#;
    v_order_qty = v_comm_qty;

    // set @订单价格# = @指令实际限价#;
    v_order_price = v_limit_actual_price;
    //检查股东，获取可用
    //调用过程[事务_产品证券_交易接口_检查账户状态获取可用]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.6.1", 0);
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
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req2->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
    lpTSCall1Req2->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req2->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req2->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req2->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.6.1]subcall timed out!");
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
    strcpy(v_stock_acco, lpTSCall1Ans2->GetString(LDBIZ_STOCK_ACCO_STR));
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
    v_exgp_avail_qty = lpTSCall1Ans2->GetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT);
    v_exgp_target_code_avail_qty = lpTSCall1Ans2->GetDouble(LDBIZ_EXGP_TARGET_CODE_AVAIL_QTY_FLOAT);
    v_exgp_trade_code_avail_qty = lpTSCall1Ans2->GetDouble(LDBIZ_EXGP_TRADE_CODE_AVAIL_QTY_FLOAT);
    v_asac_avail_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT);
    v_asac_target_code_avail_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_TARGET_CODE_AVAIL_QTY_FLOAT);
    v_asac_trade_code_avail_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_TRADE_CODE_AVAIL_QTY_FLOAT);
    v_exgp_loan_sell_amt = lpTSCall1Ans2->GetDouble(LDBIZ_EXGP_LOAN_SELL_AMT_FLOAT);
    v_asac_loan_sell_amt = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_LOAN_SELL_AMT_FLOAT);
    v_exgp_debt_loan_sell_strike_qty = lpTSCall1Ans2->GetDouble(LDBIZ_EXGP_DEBT_LOAN_SELL_STRIKE_QTY_FLOAT);
    v_exgp_debt_fina_buy_strike_amt = lpTSCall1Ans2->GetDouble(LDBIZ_EXGP_DEBT_FINA_BUY_STRIKE_AMT_FLOAT);
    v_record_count = lpTSCall1Ans2->GetInt32(LDBIZ_RECORD_COUNT_INT);


    // set @全部费用# = 0;
    v_all_fee = 0;

    // set @印花税# = 0;
    v_stamp_tax = 0;

    // set @过户费# = 0;
    v_trans_fee = 0;

    // set @经手费# = 0;
    v_brkage_fee = 0;

    // set @证管费# = 0;
    v_SEC_charges = 0;

    // set @其他费用# = 0;
    v_other_fee = 0;

    // set @交易佣金# = 0;
    v_trade_commis = 0;

    // set @其他佣金# = 0;
    v_other_commis = 0;

    // if @订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-融券回购》  then
    if (v_order_dir == 1 || v_order_dir == 4 )
    {
        //调用过程[事务_公共_公共接口_计算证券订单费用]
        //组织事务请求
        if(lpTSCall1Ans3)
        {
          lpTSCall1Ans3->FreeMsg();
          lpTSCall1Ans3=NULL;
        }
        lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.24.203", 0);
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
        lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req3->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req3->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req3->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpTSCall1Req3->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpTSCall1Req3->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
        lpTSCall1Req3->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
        lpTSCall1Req3->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
        lpTSCall1Req3->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
        lpTSCall1Req3->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
        glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
        if(!lpTSCall1Ans3)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.203]subcall timed out!");
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
        v_trade_commis = lpTSCall1Ans3->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_all_fee = lpTSCall1Ans3->GetDouble(LDBIZ_ALL_FEE_FLOAT);
        v_stamp_tax = lpTSCall1Ans3->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
        v_trans_fee = lpTSCall1Ans3->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
        v_brkage_fee = lpTSCall1Ans3->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
        v_SEC_charges = lpTSCall1Ans3->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
        v_other_fee = lpTSCall1Ans3->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
        v_other_commis = lpTSCall1Ans3->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_trade_tax = lpTSCall1Ans3->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
        v_trade_cost_fee = lpTSCall1Ans3->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
        v_trade_system_use_fee = lpTSCall1Ans3->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
        v_stock_settle_fee = lpTSCall1Ans3->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);
        v_order_frozen_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);

    // end if;
    }

    //检查风控

    // if @指令批号# = 0 then
    if (v_comm_batch_no == 0)
    {

        // set @触发阶段类型# = 《触发阶段类型-交易端》;
        v_trig_stage_type = 2;
    }
    // else
    else
    {


        // set @触发阶段类型# = 《触发阶段类型-指令端》;
        v_trig_stage_type = 1;
    // end if;
    }

    //调用过程[事务_风控证券_接口_检查客户风险]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("rksecuT.5.9", 0);
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
    lpTSCall1Req4->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req4->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req4->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req4->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req4->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req4->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req4->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
    lpTSCall1Req4->SetInt32(LDBIZ_TRIG_STAGE_TYPE_INT,v_trig_stage_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.5.9]subcall timed out!");
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
    v_compli_trig_id = lpTSCall1Ans4->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);

    //调用过程[事务_交易证券_策略_新增策略]
    //组织事务请求
    if(lpTSCall1Ans5)
    {
      lpTSCall1Ans5->FreeMsg();
      lpTSCall1Ans5=NULL;
    }
    lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.11", 0);
    lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req5->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req5->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpTSCall1Req5->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req5->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req5->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req5->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req5->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req5->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req5->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
    lpTSCall1Req5->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req5->SetDouble(LDBIZ_BUY_REF_RATE_FLOAT,v_buy_ref_rate);
    lpTSCall1Req5->SetDouble(LDBIZ_SELL_REF_RATE_FLOAT,v_sell_ref_rate);
    lpTSCall1Req5->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req5->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req5->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
    lpTSCall1Req5->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req5->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req5->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
    lpTSCall1Req5->SetInt32(LDBIZ_TRADE_CODE_NO_INT,v_trade_code_no);
    lpTSCall1Req5->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req5->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpTSCall1Req5->SetDouble(LDBIZ_EXGP_AVAIL_AMT_FLOAT,v_exgp_avail_amt);
    lpTSCall1Req5->SetDouble(LDBIZ_EXGP_T_HK_BUY_TOTAL_AMT_FLOAT,v_exgp_T_hk_buy_total_amt);
    lpTSCall1Req5->SetDouble(LDBIZ_EXGP_T_HK_SELL_TOTAL_AMT_FLOAT,v_exgp_T_hk_sell_total_amt);
    lpTSCall1Req5->SetDouble(LDBIZ_EXGP_T1_HK_BUY_TOTAL_AMT_FLOAT,v_exgp_T1_hk_buy_total_amt);
    lpTSCall1Req5->SetDouble(LDBIZ_EXGP_T1_HK_SELL_TOTAL_AMT_FLOAT,v_exgp_T1_hk_sell_total_amt);
    lpTSCall1Req5->SetDouble(LDBIZ_ASAC_AVAIL_AMT_FLOAT,v_asac_avail_amt);
    lpTSCall1Req5->SetDouble(LDBIZ_ASAC_T_HK_BUY_TOTAL_AMT_FLOAT,v_asac_T_hk_buy_total_amt);
    lpTSCall1Req5->SetDouble(LDBIZ_ASAC_T_HK_SELL_TOTAL_AMT_FLOAT,v_asac_T_hk_sell_total_amt);
    lpTSCall1Req5->SetDouble(LDBIZ_ASAC_T1_HK_BUY_TOTAL_AMT_FLOAT,v_asac_T1_hk_buy_total_amt);
    lpTSCall1Req5->SetDouble(LDBIZ_ASAC_T1_HK_SELL_TOTAL_AMT_FLOAT,v_asac_T1_hk_sell_total_amt);
    lpTSCall1Req5->SetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT,v_exgp_avail_qty);
    lpTSCall1Req5->SetDouble(LDBIZ_EXGP_TARGET_CODE_AVAIL_QTY_FLOAT,v_exgp_target_code_avail_qty);
    lpTSCall1Req5->SetDouble(LDBIZ_EXGP_TRADE_CODE_AVAIL_QTY_FLOAT,v_exgp_trade_code_avail_qty);
    lpTSCall1Req5->SetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT,v_asac_avail_qty);
    lpTSCall1Req5->SetDouble(LDBIZ_ASAC_TARGET_CODE_AVAIL_QTY_FLOAT,v_asac_target_code_avail_qty);
    lpTSCall1Req5->SetDouble(LDBIZ_ASAC_TRADE_CODE_AVAIL_QTY_FLOAT,v_asac_trade_code_avail_qty);
    lpTSCall1Req5->SetString(LDBIZ_EXGP_BUSI_CONFIG_STR_STR,v_exgp_busi_config_str);
    lpTSCall1Req5->SetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR,v_asac_busi_config_str);
    lpTSCall1Req5->SetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,v_limit_actual_price);
    lpTSCall1Req5->SetInt32(LDBIZ_STRATEGY_BATCH_NO_INT,v_strategy_batch_no);
    lpTSCall1Req5->SetString(LDBIZ_STRATEGY_EXEC_BROKER_STR,v_strategy_exec_broker);
    lpTSCall1Req5->SetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR,v_strategy_exec_comm_str);
    lpTSCall1Req5->SetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT,v_strategy_exec_kind);
    lpTSCall1Req5->SetInt32(LDBIZ_STRATEGY_DIR_INT,v_strategy_dir);
    lpTSCall1Req5->SetDouble(LDBIZ_STRATEGY_PRICE_FLOAT,v_strategy_price);
    lpTSCall1Req5->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    lpTSCall1Req5->SetDouble(LDBIZ_STRATEGY_QTY_FLOAT,v_strategy_qty);
    lpTSCall1Req5->SetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT,v_cash_strategy_qty);
    lpTSCall1Req5->SetDouble(LDBIZ_STRATEGY_AMT_FLOAT,v_strategy_amt);
    lpTSCall1Req5->SetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT,v_strategy_valid_type);
    lpTSCall1Req5->SetString(LDBIZ_STRATEGY_RULE_WAY_STR,v_strategy_rule_way);
    lpTSCall1Req5->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    lpTSCall1Req5->SetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT,v_margin_trade_type);
    lpTSCall1Req5->SetString(LDBIZ_TARGET_STRATEGY_TYPE_STR,v_target_strategy_type);
    lpTSCall1Req5->SetString(LDBIZ_TARGET_STRATEGY_PARAM_STR,v_target_strategy_param);
    lpTSCall1Req5->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpTSCall1Req5->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpTSCall1Req5->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
    lpTSCall1Req5->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
    lpTSCall1Req5->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
    lpTSCall1Req5->SetInt32(LDBIZ_INTRST_DAYS_INT,v_intrst_days);
    lpTSCall1Req5->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
    lpTSCall1Req5->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
    lpTSCall1Req5->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
    lpTSCall1Req5->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
    lpTSCall1Req5->SetString(LDBIZ_STRATEGY_OPER_WAY_STR,v_strategy_oper_way);
    lpTSCall1Req5->SetInt32(LDBIZ_COST_CALC_TYPE_INT,v_cost_calc_type);
    lpTSCall1Req5->SetInt64(LDBIZ_COMPLI_TRIG_ID_INT64,v_compli_trig_id);
    lpTSCall1Req5->SetInt32(LDBIZ_STRATEGY_PRICE_TYPE_INT,v_strategy_price_type);
    lpTSCall1Req5->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req5->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
    if(!lpTSCall1Ans5)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.11]subcall timed out!");
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
    v_strategy_id = lpTSCall1Ans5->GetInt64(LDBIZ_STRATEGY_ID_INT64);
    v_strategy_date = lpTSCall1Ans5->GetInt32(LDBIZ_STRATEGY_DATE_INT);
    v_strategy_time = lpTSCall1Ans5->GetInt32(LDBIZ_STRATEGY_TIME_INT);
    strcpy(v_strategy_status, lpTSCall1Ans5->GetString(LDBIZ_STRATEGY_STATUS_STR));
    v_update_times = lpTSCall1Ans5->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // [主动推送][secu.strategyadd][证券主推_算法交易_新增策略主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.500", 0);
    lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpPubMsg->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpPubMsg->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpPubMsg->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpPubMsg->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
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
    lpPubMsg->SetString(LDBIZ_STRATEGY_STATUS_STR,v_strategy_status);
    lpPubMsg->SetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT,v_margin_trade_type);
    lpPubMsg->SetString(LDBIZ_TARGET_STRATEGY_TYPE_STR,v_target_strategy_type);
    lpPubMsg->SetString(LDBIZ_TARGET_STRATEGY_PARAM_STR,v_target_strategy_param);
    lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpPubMsg->SetString(LDBIZ_STRATEGY_OPER_WAY_STR,v_strategy_oper_way);
    lpPubMsg->SetInt32(LDBIZ_STRATEGY_BATCH_NO_INT,v_strategy_batch_no);
    lpPubMsg->SetInt32(LDBIZ_STRATEGY_PRICE_TYPE_INT,v_strategy_price_type);
    lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpPubMsg->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpPubMsg->SetInt64(LDBIZ_BASKET_ID_INT64,v_basket_id);
    glpPubSub_Interface->PubTopics("secu.strategyadd", lpPubMsg);

    //调用过程[事务_交易证券_策略_查询单条策略汇总]
    //组织事务请求
    if(lpTSCall1Ans6)
    {
      lpTSCall1Ans6->FreeMsg();
      lpTSCall1Ans6=NULL;
    }
    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.104", 0);
    lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req6->SetInt32(LDBIZ_STRATEGY_BATCH_NO_INT,v_strategy_batch_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
    if(!lpTSCall1Ans6)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.104]subcall timed out!");
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
    v_busi_opor_no = lpTSCall1Ans6->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_comm_opor = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_co_no = lpTSCall1Ans6->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans6->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans6->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans6->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans6->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_strategy_exec_broker, lpTSCall1Ans6->GetString(LDBIZ_STRATEGY_EXEC_BROKER_STR));
    v_strategy_exec_kind = lpTSCall1Ans6->GetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT);
    strcpy(v_strategy_exec_comm_str, lpTSCall1Ans6->GetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR));
    v_exch_no = lpTSCall1Ans6->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_type = lpTSCall1Ans6->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans6->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_stock_code, lpTSCall1Ans6->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_code_no = lpTSCall1Ans6->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_strategy_dir = lpTSCall1Ans6->GetInt32(LDBIZ_STRATEGY_DIR_INT);
    v_strategy_qty = lpTSCall1Ans6->GetDouble(LDBIZ_STRATEGY_QTY_FLOAT);
    v_cash_strategy_qty = lpTSCall1Ans6->GetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT);
    v_strategy_price = lpTSCall1Ans6->GetDouble(LDBIZ_STRATEGY_PRICE_FLOAT);
    v_price_type = lpTSCall1Ans6->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strategy_amt = lpTSCall1Ans6->GetDouble(LDBIZ_STRATEGY_AMT_FLOAT);
    v_strategy_valid_type = lpTSCall1Ans6->GetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT);
    strcpy(v_strategy_rule_way, lpTSCall1Ans6->GetString(LDBIZ_STRATEGY_RULE_WAY_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans6->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    strcpy(v_remark_info, lpTSCall1Ans6->GetString(LDBIZ_REMARK_INFO_STR));
    v_strategy_date = lpTSCall1Ans6->GetInt32(LDBIZ_STRATEGY_DATE_INT);
    v_margin_trade_type = lpTSCall1Ans6->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
    strcpy(v_target_strategy_type, lpTSCall1Ans6->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR));
    strcpy(v_target_strategy_param, lpTSCall1Ans6->GetString(LDBIZ_TARGET_STRATEGY_PARAM_STR));
    strcpy(v_strategy_contr_comm, lpTSCall1Ans6->GetString(LDBIZ_STRATEGY_CONTR_COMM_STR));
    strcpy(v_strategy_sum_status, lpTSCall1Ans6->GetString(LDBIZ_STRATEGY_SUM_STATUS_STR));
    strcpy(v_strategy_deal_status, lpTSCall1Ans6->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR));
    v_strategy_deal_kind = lpTSCall1Ans6->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
    v_order_qty = lpTSCall1Ans6->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_valid_order_qty = lpTSCall1Ans6->GetDouble(LDBIZ_VALID_ORDER_QTY_FLOAT);
    v_order_amt = lpTSCall1Ans6->GetDouble(LDBIZ_ORDER_AMT_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans6->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_valid_wtdraw_qty = lpTSCall1Ans6->GetDouble(LDBIZ_VALID_WTDRAW_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans6->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans6->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_cancel_qty = lpTSCall1Ans6->GetDouble(LDBIZ_CANCEL_QTY_FLOAT);
    v_faild_qty = lpTSCall1Ans6->GetDouble(LDBIZ_FAILD_QTY_FLOAT);
    v_external_no = lpTSCall1Ans6->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpTSCall1Ans6->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_comm_batch_no = lpTSCall1Ans6->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    strcpy(v_strategy_oper_way, lpTSCall1Ans6->GetString(LDBIZ_STRATEGY_OPER_WAY_STR));
    v_update_times = lpTSCall1Ans6->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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

        // set @指令备注信息#= @汇总指令备注信息#;
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
    lpOutBizMsg->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    lpOutBizMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpOutBizMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpOutBizMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpOutBizMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpOutBizMsg->SetInt32(LDBIZ_STRATEGY_DIR_INT,v_strategy_dir);
    lpOutBizMsg->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    lpOutBizMsg->SetInt32(LDBIZ_STRATEGY_TIME_INT,v_strategy_time);
    lpOutBizMsg->SetString(LDBIZ_TARGET_STRATEGY_TYPE_STR,v_target_strategy_type);
    lpOutBizMsg->SetString(LDBIZ_TARGET_STRATEGY_PARAM_STR,v_target_strategy_param);
    lpOutBizMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpOutBizMsg->SetString(LDBIZ_STRATEGY_OPER_WAY_STR,v_strategy_oper_way);
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

//逻辑_交易证券_策略_暂停策略
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
    int64 v_strategy_id;
    char v_target_strategy_type[17];
    char v_target_strategy_param[2049];
    char v_strategy_contr_comm[2049];
    char v_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_orig_strategy_id;
    int v_strategy_time;
    char v_tmp_target_strategy_type[17];
    char v_tmp_target_strategy_param[2049];
    char v_tmp_strategy_contr_comm[2049];
    char v_tmp_remark_info[256];
    int v_comm_opor;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    int v_strategy_batch_no;
    char v_strategy_exec_broker[17];
    int v_strategy_exec_kind;
    char v_strategy_exec_comm_str[2049];
    int v_exch_no;
    int v_stock_acco_no;
    char v_stock_acco[17];
    int v_stock_type;
    int v_asset_type;
    char v_stock_code[7];
    int v_stock_code_no;
    int v_strategy_dir;
    double v_strategy_qty;
    double v_cash_strategy_qty;
    double v_strategy_price;
    int v_price_type;
    double v_strategy_amt;
    int v_strategy_valid_type;
    char v_strategy_rule_way[5];
    char v_exch_crncy_type[4];
    int v_strategy_date;
    int v_margin_trade_type;
    char v_strategy_status[3];
    char v_strategy_deal_status[3];
    int v_strategy_deal_kind;
    double v_order_qty;
    double v_order_amt;
    double v_wtdraw_qty;
    double v_strike_qty;
    double v_strike_amt;
    int64 v_external_no;
    int v_order_batch_no;
    char v_strategy_oper_way[3];
    int v_busi_opor_no;
    int v_strategy_price_type;
    int v_comm_batch_no;
    int64 v_comm_id;
    int v_comm_dir;
    int v_order_dir;
    double v_comm_limit_price;
    double v_order_price;
    double v_comm_qty;
    int v_comm_executor;
    int v_init_date;
    char v_sys_config_str[65];
    char v_co_busi_config_str[65];
    char v_exgp_busi_config_str[65];
    char v_crncy_type[4];
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
    int64 v_new_strategy_id;
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
    v_strategy_id=0;
    strcpy(v_target_strategy_type, " ");
    strcpy(v_target_strategy_param, " ");
    strcpy(v_strategy_contr_comm, " ");
    strcpy(v_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_orig_strategy_id=0;
    v_strategy_time=0;
    strcpy(v_tmp_target_strategy_type, " ");
    strcpy(v_tmp_target_strategy_param, " ");
    strcpy(v_tmp_strategy_contr_comm, " ");
    strcpy(v_tmp_remark_info, " ");
    v_comm_opor=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_strategy_batch_no=0;
    strcpy(v_strategy_exec_broker, " ");
    v_strategy_exec_kind=0;
    strcpy(v_strategy_exec_comm_str, " ");
    v_exch_no=0;
    v_stock_acco_no=0;
    strcpy(v_stock_acco, " ");
    v_stock_type=0;
    v_asset_type=0;
    strcpy(v_stock_code, " ");
    v_stock_code_no=0;
    v_strategy_dir=0;
    v_strategy_qty=0;
    v_cash_strategy_qty=0;
    v_strategy_price=0;
    v_price_type=0;
    v_strategy_amt=0;
    v_strategy_valid_type=0;
    strcpy(v_strategy_rule_way, " ");
    strcpy(v_exch_crncy_type, "CNY");
    v_strategy_date=0;
    v_margin_trade_type=0;
    strcpy(v_strategy_status, " ");
    strcpy(v_strategy_deal_status, " ");
    v_strategy_deal_kind=0;
    v_order_qty=0;
    v_order_amt=0;
    v_wtdraw_qty=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_external_no=0;
    v_order_batch_no=0;
    strcpy(v_strategy_oper_way, " ");
    v_busi_opor_no=0;
    v_strategy_price_type=0;
    v_comm_batch_no=0;
    v_comm_id=0;
    v_comm_dir=0;
    v_order_dir=0;
    v_comm_limit_price=0;
    v_order_price=0;
    v_comm_qty=0;
    v_comm_executor=0;
    v_init_date=0;
    strcpy(v_sys_config_str, " ");
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_exgp_busi_config_str, " ");
    strcpy(v_crncy_type, "CNY");
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
    v_new_strategy_id=0;
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
    v_strategy_id = lpInBizMsg->GetInt64(LDBIZ_STRATEGY_ID_INT64);
    strncpy(v_target_strategy_type, lpInBizMsg->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR),16);
    v_target_strategy_type[16] = '\0';
    strncpy(v_target_strategy_param, lpInBizMsg->GetString(LDBIZ_TARGET_STRATEGY_PARAM_STR),2048);
    v_target_strategy_param[2048] = '\0';
    strncpy(v_strategy_contr_comm, lpInBizMsg->GetString(LDBIZ_STRATEGY_CONTR_COMM_STR),2048);
    v_strategy_contr_comm[2048] = '\0';
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


    // set @临时_目标策略类型# = @目标策略类型#;
    strcpy(v_tmp_target_strategy_type,v_target_strategy_type);

    // set @临时_目标策略参数# = @目标策略参数#;
    strcpy(v_tmp_target_strategy_param,v_target_strategy_param);

    // set @临时_策略控制指令# = @策略控制指令#;
    strcpy(v_tmp_strategy_contr_comm,v_strategy_contr_comm);

    // set @临时_备注信息# = @备注信息#;
    strcpy(v_tmp_remark_info,v_remark_info);
    //调用过程[事务_交易证券_策略_获取策略信息]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.4", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.4]subcall timed out!");
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
    v_comm_opor = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_co_no = lpTSCall1Ans0->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans0->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans0->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans0->GetString(LDBIZ_OUT_ACCO_STR));
    v_strategy_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_BATCH_NO_INT);
    v_orig_strategy_id = lpTSCall1Ans0->GetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64);
    strcpy(v_strategy_exec_broker, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_EXEC_BROKER_STR));
    v_strategy_exec_kind = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT);
    strcpy(v_strategy_exec_comm_str, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR));
    v_exch_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans0->GetString(LDBIZ_STOCK_ACCO_STR));
    v_stock_type = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_stock_code, lpTSCall1Ans0->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_strategy_dir = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_DIR_INT);
    v_strategy_qty = lpTSCall1Ans0->GetDouble(LDBIZ_STRATEGY_QTY_FLOAT);
    v_cash_strategy_qty = lpTSCall1Ans0->GetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT);
    v_strategy_price = lpTSCall1Ans0->GetDouble(LDBIZ_STRATEGY_PRICE_FLOAT);
    v_price_type = lpTSCall1Ans0->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strategy_amt = lpTSCall1Ans0->GetDouble(LDBIZ_STRATEGY_AMT_FLOAT);
    v_strategy_valid_type = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT);
    strcpy(v_strategy_rule_way, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_RULE_WAY_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans0->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    strcpy(v_remark_info, lpTSCall1Ans0->GetString(LDBIZ_REMARK_INFO_STR));
    v_strategy_date = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_DATE_INT);
    v_strategy_time = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_TIME_INT);
    v_margin_trade_type = lpTSCall1Ans0->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
    strcpy(v_target_strategy_type, lpTSCall1Ans0->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR));
    strcpy(v_target_strategy_param, lpTSCall1Ans0->GetString(LDBIZ_TARGET_STRATEGY_PARAM_STR));
    strcpy(v_strategy_contr_comm, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_CONTR_COMM_STR));
    strcpy(v_strategy_status, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_STATUS_STR));
    strcpy(v_strategy_deal_status, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR));
    v_strategy_deal_kind = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
    v_order_qty = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_amt = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_AMT_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans0->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_external_no = lpTSCall1Ans0->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strcpy(v_strategy_oper_way, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_OPER_WAY_STR));
    v_busi_opor_no = lpTSCall1Ans0->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_strategy_price_type = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_PRICE_TYPE_INT);
    v_comm_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_id = lpTSCall1Ans0->GetInt64(LDBIZ_COMM_ID_INT64);


    // set @指令方向# = @策略方向#;
    v_comm_dir = v_strategy_dir;

    // set @订单方向# = @策略方向#;
    v_order_dir = v_strategy_dir;

    // set @指令限价# = @策略价格#;
    v_comm_limit_price = v_strategy_price;

    // set @订单价格# = @策略价格#;
    v_order_price = v_strategy_price;

    // set @指令数量# = @策略数量#;
    v_comm_qty = v_strategy_qty;

    // set @订单数量# = @策略数量#;
    v_order_qty = v_strategy_qty;

    // set @指令执行人# = 0;
    v_comm_executor = 0;
    //公共子系统检查
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

    // set @目标策略类型# = @临时_目标策略类型#;
    strcpy(v_target_strategy_type,v_tmp_target_strategy_type);

    // set @目标策略参数# = @临时_目标策略参数#;
    strcpy(v_target_strategy_param,v_tmp_target_strategy_param);

    // set @策略控制指令# = @临时_策略控制指令#;
    strcpy(v_strategy_contr_comm,v_tmp_strategy_contr_comm);

    // set @备注信息# = @临时_备注信息#;
    strcpy(v_remark_info,v_tmp_remark_info);
    //调用过程[事务_交易证券_策略_暂停策略]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.12", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    lpTSCall1Req2->SetString(LDBIZ_TARGET_STRATEGY_TYPE_STR,v_target_strategy_type);
    lpTSCall1Req2->SetString(LDBIZ_TARGET_STRATEGY_PARAM_STR,v_target_strategy_param);
    lpTSCall1Req2->SetString(LDBIZ_STRATEGY_CONTR_COMM_STR,v_strategy_contr_comm);
    lpTSCall1Req2->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.12]subcall timed out!");
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
    v_comm_opor = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans2->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans2->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans2->GetString(LDBIZ_OUT_ACCO_STR));
    v_strategy_batch_no = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_BATCH_NO_INT);
    v_orig_strategy_id = lpTSCall1Ans2->GetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64);
    strcpy(v_strategy_exec_broker, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_EXEC_BROKER_STR));
    v_strategy_exec_kind = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT);
    strcpy(v_strategy_exec_comm_str, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR));
    v_exch_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans2->GetString(LDBIZ_STOCK_ACCO_STR));
    v_stock_type = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_stock_code, lpTSCall1Ans2->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_strategy_dir = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_DIR_INT);
    v_strategy_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRATEGY_QTY_FLOAT);
    v_cash_strategy_qty = lpTSCall1Ans2->GetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT);
    v_strategy_price = lpTSCall1Ans2->GetDouble(LDBIZ_STRATEGY_PRICE_FLOAT);
    v_price_type = lpTSCall1Ans2->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strategy_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STRATEGY_AMT_FLOAT);
    v_strategy_valid_type = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT);
    strcpy(v_strategy_rule_way, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_RULE_WAY_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_strategy_date = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_DATE_INT);
    v_strategy_time = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_TIME_INT);
    v_margin_trade_type = lpTSCall1Ans2->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
    strcpy(v_strategy_status, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_STATUS_STR));
    strcpy(v_strategy_deal_status, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR));
    v_strategy_deal_kind = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
    v_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_amt = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_AMT_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans2->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_external_no = lpTSCall1Ans2->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strcpy(v_strategy_oper_way, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_OPER_WAY_STR));
    v_busi_opor_no = lpTSCall1Ans2->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_new_strategy_id = lpTSCall1Ans2->GetInt64(LDBIZ_NEW_STRATEGY_ID_INT64);
    v_update_times = lpTSCall1Ans2->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // set @策略序号# = @新策略序号#;
    v_strategy_id = v_new_strategy_id;

    // [主动推送][secu.strategyreplace][证券主推_算法交易_暂停重启策略主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.501", 0);
    lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpPubMsg->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    lpPubMsg->SetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64,v_orig_strategy_id);
    lpPubMsg->SetString(LDBIZ_STRATEGY_EXEC_BROKER_STR,v_strategy_exec_broker);
    lpPubMsg->SetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT,v_strategy_exec_kind);
    lpPubMsg->SetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR,v_strategy_exec_comm_str);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpPubMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpPubMsg->SetInt32(LDBIZ_STRATEGY_DIR_INT,v_strategy_dir);
    lpPubMsg->SetDouble(LDBIZ_STRATEGY_QTY_FLOAT,v_strategy_qty);
    lpPubMsg->SetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT,v_cash_strategy_qty);
    lpPubMsg->SetDouble(LDBIZ_STRATEGY_PRICE_FLOAT,v_strategy_price);
    lpPubMsg->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    lpPubMsg->SetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT,v_strategy_valid_type);
    lpPubMsg->SetString(LDBIZ_STRATEGY_RULE_WAY_STR,v_strategy_rule_way);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    lpPubMsg->SetInt32(LDBIZ_STRATEGY_DATE_INT,v_strategy_date);
    lpPubMsg->SetInt32(LDBIZ_STRATEGY_TIME_INT,v_strategy_time);
    lpPubMsg->SetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT,v_margin_trade_type);
    lpPubMsg->SetString(LDBIZ_TARGET_STRATEGY_TYPE_STR,v_target_strategy_type);
    lpPubMsg->SetString(LDBIZ_TARGET_STRATEGY_PARAM_STR,v_target_strategy_param);
    lpPubMsg->SetString(LDBIZ_STRATEGY_CONTR_COMM_STR,v_strategy_contr_comm);
    lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpPubMsg->SetString(LDBIZ_STRATEGY_OPER_WAY_STR,v_strategy_oper_way);
    lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    glpPubSub_Interface->PubTopics("secu.strategyreplace", lpPubMsg);


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
    lpOutBizMsg->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    lpOutBizMsg->SetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64,v_orig_strategy_id);
    lpOutBizMsg->SetInt32(LDBIZ_STRATEGY_TIME_INT,v_strategy_time);
    lpOutBizMsg->SetString(LDBIZ_TARGET_STRATEGY_TYPE_STR,v_target_strategy_type);
    lpOutBizMsg->SetString(LDBIZ_TARGET_STRATEGY_PARAM_STR,v_target_strategy_param);
    lpOutBizMsg->SetString(LDBIZ_STRATEGY_CONTR_COMM_STR,v_strategy_contr_comm);
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

//逻辑_交易证券_策略_重启策略
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
    int64 v_strategy_id;
    char v_target_strategy_type[17];
    char v_target_strategy_param[2049];
    char v_strategy_contr_comm[2049];
    char v_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_orig_strategy_id;
    int v_strategy_time;
    char v_tmp_target_strategy_type[17];
    char v_tmp_target_strategy_param[2049];
    char v_tmp_strategy_contr_comm[2049];
    char v_tmp_remark_info[256];
    int v_comm_opor;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    int v_strategy_batch_no;
    char v_strategy_exec_broker[17];
    int v_strategy_exec_kind;
    char v_strategy_exec_comm_str[2049];
    int v_exch_no;
    int v_stock_acco_no;
    char v_stock_acco[17];
    int v_stock_type;
    int v_asset_type;
    char v_stock_code[7];
    int v_stock_code_no;
    int v_strategy_dir;
    double v_strategy_qty;
    double v_cash_strategy_qty;
    double v_strategy_price;
    int v_price_type;
    double v_strategy_amt;
    int v_strategy_valid_type;
    char v_strategy_rule_way[5];
    char v_exch_crncy_type[4];
    int v_strategy_date;
    int v_margin_trade_type;
    char v_strategy_status[3];
    char v_strategy_deal_status[3];
    int v_strategy_deal_kind;
    double v_order_qty;
    double v_order_amt;
    double v_wtdraw_qty;
    double v_strike_qty;
    double v_strike_amt;
    int64 v_external_no;
    int v_order_batch_no;
    char v_strategy_oper_way[3];
    int v_busi_opor_no;
    int v_strategy_price_type;
    int v_comm_batch_no;
    int64 v_comm_id;
    int v_comm_dir;
    int v_order_dir;
    double v_comm_limit_price;
    double v_order_price;
    double v_comm_qty;
    int v_comm_executor;
    int v_init_date;
    char v_sys_config_str[65];
    char v_co_busi_config_str[65];
    char v_exgp_busi_config_str[65];
    char v_crncy_type[4];
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
    int64 v_new_strategy_id;
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
    v_strategy_id=0;
    strcpy(v_target_strategy_type, " ");
    strcpy(v_target_strategy_param, " ");
    strcpy(v_strategy_contr_comm, " ");
    strcpy(v_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_orig_strategy_id=0;
    v_strategy_time=0;
    strcpy(v_tmp_target_strategy_type, " ");
    strcpy(v_tmp_target_strategy_param, " ");
    strcpy(v_tmp_strategy_contr_comm, " ");
    strcpy(v_tmp_remark_info, " ");
    v_comm_opor=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_strategy_batch_no=0;
    strcpy(v_strategy_exec_broker, " ");
    v_strategy_exec_kind=0;
    strcpy(v_strategy_exec_comm_str, " ");
    v_exch_no=0;
    v_stock_acco_no=0;
    strcpy(v_stock_acco, " ");
    v_stock_type=0;
    v_asset_type=0;
    strcpy(v_stock_code, " ");
    v_stock_code_no=0;
    v_strategy_dir=0;
    v_strategy_qty=0;
    v_cash_strategy_qty=0;
    v_strategy_price=0;
    v_price_type=0;
    v_strategy_amt=0;
    v_strategy_valid_type=0;
    strcpy(v_strategy_rule_way, " ");
    strcpy(v_exch_crncy_type, "CNY");
    v_strategy_date=0;
    v_margin_trade_type=0;
    strcpy(v_strategy_status, " ");
    strcpy(v_strategy_deal_status, " ");
    v_strategy_deal_kind=0;
    v_order_qty=0;
    v_order_amt=0;
    v_wtdraw_qty=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_external_no=0;
    v_order_batch_no=0;
    strcpy(v_strategy_oper_way, " ");
    v_busi_opor_no=0;
    v_strategy_price_type=0;
    v_comm_batch_no=0;
    v_comm_id=0;
    v_comm_dir=0;
    v_order_dir=0;
    v_comm_limit_price=0;
    v_order_price=0;
    v_comm_qty=0;
    v_comm_executor=0;
    v_init_date=0;
    strcpy(v_sys_config_str, " ");
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_exgp_busi_config_str, " ");
    strcpy(v_crncy_type, "CNY");
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
    v_new_strategy_id=0;
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
    v_strategy_id = lpInBizMsg->GetInt64(LDBIZ_STRATEGY_ID_INT64);
    strncpy(v_target_strategy_type, lpInBizMsg->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR),16);
    v_target_strategy_type[16] = '\0';
    strncpy(v_target_strategy_param, lpInBizMsg->GetString(LDBIZ_TARGET_STRATEGY_PARAM_STR),2048);
    v_target_strategy_param[2048] = '\0';
    strncpy(v_strategy_contr_comm, lpInBizMsg->GetString(LDBIZ_STRATEGY_CONTR_COMM_STR),2048);
    v_strategy_contr_comm[2048] = '\0';
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


    // set @临时_目标策略类型# = @目标策略类型#;
    strcpy(v_tmp_target_strategy_type,v_target_strategy_type);

    // set @临时_目标策略参数# = @目标策略参数#;
    strcpy(v_tmp_target_strategy_param,v_target_strategy_param);

    // set @临时_策略控制指令# = @策略控制指令#;
    strcpy(v_tmp_strategy_contr_comm,v_strategy_contr_comm);

    // set @临时_备注信息# = @备注信息#;
    strcpy(v_tmp_remark_info,v_remark_info);
    //调用过程[事务_交易证券_策略_获取策略信息]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.4", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.4]subcall timed out!");
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
    v_comm_opor = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_co_no = lpTSCall1Ans0->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans0->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans0->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans0->GetString(LDBIZ_OUT_ACCO_STR));
    v_strategy_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_BATCH_NO_INT);
    v_orig_strategy_id = lpTSCall1Ans0->GetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64);
    strcpy(v_strategy_exec_broker, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_EXEC_BROKER_STR));
    v_strategy_exec_kind = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT);
    strcpy(v_strategy_exec_comm_str, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR));
    v_exch_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans0->GetString(LDBIZ_STOCK_ACCO_STR));
    v_stock_type = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_stock_code, lpTSCall1Ans0->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_strategy_dir = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_DIR_INT);
    v_strategy_qty = lpTSCall1Ans0->GetDouble(LDBIZ_STRATEGY_QTY_FLOAT);
    v_cash_strategy_qty = lpTSCall1Ans0->GetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT);
    v_strategy_price = lpTSCall1Ans0->GetDouble(LDBIZ_STRATEGY_PRICE_FLOAT);
    v_price_type = lpTSCall1Ans0->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strategy_amt = lpTSCall1Ans0->GetDouble(LDBIZ_STRATEGY_AMT_FLOAT);
    v_strategy_valid_type = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT);
    strcpy(v_strategy_rule_way, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_RULE_WAY_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans0->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    strcpy(v_remark_info, lpTSCall1Ans0->GetString(LDBIZ_REMARK_INFO_STR));
    v_strategy_date = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_DATE_INT);
    v_strategy_time = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_TIME_INT);
    v_margin_trade_type = lpTSCall1Ans0->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
    strcpy(v_target_strategy_type, lpTSCall1Ans0->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR));
    strcpy(v_target_strategy_param, lpTSCall1Ans0->GetString(LDBIZ_TARGET_STRATEGY_PARAM_STR));
    strcpy(v_strategy_contr_comm, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_CONTR_COMM_STR));
    strcpy(v_strategy_status, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_STATUS_STR));
    strcpy(v_strategy_deal_status, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR));
    v_strategy_deal_kind = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
    v_order_qty = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_amt = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_AMT_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans0->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_external_no = lpTSCall1Ans0->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strcpy(v_strategy_oper_way, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_OPER_WAY_STR));
    v_busi_opor_no = lpTSCall1Ans0->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_strategy_price_type = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_PRICE_TYPE_INT);
    v_comm_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_id = lpTSCall1Ans0->GetInt64(LDBIZ_COMM_ID_INT64);


    // set @指令方向# = @策略方向#;
    v_comm_dir = v_strategy_dir;

    // set @订单方向# = @策略方向#;
    v_order_dir = v_strategy_dir;

    // set @指令限价# = @策略价格#;
    v_comm_limit_price = v_strategy_price;

    // set @订单价格# = @策略价格#;
    v_order_price = v_strategy_price;

    // set @指令数量# = @策略数量#;
    v_comm_qty = v_strategy_qty;

    // set @订单数量# = @策略数量#;
    v_order_qty = v_strategy_qty;

    // set @指令执行人# = 0;
    v_comm_executor = 0;
    //公共子系统检查
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

    // set @目标策略类型# = @临时_目标策略类型#;
    strcpy(v_target_strategy_type,v_tmp_target_strategy_type);

    // set @目标策略参数# = @临时_目标策略参数#;
    strcpy(v_target_strategy_param,v_tmp_target_strategy_param);

    // set @策略控制指令# = @临时_策略控制指令#;
    strcpy(v_strategy_contr_comm,v_tmp_strategy_contr_comm);

    // set @备注信息# = @临时_备注信息#;
    strcpy(v_remark_info,v_tmp_remark_info);
    //调用过程[事务_交易证券_策略_重启策略]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.13", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    lpTSCall1Req2->SetString(LDBIZ_TARGET_STRATEGY_TYPE_STR,v_target_strategy_type);
    lpTSCall1Req2->SetString(LDBIZ_TARGET_STRATEGY_PARAM_STR,v_target_strategy_param);
    lpTSCall1Req2->SetString(LDBIZ_STRATEGY_CONTR_COMM_STR,v_strategy_contr_comm);
    lpTSCall1Req2->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.13]subcall timed out!");
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
    v_comm_opor = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans2->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans2->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans2->GetString(LDBIZ_OUT_ACCO_STR));
    v_strategy_batch_no = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_BATCH_NO_INT);
    v_orig_strategy_id = lpTSCall1Ans2->GetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64);
    strcpy(v_strategy_exec_broker, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_EXEC_BROKER_STR));
    v_strategy_exec_kind = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT);
    strcpy(v_strategy_exec_comm_str, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR));
    v_exch_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans2->GetString(LDBIZ_STOCK_ACCO_STR));
    v_stock_type = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_stock_code, lpTSCall1Ans2->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_strategy_dir = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_DIR_INT);
    v_strategy_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRATEGY_QTY_FLOAT);
    v_cash_strategy_qty = lpTSCall1Ans2->GetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT);
    v_strategy_price = lpTSCall1Ans2->GetDouble(LDBIZ_STRATEGY_PRICE_FLOAT);
    v_price_type = lpTSCall1Ans2->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strategy_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STRATEGY_AMT_FLOAT);
    v_strategy_valid_type = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT);
    strcpy(v_strategy_rule_way, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_RULE_WAY_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_strategy_date = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_DATE_INT);
    v_strategy_time = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_TIME_INT);
    v_margin_trade_type = lpTSCall1Ans2->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
    strcpy(v_strategy_status, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_STATUS_STR));
    strcpy(v_strategy_deal_status, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR));
    v_strategy_deal_kind = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
    v_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_amt = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_AMT_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans2->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_external_no = lpTSCall1Ans2->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strcpy(v_strategy_oper_way, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_OPER_WAY_STR));
    v_busi_opor_no = lpTSCall1Ans2->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_new_strategy_id = lpTSCall1Ans2->GetInt64(LDBIZ_NEW_STRATEGY_ID_INT64);
    v_update_times = lpTSCall1Ans2->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // set @策略序号# = @新策略序号#;
    v_strategy_id = v_new_strategy_id;

    // [主动推送][secu.strategyreplace][证券主推_算法交易_暂停重启策略主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.501", 0);
    lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpPubMsg->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    lpPubMsg->SetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64,v_orig_strategy_id);
    lpPubMsg->SetString(LDBIZ_STRATEGY_EXEC_BROKER_STR,v_strategy_exec_broker);
    lpPubMsg->SetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT,v_strategy_exec_kind);
    lpPubMsg->SetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR,v_strategy_exec_comm_str);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpPubMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpPubMsg->SetInt32(LDBIZ_STRATEGY_DIR_INT,v_strategy_dir);
    lpPubMsg->SetDouble(LDBIZ_STRATEGY_QTY_FLOAT,v_strategy_qty);
    lpPubMsg->SetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT,v_cash_strategy_qty);
    lpPubMsg->SetDouble(LDBIZ_STRATEGY_PRICE_FLOAT,v_strategy_price);
    lpPubMsg->SetInt32(LDBIZ_PRICE_TYPE_INT,v_price_type);
    lpPubMsg->SetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT,v_strategy_valid_type);
    lpPubMsg->SetString(LDBIZ_STRATEGY_RULE_WAY_STR,v_strategy_rule_way);
    lpPubMsg->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpPubMsg->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    lpPubMsg->SetInt32(LDBIZ_STRATEGY_DATE_INT,v_strategy_date);
    lpPubMsg->SetInt32(LDBIZ_STRATEGY_TIME_INT,v_strategy_time);
    lpPubMsg->SetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT,v_margin_trade_type);
    lpPubMsg->SetString(LDBIZ_TARGET_STRATEGY_TYPE_STR,v_target_strategy_type);
    lpPubMsg->SetString(LDBIZ_TARGET_STRATEGY_PARAM_STR,v_target_strategy_param);
    lpPubMsg->SetString(LDBIZ_STRATEGY_CONTR_COMM_STR,v_strategy_contr_comm);
    lpPubMsg->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpPubMsg->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpPubMsg->SetString(LDBIZ_STRATEGY_OPER_WAY_STR,v_strategy_oper_way);
    lpPubMsg->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    glpPubSub_Interface->PubTopics("secu.strategyreplace", lpPubMsg);


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
    lpOutBizMsg->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    lpOutBizMsg->SetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64,v_orig_strategy_id);
    lpOutBizMsg->SetInt32(LDBIZ_STRATEGY_TIME_INT,v_strategy_time);
    lpOutBizMsg->SetString(LDBIZ_TARGET_STRATEGY_TYPE_STR,v_target_strategy_type);
    lpOutBizMsg->SetString(LDBIZ_TARGET_STRATEGY_PARAM_STR,v_target_strategy_param);
    lpOutBizMsg->SetString(LDBIZ_STRATEGY_CONTR_COMM_STR,v_strategy_contr_comm);
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

//逻辑_交易证券_策略_撤销策略
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
    int64 v_strategy_id;
    char v_target_strategy_type[17];
    char v_target_strategy_param[2049];
    char v_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_orig_strategy_id;
    int v_strategy_time;
    char v_tmp_target_strategy_type[17];
    char v_tmp_target_strategy_param[2049];
    char v_tmp_remark_info[256];
    int v_comm_opor;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    int v_strategy_batch_no;
    char v_strategy_exec_broker[17];
    int v_strategy_exec_kind;
    char v_strategy_exec_comm_str[2049];
    int v_exch_no;
    int v_stock_acco_no;
    char v_stock_acco[17];
    int v_stock_type;
    int v_asset_type;
    char v_stock_code[7];
    int v_stock_code_no;
    int v_strategy_dir;
    double v_strategy_qty;
    double v_cash_strategy_qty;
    double v_strategy_price;
    int v_price_type;
    double v_strategy_amt;
    int v_strategy_valid_type;
    char v_strategy_rule_way[5];
    char v_exch_crncy_type[4];
    int v_strategy_date;
    int v_margin_trade_type;
    char v_strategy_contr_comm[2049];
    char v_strategy_status[3];
    char v_strategy_deal_status[3];
    int v_strategy_deal_kind;
    double v_order_qty;
    double v_order_amt;
    double v_wtdraw_qty;
    double v_strike_qty;
    double v_strike_amt;
    int64 v_external_no;
    int v_order_batch_no;
    char v_strategy_oper_way[3];
    int v_busi_opor_no;
    int v_strategy_price_type;
    int v_comm_batch_no;
    int64 v_comm_id;
    int v_comm_dir;
    int v_order_dir;
    double v_comm_limit_price;
    double v_order_price;
    double v_comm_qty;
    int v_comm_executor;
    int v_init_date;
    char v_sys_config_str[65];
    char v_co_busi_config_str[65];
    char v_exgp_busi_config_str[65];
    char v_crncy_type[4];
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
    int64 v_new_strategy_id;
    int v_update_times;
    int64 v_row_id;
    char v_strategy_sum_status[3];
    double v_valid_order_qty;
    double v_valid_wtdraw_qty;
    double v_cancel_qty;
    double v_faild_qty;
    int v_comm_date;
    int v_comm_time;
    double v_limit_actual_price;
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
    int v_exter_comm_flag;
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
    char v_combo_code[33];
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
    v_strategy_id=0;
    strcpy(v_target_strategy_type, " ");
    strcpy(v_target_strategy_param, " ");
    strcpy(v_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_orig_strategy_id=0;
    v_strategy_time=0;
    strcpy(v_tmp_target_strategy_type, " ");
    strcpy(v_tmp_target_strategy_param, " ");
    strcpy(v_tmp_remark_info, " ");
    v_comm_opor=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_strategy_batch_no=0;
    strcpy(v_strategy_exec_broker, " ");
    v_strategy_exec_kind=0;
    strcpy(v_strategy_exec_comm_str, " ");
    v_exch_no=0;
    v_stock_acco_no=0;
    strcpy(v_stock_acco, " ");
    v_stock_type=0;
    v_asset_type=0;
    strcpy(v_stock_code, " ");
    v_stock_code_no=0;
    v_strategy_dir=0;
    v_strategy_qty=0;
    v_cash_strategy_qty=0;
    v_strategy_price=0;
    v_price_type=0;
    v_strategy_amt=0;
    v_strategy_valid_type=0;
    strcpy(v_strategy_rule_way, " ");
    strcpy(v_exch_crncy_type, "CNY");
    v_strategy_date=0;
    v_margin_trade_type=0;
    strcpy(v_strategy_contr_comm, " ");
    strcpy(v_strategy_status, " ");
    strcpy(v_strategy_deal_status, " ");
    v_strategy_deal_kind=0;
    v_order_qty=0;
    v_order_amt=0;
    v_wtdraw_qty=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_external_no=0;
    v_order_batch_no=0;
    strcpy(v_strategy_oper_way, " ");
    v_busi_opor_no=0;
    v_strategy_price_type=0;
    v_comm_batch_no=0;
    v_comm_id=0;
    v_comm_dir=0;
    v_order_dir=0;
    v_comm_limit_price=0;
    v_order_price=0;
    v_comm_qty=0;
    v_comm_executor=0;
    v_init_date=0;
    strcpy(v_sys_config_str, " ");
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_exgp_busi_config_str, " ");
    strcpy(v_crncy_type, "CNY");
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
    v_new_strategy_id=0;
    v_update_times=1;
    v_row_id=0;
    strcpy(v_strategy_sum_status, " ");
    v_valid_order_qty=0;
    v_valid_wtdraw_qty=0;
    v_cancel_qty=0;
    v_faild_qty=0;
    v_comm_date=0;
    v_comm_time=0;
    v_limit_actual_price=0;
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
    v_exter_comm_flag=0;
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
    strcpy(v_combo_code, " ");
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
    v_strategy_id = lpInBizMsg->GetInt64(LDBIZ_STRATEGY_ID_INT64);
    strncpy(v_target_strategy_type, lpInBizMsg->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR),16);
    v_target_strategy_type[16] = '\0';
    strncpy(v_target_strategy_param, lpInBizMsg->GetString(LDBIZ_TARGET_STRATEGY_PARAM_STR),2048);
    v_target_strategy_param[2048] = '\0';
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


    // set @功能编码# = "tdsecuL.11.14";
    strcpy(v_func_code,"tdsecuL.11.14");

    // set @临时_目标策略类型# = @目标策略类型#;
    strcpy(v_tmp_target_strategy_type,v_target_strategy_type);

    // set @临时_目标策略参数# = @目标策略参数#;
    strcpy(v_tmp_target_strategy_param,v_target_strategy_param);

    // set @临时_备注信息# = @备注信息#;
    strcpy(v_tmp_remark_info,v_remark_info);
    //调用过程[事务_交易证券_策略_获取策略信息]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.4", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.4]subcall timed out!");
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
    v_comm_opor = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_co_no = lpTSCall1Ans0->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans0->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans0->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans0->GetString(LDBIZ_OUT_ACCO_STR));
    v_strategy_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_BATCH_NO_INT);
    v_orig_strategy_id = lpTSCall1Ans0->GetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64);
    strcpy(v_strategy_exec_broker, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_EXEC_BROKER_STR));
    v_strategy_exec_kind = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT);
    strcpy(v_strategy_exec_comm_str, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR));
    v_exch_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans0->GetString(LDBIZ_STOCK_ACCO_STR));
    v_stock_type = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_stock_code, lpTSCall1Ans0->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_strategy_dir = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_DIR_INT);
    v_strategy_qty = lpTSCall1Ans0->GetDouble(LDBIZ_STRATEGY_QTY_FLOAT);
    v_cash_strategy_qty = lpTSCall1Ans0->GetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT);
    v_strategy_price = lpTSCall1Ans0->GetDouble(LDBIZ_STRATEGY_PRICE_FLOAT);
    v_price_type = lpTSCall1Ans0->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strategy_amt = lpTSCall1Ans0->GetDouble(LDBIZ_STRATEGY_AMT_FLOAT);
    v_strategy_valid_type = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT);
    strcpy(v_strategy_rule_way, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_RULE_WAY_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans0->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    strcpy(v_remark_info, lpTSCall1Ans0->GetString(LDBIZ_REMARK_INFO_STR));
    v_strategy_date = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_DATE_INT);
    v_strategy_time = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_TIME_INT);
    v_margin_trade_type = lpTSCall1Ans0->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
    strcpy(v_target_strategy_type, lpTSCall1Ans0->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR));
    strcpy(v_target_strategy_param, lpTSCall1Ans0->GetString(LDBIZ_TARGET_STRATEGY_PARAM_STR));
    strcpy(v_strategy_contr_comm, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_CONTR_COMM_STR));
    strcpy(v_strategy_status, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_STATUS_STR));
    strcpy(v_strategy_deal_status, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR));
    v_strategy_deal_kind = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
    v_order_qty = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_amt = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_AMT_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans0->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_external_no = lpTSCall1Ans0->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strcpy(v_strategy_oper_way, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_OPER_WAY_STR));
    v_busi_opor_no = lpTSCall1Ans0->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_strategy_price_type = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_PRICE_TYPE_INT);
    v_comm_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_id = lpTSCall1Ans0->GetInt64(LDBIZ_COMM_ID_INT64);


    // set @指令方向# = @策略方向#;
    v_comm_dir = v_strategy_dir;

    // set @订单方向# = @策略方向#;
    v_order_dir = v_strategy_dir;

    // set @指令限价# = @策略价格#;
    v_comm_limit_price = v_strategy_price;

    // set @订单价格# = @策略价格#;
    v_order_price = v_strategy_price;

    // set @指令数量# = @策略数量#;
    v_comm_qty = v_strategy_qty;

    // set @订单数量# = @策略数量#;
    v_order_qty = v_strategy_qty;

    // set @指令执行人# = 0;
    v_comm_executor = 0;
    //公共子系统检查
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

    // set @目标策略类型# = @临时_目标策略类型#;
    strcpy(v_target_strategy_type,v_tmp_target_strategy_type);

    // set @目标策略参数# = @临时_目标策略参数#;
    strcpy(v_target_strategy_param,v_tmp_target_strategy_param);

    // set @备注信息# = @临时_备注信息#;
    strcpy(v_remark_info,v_tmp_remark_info);
    //调用过程[事务_交易证券_策略_撤销策略]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.14", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    lpTSCall1Req2->SetString(LDBIZ_TARGET_STRATEGY_TYPE_STR,v_target_strategy_type);
    lpTSCall1Req2->SetString(LDBIZ_TARGET_STRATEGY_PARAM_STR,v_target_strategy_param);
    lpTSCall1Req2->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.14]subcall timed out!");
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
    v_comm_opor = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans2->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans2->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans2->GetString(LDBIZ_OUT_ACCO_STR));
    v_strategy_batch_no = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_BATCH_NO_INT);
    v_orig_strategy_id = lpTSCall1Ans2->GetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64);
    strcpy(v_strategy_exec_broker, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_EXEC_BROKER_STR));
    v_strategy_exec_kind = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT);
    strcpy(v_strategy_exec_comm_str, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR));
    v_exch_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans2->GetString(LDBIZ_STOCK_ACCO_STR));
    v_stock_type = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_stock_code, lpTSCall1Ans2->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_strategy_dir = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_DIR_INT);
    v_strategy_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRATEGY_QTY_FLOAT);
    v_cash_strategy_qty = lpTSCall1Ans2->GetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT);
    v_strategy_price = lpTSCall1Ans2->GetDouble(LDBIZ_STRATEGY_PRICE_FLOAT);
    v_price_type = lpTSCall1Ans2->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strategy_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STRATEGY_AMT_FLOAT);
    v_strategy_valid_type = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT);
    strcpy(v_strategy_rule_way, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_RULE_WAY_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_strategy_date = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_DATE_INT);
    v_strategy_time = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_TIME_INT);
    v_margin_trade_type = lpTSCall1Ans2->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
    strcpy(v_strategy_status, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_STATUS_STR));
    strcpy(v_strategy_deal_status, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR));
    v_strategy_deal_kind = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
    v_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_amt = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_AMT_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans2->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_external_no = lpTSCall1Ans2->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strcpy(v_strategy_oper_way, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_OPER_WAY_STR));
    v_busi_opor_no = lpTSCall1Ans2->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_new_strategy_id = lpTSCall1Ans2->GetInt64(LDBIZ_NEW_STRATEGY_ID_INT64);
    v_comm_id = lpTSCall1Ans2->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_update_times = lpTSCall1Ans2->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.104", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_STRATEGY_BATCH_NO_INT,v_strategy_batch_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.104]subcall timed out!");
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
    v_row_id = lpTSCall1Ans3->GetInt64(LDBIZ_ROW_ID_INT64);
    v_busi_opor_no = lpTSCall1Ans3->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_comm_opor = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_co_no = lpTSCall1Ans3->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans3->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans3->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans3->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_strategy_exec_broker, lpTSCall1Ans3->GetString(LDBIZ_STRATEGY_EXEC_BROKER_STR));
    v_strategy_exec_kind = lpTSCall1Ans3->GetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT);
    strcpy(v_strategy_exec_comm_str, lpTSCall1Ans3->GetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR));
    v_exch_no = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_type = lpTSCall1Ans3->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans3->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_stock_code, lpTSCall1Ans3->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_code_no = lpTSCall1Ans3->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_strategy_dir = lpTSCall1Ans3->GetInt32(LDBIZ_STRATEGY_DIR_INT);
    v_strategy_qty = lpTSCall1Ans3->GetDouble(LDBIZ_STRATEGY_QTY_FLOAT);
    v_cash_strategy_qty = lpTSCall1Ans3->GetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT);
    v_strategy_price = lpTSCall1Ans3->GetDouble(LDBIZ_STRATEGY_PRICE_FLOAT);
    v_price_type = lpTSCall1Ans3->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strategy_amt = lpTSCall1Ans3->GetDouble(LDBIZ_STRATEGY_AMT_FLOAT);
    v_strategy_valid_type = lpTSCall1Ans3->GetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT);
    strcpy(v_strategy_rule_way, lpTSCall1Ans3->GetString(LDBIZ_STRATEGY_RULE_WAY_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans3->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    strcpy(v_remark_info, lpTSCall1Ans3->GetString(LDBIZ_REMARK_INFO_STR));
    v_strategy_date = lpTSCall1Ans3->GetInt32(LDBIZ_STRATEGY_DATE_INT);
    v_margin_trade_type = lpTSCall1Ans3->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
    strcpy(v_target_strategy_type, lpTSCall1Ans3->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR));
    strcpy(v_target_strategy_param, lpTSCall1Ans3->GetString(LDBIZ_TARGET_STRATEGY_PARAM_STR));
    strcpy(v_strategy_contr_comm, lpTSCall1Ans3->GetString(LDBIZ_STRATEGY_CONTR_COMM_STR));
    strcpy(v_strategy_sum_status, lpTSCall1Ans3->GetString(LDBIZ_STRATEGY_SUM_STATUS_STR));
    strcpy(v_strategy_deal_status, lpTSCall1Ans3->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR));
    v_strategy_deal_kind = lpTSCall1Ans3->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
    v_order_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_valid_order_qty = lpTSCall1Ans3->GetDouble(LDBIZ_VALID_ORDER_QTY_FLOAT);
    v_order_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ORDER_AMT_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans3->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_valid_wtdraw_qty = lpTSCall1Ans3->GetDouble(LDBIZ_VALID_WTDRAW_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans3->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans3->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_cancel_qty = lpTSCall1Ans3->GetDouble(LDBIZ_CANCEL_QTY_FLOAT);
    v_faild_qty = lpTSCall1Ans3->GetDouble(LDBIZ_FAILD_QTY_FLOAT);
    v_external_no = lpTSCall1Ans3->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpTSCall1Ans3->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_comm_batch_no = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    strcpy(v_strategy_oper_way, lpTSCall1Ans3->GetString(LDBIZ_STRATEGY_OPER_WAY_STR));
    v_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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

    //调用过程[事务_交易证券_主推接口_获取指令混合信息]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.3", 0);
    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req4->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.3]subcall timed out!");
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
    v_co_no = lpTSCall1Ans4->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans4->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans4->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans4->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans4->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans4->GetString(LDBIZ_OUT_ACCO_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans4->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_stock_acco_no = lpTSCall1Ans4->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_stock_code_no = lpTSCall1Ans4->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_stock_type = lpTSCall1Ans4->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_comm_date = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_time = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_TIME_INT);
    v_comm_batch_no = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_opor = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_comm_executor = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_comm_dir = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_DIR_INT);
    v_comm_limit_price = lpTSCall1Ans4->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
    v_limit_actual_price = lpTSCall1Ans4->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
    v_comm_qty = lpTSCall1Ans4->GetDouble(LDBIZ_COMM_QTY_FLOAT);
    v_comm_amt = lpTSCall1Ans4->GetDouble(LDBIZ_COMM_AMT_FLOAT);
    v_order_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_comm_cancel_qty = lpTSCall1Ans4->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans4->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_qty = lpTSCall1Ans4->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_comm_frozen_amt = lpTSCall1Ans4->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
    v_comm_frozen_qty = lpTSCall1Ans4->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
    strcpy(v_strike_status, lpTSCall1Ans4->GetString(LDBIZ_STRIKE_STATUS_STR));
    strcpy(v_comm_status, lpTSCall1Ans4->GetString(LDBIZ_COMM_STATUS_STR));
    v_comm_begin_date = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
    v_comm_end_date = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_END_DATE_INT);
    v_comm_begin_time = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
    v_comm_end_time = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_END_TIME_INT);
    v_comm_comple_date = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
    v_comm_comple_time = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
    v_comm_appr_date = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
    v_comm_appr_time = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
    strcpy(v_comm_appr_status, lpTSCall1Ans4->GetString(LDBIZ_COMM_APPR_STATUS_STR));
    v_comm_appr_oper = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
    strcpy(v_comm_appr_remark, lpTSCall1Ans4->GetString(LDBIZ_COMM_APPR_REMARK_STR));
    v_basket_id = lpTSCall1Ans4->GetInt64(LDBIZ_BASKET_ID_INT64);
    v_net_price_flag = lpTSCall1Ans4->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
    v_bond_accr_intrst = lpTSCall1Ans4->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
    v_bond_rate_type = lpTSCall1Ans4->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
    strcpy(v_comm_oper_way, lpTSCall1Ans4->GetString(LDBIZ_COMM_OPER_WAY_STR));
    v_exter_comm_flag = lpTSCall1Ans4->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_comm_comple_flag = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
    v_strategy_capt_qty = lpTSCall1Ans4->GetDouble(LDBIZ_STRATEGY_CAPT_QTY_FLOAT);
    v_strategy_order_qty = lpTSCall1Ans4->GetDouble(LDBIZ_STRATEGY_ORDER_QTY_FLOAT);
    strcpy(v_contra_no, lpTSCall1Ans4->GetString(LDBIZ_CONTRA_NO_STR));
    strcpy(v_comm_remark_info, lpTSCall1Ans4->GetString(LDBIZ_COMM_REMARK_INFO_STR));
    v_disp_opor = lpTSCall1Ans4->GetInt32(LDBIZ_DISP_OPOR_INT);
    v_disp_status = lpTSCall1Ans4->GetInt32(LDBIZ_DISP_STATUS_INT);
    v_read_flag = lpTSCall1Ans4->GetInt32(LDBIZ_READ_FLAG_INT);
    v_update_times = lpTSCall1Ans4->GetInt32(LDBIZ_UPDATE_TIMES_INT);
    v_sum_comm_row_id = lpTSCall1Ans4->GetInt64(LDBIZ_SUM_COMM_ROW_ID_INT64);
    v_sum_comm_co_no = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_CO_NO_INT);
    v_sum_comm_pd_no = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_PD_NO_INT);
    v_sum_comm_exch_group_no = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_EXCH_GROUP_NO_INT);
    v_sum_comm_asset_acco_no = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_ASSET_ACCO_NO_INT);
    v_sum_comm_pass_no = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_PASS_NO_INT);
    strcpy(v_sum_comm_out_acco, lpTSCall1Ans4->GetString(LDBIZ_SUM_COMM_OUT_ACCO_STR));
    strcpy(v_sum_comm_exch_crncy_type, lpTSCall1Ans4->GetString(LDBIZ_SUM_COMM_EXCH_CRNCY_TYPE_STR));
    v_sum_comm_stock_code_no = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_STOCK_CODE_NO_INT);
    v_sum_comm_date = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_DATE_INT);
    v_sum_comm_time = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_TIME_INT);
    v_sum_comm_batch_no = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_BATCH_NO_INT);
    v_sum_comm_opor = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_OPOR_INT);
    v_sum_comm_executor = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_EXECUTOR_INT);
    v_sum_comm_dir = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_DIR_INT);
    v_sum_comm_limit_price = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_COMM_LIMIT_PRICE_FLOAT);
    v_sum_comm_qty = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_COMM_QTY_FLOAT);
    v_sum_comm_amt = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_COMM_AMT_FLOAT);
    v_sum_comm_order_qty = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_COMM_ORDER_QTY_FLOAT);
    v_sum_comm_cancel_qty = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_COMM_CANCEL_QTY_FLOAT);
    v_sum_comm_await_cancel_qty = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_COMM_AWAIT_CANCEL_QTY_FLOAT);
    v_sum_comm_strike_amt = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_COMM_STRIKE_AMT_FLOAT);
    v_sum_comm_strike_qty = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_COMM_STRIKE_QTY_FLOAT);
    strcpy(v_sum_comm_strike_status, lpTSCall1Ans4->GetString(LDBIZ_SUM_COMM_STRIKE_STATUS_STR));
    strcpy(v_comm_sum_status, lpTSCall1Ans4->GetString(LDBIZ_COMM_SUM_STATUS_STR));
    v_sum_comm_begin_date = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_BEGIN_DATE_INT);
    v_sum_comm_end_date = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_END_DATE_INT);
    v_sum_comm_begin_time = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_BEGIN_TIME_INT);
    v_sum_comm_end_time = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_END_TIME_INT);
    v_sum_comm_comple_date = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_COMPLE_DATE_INT);
    v_sum_comm_comple_time = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_COMPLE_TIME_INT);
    v_sum_comm_max_comm_comple_date = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_DATE_INT);
    v_sum_comm_max_comm_comple_time = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_TIME_INT);
    v_sum_comm_appr_date = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_APPR_DATE_INT);
    v_sum_comm_appr_time = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_APPR_TIME_INT);
    v_sum_comm_appr_qty = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_COMM_APPR_QTY_FLOAT);
    strcpy(v_comm_sum_approve_status, lpTSCall1Ans4->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
    v_sum_comm_basket_id = lpTSCall1Ans4->GetInt64(LDBIZ_SUM_COMM_BASKET_ID_INT64);
    v_sum_comm_net_price_flag = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_NET_PRICE_FLAG_INT);
    v_sum_comm_bond_accr_intrst = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_COMM_BOND_ACCR_INTRST_FLOAT);
    v_sum_comm_bond_rate_type = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_BOND_RATE_TYPE_INT);
    strcpy(v_sum_comm_oper_way, lpTSCall1Ans4->GetString(LDBIZ_SUM_COMM_OPER_WAY_STR));
    v_sum_comm_exter_comm_flag = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_EXTER_COMM_FLAG_INT);
    v_sum_buy_order_qty = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_BUY_ORDER_QTY_FLOAT);
    v_sum_sell_order_qty = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_SELL_ORDER_QTY_FLOAT);
    v_sum_buy_comm_qty = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_BUY_COMM_QTY_FLOAT);
    v_sum_sell_comm_qty = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_SELL_COMM_QTY_FLOAT);
    v_sum_buy_strike_qty = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_BUY_STRIKE_QTY_FLOAT);
    v_sum_sell_strike_qty = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_SELL_STRIKE_QTY_FLOAT);
    v_sum_buy_strike_amt = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_BUY_STRIKE_AMT_FLOAT);
    v_sum_sell_strike_amt = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_SELL_STRIKE_AMT_FLOAT);
    v_sum_buy_comm_amt = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_BUY_COMM_AMT_FLOAT);
    v_sum_sell_comm_amt = lpTSCall1Ans4->GetDouble(LDBIZ_SUM_SELL_COMM_AMT_FLOAT);
    strcpy(v_sum_comm_remark_info, lpTSCall1Ans4->GetString(LDBIZ_SUM_COMM_REMARK_INFO_STR));
    v_sum_comm_update_times = lpTSCall1Ans4->GetInt32(LDBIZ_SUM_COMM_UPDATE_TIMES_INT);
    strcpy(v_acco_concat_info, lpTSCall1Ans4->GetString(LDBIZ_ACCO_CONCAT_INFO_STR));
    strcpy(v_combo_code, lpTSCall1Ans4->GetString(LDBIZ_COMBO_CODE_STR));


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

        // set @指令备注信息#= @汇总指令备注信息#;
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
    lpOutBizMsg->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    lpOutBizMsg->SetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64,v_orig_strategy_id);
    lpOutBizMsg->SetInt32(LDBIZ_STRATEGY_TIME_INT,v_strategy_time);
    lpOutBizMsg->SetString(LDBIZ_TARGET_STRATEGY_TYPE_STR,v_target_strategy_type);
    lpOutBizMsg->SetString(LDBIZ_TARGET_STRATEGY_PARAM_STR,v_target_strategy_param);
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

//逻辑_交易证券_策略_更新策略执行情况
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
    int64 v_strategy_id;
    int64 v_order_id;
    double v_order_qty;
    double v_order_amt;
    double v_wtdraw_qty;
    int64 v_strike_id;
    double v_strike_qty;
    double v_strike_amt;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_exch_no;
    char v_stock_code[7];
    int v_strategy_dir;
    char v_strategy_oper_way[3];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_busi_opor_no;
    int v_comm_opor;
    int v_co_no;
    int v_pd_no;
    char v_strategy_exec_broker[17];
    int v_strategy_exec_kind;
    char v_strategy_exec_comm_str[2049];
    int v_stock_type;
    int v_stock_code_no;
    double v_strategy_qty;
    double v_cash_strategy_qty;
    double v_strategy_price;
    double v_strategy_amt;
    int v_price_type;
    int v_strategy_valid_type;
    char v_strategy_rule_way[5];
    char v_exch_crncy_type[4];
    char v_remark_info[256];
    int v_strategy_date;
    int v_strategy_time;
    int v_margin_trade_type;
    char v_target_strategy_type[17];
    char v_target_strategy_param[2049];
    int64 v_external_no;
    int v_order_batch_no;
    char v_strategy_status[3];
    double v_total_order_qty;
    double v_total_order_amt;
    double v_all_wtdraw_qty;
    double v_total_strike_qty;
    double v_total_strike_amt;
    int v_strategy_batch_no;
    int v_comm_batch_no;
    int v_update_times;
    char v_is_auto_push[3];
    int64 v_comm_id;
    int64 v_row_id;
    int v_pass_no;
    int v_asset_type;
    char v_strategy_contr_comm[2049];
    char v_strategy_sum_status[3];
    char v_strategy_deal_status[3];
    int v_strategy_deal_kind;
    double v_valid_order_qty;
    double v_valid_wtdraw_qty;
    double v_cancel_qty;
    double v_faild_qty;
    char v_out_acco[33];
    int v_stock_acco_no;
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
    char v_stock_acco[17];
    int v_trade_code_no;
    int v_target_code_no;
    int v_report_date;
    int v_report_time;
    char v_report_no[33];
    int v_order_date;
    int v_order_time;
    int v_order_dir;
    double v_order_price;
    char v_order_status[3];
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
    int v_intrst_days;
    double v_par_value;
    double v_strike_bond_accr_intrst;
    double v_impawn_ratio;
    double v_order_frozen_amt;
    double v_order_frozen_qty;
    char v_rsp_info[256];
    int64 v_compli_trig_id;
    int v_cost_calc_type;
    char v_order_oper_way[3];
    int v_record_valid_flag;
    int64 v_combo_posi_id;
    int v_asset_acco_type;
    double v_curr_strike_price;
    double v_curr_strike_amt;
    double v_curr_strike_qty;
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
    v_strategy_id=0;
    v_order_id=0;
    v_order_qty=0;
    v_order_amt=0;
    v_wtdraw_qty=0;
    v_strike_id=0;
    v_strike_qty=0;
    v_strike_amt=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    strcpy(v_stock_code, " ");
    v_strategy_dir=0;
    strcpy(v_strategy_oper_way, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_busi_opor_no=0;
    v_comm_opor=0;
    v_co_no=0;
    v_pd_no=0;
    strcpy(v_strategy_exec_broker, " ");
    v_strategy_exec_kind=0;
    strcpy(v_strategy_exec_comm_str, " ");
    v_stock_type=0;
    v_stock_code_no=0;
    v_strategy_qty=0;
    v_cash_strategy_qty=0;
    v_strategy_price=0;
    v_strategy_amt=0;
    v_price_type=0;
    v_strategy_valid_type=0;
    strcpy(v_strategy_rule_way, " ");
    strcpy(v_exch_crncy_type, "CNY");
    strcpy(v_remark_info, " ");
    v_strategy_date=0;
    v_strategy_time=0;
    v_margin_trade_type=0;
    strcpy(v_target_strategy_type, " ");
    strcpy(v_target_strategy_param, " ");
    v_external_no=0;
    v_order_batch_no=0;
    strcpy(v_strategy_status, " ");
    v_total_order_qty=0;
    v_total_order_amt=0;
    v_all_wtdraw_qty=0;
    v_total_strike_qty=0;
    v_total_strike_amt=0;
    v_strategy_batch_no=0;
    v_comm_batch_no=0;
    v_update_times=1;
    strcpy(v_is_auto_push, "0");
    v_comm_id=0;
    v_row_id=0;
    v_pass_no=0;
    v_asset_type=0;
    strcpy(v_strategy_contr_comm, " ");
    strcpy(v_strategy_sum_status, " ");
    strcpy(v_strategy_deal_status, " ");
    v_strategy_deal_kind=0;
    v_valid_order_qty=0;
    v_valid_wtdraw_qty=0;
    v_cancel_qty=0;
    v_faild_qty=0;
    strcpy(v_out_acco, " ");
    v_stock_acco_no=0;
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
    strcpy(v_stock_acco, " ");
    v_trade_code_no=0;
    v_target_code_no=0;
    v_report_date=0;
    v_report_time=0;
    strcpy(v_report_no, " ");
    v_order_date=0;
    v_order_time=0;
    v_order_dir=0;
    v_order_price=0;
    strcpy(v_order_status, "0");
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
    v_intrst_days=0;
    v_par_value=0;
    v_strike_bond_accr_intrst=0;
    v_impawn_ratio=0;
    v_order_frozen_amt=0;
    v_order_frozen_qty=0;
    strcpy(v_rsp_info, " ");
    v_compli_trig_id=0;
    v_cost_calc_type=0;
    strcpy(v_order_oper_way, " ");
    v_record_valid_flag=0;
    v_combo_posi_id=0;
    v_asset_acco_type=0;
    v_curr_strike_price=0;
    v_curr_strike_amt=0;
    v_curr_strike_qty=0;
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
    v_strategy_id = lpInBizMsg->GetInt64(LDBIZ_STRATEGY_ID_INT64);
    v_order_id = lpInBizMsg->GetInt64(LDBIZ_ORDER_ID_INT64);
    v_order_qty = lpInBizMsg->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_amt = lpInBizMsg->GetDouble(LDBIZ_ORDER_AMT_FLOAT);
    v_wtdraw_qty = lpInBizMsg->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_id = lpInBizMsg->GetInt64(LDBIZ_STRIKE_ID_INT64);
    v_strike_qty = lpInBizMsg->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpInBizMsg->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);

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


    // set @功能编码# = "tdsecuL.11.15";
    strcpy(v_func_code,"tdsecuL.11.15");
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

    //调用过程[事务_交易证券_策略_更新策略执行情况]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.15", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    lpTSCall1Req1->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
    lpTSCall1Req1->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req1->SetDouble(LDBIZ_ORDER_AMT_FLOAT,v_order_amt);
    lpTSCall1Req1->SetDouble(LDBIZ_WTDRAW_QTY_FLOAT,v_wtdraw_qty);
    lpTSCall1Req1->SetInt64(LDBIZ_STRIKE_ID_INT64,v_strike_id);
    lpTSCall1Req1->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
    lpTSCall1Req1->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.15]subcall timed out!");
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
    v_comm_opor = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strcpy(v_strategy_exec_broker, lpTSCall1Ans1->GetString(LDBIZ_STRATEGY_EXEC_BROKER_STR));
    v_strategy_exec_kind = lpTSCall1Ans1->GetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT);
    strcpy(v_strategy_exec_comm_str, lpTSCall1Ans1->GetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR));
    v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_type = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_TYPE_INT);
    strcpy(v_stock_code, lpTSCall1Ans1->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_strategy_dir = lpTSCall1Ans1->GetInt32(LDBIZ_STRATEGY_DIR_INT);
    v_strategy_qty = lpTSCall1Ans1->GetDouble(LDBIZ_STRATEGY_QTY_FLOAT);
    v_cash_strategy_qty = lpTSCall1Ans1->GetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT);
    v_strategy_price = lpTSCall1Ans1->GetDouble(LDBIZ_STRATEGY_PRICE_FLOAT);
    v_strategy_amt = lpTSCall1Ans1->GetDouble(LDBIZ_STRATEGY_AMT_FLOAT);
    v_price_type = lpTSCall1Ans1->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strategy_valid_type = lpTSCall1Ans1->GetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT);
    strcpy(v_strategy_rule_way, lpTSCall1Ans1->GetString(LDBIZ_STRATEGY_RULE_WAY_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    strcpy(v_remark_info, lpTSCall1Ans1->GetString(LDBIZ_REMARK_INFO_STR));
    v_strategy_date = lpTSCall1Ans1->GetInt32(LDBIZ_STRATEGY_DATE_INT);
    v_strategy_time = lpTSCall1Ans1->GetInt32(LDBIZ_STRATEGY_TIME_INT);
    v_margin_trade_type = lpTSCall1Ans1->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
    strcpy(v_target_strategy_type, lpTSCall1Ans1->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR));
    strcpy(v_target_strategy_param, lpTSCall1Ans1->GetString(LDBIZ_TARGET_STRATEGY_PARAM_STR));
    v_external_no = lpTSCall1Ans1->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strcpy(v_strategy_status, lpTSCall1Ans1->GetString(LDBIZ_STRATEGY_STATUS_STR));
    v_total_order_qty = lpTSCall1Ans1->GetDouble(LDBIZ_TOTAL_ORDER_QTY_FLOAT);
    v_total_order_amt = lpTSCall1Ans1->GetDouble(LDBIZ_TOTAL_ORDER_AMT_FLOAT);
    v_all_wtdraw_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ALL_WTDRAW_QTY_FLOAT);
    v_total_strike_qty = lpTSCall1Ans1->GetDouble(LDBIZ_TOTAL_STRIKE_QTY_FLOAT);
    v_total_strike_amt = lpTSCall1Ans1->GetDouble(LDBIZ_TOTAL_STRIKE_AMT_FLOAT);
    strcpy(v_strategy_oper_way, lpTSCall1Ans1->GetString(LDBIZ_STRATEGY_OPER_WAY_STR));
    v_strategy_batch_no = lpTSCall1Ans1->GetInt32(LDBIZ_STRATEGY_BATCH_NO_INT);
    v_comm_batch_no = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_update_times = lpTSCall1Ans1->GetInt32(LDBIZ_UPDATE_TIMES_INT);
    strcpy(v_is_auto_push, lpTSCall1Ans1->GetString(LDBIZ_IS_AUTO_PUSH_STR));
    v_comm_id = lpTSCall1Ans1->GetInt64(LDBIZ_COMM_ID_INT64);


    // set @订单数量# = @总订单数量#;
    v_order_qty = v_total_order_qty;

    // set @订单金额# = @总订单金额#;
    v_order_amt = v_total_order_amt;

    // set @撤单数量# = @总撤单数量#;
    v_wtdraw_qty = v_all_wtdraw_qty;

    // set @成交数量# = @总成交数量#;
    v_strike_qty = v_total_strike_qty;

    // set @成交金额# = @总成交金额#;
    v_strike_amt = v_total_strike_amt;

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
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.104", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_STRATEGY_BATCH_NO_INT,v_strategy_batch_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.104]subcall timed out!");
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
    v_busi_opor_no = lpTSCall1Ans2->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_comm_opor = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans2->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans2->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_strategy_exec_broker, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_EXEC_BROKER_STR));
    v_strategy_exec_kind = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT);
    strcpy(v_strategy_exec_comm_str, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR));
    v_exch_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_type = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_stock_code, lpTSCall1Ans2->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_strategy_dir = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_DIR_INT);
    v_strategy_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRATEGY_QTY_FLOAT);
    v_cash_strategy_qty = lpTSCall1Ans2->GetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT);
    v_strategy_price = lpTSCall1Ans2->GetDouble(LDBIZ_STRATEGY_PRICE_FLOAT);
    v_price_type = lpTSCall1Ans2->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strategy_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STRATEGY_AMT_FLOAT);
    v_strategy_valid_type = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT);
    strcpy(v_strategy_rule_way, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_RULE_WAY_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    strcpy(v_remark_info, lpTSCall1Ans2->GetString(LDBIZ_REMARK_INFO_STR));
    v_strategy_date = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_DATE_INT);
    v_margin_trade_type = lpTSCall1Ans2->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
    strcpy(v_target_strategy_type, lpTSCall1Ans2->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR));
    strcpy(v_target_strategy_param, lpTSCall1Ans2->GetString(LDBIZ_TARGET_STRATEGY_PARAM_STR));
    strcpy(v_strategy_contr_comm, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_CONTR_COMM_STR));
    strcpy(v_strategy_sum_status, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_SUM_STATUS_STR));
    strcpy(v_strategy_deal_status, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR));
    v_strategy_deal_kind = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
    v_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_valid_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_VALID_ORDER_QTY_FLOAT);
    v_order_amt = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_AMT_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans2->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_valid_wtdraw_qty = lpTSCall1Ans2->GetDouble(LDBIZ_VALID_WTDRAW_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_cancel_qty = lpTSCall1Ans2->GetDouble(LDBIZ_CANCEL_QTY_FLOAT);
    v_faild_qty = lpTSCall1Ans2->GetDouble(LDBIZ_FAILD_QTY_FLOAT);
    v_external_no = lpTSCall1Ans2->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_comm_batch_no = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    strcpy(v_strategy_oper_way, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_OPER_WAY_STR));
    v_update_times = lpTSCall1Ans2->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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

    //调用过程[事务_交易证券_主推接口_获取指令混合信息]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.3", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.3]subcall timed out!");
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
    v_co_no = lpTSCall1Ans3->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans3->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans3->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans3->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans3->GetString(LDBIZ_OUT_ACCO_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans3->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_stock_acco_no = lpTSCall1Ans3->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_stock_code_no = lpTSCall1Ans3->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_stock_type = lpTSCall1Ans3->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_comm_date = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_DATE_INT);
    v_comm_time = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_TIME_INT);
    v_comm_batch_no = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_opor = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_comm_executor = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_comm_dir = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_DIR_INT);
    v_comm_limit_price = lpTSCall1Ans3->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
    v_limit_actual_price = lpTSCall1Ans3->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
    v_comm_qty = lpTSCall1Ans3->GetDouble(LDBIZ_COMM_QTY_FLOAT);
    v_comm_amt = lpTSCall1Ans3->GetDouble(LDBIZ_COMM_AMT_FLOAT);
    v_order_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_comm_cancel_qty = lpTSCall1Ans3->GetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans3->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_strike_qty = lpTSCall1Ans3->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_comm_frozen_amt = lpTSCall1Ans3->GetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT);
    v_comm_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT);
    strcpy(v_strike_status, lpTSCall1Ans3->GetString(LDBIZ_STRIKE_STATUS_STR));
    strcpy(v_comm_status, lpTSCall1Ans3->GetString(LDBIZ_COMM_STATUS_STR));
    v_comm_begin_date = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_BEGIN_DATE_INT);
    v_comm_end_date = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_END_DATE_INT);
    v_comm_begin_time = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_BEGIN_TIME_INT);
    v_comm_end_time = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_END_TIME_INT);
    v_comm_comple_date = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_COMPLE_DATE_INT);
    v_comm_comple_time = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_COMPLE_TIME_INT);
    v_comm_appr_date = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_APPR_DATE_INT);
    v_comm_appr_time = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_APPR_TIME_INT);
    strcpy(v_comm_appr_status, lpTSCall1Ans3->GetString(LDBIZ_COMM_APPR_STATUS_STR));
    v_comm_appr_oper = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
    strcpy(v_comm_appr_remark, lpTSCall1Ans3->GetString(LDBIZ_COMM_APPR_REMARK_STR));
    v_basket_id = lpTSCall1Ans3->GetInt64(LDBIZ_BASKET_ID_INT64);
    v_net_price_flag = lpTSCall1Ans3->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
    v_bond_accr_intrst = lpTSCall1Ans3->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
    v_bond_rate_type = lpTSCall1Ans3->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
    strcpy(v_comm_oper_way, lpTSCall1Ans3->GetString(LDBIZ_COMM_OPER_WAY_STR));
    v_exter_comm_flag = lpTSCall1Ans3->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
    v_comm_comple_flag = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_COMPLE_FLAG_INT);
    v_strategy_capt_qty = lpTSCall1Ans3->GetDouble(LDBIZ_STRATEGY_CAPT_QTY_FLOAT);
    v_strategy_order_qty = lpTSCall1Ans3->GetDouble(LDBIZ_STRATEGY_ORDER_QTY_FLOAT);
    strcpy(v_contra_no, lpTSCall1Ans3->GetString(LDBIZ_CONTRA_NO_STR));
    strcpy(v_comm_remark_info, lpTSCall1Ans3->GetString(LDBIZ_COMM_REMARK_INFO_STR));
    v_disp_opor = lpTSCall1Ans3->GetInt32(LDBIZ_DISP_OPOR_INT);
    v_disp_status = lpTSCall1Ans3->GetInt32(LDBIZ_DISP_STATUS_INT);
    v_read_flag = lpTSCall1Ans3->GetInt32(LDBIZ_READ_FLAG_INT);
    v_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_UPDATE_TIMES_INT);
    v_sum_comm_row_id = lpTSCall1Ans3->GetInt64(LDBIZ_SUM_COMM_ROW_ID_INT64);
    v_sum_comm_co_no = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_CO_NO_INT);
    v_sum_comm_pd_no = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_PD_NO_INT);
    v_sum_comm_exch_group_no = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_EXCH_GROUP_NO_INT);
    v_sum_comm_asset_acco_no = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_ASSET_ACCO_NO_INT);
    v_sum_comm_pass_no = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_PASS_NO_INT);
    strcpy(v_sum_comm_out_acco, lpTSCall1Ans3->GetString(LDBIZ_SUM_COMM_OUT_ACCO_STR));
    strcpy(v_sum_comm_exch_crncy_type, lpTSCall1Ans3->GetString(LDBIZ_SUM_COMM_EXCH_CRNCY_TYPE_STR));
    v_sum_comm_stock_code_no = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_STOCK_CODE_NO_INT);
    v_sum_comm_date = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_DATE_INT);
    v_sum_comm_time = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_TIME_INT);
    v_sum_comm_batch_no = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_BATCH_NO_INT);
    v_sum_comm_opor = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_OPOR_INT);
    v_sum_comm_executor = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_EXECUTOR_INT);
    v_sum_comm_dir = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_DIR_INT);
    v_sum_comm_limit_price = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_COMM_LIMIT_PRICE_FLOAT);
    v_sum_comm_qty = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_COMM_QTY_FLOAT);
    v_sum_comm_amt = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_COMM_AMT_FLOAT);
    v_sum_comm_order_qty = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_COMM_ORDER_QTY_FLOAT);
    v_sum_comm_cancel_qty = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_COMM_CANCEL_QTY_FLOAT);
    v_sum_comm_await_cancel_qty = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_COMM_AWAIT_CANCEL_QTY_FLOAT);
    v_sum_comm_strike_amt = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_COMM_STRIKE_AMT_FLOAT);
    v_sum_comm_strike_qty = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_COMM_STRIKE_QTY_FLOAT);
    strcpy(v_sum_comm_strike_status, lpTSCall1Ans3->GetString(LDBIZ_SUM_COMM_STRIKE_STATUS_STR));
    strcpy(v_comm_sum_status, lpTSCall1Ans3->GetString(LDBIZ_COMM_SUM_STATUS_STR));
    v_sum_comm_begin_date = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_BEGIN_DATE_INT);
    v_sum_comm_end_date = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_END_DATE_INT);
    v_sum_comm_begin_time = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_BEGIN_TIME_INT);
    v_sum_comm_end_time = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_END_TIME_INT);
    v_sum_comm_comple_date = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_COMPLE_DATE_INT);
    v_sum_comm_comple_time = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_COMPLE_TIME_INT);
    v_sum_comm_max_comm_comple_date = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_DATE_INT);
    v_sum_comm_max_comm_comple_time = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_MAX_COMM_COMPLE_TIME_INT);
    v_sum_comm_appr_date = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_APPR_DATE_INT);
    v_sum_comm_appr_time = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_APPR_TIME_INT);
    v_sum_comm_appr_qty = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_COMM_APPR_QTY_FLOAT);
    strcpy(v_comm_sum_approve_status, lpTSCall1Ans3->GetString(LDBIZ_COMM_SUM_APPROVE_STATUS_STR));
    v_sum_comm_basket_id = lpTSCall1Ans3->GetInt64(LDBIZ_SUM_COMM_BASKET_ID_INT64);
    v_sum_comm_net_price_flag = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_NET_PRICE_FLAG_INT);
    v_sum_comm_bond_accr_intrst = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_COMM_BOND_ACCR_INTRST_FLOAT);
    v_sum_comm_bond_rate_type = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_BOND_RATE_TYPE_INT);
    strcpy(v_sum_comm_oper_way, lpTSCall1Ans3->GetString(LDBIZ_SUM_COMM_OPER_WAY_STR));
    v_sum_comm_exter_comm_flag = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_EXTER_COMM_FLAG_INT);
    v_sum_buy_order_qty = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_BUY_ORDER_QTY_FLOAT);
    v_sum_sell_order_qty = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_SELL_ORDER_QTY_FLOAT);
    v_sum_buy_comm_qty = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_BUY_COMM_QTY_FLOAT);
    v_sum_sell_comm_qty = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_SELL_COMM_QTY_FLOAT);
    v_sum_buy_strike_qty = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_BUY_STRIKE_QTY_FLOAT);
    v_sum_sell_strike_qty = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_SELL_STRIKE_QTY_FLOAT);
    v_sum_buy_strike_amt = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_BUY_STRIKE_AMT_FLOAT);
    v_sum_sell_strike_amt = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_SELL_STRIKE_AMT_FLOAT);
    v_sum_buy_comm_amt = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_BUY_COMM_AMT_FLOAT);
    v_sum_sell_comm_amt = lpTSCall1Ans3->GetDouble(LDBIZ_SUM_SELL_COMM_AMT_FLOAT);
    strcpy(v_sum_comm_remark_info, lpTSCall1Ans3->GetString(LDBIZ_SUM_COMM_REMARK_INFO_STR));
    v_sum_comm_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_SUM_COMM_UPDATE_TIMES_INT);
    strcpy(v_acco_concat_info, lpTSCall1Ans3->GetString(LDBIZ_ACCO_CONCAT_INFO_STR));
    strcpy(v_combo_code, lpTSCall1Ans3->GetString(LDBIZ_COMBO_CODE_STR));


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

        // set @指令备注信息#= @汇总指令备注信息#;
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


    // if @是否支持主推# = 《是否支持主推-是》  then
    if (strcmp(v_is_auto_push , "1" )==0)
    {
       //调用过程[事务_交易证券_主推接口_获取订单信息]
       //组织事务请求
       if(lpTSCall1Ans4)
       {
         lpTSCall1Ans4->FreeMsg();
         lpTSCall1Ans4=NULL;
       }
       lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("tdsecuT.9.45", 0);
       lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
       lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
       lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
       lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
       lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
       lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
       lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
       lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
       lpTSCall1Req4->SetInt64(LDBIZ_ORDER_ID_INT64,v_order_id);
       glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
       if(!lpTSCall1Ans4)  //  超时错误
       {
           lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
           lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.9.45]subcall timed out!");
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
       v_busi_opor_no = lpTSCall1Ans4->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
       v_pd_no = lpTSCall1Ans4->GetInt32(LDBIZ_PD_NO_INT);
       v_exch_group_no = lpTSCall1Ans4->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
       v_asset_acco_no = lpTSCall1Ans4->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
       v_pass_no = lpTSCall1Ans4->GetInt32(LDBIZ_PASS_NO_INT);
       strcpy(v_out_acco, lpTSCall1Ans4->GetString(LDBIZ_OUT_ACCO_STR));
       strcpy(v_exch_crncy_type, lpTSCall1Ans4->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
       v_exch_no = lpTSCall1Ans4->GetInt32(LDBIZ_EXCH_NO_INT);
       v_stock_acco_no = lpTSCall1Ans4->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
       strcpy(v_stock_acco, lpTSCall1Ans4->GetString(LDBIZ_STOCK_ACCO_STR));
       v_stock_code_no = lpTSCall1Ans4->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
       strcpy(v_stock_code, lpTSCall1Ans4->GetString(LDBIZ_STOCK_CODE_STR));
       v_trade_code_no = lpTSCall1Ans4->GetInt32(LDBIZ_TRADE_CODE_NO_INT);
       v_target_code_no = lpTSCall1Ans4->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
       v_stock_type = lpTSCall1Ans4->GetInt32(LDBIZ_STOCK_TYPE_INT);
       v_asset_type = lpTSCall1Ans4->GetInt32(LDBIZ_ASSET_TYPE_INT);
       v_external_no = lpTSCall1Ans4->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
       v_comm_id = lpTSCall1Ans4->GetInt64(LDBIZ_COMM_ID_INT64);
       v_comm_batch_no = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
       v_comm_opor = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_OPOR_INT);
       v_report_date = lpTSCall1Ans4->GetInt32(LDBIZ_REPORT_DATE_INT);
       v_report_time = lpTSCall1Ans4->GetInt32(LDBIZ_REPORT_TIME_INT);
       strcpy(v_report_no, lpTSCall1Ans4->GetString(LDBIZ_REPORT_NO_STR));
       v_order_date = lpTSCall1Ans4->GetInt32(LDBIZ_ORDER_DATE_INT);
       v_order_time = lpTSCall1Ans4->GetInt32(LDBIZ_ORDER_TIME_INT);
       v_order_batch_no = lpTSCall1Ans4->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
       v_order_dir = lpTSCall1Ans4->GetInt32(LDBIZ_ORDER_DIR_INT);
       v_price_type = lpTSCall1Ans4->GetInt32(LDBIZ_PRICE_TYPE_INT);
       v_order_price = lpTSCall1Ans4->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
       v_order_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
       strcpy(v_order_status, lpTSCall1Ans4->GetString(LDBIZ_ORDER_STATUS_STR));
       v_wtdraw_qty = lpTSCall1Ans4->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
       v_strike_amt = lpTSCall1Ans4->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
       v_strike_qty = lpTSCall1Ans4->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
       v_all_fee = lpTSCall1Ans4->GetDouble(LDBIZ_ALL_FEE_FLOAT);
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
       v_net_price_flag = lpTSCall1Ans4->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
       v_intrst_days = lpTSCall1Ans4->GetInt32(LDBIZ_INTRST_DAYS_INT);
       v_par_value = lpTSCall1Ans4->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
       v_bond_accr_intrst = lpTSCall1Ans4->GetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT);
       v_bond_rate_type = lpTSCall1Ans4->GetInt32(LDBIZ_BOND_RATE_TYPE_INT);
       v_strike_bond_accr_intrst = lpTSCall1Ans4->GetDouble(LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
       v_impawn_ratio = lpTSCall1Ans4->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
       v_order_frozen_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);
       v_order_frozen_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ORDER_FROZEN_QTY_FLOAT);
       strcpy(v_rsp_info, lpTSCall1Ans4->GetString(LDBIZ_RSP_INFO_STR));
       v_compli_trig_id = lpTSCall1Ans4->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);
       strcpy(v_remark_info, lpTSCall1Ans4->GetString(LDBIZ_REMARK_INFO_STR));
       v_cost_calc_type = lpTSCall1Ans4->GetInt32(LDBIZ_COST_CALC_TYPE_INT);
       strcpy(v_order_oper_way, lpTSCall1Ans4->GetString(LDBIZ_ORDER_OPER_WAY_STR));
       v_exter_comm_flag = lpTSCall1Ans4->GetInt32(LDBIZ_EXTER_COMM_FLAG_INT);
       v_record_valid_flag = lpTSCall1Ans4->GetInt32(LDBIZ_RECORD_VALID_FLAG_INT);
       strcpy(v_combo_code, lpTSCall1Ans4->GetString(LDBIZ_COMBO_CODE_STR));
       v_combo_posi_id = lpTSCall1Ans4->GetInt64(LDBIZ_COMBO_POSI_ID_INT64);
       v_strategy_id = lpTSCall1Ans4->GetInt64(LDBIZ_STRATEGY_ID_INT64);
       v_asset_acco_type = lpTSCall1Ans4->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);
       strcpy(v_contra_no, lpTSCall1Ans4->GetString(LDBIZ_CONTRA_NO_STR));
       v_update_times = lpTSCall1Ans4->GetInt32(LDBIZ_UPDATE_TIMES_INT);


       // set @操作员编号# = @业务操作员编号#;
       v_opor_no = v_busi_opor_no;

       // set @当笔成交价格# = 0;
       v_curr_strike_price = 0;

       // set @当笔成交金额# = 0;
       v_curr_strike_amt = 0;

       // set @当笔成交数量# = 0;
       v_curr_strike_qty = 0;

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
    lpOutBizMsg->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    lpOutBizMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpOutBizMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpOutBizMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpOutBizMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpOutBizMsg->SetInt32(LDBIZ_STRATEGY_DIR_INT,v_strategy_dir);
    lpOutBizMsg->SetString(LDBIZ_STRATEGY_OPER_WAY_STR,v_strategy_oper_way);
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

//逻辑_交易证券_策略_更新策略状态
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
    int64 v_orig_strategy_id;
    int64 v_strategy_id;
    char v_strategy_deal_status[3];
    char v_strategy_status[3];
    char v_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_exch_no;
    char v_stock_code[7];
    int v_strategy_dir;
    char v_strategy_oper_way[3];
    int64 v_tmp_orig_strategy_id;
    int64 v_tmp_strategy_id;
    char v_tmp_strategy_deal_status[3];
    char v_tmp_strategy_status[3];
    char v_tmp_remark_info[256];
    int v_comm_opor;
    int v_co_no;
    int v_pd_no;
    int v_pass_no;
    char v_out_acco[33];
    int v_strategy_batch_no;
    char v_strategy_exec_broker[17];
    int v_strategy_exec_kind;
    char v_strategy_exec_comm_str[2049];
    int v_stock_acco_no;
    char v_stock_acco[17];
    int v_stock_type;
    int v_asset_type;
    int v_stock_code_no;
    double v_strategy_qty;
    double v_cash_strategy_qty;
    double v_strategy_price;
    int v_price_type;
    double v_strategy_amt;
    int v_strategy_valid_type;
    char v_strategy_rule_way[5];
    char v_exch_crncy_type[4];
    int v_strategy_date;
    int v_strategy_time;
    int v_margin_trade_type;
    char v_target_strategy_type[17];
    char v_target_strategy_param[2049];
    char v_strategy_contr_comm[2049];
    int v_strategy_deal_kind;
    double v_order_qty;
    double v_order_amt;
    double v_wtdraw_qty;
    double v_strike_qty;
    double v_strike_amt;
    int64 v_external_no;
    int v_order_batch_no;
    int v_busi_opor_no;
    int v_strategy_price_type;
    int v_comm_batch_no;
    int64 v_comm_id;
    int v_comm_dir;
    double v_comm_limit_price;
    double v_comm_qty;
    int v_comm_executor;
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_new_strategy_id;
    int v_update_times;
    int64 v_row_id;
    char v_strategy_sum_status[3];
    double v_valid_order_qty;
    double v_valid_wtdraw_qty;
    double v_cancel_qty;
    double v_faild_qty;
    int v_comm_date;
    int v_comm_time;
    double v_limit_actual_price;
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
    v_orig_strategy_id=0;
    v_strategy_id=0;
    strcpy(v_strategy_deal_status, " ");
    strcpy(v_strategy_status, " ");
    strcpy(v_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    strcpy(v_stock_code, " ");
    v_strategy_dir=0;
    strcpy(v_strategy_oper_way, " ");
    v_tmp_orig_strategy_id=0;
    v_tmp_strategy_id=0;
    strcpy(v_tmp_strategy_deal_status, " ");
    strcpy(v_tmp_strategy_status, " ");
    strcpy(v_tmp_remark_info, " ");
    v_comm_opor=0;
    v_co_no=0;
    v_pd_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_strategy_batch_no=0;
    strcpy(v_strategy_exec_broker, " ");
    v_strategy_exec_kind=0;
    strcpy(v_strategy_exec_comm_str, " ");
    v_stock_acco_no=0;
    strcpy(v_stock_acco, " ");
    v_stock_type=0;
    v_asset_type=0;
    v_stock_code_no=0;
    v_strategy_qty=0;
    v_cash_strategy_qty=0;
    v_strategy_price=0;
    v_price_type=0;
    v_strategy_amt=0;
    v_strategy_valid_type=0;
    strcpy(v_strategy_rule_way, " ");
    strcpy(v_exch_crncy_type, "CNY");
    v_strategy_date=0;
    v_strategy_time=0;
    v_margin_trade_type=0;
    strcpy(v_target_strategy_type, " ");
    strcpy(v_target_strategy_param, " ");
    strcpy(v_strategy_contr_comm, " ");
    v_strategy_deal_kind=0;
    v_order_qty=0;
    v_order_amt=0;
    v_wtdraw_qty=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_external_no=0;
    v_order_batch_no=0;
    v_busi_opor_no=0;
    v_strategy_price_type=0;
    v_comm_batch_no=0;
    v_comm_id=0;
    v_comm_dir=0;
    v_comm_limit_price=0;
    v_comm_qty=0;
    v_comm_executor=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_new_strategy_id=0;
    v_update_times=1;
    v_row_id=0;
    strcpy(v_strategy_sum_status, " ");
    v_valid_order_qty=0;
    v_valid_wtdraw_qty=0;
    v_cancel_qty=0;
    v_faild_qty=0;
    v_comm_date=0;
    v_comm_time=0;
    v_limit_actual_price=0;
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
    v_orig_strategy_id = lpInBizMsg->GetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64);
    v_strategy_id = lpInBizMsg->GetInt64(LDBIZ_STRATEGY_ID_INT64);
    strncpy(v_strategy_deal_status, lpInBizMsg->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR),2);
    v_strategy_deal_status[2] = '\0';
    strncpy(v_strategy_status, lpInBizMsg->GetString(LDBIZ_STRATEGY_STATUS_STR),2);
    v_strategy_status[2] = '\0';
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


    // set @临时_原策略序号# = @原策略序号#;
    v_tmp_orig_strategy_id = v_orig_strategy_id;

    // set @临时_策略序号# = @策略序号#;
    v_tmp_strategy_id = v_strategy_id;

    // set @临时_策略处理状态# = @策略处理状态#;
    strcpy(v_tmp_strategy_deal_status,v_strategy_deal_status);

    // set @临时_策略状态# = @策略状态#;
    strcpy(v_tmp_strategy_status,v_strategy_status);

    // set @临时_备注信息# = @备注信息#;
    strcpy(v_tmp_remark_info,v_remark_info);

    // set @功能编码# = "tdsecuL.11.16";
    strcpy(v_func_code,"tdsecuL.11.16");

    // set @策略序号# = @原策略序号#;
    v_strategy_id = v_orig_strategy_id;
    //调用过程[事务_交易证券_策略_获取策略信息]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.4", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.4]subcall timed out!");
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
    v_comm_opor = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_co_no = lpTSCall1Ans0->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans0->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans0->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans0->GetString(LDBIZ_OUT_ACCO_STR));
    v_strategy_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_BATCH_NO_INT);
    v_orig_strategy_id = lpTSCall1Ans0->GetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64);
    strcpy(v_strategy_exec_broker, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_EXEC_BROKER_STR));
    v_strategy_exec_kind = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT);
    strcpy(v_strategy_exec_comm_str, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR));
    v_exch_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans0->GetString(LDBIZ_STOCK_ACCO_STR));
    v_stock_type = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_stock_code, lpTSCall1Ans0->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_strategy_dir = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_DIR_INT);
    v_strategy_qty = lpTSCall1Ans0->GetDouble(LDBIZ_STRATEGY_QTY_FLOAT);
    v_cash_strategy_qty = lpTSCall1Ans0->GetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT);
    v_strategy_price = lpTSCall1Ans0->GetDouble(LDBIZ_STRATEGY_PRICE_FLOAT);
    v_price_type = lpTSCall1Ans0->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strategy_amt = lpTSCall1Ans0->GetDouble(LDBIZ_STRATEGY_AMT_FLOAT);
    v_strategy_valid_type = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT);
    strcpy(v_strategy_rule_way, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_RULE_WAY_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans0->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    strcpy(v_remark_info, lpTSCall1Ans0->GetString(LDBIZ_REMARK_INFO_STR));
    v_strategy_date = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_DATE_INT);
    v_strategy_time = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_TIME_INT);
    v_margin_trade_type = lpTSCall1Ans0->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
    strcpy(v_target_strategy_type, lpTSCall1Ans0->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR));
    strcpy(v_target_strategy_param, lpTSCall1Ans0->GetString(LDBIZ_TARGET_STRATEGY_PARAM_STR));
    strcpy(v_strategy_contr_comm, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_CONTR_COMM_STR));
    strcpy(v_strategy_status, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_STATUS_STR));
    strcpy(v_strategy_deal_status, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR));
    v_strategy_deal_kind = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
    v_order_qty = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_amt = lpTSCall1Ans0->GetDouble(LDBIZ_ORDER_AMT_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans0->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans0->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_external_no = lpTSCall1Ans0->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strcpy(v_strategy_oper_way, lpTSCall1Ans0->GetString(LDBIZ_STRATEGY_OPER_WAY_STR));
    v_busi_opor_no = lpTSCall1Ans0->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_strategy_price_type = lpTSCall1Ans0->GetInt32(LDBIZ_STRATEGY_PRICE_TYPE_INT);
    v_comm_batch_no = lpTSCall1Ans0->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_id = lpTSCall1Ans0->GetInt64(LDBIZ_COMM_ID_INT64);


    // set @指令方向# = @策略方向#;
    v_comm_dir = v_strategy_dir;

    // set @指令限价# = @策略价格#;
    v_comm_limit_price = v_strategy_price;

    // set @指令数量# = @策略数量#;
    v_comm_qty = v_strategy_qty;

    // set @指令执行人# = 0;
    v_comm_executor = 0;
    //公共子系统检查
    //调用过程[事务_公共_公共接口_检查系统状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.24.1", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.1]subcall timed out!");
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


    // set @原策略序号# = @临时_原策略序号#;
    v_orig_strategy_id = v_tmp_orig_strategy_id;

    // set @策略序号# = @临时_策略序号#;
    v_strategy_id = v_tmp_strategy_id;

    // set @策略处理状态# = @临时_策略处理状态#;
    strcpy(v_strategy_deal_status,v_tmp_strategy_deal_status);

    // set @策略状态# = @临时_策略状态#;
    strcpy(v_strategy_status,v_tmp_strategy_status);

    // set @备注信息# = @临时_备注信息#;
    strcpy(v_remark_info,v_tmp_remark_info);
    //调用过程[事务_交易证券_策略_更新策略状态]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.16", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64,v_orig_strategy_id);
    lpTSCall1Req2->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    lpTSCall1Req2->SetString(LDBIZ_STRATEGY_DEAL_STATUS_STR,v_strategy_deal_status);
    lpTSCall1Req2->SetString(LDBIZ_STRATEGY_STATUS_STR,v_strategy_status);
    lpTSCall1Req2->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.16]subcall timed out!");
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
    v_comm_opor = lpTSCall1Ans2->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans2->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans2->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans2->GetString(LDBIZ_OUT_ACCO_STR));
    v_strategy_batch_no = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_BATCH_NO_INT);
    strcpy(v_strategy_exec_broker, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_EXEC_BROKER_STR));
    v_strategy_exec_kind = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT);
    strcpy(v_strategy_exec_comm_str, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR));
    v_exch_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans2->GetString(LDBIZ_STOCK_ACCO_STR));
    v_stock_type = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_stock_code, lpTSCall1Ans2->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_strategy_dir = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_DIR_INT);
    v_strategy_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRATEGY_QTY_FLOAT);
    v_cash_strategy_qty = lpTSCall1Ans2->GetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT);
    v_strategy_price = lpTSCall1Ans2->GetDouble(LDBIZ_STRATEGY_PRICE_FLOAT);
    v_price_type = lpTSCall1Ans2->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strategy_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STRATEGY_AMT_FLOAT);
    v_strategy_valid_type = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT);
    strcpy(v_strategy_rule_way, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_RULE_WAY_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans2->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_strategy_date = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_DATE_INT);
    v_strategy_time = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_TIME_INT);
    v_margin_trade_type = lpTSCall1Ans2->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
    v_strategy_deal_kind = lpTSCall1Ans2->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
    v_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_amt = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_AMT_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans2->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_external_no = lpTSCall1Ans2->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpTSCall1Ans2->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strcpy(v_strategy_oper_way, lpTSCall1Ans2->GetString(LDBIZ_STRATEGY_OPER_WAY_STR));
    v_busi_opor_no = lpTSCall1Ans2->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_new_strategy_id = lpTSCall1Ans2->GetInt64(LDBIZ_NEW_STRATEGY_ID_INT64);
    v_update_times = lpTSCall1Ans2->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // set @原策略序号# = 0;
    v_orig_strategy_id = 0;

    // set @策略序号# = @临时_原策略序号#;
    v_strategy_id = v_tmp_orig_strategy_id;
    //调用过程[事务_交易证券_策略_获取策略信息]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.4", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.4]subcall timed out!");
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
    v_comm_opor = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_co_no = lpTSCall1Ans3->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans3->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans3->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans3->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans3->GetString(LDBIZ_OUT_ACCO_STR));
    v_strategy_batch_no = lpTSCall1Ans3->GetInt32(LDBIZ_STRATEGY_BATCH_NO_INT);
    v_orig_strategy_id = lpTSCall1Ans3->GetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64);
    strcpy(v_strategy_exec_broker, lpTSCall1Ans3->GetString(LDBIZ_STRATEGY_EXEC_BROKER_STR));
    v_strategy_exec_kind = lpTSCall1Ans3->GetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT);
    strcpy(v_strategy_exec_comm_str, lpTSCall1Ans3->GetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR));
    v_exch_no = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans3->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans3->GetString(LDBIZ_STOCK_ACCO_STR));
    v_stock_type = lpTSCall1Ans3->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans3->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_stock_code, lpTSCall1Ans3->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_code_no = lpTSCall1Ans3->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_strategy_dir = lpTSCall1Ans3->GetInt32(LDBIZ_STRATEGY_DIR_INT);
    v_strategy_qty = lpTSCall1Ans3->GetDouble(LDBIZ_STRATEGY_QTY_FLOAT);
    v_cash_strategy_qty = lpTSCall1Ans3->GetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT);
    v_strategy_price = lpTSCall1Ans3->GetDouble(LDBIZ_STRATEGY_PRICE_FLOAT);
    v_price_type = lpTSCall1Ans3->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strategy_amt = lpTSCall1Ans3->GetDouble(LDBIZ_STRATEGY_AMT_FLOAT);
    v_strategy_valid_type = lpTSCall1Ans3->GetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT);
    strcpy(v_strategy_rule_way, lpTSCall1Ans3->GetString(LDBIZ_STRATEGY_RULE_WAY_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans3->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    strcpy(v_remark_info, lpTSCall1Ans3->GetString(LDBIZ_REMARK_INFO_STR));
    v_strategy_date = lpTSCall1Ans3->GetInt32(LDBIZ_STRATEGY_DATE_INT);
    v_strategy_time = lpTSCall1Ans3->GetInt32(LDBIZ_STRATEGY_TIME_INT);
    v_margin_trade_type = lpTSCall1Ans3->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
    strcpy(v_target_strategy_type, lpTSCall1Ans3->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR));
    strcpy(v_target_strategy_param, lpTSCall1Ans3->GetString(LDBIZ_TARGET_STRATEGY_PARAM_STR));
    strcpy(v_strategy_contr_comm, lpTSCall1Ans3->GetString(LDBIZ_STRATEGY_CONTR_COMM_STR));
    strcpy(v_strategy_status, lpTSCall1Ans3->GetString(LDBIZ_STRATEGY_STATUS_STR));
    strcpy(v_strategy_deal_status, lpTSCall1Ans3->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR));
    v_strategy_deal_kind = lpTSCall1Ans3->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
    v_order_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ORDER_AMT_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans3->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans3->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans3->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_external_no = lpTSCall1Ans3->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpTSCall1Ans3->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strcpy(v_strategy_oper_way, lpTSCall1Ans3->GetString(LDBIZ_STRATEGY_OPER_WAY_STR));
    v_busi_opor_no = lpTSCall1Ans3->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_strategy_price_type = lpTSCall1Ans3->GetInt32(LDBIZ_STRATEGY_PRICE_TYPE_INT);
    v_comm_batch_no = lpTSCall1Ans3->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_id = lpTSCall1Ans3->GetInt64(LDBIZ_COMM_ID_INT64);


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


    // set @操作员机构编号# = @机构编号#;
    v_opor_co_no = v_co_no;
    //调用过程[事务_交易证券_策略_查询单条策略汇总]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.104", 0);
    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req4->SetInt32(LDBIZ_STRATEGY_BATCH_NO_INT,v_strategy_batch_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.104]subcall timed out!");
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
    v_row_id = lpTSCall1Ans4->GetInt64(LDBIZ_ROW_ID_INT64);
    v_busi_opor_no = lpTSCall1Ans4->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_comm_opor = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_co_no = lpTSCall1Ans4->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans4->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans4->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans4->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans4->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_strategy_exec_broker, lpTSCall1Ans4->GetString(LDBIZ_STRATEGY_EXEC_BROKER_STR));
    v_strategy_exec_kind = lpTSCall1Ans4->GetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT);
    strcpy(v_strategy_exec_comm_str, lpTSCall1Ans4->GetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR));
    v_exch_no = lpTSCall1Ans4->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_type = lpTSCall1Ans4->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans4->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_stock_code, lpTSCall1Ans4->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_code_no = lpTSCall1Ans4->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_strategy_dir = lpTSCall1Ans4->GetInt32(LDBIZ_STRATEGY_DIR_INT);
    v_strategy_qty = lpTSCall1Ans4->GetDouble(LDBIZ_STRATEGY_QTY_FLOAT);
    v_cash_strategy_qty = lpTSCall1Ans4->GetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT);
    v_strategy_price = lpTSCall1Ans4->GetDouble(LDBIZ_STRATEGY_PRICE_FLOAT);
    v_price_type = lpTSCall1Ans4->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strategy_amt = lpTSCall1Ans4->GetDouble(LDBIZ_STRATEGY_AMT_FLOAT);
    v_strategy_valid_type = lpTSCall1Ans4->GetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT);
    strcpy(v_strategy_rule_way, lpTSCall1Ans4->GetString(LDBIZ_STRATEGY_RULE_WAY_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans4->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    strcpy(v_remark_info, lpTSCall1Ans4->GetString(LDBIZ_REMARK_INFO_STR));
    v_strategy_date = lpTSCall1Ans4->GetInt32(LDBIZ_STRATEGY_DATE_INT);
    v_margin_trade_type = lpTSCall1Ans4->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
    strcpy(v_target_strategy_type, lpTSCall1Ans4->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR));
    strcpy(v_target_strategy_param, lpTSCall1Ans4->GetString(LDBIZ_TARGET_STRATEGY_PARAM_STR));
    strcpy(v_strategy_contr_comm, lpTSCall1Ans4->GetString(LDBIZ_STRATEGY_CONTR_COMM_STR));
    strcpy(v_strategy_sum_status, lpTSCall1Ans4->GetString(LDBIZ_STRATEGY_SUM_STATUS_STR));
    strcpy(v_strategy_deal_status, lpTSCall1Ans4->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR));
    v_strategy_deal_kind = lpTSCall1Ans4->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
    v_order_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_valid_order_qty = lpTSCall1Ans4->GetDouble(LDBIZ_VALID_ORDER_QTY_FLOAT);
    v_order_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ORDER_AMT_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans4->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_valid_wtdraw_qty = lpTSCall1Ans4->GetDouble(LDBIZ_VALID_WTDRAW_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans4->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans4->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_cancel_qty = lpTSCall1Ans4->GetDouble(LDBIZ_CANCEL_QTY_FLOAT);
    v_faild_qty = lpTSCall1Ans4->GetDouble(LDBIZ_FAILD_QTY_FLOAT);
    v_external_no = lpTSCall1Ans4->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpTSCall1Ans4->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_comm_batch_no = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    strcpy(v_strategy_oper_way, lpTSCall1Ans4->GetString(LDBIZ_STRATEGY_OPER_WAY_STR));
    v_update_times = lpTSCall1Ans4->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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


    // if @指令序号# <> 0 then
    if (v_comm_id != 0)
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

            // set @指令备注信息#= @汇总指令备注信息#;
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
    lpOutBizMsg->SetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64,v_orig_strategy_id);
    lpOutBizMsg->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    lpOutBizMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpOutBizMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpOutBizMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpOutBizMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpOutBizMsg->SetInt32(LDBIZ_STRATEGY_DIR_INT,v_strategy_dir);
    lpOutBizMsg->SetString(LDBIZ_STRATEGY_STATUS_STR,v_strategy_status);
    lpOutBizMsg->SetString(LDBIZ_STRATEGY_OPER_WAY_STR,v_strategy_oper_way);
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

//逻辑_交易证券_策略_查询策略
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
    int v_comm_opor;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int64 v_strategy_id;
    int v_exch_no;
    char v_stock_code[7];
    int v_strategy_dir;
    int v_busi_opor_no;
    int v_margin_trade_type;
    char v_target_strategy_type[17];
    char v_strategy_status[3];
    char v_strategy_deal_status[3];
    int v_strategy_deal_kind;
    int64 v_external_no;
    int v_order_batch_no;
    char v_strategy_oper_way[3];
    int64 v_comm_id;
    int v_comm_batch_no;
    int64 v_row_id;
    int v_row_count;
    int v_sort_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_co_no;
    int v_pass_no;
    char v_out_acco[33];
    int64 v_orig_strategy_id;
    char v_strategy_exec_broker[17];
    int v_strategy_exec_kind;
    char v_strategy_exec_comm_str[2049];
    int v_stock_acco_no;
    char v_stock_acco[17];
    int v_stock_type;
    int v_asset_type;
    int v_stock_code_no;
    double v_strategy_qty;
    double v_cash_strategy_qty;
    double v_strategy_price;
    int v_price_type;
    int v_strategy_valid_type;
    char v_strategy_rule_way[5];
    char v_exch_crncy_type[4];
    char v_remark_info[256];
    int v_strategy_time;
    char v_target_strategy_param[2049];
    char v_strategy_contr_comm[2049];
    double v_strategy_amt;
    double v_order_qty;
    double v_order_amt;
    double v_wtdraw_qty;
    double v_strike_qty;
    double v_strike_amt;
    int v_update_times;
    int v_strategy_batch_no;
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
    v_comm_opor=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_strategy_id=0;
    v_exch_no=0;
    strcpy(v_stock_code, " ");
    v_strategy_dir=0;
    v_busi_opor_no=0;
    v_margin_trade_type=0;
    strcpy(v_target_strategy_type, " ");
    strcpy(v_strategy_status, " ");
    strcpy(v_strategy_deal_status, " ");
    v_strategy_deal_kind=0;
    v_external_no=0;
    v_order_batch_no=0;
    strcpy(v_strategy_oper_way, " ");
    v_comm_id=0;
    v_comm_batch_no=0;
    v_row_id=0;
    v_row_count=-1;
    v_sort_type=1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_co_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_orig_strategy_id=0;
    strcpy(v_strategy_exec_broker, " ");
    v_strategy_exec_kind=0;
    strcpy(v_strategy_exec_comm_str, " ");
    v_stock_acco_no=0;
    strcpy(v_stock_acco, " ");
    v_stock_type=0;
    v_asset_type=0;
    v_stock_code_no=0;
    v_strategy_qty=0;
    v_cash_strategy_qty=0;
    v_strategy_price=0;
    v_price_type=0;
    v_strategy_valid_type=0;
    strcpy(v_strategy_rule_way, " ");
    strcpy(v_exch_crncy_type, "CNY");
    strcpy(v_remark_info, " ");
    v_strategy_time=0;
    strcpy(v_target_strategy_param, " ");
    strcpy(v_strategy_contr_comm, " ");
    v_strategy_amt=0;
    v_order_qty=0;
    v_order_amt=0;
    v_wtdraw_qty=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_update_times=1;
    v_strategy_batch_no=0;
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
    v_comm_opor = lpInBizMsg->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_strategy_id = lpInBizMsg->GetInt64(LDBIZ_STRATEGY_ID_INT64);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    strncpy(v_stock_code, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR),6);
    v_stock_code[6] = '\0';
    v_strategy_dir = lpInBizMsg->GetInt32(LDBIZ_STRATEGY_DIR_INT);
    v_busi_opor_no = lpInBizMsg->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_margin_trade_type = lpInBizMsg->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
    strncpy(v_target_strategy_type, lpInBizMsg->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR),16);
    v_target_strategy_type[16] = '\0';
    strncpy(v_strategy_status, lpInBizMsg->GetString(LDBIZ_STRATEGY_STATUS_STR),2);
    v_strategy_status[2] = '\0';
    strncpy(v_strategy_deal_status, lpInBizMsg->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR),2);
    v_strategy_deal_status[2] = '\0';
    v_strategy_deal_kind = lpInBizMsg->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
    v_external_no = lpInBizMsg->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpInBizMsg->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strncpy(v_strategy_oper_way, lpInBizMsg->GetString(LDBIZ_STRATEGY_OPER_WAY_STR),2);
    v_strategy_oper_way[2] = '\0';
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
    v_comm_batch_no = lpInBizMsg->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
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

    //调用过程[事务_交易证券_策略_查询策略]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.101", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req1->SetInt32(LDBIZ_STRATEGY_DIR_INT,v_strategy_dir);
    lpTSCall1Req1->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
    lpTSCall1Req1->SetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT,v_margin_trade_type);
    lpTSCall1Req1->SetString(LDBIZ_TARGET_STRATEGY_TYPE_STR,v_target_strategy_type);
    lpTSCall1Req1->SetString(LDBIZ_STRATEGY_STATUS_STR,v_strategy_status);
    lpTSCall1Req1->SetString(LDBIZ_STRATEGY_DEAL_STATUS_STR,v_strategy_deal_status);
    lpTSCall1Req1->SetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT,v_strategy_deal_kind);
    lpTSCall1Req1->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpTSCall1Req1->SetString(LDBIZ_STRATEGY_OPER_WAY_STR,v_strategy_oper_way);
    lpTSCall1Req1->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.101]subcall timed out!");
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

//逻辑_交易证券_策略_插件查询策略
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
    int v_comm_opor;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int64 v_strategy_id;
    int v_exch_no;
    char v_stock_code[7];
    int v_strategy_dir;
    int v_busi_opor_no;
    int v_margin_trade_type;
    char v_target_strategy_type[17];
    char v_strategy_status[3];
    char v_strategy_deal_status[3];
    int v_strategy_deal_kind;
    int64 v_external_no;
    int v_order_batch_no;
    char v_strategy_oper_way[3];
    int v_comm_batch_no;
    int64 v_comm_id;
    int64 v_row_id;
    int v_row_count;
    int v_sort_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_co_no;
    int v_pass_no;
    char v_out_acco[33];
    int64 v_orig_strategy_id;
    char v_strategy_exec_broker[17];
    int v_strategy_exec_kind;
    char v_strategy_exec_comm_str[2049];
    int v_stock_acco_no;
    char v_stock_acco[17];
    int v_stock_type;
    int v_asset_type;
    int v_stock_code_no;
    double v_strategy_qty;
    double v_cash_strategy_qty;
    double v_strategy_price;
    int v_price_type;
    int v_strategy_valid_type;
    char v_strategy_rule_way[5];
    char v_exch_crncy_type[4];
    char v_remark_info[256];
    int v_strategy_time;
    char v_target_strategy_param[2049];
    char v_strategy_contr_comm[2049];
    double v_strategy_amt;
    double v_order_qty;
    double v_order_amt;
    double v_wtdraw_qty;
    double v_strike_qty;
    double v_strike_amt;
    int v_strategy_batch_no;
    int v_update_times;
    char v_busi_ctrl_str[65];
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
    v_comm_opor=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_strategy_id=0;
    v_exch_no=0;
    strcpy(v_stock_code, " ");
    v_strategy_dir=0;
    v_busi_opor_no=0;
    v_margin_trade_type=0;
    strcpy(v_target_strategy_type, " ");
    strcpy(v_strategy_status, " ");
    strcpy(v_strategy_deal_status, " ");
    v_strategy_deal_kind=0;
    v_external_no=0;
    v_order_batch_no=0;
    strcpy(v_strategy_oper_way, " ");
    v_comm_batch_no=0;
    v_comm_id=0;
    v_row_id=0;
    v_row_count=-1;
    v_sort_type=1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_co_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_orig_strategy_id=0;
    strcpy(v_strategy_exec_broker, " ");
    v_strategy_exec_kind=0;
    strcpy(v_strategy_exec_comm_str, " ");
    v_stock_acco_no=0;
    strcpy(v_stock_acco, " ");
    v_stock_type=0;
    v_asset_type=0;
    v_stock_code_no=0;
    v_strategy_qty=0;
    v_cash_strategy_qty=0;
    v_strategy_price=0;
    v_price_type=0;
    v_strategy_valid_type=0;
    strcpy(v_strategy_rule_way, " ");
    strcpy(v_exch_crncy_type, "CNY");
    strcpy(v_remark_info, " ");
    v_strategy_time=0;
    strcpy(v_target_strategy_param, " ");
    strcpy(v_strategy_contr_comm, " ");
    v_strategy_amt=0;
    v_order_qty=0;
    v_order_amt=0;
    v_wtdraw_qty=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_strategy_batch_no=0;
    v_update_times=1;
    strcpy(v_busi_ctrl_str, " ");
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
    v_comm_opor = lpInBizMsg->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_strategy_id = lpInBizMsg->GetInt64(LDBIZ_STRATEGY_ID_INT64);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    strncpy(v_stock_code, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR),6);
    v_stock_code[6] = '\0';
    v_strategy_dir = lpInBizMsg->GetInt32(LDBIZ_STRATEGY_DIR_INT);
    v_busi_opor_no = lpInBizMsg->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_margin_trade_type = lpInBizMsg->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
    strncpy(v_target_strategy_type, lpInBizMsg->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR),16);
    v_target_strategy_type[16] = '\0';
    strncpy(v_strategy_status, lpInBizMsg->GetString(LDBIZ_STRATEGY_STATUS_STR),2);
    v_strategy_status[2] = '\0';
    strncpy(v_strategy_deal_status, lpInBizMsg->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR),2);
    v_strategy_deal_status[2] = '\0';
    v_strategy_deal_kind = lpInBizMsg->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
    v_external_no = lpInBizMsg->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpInBizMsg->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strncpy(v_strategy_oper_way, lpInBizMsg->GetString(LDBIZ_STRATEGY_OPER_WAY_STR),2);
    v_strategy_oper_way[2] = '\0';
    v_comm_batch_no = lpInBizMsg->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);
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

    //调用过程[事务_交易证券_策略_插件查询策略]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.102", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req1->SetInt32(LDBIZ_STRATEGY_DIR_INT,v_strategy_dir);
    lpTSCall1Req1->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
    lpTSCall1Req1->SetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT,v_margin_trade_type);
    lpTSCall1Req1->SetString(LDBIZ_TARGET_STRATEGY_TYPE_STR,v_target_strategy_type);
    lpTSCall1Req1->SetString(LDBIZ_STRATEGY_STATUS_STR,v_strategy_status);
    lpTSCall1Req1->SetString(LDBIZ_STRATEGY_DEAL_STATUS_STR,v_strategy_deal_status);
    lpTSCall1Req1->SetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT,v_strategy_deal_kind);
    lpTSCall1Req1->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpTSCall1Req1->SetString(LDBIZ_STRATEGY_OPER_WAY_STR,v_strategy_oper_way);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req1->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetInt32(LDBIZ_SORT_TYPE_INT,v_sort_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.102]subcall timed out!");
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

//逻辑_交易证券_策略_查询策略汇总
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
    int v_comm_opor;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int64 v_strategy_sum_id;
    int v_exch_no;
    char v_stock_code[7];
    int v_strategy_dir;
    int v_busi_opor_no;
    int v_margin_trade_type;
    char v_target_strategy_type[17];
    char v_strategy_status[3];
    char v_strategy_deal_status[3];
    int v_strategy_deal_kind;
    int64 v_external_no;
    int v_order_batch_no;
    int v_comm_batch_no;
    char v_strategy_oper_way[3];
    int64 v_row_id;
    int v_row_count;
    int v_sort_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_co_no;
    int v_pass_no;
    int v_strategy_batch_no;
    char v_strategy_exec_broker[17];
    int v_strategy_exec_kind;
    char v_strategy_exec_comm_str[2049];
    int v_stock_type;
    int v_asset_type;
    int v_stock_code_no;
    double v_strategy_qty;
    double v_cash_strategy_qty;
    double v_strategy_price;
    int v_price_type;
    double v_strategy_amt;
    int v_strategy_valid_type;
    char v_strategy_rule_way[5];
    char v_exch_crncy_type[4];
    char v_remark_info[256];
    int v_strategy_date;
    char v_target_strategy_param[2049];
    char v_strategy_contr_comm[2049];
    char v_strategy_sum_status[3];
    double v_order_qty;
    double v_valid_order_qty;
    double v_order_amt;
    double v_wtdraw_qty;
    double v_valid_wtdraw_qty;
    double v_strike_qty;
    double v_strike_amt;
    double v_cancel_qty;
    double v_faild_qty;
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
    v_comm_opor=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_strategy_sum_id=0;
    v_exch_no=0;
    strcpy(v_stock_code, " ");
    v_strategy_dir=0;
    v_busi_opor_no=0;
    v_margin_trade_type=0;
    strcpy(v_target_strategy_type, " ");
    strcpy(v_strategy_status, " ");
    strcpy(v_strategy_deal_status, " ");
    v_strategy_deal_kind=0;
    v_external_no=0;
    v_order_batch_no=0;
    v_comm_batch_no=0;
    strcpy(v_strategy_oper_way, " ");
    v_row_id=0;
    v_row_count=-1;
    v_sort_type=1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_co_no=0;
    v_pass_no=0;
    v_strategy_batch_no=0;
    strcpy(v_strategy_exec_broker, " ");
    v_strategy_exec_kind=0;
    strcpy(v_strategy_exec_comm_str, " ");
    v_stock_type=0;
    v_asset_type=0;
    v_stock_code_no=0;
    v_strategy_qty=0;
    v_cash_strategy_qty=0;
    v_strategy_price=0;
    v_price_type=0;
    v_strategy_amt=0;
    v_strategy_valid_type=0;
    strcpy(v_strategy_rule_way, " ");
    strcpy(v_exch_crncy_type, "CNY");
    strcpy(v_remark_info, " ");
    v_strategy_date=0;
    strcpy(v_target_strategy_param, " ");
    strcpy(v_strategy_contr_comm, " ");
    strcpy(v_strategy_sum_status, " ");
    v_order_qty=0;
    v_valid_order_qty=0;
    v_order_amt=0;
    v_wtdraw_qty=0;
    v_valid_wtdraw_qty=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_cancel_qty=0;
    v_faild_qty=0;
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
    v_comm_opor = lpInBizMsg->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_strategy_sum_id = lpInBizMsg->GetInt64(LDBIZ_STRATEGY_SUM_ID_INT64);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    strncpy(v_stock_code, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR),6);
    v_stock_code[6] = '\0';
    v_strategy_dir = lpInBizMsg->GetInt32(LDBIZ_STRATEGY_DIR_INT);
    v_busi_opor_no = lpInBizMsg->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_margin_trade_type = lpInBizMsg->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
    strncpy(v_target_strategy_type, lpInBizMsg->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR),16);
    v_target_strategy_type[16] = '\0';
    strncpy(v_strategy_status, lpInBizMsg->GetString(LDBIZ_STRATEGY_STATUS_STR),2);
    v_strategy_status[2] = '\0';
    strncpy(v_strategy_deal_status, lpInBizMsg->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR),2);
    v_strategy_deal_status[2] = '\0';
    v_strategy_deal_kind = lpInBizMsg->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
    v_external_no = lpInBizMsg->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpInBizMsg->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_comm_batch_no = lpInBizMsg->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    strncpy(v_strategy_oper_way, lpInBizMsg->GetString(LDBIZ_STRATEGY_OPER_WAY_STR),2);
    v_strategy_oper_way[2] = '\0';
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

    //调用过程[事务_交易证券_策略_查询策略汇总]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.103", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetInt64(LDBIZ_STRATEGY_SUM_ID_INT64,v_strategy_sum_id);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req1->SetInt32(LDBIZ_STRATEGY_DIR_INT,v_strategy_dir);
    lpTSCall1Req1->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
    lpTSCall1Req1->SetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT,v_margin_trade_type);
    lpTSCall1Req1->SetString(LDBIZ_TARGET_STRATEGY_TYPE_STR,v_target_strategy_type);
    lpTSCall1Req1->SetString(LDBIZ_STRATEGY_STATUS_STR,v_strategy_status);
    lpTSCall1Req1->SetString(LDBIZ_STRATEGY_DEAL_STATUS_STR,v_strategy_deal_status);
    lpTSCall1Req1->SetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT,v_strategy_deal_kind);
    lpTSCall1Req1->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    lpTSCall1Req1->SetString(LDBIZ_STRATEGY_OPER_WAY_STR,v_strategy_oper_way);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.103]subcall timed out!");
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

//逻辑_交易证券_策略_手工撤销策略
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
    int64 v_strategy_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_comm_opor;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    int v_strategy_batch_no;
    int64 v_orig_strategy_id;
    char v_strategy_exec_broker[17];
    int v_strategy_exec_kind;
    char v_strategy_exec_comm_str[2049];
    int v_exch_no;
    int v_stock_acco_no;
    char v_stock_acco[17];
    int v_stock_type;
    int v_asset_type;
    char v_stock_code[7];
    int v_stock_code_no;
    int v_strategy_dir;
    double v_strategy_qty;
    double v_cash_strategy_qty;
    double v_strategy_price;
    int v_price_type;
    double v_strategy_amt;
    int v_strategy_valid_type;
    char v_strategy_rule_way[5];
    char v_exch_crncy_type[4];
    char v_remark_info[256];
    int v_strategy_date;
    int v_strategy_time;
    int v_margin_trade_type;
    char v_target_strategy_type[17];
    char v_target_strategy_param[2049];
    char v_strategy_contr_comm[2049];
    char v_strategy_status[3];
    char v_strategy_deal_status[3];
    int v_strategy_deal_kind;
    double v_order_qty;
    double v_order_amt;
    double v_wtdraw_qty;
    double v_strike_qty;
    double v_strike_amt;
    int64 v_external_no;
    int v_order_batch_no;
    char v_strategy_oper_way[3];
    int v_busi_opor_no;
    int v_strategy_price_type;
    int v_comm_batch_no;
    int64 v_comm_id;
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
    v_strategy_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_comm_opor=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_strategy_batch_no=0;
    v_orig_strategy_id=0;
    strcpy(v_strategy_exec_broker, " ");
    v_strategy_exec_kind=0;
    strcpy(v_strategy_exec_comm_str, " ");
    v_exch_no=0;
    v_stock_acco_no=0;
    strcpy(v_stock_acco, " ");
    v_stock_type=0;
    v_asset_type=0;
    strcpy(v_stock_code, " ");
    v_stock_code_no=0;
    v_strategy_dir=0;
    v_strategy_qty=0;
    v_cash_strategy_qty=0;
    v_strategy_price=0;
    v_price_type=0;
    v_strategy_amt=0;
    v_strategy_valid_type=0;
    strcpy(v_strategy_rule_way, " ");
    strcpy(v_exch_crncy_type, "CNY");
    strcpy(v_remark_info, " ");
    v_strategy_date=0;
    v_strategy_time=0;
    v_margin_trade_type=0;
    strcpy(v_target_strategy_type, " ");
    strcpy(v_target_strategy_param, " ");
    strcpy(v_strategy_contr_comm, " ");
    strcpy(v_strategy_status, " ");
    strcpy(v_strategy_deal_status, " ");
    v_strategy_deal_kind=0;
    v_order_qty=0;
    v_order_amt=0;
    v_wtdraw_qty=0;
    v_strike_qty=0;
    v_strike_amt=0;
    v_external_no=0;
    v_order_batch_no=0;
    strcpy(v_strategy_oper_way, " ");
    v_busi_opor_no=0;
    v_strategy_price_type=0;
    v_comm_batch_no=0;
    v_comm_id=0;
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
    v_strategy_id = lpInBizMsg->GetInt64(LDBIZ_STRATEGY_ID_INT64);

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

    //调用过程[事务_交易证券_策略_获取策略信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.4", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.4]subcall timed out!");
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
    v_comm_opor = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_OPOR_INT);
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpTSCall1Ans1->GetInt32(LDBIZ_PASS_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans1->GetString(LDBIZ_OUT_ACCO_STR));
    v_strategy_batch_no = lpTSCall1Ans1->GetInt32(LDBIZ_STRATEGY_BATCH_NO_INT);
    v_orig_strategy_id = lpTSCall1Ans1->GetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64);
    strcpy(v_strategy_exec_broker, lpTSCall1Ans1->GetString(LDBIZ_STRATEGY_EXEC_BROKER_STR));
    v_strategy_exec_kind = lpTSCall1Ans1->GetInt32(LDBIZ_STRATEGY_EXEC_KIND_INT);
    strcpy(v_strategy_exec_comm_str, lpTSCall1Ans1->GetString(LDBIZ_STRATEGY_EXEC_COMM_STR_STR));
    v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strcpy(v_stock_acco, lpTSCall1Ans1->GetString(LDBIZ_STOCK_ACCO_STR));
    v_stock_type = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_stock_code, lpTSCall1Ans1->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_strategy_dir = lpTSCall1Ans1->GetInt32(LDBIZ_STRATEGY_DIR_INT);
    v_strategy_qty = lpTSCall1Ans1->GetDouble(LDBIZ_STRATEGY_QTY_FLOAT);
    v_cash_strategy_qty = lpTSCall1Ans1->GetDouble(LDBIZ_CASH_STRATEGY_QTY_FLOAT);
    v_strategy_price = lpTSCall1Ans1->GetDouble(LDBIZ_STRATEGY_PRICE_FLOAT);
    v_price_type = lpTSCall1Ans1->GetInt32(LDBIZ_PRICE_TYPE_INT);
    v_strategy_amt = lpTSCall1Ans1->GetDouble(LDBIZ_STRATEGY_AMT_FLOAT);
    v_strategy_valid_type = lpTSCall1Ans1->GetInt32(LDBIZ_STRATEGY_VALID_TYPE_INT);
    strcpy(v_strategy_rule_way, lpTSCall1Ans1->GetString(LDBIZ_STRATEGY_RULE_WAY_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans1->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    strcpy(v_remark_info, lpTSCall1Ans1->GetString(LDBIZ_REMARK_INFO_STR));
    v_strategy_date = lpTSCall1Ans1->GetInt32(LDBIZ_STRATEGY_DATE_INT);
    v_strategy_time = lpTSCall1Ans1->GetInt32(LDBIZ_STRATEGY_TIME_INT);
    v_margin_trade_type = lpTSCall1Ans1->GetInt32(LDBIZ_MARGIN_TRADE_TYPE_INT);
    strcpy(v_target_strategy_type, lpTSCall1Ans1->GetString(LDBIZ_TARGET_STRATEGY_TYPE_STR));
    strcpy(v_target_strategy_param, lpTSCall1Ans1->GetString(LDBIZ_TARGET_STRATEGY_PARAM_STR));
    strcpy(v_strategy_contr_comm, lpTSCall1Ans1->GetString(LDBIZ_STRATEGY_CONTR_COMM_STR));
    strcpy(v_strategy_status, lpTSCall1Ans1->GetString(LDBIZ_STRATEGY_STATUS_STR));
    strcpy(v_strategy_deal_status, lpTSCall1Ans1->GetString(LDBIZ_STRATEGY_DEAL_STATUS_STR));
    v_strategy_deal_kind = lpTSCall1Ans1->GetInt32(LDBIZ_STRATEGY_DEAL_KIND_INT);
    v_order_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_amt = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_AMT_FLOAT);
    v_wtdraw_qty = lpTSCall1Ans1->GetDouble(LDBIZ_WTDRAW_QTY_FLOAT);
    v_strike_qty = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
    v_strike_amt = lpTSCall1Ans1->GetDouble(LDBIZ_STRIKE_AMT_FLOAT);
    v_external_no = lpTSCall1Ans1->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
    v_order_batch_no = lpTSCall1Ans1->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    strcpy(v_strategy_oper_way, lpTSCall1Ans1->GetString(LDBIZ_STRATEGY_OPER_WAY_STR));
    v_busi_opor_no = lpTSCall1Ans1->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_strategy_price_type = lpTSCall1Ans1->GetInt32(LDBIZ_STRATEGY_PRICE_TYPE_INT);
    v_comm_batch_no = lpTSCall1Ans1->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_id = lpTSCall1Ans1->GetInt64(LDBIZ_COMM_ID_INT64);

    //[检查报错返回][@策略状态// = 《策略状态-已完成》][802]["该策略已完成，不能撤销！",@策略序号//,@策略状态//]

    // [主动推送][secu.strategywithdrawbyhand][证券主推_算法交易_手工撤销策略主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.512", 0);
    lpPubMsg->SetInt64(LDBIZ_STRATEGY_ID_INT64,v_strategy_id);
    lpPubMsg->SetInt64(LDBIZ_ORIG_STRATEGY_ID_INT64,v_orig_strategy_id);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetString(LDBIZ_STRATEGY_OPER_WAY_STR,v_strategy_oper_way);
    glpPubSub_Interface->PubTopics("secu.strategywithdrawbyhand", lpPubMsg);


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

//逻辑_交易证券_策略_重置指令策略数量
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
    int v_co_no;
    int64 v_comm_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    char v_exch_crncy_type[4];
    int v_stock_acco_no;
    int v_stock_code_no;
    int v_stock_type;
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
    v_comm_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_exch_crncy_type, "CNY");
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_stock_type=0;
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
    v_comm_id = lpInBizMsg->GetInt64(LDBIZ_COMM_ID_INT64);

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

    //调用过程[事务_交易证券_策略_重置指令策略数量]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdsecuT.11.105", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.11.105]subcall timed out!");
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

