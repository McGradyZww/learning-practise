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
        strcpy(bizFuncInfo->szFuncName, "rksecuL.5.16");
        bizFuncInfo->lpFunc = fnFunc0;
    }
    else if (iFunIndex==1)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.5.17");
        bizFuncInfo->lpFunc = fnFunc1;
    }
    else if (iFunIndex==2)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.5.18");
        bizFuncInfo->lpFunc = fnFunc2;
    }
    else if (iFunIndex==3)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.5.19");
        bizFuncInfo->lpFunc = fnFunc3;
    }
    else if (iFunIndex==4)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.5.20");
        bizFuncInfo->lpFunc = fnFunc4;
    }
    else if (iFunIndex==5)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.5.21");
        bizFuncInfo->lpFunc = fnFunc5;
    }
    else if (iFunIndex==6)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.5.22");
        bizFuncInfo->lpFunc = fnFunc6;
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

//逻辑_风控证券_接口_计算更新证券风险监控数据
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
    int64 v_moni_set_id;
    double v_curr_moni_value;
    double v_contrs_curr_moni_value;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_row_id;
    int v_co_no;
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    int v_monitor_ctrl_type;
    int v_moni_value_type;
    int v_monitor_param_value;
    int v_moni_value_flag;
    double v_warn_posi_value;
    double v_appd_value;
    double v_close_posi_value;
    double v_max_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
    char v_moni_set_status[3];
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    char v_remark_info[256];
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
    v_moni_set_id=0;
    v_curr_moni_value=0;
    v_contrs_curr_moni_value=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_row_id=0;
    v_co_no=0;
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    v_monitor_ctrl_type=0;
    v_moni_value_type=0;
    v_monitor_param_value=0;
    v_moni_value_flag=0;
    v_warn_posi_value=0;
    v_appd_value=0;
    v_close_posi_value=0;
    v_max_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
    strcpy(v_moni_set_status, " ");
    v_close_posi_flag=0;
    v_close_ratio_level_one=0;
    v_close_ratio_level_two=0;
    v_close_ratio_level_three=0;
    strcpy(v_remark_info, " ");
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
    v_moni_set_id = lpInBizMsg->GetInt64(LDBIZ_MONI_SET_ID_INT64);
    v_curr_moni_value = lpInBizMsg->GetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT);
    v_contrs_curr_moni_value = lpInBizMsg->GetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);

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

    //调用过程[事务_风控证券_接口_计算更新证券风险监控数据]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.5.16", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    lpTSCall1Req1->SetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT,v_curr_moni_value);
    lpTSCall1Req1->SetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT,v_contrs_curr_moni_value);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.5.16]subcall timed out!");
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

    //调用过程[事务_风控证券_接口_获取单条证券风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.5.18", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.5.18]subcall timed out!");
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
    strcpy(v_pd_no_str, lpTSCall1Ans2->GetString(LDBIZ_PD_NO_STR_STR));
    strcpy(v_exch_group_no_str, lpTSCall1Ans2->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR));
    v_monitor_ctrl_type = lpTSCall1Ans2->GetInt32(LDBIZ_MONITOR_CTRL_TYPE_INT);
    v_moni_value_type = lpTSCall1Ans2->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
    v_monitor_param_value = lpTSCall1Ans2->GetInt32(LDBIZ_MONITOR_PARAM_VALUE_INT);
    v_moni_value_flag = lpTSCall1Ans2->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
    v_warn_posi_value = lpTSCall1Ans2->GetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT);
    v_appd_value = lpTSCall1Ans2->GetDouble(LDBIZ_APPD_VALUE_FLOAT);
    v_close_posi_value = lpTSCall1Ans2->GetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT);
    v_max_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT);
    v_curr_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT);
    v_curr_result_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
    strcpy(v_contrs_stock_code, lpTSCall1Ans2->GetString(LDBIZ_CONTRS_STOCK_CODE_STR));
    v_contrs_exch_no = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRS_EXCH_NO_INT);
    v_contrs_max_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
    v_contrs_curr_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
    v_contrs_result_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
    v_moni_result_value = lpTSCall1Ans2->GetDouble(LDBIZ_MONI_RESULT_VALUE_FLOAT);
    strcpy(v_moni_result_status, lpTSCall1Ans2->GetString(LDBIZ_MONI_RESULT_STATUS_STR));
    strcpy(v_moni_set_status, lpTSCall1Ans2->GetString(LDBIZ_MONI_SET_STATUS_STR));
    v_close_posi_flag = lpTSCall1Ans2->GetInt32(LDBIZ_CLOSE_POSI_FLAG_INT);
    v_close_ratio_level_one = lpTSCall1Ans2->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
    v_close_ratio_level_two = lpTSCall1Ans2->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
    v_close_ratio_level_three = lpTSCall1Ans2->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
    strcpy(v_remark_info, lpTSCall1Ans2->GetString(LDBIZ_REMARK_INFO_STR));
    v_update_times = lpTSCall1Ans2->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // [主动推送][risk.riskmonitorupdate][风控主推_规则_证券监控更新主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.151", 0);
    lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpPubMsg->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpPubMsg->SetString(LDBIZ_EXCH_GROUP_NO_STR_STR,v_exch_group_no_str);
    lpPubMsg->SetInt32(LDBIZ_MONITOR_CTRL_TYPE_INT,v_monitor_ctrl_type);
    lpPubMsg->SetInt32(LDBIZ_MONI_VALUE_TYPE_INT,v_moni_value_type);
    lpPubMsg->SetInt32(LDBIZ_MONITOR_PARAM_VALUE_INT,v_monitor_param_value);
    lpPubMsg->SetInt32(LDBIZ_MONI_VALUE_FLAG_INT,v_moni_value_flag);
    lpPubMsg->SetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT,v_warn_posi_value);
    lpPubMsg->SetDouble(LDBIZ_APPD_VALUE_FLOAT,v_appd_value);
    lpPubMsg->SetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT,v_close_posi_value);
    lpPubMsg->SetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT,v_max_moni_value);
    lpPubMsg->SetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT,v_curr_moni_value);
    lpPubMsg->SetDouble(LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT,v_curr_result_moni_value);
    lpPubMsg->SetString(LDBIZ_CONTRS_STOCK_CODE_STR,v_contrs_stock_code);
    lpPubMsg->SetInt32(LDBIZ_CONTRS_EXCH_NO_INT,v_contrs_exch_no);
    lpPubMsg->SetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT,v_contrs_max_moni_value);
    lpPubMsg->SetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT,v_contrs_curr_moni_value);
    lpPubMsg->SetDouble(LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT,v_contrs_result_moni_value);
    lpPubMsg->SetDouble(LDBIZ_MONI_RESULT_VALUE_FLOAT,v_moni_result_value);
    lpPubMsg->SetString(LDBIZ_MONI_RESULT_STATUS_STR,v_moni_result_status);
    lpPubMsg->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    lpPubMsg->SetInt32(LDBIZ_CLOSE_POSI_FLAG_INT,v_close_posi_flag);
    lpPubMsg->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT,v_close_ratio_level_one);
    lpPubMsg->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT,v_close_ratio_level_two);
    lpPubMsg->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT,v_close_ratio_level_three);
    lpPubMsg->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("risk.riskmonitorupdate", lpPubMsg);


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

//逻辑_风控证券_接口_计算更新账户风险监控数据
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
    int64 v_moni_set_id;
    double v_curr_moni_value;
    double v_cash_asset;
    double v_fund_asset;
    double v_bond_asset;
    double v_stock_asset;
    double v_repo_asset;
    double v_nav_asset;
    double v_contrs_curr_moni_value;
    double v_pd_share;
    double v_begin_asset_value;
    double v_hk_thrgh_stock_asset;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_row_id;
    int v_co_no;
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    int v_moni_role_type;
    int v_moni_value_flag;
    int v_moni_value_type;
    double v_warn_posi_value;
    int v_warn_trig_oper_type;
    double v_close_posi_value;
    int v_close_trig_oper_type;
    double v_appd_value;
    int v_appd_trig_oper_type;
    int v_begin_moni_date;
    double v_begin_moni_value;
    double v_max_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
    char v_moni_set_status[3];
    double v_stock_asset_ratio;
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    char v_remark_info[256];
    int v_time_stamp;
    int v_update_times;
    int v_push_type;
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
    v_moni_set_id=0;
    v_curr_moni_value=0;
    v_cash_asset=0;
    v_fund_asset=0;
    v_bond_asset=0;
    v_stock_asset=0;
    v_repo_asset=0;
    v_nav_asset=0;
    v_contrs_curr_moni_value=0;
    v_pd_share=0;
    v_begin_asset_value=0;
    v_hk_thrgh_stock_asset=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_row_id=0;
    v_co_no=0;
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    v_moni_role_type=0;
    v_moni_value_flag=0;
    v_moni_value_type=0;
    v_warn_posi_value=0;
    v_warn_trig_oper_type=0;
    v_close_posi_value=0;
    v_close_trig_oper_type=0;
    v_appd_value=0;
    v_appd_trig_oper_type=0;
    v_begin_moni_date=0;
    v_begin_moni_value=0;
    v_max_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
    strcpy(v_moni_set_status, " ");
    v_stock_asset_ratio=0;
    v_close_posi_flag=0;
    v_close_ratio_level_one=0;
    v_close_ratio_level_two=0;
    v_close_ratio_level_three=0;
    strcpy(v_remark_info, " ");
    v_time_stamp=0;
    v_update_times=1;
    v_push_type=0;
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
    v_moni_set_id = lpInBizMsg->GetInt64(LDBIZ_MONI_SET_ID_INT64);
    v_curr_moni_value = lpInBizMsg->GetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT);
    v_cash_asset = lpInBizMsg->GetDouble(LDBIZ_CASH_ASSET_FLOAT);
    v_fund_asset = lpInBizMsg->GetDouble(LDBIZ_FUND_ASSET_FLOAT);
    v_bond_asset = lpInBizMsg->GetDouble(LDBIZ_BOND_ASSET_FLOAT);
    v_stock_asset = lpInBizMsg->GetDouble(LDBIZ_STOCK_ASSET_FLOAT);
    v_repo_asset = lpInBizMsg->GetDouble(LDBIZ_REPO_ASSET_FLOAT);
    v_nav_asset = lpInBizMsg->GetDouble(LDBIZ_NAV_ASSET_FLOAT);
    v_contrs_curr_moni_value = lpInBizMsg->GetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
    v_pd_share = lpInBizMsg->GetDouble(LDBIZ_PD_SHARE_FLOAT);
    v_begin_asset_value = lpInBizMsg->GetDouble(LDBIZ_BEGIN_ASSET_VALUE_FLOAT);
    v_hk_thrgh_stock_asset = lpInBizMsg->GetDouble(LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);

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

    //调用过程[事务_风控证券_接口_更新账户风险监控设置计算值]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.5.11", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    lpTSCall1Req1->SetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT,v_curr_moni_value);
    lpTSCall1Req1->SetDouble(LDBIZ_CASH_ASSET_FLOAT,v_cash_asset);
    lpTSCall1Req1->SetDouble(LDBIZ_FUND_ASSET_FLOAT,v_fund_asset);
    lpTSCall1Req1->SetDouble(LDBIZ_BOND_ASSET_FLOAT,v_bond_asset);
    lpTSCall1Req1->SetDouble(LDBIZ_STOCK_ASSET_FLOAT,v_stock_asset);
    lpTSCall1Req1->SetDouble(LDBIZ_REPO_ASSET_FLOAT,v_repo_asset);
    lpTSCall1Req1->SetDouble(LDBIZ_NAV_ASSET_FLOAT,v_nav_asset);
    lpTSCall1Req1->SetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT,v_contrs_curr_moni_value);
    lpTSCall1Req1->SetDouble(LDBIZ_PD_SHARE_FLOAT,v_pd_share);
    lpTSCall1Req1->SetDouble(LDBIZ_BEGIN_ASSET_VALUE_FLOAT,v_begin_asset_value);
    lpTSCall1Req1->SetDouble(LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT,v_hk_thrgh_stock_asset);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.5.11]subcall timed out!");
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

    //调用过程[事务_风控证券_接口_获取单条账户风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.5.19", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.5.19]subcall timed out!");
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
    strcpy(v_pd_no_str, lpTSCall1Ans2->GetString(LDBIZ_PD_NO_STR_STR));
    strcpy(v_exch_group_no_str, lpTSCall1Ans2->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR));
    v_moni_role_type = lpTSCall1Ans2->GetInt32(LDBIZ_MONI_ROLE_TYPE_INT);
    v_moni_value_flag = lpTSCall1Ans2->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
    v_moni_value_type = lpTSCall1Ans2->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
    v_warn_posi_value = lpTSCall1Ans2->GetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT);
    v_warn_trig_oper_type = lpTSCall1Ans2->GetInt32(LDBIZ_WARN_TRIG_OPER_TYPE_INT);
    v_close_posi_value = lpTSCall1Ans2->GetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT);
    v_close_trig_oper_type = lpTSCall1Ans2->GetInt32(LDBIZ_CLOSE_TRIG_OPER_TYPE_INT);
    v_appd_value = lpTSCall1Ans2->GetDouble(LDBIZ_APPD_VALUE_FLOAT);
    v_appd_trig_oper_type = lpTSCall1Ans2->GetInt32(LDBIZ_APPD_TRIG_OPER_TYPE_INT);
    v_begin_moni_date = lpTSCall1Ans2->GetInt32(LDBIZ_BEGIN_MONI_DATE_INT);
    v_begin_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_BEGIN_MONI_VALUE_FLOAT);
    v_max_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT);
    v_curr_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT);
    v_curr_result_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
    strcpy(v_contrs_stock_code, lpTSCall1Ans2->GetString(LDBIZ_CONTRS_STOCK_CODE_STR));
    v_contrs_exch_no = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRS_EXCH_NO_INT);
    v_contrs_max_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
    v_contrs_curr_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
    v_contrs_result_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
    v_moni_result_value = lpTSCall1Ans2->GetDouble(LDBIZ_MONI_RESULT_VALUE_FLOAT);
    strcpy(v_moni_result_status, lpTSCall1Ans2->GetString(LDBIZ_MONI_RESULT_STATUS_STR));
    strcpy(v_moni_set_status, lpTSCall1Ans2->GetString(LDBIZ_MONI_SET_STATUS_STR));
    v_cash_asset = lpTSCall1Ans2->GetDouble(LDBIZ_CASH_ASSET_FLOAT);
    v_fund_asset = lpTSCall1Ans2->GetDouble(LDBIZ_FUND_ASSET_FLOAT);
    v_bond_asset = lpTSCall1Ans2->GetDouble(LDBIZ_BOND_ASSET_FLOAT);
    v_stock_asset = lpTSCall1Ans2->GetDouble(LDBIZ_STOCK_ASSET_FLOAT);
    v_repo_asset = lpTSCall1Ans2->GetDouble(LDBIZ_REPO_ASSET_FLOAT);
    v_nav_asset = lpTSCall1Ans2->GetDouble(LDBIZ_NAV_ASSET_FLOAT);
    v_stock_asset_ratio = lpTSCall1Ans2->GetDouble(LDBIZ_STOCK_ASSET_RATIO_FLOAT);
    v_close_posi_flag = lpTSCall1Ans2->GetInt32(LDBIZ_CLOSE_POSI_FLAG_INT);
    v_close_ratio_level_one = lpTSCall1Ans2->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
    v_close_ratio_level_two = lpTSCall1Ans2->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
    v_close_ratio_level_three = lpTSCall1Ans2->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
    strcpy(v_remark_info, lpTSCall1Ans2->GetString(LDBIZ_REMARK_INFO_STR));
    v_time_stamp = lpTSCall1Ans2->GetInt32(LDBIZ_TIME_STAMP_INT);
    v_update_times = lpTSCall1Ans2->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // set @主推类型# = 1;
    v_push_type = 1;

    // [主动推送][risk.monitor][风控主推_规则_客户监控主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.150", 0);
    lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpPubMsg->SetString(LDBIZ_EXCH_GROUP_NO_STR_STR,v_exch_group_no_str);
    lpPubMsg->SetInt32(LDBIZ_MONI_ROLE_TYPE_INT,v_moni_role_type);
    lpPubMsg->SetInt32(LDBIZ_MONI_VALUE_FLAG_INT,v_moni_value_flag);
    lpPubMsg->SetInt32(LDBIZ_MONI_VALUE_TYPE_INT,v_moni_value_type);
    lpPubMsg->SetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT,v_warn_posi_value);
    lpPubMsg->SetInt32(LDBIZ_WARN_TRIG_OPER_TYPE_INT,v_warn_trig_oper_type);
    lpPubMsg->SetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT,v_close_posi_value);
    lpPubMsg->SetInt32(LDBIZ_CLOSE_TRIG_OPER_TYPE_INT,v_close_trig_oper_type);
    lpPubMsg->SetDouble(LDBIZ_APPD_VALUE_FLOAT,v_appd_value);
    lpPubMsg->SetInt32(LDBIZ_APPD_TRIG_OPER_TYPE_INT,v_appd_trig_oper_type);
    lpPubMsg->SetInt32(LDBIZ_BEGIN_MONI_DATE_INT,v_begin_moni_date);
    lpPubMsg->SetDouble(LDBIZ_BEGIN_MONI_VALUE_FLOAT,v_begin_moni_value);
    lpPubMsg->SetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT,v_max_moni_value);
    lpPubMsg->SetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT,v_curr_moni_value);
    lpPubMsg->SetDouble(LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT,v_curr_result_moni_value);
    lpPubMsg->SetString(LDBIZ_CONTRS_STOCK_CODE_STR,v_contrs_stock_code);
    lpPubMsg->SetInt32(LDBIZ_CONTRS_EXCH_NO_INT,v_contrs_exch_no);
    lpPubMsg->SetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT,v_contrs_max_moni_value);
    lpPubMsg->SetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT,v_contrs_curr_moni_value);
    lpPubMsg->SetDouble(LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT,v_contrs_result_moni_value);
    lpPubMsg->SetDouble(LDBIZ_MONI_RESULT_VALUE_FLOAT,v_moni_result_value);
    lpPubMsg->SetString(LDBIZ_MONI_RESULT_STATUS_STR,v_moni_result_status);
    lpPubMsg->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    lpPubMsg->SetDouble(LDBIZ_CASH_ASSET_FLOAT,v_cash_asset);
    lpPubMsg->SetDouble(LDBIZ_FUND_ASSET_FLOAT,v_fund_asset);
    lpPubMsg->SetDouble(LDBIZ_BOND_ASSET_FLOAT,v_bond_asset);
    lpPubMsg->SetDouble(LDBIZ_STOCK_ASSET_FLOAT,v_stock_asset);
    lpPubMsg->SetDouble(LDBIZ_REPO_ASSET_FLOAT,v_repo_asset);
    lpPubMsg->SetDouble(LDBIZ_NAV_ASSET_FLOAT,v_nav_asset);
    lpPubMsg->SetDouble(LDBIZ_STOCK_ASSET_RATIO_FLOAT,v_stock_asset_ratio);
    lpPubMsg->SetInt32(LDBIZ_CLOSE_POSI_FLAG_INT,v_close_posi_flag);
    lpPubMsg->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT,v_close_ratio_level_one);
    lpPubMsg->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT,v_close_ratio_level_two);
    lpPubMsg->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT,v_close_ratio_level_three);
    lpPubMsg->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    lpPubMsg->SetInt32(LDBIZ_TIME_STAMP_INT,v_time_stamp);
    lpPubMsg->SetInt32(LDBIZ_PUSH_TYPE_INT,v_push_type);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("risk.monitor", lpPubMsg);


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

//逻辑_风控证券_接口_计算t0操作员阀值
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
    int64 v_detail_posi_id;
    int v_target_opor_no;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_asset_acco_no;
    int v_exch_no;
    char v_stock_code[7];
    int v_stock_acco_no;
    int v_stock_code_no;
    int v_lngsht_type;
    double v_curr_qty;
    int v_open_posi_date;
    int v_open_posi_time;
    double v_open_posi_price;
    double v_open_posi_value;
    double v_open_posi_fee;
    double v_close_posi_qty;
    double v_close_posi_market_value;
    double v_close_posi_fee;
    double v_realize_pandl;
    double v_pandl_ratio;
    double v_un_close_posi_qty;
    double v_un_close_marke_value;
    double v_last_price;
    double v_up_limit_price;
    double v_down_limit_price;
    double v_cost_price;
    double v_last_tshold_value;
    double v_float_pandl;
    char v_posi_status[3];
    char v_moni_result_status[3];
    char v_posi_limit_status[3];
    double v_opor_warn_tshold;
    double v_opor_stop_tshold;
    double v_stock_warn_ratio;
    double v_stock_stop_ratio;
    double v_stock_warn_amt;
    double v_stock_stop_amt;
    int v_open_close_permission;
    int v_posi_limit_time;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_row_id;
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
    v_detail_posi_id=0;
    v_target_opor_no=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    strcpy(v_stock_code, " ");
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_lngsht_type=0;
    v_curr_qty=0;
    v_open_posi_date=0;
    v_open_posi_time=0;
    v_open_posi_price=0;
    v_open_posi_value=0;
    v_open_posi_fee=0;
    v_close_posi_qty=0;
    v_close_posi_market_value=0;
    v_close_posi_fee=0;
    v_realize_pandl=0;
    v_pandl_ratio=0;
    v_un_close_posi_qty=0;
    v_un_close_marke_value=0;
    v_last_price=0;
    v_up_limit_price=0;
    v_down_limit_price=0;
    v_cost_price=0;
    v_last_tshold_value=0;
    v_float_pandl=0;
    strcpy(v_posi_status, "0");
    strcpy(v_moni_result_status, " ");
    strcpy(v_posi_limit_status, " ");
    v_opor_warn_tshold=0;
    v_opor_stop_tshold=0;
    v_stock_warn_ratio=0;
    v_stock_stop_ratio=0;
    v_stock_warn_amt=0;
    v_stock_stop_amt=0;
    v_open_close_permission=0;
    v_posi_limit_time=5;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_row_id=0;
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
    v_detail_posi_id = lpInBizMsg->GetInt64(LDBIZ_DETAIL_POSI_ID_INT64);
    v_target_opor_no = lpInBizMsg->GetInt32(LDBIZ_TARGET_OPOR_NO_INT);
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    strncpy(v_stock_code, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR),6);
    v_stock_code[6] = '\0';
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_lngsht_type = lpInBizMsg->GetInt32(LDBIZ_LNGSHT_TYPE_INT);
    v_curr_qty = lpInBizMsg->GetDouble(LDBIZ_CURR_QTY_FLOAT);
    v_open_posi_date = lpInBizMsg->GetInt32(LDBIZ_OPEN_POSI_DATE_INT);
    v_open_posi_time = lpInBizMsg->GetInt32(LDBIZ_OPEN_POSI_TIME_INT);
    v_open_posi_price = lpInBizMsg->GetDouble(LDBIZ_OPEN_POSI_PRICE_FLOAT);
    v_open_posi_value = lpInBizMsg->GetDouble(LDBIZ_OPEN_POSI_VALUE_FLOAT);
    v_open_posi_fee = lpInBizMsg->GetDouble(LDBIZ_OPEN_POSI_FEE_FLOAT);
    v_close_posi_qty = lpInBizMsg->GetDouble(LDBIZ_CLOSE_POSI_QTY_FLOAT);
    v_close_posi_market_value = lpInBizMsg->GetDouble(LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
    v_close_posi_fee = lpInBizMsg->GetDouble(LDBIZ_CLOSE_POSI_FEE_FLOAT);
    v_realize_pandl = lpInBizMsg->GetDouble(LDBIZ_REALIZE_PANDL_FLOAT);
    v_pandl_ratio = lpInBizMsg->GetDouble(LDBIZ_PANDL_RATIO_FLOAT);
    v_un_close_posi_qty = lpInBizMsg->GetDouble(LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
    v_un_close_marke_value = lpInBizMsg->GetDouble(LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
    v_last_price = lpInBizMsg->GetDouble(LDBIZ_LAST_PRICE_FLOAT);
    v_up_limit_price = lpInBizMsg->GetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT);
    v_down_limit_price = lpInBizMsg->GetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
    v_cost_price = lpInBizMsg->GetDouble(LDBIZ_COST_PRICE_FLOAT);
    v_last_tshold_value = lpInBizMsg->GetDouble(LDBIZ_LAST_TSHOLD_VALUE_FLOAT);
    v_float_pandl = lpInBizMsg->GetDouble(LDBIZ_FLOAT_PANDL_FLOAT);
    strncpy(v_posi_status, lpInBizMsg->GetString(LDBIZ_POSI_STATUS_STR),2);
    v_posi_status[2] = '\0';
    strncpy(v_moni_result_status, lpInBizMsg->GetString(LDBIZ_MONI_RESULT_STATUS_STR),2);
    v_moni_result_status[2] = '\0';
    strncpy(v_posi_limit_status, lpInBizMsg->GetString(LDBIZ_POSI_LIMIT_STATUS_STR),2);
    v_posi_limit_status[2] = '\0';
    v_opor_warn_tshold = lpInBizMsg->GetDouble(LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
    v_opor_stop_tshold = lpInBizMsg->GetDouble(LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
    v_stock_warn_ratio = lpInBizMsg->GetDouble(LDBIZ_STOCK_WARN_RATIO_FLOAT);
    v_stock_stop_ratio = lpInBizMsg->GetDouble(LDBIZ_STOCK_STOP_RATIO_FLOAT);
    v_stock_warn_amt = lpInBizMsg->GetDouble(LDBIZ_STOCK_WARN_AMT_FLOAT);
    v_stock_stop_amt = lpInBizMsg->GetDouble(LDBIZ_STOCK_STOP_AMT_FLOAT);
    v_open_close_permission = lpInBizMsg->GetInt32(LDBIZ_OPEN_CLOSE_PERMISSION_INT);
    v_posi_limit_time = lpInBizMsg->GetInt32(LDBIZ_POSI_LIMIT_TIME_INT);

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


    // set @操作员编号# = @目标操作员编号#;
    v_opor_no = v_target_opor_no;
    //调用过程[事务_风控证券_风控_T0操作员阈值信息更新]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.26", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt64(LDBIZ_DETAIL_POSI_ID_INT64,v_detail_posi_id);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req1->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpTSCall1Req1->SetDouble(LDBIZ_CURR_QTY_FLOAT,v_curr_qty);
    lpTSCall1Req1->SetInt32(LDBIZ_OPEN_POSI_DATE_INT,v_open_posi_date);
    lpTSCall1Req1->SetInt32(LDBIZ_OPEN_POSI_TIME_INT,v_open_posi_time);
    lpTSCall1Req1->SetDouble(LDBIZ_OPEN_POSI_PRICE_FLOAT,v_open_posi_price);
    lpTSCall1Req1->SetDouble(LDBIZ_OPEN_POSI_VALUE_FLOAT,v_open_posi_value);
    lpTSCall1Req1->SetDouble(LDBIZ_OPEN_POSI_FEE_FLOAT,v_open_posi_fee);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_POSI_QTY_FLOAT,v_close_posi_qty);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT,v_close_posi_market_value);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_POSI_FEE_FLOAT,v_close_posi_fee);
    lpTSCall1Req1->SetDouble(LDBIZ_REALIZE_PANDL_FLOAT,v_realize_pandl);
    lpTSCall1Req1->SetDouble(LDBIZ_PANDL_RATIO_FLOAT,v_pandl_ratio);
    lpTSCall1Req1->SetDouble(LDBIZ_UN_CLOSE_POSI_QTY_FLOAT,v_un_close_posi_qty);
    lpTSCall1Req1->SetDouble(LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT,v_un_close_marke_value);
    lpTSCall1Req1->SetDouble(LDBIZ_LAST_PRICE_FLOAT,v_last_price);
    lpTSCall1Req1->SetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT,v_up_limit_price);
    lpTSCall1Req1->SetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT,v_down_limit_price);
    lpTSCall1Req1->SetDouble(LDBIZ_COST_PRICE_FLOAT,v_cost_price);
    lpTSCall1Req1->SetDouble(LDBIZ_LAST_TSHOLD_VALUE_FLOAT,v_last_tshold_value);
    lpTSCall1Req1->SetDouble(LDBIZ_FLOAT_PANDL_FLOAT,v_float_pandl);
    lpTSCall1Req1->SetString(LDBIZ_POSI_STATUS_STR,v_posi_status);
    lpTSCall1Req1->SetString(LDBIZ_MONI_RESULT_STATUS_STR,v_moni_result_status);
    lpTSCall1Req1->SetString(LDBIZ_POSI_LIMIT_STATUS_STR,v_posi_limit_status);
    lpTSCall1Req1->SetDouble(LDBIZ_OPOR_WARN_TSHOLD_FLOAT,v_opor_warn_tshold);
    lpTSCall1Req1->SetDouble(LDBIZ_OPOR_STOP_TSHOLD_FLOAT,v_opor_stop_tshold);
    lpTSCall1Req1->SetDouble(LDBIZ_STOCK_WARN_RATIO_FLOAT,v_stock_warn_ratio);
    lpTSCall1Req1->SetDouble(LDBIZ_STOCK_STOP_RATIO_FLOAT,v_stock_stop_ratio);
    lpTSCall1Req1->SetDouble(LDBIZ_STOCK_WARN_AMT_FLOAT,v_stock_warn_amt);
    lpTSCall1Req1->SetDouble(LDBIZ_STOCK_STOP_AMT_FLOAT,v_stock_stop_amt);
    lpTSCall1Req1->SetInt32(LDBIZ_OPEN_CLOSE_PERMISSION_INT,v_open_close_permission);
    lpTSCall1Req1->SetInt32(LDBIZ_POSI_LIMIT_TIME_INT,v_posi_limit_time);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.26]subcall timed out!");
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

    //调用过程[事务_风控证券_接口_获取单条T0操作员阈值]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.5.20", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.5.20]subcall timed out!");
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
    v_detail_posi_id = lpTSCall1Ans2->GetInt64(LDBIZ_DETAIL_POSI_ID_INT64);
    v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans2->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_NO_INT);
    strcpy(v_stock_code, lpTSCall1Ans2->GetString(LDBIZ_STOCK_CODE_STR));
    v_stock_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_lngsht_type = lpTSCall1Ans2->GetInt32(LDBIZ_LNGSHT_TYPE_INT);
    v_curr_qty = lpTSCall1Ans2->GetDouble(LDBIZ_CURR_QTY_FLOAT);
    v_open_posi_date = lpTSCall1Ans2->GetInt32(LDBIZ_OPEN_POSI_DATE_INT);
    v_open_posi_time = lpTSCall1Ans2->GetInt32(LDBIZ_OPEN_POSI_TIME_INT);
    v_open_posi_price = lpTSCall1Ans2->GetDouble(LDBIZ_OPEN_POSI_PRICE_FLOAT);
    v_open_posi_value = lpTSCall1Ans2->GetDouble(LDBIZ_OPEN_POSI_VALUE_FLOAT);
    v_open_posi_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OPEN_POSI_FEE_FLOAT);
    v_close_posi_qty = lpTSCall1Ans2->GetDouble(LDBIZ_CLOSE_POSI_QTY_FLOAT);
    v_close_posi_market_value = lpTSCall1Ans2->GetDouble(LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
    v_close_posi_fee = lpTSCall1Ans2->GetDouble(LDBIZ_CLOSE_POSI_FEE_FLOAT);
    v_realize_pandl = lpTSCall1Ans2->GetDouble(LDBIZ_REALIZE_PANDL_FLOAT);
    v_pandl_ratio = lpTSCall1Ans2->GetDouble(LDBIZ_PANDL_RATIO_FLOAT);
    v_un_close_posi_qty = lpTSCall1Ans2->GetDouble(LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
    v_un_close_marke_value = lpTSCall1Ans2->GetDouble(LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
    v_last_price = lpTSCall1Ans2->GetDouble(LDBIZ_LAST_PRICE_FLOAT);
    v_up_limit_price = lpTSCall1Ans2->GetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT);
    v_down_limit_price = lpTSCall1Ans2->GetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
    v_cost_price = lpTSCall1Ans2->GetDouble(LDBIZ_COST_PRICE_FLOAT);
    v_last_tshold_value = lpTSCall1Ans2->GetDouble(LDBIZ_LAST_TSHOLD_VALUE_FLOAT);
    v_float_pandl = lpTSCall1Ans2->GetDouble(LDBIZ_FLOAT_PANDL_FLOAT);
    strcpy(v_posi_status, lpTSCall1Ans2->GetString(LDBIZ_POSI_STATUS_STR));
    strcpy(v_moni_result_status, lpTSCall1Ans2->GetString(LDBIZ_MONI_RESULT_STATUS_STR));
    strcpy(v_posi_limit_status, lpTSCall1Ans2->GetString(LDBIZ_POSI_LIMIT_STATUS_STR));
    v_opor_warn_tshold = lpTSCall1Ans2->GetDouble(LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
    v_opor_stop_tshold = lpTSCall1Ans2->GetDouble(LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
    v_stock_warn_ratio = lpTSCall1Ans2->GetDouble(LDBIZ_STOCK_WARN_RATIO_FLOAT);
    v_stock_stop_ratio = lpTSCall1Ans2->GetDouble(LDBIZ_STOCK_STOP_RATIO_FLOAT);
    v_stock_warn_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STOCK_WARN_AMT_FLOAT);
    v_stock_stop_amt = lpTSCall1Ans2->GetDouble(LDBIZ_STOCK_STOP_AMT_FLOAT);
    v_open_close_permission = lpTSCall1Ans2->GetInt32(LDBIZ_OPEN_CLOSE_PERMISSION_INT);
    v_posi_limit_time = lpTSCall1Ans2->GetInt32(LDBIZ_POSI_LIMIT_TIME_INT);
    v_update_times = lpTSCall1Ans2->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // [主动推送][risk.t0oporresult][风控主推_t0_操作员阀值计算主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.153", 0);
    lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpPubMsg->SetInt64(LDBIZ_DETAIL_POSI_ID_INT64,v_detail_posi_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpPubMsg->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
    lpPubMsg->SetDouble(LDBIZ_CURR_QTY_FLOAT,v_curr_qty);
    lpPubMsg->SetInt32(LDBIZ_OPEN_POSI_DATE_INT,v_open_posi_date);
    lpPubMsg->SetInt32(LDBIZ_OPEN_POSI_TIME_INT,v_open_posi_time);
    lpPubMsg->SetDouble(LDBIZ_OPEN_POSI_PRICE_FLOAT,v_open_posi_price);
    lpPubMsg->SetDouble(LDBIZ_OPEN_POSI_VALUE_FLOAT,v_open_posi_value);
    lpPubMsg->SetDouble(LDBIZ_OPEN_POSI_FEE_FLOAT,v_open_posi_fee);
    lpPubMsg->SetDouble(LDBIZ_CLOSE_POSI_QTY_FLOAT,v_close_posi_qty);
    lpPubMsg->SetDouble(LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT,v_close_posi_market_value);
    lpPubMsg->SetDouble(LDBIZ_CLOSE_POSI_FEE_FLOAT,v_close_posi_fee);
    lpPubMsg->SetDouble(LDBIZ_REALIZE_PANDL_FLOAT,v_realize_pandl);
    lpPubMsg->SetDouble(LDBIZ_PANDL_RATIO_FLOAT,v_pandl_ratio);
    lpPubMsg->SetDouble(LDBIZ_UN_CLOSE_POSI_QTY_FLOAT,v_un_close_posi_qty);
    lpPubMsg->SetDouble(LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT,v_un_close_marke_value);
    lpPubMsg->SetDouble(LDBIZ_LAST_PRICE_FLOAT,v_last_price);
    lpPubMsg->SetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT,v_up_limit_price);
    lpPubMsg->SetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT,v_down_limit_price);
    lpPubMsg->SetDouble(LDBIZ_COST_PRICE_FLOAT,v_cost_price);
    lpPubMsg->SetDouble(LDBIZ_LAST_TSHOLD_VALUE_FLOAT,v_last_tshold_value);
    lpPubMsg->SetDouble(LDBIZ_FLOAT_PANDL_FLOAT,v_float_pandl);
    lpPubMsg->SetString(LDBIZ_POSI_STATUS_STR,v_posi_status);
    lpPubMsg->SetString(LDBIZ_MONI_RESULT_STATUS_STR,v_moni_result_status);
    lpPubMsg->SetString(LDBIZ_POSI_LIMIT_STATUS_STR,v_posi_limit_status);
    lpPubMsg->SetDouble(LDBIZ_OPOR_WARN_TSHOLD_FLOAT,v_opor_warn_tshold);
    lpPubMsg->SetDouble(LDBIZ_OPOR_STOP_TSHOLD_FLOAT,v_opor_stop_tshold);
    lpPubMsg->SetDouble(LDBIZ_STOCK_WARN_RATIO_FLOAT,v_stock_warn_ratio);
    lpPubMsg->SetDouble(LDBIZ_STOCK_STOP_RATIO_FLOAT,v_stock_stop_ratio);
    lpPubMsg->SetDouble(LDBIZ_STOCK_WARN_AMT_FLOAT,v_stock_warn_amt);
    lpPubMsg->SetDouble(LDBIZ_STOCK_STOP_AMT_FLOAT,v_stock_stop_amt);
    lpPubMsg->SetInt32(LDBIZ_OPEN_CLOSE_PERMISSION_INT,v_open_close_permission);
    lpPubMsg->SetInt32(LDBIZ_POSI_LIMIT_TIME_INT,v_posi_limit_time);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("risk.t0oporresult", lpPubMsg);


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

//逻辑_风控证券_接口_计算t0操作员汇总阀值
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
    int v_target_opor_no;
    int v_co_no;
    double v_curr_qty;
    double v_open_posi_value;
    double v_open_posi_fee;
    double v_close_posi_qty;
    double v_close_posi_market_value;
    double v_close_posi_fee;
    double v_realize_pandl;
    double v_float_pandl;
    double v_pandl_ratio;
    double v_un_close_posi_qty;
    double v_un_close_marke_value;
    double v_last_tshold_value;
    char v_moni_result_status[3];
    double v_opor_warn_tshold;
    double v_opor_stop_tshold;
    int v_open_close_permission;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_row_id;
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
    v_target_opor_no=0;
    v_co_no=0;
    v_curr_qty=0;
    v_open_posi_value=0;
    v_open_posi_fee=0;
    v_close_posi_qty=0;
    v_close_posi_market_value=0;
    v_close_posi_fee=0;
    v_realize_pandl=0;
    v_float_pandl=0;
    v_pandl_ratio=0;
    v_un_close_posi_qty=0;
    v_un_close_marke_value=0;
    v_last_tshold_value=0;
    strcpy(v_moni_result_status, " ");
    v_opor_warn_tshold=0;
    v_opor_stop_tshold=0;
    v_open_close_permission=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_row_id=0;
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
    v_target_opor_no = lpInBizMsg->GetInt32(LDBIZ_TARGET_OPOR_NO_INT);
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_curr_qty = lpInBizMsg->GetDouble(LDBIZ_CURR_QTY_FLOAT);
    v_open_posi_value = lpInBizMsg->GetDouble(LDBIZ_OPEN_POSI_VALUE_FLOAT);
    v_open_posi_fee = lpInBizMsg->GetDouble(LDBIZ_OPEN_POSI_FEE_FLOAT);
    v_close_posi_qty = lpInBizMsg->GetDouble(LDBIZ_CLOSE_POSI_QTY_FLOAT);
    v_close_posi_market_value = lpInBizMsg->GetDouble(LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
    v_close_posi_fee = lpInBizMsg->GetDouble(LDBIZ_CLOSE_POSI_FEE_FLOAT);
    v_realize_pandl = lpInBizMsg->GetDouble(LDBIZ_REALIZE_PANDL_FLOAT);
    v_float_pandl = lpInBizMsg->GetDouble(LDBIZ_FLOAT_PANDL_FLOAT);
    v_pandl_ratio = lpInBizMsg->GetDouble(LDBIZ_PANDL_RATIO_FLOAT);
    v_un_close_posi_qty = lpInBizMsg->GetDouble(LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
    v_un_close_marke_value = lpInBizMsg->GetDouble(LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
    v_last_tshold_value = lpInBizMsg->GetDouble(LDBIZ_LAST_TSHOLD_VALUE_FLOAT);
    strncpy(v_moni_result_status, lpInBizMsg->GetString(LDBIZ_MONI_RESULT_STATUS_STR),2);
    v_moni_result_status[2] = '\0';
    v_opor_warn_tshold = lpInBizMsg->GetDouble(LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
    v_opor_stop_tshold = lpInBizMsg->GetDouble(LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
    v_open_close_permission = lpInBizMsg->GetInt32(LDBIZ_OPEN_CLOSE_PERMISSION_INT);

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


    // set @操作员编号# = @目标操作员编号#;
    v_opor_no = v_target_opor_no;
    //调用过程[事务_风控证券_风控_T0操作员汇总阈值信息更新]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.27", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetDouble(LDBIZ_CURR_QTY_FLOAT,v_curr_qty);
    lpTSCall1Req1->SetDouble(LDBIZ_OPEN_POSI_VALUE_FLOAT,v_open_posi_value);
    lpTSCall1Req1->SetDouble(LDBIZ_OPEN_POSI_FEE_FLOAT,v_open_posi_fee);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_POSI_QTY_FLOAT,v_close_posi_qty);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT,v_close_posi_market_value);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_POSI_FEE_FLOAT,v_close_posi_fee);
    lpTSCall1Req1->SetDouble(LDBIZ_REALIZE_PANDL_FLOAT,v_realize_pandl);
    lpTSCall1Req1->SetDouble(LDBIZ_FLOAT_PANDL_FLOAT,v_float_pandl);
    lpTSCall1Req1->SetDouble(LDBIZ_PANDL_RATIO_FLOAT,v_pandl_ratio);
    lpTSCall1Req1->SetDouble(LDBIZ_UN_CLOSE_POSI_QTY_FLOAT,v_un_close_posi_qty);
    lpTSCall1Req1->SetDouble(LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT,v_un_close_marke_value);
    lpTSCall1Req1->SetDouble(LDBIZ_LAST_TSHOLD_VALUE_FLOAT,v_last_tshold_value);
    lpTSCall1Req1->SetString(LDBIZ_MONI_RESULT_STATUS_STR,v_moni_result_status);
    lpTSCall1Req1->SetDouble(LDBIZ_OPOR_WARN_TSHOLD_FLOAT,v_opor_warn_tshold);
    lpTSCall1Req1->SetDouble(LDBIZ_OPOR_STOP_TSHOLD_FLOAT,v_opor_stop_tshold);
    lpTSCall1Req1->SetInt32(LDBIZ_OPEN_CLOSE_PERMISSION_INT,v_open_close_permission);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.27]subcall timed out!");
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


    // set @操作员机构编号# = @机构编号#;
    v_opor_co_no = v_co_no;
    //调用过程[事务_风控证券_接口_获取单条T0操作员阈值汇总]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.5.21", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.5.21]subcall timed out!");
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
    v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);
    v_curr_qty = lpTSCall1Ans2->GetDouble(LDBIZ_CURR_QTY_FLOAT);
    v_open_posi_value = lpTSCall1Ans2->GetDouble(LDBIZ_OPEN_POSI_VALUE_FLOAT);
    v_open_posi_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OPEN_POSI_FEE_FLOAT);
    v_close_posi_qty = lpTSCall1Ans2->GetDouble(LDBIZ_CLOSE_POSI_QTY_FLOAT);
    v_close_posi_market_value = lpTSCall1Ans2->GetDouble(LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
    v_close_posi_fee = lpTSCall1Ans2->GetDouble(LDBIZ_CLOSE_POSI_FEE_FLOAT);
    v_realize_pandl = lpTSCall1Ans2->GetDouble(LDBIZ_REALIZE_PANDL_FLOAT);
    v_float_pandl = lpTSCall1Ans2->GetDouble(LDBIZ_FLOAT_PANDL_FLOAT);
    v_pandl_ratio = lpTSCall1Ans2->GetDouble(LDBIZ_PANDL_RATIO_FLOAT);
    v_un_close_posi_qty = lpTSCall1Ans2->GetDouble(LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
    v_un_close_marke_value = lpTSCall1Ans2->GetDouble(LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
    v_last_tshold_value = lpTSCall1Ans2->GetDouble(LDBIZ_LAST_TSHOLD_VALUE_FLOAT);
    strcpy(v_moni_result_status, lpTSCall1Ans2->GetString(LDBIZ_MONI_RESULT_STATUS_STR));
    v_opor_warn_tshold = lpTSCall1Ans2->GetDouble(LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
    v_opor_stop_tshold = lpTSCall1Ans2->GetDouble(LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
    v_open_close_permission = lpTSCall1Ans2->GetInt32(LDBIZ_OPEN_CLOSE_PERMISSION_INT);
    v_update_times = lpTSCall1Ans2->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // [主动推送][risk.t0oporsumresult][风控主推_t0_操作员阀值汇总计算主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.154", 0);
    lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetDouble(LDBIZ_CURR_QTY_FLOAT,v_curr_qty);
    lpPubMsg->SetDouble(LDBIZ_OPEN_POSI_VALUE_FLOAT,v_open_posi_value);
    lpPubMsg->SetDouble(LDBIZ_OPEN_POSI_FEE_FLOAT,v_open_posi_fee);
    lpPubMsg->SetDouble(LDBIZ_CLOSE_POSI_QTY_FLOAT,v_close_posi_qty);
    lpPubMsg->SetDouble(LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT,v_close_posi_market_value);
    lpPubMsg->SetDouble(LDBIZ_CLOSE_POSI_FEE_FLOAT,v_close_posi_fee);
    lpPubMsg->SetDouble(LDBIZ_REALIZE_PANDL_FLOAT,v_realize_pandl);
    lpPubMsg->SetDouble(LDBIZ_FLOAT_PANDL_FLOAT,v_float_pandl);
    lpPubMsg->SetDouble(LDBIZ_PANDL_RATIO_FLOAT,v_pandl_ratio);
    lpPubMsg->SetDouble(LDBIZ_UN_CLOSE_POSI_QTY_FLOAT,v_un_close_posi_qty);
    lpPubMsg->SetDouble(LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT,v_un_close_marke_value);
    lpPubMsg->SetDouble(LDBIZ_LAST_TSHOLD_VALUE_FLOAT,v_last_tshold_value);
    lpPubMsg->SetString(LDBIZ_MONI_RESULT_STATUS_STR,v_moni_result_status);
    lpPubMsg->SetDouble(LDBIZ_OPOR_WARN_TSHOLD_FLOAT,v_opor_warn_tshold);
    lpPubMsg->SetDouble(LDBIZ_OPOR_STOP_TSHOLD_FLOAT,v_opor_stop_tshold);
    lpPubMsg->SetInt32(LDBIZ_OPEN_CLOSE_PERMISSION_INT,v_open_close_permission);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("risk.t0oporsumresult", lpPubMsg);


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

//逻辑_风控证券_接口_计算更新操作员风险监控数据
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
    int64 v_moni_set_id;
    double v_curr_moni_value;
    double v_cash_asset;
    double v_fund_asset;
    double v_bond_asset;
    double v_stock_asset;
    double v_repo_asset;
    double v_nav_asset;
    double v_contrs_curr_moni_value;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_row_id;
    int v_co_no;
    int v_busi_opor_no;
    int v_moni_role_type;
    int v_moni_value_flag;
    int v_moni_value_type;
    double v_warn_posi_value;
    int v_warn_trig_oper_type;
    double v_close_posi_value;
    int v_close_trig_oper_type;
    double v_appd_value;
    int v_appd_trig_oper_type;
    int v_begin_moni_date;
    double v_begin_moni_value;
    double v_max_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
    char v_moni_set_status[3];
    double v_stock_asset_ratio;
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    char v_remark_info[256];
    int v_time_stamp;
    int v_update_times;
    int v_push_type;
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
    v_moni_set_id=0;
    v_curr_moni_value=0;
    v_cash_asset=0;
    v_fund_asset=0;
    v_bond_asset=0;
    v_stock_asset=0;
    v_repo_asset=0;
    v_nav_asset=0;
    v_contrs_curr_moni_value=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_row_id=0;
    v_co_no=0;
    v_busi_opor_no=0;
    v_moni_role_type=0;
    v_moni_value_flag=0;
    v_moni_value_type=0;
    v_warn_posi_value=0;
    v_warn_trig_oper_type=0;
    v_close_posi_value=0;
    v_close_trig_oper_type=0;
    v_appd_value=0;
    v_appd_trig_oper_type=0;
    v_begin_moni_date=0;
    v_begin_moni_value=0;
    v_max_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
    strcpy(v_moni_set_status, " ");
    v_stock_asset_ratio=0;
    v_close_posi_flag=0;
    v_close_ratio_level_one=0;
    v_close_ratio_level_two=0;
    v_close_ratio_level_three=0;
    strcpy(v_remark_info, " ");
    v_time_stamp=0;
    v_update_times=1;
    v_push_type=0;
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
    v_moni_set_id = lpInBizMsg->GetInt64(LDBIZ_MONI_SET_ID_INT64);
    v_curr_moni_value = lpInBizMsg->GetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT);
    v_cash_asset = lpInBizMsg->GetDouble(LDBIZ_CASH_ASSET_FLOAT);
    v_fund_asset = lpInBizMsg->GetDouble(LDBIZ_FUND_ASSET_FLOAT);
    v_bond_asset = lpInBizMsg->GetDouble(LDBIZ_BOND_ASSET_FLOAT);
    v_stock_asset = lpInBizMsg->GetDouble(LDBIZ_STOCK_ASSET_FLOAT);
    v_repo_asset = lpInBizMsg->GetDouble(LDBIZ_REPO_ASSET_FLOAT);
    v_nav_asset = lpInBizMsg->GetDouble(LDBIZ_NAV_ASSET_FLOAT);
    v_contrs_curr_moni_value = lpInBizMsg->GetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);

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

    //调用过程[事务_风控证券_接口_更新操作员风险监控设置计算值]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.5.26", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    lpTSCall1Req1->SetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT,v_curr_moni_value);
    lpTSCall1Req1->SetDouble(LDBIZ_CASH_ASSET_FLOAT,v_cash_asset);
    lpTSCall1Req1->SetDouble(LDBIZ_FUND_ASSET_FLOAT,v_fund_asset);
    lpTSCall1Req1->SetDouble(LDBIZ_BOND_ASSET_FLOAT,v_bond_asset);
    lpTSCall1Req1->SetDouble(LDBIZ_STOCK_ASSET_FLOAT,v_stock_asset);
    lpTSCall1Req1->SetDouble(LDBIZ_REPO_ASSET_FLOAT,v_repo_asset);
    lpTSCall1Req1->SetDouble(LDBIZ_NAV_ASSET_FLOAT,v_nav_asset);
    lpTSCall1Req1->SetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT,v_contrs_curr_moni_value);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.5.26]subcall timed out!");
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

    //调用过程[事务_风控证券_接口_获取单条操作员风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.5.24", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.5.24]subcall timed out!");
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
    v_busi_opor_no = lpTSCall1Ans2->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_moni_role_type = lpTSCall1Ans2->GetInt32(LDBIZ_MONI_ROLE_TYPE_INT);
    v_moni_value_flag = lpTSCall1Ans2->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
    v_moni_value_type = lpTSCall1Ans2->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
    v_warn_posi_value = lpTSCall1Ans2->GetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT);
    v_warn_trig_oper_type = lpTSCall1Ans2->GetInt32(LDBIZ_WARN_TRIG_OPER_TYPE_INT);
    v_close_posi_value = lpTSCall1Ans2->GetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT);
    v_close_trig_oper_type = lpTSCall1Ans2->GetInt32(LDBIZ_CLOSE_TRIG_OPER_TYPE_INT);
    v_appd_value = lpTSCall1Ans2->GetDouble(LDBIZ_APPD_VALUE_FLOAT);
    v_appd_trig_oper_type = lpTSCall1Ans2->GetInt32(LDBIZ_APPD_TRIG_OPER_TYPE_INT);
    v_begin_moni_date = lpTSCall1Ans2->GetInt32(LDBIZ_BEGIN_MONI_DATE_INT);
    v_begin_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_BEGIN_MONI_VALUE_FLOAT);
    v_max_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT);
    v_curr_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT);
    v_curr_result_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
    strcpy(v_contrs_stock_code, lpTSCall1Ans2->GetString(LDBIZ_CONTRS_STOCK_CODE_STR));
    v_contrs_exch_no = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRS_EXCH_NO_INT);
    v_contrs_max_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
    v_contrs_curr_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
    v_contrs_result_moni_value = lpTSCall1Ans2->GetDouble(LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
    v_moni_result_value = lpTSCall1Ans2->GetDouble(LDBIZ_MONI_RESULT_VALUE_FLOAT);
    strcpy(v_moni_result_status, lpTSCall1Ans2->GetString(LDBIZ_MONI_RESULT_STATUS_STR));
    strcpy(v_moni_set_status, lpTSCall1Ans2->GetString(LDBIZ_MONI_SET_STATUS_STR));
    v_cash_asset = lpTSCall1Ans2->GetDouble(LDBIZ_CASH_ASSET_FLOAT);
    v_fund_asset = lpTSCall1Ans2->GetDouble(LDBIZ_FUND_ASSET_FLOAT);
    v_bond_asset = lpTSCall1Ans2->GetDouble(LDBIZ_BOND_ASSET_FLOAT);
    v_stock_asset = lpTSCall1Ans2->GetDouble(LDBIZ_STOCK_ASSET_FLOAT);
    v_repo_asset = lpTSCall1Ans2->GetDouble(LDBIZ_REPO_ASSET_FLOAT);
    v_nav_asset = lpTSCall1Ans2->GetDouble(LDBIZ_NAV_ASSET_FLOAT);
    v_stock_asset_ratio = lpTSCall1Ans2->GetDouble(LDBIZ_STOCK_ASSET_RATIO_FLOAT);
    v_close_posi_flag = lpTSCall1Ans2->GetInt32(LDBIZ_CLOSE_POSI_FLAG_INT);
    v_close_ratio_level_one = lpTSCall1Ans2->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
    v_close_ratio_level_two = lpTSCall1Ans2->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
    v_close_ratio_level_three = lpTSCall1Ans2->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
    strcpy(v_remark_info, lpTSCall1Ans2->GetString(LDBIZ_REMARK_INFO_STR));
    v_time_stamp = lpTSCall1Ans2->GetInt32(LDBIZ_TIME_STAMP_INT);
    v_update_times = lpTSCall1Ans2->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // set @主推类型# = 1;
    v_push_type = 1;

    // set @操作员编号# = @业务操作员编号#;
    v_opor_no = v_busi_opor_no;

    // [主动推送][risk.opormonitor][风控主推_规则_操作员监控主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.909", 0);
    lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpPubMsg->SetInt32(LDBIZ_MONI_ROLE_TYPE_INT,v_moni_role_type);
    lpPubMsg->SetInt32(LDBIZ_MONI_VALUE_FLAG_INT,v_moni_value_flag);
    lpPubMsg->SetInt32(LDBIZ_MONI_VALUE_TYPE_INT,v_moni_value_type);
    lpPubMsg->SetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT,v_warn_posi_value);
    lpPubMsg->SetInt32(LDBIZ_WARN_TRIG_OPER_TYPE_INT,v_warn_trig_oper_type);
    lpPubMsg->SetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT,v_close_posi_value);
    lpPubMsg->SetInt32(LDBIZ_CLOSE_TRIG_OPER_TYPE_INT,v_close_trig_oper_type);
    lpPubMsg->SetDouble(LDBIZ_APPD_VALUE_FLOAT,v_appd_value);
    lpPubMsg->SetInt32(LDBIZ_APPD_TRIG_OPER_TYPE_INT,v_appd_trig_oper_type);
    lpPubMsg->SetInt32(LDBIZ_BEGIN_MONI_DATE_INT,v_begin_moni_date);
    lpPubMsg->SetDouble(LDBIZ_BEGIN_MONI_VALUE_FLOAT,v_begin_moni_value);
    lpPubMsg->SetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT,v_max_moni_value);
    lpPubMsg->SetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT,v_curr_moni_value);
    lpPubMsg->SetDouble(LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT,v_curr_result_moni_value);
    lpPubMsg->SetString(LDBIZ_CONTRS_STOCK_CODE_STR,v_contrs_stock_code);
    lpPubMsg->SetInt32(LDBIZ_CONTRS_EXCH_NO_INT,v_contrs_exch_no);
    lpPubMsg->SetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT,v_contrs_max_moni_value);
    lpPubMsg->SetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT,v_contrs_curr_moni_value);
    lpPubMsg->SetDouble(LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT,v_contrs_result_moni_value);
    lpPubMsg->SetDouble(LDBIZ_MONI_RESULT_VALUE_FLOAT,v_moni_result_value);
    lpPubMsg->SetString(LDBIZ_MONI_RESULT_STATUS_STR,v_moni_result_status);
    lpPubMsg->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    lpPubMsg->SetDouble(LDBIZ_CASH_ASSET_FLOAT,v_cash_asset);
    lpPubMsg->SetDouble(LDBIZ_FUND_ASSET_FLOAT,v_fund_asset);
    lpPubMsg->SetDouble(LDBIZ_BOND_ASSET_FLOAT,v_bond_asset);
    lpPubMsg->SetDouble(LDBIZ_STOCK_ASSET_FLOAT,v_stock_asset);
    lpPubMsg->SetDouble(LDBIZ_REPO_ASSET_FLOAT,v_repo_asset);
    lpPubMsg->SetDouble(LDBIZ_NAV_ASSET_FLOAT,v_nav_asset);
    lpPubMsg->SetDouble(LDBIZ_STOCK_ASSET_RATIO_FLOAT,v_stock_asset_ratio);
    lpPubMsg->SetInt32(LDBIZ_CLOSE_POSI_FLAG_INT,v_close_posi_flag);
    lpPubMsg->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT,v_close_ratio_level_one);
    lpPubMsg->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT,v_close_ratio_level_two);
    lpPubMsg->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT,v_close_ratio_level_three);
    lpPubMsg->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    lpPubMsg->SetInt32(LDBIZ_TIME_STAMP_INT,v_time_stamp);
    lpPubMsg->SetInt32(LDBIZ_PUSH_TYPE_INT,v_push_type);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("risk.opormonitor", lpPubMsg);


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

//逻辑_风控证券_接口_查询风控服务器资产账户资产
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
    int v_asset_acco_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    double v_total_cash_asset;
    double v_stock_cash_asset;
    double v_futu_cash_asset;
    double v_stock_asset;
    double v_fund_asset;
    double v_money_fund_asset;
    double v_not_money_fund_asset;
    double v_bond_asset;
    double v_futu_asset;
    double v_repo_asset;
    double v_hk_thrgh_stock_asset;
    double v_futu_long_market_value;
    double v_futu_short_market_value;
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
    v_asset_acco_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_total_cash_asset=0;
    v_stock_cash_asset=0;
    v_futu_cash_asset=0;
    v_stock_asset=0;
    v_fund_asset=0;
    v_money_fund_asset=0;
    v_not_money_fund_asset=0;
    v_bond_asset=0;
    v_futu_asset=0;
    v_repo_asset=0;
    v_hk_thrgh_stock_asset=0;
    v_futu_long_market_value=0;
    v_futu_short_market_value=0;
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
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);

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

    //调用过程[事务_风控证券_接口_获取结果集]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.5.34", 0);
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
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.5.34]subcall timed out!");
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

//逻辑_风控证券_接口_单条检查客户风险
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
    int v_asset_acco_no;
    int v_exch_no;
    char v_exch_crncy_type[4];
    char v_stock_code[7];
    double v_comm_limit_price;
    double v_limit_actual_price;
    int v_comm_dir;
    double v_comm_qty;
    int v_comm_executor;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_compli_trig_id;
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_co_comm_appr_oper;
    char v_exgp_busi_config_str[65];
    char v_crncy_type[4];
    double v_buy_ref_rate;
    double v_sell_ref_rate;
    int v_stock_code_no;
    int v_stock_type;
    int v_asset_type;
    int v_net_price_flag;
    double v_par_value;
    double v_impawn_ratio;
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
    double v_pre_close_price;
    int v_subscription_trade_mark;
    int v_purchase_trade_mark;
    int v_rede_trade_mark;
    double v_first_minimum_amt;
    double v_minimum_purchase_amt;
    double v_minimum_subscription_amt;
    double v_minimum_rede_share;
    double v_minimum_holding_share;
    char v_sys_config_str[65];
    char v_online_opor_no_str[2049];
    char v_busi_config_str[65];
    int v_order_dir;
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
    double v_fina_limit_max;
    double v_loan_limit_max;
    int v_sys_type;
    int v_asset_acco_type;
    int v_sell_auto_back_debt;
    double v_pre_limit_actual_price;
    double v_order_qty;
    double v_order_price;
    double v_trade_commis;
    double v_all_fee;
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
    double v_order_frozen_amt;
    int v_trig_stage_type;
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
    strcpy(v_exch_crncy_type, "CNY");
    strcpy(v_stock_code, " ");
    v_comm_limit_price=0;
    v_limit_actual_price=0;
    v_comm_dir=0;
    v_comm_qty=0;
    v_comm_executor=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_compli_trig_id=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_co_comm_appr_oper=0;
    strcpy(v_exgp_busi_config_str, " ");
    strcpy(v_crncy_type, "CNY");
    v_buy_ref_rate=0;
    v_sell_ref_rate=0;
    v_stock_code_no=0;
    v_stock_type=0;
    v_asset_type=0;
    v_net_price_flag=0;
    v_par_value=0;
    v_impawn_ratio=0;
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
    v_pre_close_price=0;
    v_subscription_trade_mark=0;
    v_purchase_trade_mark=0;
    v_rede_trade_mark=0;
    v_first_minimum_amt=0;
    v_minimum_purchase_amt=0;
    v_minimum_subscription_amt=0;
    v_minimum_rede_share=0;
    v_minimum_holding_share=0;
    strcpy(v_sys_config_str, " ");
    strcpy(v_online_opor_no_str, " ");
    strcpy(v_busi_config_str, " ");
    v_order_dir=0;
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
    v_fina_limit_max=0;
    v_loan_limit_max=0;
    v_sys_type=0;
    v_asset_acco_type=0;
    v_sell_auto_back_debt=0;
    v_pre_limit_actual_price=0;
    v_order_qty=0;
    v_order_price=0;
    v_trade_commis=0;
    v_all_fee=0;
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
    v_order_frozen_amt=0;
    v_trig_stage_type=0;
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
    strncpy(v_exch_crncy_type, lpInBizMsg->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR),3);
    v_exch_crncy_type[3] = '\0';
    strncpy(v_stock_code, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR),6);
    v_stock_code[6] = '\0';
    v_comm_limit_price = lpInBizMsg->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
    v_limit_actual_price = lpInBizMsg->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
    v_comm_dir = lpInBizMsg->GetInt32(LDBIZ_COMM_DIR_INT);
    v_comm_qty = lpInBizMsg->GetDouble(LDBIZ_COMM_QTY_FLOAT);
    v_comm_executor = lpInBizMsg->GetInt32(LDBIZ_COMM_EXECUTOR_INT);

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

    //公共子系统检查，检查状态、身份、权限等
    //调用过程[事务_公共_交易接口_检查指令市场状态权限身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.25.11", 0);
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
    lpTSCall1Req0->SetInt32(LDBIZ_COMM_EXECUTOR_INT,v_comm_executor);
    lpTSCall1Req0->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
    lpTSCall1Req0->SetDouble(LDBIZ_COMM_QTY_FLOAT,v_comm_qty);
    lpTSCall1Req0->SetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT,v_comm_limit_price);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.25.11]subcall timed out!");
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
    strcpy(v_crncy_type, lpTSCall1Ans0->GetString(LDBIZ_CRNCY_TYPE_STR));
    strcpy(v_exch_crncy_type, lpTSCall1Ans0->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
    v_buy_ref_rate = lpTSCall1Ans0->GetDouble(LDBIZ_BUY_REF_RATE_FLOAT);
    v_sell_ref_rate = lpTSCall1Ans0->GetDouble(LDBIZ_SELL_REF_RATE_FLOAT);
    v_stock_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_stock_type = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_TYPE_INT);
    v_net_price_flag = lpTSCall1Ans0->GetInt32(LDBIZ_NET_PRICE_FLAG_INT);
    v_par_value = lpTSCall1Ans0->GetDouble(LDBIZ_PAR_VALUE_FLOAT);
    v_impawn_ratio = lpTSCall1Ans0->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);
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
    v_pre_close_price = lpTSCall1Ans0->GetDouble(LDBIZ_PRE_CLOSE_PRICE_FLOAT);
    v_subscription_trade_mark = lpTSCall1Ans0->GetInt32(LDBIZ_SUBSCRIPTION_TRADE_MARK_INT);
    v_purchase_trade_mark = lpTSCall1Ans0->GetInt32(LDBIZ_PURCHASE_TRADE_MARK_INT);
    v_rede_trade_mark = lpTSCall1Ans0->GetInt32(LDBIZ_REDE_TRADE_MARK_INT);
    v_first_minimum_amt = lpTSCall1Ans0->GetDouble(LDBIZ_FIRST_MINIMUM_AMT_FLOAT);
    v_minimum_purchase_amt = lpTSCall1Ans0->GetDouble(LDBIZ_MINIMUM_PURCHASE_AMT_FLOAT);
    v_minimum_subscription_amt = lpTSCall1Ans0->GetDouble(LDBIZ_MINIMUM_SUBSCRIPTION_AMT_FLOAT);
    v_minimum_rede_share = lpTSCall1Ans0->GetDouble(LDBIZ_MINIMUM_REDE_SHARE_FLOAT);
    v_minimum_holding_share = lpTSCall1Ans0->GetDouble(LDBIZ_MINIMUM_HOLDING_SHARE_FLOAT);
    strcpy(v_sys_config_str, lpTSCall1Ans0->GetString(LDBIZ_SYS_CONFIG_STR_STR));
    strcpy(v_online_opor_no_str, lpTSCall1Ans0->GetString(LDBIZ_ONLINE_OPOR_NO_STR_STR));


    // set @业务控制配置串# = @交易组业务控制配置串#;
    strcpy(v_busi_config_str,v_exgp_busi_config_str);

    // set @订单方向# = @指令方向#;
    v_order_dir = v_comm_dir;

    // set @业务控制串# = "11111";
    strcpy(v_busi_ctrl_str,"11111");
    //调用过程[事务_产品_交易接口_检查指令产品账户信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.8.11", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req1->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
    lpTSCall1Req1->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_COMM_APPR_OPER_INT,v_co_comm_appr_oper);
    lpTSCall1Req1->SetString(LDBIZ_BUSI_CONFIG_STR_STR,v_busi_config_str);
    lpTSCall1Req1->SetString(LDBIZ_SYS_CONFIG_STR_STR,v_sys_config_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.8.11]subcall timed out!");
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
    v_fina_limit_max = lpTSCall1Ans1->GetDouble(LDBIZ_FINA_LIMIT_MAX_FLOAT);
    v_loan_limit_max = lpTSCall1Ans1->GetDouble(LDBIZ_LOAN_LIMIT_MAX_FLOAT);
    v_sys_type = lpTSCall1Ans1->GetInt32(LDBIZ_SYS_TYPE_INT);
    v_asset_acco_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_TYPE_INT);
    v_sell_auto_back_debt = lpTSCall1Ans1->GetInt32(LDBIZ_SELL_AUTO_BACK_DEBT_INT);

    //获取指令实际限价
    //调用过程[事务_交易证券_指令_获取指令实际限价]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("tdsecuT.3.82", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT,v_comm_limit_price);
    lpTSCall1Req2->SetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,v_limit_actual_price);
    lpTSCall1Req2->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
    lpTSCall1Req2->SetDouble(LDBIZ_LAST_PRICE_FLOAT,v_last_price);
    lpTSCall1Req2->SetDouble(LDBIZ_PRE_CLOSE_PRICE_FLOAT,v_pre_close_price);
    lpTSCall1Req2->SetDouble(LDBIZ_COMM_NO_LIMIT_PRICE_RATIO_FLOAT,v_comm_no_limit_price_ratio);
    lpTSCall1Req2->SetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT,v_up_limit_price);
    lpTSCall1Req2->SetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT,v_down_limit_price);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[tdsecuT.3.82]subcall timed out!");
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
    v_pre_limit_actual_price = lpTSCall1Ans2->GetDouble(LDBIZ_PRE_LIMIT_ACTUAL_PRICE_FLOAT);


    // set @指令实际限价# = @前指令实际限价#;
    v_limit_actual_price = v_pre_limit_actual_price;

    // set @订单数量# = @指令数量#;
    v_order_qty = v_comm_qty;

    // set @订单价格# = @指令实际限价#;
    v_order_price = v_limit_actual_price;

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

    // set @触发阶段类型# = 《触发阶段类型-指令端》;
    v_trig_stage_type = 1;
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


    // if (@指令审批设置# = 《指令审批设置-自动审批》 or @指令审批设置# = 《指令审批设置-不设置》)  and @审批通过自动下单# = 《审批通过自动下单-是》   then
    if ((v_comm_appr_set == 1 || v_comm_appr_set == 3)  && v_appr_allow_order_flag == 1  )
    {

        // set @触发阶段类型# = 《触发阶段类型-交易端》;
        v_trig_stage_type = 2;
        //调用过程[事务_风控证券_接口_检查客户风险]
        //组织事务请求
        if(lpTSCall1Ans5)
        {
          lpTSCall1Ans5->FreeMsg();
          lpTSCall1Ans5=NULL;
        }
        lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("rksecuT.5.9", 0);
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
        lpTSCall1Req5->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
        lpTSCall1Req5->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req5->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
        lpTSCall1Req5->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpTSCall1Req5->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
        lpTSCall1Req5->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpTSCall1Req5->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
        lpTSCall1Req5->SetInt32(LDBIZ_TRIG_STAGE_TYPE_INT,v_trig_stage_type);
        glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
        if(!lpTSCall1Ans5)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.5.9]subcall timed out!");
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
        v_compli_trig_id = lpTSCall1Ans5->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);

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
    return iRet;
}

