#include <Include/ld_db_interface.h>
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
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.1.1");
        bizFuncInfo->lpFunc = fnFunc0;
    }
    else if (iFunIndex==1)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.1.2");
        bizFuncInfo->lpFunc = fnFunc1;
    }
    else if (iFunIndex==2)
    {
        strcpy(bizFuncInfo->szFuncName, "tdfutuL.1.3");
        bizFuncInfo->lpFunc = fnFunc2;
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

//逻辑_交易期货_公用_更新报盘机状态
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
    int v_pass_no;
    char v_pass_status[3];
    char v_offer_name[33];
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
    v_pass_no=0;
    strcpy(v_pass_status, "0");
    strcpy(v_offer_name, " ");
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
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    strncpy(v_pass_status, lpInBizMsg->GetString(LDBIZ_PASS_STATUS_STR),2);
    v_pass_status[2] = '\0';
    strncpy(v_offer_name, lpInBizMsg->GetString(LDBIZ_OFFER_NAME_STR),32);
    v_offer_name[32] = '\0';

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

    //调用过程[事务_交易期货_公用_更新报盘机状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.1.1", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetString(LDBIZ_PASS_STATUS_STR,v_pass_status);
    lpTSCall1Req1->SetString(LDBIZ_OFFER_NAME_STR,v_offer_name);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.1.1]subcall timed out!");
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

//逻辑_交易期货_公用_获取业务记录编号
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
    int v_record_no_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_curr_no;
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
    v_record_no_type=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_curr_no=0;
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
    v_record_no_type = lpInBizMsg->GetInt32(LDBIZ_RECORD_NO_TYPE_INT);

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

    //调用过程[事务_交易期货_公用_获取业务记录编号]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("tdfutuT.1.2", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_RECORD_NO_TYPE_INT,v_record_no_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.1.2]subcall timed out!");
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
    v_curr_no = lpTSCall1Ans1->GetInt64(LDBIZ_CURR_NO_INT64);


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
    lpOutBizMsg->SetInt64(LDBIZ_CURR_NO_INT64,v_curr_no);
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    return iRet;
}

//逻辑_交易期货_公用_数据归历史
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
    int v_co_no;
    int v_exch_no;
    int v_next_init_date;
    int64 v_row_id;
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
    int64 v_comm_id;
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
    int v_update_times;
    char v_oper_func_code[17];
    int v_pass_no;
    char v_out_acco[33];
    double v_rece_margin;
    int v_order_dir;
    char v_crncy_type[4];
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
    v_co_no=0;
    v_exch_no=0;
    v_next_init_date=0;
    v_row_id=0;
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
    v_comm_id=0;
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
    v_update_times=1;
    strcpy(v_oper_func_code, " ");
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_rece_margin=0;
    v_order_dir=0;
    strcpy(v_crncy_type, "CNY");
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


    // set @机构编号# =@操作员机构编号#;
    v_co_no =v_opor_co_no;

    // set @市场编号# = 11;
    v_exch_no = 11;
    //调用过程[事务_公共_公共接口_获取系统初始化日期和下一初始化日期]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.24.50", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.50]subcall timed out!");
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
    v_next_init_date = lpTSCall1Ans1->GetInt32(LDBIZ_NEXT_INIT_DATE_INT);

    //调用过程[事务_公共_公共接口_开始计划任务]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.151", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_TASK_NO_INT,v_task_no);
    lpTSCall1Req2->SetInt32(LDBIZ_EXEC_COUNT_INT,v_exec_count);
    lpTSCall1Req2->SetInt32(LDBIZ_EXEC_DATE_INT,v_exec_date);
    lpTSCall1Req2->SetInt32(LDBIZ_EXEC_TIME_INT,v_exec_time);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.151]subcall timed out!");
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

    //调用过程[事务_交易期货_公用_数据归历史]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("tdfutuT.1.3", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req3->SetInt32(LDBIZ_NEXT_INIT_DATE_INT,v_next_init_date);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 60000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.1.3]subcall timed out!");
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

    ////重算指令

    // set @记录序号# = 0;
    v_row_id = 0;
    // loop_label:loop
    while (true)
    {

        //调用过程[事务_交易期货_指令_循环锁定获取指令]
        //组织事务请求
        if(lpTSCall1Ans4)
        {
          lpTSCall1Ans4->FreeMsg();
          lpTSCall1Ans4=NULL;
        }
        lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("tdfutuT.3.17", 0);
        lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req4->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
        if(!lpTSCall1Ans4)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.3.17]subcall timed out!");
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
        v_init_date = lpTSCall1Ans4->GetInt32(LDBIZ_INIT_DATE_INT);
        v_co_no = lpTSCall1Ans4->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans4->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans4->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_asset_acco_no = lpTSCall1Ans4->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        strcpy(v_exch_crncy_type, lpTSCall1Ans4->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
        v_exch_no = lpTSCall1Ans4->GetInt32(LDBIZ_EXCH_NO_INT);
        v_futu_acco_no = lpTSCall1Ans4->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
        v_contrc_code_no = lpTSCall1Ans4->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans4->GetString(LDBIZ_CONTRC_CODE_STR));
        v_contrc_type = lpTSCall1Ans4->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_asset_type = lpTSCall1Ans4->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_contrc_dir = lpTSCall1Ans4->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_hedge_type = lpTSCall1Ans4->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_comm_date = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_DATE_INT);
        v_comm_time = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_TIME_INT);
        v_comm_id = lpTSCall1Ans4->GetInt64(LDBIZ_COMM_ID_INT64);
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
        v_capit_reback_days = lpTSCall1Ans4->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
        v_posi_reback_days = lpTSCall1Ans4->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
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
        v_comm_appr_oper_no = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_APPR_OPER_NO_INT);
        v_comm_appr_oper = lpTSCall1Ans4->GetInt32(LDBIZ_COMM_APPR_OPER_INT);
        strcpy(v_comm_appr_remark, lpTSCall1Ans4->GetString(LDBIZ_COMM_APPR_REMARK_STR));
        v_external_no = lpTSCall1Ans4->GetInt64(LDBIZ_EXTERNAL_NO_INT64);
        strcpy(v_comb_code, lpTSCall1Ans4->GetString(LDBIZ_COMB_CODE_STR));
        strcpy(v_comm_oper_way, lpTSCall1Ans4->GetString(LDBIZ_COMM_OPER_WAY_STR));
        strcpy(v_remark_info, lpTSCall1Ans4->GetString(LDBIZ_REMARK_INFO_STR));
        v_update_times = lpTSCall1Ans4->GetInt32(LDBIZ_UPDATE_TIMES_INT);
        strcpy(v_oper_func_code, lpTSCall1Ans4->GetString(LDBIZ_OPER_FUNC_CODE_STR));
        v_pass_no = lpTSCall1Ans4->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_out_acco, lpTSCall1Ans4->GetString(LDBIZ_OUT_ACCO_STR));
        v_rece_margin = lpTSCall1Ans4->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);


        // if @错误编码#="0"  then
        if (strcmp(v_error_code,"0" )==0)
        {

            // set @订单方向# = @指令方向#;
            v_order_dir = v_comm_dir;

            // set @本币币种# = "CNY";
            strcpy(v_crncy_type,"CNY");

             // set @记录序号# = @指令序号#;
             v_row_id = v_comm_id;
            //调用过程[事务_产品期货_交易接口_检查账户状态获取可用]
            //组织事务请求
            if(lpTSCall1Ans5)
            {
              lpTSCall1Ans5->FreeMsg();
              lpTSCall1Ans5=NULL;
            }
            lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pdfutuT.6.1", 0);
            lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req5->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
            lpTSCall1Req5->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpTSCall1Req5->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req5->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
            lpTSCall1Req5->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
            lpTSCall1Req5->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
            lpTSCall1Req5->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
            lpTSCall1Req5->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
            lpTSCall1Req5->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
            lpTSCall1Req5->SetString(LDBIZ_CRNCY_TYPE_STR,v_crncy_type);
            glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
            if(!lpTSCall1Ans5)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.6.1]subcall timed out!");
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
            v_futu_acco_no = lpTSCall1Ans5->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
            strcpy(v_futu_acco, lpTSCall1Ans5->GetString(LDBIZ_FUTU_ACCO_STR));
            v_exgp_avail_amt = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_AVAIL_AMT_FLOAT);
            v_asac_avail_amt = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_AVAIL_AMT_FLOAT);
            v_exgp_avail_qty = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_AVAIL_QTY_FLOAT);
            v_asac_avail_qty = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_AVAIL_QTY_FLOAT);
            v_exgp_long_rece_margin = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_LONG_RECE_MARGIN_FLOAT);
            v_exgp_short_rece_margin = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_SHORT_RECE_MARGIN_FLOAT);
            v_asac_long_rece_margin = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_LONG_RECE_MARGIN_FLOAT);
            v_asac_short_rece_margin = lpTSCall1Ans5->GetDouble(LDBIZ_ASAC_SHORT_RECE_MARGIN_FLOAT);
            v_exgp_long_stock_rece_margin = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_LONG_STOCK_RECE_MARGIN_FLOAT);
            v_exgp_short_stock_rece_margin = lpTSCall1Ans5->GetDouble(LDBIZ_EXGP_SHORT_STOCK_RECE_MARGIN_FLOAT);

            //调用过程[事务_交易期货_公用_指令保证金重算]
            //组织事务请求
            if(lpTSCall1Ans6)
            {
              lpTSCall1Ans6->FreeMsg();
              lpTSCall1Ans6=NULL;
            }
            lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("tdfutuT.1.4", 0);
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
            lpTSCall1Req6->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
            lpTSCall1Req6->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req6->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
            lpTSCall1Req6->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
            lpTSCall1Req6->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
            lpTSCall1Req6->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
            lpTSCall1Req6->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
            lpTSCall1Req6->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
            lpTSCall1Req6->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
            lpTSCall1Req6->SetInt32(LDBIZ_COMM_DATE_INT,v_comm_date);
            lpTSCall1Req6->SetInt32(LDBIZ_COMM_TIME_INT,v_comm_time);
            lpTSCall1Req6->SetInt64(LDBIZ_COMM_ID_INT64,v_comm_id);
            lpTSCall1Req6->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
            lpTSCall1Req6->SetInt32(LDBIZ_COMM_OPOR_INT,v_comm_opor);
            lpTSCall1Req6->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
            lpTSCall1Req6->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
            lpTSCall1Req6->SetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT,v_comm_limit_price);
            lpTSCall1Req6->SetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,v_limit_actual_price);
            lpTSCall1Req6->SetDouble(LDBIZ_COMM_QTY_FLOAT,v_comm_qty);
            lpTSCall1Req6->SetDouble(LDBIZ_COMM_AMT_FLOAT,v_comm_amt);
            lpTSCall1Req6->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
            lpTSCall1Req6->SetDouble(LDBIZ_COMM_CANCEL_QTY_FLOAT,v_comm_cancel_qty);
            lpTSCall1Req6->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
            lpTSCall1Req6->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
            lpTSCall1Req6->SetDouble(LDBIZ_COMM_FROZEN_AMT_FLOAT,v_comm_frozen_amt);
            lpTSCall1Req6->SetDouble(LDBIZ_COMM_FROZEN_QTY_FLOAT,v_comm_frozen_qty);
            lpTSCall1Req6->SetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT,v_capit_reback_days);
            lpTSCall1Req6->SetInt32(LDBIZ_POSI_REBACK_DAYS_INT,v_posi_reback_days);
            lpTSCall1Req6->SetString(LDBIZ_STRIKE_STATUS_STR,v_strike_status);
            lpTSCall1Req6->SetString(LDBIZ_COMM_STATUS_STR,v_comm_status);
            lpTSCall1Req6->SetInt32(LDBIZ_COMM_BEGIN_DATE_INT,v_comm_begin_date);
            lpTSCall1Req6->SetInt32(LDBIZ_COMM_END_DATE_INT,v_comm_end_date);
            lpTSCall1Req6->SetInt32(LDBIZ_COMM_BEGIN_TIME_INT,v_comm_begin_time);
            lpTSCall1Req6->SetInt32(LDBIZ_COMM_END_TIME_INT,v_comm_end_time);
            lpTSCall1Req6->SetInt32(LDBIZ_COMM_COMPLE_DATE_INT,v_comm_comple_date);
            lpTSCall1Req6->SetInt32(LDBIZ_COMM_COMPLE_TIME_INT,v_comm_comple_time);
            lpTSCall1Req6->SetInt32(LDBIZ_COMM_APPR_DATE_INT,v_comm_appr_date);
            lpTSCall1Req6->SetInt32(LDBIZ_COMM_APPR_TIME_INT,v_comm_appr_time);
            lpTSCall1Req6->SetString(LDBIZ_COMM_APPR_STATUS_STR,v_comm_appr_status);
            lpTSCall1Req6->SetInt32(LDBIZ_COMM_APPR_OPER_NO_INT,v_comm_appr_oper_no);
            lpTSCall1Req6->SetInt32(LDBIZ_COMM_APPR_OPER_INT,v_comm_appr_oper);
            lpTSCall1Req6->SetString(LDBIZ_COMM_APPR_REMARK_STR,v_comm_appr_remark);
            lpTSCall1Req6->SetInt64(LDBIZ_EXTERNAL_NO_INT64,v_external_no);
            lpTSCall1Req6->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
            lpTSCall1Req6->SetString(LDBIZ_COMM_OPER_WAY_STR,v_comm_oper_way);
            lpTSCall1Req6->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
            lpTSCall1Req6->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
            lpTSCall1Req6->SetString(LDBIZ_OPER_FUNC_CODE_STR,v_oper_func_code);
            lpTSCall1Req6->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
            lpTSCall1Req6->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
            lpTSCall1Req6->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
            lpTSCall1Req6->SetDouble(LDBIZ_EXGP_AVAIL_AMT_FLOAT,v_exgp_avail_amt);
            lpTSCall1Req6->SetDouble(LDBIZ_ASAC_AVAIL_AMT_FLOAT,v_asac_avail_amt);
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
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdfutuT.1.4]subcall timed out!");
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

        }
        // else
        else
        {


            // set @错误编码#="0";
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
    if(lpTSCall1Ans7)
    {
      lpTSCall1Ans7->FreeMsg();
      lpTSCall1Ans7=NULL;
    }
    lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("pubT.24.152", 0);
    lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req7->SetInt32(LDBIZ_TASK_NO_INT,v_task_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
    if(!lpTSCall1Ans7)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.152]subcall timed out!");
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
    strcpy(v_task_strike_status, lpTSCall1Ans7->GetString(LDBIZ_TASK_STRIKE_STATUS_STR));


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
    return iRet;
}

