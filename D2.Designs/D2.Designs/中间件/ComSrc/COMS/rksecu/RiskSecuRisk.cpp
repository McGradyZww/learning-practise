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
int LD_CALL_MODE fnFunc29(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc30(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc31(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc32(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc33(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc34(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc35(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc36(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc37(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc38(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc39(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc40(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc41(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc42(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc43(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc44(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc45(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc46(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc47(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc48(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc49(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc50(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc51(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc52(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);
int LD_CALL_MODE fnFunc53(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);

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
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.1");
        bizFuncInfo->lpFunc = fnFunc0;
    }
    else if (iFunIndex==1)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.2");
        bizFuncInfo->lpFunc = fnFunc1;
    }
    else if (iFunIndex==2)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.3");
        bizFuncInfo->lpFunc = fnFunc2;
    }
    else if (iFunIndex==3)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.4");
        bizFuncInfo->lpFunc = fnFunc3;
    }
    else if (iFunIndex==4)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.5");
        bizFuncInfo->lpFunc = fnFunc4;
    }
    else if (iFunIndex==5)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.6");
        bizFuncInfo->lpFunc = fnFunc5;
    }
    else if (iFunIndex==6)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.7");
        bizFuncInfo->lpFunc = fnFunc6;
    }
    else if (iFunIndex==7)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.8");
        bizFuncInfo->lpFunc = fnFunc7;
    }
    else if (iFunIndex==8)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.9");
        bizFuncInfo->lpFunc = fnFunc8;
    }
    else if (iFunIndex==9)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.10");
        bizFuncInfo->lpFunc = fnFunc9;
    }
    else if (iFunIndex==10)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.11");
        bizFuncInfo->lpFunc = fnFunc10;
    }
    else if (iFunIndex==11)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.12");
        bizFuncInfo->lpFunc = fnFunc11;
    }
    else if (iFunIndex==12)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.13");
        bizFuncInfo->lpFunc = fnFunc12;
    }
    else if (iFunIndex==13)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.14");
        bizFuncInfo->lpFunc = fnFunc13;
    }
    else if (iFunIndex==14)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.15");
        bizFuncInfo->lpFunc = fnFunc14;
    }
    else if (iFunIndex==15)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.16");
        bizFuncInfo->lpFunc = fnFunc15;
    }
    else if (iFunIndex==16)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.17");
        bizFuncInfo->lpFunc = fnFunc16;
    }
    else if (iFunIndex==17)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.18");
        bizFuncInfo->lpFunc = fnFunc17;
    }
    else if (iFunIndex==18)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.19");
        bizFuncInfo->lpFunc = fnFunc18;
    }
    else if (iFunIndex==19)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.20");
        bizFuncInfo->lpFunc = fnFunc19;
    }
    else if (iFunIndex==20)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.21");
        bizFuncInfo->lpFunc = fnFunc20;
    }
    else if (iFunIndex==21)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.22");
        bizFuncInfo->lpFunc = fnFunc21;
    }
    else if (iFunIndex==22)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.23");
        bizFuncInfo->lpFunc = fnFunc22;
    }
    else if (iFunIndex==23)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.24");
        bizFuncInfo->lpFunc = fnFunc23;
    }
    else if (iFunIndex==24)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.25");
        bizFuncInfo->lpFunc = fnFunc24;
    }
    else if (iFunIndex==25)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.26");
        bizFuncInfo->lpFunc = fnFunc25;
    }
    else if (iFunIndex==26)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.27");
        bizFuncInfo->lpFunc = fnFunc26;
    }
    else if (iFunIndex==27)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.28");
        bizFuncInfo->lpFunc = fnFunc27;
    }
    else if (iFunIndex==28)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.29");
        bizFuncInfo->lpFunc = fnFunc28;
    }
    else if (iFunIndex==29)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.30");
        bizFuncInfo->lpFunc = fnFunc29;
    }
    else if (iFunIndex==30)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.31");
        bizFuncInfo->lpFunc = fnFunc30;
    }
    else if (iFunIndex==31)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.32");
        bizFuncInfo->lpFunc = fnFunc31;
    }
    else if (iFunIndex==32)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.33");
        bizFuncInfo->lpFunc = fnFunc32;
    }
    else if (iFunIndex==33)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.34");
        bizFuncInfo->lpFunc = fnFunc33;
    }
    else if (iFunIndex==34)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.35");
        bizFuncInfo->lpFunc = fnFunc34;
    }
    else if (iFunIndex==35)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.36");
        bizFuncInfo->lpFunc = fnFunc35;
    }
    else if (iFunIndex==36)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.37");
        bizFuncInfo->lpFunc = fnFunc36;
    }
    else if (iFunIndex==37)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.38");
        bizFuncInfo->lpFunc = fnFunc37;
    }
    else if (iFunIndex==38)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.39");
        bizFuncInfo->lpFunc = fnFunc38;
    }
    else if (iFunIndex==39)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.40");
        bizFuncInfo->lpFunc = fnFunc39;
    }
    else if (iFunIndex==40)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.41");
        bizFuncInfo->lpFunc = fnFunc40;
    }
    else if (iFunIndex==41)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.42");
        bizFuncInfo->lpFunc = fnFunc41;
    }
    else if (iFunIndex==42)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.43");
        bizFuncInfo->lpFunc = fnFunc42;
    }
    else if (iFunIndex==43)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.44");
        bizFuncInfo->lpFunc = fnFunc43;
    }
    else if (iFunIndex==44)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.45");
        bizFuncInfo->lpFunc = fnFunc44;
    }
    else if (iFunIndex==45)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.51");
        bizFuncInfo->lpFunc = fnFunc45;
    }
    else if (iFunIndex==46)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.54");
        bizFuncInfo->lpFunc = fnFunc46;
    }
    else if (iFunIndex==47)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.61");
        bizFuncInfo->lpFunc = fnFunc47;
    }
    else if (iFunIndex==48)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.64");
        bizFuncInfo->lpFunc = fnFunc48;
    }
    else if (iFunIndex==49)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.65");
        bizFuncInfo->lpFunc = fnFunc49;
    }
    else if (iFunIndex==50)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.66");
        bizFuncInfo->lpFunc = fnFunc50;
    }
    else if (iFunIndex==51)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.67");
        bizFuncInfo->lpFunc = fnFunc51;
    }
    else if (iFunIndex==52)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.68");
        bizFuncInfo->lpFunc = fnFunc52;
    }
    else if (iFunIndex==53)
    {
        strcpy(bizFuncInfo->szFuncName, "rksecuL.4.69");
        bizFuncInfo->lpFunc = fnFunc53;
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
    return "20190729";
}

//逻辑_风控证券_风控_增加客户风险规则记录
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
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    int64 v_model_id;
    int v_risk_item_id;
    int v_templ_flag;
    int v_union_flag;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_exch_no_str[2049];
    char v_order_dir_str[1025];
    int64 v_dime_id;
    char v_trig_stage_type_str[65];
    int v_compli_calc_level;
    int v_unit_nav_flag;
    int v_trig_type;
    char v_compli_rules_remark[256];
    int v_risk_rule_id;
    int v_risk_rule_type;
    char v_risk_rule_name[65];
    char v_risk_rule_code[2049];
    char v_risk_param_str[2049];
    char v_risk_rule_value_str1[256];
    char v_risk_rule_action1[33];
    char v_risk_rule_value_str2[256];
    char v_risk_rule_action2[33];
    char v_risk_rule_value_str3[256];
    char v_risk_rule_action3[33];
    char v_risk_rule_value_str4[256];
    char v_risk_rule_action4[33];
    char v_corrsp_plug[65];
    int v_begin_time;
    int v_end_time;
    int v_rule_flag;
    int v_update_times;
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_row_id;
    char v_risk_rule_calc_str[256];
    char v_risk_item_id_str[2049];
    int v_push_type;
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
    v_co_no=0;
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    v_model_id=0;
    v_risk_item_id=0;
    v_templ_flag=0;
    v_union_flag=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_exch_no_str, " ");
    strcpy(v_order_dir_str, " ");
    v_dime_id=0;
    strcpy(v_trig_stage_type_str, " ");
    v_compli_calc_level=0;
    v_unit_nav_flag=0;
    v_trig_type=0;
    strcpy(v_compli_rules_remark, " ");
    v_risk_rule_id=0;
    v_risk_rule_type=0;
    strcpy(v_risk_rule_name, " ");
    strcpy(v_risk_rule_code, " ");
    strcpy(v_risk_param_str, " ");
    strcpy(v_risk_rule_value_str1, " ");
    strcpy(v_risk_rule_action1, " ");
    strcpy(v_risk_rule_value_str2, " ");
    strcpy(v_risk_rule_action2, " ");
    strcpy(v_risk_rule_value_str3, " ");
    strcpy(v_risk_rule_action3, " ");
    strcpy(v_risk_rule_value_str4, " ");
    strcpy(v_risk_rule_action4, " ");
    strcpy(v_corrsp_plug, " ");
    v_begin_time=0;
    v_end_time=0;
    v_rule_flag=0;
    v_update_times=1;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_row_id=0;
    strcpy(v_risk_rule_calc_str, " ");
    strcpy(v_risk_item_id_str, " ");
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    strncpy(v_pd_no_str, lpInBizMsg->GetString(LDBIZ_PD_NO_STR_STR),2048);
    v_pd_no_str[2048] = '\0';
    strncpy(v_exch_group_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR),2048);
    v_exch_group_no_str[2048] = '\0';
    v_model_id = lpInBizMsg->GetInt64(LDBIZ_MODEL_ID_INT64);
    v_risk_item_id = lpInBizMsg->GetInt32(LDBIZ_RISK_ITEM_ID_INT);
    v_templ_flag = lpInBizMsg->GetInt32(LDBIZ_TEMPL_FLAG_INT);
    v_union_flag = lpInBizMsg->GetInt32(LDBIZ_UNION_FLAG_INT);

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

    //调用过程[事务_风控证券_风控_增加客户风险规则记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.1", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_STR_STR,v_exch_group_no_str);
    lpTSCall1Req1->SetInt64(LDBIZ_MODEL_ID_INT64,v_model_id);
    lpTSCall1Req1->SetInt32(LDBIZ_RISK_ITEM_ID_INT,v_risk_item_id);
    lpTSCall1Req1->SetInt32(LDBIZ_TEMPL_FLAG_INT,v_templ_flag);
    lpTSCall1Req1->SetInt32(LDBIZ_UNION_FLAG_INT,v_union_flag);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.1]subcall timed out!");
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
    strcpy(v_exch_no_str, lpTSCall1Ans1->GetString(LDBIZ_EXCH_NO_STR_STR));
    strcpy(v_order_dir_str, lpTSCall1Ans1->GetString(LDBIZ_ORDER_DIR_STR_STR));
    v_dime_id = lpTSCall1Ans1->GetInt64(LDBIZ_DIME_ID_INT64);
    strcpy(v_trig_stage_type_str, lpTSCall1Ans1->GetString(LDBIZ_TRIG_STAGE_TYPE_STR_STR));
    v_compli_calc_level = lpTSCall1Ans1->GetInt32(LDBIZ_COMPLI_CALC_LEVEL_INT);
    v_unit_nav_flag = lpTSCall1Ans1->GetInt32(LDBIZ_UNIT_NAV_FLAG_INT);
    v_trig_type = lpTSCall1Ans1->GetInt32(LDBIZ_TRIG_TYPE_INT);
    strcpy(v_compli_rules_remark, lpTSCall1Ans1->GetString(LDBIZ_COMPLI_RULES_REMARK_STR));
    v_risk_rule_id = lpTSCall1Ans1->GetInt32(LDBIZ_RISK_RULE_ID_INT);
    v_risk_rule_type = lpTSCall1Ans1->GetInt32(LDBIZ_RISK_RULE_TYPE_INT);
    strcpy(v_risk_rule_name, lpTSCall1Ans1->GetString(LDBIZ_RISK_RULE_NAME_STR));
    strcpy(v_risk_rule_code, lpTSCall1Ans1->GetString(LDBIZ_RISK_RULE_CODE_STR));
    strcpy(v_risk_param_str, lpTSCall1Ans1->GetString(LDBIZ_RISK_PARAM_STR_STR));
    strcpy(v_risk_rule_calc_str, lpTSCall1Ans1->GetString(LDBIZ_RISK_RULE_CALC_STR_STR));
    strcpy(v_risk_rule_value_str1, lpTSCall1Ans1->GetString(LDBIZ_RISK_RULE_VALUE_STR1_STR));
    strcpy(v_risk_rule_action1, lpTSCall1Ans1->GetString(LDBIZ_RISK_RULE_ACTION1_STR));
    strcpy(v_risk_rule_value_str2, lpTSCall1Ans1->GetString(LDBIZ_RISK_RULE_VALUE_STR2_STR));
    strcpy(v_risk_rule_action2, lpTSCall1Ans1->GetString(LDBIZ_RISK_RULE_ACTION2_STR));
    strcpy(v_risk_rule_value_str3, lpTSCall1Ans1->GetString(LDBIZ_RISK_RULE_VALUE_STR3_STR));
    strcpy(v_risk_rule_action3, lpTSCall1Ans1->GetString(LDBIZ_RISK_RULE_ACTION3_STR));
    strcpy(v_risk_rule_value_str4, lpTSCall1Ans1->GetString(LDBIZ_RISK_RULE_VALUE_STR4_STR));
    strcpy(v_risk_rule_action4, lpTSCall1Ans1->GetString(LDBIZ_RISK_RULE_ACTION4_STR));
    strcpy(v_corrsp_plug, lpTSCall1Ans1->GetString(LDBIZ_CORRSP_PLUG_STR));
    v_begin_time = lpTSCall1Ans1->GetInt32(LDBIZ_BEGIN_TIME_INT);
    v_end_time = lpTSCall1Ans1->GetInt32(LDBIZ_END_TIME_INT);
    v_rule_flag = lpTSCall1Ans1->GetInt32(LDBIZ_RULE_FLAG_INT);
    v_update_times = lpTSCall1Ans1->GetInt32(LDBIZ_UPDATE_TIMES_INT);
    strcpy(v_risk_item_id_str, lpTSCall1Ans1->GetString(LDBIZ_RISK_ITEM_ID_STR_STR));


    // if @模板序号# = 0  then
    if (v_model_id == 0 )
    {

         // set @主推类型# = 1;
         v_push_type = 1;

        // [主动推送][risk.securule][风控主推_规则_证券客户风险规则主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.140", 0);
        lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
        lpPubMsg->SetString(LDBIZ_EXCH_GROUP_NO_STR_STR,v_exch_group_no_str);
        lpPubMsg->SetInt64(LDBIZ_DIME_ID_INT64,v_dime_id);
        lpPubMsg->SetString(LDBIZ_TRIG_STAGE_TYPE_STR_STR,v_trig_stage_type_str);
        lpPubMsg->SetInt32(LDBIZ_COMPLI_CALC_LEVEL_INT,v_compli_calc_level);
        lpPubMsg->SetInt32(LDBIZ_TRIG_TYPE_INT,v_trig_type);
        lpPubMsg->SetInt64(LDBIZ_MODEL_ID_INT64,v_model_id);
        lpPubMsg->SetInt32(LDBIZ_RISK_ITEM_ID_INT,v_risk_item_id);
        lpPubMsg->SetString(LDBIZ_RISK_ITEM_ID_STR_STR,v_risk_item_id_str);
        lpPubMsg->SetString(LDBIZ_RISK_RULE_CODE_STR,v_risk_rule_code);
        lpPubMsg->SetString(LDBIZ_RISK_PARAM_STR_STR,v_risk_param_str);
        lpPubMsg->SetString(LDBIZ_RISK_RULE_CALC_STR_STR,v_risk_rule_calc_str);
        lpPubMsg->SetInt32(LDBIZ_RULE_FLAG_INT,v_rule_flag);
        lpPubMsg->SetInt32(LDBIZ_PUSH_TYPE_INT,v_push_type);
        lpPubMsg->SetInt32(LDBIZ_UNION_FLAG_INT,v_union_flag);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("risk.securule", lpPubMsg);

    }
    // else
    else
    {

        //调用过程[事务_风控证券_风控_查询主推客户风险规则记录]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.4.35", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req2->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
        lpTSCall1Req2->SetString(LDBIZ_EXCH_GROUP_NO_STR_STR,v_exch_group_no_str);
        lpTSCall1Req2->SetInt64(LDBIZ_MODEL_ID_INT64,v_model_id);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.35]subcall timed out!");
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
                v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
                strcpy(v_pd_no_str, lpRecord->GetString(LDBIZ_PD_NO_STR_STR));
                strcpy(v_exch_group_no_str, lpRecord->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR));
                v_dime_id = lpRecord->GetInt64(LDBIZ_DIME_ID_INT64);
                strcpy(v_trig_stage_type_str, lpRecord->GetString(LDBIZ_TRIG_STAGE_TYPE_STR_STR));
                v_compli_calc_level = lpRecord->GetInt32(LDBIZ_COMPLI_CALC_LEVEL_INT);
                v_trig_type = lpRecord->GetInt32(LDBIZ_TRIG_TYPE_INT);
                v_model_id = lpRecord->GetInt64(LDBIZ_MODEL_ID_INT64);
                v_risk_item_id = lpRecord->GetInt32(LDBIZ_RISK_ITEM_ID_INT);
                strcpy(v_risk_rule_code, lpRecord->GetString(LDBIZ_RISK_RULE_CODE_STR));
                strcpy(v_risk_param_str, lpRecord->GetString(LDBIZ_RISK_PARAM_STR_STR));
                v_rule_flag = lpRecord->GetInt32(LDBIZ_RULE_FLAG_INT);
                v_union_flag = lpRecord->GetInt32(LDBIZ_UNION_FLAG_INT);
                v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


              // set @风险计算值串# = "";
              strcpy(v_risk_rule_calc_str,"");

              // set @风险条目序号串# = "";
              strcpy(v_risk_item_id_str,"");

              // set @主推类型# = 1;
              v_push_type = 1;

           // [主动推送][risk.securule][风控主推_规则_证券客户风险规则主推消息]
           lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.140", 0);
           lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
           lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
           lpPubMsg->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
           lpPubMsg->SetString(LDBIZ_EXCH_GROUP_NO_STR_STR,v_exch_group_no_str);
           lpPubMsg->SetInt64(LDBIZ_DIME_ID_INT64,v_dime_id);
           lpPubMsg->SetString(LDBIZ_TRIG_STAGE_TYPE_STR_STR,v_trig_stage_type_str);
           lpPubMsg->SetInt32(LDBIZ_COMPLI_CALC_LEVEL_INT,v_compli_calc_level);
           lpPubMsg->SetInt32(LDBIZ_TRIG_TYPE_INT,v_trig_type);
           lpPubMsg->SetInt64(LDBIZ_MODEL_ID_INT64,v_model_id);
           lpPubMsg->SetInt32(LDBIZ_RISK_ITEM_ID_INT,v_risk_item_id);
           lpPubMsg->SetString(LDBIZ_RISK_ITEM_ID_STR_STR,v_risk_item_id_str);
           lpPubMsg->SetString(LDBIZ_RISK_RULE_CODE_STR,v_risk_rule_code);
           lpPubMsg->SetString(LDBIZ_RISK_PARAM_STR_STR,v_risk_param_str);
           lpPubMsg->SetString(LDBIZ_RISK_RULE_CALC_STR_STR,v_risk_rule_calc_str);
           lpPubMsg->SetInt32(LDBIZ_RULE_FLAG_INT,v_rule_flag);
           lpPubMsg->SetInt32(LDBIZ_PUSH_TYPE_INT,v_push_type);
           lpPubMsg->SetInt32(LDBIZ_UNION_FLAG_INT,v_union_flag);
           lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
           glpPubSub_Interface->PubTopics("risk.securule", lpPubMsg);


        // [遍历结果集结束][lpMainMsg]
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
    lpOutBizMsg->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpOutBizMsg->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpOutBizMsg->SetInt64(LDBIZ_DIME_ID_INT64,v_dime_id);
    lpOutBizMsg->SetString(LDBIZ_TRIG_STAGE_TYPE_STR_STR,v_trig_stage_type_str);
    lpOutBizMsg->SetInt32(LDBIZ_COMPLI_CALC_LEVEL_INT,v_compli_calc_level);
    lpOutBizMsg->SetInt32(LDBIZ_UNIT_NAV_FLAG_INT,v_unit_nav_flag);
    lpOutBizMsg->SetInt32(LDBIZ_TRIG_TYPE_INT,v_trig_type);
    lpOutBizMsg->SetString(LDBIZ_COMPLI_RULES_REMARK_STR,v_compli_rules_remark);
    lpOutBizMsg->SetInt32(LDBIZ_RISK_RULE_ID_INT,v_risk_rule_id);
    lpOutBizMsg->SetInt32(LDBIZ_RISK_RULE_TYPE_INT,v_risk_rule_type);
    lpOutBizMsg->SetString(LDBIZ_RISK_RULE_NAME_STR,v_risk_rule_name);
    lpOutBizMsg->SetString(LDBIZ_RISK_RULE_CODE_STR,v_risk_rule_code);
    lpOutBizMsg->SetString(LDBIZ_RISK_PARAM_STR_STR,v_risk_param_str);
    lpOutBizMsg->SetString(LDBIZ_RISK_RULE_VALUE_STR1_STR,v_risk_rule_value_str1);
    lpOutBizMsg->SetString(LDBIZ_RISK_RULE_ACTION1_STR,v_risk_rule_action1);
    lpOutBizMsg->SetString(LDBIZ_RISK_RULE_VALUE_STR2_STR,v_risk_rule_value_str2);
    lpOutBizMsg->SetString(LDBIZ_RISK_RULE_ACTION2_STR,v_risk_rule_action2);
    lpOutBizMsg->SetString(LDBIZ_RISK_RULE_VALUE_STR3_STR,v_risk_rule_value_str3);
    lpOutBizMsg->SetString(LDBIZ_RISK_RULE_ACTION3_STR,v_risk_rule_action3);
    lpOutBizMsg->SetString(LDBIZ_RISK_RULE_VALUE_STR4_STR,v_risk_rule_value_str4);
    lpOutBizMsg->SetString(LDBIZ_RISK_RULE_ACTION4_STR,v_risk_rule_action4);
    lpOutBizMsg->SetString(LDBIZ_CORRSP_PLUG_STR,v_corrsp_plug);
    lpOutBizMsg->SetInt32(LDBIZ_BEGIN_TIME_INT,v_begin_time);
    lpOutBizMsg->SetInt32(LDBIZ_END_TIME_INT,v_end_time);
    lpOutBizMsg->SetInt32(LDBIZ_RULE_FLAG_INT,v_rule_flag);
    lpOutBizMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
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

//逻辑_风控证券_风控_删除客户风险规则记录
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
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    int64 v_model_id;
    char v_risk_item_id_str[2049];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_row_id;
    char v_risk_param_str[2049];
    int v_push_type;
    int64 v_dime_id;
    char v_trig_stage_type_str[65];
    int v_compli_calc_level;
    int v_trig_type;
    int v_risk_item_id;
    char v_risk_rule_code[2049];
    char v_risk_rule_calc_str[256];
    int v_rule_flag;
    int v_update_times;
    int v_union_flag;
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
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    v_model_id=0;
    strcpy(v_risk_item_id_str, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_row_id=0;
    strcpy(v_risk_param_str, " ");
    v_push_type=0;
    v_dime_id=0;
    strcpy(v_trig_stage_type_str, " ");
    v_compli_calc_level=0;
    v_trig_type=0;
    v_risk_item_id=0;
    strcpy(v_risk_rule_code, " ");
    strcpy(v_risk_rule_calc_str, " ");
    v_rule_flag=0;
    v_update_times=1;
    v_union_flag=0;
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
    strncpy(v_pd_no_str, lpInBizMsg->GetString(LDBIZ_PD_NO_STR_STR),2048);
    v_pd_no_str[2048] = '\0';
    strncpy(v_exch_group_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR),2048);
    v_exch_group_no_str[2048] = '\0';
    v_model_id = lpInBizMsg->GetInt64(LDBIZ_MODEL_ID_INT64);
    strncpy(v_risk_item_id_str, lpInBizMsg->GetString(LDBIZ_RISK_ITEM_ID_STR_STR),2048);
    v_risk_item_id_str[2048] = '\0';

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

    //set @记录序号// = 0;
    //调用过程[事务_风控证券_风控_删除客户风险规则记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.2", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_STR_STR,v_exch_group_no_str);
    lpTSCall1Req1->SetInt64(LDBIZ_MODEL_ID_INT64,v_model_id);
    lpTSCall1Req1->SetString(LDBIZ_RISK_ITEM_ID_STR_STR,v_risk_item_id_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.2]subcall timed out!");
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
    strcpy(v_risk_param_str, lpTSCall1Ans1->GetString(LDBIZ_RISK_PARAM_STR_STR));


    // set @主推类型# = 2;
    v_push_type = 2;
    //set @记录序号// = 0;

    // set @产品编号串# = " ";
    strcpy(v_pd_no_str," ");

    // set @交易组编号串# = " ";
    strcpy(v_exch_group_no_str," ");

    // set @维度序号# = 0;
    v_dime_id = 0;

    // set @触发阶段类型串# = " ";
    strcpy(v_trig_stage_type_str," ");

    // set @合规计算层级# = 0;
    v_compli_calc_level = 0;

    // set @触发方向# = 0;
    v_trig_type = 0;

    // set @风险条目序号# = 0;
    v_risk_item_id = 0;

    // set @风险规则代码# = " ";
    strcpy(v_risk_rule_code," ");
    //借用风险要素串保存要删除的记录id串
    //set @风险要素串// = " ";

    // set @风险计算值串# = " ";
    strcpy(v_risk_rule_calc_str," ");

    // set @启用标志# = 0;
    v_rule_flag = 0;

    // set @更新次数# = 0;
    v_update_times = 0;

    // set @联合标志# = 0;
    v_union_flag = 0;

    // [主动推送][risk.securule][风控主推_规则_证券客户风险规则主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.140", 0);
    lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpPubMsg->SetString(LDBIZ_EXCH_GROUP_NO_STR_STR,v_exch_group_no_str);
    lpPubMsg->SetInt64(LDBIZ_DIME_ID_INT64,v_dime_id);
    lpPubMsg->SetString(LDBIZ_TRIG_STAGE_TYPE_STR_STR,v_trig_stage_type_str);
    lpPubMsg->SetInt32(LDBIZ_COMPLI_CALC_LEVEL_INT,v_compli_calc_level);
    lpPubMsg->SetInt32(LDBIZ_TRIG_TYPE_INT,v_trig_type);
    lpPubMsg->SetInt64(LDBIZ_MODEL_ID_INT64,v_model_id);
    lpPubMsg->SetInt32(LDBIZ_RISK_ITEM_ID_INT,v_risk_item_id);
    lpPubMsg->SetString(LDBIZ_RISK_ITEM_ID_STR_STR,v_risk_item_id_str);
    lpPubMsg->SetString(LDBIZ_RISK_RULE_CODE_STR,v_risk_rule_code);
    lpPubMsg->SetString(LDBIZ_RISK_PARAM_STR_STR,v_risk_param_str);
    lpPubMsg->SetString(LDBIZ_RISK_RULE_CALC_STR_STR,v_risk_rule_calc_str);
    lpPubMsg->SetInt32(LDBIZ_RULE_FLAG_INT,v_rule_flag);
    lpPubMsg->SetInt32(LDBIZ_PUSH_TYPE_INT,v_push_type);
    lpPubMsg->SetInt32(LDBIZ_UNION_FLAG_INT,v_union_flag);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("risk.securule", lpPubMsg);


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

//逻辑_风控证券_风控_查询客户风险规则记录
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
    int64 v_model_id;
    char v_risk_item_id_str[2049];
    char v_risk_rule_type_str[65];
    int v_trig_stage_type;
    int v_templ_flag;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    char v_exch_no_str[2049];
    char v_order_dir_str[1025];
    int64 v_dime_id;
    char v_trig_stage_type_str[65];
    int v_compli_calc_level;
    int v_unit_nav_flag;
    int v_trig_type;
    int v_risk_item_id;
    char v_compli_rules_remark[256];
    int v_risk_rule_id;
    int v_risk_rule_type;
    char v_risk_rule_name[65];
    char v_risk_rule_code[2049];
    char v_risk_param_str[2049];
    char v_risk_rule_value_str1[256];
    char v_risk_rule_action1[33];
    char v_risk_rule_value_str2[256];
    char v_risk_rule_action2[33];
    char v_risk_rule_value_str3[256];
    char v_risk_rule_action3[33];
    char v_risk_rule_value_str4[256];
    char v_risk_rule_action4[33];
    char v_corrsp_plug[65];
    int v_begin_time;
    int v_end_time;
    int v_rule_flag;
    int v_union_flag;
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
    v_model_id=0;
    strcpy(v_risk_item_id_str, " ");
    strcpy(v_risk_rule_type_str, " ");
    v_trig_stage_type=0;
    v_templ_flag=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_row_id=0;
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    strcpy(v_exch_no_str, " ");
    strcpy(v_order_dir_str, " ");
    v_dime_id=0;
    strcpy(v_trig_stage_type_str, " ");
    v_compli_calc_level=0;
    v_unit_nav_flag=0;
    v_trig_type=0;
    v_risk_item_id=0;
    strcpy(v_compli_rules_remark, " ");
    v_risk_rule_id=0;
    v_risk_rule_type=0;
    strcpy(v_risk_rule_name, " ");
    strcpy(v_risk_rule_code, " ");
    strcpy(v_risk_param_str, " ");
    strcpy(v_risk_rule_value_str1, " ");
    strcpy(v_risk_rule_action1, " ");
    strcpy(v_risk_rule_value_str2, " ");
    strcpy(v_risk_rule_action2, " ");
    strcpy(v_risk_rule_value_str3, " ");
    strcpy(v_risk_rule_action3, " ");
    strcpy(v_risk_rule_value_str4, " ");
    strcpy(v_risk_rule_action4, " ");
    strcpy(v_corrsp_plug, " ");
    v_begin_time=0;
    v_end_time=0;
    v_rule_flag=0;
    v_union_flag=0;
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
    v_model_id = lpInBizMsg->GetInt64(LDBIZ_MODEL_ID_INT64);
    strncpy(v_risk_item_id_str, lpInBizMsg->GetString(LDBIZ_RISK_ITEM_ID_STR_STR),2048);
    v_risk_item_id_str[2048] = '\0';
    strncpy(v_risk_rule_type_str, lpInBizMsg->GetString(LDBIZ_RISK_RULE_TYPE_STR_STR),64);
    v_risk_rule_type_str[64] = '\0';
    v_trig_stage_type = lpInBizMsg->GetInt32(LDBIZ_TRIG_STAGE_TYPE_INT);
    v_templ_flag = lpInBizMsg->GetInt32(LDBIZ_TEMPL_FLAG_INT);
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

    //调用过程[事务_风控证券_风控_查询客户风险规则记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.3", 0);
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
    lpTSCall1Req1->SetInt64(LDBIZ_MODEL_ID_INT64,v_model_id);
    lpTSCall1Req1->SetString(LDBIZ_RISK_ITEM_ID_STR_STR,v_risk_item_id_str);
    lpTSCall1Req1->SetString(LDBIZ_RISK_RULE_TYPE_STR_STR,v_risk_rule_type_str);
    lpTSCall1Req1->SetInt32(LDBIZ_TRIG_STAGE_TYPE_INT,v_trig_stage_type);
    lpTSCall1Req1->SetInt32(LDBIZ_TEMPL_FLAG_INT,v_templ_flag);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.3]subcall timed out!");
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

//逻辑_风控证券_风控_静态风险合规判断
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
    int v_co_no;
    char v_client_risk_rule_id_str[2049];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_client_risk_rule_id;
    int v_pd_no;
    int v_exch_group_no;
    char v_compli_rules_remark[256];
    char v_risk_rule_action[33];
    char v_risk_rule_value_str[256];
    char v_risk_rule_calc_str[256];
    char v_remark_info[256];
    char v_pd_no_str[2049];
    int64 v_dime_id;
    int v_stock_code_no;
    int v_risk_rule_type;
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
    strcpy(v_client_risk_rule_id_str, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_client_risk_rule_id=0;
    v_pd_no=0;
    v_exch_group_no=0;
    strcpy(v_compli_rules_remark, " ");
    strcpy(v_risk_rule_action, " ");
    strcpy(v_risk_rule_value_str, " ");
    strcpy(v_risk_rule_calc_str, " ");
    strcpy(v_remark_info, " ");
    strcpy(v_pd_no_str, " ");
    v_dime_id=0;
    v_stock_code_no=0;
    v_risk_rule_type=0;
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
    strncpy(v_client_risk_rule_id_str, lpInBizMsg->GetString(LDBIZ_CLIENT_RISK_RULE_ID_STR_STR),2048);
    v_client_risk_rule_id_str[2048] = '\0';

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

    //调用过程[事务_风控证券_风控_静态风险合规判断]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.4", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_CLIENT_RISK_RULE_ID_STR_STR,v_client_risk_rule_id_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 30000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.4]subcall timed out!");
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

//逻辑_风控证券_风控_客户风险触警流水查询
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
    int v_create_date;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    char v_risk_rule_action[33];
    int v_risk_rule_type;
    int v_trig_stage_type;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_create_time;
    int v_risk_item_id;
    int v_order_dir;
    int64 v_dime_id;
    int v_compli_calc_level;
    int v_unit_nav_flag;
    int v_trig_type;
    char v_compli_rules_remark[256];
    char v_risk_rule_value_str[256];
    char v_risk_rule_calc_str[256];
    char v_remark_info[256];
    char v_pd_no_str[2049];
    int v_stock_code_no;
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
    v_create_date=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    strcpy(v_risk_rule_action, " ");
    v_risk_rule_type=0;
    v_trig_stage_type=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_create_time=0;
    v_risk_item_id=0;
    v_order_dir=0;
    v_dime_id=0;
    v_compli_calc_level=0;
    v_unit_nav_flag=0;
    v_trig_type=0;
    strcpy(v_compli_rules_remark, " ");
    strcpy(v_risk_rule_value_str, " ");
    strcpy(v_risk_rule_calc_str, " ");
    strcpy(v_remark_info, " ");
    strcpy(v_pd_no_str, " ");
    v_stock_code_no=0;
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
    v_create_date = lpInBizMsg->GetInt32(LDBIZ_CREATE_DATE_INT);
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    strncpy(v_risk_rule_action, lpInBizMsg->GetString(LDBIZ_RISK_RULE_ACTION_STR),32);
    v_risk_rule_action[32] = '\0';
    v_risk_rule_type = lpInBizMsg->GetInt32(LDBIZ_RISK_RULE_TYPE_INT);
    v_trig_stage_type = lpInBizMsg->GetInt32(LDBIZ_TRIG_STAGE_TYPE_INT);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //[事务_公共_公共接口_检查系统状态权限身份]

    // set @业务控制串# = "011";
    strcpy(v_busi_ctrl_str,"011");
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

    //调用过程[事务_风控证券_风控_客户风险触警流水查询]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.5", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CREATE_DATE_INT,v_create_date);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt32(LDBIZ_TRIG_STAGE_TYPE_INT,v_trig_stage_type);
    lpTSCall1Req1->SetString(LDBIZ_RISK_RULE_ACTION_STR,v_risk_rule_action);
    lpTSCall1Req1->SetInt32(LDBIZ_RISK_RULE_TYPE_INT,v_risk_rule_type);
    lpTSCall1Req1->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.5]subcall timed out!");
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

//逻辑_风控证券_风控_模板查询客户产品交易组
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
    int64 v_model_id;
    char v_risk_rule_type_str[65];
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
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
    v_model_id=0;
    strcpy(v_risk_rule_type_str, " ");
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
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
    v_model_id = lpInBizMsg->GetInt64(LDBIZ_MODEL_ID_INT64);
    strncpy(v_risk_rule_type_str, lpInBizMsg->GetString(LDBIZ_RISK_RULE_TYPE_STR_STR),64);
    v_risk_rule_type_str[64] = '\0';
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

    //调用过程[事务_风控证券_风控_模板查询客户产品交易组]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.6", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt64(LDBIZ_MODEL_ID_INT64,v_model_id);
    lpTSCall1Req1->SetString(LDBIZ_RISK_RULE_TYPE_STR_STR,v_risk_rule_type_str);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.6]subcall timed out!");
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

//逻辑_风控证券_风控_试算检查客户风险
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
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    int v_trig_stage_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_client_risk_rule_id;
    char v_compli_rules_remark[256];
    char v_risk_rule_action[33];
    char v_risk_rule_value_str[256];
    char v_risk_rule_calc_str[256];
    char v_remark_info[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    double v_all_fee;
    int v_stock_type;
    int v_asset_type;
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
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_trig_stage_type=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_client_risk_rule_id=0;
    strcpy(v_compli_rules_remark, " ");
    strcpy(v_risk_rule_action, " ");
    strcpy(v_risk_rule_value_str, " ");
    strcpy(v_risk_rule_calc_str, " ");
    strcpy(v_remark_info, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_all_fee=0;
    v_stock_type=0;
    v_asset_type=0;
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
    v_order_dir = lpInBizMsg->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_order_price = lpInBizMsg->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpInBizMsg->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_trig_stage_type = lpInBizMsg->GetInt32(LDBIZ_TRIG_STAGE_TYPE_INT);

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


    // set @全部费用# = 0;
    v_all_fee = 0;

    // if @订单方向# = 《订单方向-买入》 then
    if (v_order_dir == 1)
    {
       //调用过程[事务_公共_风控接口_计算证券订单费用]
       //组织事务请求
       if(lpTSCall1Ans1)
       {
         lpTSCall1Ans1->FreeMsg();
         lpTSCall1Ans1=NULL;
       }
       lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.27.2", 0);
       lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
       lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
       lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
       lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
       lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
       lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
       lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
       lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
       lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
       lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
       lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
       lpTSCall1Req1->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
       lpTSCall1Req1->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
       lpTSCall1Req1->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
       glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
       if(!lpTSCall1Ans1)  //  超时错误
       {
           lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
           lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.27.2]subcall timed out!");
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
       v_all_fee = lpTSCall1Ans1->GetDouble(LDBIZ_ALL_FEE_FLOAT);
       v_stock_type = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_TYPE_INT);
       v_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_TYPE_INT);

    // end if;
    }

    //调用过程[事务_风控证券_风控_试算检查客户风险]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.4.7", 0);
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
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req2->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req2->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req2->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req2->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpTSCall1Req2->SetInt32(LDBIZ_TRIG_STAGE_TYPE_INT,v_trig_stage_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.7]subcall timed out!");
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


    lpOutBizMsg->FillWithAnotherMsg(lpTSCall1Ans2);
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

//逻辑_风控证券_风控_新增账户风险监控设置
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
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    char v_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_row_id;
    int64 v_moni_set_id;
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
    char v_moni_set_status[3];
    double v_cash_asset;
    double v_fund_asset;
    double v_bond_asset;
    double v_stock_asset;
    double v_repo_asset;
    double v_nav_asset;
    double v_stock_asset_ratio;
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
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_close_posi_flag=0;
    v_close_ratio_level_one=0;
    v_close_ratio_level_two=0;
    v_close_ratio_level_three=0;
    strcpy(v_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_row_id=0;
    v_moni_set_id=0;
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
    strcpy(v_moni_set_status, " ");
    v_cash_asset=0;
    v_fund_asset=0;
    v_bond_asset=0;
    v_stock_asset=0;
    v_repo_asset=0;
    v_nav_asset=0;
    v_stock_asset_ratio=0;
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    strncpy(v_pd_no_str, lpInBizMsg->GetString(LDBIZ_PD_NO_STR_STR),2048);
    v_pd_no_str[2048] = '\0';
    strncpy(v_exch_group_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR),2048);
    v_exch_group_no_str[2048] = '\0';
    v_moni_role_type = lpInBizMsg->GetInt32(LDBIZ_MONI_ROLE_TYPE_INT);
    v_moni_value_flag = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
    v_moni_value_type = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
    v_warn_posi_value = lpInBizMsg->GetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT);
    v_warn_trig_oper_type = lpInBizMsg->GetInt32(LDBIZ_WARN_TRIG_OPER_TYPE_INT);
    v_close_posi_value = lpInBizMsg->GetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT);
    v_close_trig_oper_type = lpInBizMsg->GetInt32(LDBIZ_CLOSE_TRIG_OPER_TYPE_INT);
    v_appd_value = lpInBizMsg->GetDouble(LDBIZ_APPD_VALUE_FLOAT);
    v_appd_trig_oper_type = lpInBizMsg->GetInt32(LDBIZ_APPD_TRIG_OPER_TYPE_INT);
    v_begin_moni_date = lpInBizMsg->GetInt32(LDBIZ_BEGIN_MONI_DATE_INT);
    v_begin_moni_value = lpInBizMsg->GetDouble(LDBIZ_BEGIN_MONI_VALUE_FLOAT);
    v_max_moni_value = lpInBizMsg->GetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT);
    strncpy(v_contrs_stock_code, lpInBizMsg->GetString(LDBIZ_CONTRS_STOCK_CODE_STR),6);
    v_contrs_stock_code[6] = '\0';
    v_contrs_exch_no = lpInBizMsg->GetInt32(LDBIZ_CONTRS_EXCH_NO_INT);
    v_contrs_max_moni_value = lpInBizMsg->GetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
    v_close_posi_flag = lpInBizMsg->GetInt32(LDBIZ_CLOSE_POSI_FLAG_INT);
    v_close_ratio_level_one = lpInBizMsg->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
    v_close_ratio_level_two = lpInBizMsg->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
    v_close_ratio_level_three = lpInBizMsg->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
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

    //调用过程[事务_风控证券_风控_新增账户风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.8", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_STR_STR,v_exch_group_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_MONI_ROLE_TYPE_INT,v_moni_role_type);
    lpTSCall1Req1->SetInt32(LDBIZ_MONI_VALUE_FLAG_INT,v_moni_value_flag);
    lpTSCall1Req1->SetInt32(LDBIZ_MONI_VALUE_TYPE_INT,v_moni_value_type);
    lpTSCall1Req1->SetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT,v_warn_posi_value);
    lpTSCall1Req1->SetInt32(LDBIZ_WARN_TRIG_OPER_TYPE_INT,v_warn_trig_oper_type);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT,v_close_posi_value);
    lpTSCall1Req1->SetInt32(LDBIZ_CLOSE_TRIG_OPER_TYPE_INT,v_close_trig_oper_type);
    lpTSCall1Req1->SetDouble(LDBIZ_APPD_VALUE_FLOAT,v_appd_value);
    lpTSCall1Req1->SetInt32(LDBIZ_APPD_TRIG_OPER_TYPE_INT,v_appd_trig_oper_type);
    lpTSCall1Req1->SetInt32(LDBIZ_BEGIN_MONI_DATE_INT,v_begin_moni_date);
    lpTSCall1Req1->SetDouble(LDBIZ_BEGIN_MONI_VALUE_FLOAT,v_begin_moni_value);
    lpTSCall1Req1->SetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT,v_max_moni_value);
    lpTSCall1Req1->SetString(LDBIZ_CONTRS_STOCK_CODE_STR,v_contrs_stock_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRS_EXCH_NO_INT,v_contrs_exch_no);
    lpTSCall1Req1->SetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT,v_contrs_max_moni_value);
    lpTSCall1Req1->SetInt32(LDBIZ_CLOSE_POSI_FLAG_INT,v_close_posi_flag);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT,v_close_ratio_level_one);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT,v_close_ratio_level_two);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT,v_close_ratio_level_three);
    lpTSCall1Req1->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.8]subcall timed out!");
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


    // set @监控设置序号# = @记录序号#;
    v_moni_set_id = v_row_id;
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

//逻辑_风控证券_风控_修改账户风险监控设置
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
    int64 v_moni_set_id;
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
    double v_curr_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    int v_trig_oper_type;
    char v_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_update_times;
    int64 v_row_id;
    double v_curr_result_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
    char v_moni_set_status[3];
    double v_cash_asset;
    double v_fund_asset;
    double v_bond_asset;
    double v_stock_asset;
    double v_repo_asset;
    double v_nav_asset;
    double v_stock_asset_ratio;
    int v_time_stamp;
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
    v_curr_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_close_posi_flag=0;
    v_close_ratio_level_one=0;
    v_close_ratio_level_two=0;
    v_close_ratio_level_three=0;
    v_trig_oper_type=0;
    strcpy(v_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_update_times=1;
    v_row_id=0;
    v_curr_result_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
    strcpy(v_moni_set_status, " ");
    v_cash_asset=0;
    v_fund_asset=0;
    v_bond_asset=0;
    v_stock_asset=0;
    v_repo_asset=0;
    v_nav_asset=0;
    v_stock_asset_ratio=0;
    v_time_stamp=0;
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    strncpy(v_pd_no_str, lpInBizMsg->GetString(LDBIZ_PD_NO_STR_STR),2048);
    v_pd_no_str[2048] = '\0';
    strncpy(v_exch_group_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR),2048);
    v_exch_group_no_str[2048] = '\0';
    v_moni_role_type = lpInBizMsg->GetInt32(LDBIZ_MONI_ROLE_TYPE_INT);
    v_moni_value_flag = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
    v_moni_value_type = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
    v_warn_posi_value = lpInBizMsg->GetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT);
    v_warn_trig_oper_type = lpInBizMsg->GetInt32(LDBIZ_WARN_TRIG_OPER_TYPE_INT);
    v_close_posi_value = lpInBizMsg->GetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT);
    v_close_trig_oper_type = lpInBizMsg->GetInt32(LDBIZ_CLOSE_TRIG_OPER_TYPE_INT);
    v_appd_value = lpInBizMsg->GetDouble(LDBIZ_APPD_VALUE_FLOAT);
    v_appd_trig_oper_type = lpInBizMsg->GetInt32(LDBIZ_APPD_TRIG_OPER_TYPE_INT);
    v_begin_moni_date = lpInBizMsg->GetInt32(LDBIZ_BEGIN_MONI_DATE_INT);
    v_begin_moni_value = lpInBizMsg->GetDouble(LDBIZ_BEGIN_MONI_VALUE_FLOAT);
    v_max_moni_value = lpInBizMsg->GetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT);
    v_curr_moni_value = lpInBizMsg->GetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT);
    strncpy(v_contrs_stock_code, lpInBizMsg->GetString(LDBIZ_CONTRS_STOCK_CODE_STR),6);
    v_contrs_stock_code[6] = '\0';
    v_contrs_exch_no = lpInBizMsg->GetInt32(LDBIZ_CONTRS_EXCH_NO_INT);
    v_contrs_max_moni_value = lpInBizMsg->GetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
    v_close_posi_flag = lpInBizMsg->GetInt32(LDBIZ_CLOSE_POSI_FLAG_INT);
    v_close_ratio_level_one = lpInBizMsg->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
    v_close_ratio_level_two = lpInBizMsg->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
    v_close_ratio_level_three = lpInBizMsg->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
    v_trig_oper_type = lpInBizMsg->GetInt32(LDBIZ_TRIG_OPER_TYPE_INT);
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

    //调用过程[事务_风控证券_风控_修改账户风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.9", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_GROUP_NO_STR_STR,v_exch_group_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_MONI_ROLE_TYPE_INT,v_moni_role_type);
    lpTSCall1Req1->SetInt32(LDBIZ_MONI_VALUE_FLAG_INT,v_moni_value_flag);
    lpTSCall1Req1->SetInt32(LDBIZ_MONI_VALUE_TYPE_INT,v_moni_value_type);
    lpTSCall1Req1->SetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT,v_warn_posi_value);
    lpTSCall1Req1->SetInt32(LDBIZ_WARN_TRIG_OPER_TYPE_INT,v_warn_trig_oper_type);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT,v_close_posi_value);
    lpTSCall1Req1->SetInt32(LDBIZ_CLOSE_TRIG_OPER_TYPE_INT,v_close_trig_oper_type);
    lpTSCall1Req1->SetDouble(LDBIZ_APPD_VALUE_FLOAT,v_appd_value);
    lpTSCall1Req1->SetInt32(LDBIZ_APPD_TRIG_OPER_TYPE_INT,v_appd_trig_oper_type);
    lpTSCall1Req1->SetInt32(LDBIZ_BEGIN_MONI_DATE_INT,v_begin_moni_date);
    lpTSCall1Req1->SetDouble(LDBIZ_BEGIN_MONI_VALUE_FLOAT,v_begin_moni_value);
    lpTSCall1Req1->SetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT,v_max_moni_value);
    lpTSCall1Req1->SetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT,v_curr_moni_value);
    lpTSCall1Req1->SetString(LDBIZ_CONTRS_STOCK_CODE_STR,v_contrs_stock_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRS_EXCH_NO_INT,v_contrs_exch_no);
    lpTSCall1Req1->SetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT,v_contrs_max_moni_value);
    lpTSCall1Req1->SetInt32(LDBIZ_CLOSE_POSI_FLAG_INT,v_close_posi_flag);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT,v_close_ratio_level_one);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT,v_close_ratio_level_two);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT,v_close_ratio_level_three);
    lpTSCall1Req1->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.9]subcall timed out!");
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
    v_update_times = lpTSCall1Ans1->GetInt32(LDBIZ_UPDATE_TIMES_INT);

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

//逻辑_风控证券_风控_删除账户风险监控设置
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
    int64 v_moni_set_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_row_id;
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
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
    char v_moni_set_status[3];
    double v_cash_asset;
    double v_fund_asset;
    double v_bond_asset;
    double v_stock_asset;
    double v_repo_asset;
    double v_nav_asset;
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
    v_co_no=0;
    v_moni_set_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_row_id=0;
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
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
    strcpy(v_moni_set_status, " ");
    v_cash_asset=0;
    v_fund_asset=0;
    v_bond_asset=0;
    v_stock_asset=0;
    v_repo_asset=0;
    v_nav_asset=0;
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_moni_set_id = lpInBizMsg->GetInt64(LDBIZ_MONI_SET_ID_INT64);

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

    //调用过程[事务_风控证券_风控_删除账户风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.10", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.10]subcall timed out!");
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


    // set @主推类型# = 2;
    v_push_type = 2;

    // set @记录序号# = @监控设置序号#;
    v_row_id = v_moni_set_id;

    // set @机构编号# = 0;
    v_co_no = 0;

    // set @产品编号串# = " ";
    strcpy(v_pd_no_str," ");

    // set @交易组编号串# = " ";
    strcpy(v_exch_group_no_str," ");

    // set @监控值方式# = 0;
    v_moni_value_flag = 0;

    // set @监控值类型# = 0;
    v_moni_value_type = 0;

    // set @对比证券代码# = 0;
    strcpy(v_contrs_stock_code,"0");

    // set @对比市场编号# = 0;
    v_contrs_exch_no = 0;

    // set @更新次数# = 0;
    v_update_times = 0;

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

//逻辑_风控证券_风控_查询账户风险监控设置
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
    int v_exch_group_no;
    int v_moni_role_type;
    int v_moni_value_flag;
    int v_moni_value_type;
    char v_moni_set_status[3];
    char v_moni_result_status[3];
    int v_sort_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    double v_warn_posi_value;
    int v_warn_trig_oper_type;
    double v_close_posi_value;
    int v_close_trig_oper_type;
    double v_appd_value;
    int v_appd_trig_oper_type;
    int v_begin_moni_date;
    double v_begin_moni_value;
    double v_max_moni_value;
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    double v_cash_asset;
    double v_fund_asset;
    double v_bond_asset;
    double v_stock_asset;
    double v_repo_asset;
    double v_nav_asset;
    double v_stock_asset_ratio;
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    char v_remark_info[256];
    double v_pd_share;
    double v_begin_asset_value;
    double v_hk_thrgh_stock_asset;
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_busi_ctrl_str[65];
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
    v_moni_role_type=0;
    v_moni_value_flag=0;
    v_moni_value_type=0;
    strcpy(v_moni_set_status, " ");
    strcpy(v_moni_result_status, " ");
    v_sort_type=1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_row_id=0;
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    v_warn_posi_value=0;
    v_warn_trig_oper_type=0;
    v_close_posi_value=0;
    v_close_trig_oper_type=0;
    v_appd_value=0;
    v_appd_trig_oper_type=0;
    v_begin_moni_date=0;
    v_begin_moni_value=0;
    v_max_moni_value=0;
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    v_cash_asset=0;
    v_fund_asset=0;
    v_bond_asset=0;
    v_stock_asset=0;
    v_repo_asset=0;
    v_nav_asset=0;
    v_stock_asset_ratio=0;
    v_close_posi_flag=0;
    v_close_ratio_level_one=0;
    v_close_ratio_level_two=0;
    v_close_ratio_level_three=0;
    strcpy(v_remark_info, " ");
    v_pd_share=0;
    v_begin_asset_value=0;
    v_hk_thrgh_stock_asset=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_busi_ctrl_str, " ");
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
    v_moni_role_type = lpInBizMsg->GetInt32(LDBIZ_MONI_ROLE_TYPE_INT);
    v_moni_value_flag = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
    v_moni_value_type = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
    strncpy(v_moni_set_status, lpInBizMsg->GetString(LDBIZ_MONI_SET_STATUS_STR),2);
    v_moni_set_status[2] = '\0';
    strncpy(v_moni_result_status, lpInBizMsg->GetString(LDBIZ_MONI_RESULT_STATUS_STR),2);
    v_moni_result_status[2] = '\0';
    v_sort_type = lpInBizMsg->GetInt32(LDBIZ_SORT_TYPE_INT);

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


    // set @业务控制串#="111";
    strcpy(v_busi_ctrl_str,"111");
    //调用过程[事务_公共_公共接口_获取操作员操作权限串]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.24.2", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetString(LDBIZ_BUSI_CTRL_STR_STR,v_busi_ctrl_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.2]subcall timed out!");
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
    strcpy(v_co_no_rights_str, lpTSCall1Ans1->GetString(LDBIZ_CO_NO_RIGHTS_STR_STR));
    strcpy(v_pd_no_rights_str, lpTSCall1Ans1->GetString(LDBIZ_PD_NO_RIGHTS_STR_STR));
    strcpy(v_exch_group_no_rights_str, lpTSCall1Ans1->GetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR));

    //调用过程[事务_风控证券_风控_查询账户风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.4.11", 0);
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
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_ROLE_TYPE_INT,v_moni_role_type);
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_VALUE_FLAG_INT,v_moni_value_flag);
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_VALUE_TYPE_INT,v_moni_value_type);
    lpTSCall1Req2->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    lpTSCall1Req2->SetString(LDBIZ_MONI_RESULT_STATUS_STR,v_moni_result_status);
    lpTSCall1Req2->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    lpTSCall1Req2->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req2->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req2->SetInt32(LDBIZ_SORT_TYPE_INT,v_sort_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.11]subcall timed out!");
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


    lpOutBizMsg->FillWithAnotherMsg(lpTSCall1Ans2);
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

//逻辑_风控证券_风控_启用账户风险监控设置
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
    int64 v_moni_set_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_moni_set_status[3];
    int64 v_row_id;
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
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
    double v_cash_asset;
    double v_fund_asset;
    double v_bond_asset;
    double v_stock_asset;
    double v_repo_asset;
    double v_nav_asset;
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
    v_co_no=0;
    v_moni_set_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_moni_set_status, " ");
    v_row_id=0;
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
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
    v_cash_asset=0;
    v_fund_asset=0;
    v_bond_asset=0;
    v_stock_asset=0;
    v_repo_asset=0;
    v_nav_asset=0;
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_moni_set_id = lpInBizMsg->GetInt64(LDBIZ_MONI_SET_ID_INT64);

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


    // set @监控设置状态# = "1";
    strcpy(v_moni_set_status,"1");
    //调用过程[事务_风控证券_风控_更新账户风险监控设置状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.12", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    lpTSCall1Req1->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.12]subcall timed out!");
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

//逻辑_风控证券_风控_暂停账户风险监控设置
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
    int64 v_moni_set_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_moni_set_status[3];
    int64 v_row_id;
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
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
    double v_cash_asset;
    double v_fund_asset;
    double v_bond_asset;
    double v_stock_asset;
    double v_repo_asset;
    double v_nav_asset;
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
    v_co_no=0;
    v_moni_set_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_moni_set_status, " ");
    v_row_id=0;
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
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
    v_cash_asset=0;
    v_fund_asset=0;
    v_bond_asset=0;
    v_stock_asset=0;
    v_repo_asset=0;
    v_nav_asset=0;
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_moni_set_id = lpInBizMsg->GetInt64(LDBIZ_MONI_SET_ID_INT64);

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


    // set @监控设置状态# = "2";
    strcpy(v_moni_set_status,"2");
    //调用过程[事务_风控证券_风控_更新账户风险监控设置状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.12", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    lpTSCall1Req1->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.12]subcall timed out!");
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

//逻辑_风控证券_风控_停止账户风险监控设置
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
    int v_co_no;
    int64 v_moni_set_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_moni_set_status[3];
    int64 v_row_id;
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
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
    double v_cash_asset;
    double v_fund_asset;
    double v_bond_asset;
    double v_stock_asset;
    double v_repo_asset;
    double v_nav_asset;
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
    v_co_no=0;
    v_moni_set_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_moni_set_status, " ");
    v_row_id=0;
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
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
    v_cash_asset=0;
    v_fund_asset=0;
    v_bond_asset=0;
    v_stock_asset=0;
    v_repo_asset=0;
    v_nav_asset=0;
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_moni_set_id = lpInBizMsg->GetInt64(LDBIZ_MONI_SET_ID_INT64);

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


    // set @监控设置状态# = "3";
    strcpy(v_moni_set_status,"3");
    //调用过程[事务_风控证券_风控_更新账户风险监控设置状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.12", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    lpTSCall1Req1->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.12]subcall timed out!");
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

//逻辑_风控证券_风控_启用所有账户风险监控设置
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
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_moni_set_status[3];
    int v_pd_no;
    int v_exch_group_no;
    int v_moni_role_type;
    int v_moni_value_flag;
    int v_moni_value_type;
    char v_moni_result_status[3];
    char v_exch_group_no_rights_str[2049];
    char v_pd_no_rights_str[2049];
    char v_co_no_rights_str[2049];
    int v_sort_type;
    int v_push_type;
    int64 v_row_id;
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    double v_warn_posi_value;
    int v_warn_trig_oper_type;
    double v_close_posi_value;
    int v_close_trig_oper_type;
    double v_appd_value;
    int v_appd_trig_oper_type;
    int v_begin_moni_date;
    double v_begin_moni_value;
    double v_max_moni_value;
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    double v_cash_asset;
    double v_fund_asset;
    double v_bond_asset;
    double v_stock_asset;
    double v_repo_asset;
    double v_nav_asset;
    double v_stock_asset_ratio;
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    char v_remark_info[256];
    int v_time_stamp;
    int v_update_times;
    double v_pd_share;
    double v_begin_asset_value;
    double v_hk_thrgh_stock_asset;
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
    v_co_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_moni_set_status, " ");
    v_pd_no=0;
    v_exch_group_no=0;
    v_moni_role_type=0;
    v_moni_value_flag=0;
    v_moni_value_type=0;
    strcpy(v_moni_result_status, " ");
    strcpy(v_exch_group_no_rights_str, " ");
    strcpy(v_pd_no_rights_str, " ");
    strcpy(v_co_no_rights_str, " ");
    v_sort_type=1;
    v_push_type=0;
    v_row_id=0;
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    v_warn_posi_value=0;
    v_warn_trig_oper_type=0;
    v_close_posi_value=0;
    v_close_trig_oper_type=0;
    v_appd_value=0;
    v_appd_trig_oper_type=0;
    v_begin_moni_date=0;
    v_begin_moni_value=0;
    v_max_moni_value=0;
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    v_cash_asset=0;
    v_fund_asset=0;
    v_bond_asset=0;
    v_stock_asset=0;
    v_repo_asset=0;
    v_nav_asset=0;
    v_stock_asset_ratio=0;
    v_close_posi_flag=0;
    v_close_ratio_level_one=0;
    v_close_ratio_level_two=0;
    v_close_ratio_level_three=0;
    strcpy(v_remark_info, " ");
    v_time_stamp=0;
    v_update_times=1;
    v_pd_share=0;
    v_begin_asset_value=0;
    v_hk_thrgh_stock_asset=0;
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


    // set @监控设置状态# = "1";
    strcpy(v_moni_set_status,"1");
    //调用过程[事务_风控证券_风控_更新所有账户风险监控设置状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.13", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.13]subcall timed out!");
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


    // set @产品编号# = 0;
    v_pd_no = 0;

    // set @交易组编号# = 0;
    v_exch_group_no = 0;

    // set @监控角色# = 0;
    v_moni_role_type = 0;

    // set @监控值方式# = 0;
    v_moni_value_flag = 0;

    // set @监控值类型# = 0;
    v_moni_value_type = 0;

    // set @监控设置状态# = " ";
    strcpy(v_moni_set_status," ");

    // set @监控结果状态# = " ";
    strcpy(v_moni_result_status," ");

    // set @交易组编号权限串# = " ";
    strcpy(v_exch_group_no_rights_str," ");

    // set @产品编号权限串# = " ";
    strcpy(v_pd_no_rights_str," ");

    // set @机构编号权限串# = " ";
    strcpy(v_co_no_rights_str," ");

    // set @排序方式# = 1;
    v_sort_type = 1;

    // set @主推类型# = 1;
    v_push_type = 1;
    //调用过程[事务_风控证券_风控_查询账户风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.4.11", 0);
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
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_ROLE_TYPE_INT,v_moni_role_type);
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_VALUE_FLAG_INT,v_moni_value_flag);
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_VALUE_TYPE_INT,v_moni_value_type);
    lpTSCall1Req2->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    lpTSCall1Req2->SetString(LDBIZ_MONI_RESULT_STATUS_STR,v_moni_result_status);
    lpTSCall1Req2->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    lpTSCall1Req2->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req2->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req2->SetInt32(LDBIZ_SORT_TYPE_INT,v_sort_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.11]subcall timed out!");
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
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            strcpy(v_pd_no_str, lpRecord->GetString(LDBIZ_PD_NO_STR_STR));
            strcpy(v_exch_group_no_str, lpRecord->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR));
            v_moni_role_type = lpRecord->GetInt32(LDBIZ_MONI_ROLE_TYPE_INT);
            v_moni_value_flag = lpRecord->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
            v_moni_value_type = lpRecord->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
            v_warn_posi_value = lpRecord->GetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT);
            v_warn_trig_oper_type = lpRecord->GetInt32(LDBIZ_WARN_TRIG_OPER_TYPE_INT);
            v_close_posi_value = lpRecord->GetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT);
            v_close_trig_oper_type = lpRecord->GetInt32(LDBIZ_CLOSE_TRIG_OPER_TYPE_INT);
            v_appd_value = lpRecord->GetDouble(LDBIZ_APPD_VALUE_FLOAT);
            v_appd_trig_oper_type = lpRecord->GetInt32(LDBIZ_APPD_TRIG_OPER_TYPE_INT);
            v_begin_moni_date = lpRecord->GetInt32(LDBIZ_BEGIN_MONI_DATE_INT);
            v_begin_moni_value = lpRecord->GetDouble(LDBIZ_BEGIN_MONI_VALUE_FLOAT);
            v_max_moni_value = lpRecord->GetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT);
            v_curr_moni_value = lpRecord->GetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT);
            v_curr_result_moni_value = lpRecord->GetDouble(LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
            strcpy(v_contrs_stock_code, lpRecord->GetString(LDBIZ_CONTRS_STOCK_CODE_STR));
            v_contrs_exch_no = lpRecord->GetInt32(LDBIZ_CONTRS_EXCH_NO_INT);
            v_contrs_max_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
            v_contrs_curr_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
            v_contrs_result_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
            v_moni_result_value = lpRecord->GetDouble(LDBIZ_MONI_RESULT_VALUE_FLOAT);
            strcpy(v_moni_result_status, lpRecord->GetString(LDBIZ_MONI_RESULT_STATUS_STR));
            strcpy(v_moni_set_status, lpRecord->GetString(LDBIZ_MONI_SET_STATUS_STR));
            v_cash_asset = lpRecord->GetDouble(LDBIZ_CASH_ASSET_FLOAT);
            v_fund_asset = lpRecord->GetDouble(LDBIZ_FUND_ASSET_FLOAT);
            v_bond_asset = lpRecord->GetDouble(LDBIZ_BOND_ASSET_FLOAT);
            v_stock_asset = lpRecord->GetDouble(LDBIZ_STOCK_ASSET_FLOAT);
            v_repo_asset = lpRecord->GetDouble(LDBIZ_REPO_ASSET_FLOAT);
            v_nav_asset = lpRecord->GetDouble(LDBIZ_NAV_ASSET_FLOAT);
            v_stock_asset_ratio = lpRecord->GetDouble(LDBIZ_STOCK_ASSET_RATIO_FLOAT);
            v_close_posi_flag = lpRecord->GetInt32(LDBIZ_CLOSE_POSI_FLAG_INT);
            v_close_ratio_level_one = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
            v_close_ratio_level_two = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
            v_close_ratio_level_three = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
            strcpy(v_remark_info, lpRecord->GetString(LDBIZ_REMARK_INFO_STR));
            v_time_stamp = lpRecord->GetInt32(LDBIZ_TIME_STAMP_INT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);
            v_pd_share = lpRecord->GetDouble(LDBIZ_PD_SHARE_FLOAT);
            v_begin_asset_value = lpRecord->GetDouble(LDBIZ_BEGIN_ASSET_VALUE_FLOAT);
            v_hk_thrgh_stock_asset = lpRecord->GetDouble(LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);


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


    // [遍历结果集结束][lpMainMsg]
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

//逻辑_风控证券_风控_暂停所有账户风险监控设置
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
    int v_co_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_moni_set_status[3];
    int v_pd_no;
    int v_exch_group_no;
    int v_moni_role_type;
    int v_moni_value_flag;
    int v_moni_value_type;
    char v_moni_result_status[3];
    char v_exch_group_no_rights_str[2049];
    char v_pd_no_rights_str[2049];
    char v_co_no_rights_str[2049];
    int v_sort_type;
    int v_push_type;
    int64 v_row_id;
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    double v_warn_posi_value;
    int v_warn_trig_oper_type;
    double v_close_posi_value;
    int v_close_trig_oper_type;
    double v_appd_value;
    int v_appd_trig_oper_type;
    int v_begin_moni_date;
    double v_begin_moni_value;
    double v_max_moni_value;
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    double v_cash_asset;
    double v_fund_asset;
    double v_bond_asset;
    double v_stock_asset;
    double v_repo_asset;
    double v_nav_asset;
    double v_stock_asset_ratio;
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    char v_remark_info[256];
    int v_time_stamp;
    int v_update_times;
    double v_pd_share;
    double v_begin_asset_value;
    double v_hk_thrgh_stock_asset;
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
    v_co_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_moni_set_status, " ");
    v_pd_no=0;
    v_exch_group_no=0;
    v_moni_role_type=0;
    v_moni_value_flag=0;
    v_moni_value_type=0;
    strcpy(v_moni_result_status, " ");
    strcpy(v_exch_group_no_rights_str, " ");
    strcpy(v_pd_no_rights_str, " ");
    strcpy(v_co_no_rights_str, " ");
    v_sort_type=1;
    v_push_type=0;
    v_row_id=0;
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    v_warn_posi_value=0;
    v_warn_trig_oper_type=0;
    v_close_posi_value=0;
    v_close_trig_oper_type=0;
    v_appd_value=0;
    v_appd_trig_oper_type=0;
    v_begin_moni_date=0;
    v_begin_moni_value=0;
    v_max_moni_value=0;
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    v_cash_asset=0;
    v_fund_asset=0;
    v_bond_asset=0;
    v_stock_asset=0;
    v_repo_asset=0;
    v_nav_asset=0;
    v_stock_asset_ratio=0;
    v_close_posi_flag=0;
    v_close_ratio_level_one=0;
    v_close_ratio_level_two=0;
    v_close_ratio_level_three=0;
    strcpy(v_remark_info, " ");
    v_time_stamp=0;
    v_update_times=1;
    v_pd_share=0;
    v_begin_asset_value=0;
    v_hk_thrgh_stock_asset=0;
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


    // set @监控设置状态# = "2";
    strcpy(v_moni_set_status,"2");
    //调用过程[事务_风控证券_风控_更新所有账户风险监控设置状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.13", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.13]subcall timed out!");
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


    // set @产品编号# = 0;
    v_pd_no = 0;

    // set @交易组编号# = 0;
    v_exch_group_no = 0;

    // set @监控角色# = 0;
    v_moni_role_type = 0;

    // set @监控值方式# = 0;
    v_moni_value_flag = 0;

    // set @监控值类型# = 0;
    v_moni_value_type = 0;

    // set @监控设置状态# = " ";
    strcpy(v_moni_set_status," ");

    // set @监控结果状态# = " ";
    strcpy(v_moni_result_status," ");

    // set @交易组编号权限串# = " ";
    strcpy(v_exch_group_no_rights_str," ");

    // set @产品编号权限串# = " ";
    strcpy(v_pd_no_rights_str," ");

    // set @机构编号权限串# = " ";
    strcpy(v_co_no_rights_str," ");

    // set @排序方式# = 1;
    v_sort_type = 1;

    // set @主推类型# = 1;
    v_push_type = 1;
    //调用过程[事务_风控证券_风控_查询账户风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.4.11", 0);
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
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_ROLE_TYPE_INT,v_moni_role_type);
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_VALUE_FLAG_INT,v_moni_value_flag);
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_VALUE_TYPE_INT,v_moni_value_type);
    lpTSCall1Req2->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    lpTSCall1Req2->SetString(LDBIZ_MONI_RESULT_STATUS_STR,v_moni_result_status);
    lpTSCall1Req2->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    lpTSCall1Req2->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req2->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req2->SetInt32(LDBIZ_SORT_TYPE_INT,v_sort_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.11]subcall timed out!");
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
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            strcpy(v_pd_no_str, lpRecord->GetString(LDBIZ_PD_NO_STR_STR));
            strcpy(v_exch_group_no_str, lpRecord->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR));
            v_moni_role_type = lpRecord->GetInt32(LDBIZ_MONI_ROLE_TYPE_INT);
            v_moni_value_flag = lpRecord->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
            v_moni_value_type = lpRecord->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
            v_warn_posi_value = lpRecord->GetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT);
            v_warn_trig_oper_type = lpRecord->GetInt32(LDBIZ_WARN_TRIG_OPER_TYPE_INT);
            v_close_posi_value = lpRecord->GetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT);
            v_close_trig_oper_type = lpRecord->GetInt32(LDBIZ_CLOSE_TRIG_OPER_TYPE_INT);
            v_appd_value = lpRecord->GetDouble(LDBIZ_APPD_VALUE_FLOAT);
            v_appd_trig_oper_type = lpRecord->GetInt32(LDBIZ_APPD_TRIG_OPER_TYPE_INT);
            v_begin_moni_date = lpRecord->GetInt32(LDBIZ_BEGIN_MONI_DATE_INT);
            v_begin_moni_value = lpRecord->GetDouble(LDBIZ_BEGIN_MONI_VALUE_FLOAT);
            v_max_moni_value = lpRecord->GetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT);
            v_curr_moni_value = lpRecord->GetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT);
            v_curr_result_moni_value = lpRecord->GetDouble(LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
            strcpy(v_contrs_stock_code, lpRecord->GetString(LDBIZ_CONTRS_STOCK_CODE_STR));
            v_contrs_exch_no = lpRecord->GetInt32(LDBIZ_CONTRS_EXCH_NO_INT);
            v_contrs_max_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
            v_contrs_curr_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
            v_contrs_result_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
            v_moni_result_value = lpRecord->GetDouble(LDBIZ_MONI_RESULT_VALUE_FLOAT);
            strcpy(v_moni_result_status, lpRecord->GetString(LDBIZ_MONI_RESULT_STATUS_STR));
            strcpy(v_moni_set_status, lpRecord->GetString(LDBIZ_MONI_SET_STATUS_STR));
            v_cash_asset = lpRecord->GetDouble(LDBIZ_CASH_ASSET_FLOAT);
            v_fund_asset = lpRecord->GetDouble(LDBIZ_FUND_ASSET_FLOAT);
            v_bond_asset = lpRecord->GetDouble(LDBIZ_BOND_ASSET_FLOAT);
            v_stock_asset = lpRecord->GetDouble(LDBIZ_STOCK_ASSET_FLOAT);
            v_repo_asset = lpRecord->GetDouble(LDBIZ_REPO_ASSET_FLOAT);
            v_nav_asset = lpRecord->GetDouble(LDBIZ_NAV_ASSET_FLOAT);
            v_stock_asset_ratio = lpRecord->GetDouble(LDBIZ_STOCK_ASSET_RATIO_FLOAT);
            v_close_posi_flag = lpRecord->GetInt32(LDBIZ_CLOSE_POSI_FLAG_INT);
            v_close_ratio_level_one = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
            v_close_ratio_level_two = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
            v_close_ratio_level_three = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
            strcpy(v_remark_info, lpRecord->GetString(LDBIZ_REMARK_INFO_STR));
            v_time_stamp = lpRecord->GetInt32(LDBIZ_TIME_STAMP_INT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);
            v_pd_share = lpRecord->GetDouble(LDBIZ_PD_SHARE_FLOAT);
            v_begin_asset_value = lpRecord->GetDouble(LDBIZ_BEGIN_ASSET_VALUE_FLOAT);
            v_hk_thrgh_stock_asset = lpRecord->GetDouble(LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);


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


    // [遍历结果集结束][lpMainMsg]
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

//逻辑_风控证券_风控_停止所有账户风险监控设置
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
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_moni_set_status[3];
    int v_pd_no;
    int v_exch_group_no;
    int v_moni_role_type;
    int v_moni_value_flag;
    int v_moni_value_type;
    char v_moni_result_status[3];
    char v_exch_group_no_rights_str[2049];
    char v_pd_no_rights_str[2049];
    char v_co_no_rights_str[2049];
    int v_sort_type;
    int v_push_type;
    int64 v_row_id;
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    double v_warn_posi_value;
    int v_warn_trig_oper_type;
    double v_close_posi_value;
    int v_close_trig_oper_type;
    double v_appd_value;
    int v_appd_trig_oper_type;
    int v_begin_moni_date;
    double v_begin_moni_value;
    double v_max_moni_value;
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    double v_cash_asset;
    double v_fund_asset;
    double v_bond_asset;
    double v_stock_asset;
    double v_repo_asset;
    double v_nav_asset;
    double v_stock_asset_ratio;
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    char v_remark_info[256];
    int v_time_stamp;
    int v_update_times;
    double v_pd_share;
    double v_begin_asset_value;
    double v_hk_thrgh_stock_asset;
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
    v_co_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_moni_set_status, " ");
    v_pd_no=0;
    v_exch_group_no=0;
    v_moni_role_type=0;
    v_moni_value_flag=0;
    v_moni_value_type=0;
    strcpy(v_moni_result_status, " ");
    strcpy(v_exch_group_no_rights_str, " ");
    strcpy(v_pd_no_rights_str, " ");
    strcpy(v_co_no_rights_str, " ");
    v_sort_type=1;
    v_push_type=0;
    v_row_id=0;
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    v_warn_posi_value=0;
    v_warn_trig_oper_type=0;
    v_close_posi_value=0;
    v_close_trig_oper_type=0;
    v_appd_value=0;
    v_appd_trig_oper_type=0;
    v_begin_moni_date=0;
    v_begin_moni_value=0;
    v_max_moni_value=0;
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    v_cash_asset=0;
    v_fund_asset=0;
    v_bond_asset=0;
    v_stock_asset=0;
    v_repo_asset=0;
    v_nav_asset=0;
    v_stock_asset_ratio=0;
    v_close_posi_flag=0;
    v_close_ratio_level_one=0;
    v_close_ratio_level_two=0;
    v_close_ratio_level_three=0;
    strcpy(v_remark_info, " ");
    v_time_stamp=0;
    v_update_times=1;
    v_pd_share=0;
    v_begin_asset_value=0;
    v_hk_thrgh_stock_asset=0;
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


    // set @监控设置状态# = "3";
    strcpy(v_moni_set_status,"3");
    //调用过程[事务_风控证券_风控_更新所有账户风险监控设置状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.13", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.13]subcall timed out!");
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


    // set @产品编号# = 0;
    v_pd_no = 0;

    // set @交易组编号# = 0;
    v_exch_group_no = 0;

    // set @监控角色# = 0;
    v_moni_role_type = 0;

    // set @监控值方式# = 0;
    v_moni_value_flag = 0;

    // set @监控值类型# = 0;
    v_moni_value_type = 0;

    // set @监控设置状态# = " ";
    strcpy(v_moni_set_status," ");

    // set @监控结果状态# = " ";
    strcpy(v_moni_result_status," ");

    // set @交易组编号权限串# = " ";
    strcpy(v_exch_group_no_rights_str," ");

    // set @产品编号权限串# = " ";
    strcpy(v_pd_no_rights_str," ");

    // set @机构编号权限串# = " ";
    strcpy(v_co_no_rights_str," ");

    // set @排序方式# = 1;
    v_sort_type = 1;

    // set @主推类型# = 1;
    v_push_type = 1;
    //调用过程[事务_风控证券_风控_查询账户风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.4.11", 0);
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
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_ROLE_TYPE_INT,v_moni_role_type);
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_VALUE_FLAG_INT,v_moni_value_flag);
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_VALUE_TYPE_INT,v_moni_value_type);
    lpTSCall1Req2->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    lpTSCall1Req2->SetString(LDBIZ_MONI_RESULT_STATUS_STR,v_moni_result_status);
    lpTSCall1Req2->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    lpTSCall1Req2->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req2->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req2->SetInt32(LDBIZ_SORT_TYPE_INT,v_sort_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.11]subcall timed out!");
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
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            strcpy(v_pd_no_str, lpRecord->GetString(LDBIZ_PD_NO_STR_STR));
            strcpy(v_exch_group_no_str, lpRecord->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR));
            v_moni_role_type = lpRecord->GetInt32(LDBIZ_MONI_ROLE_TYPE_INT);
            v_moni_value_flag = lpRecord->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
            v_moni_value_type = lpRecord->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
            v_warn_posi_value = lpRecord->GetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT);
            v_warn_trig_oper_type = lpRecord->GetInt32(LDBIZ_WARN_TRIG_OPER_TYPE_INT);
            v_close_posi_value = lpRecord->GetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT);
            v_close_trig_oper_type = lpRecord->GetInt32(LDBIZ_CLOSE_TRIG_OPER_TYPE_INT);
            v_appd_value = lpRecord->GetDouble(LDBIZ_APPD_VALUE_FLOAT);
            v_appd_trig_oper_type = lpRecord->GetInt32(LDBIZ_APPD_TRIG_OPER_TYPE_INT);
            v_begin_moni_date = lpRecord->GetInt32(LDBIZ_BEGIN_MONI_DATE_INT);
            v_begin_moni_value = lpRecord->GetDouble(LDBIZ_BEGIN_MONI_VALUE_FLOAT);
            v_max_moni_value = lpRecord->GetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT);
            v_curr_moni_value = lpRecord->GetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT);
            v_curr_result_moni_value = lpRecord->GetDouble(LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
            strcpy(v_contrs_stock_code, lpRecord->GetString(LDBIZ_CONTRS_STOCK_CODE_STR));
            v_contrs_exch_no = lpRecord->GetInt32(LDBIZ_CONTRS_EXCH_NO_INT);
            v_contrs_max_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
            v_contrs_curr_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
            v_contrs_result_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
            v_moni_result_value = lpRecord->GetDouble(LDBIZ_MONI_RESULT_VALUE_FLOAT);
            strcpy(v_moni_result_status, lpRecord->GetString(LDBIZ_MONI_RESULT_STATUS_STR));
            strcpy(v_moni_set_status, lpRecord->GetString(LDBIZ_MONI_SET_STATUS_STR));
            v_cash_asset = lpRecord->GetDouble(LDBIZ_CASH_ASSET_FLOAT);
            v_fund_asset = lpRecord->GetDouble(LDBIZ_FUND_ASSET_FLOAT);
            v_bond_asset = lpRecord->GetDouble(LDBIZ_BOND_ASSET_FLOAT);
            v_stock_asset = lpRecord->GetDouble(LDBIZ_STOCK_ASSET_FLOAT);
            v_repo_asset = lpRecord->GetDouble(LDBIZ_REPO_ASSET_FLOAT);
            v_nav_asset = lpRecord->GetDouble(LDBIZ_NAV_ASSET_FLOAT);
            v_stock_asset_ratio = lpRecord->GetDouble(LDBIZ_STOCK_ASSET_RATIO_FLOAT);
            v_close_posi_flag = lpRecord->GetInt32(LDBIZ_CLOSE_POSI_FLAG_INT);
            v_close_ratio_level_one = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
            v_close_ratio_level_two = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
            v_close_ratio_level_three = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
            strcpy(v_remark_info, lpRecord->GetString(LDBIZ_REMARK_INFO_STR));
            v_time_stamp = lpRecord->GetInt32(LDBIZ_TIME_STAMP_INT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);
            v_pd_share = lpRecord->GetDouble(LDBIZ_PD_SHARE_FLOAT);
            v_begin_asset_value = lpRecord->GetDouble(LDBIZ_BEGIN_ASSET_VALUE_FLOAT);
            v_hk_thrgh_stock_asset = lpRecord->GetDouble(LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);


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


    // [遍历结果集结束][lpMainMsg]
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

//逻辑_风控证券_风控_新增证券风险监控设置
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
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    int v_monitor_ctrl_type;
    int v_moni_value_type;
    int v_monitor_param_value;
    char v_stock_code[7];
    int v_exch_no;
    int v_moni_value_flag;
    double v_warn_posi_value;
    double v_appd_value;
    double v_close_posi_value;
    double v_max_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    char v_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_moni_set_id;
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_stock_code_no;
    int v_stock_type;
    int v_asset_type;
    double v_par_value;
    int64 v_row_id;
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
    char v_moni_set_status[3];
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
    v_co_no=0;
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    v_monitor_ctrl_type=0;
    v_moni_value_type=0;
    v_monitor_param_value=0;
    strcpy(v_stock_code, " ");
    v_exch_no=0;
    v_moni_value_flag=0;
    v_warn_posi_value=0;
    v_appd_value=0;
    v_close_posi_value=0;
    v_max_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_close_posi_flag=0;
    v_close_ratio_level_one=0;
    v_close_ratio_level_two=0;
    v_close_ratio_level_three=0;
    strcpy(v_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_moni_set_id=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_stock_code_no=0;
    v_stock_type=0;
    v_asset_type=0;
    v_par_value=0;
    v_row_id=0;
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
    strcpy(v_moni_set_status, " ");
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    strncpy(v_pd_no_str, lpInBizMsg->GetString(LDBIZ_PD_NO_STR_STR),2048);
    v_pd_no_str[2048] = '\0';
    strncpy(v_exch_group_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR),2048);
    v_exch_group_no_str[2048] = '\0';
    v_monitor_ctrl_type = lpInBizMsg->GetInt32(LDBIZ_MONITOR_CTRL_TYPE_INT);
    v_moni_value_type = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
    v_monitor_param_value = lpInBizMsg->GetInt32(LDBIZ_MONITOR_PARAM_VALUE_INT);
    strncpy(v_stock_code, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR),6);
    v_stock_code[6] = '\0';
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    v_moni_value_flag = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
    v_warn_posi_value = lpInBizMsg->GetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT);
    v_appd_value = lpInBizMsg->GetDouble(LDBIZ_APPD_VALUE_FLOAT);
    v_close_posi_value = lpInBizMsg->GetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT);
    v_max_moni_value = lpInBizMsg->GetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT);
    strncpy(v_contrs_stock_code, lpInBizMsg->GetString(LDBIZ_CONTRS_STOCK_CODE_STR),6);
    v_contrs_stock_code[6] = '\0';
    v_contrs_exch_no = lpInBizMsg->GetInt32(LDBIZ_CONTRS_EXCH_NO_INT);
    v_contrs_max_moni_value = lpInBizMsg->GetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
    v_close_posi_flag = lpInBizMsg->GetInt32(LDBIZ_CLOSE_POSI_FLAG_INT);
    v_close_ratio_level_one = lpInBizMsg->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
    v_close_ratio_level_two = lpInBizMsg->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
    v_close_ratio_level_three = lpInBizMsg->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
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


    // if @监控控制方式# = 《监控控制方式-按证券代码控制》 then
    if (v_monitor_ctrl_type == 1)
    {
        //调用过程[事务_公共_公共接口_获取证券代码编号]
        //组织事务请求
        if(lpTSCall1Ans1)
        {
          lpTSCall1Ans1->FreeMsg();
          lpTSCall1Ans1=NULL;
        }
        lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.24.101", 0);
        lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
        glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
        if(!lpTSCall1Ans1)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.101]subcall timed out!");
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
        v_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        v_stock_type = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_TYPE_INT);
        v_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_par_value = lpTSCall1Ans1->GetDouble(LDBIZ_PAR_VALUE_FLOAT);


        // set @监控参数值# = @证券代码编号#;
        v_monitor_param_value = v_stock_code_no;
    // end if;
    }

    //调用过程[事务_风控证券_风控_新增证券风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.4.14", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req2->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpTSCall1Req2->SetString(LDBIZ_EXCH_GROUP_NO_STR_STR,v_exch_group_no_str);
    lpTSCall1Req2->SetInt32(LDBIZ_MONITOR_CTRL_TYPE_INT,v_monitor_ctrl_type);
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_VALUE_TYPE_INT,v_moni_value_type);
    lpTSCall1Req2->SetInt32(LDBIZ_MONITOR_PARAM_VALUE_INT,v_monitor_param_value);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_VALUE_FLAG_INT,v_moni_value_flag);
    lpTSCall1Req2->SetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT,v_warn_posi_value);
    lpTSCall1Req2->SetDouble(LDBIZ_APPD_VALUE_FLOAT,v_appd_value);
    lpTSCall1Req2->SetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT,v_close_posi_value);
    lpTSCall1Req2->SetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT,v_max_moni_value);
    lpTSCall1Req2->SetString(LDBIZ_CONTRS_STOCK_CODE_STR,v_contrs_stock_code);
    lpTSCall1Req2->SetInt32(LDBIZ_CONTRS_EXCH_NO_INT,v_contrs_exch_no);
    lpTSCall1Req2->SetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT,v_contrs_max_moni_value);
    lpTSCall1Req2->SetInt32(LDBIZ_CLOSE_POSI_FLAG_INT,v_close_posi_flag);
    lpTSCall1Req2->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT,v_close_ratio_level_one);
    lpTSCall1Req2->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT,v_close_ratio_level_two);
    lpTSCall1Req2->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT,v_close_ratio_level_three);
    lpTSCall1Req2->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.14]subcall timed out!");
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
    v_moni_set_id = lpTSCall1Ans2->GetInt64(LDBIZ_MONI_SET_ID_INT64);

    //调用过程[事务_风控证券_接口_获取单条证券风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("rksecuT.5.18", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.5.18]subcall timed out!");
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
    v_co_no = lpTSCall1Ans3->GetInt32(LDBIZ_CO_NO_INT);
    strcpy(v_pd_no_str, lpTSCall1Ans3->GetString(LDBIZ_PD_NO_STR_STR));
    strcpy(v_exch_group_no_str, lpTSCall1Ans3->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR));
    v_monitor_ctrl_type = lpTSCall1Ans3->GetInt32(LDBIZ_MONITOR_CTRL_TYPE_INT);
    v_moni_value_type = lpTSCall1Ans3->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
    v_monitor_param_value = lpTSCall1Ans3->GetInt32(LDBIZ_MONITOR_PARAM_VALUE_INT);
    v_moni_value_flag = lpTSCall1Ans3->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
    v_warn_posi_value = lpTSCall1Ans3->GetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT);
    v_appd_value = lpTSCall1Ans3->GetDouble(LDBIZ_APPD_VALUE_FLOAT);
    v_close_posi_value = lpTSCall1Ans3->GetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT);
    v_max_moni_value = lpTSCall1Ans3->GetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT);
    v_curr_moni_value = lpTSCall1Ans3->GetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT);
    v_curr_result_moni_value = lpTSCall1Ans3->GetDouble(LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
    strcpy(v_contrs_stock_code, lpTSCall1Ans3->GetString(LDBIZ_CONTRS_STOCK_CODE_STR));
    v_contrs_exch_no = lpTSCall1Ans3->GetInt32(LDBIZ_CONTRS_EXCH_NO_INT);
    v_contrs_max_moni_value = lpTSCall1Ans3->GetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
    v_contrs_curr_moni_value = lpTSCall1Ans3->GetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
    v_contrs_result_moni_value = lpTSCall1Ans3->GetDouble(LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
    v_moni_result_value = lpTSCall1Ans3->GetDouble(LDBIZ_MONI_RESULT_VALUE_FLOAT);
    strcpy(v_moni_result_status, lpTSCall1Ans3->GetString(LDBIZ_MONI_RESULT_STATUS_STR));
    strcpy(v_moni_set_status, lpTSCall1Ans3->GetString(LDBIZ_MONI_SET_STATUS_STR));
    v_close_posi_flag = lpTSCall1Ans3->GetInt32(LDBIZ_CLOSE_POSI_FLAG_INT);
    v_close_ratio_level_one = lpTSCall1Ans3->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
    v_close_ratio_level_two = lpTSCall1Ans3->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
    v_close_ratio_level_three = lpTSCall1Ans3->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
    strcpy(v_remark_info, lpTSCall1Ans3->GetString(LDBIZ_REMARK_INFO_STR));
    v_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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
    lpOutBizMsg->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
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

//逻辑_风控证券_风控_修改证券风险监控设置
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
    int64 v_moni_set_id;
    int v_co_no;
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    int v_monitor_ctrl_type;
    int v_moni_value_type;
    int v_monitor_param_value;
    char v_stock_code[7];
    int v_exch_no;
    int v_moni_value_flag;
    double v_warn_posi_value;
    double v_appd_value;
    double v_close_posi_value;
    double v_max_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    char v_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_stock_code_no;
    int v_stock_type;
    int v_asset_type;
    double v_par_value;
    int64 v_row_id;
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
    char v_moni_set_status[3];
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
    v_co_no=0;
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    v_monitor_ctrl_type=0;
    v_moni_value_type=0;
    v_monitor_param_value=0;
    strcpy(v_stock_code, " ");
    v_exch_no=0;
    v_moni_value_flag=0;
    v_warn_posi_value=0;
    v_appd_value=0;
    v_close_posi_value=0;
    v_max_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_close_posi_flag=0;
    v_close_ratio_level_one=0;
    v_close_ratio_level_two=0;
    v_close_ratio_level_three=0;
    strcpy(v_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_stock_code_no=0;
    v_stock_type=0;
    v_asset_type=0;
    v_par_value=0;
    v_row_id=0;
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
    strcpy(v_moni_set_status, " ");
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    strncpy(v_pd_no_str, lpInBizMsg->GetString(LDBIZ_PD_NO_STR_STR),2048);
    v_pd_no_str[2048] = '\0';
    strncpy(v_exch_group_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR),2048);
    v_exch_group_no_str[2048] = '\0';
    v_monitor_ctrl_type = lpInBizMsg->GetInt32(LDBIZ_MONITOR_CTRL_TYPE_INT);
    v_moni_value_type = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
    v_monitor_param_value = lpInBizMsg->GetInt32(LDBIZ_MONITOR_PARAM_VALUE_INT);
    strncpy(v_stock_code, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR),6);
    v_stock_code[6] = '\0';
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    v_moni_value_flag = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
    v_warn_posi_value = lpInBizMsg->GetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT);
    v_appd_value = lpInBizMsg->GetDouble(LDBIZ_APPD_VALUE_FLOAT);
    v_close_posi_value = lpInBizMsg->GetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT);
    v_max_moni_value = lpInBizMsg->GetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT);
    strncpy(v_contrs_stock_code, lpInBizMsg->GetString(LDBIZ_CONTRS_STOCK_CODE_STR),6);
    v_contrs_stock_code[6] = '\0';
    v_contrs_exch_no = lpInBizMsg->GetInt32(LDBIZ_CONTRS_EXCH_NO_INT);
    v_contrs_max_moni_value = lpInBizMsg->GetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
    v_close_posi_flag = lpInBizMsg->GetInt32(LDBIZ_CLOSE_POSI_FLAG_INT);
    v_close_ratio_level_one = lpInBizMsg->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
    v_close_ratio_level_two = lpInBizMsg->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
    v_close_ratio_level_three = lpInBizMsg->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
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


    // if @监控控制方式# = 《监控控制方式-按证券代码控制》 then
    if (v_monitor_ctrl_type == 1)
    {
        //调用过程[事务_公共_公共接口_获取证券代码编号]
        //组织事务请求
        if(lpTSCall1Ans1)
        {
          lpTSCall1Ans1->FreeMsg();
          lpTSCall1Ans1=NULL;
        }
        lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.24.101", 0);
        lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
        glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
        if(!lpTSCall1Ans1)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.101]subcall timed out!");
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
        v_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        v_stock_type = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_TYPE_INT);
        v_asset_type = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_TYPE_INT);
        v_par_value = lpTSCall1Ans1->GetDouble(LDBIZ_PAR_VALUE_FLOAT);


        // set @监控参数值# = @证券代码编号#;
        v_monitor_param_value = v_stock_code_no;
    // end if;
    }

    //调用过程[事务_风控证券_风控_修改证券风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.4.15", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req2->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpTSCall1Req2->SetString(LDBIZ_EXCH_GROUP_NO_STR_STR,v_exch_group_no_str);
    lpTSCall1Req2->SetInt32(LDBIZ_MONITOR_CTRL_TYPE_INT,v_monitor_ctrl_type);
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_VALUE_TYPE_INT,v_moni_value_type);
    lpTSCall1Req2->SetInt32(LDBIZ_MONITOR_PARAM_VALUE_INT,v_monitor_param_value);
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_VALUE_FLAG_INT,v_moni_value_flag);
    lpTSCall1Req2->SetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT,v_warn_posi_value);
    lpTSCall1Req2->SetDouble(LDBIZ_APPD_VALUE_FLOAT,v_appd_value);
    lpTSCall1Req2->SetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT,v_close_posi_value);
    lpTSCall1Req2->SetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT,v_max_moni_value);
    lpTSCall1Req2->SetString(LDBIZ_CONTRS_STOCK_CODE_STR,v_contrs_stock_code);
    lpTSCall1Req2->SetInt32(LDBIZ_CONTRS_EXCH_NO_INT,v_contrs_exch_no);
    lpTSCall1Req2->SetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT,v_contrs_max_moni_value);
    lpTSCall1Req2->SetInt32(LDBIZ_CLOSE_POSI_FLAG_INT,v_close_posi_flag);
    lpTSCall1Req2->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT,v_close_ratio_level_one);
    lpTSCall1Req2->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT,v_close_ratio_level_two);
    lpTSCall1Req2->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT,v_close_ratio_level_three);
    lpTSCall1Req2->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.15]subcall timed out!");
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

    //调用过程[事务_风控证券_接口_获取单条证券风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("rksecuT.5.18", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.5.18]subcall timed out!");
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
    v_co_no = lpTSCall1Ans3->GetInt32(LDBIZ_CO_NO_INT);
    strcpy(v_pd_no_str, lpTSCall1Ans3->GetString(LDBIZ_PD_NO_STR_STR));
    strcpy(v_exch_group_no_str, lpTSCall1Ans3->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR));
    v_monitor_ctrl_type = lpTSCall1Ans3->GetInt32(LDBIZ_MONITOR_CTRL_TYPE_INT);
    v_moni_value_type = lpTSCall1Ans3->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
    v_monitor_param_value = lpTSCall1Ans3->GetInt32(LDBIZ_MONITOR_PARAM_VALUE_INT);
    v_moni_value_flag = lpTSCall1Ans3->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
    v_warn_posi_value = lpTSCall1Ans3->GetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT);
    v_appd_value = lpTSCall1Ans3->GetDouble(LDBIZ_APPD_VALUE_FLOAT);
    v_close_posi_value = lpTSCall1Ans3->GetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT);
    v_max_moni_value = lpTSCall1Ans3->GetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT);
    v_curr_moni_value = lpTSCall1Ans3->GetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT);
    v_curr_result_moni_value = lpTSCall1Ans3->GetDouble(LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
    strcpy(v_contrs_stock_code, lpTSCall1Ans3->GetString(LDBIZ_CONTRS_STOCK_CODE_STR));
    v_contrs_exch_no = lpTSCall1Ans3->GetInt32(LDBIZ_CONTRS_EXCH_NO_INT);
    v_contrs_max_moni_value = lpTSCall1Ans3->GetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
    v_contrs_curr_moni_value = lpTSCall1Ans3->GetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
    v_contrs_result_moni_value = lpTSCall1Ans3->GetDouble(LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
    v_moni_result_value = lpTSCall1Ans3->GetDouble(LDBIZ_MONI_RESULT_VALUE_FLOAT);
    strcpy(v_moni_result_status, lpTSCall1Ans3->GetString(LDBIZ_MONI_RESULT_STATUS_STR));
    strcpy(v_moni_set_status, lpTSCall1Ans3->GetString(LDBIZ_MONI_SET_STATUS_STR));
    v_close_posi_flag = lpTSCall1Ans3->GetInt32(LDBIZ_CLOSE_POSI_FLAG_INT);
    v_close_ratio_level_one = lpTSCall1Ans3->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
    v_close_ratio_level_two = lpTSCall1Ans3->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
    v_close_ratio_level_three = lpTSCall1Ans3->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
    strcpy(v_remark_info, lpTSCall1Ans3->GetString(LDBIZ_REMARK_INFO_STR));
    v_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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

//逻辑_风控证券_风控_删除证券风险监控设置
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
    int64 v_moni_set_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_row_id;
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
    v_moni_set_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_row_id=0;
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
    v_moni_set_id = lpInBizMsg->GetInt64(LDBIZ_MONI_SET_ID_INT64);

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

    //调用过程[事务_风控证券_风控_删除证券风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.16", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.16]subcall timed out!");
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


    // set @记录序号# = @监控设置序号#;
    v_row_id = v_moni_set_id;

    // [主动推送][risk.riskmonitordel][风控主推_规则_证券监控删除主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.152", 0);
    lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    glpPubSub_Interface->PubTopics("risk.riskmonitordel", lpPubMsg);


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

//逻辑_风控证券_风控_查询证券风险监控设置
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
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_moni_value_flag;
    int v_moni_value_type;
    char v_moni_set_status[3];
    char v_moni_result_status[3];
    int v_sort_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    int v_monitor_ctrl_type;
    int v_monitor_param_value;
    double v_warn_posi_value;
    double v_appd_value;
    double v_close_posi_value;
    double v_max_moni_value;
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    char v_remark_info[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_busi_ctrl_str[65];
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
    v_moni_value_flag=0;
    v_moni_value_type=0;
    strcpy(v_moni_set_status, " ");
    strcpy(v_moni_result_status, " ");
    v_sort_type=1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_row_id=0;
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    v_monitor_ctrl_type=0;
    v_monitor_param_value=0;
    v_warn_posi_value=0;
    v_appd_value=0;
    v_close_posi_value=0;
    v_max_moni_value=0;
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    v_close_posi_flag=0;
    v_close_ratio_level_one=0;
    v_close_ratio_level_two=0;
    v_close_ratio_level_three=0;
    strcpy(v_remark_info, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_busi_ctrl_str, " ");
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
    v_moni_value_flag = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
    v_moni_value_type = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
    strncpy(v_moni_set_status, lpInBizMsg->GetString(LDBIZ_MONI_SET_STATUS_STR),2);
    v_moni_set_status[2] = '\0';
    strncpy(v_moni_result_status, lpInBizMsg->GetString(LDBIZ_MONI_RESULT_STATUS_STR),2);
    v_moni_result_status[2] = '\0';
    v_sort_type = lpInBizMsg->GetInt32(LDBIZ_SORT_TYPE_INT);

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


    // set @业务控制串#="111";
    strcpy(v_busi_ctrl_str,"111");
    //调用过程[事务_公共_公共接口_获取操作员操作权限串]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.24.2", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetString(LDBIZ_BUSI_CTRL_STR_STR,v_busi_ctrl_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.2]subcall timed out!");
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
    strcpy(v_co_no_rights_str, lpTSCall1Ans1->GetString(LDBIZ_CO_NO_RIGHTS_STR_STR));
    strcpy(v_pd_no_rights_str, lpTSCall1Ans1->GetString(LDBIZ_PD_NO_RIGHTS_STR_STR));
    strcpy(v_exch_group_no_rights_str, lpTSCall1Ans1->GetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR));

    //调用过程[事务_风控证券_风控_查询证券风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.4.17", 0);
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
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_VALUE_FLAG_INT,v_moni_value_flag);
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_VALUE_TYPE_INT,v_moni_value_type);
    lpTSCall1Req2->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    lpTSCall1Req2->SetString(LDBIZ_MONI_RESULT_STATUS_STR,v_moni_result_status);
    lpTSCall1Req2->SetString(LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR,v_exch_group_no_rights_str);
    lpTSCall1Req2->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    lpTSCall1Req2->SetString(LDBIZ_CO_NO_RIGHTS_STR_STR,v_co_no_rights_str);
    lpTSCall1Req2->SetInt32(LDBIZ_SORT_TYPE_INT,v_sort_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.17]subcall timed out!");
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


    lpOutBizMsg->FillWithAnotherMsg(lpTSCall1Ans2);
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

//逻辑_风控证券_风控_启用证券风险监控设置
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
    int v_co_no;
    int64 v_moni_set_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_moni_set_status[3];
    int64 v_row_id;
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
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
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
    v_co_no=0;
    v_moni_set_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_moni_set_status, " ");
    v_row_id=0;
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
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_moni_set_id = lpInBizMsg->GetInt64(LDBIZ_MONI_SET_ID_INT64);

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


    // set @监控设置状态# = "1";
    strcpy(v_moni_set_status,"1");
    //调用过程[事务_风控证券_风控_更新证券风险监控设置状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.18", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    lpTSCall1Req1->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.18]subcall timed out!");
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

//逻辑_风控证券_风控_暂停证券风险监控设置
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
    int64 v_moni_set_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_moni_set_status[3];
    int64 v_row_id;
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
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
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
    v_co_no=0;
    v_moni_set_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_moni_set_status, " ");
    v_row_id=0;
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
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_moni_set_id = lpInBizMsg->GetInt64(LDBIZ_MONI_SET_ID_INT64);

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


    // set @监控设置状态# = "2";
    strcpy(v_moni_set_status,"2");
    //调用过程[事务_风控证券_风控_更新证券风险监控设置状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.18", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    lpTSCall1Req1->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.18]subcall timed out!");
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

//逻辑_风控证券_风控_停止证券风险监控设置
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
    int v_co_no;
    int64 v_moni_set_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_moni_set_status[3];
    int64 v_row_id;
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
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
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
    v_co_no=0;
    v_moni_set_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_moni_set_status, " ");
    v_row_id=0;
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
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_moni_set_id = lpInBizMsg->GetInt64(LDBIZ_MONI_SET_ID_INT64);

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


    // set @监控设置状态# = "3";
    strcpy(v_moni_set_status,"3");
    //调用过程[事务_风控证券_风控_更新证券风险监控设置状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.18", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    lpTSCall1Req1->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.18]subcall timed out!");
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

//逻辑_风控证券_风控_启用所有证券风险监控设置
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
    int v_co_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_moni_set_status[3];
    int64 v_row_id;
    int v_row_count;
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
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    char v_remark_info[256];
    int v_update_times;
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
    v_co_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_moni_set_status, " ");
    v_row_id=0;
    v_row_count=-1;
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
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);

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


    // set @监控设置状态# = "1";
    strcpy(v_moni_set_status,"1");
    //调用过程[事务_风控证券_风控_更新所有证券风险监控设置状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.19", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.19]subcall timed out!");
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


    // set @记录序号# = 0;
    v_row_id = 0;

    // set @指定行数# = -1;
    v_row_count = -1;
    //调用过程[事务_风控证券_接口_获取批量证券风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.5.17", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req2->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.5.17]subcall timed out!");
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
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            strcpy(v_pd_no_str, lpRecord->GetString(LDBIZ_PD_NO_STR_STR));
            strcpy(v_exch_group_no_str, lpRecord->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR));
            v_monitor_ctrl_type = lpRecord->GetInt32(LDBIZ_MONITOR_CTRL_TYPE_INT);
            v_moni_value_type = lpRecord->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
            v_monitor_param_value = lpRecord->GetInt32(LDBIZ_MONITOR_PARAM_VALUE_INT);
            v_moni_value_flag = lpRecord->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
            v_warn_posi_value = lpRecord->GetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT);
            v_appd_value = lpRecord->GetDouble(LDBIZ_APPD_VALUE_FLOAT);
            v_close_posi_value = lpRecord->GetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT);
            v_max_moni_value = lpRecord->GetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT);
            v_curr_moni_value = lpRecord->GetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT);
            v_curr_result_moni_value = lpRecord->GetDouble(LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
            strcpy(v_contrs_stock_code, lpRecord->GetString(LDBIZ_CONTRS_STOCK_CODE_STR));
            v_contrs_exch_no = lpRecord->GetInt32(LDBIZ_CONTRS_EXCH_NO_INT);
            v_contrs_max_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
            v_contrs_curr_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
            v_contrs_result_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
            v_moni_result_value = lpRecord->GetDouble(LDBIZ_MONI_RESULT_VALUE_FLOAT);
            strcpy(v_moni_result_status, lpRecord->GetString(LDBIZ_MONI_RESULT_STATUS_STR));
            strcpy(v_moni_set_status, lpRecord->GetString(LDBIZ_MONI_SET_STATUS_STR));
            v_close_posi_flag = lpRecord->GetInt32(LDBIZ_CLOSE_POSI_FLAG_INT);
            v_close_ratio_level_one = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
            v_close_ratio_level_two = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
            v_close_ratio_level_three = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
            strcpy(v_remark_info, lpRecord->GetString(LDBIZ_REMARK_INFO_STR));
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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


    // [遍历结果集结束][lpMainMsg]
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

//逻辑_风控证券_风控_暂停所有证券风险监控设置
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
    int v_co_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_moni_set_status[3];
    int64 v_row_id;
    int v_row_count;
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
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    char v_remark_info[256];
    int v_update_times;
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
    v_co_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_moni_set_status, " ");
    v_row_id=0;
    v_row_count=-1;
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
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);

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


    // set @监控设置状态# = "2";
    strcpy(v_moni_set_status,"2");
    //调用过程[事务_风控证券_风控_更新所有证券风险监控设置状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.19", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.19]subcall timed out!");
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


    // set @记录序号# = 0;
    v_row_id = 0;

    // set @指定行数# = -1;
    v_row_count = -1;
    //调用过程[事务_风控证券_接口_获取批量证券风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.5.17", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req2->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.5.17]subcall timed out!");
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
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            strcpy(v_pd_no_str, lpRecord->GetString(LDBIZ_PD_NO_STR_STR));
            strcpy(v_exch_group_no_str, lpRecord->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR));
            v_monitor_ctrl_type = lpRecord->GetInt32(LDBIZ_MONITOR_CTRL_TYPE_INT);
            v_moni_value_type = lpRecord->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
            v_monitor_param_value = lpRecord->GetInt32(LDBIZ_MONITOR_PARAM_VALUE_INT);
            v_moni_value_flag = lpRecord->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
            v_warn_posi_value = lpRecord->GetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT);
            v_appd_value = lpRecord->GetDouble(LDBIZ_APPD_VALUE_FLOAT);
            v_close_posi_value = lpRecord->GetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT);
            v_max_moni_value = lpRecord->GetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT);
            v_curr_moni_value = lpRecord->GetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT);
            v_curr_result_moni_value = lpRecord->GetDouble(LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
            strcpy(v_contrs_stock_code, lpRecord->GetString(LDBIZ_CONTRS_STOCK_CODE_STR));
            v_contrs_exch_no = lpRecord->GetInt32(LDBIZ_CONTRS_EXCH_NO_INT);
            v_contrs_max_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
            v_contrs_curr_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
            v_contrs_result_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
            v_moni_result_value = lpRecord->GetDouble(LDBIZ_MONI_RESULT_VALUE_FLOAT);
            strcpy(v_moni_result_status, lpRecord->GetString(LDBIZ_MONI_RESULT_STATUS_STR));
            strcpy(v_moni_set_status, lpRecord->GetString(LDBIZ_MONI_SET_STATUS_STR));
            v_close_posi_flag = lpRecord->GetInt32(LDBIZ_CLOSE_POSI_FLAG_INT);
            v_close_ratio_level_one = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
            v_close_ratio_level_two = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
            v_close_ratio_level_three = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
            strcpy(v_remark_info, lpRecord->GetString(LDBIZ_REMARK_INFO_STR));
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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


    // [遍历结果集结束][lpMainMsg]
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

//逻辑_风控证券_风控_停止所有证券风险监控设置
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
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_moni_set_status[3];
    int64 v_row_id;
    int v_row_count;
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
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    char v_remark_info[256];
    int v_update_times;
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
    v_co_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_moni_set_status, " ");
    v_row_id=0;
    v_row_count=-1;
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
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);

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


    // set @监控设置状态# = "3";
    strcpy(v_moni_set_status,"3");
    //调用过程[事务_风控证券_风控_更新所有证券风险监控设置状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.19", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.19]subcall timed out!");
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


    // set @记录序号# = 0;
    v_row_id = 0;

    // set @指定行数# = -1;
    v_row_count = -1;
    //调用过程[事务_风控证券_接口_获取批量证券风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.5.17", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req2->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.5.17]subcall timed out!");
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
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            strcpy(v_pd_no_str, lpRecord->GetString(LDBIZ_PD_NO_STR_STR));
            strcpy(v_exch_group_no_str, lpRecord->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR));
            v_monitor_ctrl_type = lpRecord->GetInt32(LDBIZ_MONITOR_CTRL_TYPE_INT);
            v_moni_value_type = lpRecord->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
            v_monitor_param_value = lpRecord->GetInt32(LDBIZ_MONITOR_PARAM_VALUE_INT);
            v_moni_value_flag = lpRecord->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
            v_warn_posi_value = lpRecord->GetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT);
            v_appd_value = lpRecord->GetDouble(LDBIZ_APPD_VALUE_FLOAT);
            v_close_posi_value = lpRecord->GetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT);
            v_max_moni_value = lpRecord->GetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT);
            v_curr_moni_value = lpRecord->GetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT);
            v_curr_result_moni_value = lpRecord->GetDouble(LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
            strcpy(v_contrs_stock_code, lpRecord->GetString(LDBIZ_CONTRS_STOCK_CODE_STR));
            v_contrs_exch_no = lpRecord->GetInt32(LDBIZ_CONTRS_EXCH_NO_INT);
            v_contrs_max_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
            v_contrs_curr_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
            v_contrs_result_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
            v_moni_result_value = lpRecord->GetDouble(LDBIZ_MONI_RESULT_VALUE_FLOAT);
            strcpy(v_moni_result_status, lpRecord->GetString(LDBIZ_MONI_RESULT_STATUS_STR));
            strcpy(v_moni_set_status, lpRecord->GetString(LDBIZ_MONI_SET_STATUS_STR));
            v_close_posi_flag = lpRecord->GetInt32(LDBIZ_CLOSE_POSI_FLAG_INT);
            v_close_ratio_level_one = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
            v_close_ratio_level_two = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
            v_close_ratio_level_three = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
            strcpy(v_remark_info, lpRecord->GetString(LDBIZ_REMARK_INFO_STR));
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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


    // [遍历结果集结束][lpMainMsg]
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

//逻辑_风控证券_风控_计算账户风险监控设置数据
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

    //调用过程[事务_风控证券_风控_计算账户风险监控设置数据]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.4.20", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.20]subcall timed out!");
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

    //调用过程[事务_公共_公共接口_完成计划任务]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.24.152", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_TASK_NO_INT,v_task_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.152]subcall timed out!");
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
    strcpy(v_task_strike_status, lpTSCall1Ans3->GetString(LDBIZ_TASK_STRIKE_STATUS_STR));


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
    return iRet;
}

//逻辑_风控证券_风控_客户风险触警历史流水查询
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
    int v_begin_date;
    int v_end_date;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_trig_stage_type;
    char v_risk_rule_action[33];
    int v_risk_rule_type;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_create_date;
    int v_create_time;
    int v_risk_item_id;
    int v_order_dir;
    int64 v_dime_id;
    int v_compli_calc_level;
    int v_unit_nav_flag;
    int v_trig_type;
    char v_compli_rules_remark[256];
    char v_risk_rule_value_str[256];
    char v_risk_rule_calc_str[256];
    char v_remark_info[256];
    char v_pd_no_str[2049];
    int v_stock_code_no;
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
    v_begin_date=0;
    v_end_date=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_trig_stage_type=0;
    strcpy(v_risk_rule_action, " ");
    v_risk_rule_type=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_create_date=0;
    v_create_time=0;
    v_risk_item_id=0;
    v_order_dir=0;
    v_dime_id=0;
    v_compli_calc_level=0;
    v_unit_nav_flag=0;
    v_trig_type=0;
    strcpy(v_compli_rules_remark, " ");
    strcpy(v_risk_rule_value_str, " ");
    strcpy(v_risk_rule_calc_str, " ");
    strcpy(v_remark_info, " ");
    strcpy(v_pd_no_str, " ");
    v_stock_code_no=0;
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
    v_begin_date = lpInBizMsg->GetInt32(LDBIZ_BEGIN_DATE_INT);
    v_end_date = lpInBizMsg->GetInt32(LDBIZ_END_DATE_INT);
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_trig_stage_type = lpInBizMsg->GetInt32(LDBIZ_TRIG_STAGE_TYPE_INT);
    strncpy(v_risk_rule_action, lpInBizMsg->GetString(LDBIZ_RISK_RULE_ACTION_STR),32);
    v_risk_rule_action[32] = '\0';
    v_risk_rule_type = lpInBizMsg->GetInt32(LDBIZ_RISK_RULE_TYPE_INT);
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

    //调用过程[事务_风控证券_风控_客户风险触警历史流水查询]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.21", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_TRIG_STAGE_TYPE_INT,v_trig_stage_type);
    lpTSCall1Req1->SetString(LDBIZ_RISK_RULE_ACTION_STR,v_risk_rule_action);
    lpTSCall1Req1->SetInt32(LDBIZ_RISK_RULE_TYPE_INT,v_risk_rule_type);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.21]subcall timed out!");
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

//逻辑_风控证券_风控_条目查询客户产品交易组
int LD_CALL_MODE fnFunc29(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int v_risk_item_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    int v_union_flag;
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
    v_risk_item_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    v_union_flag=0;
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
    v_risk_item_id = lpInBizMsg->GetInt32(LDBIZ_RISK_ITEM_ID_INT);

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

    //调用过程[事务_风控证券_风控_条目查询客户产品交易组]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.22", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_RISK_ITEM_ID_INT,v_risk_item_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.22]subcall timed out!");
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

//逻辑_风控证券_风控_更新客户风险规则启用标志
int LD_CALL_MODE fnFunc30(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int64 v_row_id;
    int v_rule_flag;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_risk_item_id_str[2049];
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    int64 v_dime_id;
    char v_trig_stage_type_str[65];
    int v_compli_calc_level;
    int v_trig_type;
    int64 v_model_id;
    int v_risk_item_id;
    char v_risk_rule_code[2049];
    char v_risk_param_str[2049];
    char v_risk_rule_calc_str[256];
    int v_push_type;
    int v_update_times;
    int v_union_flag;
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
    v_row_id=0;
    v_rule_flag=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_risk_item_id_str, " ");
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    v_dime_id=0;
    strcpy(v_trig_stage_type_str, " ");
    v_compli_calc_level=0;
    v_trig_type=0;
    v_model_id=0;
    v_risk_item_id=0;
    strcpy(v_risk_rule_code, " ");
    strcpy(v_risk_param_str, " ");
    strcpy(v_risk_rule_calc_str, " ");
    v_push_type=0;
    v_update_times=1;
    v_union_flag=0;
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
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_rule_flag = lpInBizMsg->GetInt32(LDBIZ_RULE_FLAG_INT);

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

    //调用过程[事务_风控证券_风控_更新客户风险规则启用标志]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.23", 0);
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
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_RULE_FLAG_INT,v_rule_flag);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.23]subcall timed out!");
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
    strcpy(v_risk_item_id_str, lpTSCall1Ans1->GetString(LDBIZ_RISK_ITEM_ID_STR_STR));


    // set @记录序号# = 0;
    v_row_id = 0;

    // set @产品编号串# = " ";
    strcpy(v_pd_no_str," ");

    // set @交易组编号串# = " ";
    strcpy(v_exch_group_no_str," ");

    // set @维度序号# = 0;
    v_dime_id = 0;

    // set @触发阶段类型串# = " ";
    strcpy(v_trig_stage_type_str," ");

    // set @合规计算层级# = 0;
    v_compli_calc_level = 0;

    // set @触发方向# = 0;
    v_trig_type = 0;

    // set @模板序号# =0;
    v_model_id =0;

    // set @风险条目序号# =0;
    v_risk_item_id =0;

    // set @风险规则代码# = " ";
    strcpy(v_risk_rule_code," ");

    // set @风险要素串# = " ";
    strcpy(v_risk_param_str," ");

    // set @风险计算值串# = " ";
    strcpy(v_risk_rule_calc_str," ");

    // set @主推类型# = 1;
    v_push_type = 1;

    // set @更新次数# = 0;
    v_update_times = 0;

    // set @联合标志# = 0;
    v_union_flag = 0;

    // [主动推送][risk.securule][风控主推_规则_证券客户风险规则主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.140", 0);
    lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpPubMsg->SetString(LDBIZ_EXCH_GROUP_NO_STR_STR,v_exch_group_no_str);
    lpPubMsg->SetInt64(LDBIZ_DIME_ID_INT64,v_dime_id);
    lpPubMsg->SetString(LDBIZ_TRIG_STAGE_TYPE_STR_STR,v_trig_stage_type_str);
    lpPubMsg->SetInt32(LDBIZ_COMPLI_CALC_LEVEL_INT,v_compli_calc_level);
    lpPubMsg->SetInt32(LDBIZ_TRIG_TYPE_INT,v_trig_type);
    lpPubMsg->SetInt64(LDBIZ_MODEL_ID_INT64,v_model_id);
    lpPubMsg->SetInt32(LDBIZ_RISK_ITEM_ID_INT,v_risk_item_id);
    lpPubMsg->SetString(LDBIZ_RISK_ITEM_ID_STR_STR,v_risk_item_id_str);
    lpPubMsg->SetString(LDBIZ_RISK_RULE_CODE_STR,v_risk_rule_code);
    lpPubMsg->SetString(LDBIZ_RISK_PARAM_STR_STR,v_risk_param_str);
    lpPubMsg->SetString(LDBIZ_RISK_RULE_CALC_STR_STR,v_risk_rule_calc_str);
    lpPubMsg->SetInt32(LDBIZ_RULE_FLAG_INT,v_rule_flag);
    lpPubMsg->SetInt32(LDBIZ_PUSH_TYPE_INT,v_push_type);
    lpPubMsg->SetInt32(LDBIZ_UNION_FLAG_INT,v_union_flag);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("risk.securule", lpPubMsg);


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

//逻辑_风控证券_风控_批量试算检查客户风险
int LD_CALL_MODE fnFunc31(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    char v_asset_acco_no_str[2049];
    char v_exch_no_str[2049];
    char v_exch_crncy_type_str[2049];
    char v_stock_code_str[4097];
    char v_order_dir_str[1025];
    char v_order_price_str[4097];
    char v_order_qty_str[4097];
    int v_trig_stage_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_client_risk_rule_id;
    int v_pd_no;
    int v_exch_group_no;
    char v_compli_rules_remark[256];
    char v_risk_rule_action[33];
    char v_risk_rule_value_str[256];
    char v_risk_rule_calc_str[256];
    char v_remark_info[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_all_fee_str[4097];
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
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    strcpy(v_asset_acco_no_str, " ");
    strcpy(v_exch_no_str, " ");
    strcpy(v_exch_crncy_type_str, " ");
    strcpy(v_stock_code_str, " ");
    strcpy(v_order_dir_str, " ");
    strcpy(v_order_price_str, " ");
    strcpy(v_order_qty_str, " ");
    v_trig_stage_type=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_client_risk_rule_id=0;
    v_pd_no=0;
    v_exch_group_no=0;
    strcpy(v_compli_rules_remark, " ");
    strcpy(v_risk_rule_action, " ");
    strcpy(v_risk_rule_value_str, " ");
    strcpy(v_risk_rule_calc_str, " ");
    strcpy(v_remark_info, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_all_fee_str, " ");
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
    strncpy(v_pd_no_str, lpInBizMsg->GetString(LDBIZ_PD_NO_STR_STR),2048);
    v_pd_no_str[2048] = '\0';
    strncpy(v_exch_group_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_GROUP_NO_STR_STR),2048);
    v_exch_group_no_str[2048] = '\0';
    strncpy(v_asset_acco_no_str, lpInBizMsg->GetString(LDBIZ_ASSET_ACCO_NO_STR_STR),2048);
    v_asset_acco_no_str[2048] = '\0';
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    strncpy(v_exch_crncy_type_str, lpInBizMsg->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR_STR),2048);
    v_exch_crncy_type_str[2048] = '\0';
    strncpy(v_stock_code_str, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR_STR),4096);
    v_stock_code_str[4096] = '\0';
    strncpy(v_order_dir_str, lpInBizMsg->GetString(LDBIZ_ORDER_DIR_STR_STR),1024);
    v_order_dir_str[1024] = '\0';
    strncpy(v_order_price_str, lpInBizMsg->GetString(LDBIZ_ORDER_PRICE_STR_STR),4096);
    v_order_price_str[4096] = '\0';
    strncpy(v_order_qty_str, lpInBizMsg->GetString(LDBIZ_ORDER_QTY_STR_STR),4096);
    v_order_qty_str[4096] = '\0';
    v_trig_stage_type = lpInBizMsg->GetInt32(LDBIZ_TRIG_STAGE_TYPE_INT);

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

    //调用过程[事务_公共_风控接口_计算批量订单费用]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.27.6", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_ACCO_NO_STR_STR,v_asset_acco_no_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR_STR,v_stock_code_str);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_QTY_STR_STR,v_order_qty_str);
    lpTSCall1Req1->SetString(LDBIZ_ORDER_PRICE_STR_STR,v_order_price_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.27.6]subcall timed out!");
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
    strcpy(v_all_fee_str, lpTSCall1Ans1->GetString(LDBIZ_ALL_FEE_STR_STR));

    //调用过程[事务_风控证券_风控_批量试算检查客户风险]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.4.24", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req2->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpTSCall1Req2->SetString(LDBIZ_EXCH_GROUP_NO_STR_STR,v_exch_group_no_str);
    lpTSCall1Req2->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req2->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR_STR,v_exch_crncy_type_str);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_CODE_STR_STR,v_stock_code_str);
    lpTSCall1Req2->SetString(LDBIZ_ORDER_DIR_STR_STR,v_order_dir_str);
    lpTSCall1Req2->SetString(LDBIZ_ORDER_PRICE_STR_STR,v_order_price_str);
    lpTSCall1Req2->SetString(LDBIZ_ORDER_QTY_STR_STR,v_order_qty_str);
    lpTSCall1Req2->SetString(LDBIZ_ALL_FEE_STR_STR,v_all_fee_str);
    lpTSCall1Req2->SetInt32(LDBIZ_TRIG_STAGE_TYPE_INT,v_trig_stage_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.24]subcall timed out!");
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


    lpOutBizMsg->FillWithAnotherMsg(lpTSCall1Ans2);
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

//逻辑_风控证券_风控_T0操作员阈值信息查询
int LD_CALL_MODE fnFunc32(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int v_query_opor_no;
    double v_last_tshold_value;
    char v_posi_status[3];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_detail_posi_id;
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
    double v_float_pandl;
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
    char v_busi_ctrl_str[65];
    int v_init_date;
    char v_allow_opor_no_str[2049];
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
    v_query_opor_no=0;
    v_last_tshold_value=0;
    strcpy(v_posi_status, "0");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_detail_posi_id=0;
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
    v_float_pandl=0;
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
    strcpy(v_busi_ctrl_str, " ");
    v_init_date=0;
    strcpy(v_allow_opor_no_str, " ");
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
    v_query_opor_no = lpInBizMsg->GetInt32(LDBIZ_QUERY_OPOR_NO_INT);
    v_last_tshold_value = lpInBizMsg->GetDouble(LDBIZ_LAST_TSHOLD_VALUE_FLOAT);
    strncpy(v_posi_status, lpInBizMsg->GetString(LDBIZ_POSI_STATUS_STR),2);
    v_posi_status[2] = '\0';

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;


    // set @业务控制串# = "010";
    strcpy(v_busi_ctrl_str,"010");
    //调用过程[事务_公共_公共接口_检查系统状态权限身份操作员可操作操作员权限]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.16", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.16]subcall timed out!");
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
    strcpy(v_allow_opor_no_str, lpTSCall1Ans0->GetString(LDBIZ_ALLOW_OPOR_NO_STR_STR));


    // set @机构编号# = @操作员机构编号#;
    v_co_no = v_opor_co_no;
    //调用过程[事务_风控证券_风控_T0操作员阈值信息查询]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.25", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_QUERY_OPOR_NO_INT,v_query_opor_no);
    lpTSCall1Req1->SetDouble(LDBIZ_LAST_TSHOLD_VALUE_FLOAT,v_last_tshold_value);
    lpTSCall1Req1->SetString(LDBIZ_POSI_STATUS_STR,v_posi_status);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_ALLOW_OPOR_NO_STR_STR,v_allow_opor_no_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.25]subcall timed out!");
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

//逻辑_风控证券_风控_T0操作员阈值信息汇总查询
int LD_CALL_MODE fnFunc33(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int v_query_opor_no;
    double v_last_tshold_value;
    char v_posi_status[3];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_detail_posi_id;
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
    double v_float_pandl;
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
    char v_busi_ctrl_str[65];
    int v_init_date;
    char v_allow_opor_no_str[2049];
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
    v_query_opor_no=0;
    v_last_tshold_value=0;
    strcpy(v_posi_status, "0");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_detail_posi_id=0;
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
    v_float_pandl=0;
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
    strcpy(v_busi_ctrl_str, " ");
    v_init_date=0;
    strcpy(v_allow_opor_no_str, " ");
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
    v_query_opor_no = lpInBizMsg->GetInt32(LDBIZ_QUERY_OPOR_NO_INT);
    v_last_tshold_value = lpInBizMsg->GetDouble(LDBIZ_LAST_TSHOLD_VALUE_FLOAT);
    strncpy(v_posi_status, lpInBizMsg->GetString(LDBIZ_POSI_STATUS_STR),2);
    v_posi_status[2] = '\0';

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;


    // set @业务控制串# = "010";
    strcpy(v_busi_ctrl_str,"010");
    //调用过程[事务_公共_公共接口_检查系统状态权限身份操作员可操作操作员权限]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.16", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.16]subcall timed out!");
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
    strcpy(v_allow_opor_no_str, lpTSCall1Ans0->GetString(LDBIZ_ALLOW_OPOR_NO_STR_STR));


    // set @机构编号# = @操作员机构编号#;
    v_co_no = v_opor_co_no;
    //调用过程[事务_风控证券_风控_T0操作员阈值信息汇总查询]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.28", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_QUERY_OPOR_NO_INT,v_query_opor_no);
    lpTSCall1Req1->SetDouble(LDBIZ_LAST_TSHOLD_VALUE_FLOAT,v_last_tshold_value);
    lpTSCall1Req1->SetString(LDBIZ_POSI_STATUS_STR,v_posi_status);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_ALLOW_OPOR_NO_STR_STR,v_allow_opor_no_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.28]subcall timed out!");
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

//逻辑_风控证券_风控_新增操作员风险监控设置
int LD_CALL_MODE fnFunc34(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    char v_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_row_id;
    int64 v_moni_set_id;
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
    char v_moni_set_status[3];
    double v_cash_asset;
    double v_fund_asset;
    double v_bond_asset;
    double v_stock_asset;
    double v_repo_asset;
    double v_nav_asset;
    double v_stock_asset_ratio;
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
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_close_posi_flag=0;
    v_close_ratio_level_one=0;
    v_close_ratio_level_two=0;
    v_close_ratio_level_three=0;
    strcpy(v_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_row_id=0;
    v_moni_set_id=0;
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
    strcpy(v_moni_set_status, " ");
    v_cash_asset=0;
    v_fund_asset=0;
    v_bond_asset=0;
    v_stock_asset=0;
    v_repo_asset=0;
    v_nav_asset=0;
    v_stock_asset_ratio=0;
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_busi_opor_no = lpInBizMsg->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_moni_role_type = lpInBizMsg->GetInt32(LDBIZ_MONI_ROLE_TYPE_INT);
    v_moni_value_flag = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
    v_moni_value_type = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
    v_warn_posi_value = lpInBizMsg->GetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT);
    v_warn_trig_oper_type = lpInBizMsg->GetInt32(LDBIZ_WARN_TRIG_OPER_TYPE_INT);
    v_close_posi_value = lpInBizMsg->GetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT);
    v_close_trig_oper_type = lpInBizMsg->GetInt32(LDBIZ_CLOSE_TRIG_OPER_TYPE_INT);
    v_appd_value = lpInBizMsg->GetDouble(LDBIZ_APPD_VALUE_FLOAT);
    v_appd_trig_oper_type = lpInBizMsg->GetInt32(LDBIZ_APPD_TRIG_OPER_TYPE_INT);
    v_begin_moni_date = lpInBizMsg->GetInt32(LDBIZ_BEGIN_MONI_DATE_INT);
    v_begin_moni_value = lpInBizMsg->GetDouble(LDBIZ_BEGIN_MONI_VALUE_FLOAT);
    v_max_moni_value = lpInBizMsg->GetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT);
    strncpy(v_contrs_stock_code, lpInBizMsg->GetString(LDBIZ_CONTRS_STOCK_CODE_STR),6);
    v_contrs_stock_code[6] = '\0';
    v_contrs_exch_no = lpInBizMsg->GetInt32(LDBIZ_CONTRS_EXCH_NO_INT);
    v_contrs_max_moni_value = lpInBizMsg->GetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
    v_close_posi_flag = lpInBizMsg->GetInt32(LDBIZ_CLOSE_POSI_FLAG_INT);
    v_close_ratio_level_one = lpInBizMsg->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
    v_close_ratio_level_two = lpInBizMsg->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
    v_close_ratio_level_three = lpInBizMsg->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
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

    //调用过程[事务_风控证券_风控_新增操作员风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.29", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
    lpTSCall1Req1->SetInt32(LDBIZ_MONI_ROLE_TYPE_INT,v_moni_role_type);
    lpTSCall1Req1->SetInt32(LDBIZ_MONI_VALUE_FLAG_INT,v_moni_value_flag);
    lpTSCall1Req1->SetInt32(LDBIZ_MONI_VALUE_TYPE_INT,v_moni_value_type);
    lpTSCall1Req1->SetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT,v_warn_posi_value);
    lpTSCall1Req1->SetInt32(LDBIZ_WARN_TRIG_OPER_TYPE_INT,v_warn_trig_oper_type);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT,v_close_posi_value);
    lpTSCall1Req1->SetInt32(LDBIZ_CLOSE_TRIG_OPER_TYPE_INT,v_close_trig_oper_type);
    lpTSCall1Req1->SetDouble(LDBIZ_APPD_VALUE_FLOAT,v_appd_value);
    lpTSCall1Req1->SetInt32(LDBIZ_APPD_TRIG_OPER_TYPE_INT,v_appd_trig_oper_type);
    lpTSCall1Req1->SetInt32(LDBIZ_BEGIN_MONI_DATE_INT,v_begin_moni_date);
    lpTSCall1Req1->SetDouble(LDBIZ_BEGIN_MONI_VALUE_FLOAT,v_begin_moni_value);
    lpTSCall1Req1->SetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT,v_max_moni_value);
    lpTSCall1Req1->SetString(LDBIZ_CONTRS_STOCK_CODE_STR,v_contrs_stock_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRS_EXCH_NO_INT,v_contrs_exch_no);
    lpTSCall1Req1->SetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT,v_contrs_max_moni_value);
    lpTSCall1Req1->SetInt32(LDBIZ_CLOSE_POSI_FLAG_INT,v_close_posi_flag);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT,v_close_ratio_level_one);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT,v_close_ratio_level_two);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT,v_close_ratio_level_three);
    lpTSCall1Req1->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.29]subcall timed out!");
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


    // set @监控设置序号# = @记录序号#;
    v_moni_set_id = v_row_id;
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

//逻辑_风控证券_风控_修改操作员风险监控设置
int LD_CALL_MODE fnFunc35(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    double v_curr_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    int v_trig_oper_type;
    char v_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_update_times;
    int64 v_row_id;
    double v_curr_result_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
    char v_moni_set_status[3];
    double v_cash_asset;
    double v_fund_asset;
    double v_bond_asset;
    double v_stock_asset;
    double v_repo_asset;
    double v_nav_asset;
    double v_stock_asset_ratio;
    int v_time_stamp;
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
    v_curr_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_close_posi_flag=0;
    v_close_ratio_level_one=0;
    v_close_ratio_level_two=0;
    v_close_ratio_level_three=0;
    v_trig_oper_type=0;
    strcpy(v_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_update_times=1;
    v_row_id=0;
    v_curr_result_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
    strcpy(v_moni_set_status, " ");
    v_cash_asset=0;
    v_fund_asset=0;
    v_bond_asset=0;
    v_stock_asset=0;
    v_repo_asset=0;
    v_nav_asset=0;
    v_stock_asset_ratio=0;
    v_time_stamp=0;
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_busi_opor_no = lpInBizMsg->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_moni_role_type = lpInBizMsg->GetInt32(LDBIZ_MONI_ROLE_TYPE_INT);
    v_moni_value_flag = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
    v_moni_value_type = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
    v_warn_posi_value = lpInBizMsg->GetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT);
    v_warn_trig_oper_type = lpInBizMsg->GetInt32(LDBIZ_WARN_TRIG_OPER_TYPE_INT);
    v_close_posi_value = lpInBizMsg->GetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT);
    v_close_trig_oper_type = lpInBizMsg->GetInt32(LDBIZ_CLOSE_TRIG_OPER_TYPE_INT);
    v_appd_value = lpInBizMsg->GetDouble(LDBIZ_APPD_VALUE_FLOAT);
    v_appd_trig_oper_type = lpInBizMsg->GetInt32(LDBIZ_APPD_TRIG_OPER_TYPE_INT);
    v_begin_moni_date = lpInBizMsg->GetInt32(LDBIZ_BEGIN_MONI_DATE_INT);
    v_begin_moni_value = lpInBizMsg->GetDouble(LDBIZ_BEGIN_MONI_VALUE_FLOAT);
    v_max_moni_value = lpInBizMsg->GetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT);
    v_curr_moni_value = lpInBizMsg->GetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT);
    strncpy(v_contrs_stock_code, lpInBizMsg->GetString(LDBIZ_CONTRS_STOCK_CODE_STR),6);
    v_contrs_stock_code[6] = '\0';
    v_contrs_exch_no = lpInBizMsg->GetInt32(LDBIZ_CONTRS_EXCH_NO_INT);
    v_contrs_max_moni_value = lpInBizMsg->GetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
    v_close_posi_flag = lpInBizMsg->GetInt32(LDBIZ_CLOSE_POSI_FLAG_INT);
    v_close_ratio_level_one = lpInBizMsg->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
    v_close_ratio_level_two = lpInBizMsg->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
    v_close_ratio_level_three = lpInBizMsg->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
    v_trig_oper_type = lpInBizMsg->GetInt32(LDBIZ_TRIG_OPER_TYPE_INT);
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

    //调用过程[事务_风控证券_风控_修改操作员风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.30", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
    lpTSCall1Req1->SetInt32(LDBIZ_MONI_ROLE_TYPE_INT,v_moni_role_type);
    lpTSCall1Req1->SetInt32(LDBIZ_MONI_VALUE_FLAG_INT,v_moni_value_flag);
    lpTSCall1Req1->SetInt32(LDBIZ_MONI_VALUE_TYPE_INT,v_moni_value_type);
    lpTSCall1Req1->SetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT,v_warn_posi_value);
    lpTSCall1Req1->SetInt32(LDBIZ_WARN_TRIG_OPER_TYPE_INT,v_warn_trig_oper_type);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT,v_close_posi_value);
    lpTSCall1Req1->SetInt32(LDBIZ_CLOSE_TRIG_OPER_TYPE_INT,v_close_trig_oper_type);
    lpTSCall1Req1->SetDouble(LDBIZ_APPD_VALUE_FLOAT,v_appd_value);
    lpTSCall1Req1->SetInt32(LDBIZ_APPD_TRIG_OPER_TYPE_INT,v_appd_trig_oper_type);
    lpTSCall1Req1->SetInt32(LDBIZ_BEGIN_MONI_DATE_INT,v_begin_moni_date);
    lpTSCall1Req1->SetDouble(LDBIZ_BEGIN_MONI_VALUE_FLOAT,v_begin_moni_value);
    lpTSCall1Req1->SetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT,v_max_moni_value);
    lpTSCall1Req1->SetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT,v_curr_moni_value);
    lpTSCall1Req1->SetString(LDBIZ_CONTRS_STOCK_CODE_STR,v_contrs_stock_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CONTRS_EXCH_NO_INT,v_contrs_exch_no);
    lpTSCall1Req1->SetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT,v_contrs_max_moni_value);
    lpTSCall1Req1->SetInt32(LDBIZ_CLOSE_POSI_FLAG_INT,v_close_posi_flag);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT,v_close_ratio_level_one);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT,v_close_ratio_level_two);
    lpTSCall1Req1->SetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT,v_close_ratio_level_three);
    lpTSCall1Req1->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.30]subcall timed out!");
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
    v_update_times = lpTSCall1Ans1->GetInt32(LDBIZ_UPDATE_TIMES_INT);

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

//逻辑_风控证券_风控_删除操作员风险监控设置
int LD_CALL_MODE fnFunc36(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int64 v_moni_set_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_row_id;
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
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
    char v_moni_set_status[3];
    double v_cash_asset;
    double v_fund_asset;
    double v_bond_asset;
    double v_stock_asset;
    double v_repo_asset;
    double v_nav_asset;
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
    v_co_no=0;
    v_moni_set_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_row_id=0;
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
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
    strcpy(v_moni_set_status, " ");
    v_cash_asset=0;
    v_fund_asset=0;
    v_bond_asset=0;
    v_stock_asset=0;
    v_repo_asset=0;
    v_nav_asset=0;
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_moni_set_id = lpInBizMsg->GetInt64(LDBIZ_MONI_SET_ID_INT64);

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

    //调用过程[事务_风控证券_风控_删除操作员风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.31", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.31]subcall timed out!");
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


    // set @主推类型# = 2;
    v_push_type = 2;

    // set @记录序号# = @监控设置序号#;
    v_row_id = v_moni_set_id;

    // set @机构编号# = 0;
    v_co_no = 0;

    // set @监控值方式# = 0;
    v_moni_value_flag = 0;

    // set @监控值类型# = 0;
    v_moni_value_type = 0;

    // set @对比证券代码# = 0;
    strcpy(v_contrs_stock_code,"0");

    // set @对比市场编号# = 0;
    v_contrs_exch_no = 0;

    // set @更新次数# = 0;
    v_update_times = 0;

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

//逻辑_风控证券_风控_查询操作员风险监控设置
int LD_CALL_MODE fnFunc37(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int v_busi_opor_no;
    int v_moni_role_type;
    int v_moni_value_flag;
    int v_moni_value_type;
    char v_moni_set_status[3];
    char v_moni_result_status[3];
    int v_sort_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
    double v_warn_posi_value;
    int v_warn_trig_oper_type;
    double v_close_posi_value;
    int v_close_trig_oper_type;
    double v_appd_value;
    int v_appd_trig_oper_type;
    int v_begin_moni_date;
    double v_begin_moni_value;
    double v_max_moni_value;
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    double v_cash_asset;
    double v_fund_asset;
    double v_bond_asset;
    double v_stock_asset;
    double v_repo_asset;
    double v_nav_asset;
    double v_stock_asset_ratio;
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    char v_remark_info[256];
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
    v_busi_opor_no=0;
    v_moni_role_type=0;
    v_moni_value_flag=0;
    v_moni_value_type=0;
    strcpy(v_moni_set_status, " ");
    strcpy(v_moni_result_status, " ");
    v_sort_type=1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_row_id=0;
    v_warn_posi_value=0;
    v_warn_trig_oper_type=0;
    v_close_posi_value=0;
    v_close_trig_oper_type=0;
    v_appd_value=0;
    v_appd_trig_oper_type=0;
    v_begin_moni_date=0;
    v_begin_moni_value=0;
    v_max_moni_value=0;
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    v_cash_asset=0;
    v_fund_asset=0;
    v_bond_asset=0;
    v_stock_asset=0;
    v_repo_asset=0;
    v_nav_asset=0;
    v_stock_asset_ratio=0;
    v_close_posi_flag=0;
    v_close_ratio_level_one=0;
    v_close_ratio_level_two=0;
    v_close_ratio_level_three=0;
    strcpy(v_remark_info, " ");
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
    v_busi_opor_no = lpInBizMsg->GetInt32(LDBIZ_BUSI_OPOR_NO_INT);
    v_moni_role_type = lpInBizMsg->GetInt32(LDBIZ_MONI_ROLE_TYPE_INT);
    v_moni_value_flag = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
    v_moni_value_type = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
    strncpy(v_moni_set_status, lpInBizMsg->GetString(LDBIZ_MONI_SET_STATUS_STR),2);
    v_moni_set_status[2] = '\0';
    strncpy(v_moni_result_status, lpInBizMsg->GetString(LDBIZ_MONI_RESULT_STATUS_STR),2);
    v_moni_result_status[2] = '\0';
    v_sort_type = lpInBizMsg->GetInt32(LDBIZ_SORT_TYPE_INT);

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

    //调用过程[事务_风控证券_风控_查询操作员风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.32", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
    lpTSCall1Req1->SetInt32(LDBIZ_MONI_ROLE_TYPE_INT,v_moni_role_type);
    lpTSCall1Req1->SetInt32(LDBIZ_MONI_VALUE_FLAG_INT,v_moni_value_flag);
    lpTSCall1Req1->SetInt32(LDBIZ_MONI_VALUE_TYPE_INT,v_moni_value_type);
    lpTSCall1Req1->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    lpTSCall1Req1->SetString(LDBIZ_MONI_RESULT_STATUS_STR,v_moni_result_status);
    lpTSCall1Req1->SetInt32(LDBIZ_SORT_TYPE_INT,v_sort_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.32]subcall timed out!");
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

//逻辑_风控证券_风控_启停操作员风险监控设置
int LD_CALL_MODE fnFunc38(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int64 v_moni_set_id;
    char v_moni_set_status[3];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_row_id;
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
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    char v_moni_result_status[3];
    double v_cash_asset;
    double v_fund_asset;
    double v_bond_asset;
    double v_stock_asset;
    double v_repo_asset;
    double v_nav_asset;
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
    v_co_no=0;
    v_moni_set_id=0;
    strcpy(v_moni_set_status, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_row_id=0;
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
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    strcpy(v_moni_result_status, " ");
    v_cash_asset=0;
    v_fund_asset=0;
    v_bond_asset=0;
    v_stock_asset=0;
    v_repo_asset=0;
    v_nav_asset=0;
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_moni_set_id = lpInBizMsg->GetInt64(LDBIZ_MONI_SET_ID_INT64);
    strncpy(v_moni_set_status, lpInBizMsg->GetString(LDBIZ_MONI_SET_STATUS_STR),2);
    v_moni_set_status[2] = '\0';

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

    //调用过程[事务_风控证券_风控_更新操作员风险监控设置状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.33", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt64(LDBIZ_MONI_SET_ID_INT64,v_moni_set_id);
    lpTSCall1Req1->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.33]subcall timed out!");
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

//逻辑_风控证券_风控_启停所有操作员风险监控设置
int LD_CALL_MODE fnFunc39(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    char v_moni_set_status[3];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_busi_opor_no;
    int v_moni_role_type;
    int v_moni_value_flag;
    int v_moni_value_type;
    char v_moni_result_status[3];
    char v_exch_group_no_rights_str[2049];
    char v_pd_no_rights_str[2049];
    char v_co_no_rights_str[2049];
    int v_sort_type;
    int v_push_type;
    int64 v_row_id;
    double v_warn_posi_value;
    int v_warn_trig_oper_type;
    double v_close_posi_value;
    int v_close_trig_oper_type;
    double v_appd_value;
    int v_appd_trig_oper_type;
    int v_begin_moni_date;
    double v_begin_moni_value;
    double v_max_moni_value;
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    double v_cash_asset;
    double v_fund_asset;
    double v_bond_asset;
    double v_stock_asset;
    double v_repo_asset;
    double v_nav_asset;
    double v_stock_asset_ratio;
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    char v_remark_info[256];
    int v_time_stamp;
    int v_update_times;
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
    v_co_no=0;
    strcpy(v_moni_set_status, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_busi_opor_no=0;
    v_moni_role_type=0;
    v_moni_value_flag=0;
    v_moni_value_type=0;
    strcpy(v_moni_result_status, " ");
    strcpy(v_exch_group_no_rights_str, " ");
    strcpy(v_pd_no_rights_str, " ");
    strcpy(v_co_no_rights_str, " ");
    v_sort_type=1;
    v_push_type=0;
    v_row_id=0;
    v_warn_posi_value=0;
    v_warn_trig_oper_type=0;
    v_close_posi_value=0;
    v_close_trig_oper_type=0;
    v_appd_value=0;
    v_appd_trig_oper_type=0;
    v_begin_moni_date=0;
    v_begin_moni_value=0;
    v_max_moni_value=0;
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    v_cash_asset=0;
    v_fund_asset=0;
    v_bond_asset=0;
    v_stock_asset=0;
    v_repo_asset=0;
    v_nav_asset=0;
    v_stock_asset_ratio=0;
    v_close_posi_flag=0;
    v_close_ratio_level_one=0;
    v_close_ratio_level_two=0;
    v_close_ratio_level_three=0;
    strcpy(v_remark_info, " ");
    v_time_stamp=0;
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    strncpy(v_moni_set_status, lpInBizMsg->GetString(LDBIZ_MONI_SET_STATUS_STR),2);
    v_moni_set_status[2] = '\0';

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

    //调用过程[事务_风控证券_风控_更新所有操作员风险监控设置状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.34", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.34]subcall timed out!");
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


    // set @业务操作员编号# = 0;
    v_busi_opor_no = 0;

    // set @监控角色# = 0;
    v_moni_role_type = 0;

    // set @监控值方式# = 0;
    v_moni_value_flag = 0;

    // set @监控值类型# = 0;
    v_moni_value_type = 0;

    // set @监控设置状态# = " ";
    strcpy(v_moni_set_status," ");

    // set @监控结果状态# = " ";
    strcpy(v_moni_result_status," ");

    // set @交易组编号权限串# = " ";
    strcpy(v_exch_group_no_rights_str," ");

    // set @产品编号权限串# = " ";
    strcpy(v_pd_no_rights_str," ");

    // set @机构编号权限串# = " ";
    strcpy(v_co_no_rights_str," ");

    // set @排序方式# = 1;
    v_sort_type = 1;

    // set @主推类型# = 1;
    v_push_type = 1;
    //调用过程[事务_风控证券_风控_查询操作员风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("rksecuT.4.32", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_BUSI_OPOR_NO_INT,v_busi_opor_no);
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_ROLE_TYPE_INT,v_moni_role_type);
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_VALUE_FLAG_INT,v_moni_value_flag);
    lpTSCall1Req2->SetInt32(LDBIZ_MONI_VALUE_TYPE_INT,v_moni_value_type);
    lpTSCall1Req2->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    lpTSCall1Req2->SetString(LDBIZ_MONI_RESULT_STATUS_STR,v_moni_result_status);
    lpTSCall1Req2->SetInt32(LDBIZ_SORT_TYPE_INT,v_sort_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.32]subcall timed out!");
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
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            v_opor_no = lpRecord->GetInt32(LDBIZ_OPOR_NO_INT);
            v_moni_role_type = lpRecord->GetInt32(LDBIZ_MONI_ROLE_TYPE_INT);
            v_moni_value_flag = lpRecord->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
            v_moni_value_type = lpRecord->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
            v_warn_posi_value = lpRecord->GetDouble(LDBIZ_WARN_POSI_VALUE_FLOAT);
            v_warn_trig_oper_type = lpRecord->GetInt32(LDBIZ_WARN_TRIG_OPER_TYPE_INT);
            v_close_posi_value = lpRecord->GetDouble(LDBIZ_CLOSE_POSI_VALUE_FLOAT);
            v_close_trig_oper_type = lpRecord->GetInt32(LDBIZ_CLOSE_TRIG_OPER_TYPE_INT);
            v_appd_value = lpRecord->GetDouble(LDBIZ_APPD_VALUE_FLOAT);
            v_appd_trig_oper_type = lpRecord->GetInt32(LDBIZ_APPD_TRIG_OPER_TYPE_INT);
            v_begin_moni_date = lpRecord->GetInt32(LDBIZ_BEGIN_MONI_DATE_INT);
            v_begin_moni_value = lpRecord->GetDouble(LDBIZ_BEGIN_MONI_VALUE_FLOAT);
            v_max_moni_value = lpRecord->GetDouble(LDBIZ_MAX_MONI_VALUE_FLOAT);
            v_curr_moni_value = lpRecord->GetDouble(LDBIZ_CURR_MONI_VALUE_FLOAT);
            v_curr_result_moni_value = lpRecord->GetDouble(LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
            strcpy(v_contrs_stock_code, lpRecord->GetString(LDBIZ_CONTRS_STOCK_CODE_STR));
            v_contrs_exch_no = lpRecord->GetInt32(LDBIZ_CONTRS_EXCH_NO_INT);
            v_contrs_max_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
            v_contrs_curr_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
            v_contrs_result_moni_value = lpRecord->GetDouble(LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
            v_moni_result_value = lpRecord->GetDouble(LDBIZ_MONI_RESULT_VALUE_FLOAT);
            strcpy(v_moni_result_status, lpRecord->GetString(LDBIZ_MONI_RESULT_STATUS_STR));
            strcpy(v_moni_set_status, lpRecord->GetString(LDBIZ_MONI_SET_STATUS_STR));
            v_cash_asset = lpRecord->GetDouble(LDBIZ_CASH_ASSET_FLOAT);
            v_fund_asset = lpRecord->GetDouble(LDBIZ_FUND_ASSET_FLOAT);
            v_bond_asset = lpRecord->GetDouble(LDBIZ_BOND_ASSET_FLOAT);
            v_stock_asset = lpRecord->GetDouble(LDBIZ_STOCK_ASSET_FLOAT);
            v_repo_asset = lpRecord->GetDouble(LDBIZ_REPO_ASSET_FLOAT);
            v_nav_asset = lpRecord->GetDouble(LDBIZ_NAV_ASSET_FLOAT);
            v_stock_asset_ratio = lpRecord->GetDouble(LDBIZ_STOCK_ASSET_RATIO_FLOAT);
            v_close_posi_flag = lpRecord->GetInt32(LDBIZ_CLOSE_POSI_FLAG_INT);
            v_close_ratio_level_one = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
            v_close_ratio_level_two = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
            v_close_ratio_level_three = lpRecord->GetDouble(LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
            strcpy(v_remark_info, lpRecord->GetString(LDBIZ_REMARK_INFO_STR));
            v_time_stamp = lpRecord->GetInt32(LDBIZ_TIME_STAMP_INT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


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


    // [遍历结果集结束][lpMainMsg]
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

//逻辑_风控证券_风控_查询T0操作员触警流水信息
int LD_CALL_MODE fnFunc40(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int v_query_opor_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_exch_no;
    int v_stock_code_no;
    int v_begin_date;
    int v_end_date;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_create_date;
    int v_create_time;
    int v_asset_acco_no;
    int v_stock_acco_no;
    int v_lngsht_type;
    double v_curr_qty;
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
    double v_cost_price;
    double v_last_tshold_value;
    double v_float_pandl;
    char v_moni_result_status[3];
    double v_opor_warn_tshold;
    double v_opor_stop_tshold;
    double v_stock_warn_ratio;
    double v_stock_stop_ratio;
    double v_stock_warn_amt;
    double v_stock_stop_amt;
    int v_open_close_permission;
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
    v_query_opor_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_exch_no=0;
    v_stock_code_no=0;
    v_begin_date=0;
    v_end_date=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_create_date=0;
    v_create_time=0;
    v_asset_acco_no=0;
    v_stock_acco_no=0;
    v_lngsht_type=0;
    v_curr_qty=0;
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
    v_cost_price=0;
    v_last_tshold_value=0;
    v_float_pandl=0;
    strcpy(v_moni_result_status, " ");
    v_opor_warn_tshold=0;
    v_opor_stop_tshold=0;
    v_stock_warn_ratio=0;
    v_stock_stop_ratio=0;
    v_stock_warn_amt=0;
    v_stock_stop_amt=0;
    v_open_close_permission=0;
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
    v_query_opor_no = lpInBizMsg->GetInt32(LDBIZ_QUERY_OPOR_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_begin_date = lpInBizMsg->GetInt32(LDBIZ_BEGIN_DATE_INT);
    v_end_date = lpInBizMsg->GetInt32(LDBIZ_END_DATE_INT);

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

    //调用过程[事务_风控证券_风控_查询T0操作员触警流水信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.36", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_QUERY_OPOR_NO_INT,v_query_opor_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req1->SetInt32(LDBIZ_BEGIN_DATE_INT,v_begin_date);
    lpTSCall1Req1->SetInt32(LDBIZ_END_DATE_INT,v_end_date);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.36]subcall timed out!");
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

//逻辑_风控证券_风控_查询T0操作员汇总触警流水信息
int LD_CALL_MODE fnFunc41(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int v_query_opor_no;
    int v_begin_date;
    int v_end_date;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_create_date;
    int v_create_time;
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
    v_query_opor_no=0;
    v_begin_date=0;
    v_end_date=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_create_date=0;
    v_create_time=0;
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
    v_query_opor_no = lpInBizMsg->GetInt32(LDBIZ_QUERY_OPOR_NO_INT);
    v_begin_date = lpInBizMsg->GetInt32(LDBIZ_BEGIN_DATE_INT);
    v_end_date = lpInBizMsg->GetInt32(LDBIZ_END_DATE_INT);

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

    //调用过程[事务_风控证券_风控_查询T0操作员汇总触警流水信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.37", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_QUERY_OPOR_NO_INT,v_query_opor_no);
    lpTSCall1Req1->SetInt32(LDBIZ_BEGIN_DATE_INT,v_begin_date);
    lpTSCall1Req1->SetInt32(LDBIZ_END_DATE_INT,v_end_date);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.37]subcall timed out!");
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

//逻辑_风控证券_风控_查询T0操作员历史触警流水信息
int LD_CALL_MODE fnFunc42(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int v_query_opor_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_exch_no;
    int v_stock_code_no;
    int v_begin_date;
    int v_end_date;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_create_date;
    int v_create_time;
    int v_asset_acco_no;
    int v_stock_acco_no;
    int v_lngsht_type;
    double v_curr_qty;
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
    double v_cost_price;
    double v_last_tshold_value;
    double v_float_pandl;
    char v_moni_result_status[3];
    double v_opor_warn_tshold;
    double v_opor_stop_tshold;
    double v_stock_warn_ratio;
    double v_stock_stop_ratio;
    double v_stock_warn_amt;
    double v_stock_stop_amt;
    int v_open_close_permission;
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
    v_query_opor_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_exch_no=0;
    v_stock_code_no=0;
    v_begin_date=0;
    v_end_date=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_create_date=0;
    v_create_time=0;
    v_asset_acco_no=0;
    v_stock_acco_no=0;
    v_lngsht_type=0;
    v_curr_qty=0;
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
    v_cost_price=0;
    v_last_tshold_value=0;
    v_float_pandl=0;
    strcpy(v_moni_result_status, " ");
    v_opor_warn_tshold=0;
    v_opor_stop_tshold=0;
    v_stock_warn_ratio=0;
    v_stock_stop_ratio=0;
    v_stock_warn_amt=0;
    v_stock_stop_amt=0;
    v_open_close_permission=0;
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
    v_query_opor_no = lpInBizMsg->GetInt32(LDBIZ_QUERY_OPOR_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_begin_date = lpInBizMsg->GetInt32(LDBIZ_BEGIN_DATE_INT);
    v_end_date = lpInBizMsg->GetInt32(LDBIZ_END_DATE_INT);

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

    //调用过程[事务_风控证券_风控_查询T0操作员历史触警流水信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.38", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_QUERY_OPOR_NO_INT,v_query_opor_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req1->SetInt32(LDBIZ_BEGIN_DATE_INT,v_begin_date);
    lpTSCall1Req1->SetInt32(LDBIZ_END_DATE_INT,v_end_date);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.38]subcall timed out!");
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

//逻辑_风控证券_风控_查询T0操作员历史汇总触警流水信息
int LD_CALL_MODE fnFunc43(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int v_query_opor_no;
    int v_begin_date;
    int v_end_date;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_create_date;
    int v_create_time;
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
    v_query_opor_no=0;
    v_begin_date=0;
    v_end_date=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_create_date=0;
    v_create_time=0;
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
    v_query_opor_no = lpInBizMsg->GetInt32(LDBIZ_QUERY_OPOR_NO_INT);
    v_begin_date = lpInBizMsg->GetInt32(LDBIZ_BEGIN_DATE_INT);
    v_end_date = lpInBizMsg->GetInt32(LDBIZ_END_DATE_INT);

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

    //调用过程[事务_风控证券_风控_查询T0操作员历史汇总触警流水信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.39", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_QUERY_OPOR_NO_INT,v_query_opor_no);
    lpTSCall1Req1->SetInt32(LDBIZ_BEGIN_DATE_INT,v_begin_date);
    lpTSCall1Req1->SetInt32(LDBIZ_END_DATE_INT,v_end_date);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.39]subcall timed out!");
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

//逻辑_风控证券_风控_删除客户风险触警流水
int LD_CALL_MODE fnFunc44(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int v_trig_stage_type;
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
    v_trig_stage_type=0;
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
    v_trig_stage_type = lpInBizMsg->GetInt32(LDBIZ_TRIG_STAGE_TYPE_INT);

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

    //调用过程[事务_风控证券_风控_删除客户风险触警流水]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.40", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_TRIG_STAGE_TYPE_INT,v_trig_stage_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.40]subcall timed out!");
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

//逻辑_风控证券_风控_更新资产账户融资融券保证金计算结果集
int LD_CALL_MODE fnFunc45(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    double v_curr_converted_margin;
    double v_cmmd_converted_margin;
    double v_order_converted_margin;
    double v_fina_market_value;
    double v_fina_profit;
    double v_fina_converted_pandl;
    double v_loan_market_value;
    double v_loan_profit;
    double v_loan_converted_pandl;
    double v_fina_capt_margin;
    double v_loan_capt_margin;
    double v_keep_guarantee_ratio;
    double v_loan_sell_amt;
    double v_margin_ratio_market_value;
    double v_fina_interest;
    double v_loan_interest;
    int v_update_times;
    double v_fina_comm_capt_margin;
    double v_loan_comm_capt_margin;
    double v_fina_order_capt_margin;
    double v_loan_order_capt_margin;
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
    v_pd_no=0;
    v_asset_acco_no=0;
    v_curr_converted_margin=0;
    v_cmmd_converted_margin=0;
    v_order_converted_margin=0;
    v_fina_market_value=0;
    v_fina_profit=0;
    v_fina_converted_pandl=0;
    v_loan_market_value=0;
    v_loan_profit=0;
    v_loan_converted_pandl=0;
    v_fina_capt_margin=0;
    v_loan_capt_margin=0;
    v_keep_guarantee_ratio=0;
    v_loan_sell_amt=0;
    v_margin_ratio_market_value=0;
    v_fina_interest=0;
    v_loan_interest=0;
    v_update_times=1;
    v_fina_comm_capt_margin=0;
    v_loan_comm_capt_margin=0;
    v_fina_order_capt_margin=0;
    v_loan_order_capt_margin=0;
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
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_curr_converted_margin = lpInBizMsg->GetDouble(LDBIZ_CURR_CONVERTED_MARGIN_FLOAT);
    v_cmmd_converted_margin = lpInBizMsg->GetDouble(LDBIZ_CMMD_CONVERTED_MARGIN_FLOAT);
    v_order_converted_margin = lpInBizMsg->GetDouble(LDBIZ_ORDER_CONVERTED_MARGIN_FLOAT);
    v_fina_market_value = lpInBizMsg->GetDouble(LDBIZ_FINA_MARKET_VALUE_FLOAT);
    v_fina_profit = lpInBizMsg->GetDouble(LDBIZ_FINA_PROFIT_FLOAT);
    v_fina_converted_pandl = lpInBizMsg->GetDouble(LDBIZ_FINA_CONVERTED_PANDL_FLOAT);
    v_loan_market_value = lpInBizMsg->GetDouble(LDBIZ_LOAN_MARKET_VALUE_FLOAT);
    v_loan_profit = lpInBizMsg->GetDouble(LDBIZ_LOAN_PROFIT_FLOAT);
    v_loan_converted_pandl = lpInBizMsg->GetDouble(LDBIZ_LOAN_CONVERTED_PANDL_FLOAT);
    v_fina_capt_margin = lpInBizMsg->GetDouble(LDBIZ_FINA_CAPT_MARGIN_FLOAT);
    v_loan_capt_margin = lpInBizMsg->GetDouble(LDBIZ_LOAN_CAPT_MARGIN_FLOAT);
    v_keep_guarantee_ratio = lpInBizMsg->GetDouble(LDBIZ_KEEP_GUARANTEE_RATIO_FLOAT);
    v_loan_sell_amt = lpInBizMsg->GetDouble(LDBIZ_LOAN_SELL_AMT_FLOAT);
    v_margin_ratio_market_value = lpInBizMsg->GetDouble(LDBIZ_MARGIN_RATIO_MARKET_VALUE_FLOAT);
    v_fina_interest = lpInBizMsg->GetDouble(LDBIZ_FINA_INTEREST_FLOAT);
    v_loan_interest = lpInBizMsg->GetDouble(LDBIZ_LOAN_INTEREST_FLOAT);
    v_update_times = lpInBizMsg->GetInt32(LDBIZ_UPDATE_TIMES_INT);
    v_fina_comm_capt_margin = lpInBizMsg->GetDouble(LDBIZ_FINA_COMM_CAPT_MARGIN_FLOAT);
    v_loan_comm_capt_margin = lpInBizMsg->GetDouble(LDBIZ_LOAN_COMM_CAPT_MARGIN_FLOAT);
    v_fina_order_capt_margin = lpInBizMsg->GetDouble(LDBIZ_FINA_ORDER_CAPT_MARGIN_FLOAT);
    v_loan_order_capt_margin = lpInBizMsg->GetDouble(LDBIZ_LOAN_ORDER_CAPT_MARGIN_FLOAT);

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

    //调用过程[事务_风控证券_风控_更新资产账户融资融券保证金计算结果集]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.51", 0);
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
    lpTSCall1Req1->SetDouble(LDBIZ_CURR_CONVERTED_MARGIN_FLOAT,v_curr_converted_margin);
    lpTSCall1Req1->SetDouble(LDBIZ_CMMD_CONVERTED_MARGIN_FLOAT,v_cmmd_converted_margin);
    lpTSCall1Req1->SetDouble(LDBIZ_ORDER_CONVERTED_MARGIN_FLOAT,v_order_converted_margin);
    lpTSCall1Req1->SetDouble(LDBIZ_FINA_MARKET_VALUE_FLOAT,v_fina_market_value);
    lpTSCall1Req1->SetDouble(LDBIZ_FINA_PROFIT_FLOAT,v_fina_profit);
    lpTSCall1Req1->SetDouble(LDBIZ_FINA_CONVERTED_PANDL_FLOAT,v_fina_converted_pandl);
    lpTSCall1Req1->SetDouble(LDBIZ_LOAN_MARKET_VALUE_FLOAT,v_loan_market_value);
    lpTSCall1Req1->SetDouble(LDBIZ_LOAN_PROFIT_FLOAT,v_loan_profit);
    lpTSCall1Req1->SetDouble(LDBIZ_LOAN_CONVERTED_PANDL_FLOAT,v_loan_converted_pandl);
    lpTSCall1Req1->SetDouble(LDBIZ_FINA_CAPT_MARGIN_FLOAT,v_fina_capt_margin);
    lpTSCall1Req1->SetDouble(LDBIZ_LOAN_CAPT_MARGIN_FLOAT,v_loan_capt_margin);
    lpTSCall1Req1->SetDouble(LDBIZ_KEEP_GUARANTEE_RATIO_FLOAT,v_keep_guarantee_ratio);
    lpTSCall1Req1->SetDouble(LDBIZ_LOAN_SELL_AMT_FLOAT,v_loan_sell_amt);
    lpTSCall1Req1->SetDouble(LDBIZ_MARGIN_RATIO_MARKET_VALUE_FLOAT,v_margin_ratio_market_value);
    lpTSCall1Req1->SetDouble(LDBIZ_FINA_INTEREST_FLOAT,v_fina_interest);
    lpTSCall1Req1->SetDouble(LDBIZ_LOAN_INTEREST_FLOAT,v_loan_interest);
    lpTSCall1Req1->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    lpTSCall1Req1->SetDouble(LDBIZ_FINA_COMM_CAPT_MARGIN_FLOAT,v_fina_comm_capt_margin);
    lpTSCall1Req1->SetDouble(LDBIZ_LOAN_COMM_CAPT_MARGIN_FLOAT,v_loan_comm_capt_margin);
    lpTSCall1Req1->SetDouble(LDBIZ_FINA_ORDER_CAPT_MARGIN_FLOAT,v_fina_order_capt_margin);
    lpTSCall1Req1->SetDouble(LDBIZ_LOAN_ORDER_CAPT_MARGIN_FLOAT,v_loan_order_capt_margin);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.51]subcall timed out!");
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

//逻辑_风控证券_风控_查询资产账户融资融券保证金计算结果集
int LD_CALL_MODE fnFunc46(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    char v_exch_crncy_type[4];
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    double v_curr_converted_margin;
    double v_cmmd_converted_margin;
    double v_order_converted_margin;
    double v_fina_market_value;
    double v_fina_profit;
    double v_fina_converted_pandl;
    double v_loan_market_value;
    double v_loan_profit;
    double v_loan_converted_pandl;
    double v_fina_capt_margin;
    double v_loan_capt_margin;
    double v_keep_guarantee_ratio;
    double v_loan_sell_amt;
    double v_margin_ratio_market_value;
    double v_fina_interest;
    double v_loan_interest;
    int v_update_times;
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
    v_co_no=0;
    v_pd_no=0;
    v_asset_acco_no=0;
    strcpy(v_exch_crncy_type, "CNY");
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_curr_converted_margin=0;
    v_cmmd_converted_margin=0;
    v_order_converted_margin=0;
    v_fina_market_value=0;
    v_fina_profit=0;
    v_fina_converted_pandl=0;
    v_loan_market_value=0;
    v_loan_profit=0;
    v_loan_converted_pandl=0;
    v_fina_capt_margin=0;
    v_loan_capt_margin=0;
    v_keep_guarantee_ratio=0;
    v_loan_sell_amt=0;
    v_margin_ratio_market_value=0;
    v_fina_interest=0;
    v_loan_interest=0;
    v_update_times=1;
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strncpy(v_exch_crncy_type, lpInBizMsg->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR),3);
    v_exch_crncy_type[3] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;


    // set @业务控制串# = "001";
    strcpy(v_busi_ctrl_str,"001");
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

    //set @机构编号// = @操作员机构编号//;
    //调用过程[事务_风控证券_风控_查询资产账户融资融券保证金计算结果集]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.54", 0);
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
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.54]subcall timed out!");
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

//逻辑_风控证券_风控_更新交易组融资融券保证金计算结果集
int LD_CALL_MODE fnFunc47(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int v_exch_group_no;
    double v_curr_converted_margin;
    double v_cmmd_converted_margin;
    double v_order_converted_margin;
    double v_fina_market_value;
    double v_fina_profit;
    double v_fina_converted_pandl;
    double v_loan_market_value;
    double v_loan_profit;
    double v_loan_converted_pandl;
    double v_fina_capt_margin;
    double v_loan_capt_margin;
    double v_keep_guarantee_ratio;
    double v_loan_sell_amt;
    double v_margin_ratio_market_value;
    double v_fina_interest;
    double v_loan_interest;
    int v_update_times;
    double v_fina_comm_capt_margin;
    double v_loan_comm_capt_margin;
    double v_fina_order_capt_margin;
    double v_loan_order_capt_margin;
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
    v_pd_no=0;
    v_asset_acco_no=0;
    v_exch_group_no=0;
    v_curr_converted_margin=0;
    v_cmmd_converted_margin=0;
    v_order_converted_margin=0;
    v_fina_market_value=0;
    v_fina_profit=0;
    v_fina_converted_pandl=0;
    v_loan_market_value=0;
    v_loan_profit=0;
    v_loan_converted_pandl=0;
    v_fina_capt_margin=0;
    v_loan_capt_margin=0;
    v_keep_guarantee_ratio=0;
    v_loan_sell_amt=0;
    v_margin_ratio_market_value=0;
    v_fina_interest=0;
    v_loan_interest=0;
    v_update_times=1;
    v_fina_comm_capt_margin=0;
    v_loan_comm_capt_margin=0;
    v_fina_order_capt_margin=0;
    v_loan_order_capt_margin=0;
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
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_curr_converted_margin = lpInBizMsg->GetDouble(LDBIZ_CURR_CONVERTED_MARGIN_FLOAT);
    v_cmmd_converted_margin = lpInBizMsg->GetDouble(LDBIZ_CMMD_CONVERTED_MARGIN_FLOAT);
    v_order_converted_margin = lpInBizMsg->GetDouble(LDBIZ_ORDER_CONVERTED_MARGIN_FLOAT);
    v_fina_market_value = lpInBizMsg->GetDouble(LDBIZ_FINA_MARKET_VALUE_FLOAT);
    v_fina_profit = lpInBizMsg->GetDouble(LDBIZ_FINA_PROFIT_FLOAT);
    v_fina_converted_pandl = lpInBizMsg->GetDouble(LDBIZ_FINA_CONVERTED_PANDL_FLOAT);
    v_loan_market_value = lpInBizMsg->GetDouble(LDBIZ_LOAN_MARKET_VALUE_FLOAT);
    v_loan_profit = lpInBizMsg->GetDouble(LDBIZ_LOAN_PROFIT_FLOAT);
    v_loan_converted_pandl = lpInBizMsg->GetDouble(LDBIZ_LOAN_CONVERTED_PANDL_FLOAT);
    v_fina_capt_margin = lpInBizMsg->GetDouble(LDBIZ_FINA_CAPT_MARGIN_FLOAT);
    v_loan_capt_margin = lpInBizMsg->GetDouble(LDBIZ_LOAN_CAPT_MARGIN_FLOAT);
    v_keep_guarantee_ratio = lpInBizMsg->GetDouble(LDBIZ_KEEP_GUARANTEE_RATIO_FLOAT);
    v_loan_sell_amt = lpInBizMsg->GetDouble(LDBIZ_LOAN_SELL_AMT_FLOAT);
    v_margin_ratio_market_value = lpInBizMsg->GetDouble(LDBIZ_MARGIN_RATIO_MARKET_VALUE_FLOAT);
    v_fina_interest = lpInBizMsg->GetDouble(LDBIZ_FINA_INTEREST_FLOAT);
    v_loan_interest = lpInBizMsg->GetDouble(LDBIZ_LOAN_INTEREST_FLOAT);
    v_update_times = lpInBizMsg->GetInt32(LDBIZ_UPDATE_TIMES_INT);
    v_fina_comm_capt_margin = lpInBizMsg->GetDouble(LDBIZ_FINA_COMM_CAPT_MARGIN_FLOAT);
    v_loan_comm_capt_margin = lpInBizMsg->GetDouble(LDBIZ_LOAN_COMM_CAPT_MARGIN_FLOAT);
    v_fina_order_capt_margin = lpInBizMsg->GetDouble(LDBIZ_FINA_ORDER_CAPT_MARGIN_FLOAT);
    v_loan_order_capt_margin = lpInBizMsg->GetDouble(LDBIZ_LOAN_ORDER_CAPT_MARGIN_FLOAT);

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

    //调用过程[事务_风控证券_风控_更新交易组融资融券保证金计算结果集]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.61", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetDouble(LDBIZ_CURR_CONVERTED_MARGIN_FLOAT,v_curr_converted_margin);
    lpTSCall1Req1->SetDouble(LDBIZ_CMMD_CONVERTED_MARGIN_FLOAT,v_cmmd_converted_margin);
    lpTSCall1Req1->SetDouble(LDBIZ_ORDER_CONVERTED_MARGIN_FLOAT,v_order_converted_margin);
    lpTSCall1Req1->SetDouble(LDBIZ_FINA_MARKET_VALUE_FLOAT,v_fina_market_value);
    lpTSCall1Req1->SetDouble(LDBIZ_FINA_PROFIT_FLOAT,v_fina_profit);
    lpTSCall1Req1->SetDouble(LDBIZ_FINA_CONVERTED_PANDL_FLOAT,v_fina_converted_pandl);
    lpTSCall1Req1->SetDouble(LDBIZ_LOAN_MARKET_VALUE_FLOAT,v_loan_market_value);
    lpTSCall1Req1->SetDouble(LDBIZ_LOAN_PROFIT_FLOAT,v_loan_profit);
    lpTSCall1Req1->SetDouble(LDBIZ_LOAN_CONVERTED_PANDL_FLOAT,v_loan_converted_pandl);
    lpTSCall1Req1->SetDouble(LDBIZ_FINA_CAPT_MARGIN_FLOAT,v_fina_capt_margin);
    lpTSCall1Req1->SetDouble(LDBIZ_LOAN_CAPT_MARGIN_FLOAT,v_loan_capt_margin);
    lpTSCall1Req1->SetDouble(LDBIZ_KEEP_GUARANTEE_RATIO_FLOAT,v_keep_guarantee_ratio);
    lpTSCall1Req1->SetDouble(LDBIZ_LOAN_SELL_AMT_FLOAT,v_loan_sell_amt);
    lpTSCall1Req1->SetDouble(LDBIZ_MARGIN_RATIO_MARKET_VALUE_FLOAT,v_margin_ratio_market_value);
    lpTSCall1Req1->SetDouble(LDBIZ_FINA_INTEREST_FLOAT,v_fina_interest);
    lpTSCall1Req1->SetDouble(LDBIZ_LOAN_INTEREST_FLOAT,v_loan_interest);
    lpTSCall1Req1->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    lpTSCall1Req1->SetDouble(LDBIZ_FINA_COMM_CAPT_MARGIN_FLOAT,v_fina_comm_capt_margin);
    lpTSCall1Req1->SetDouble(LDBIZ_LOAN_COMM_CAPT_MARGIN_FLOAT,v_loan_comm_capt_margin);
    lpTSCall1Req1->SetDouble(LDBIZ_FINA_ORDER_CAPT_MARGIN_FLOAT,v_fina_order_capt_margin);
    lpTSCall1Req1->SetDouble(LDBIZ_LOAN_ORDER_CAPT_MARGIN_FLOAT,v_loan_order_capt_margin);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.61]subcall timed out!");
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

//逻辑_风控证券_风控_查询交易组融资融券保证金计算结果集
int LD_CALL_MODE fnFunc48(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int v_exch_group_no;
    char v_exch_crncy_type[4];
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    double v_curr_converted_margin;
    double v_cmmd_converted_margin;
    double v_order_converted_margin;
    double v_fina_market_value;
    double v_fina_profit;
    double v_fina_converted_pandl;
    double v_loan_market_value;
    double v_loan_profit;
    double v_loan_converted_pandl;
    double v_fina_capt_margin;
    double v_loan_capt_margin;
    double v_keep_guarantee_ratio;
    double v_loan_sell_amt;
    double v_margin_ratio_market_value;
    double v_fina_interest;
    double v_loan_interest;
    int v_update_times;
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
    v_co_no=0;
    v_pd_no=0;
    v_asset_acco_no=0;
    v_exch_group_no=0;
    strcpy(v_exch_crncy_type, "CNY");
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_curr_converted_margin=0;
    v_cmmd_converted_margin=0;
    v_order_converted_margin=0;
    v_fina_market_value=0;
    v_fina_profit=0;
    v_fina_converted_pandl=0;
    v_loan_market_value=0;
    v_loan_profit=0;
    v_loan_converted_pandl=0;
    v_fina_capt_margin=0;
    v_loan_capt_margin=0;
    v_keep_guarantee_ratio=0;
    v_loan_sell_amt=0;
    v_margin_ratio_market_value=0;
    v_fina_interest=0;
    v_loan_interest=0;
    v_update_times=1;
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
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    strncpy(v_exch_crncy_type, lpInBizMsg->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR),3);
    v_exch_crncy_type[3] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;


    // set @业务控制串# = "001";
    strcpy(v_busi_ctrl_str,"001");
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

    //set @机构编号// = @操作员机构编号//;
    //调用过程[事务_风控证券_风控_查询交易组融资融券保证金计算结果集]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.64", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.64]subcall timed out!");
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

//逻辑_风控证券_风控_查询所有账户风险监控设置
int LD_CALL_MODE fnFunc49(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int v_moni_role_type;
    int v_moni_value_flag;
    int v_moni_value_type;
    char v_moni_set_status[3];
    char v_moni_result_status[3];
    int v_sort_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
    char v_pd_no_str[2049];
    char v_exch_group_no_str[2049];
    double v_warn_posi_value;
    int v_warn_trig_oper_type;
    double v_close_posi_value;
    int v_close_trig_oper_type;
    double v_appd_value;
    int v_appd_trig_oper_type;
    int v_begin_moni_date;
    double v_begin_moni_value;
    double v_max_moni_value;
    double v_curr_moni_value;
    double v_curr_result_moni_value;
    char v_contrs_stock_code[7];
    int v_contrs_exch_no;
    double v_contrs_max_moni_value;
    double v_contrs_curr_moni_value;
    double v_contrs_result_moni_value;
    double v_moni_result_value;
    double v_cash_asset;
    double v_fund_asset;
    double v_bond_asset;
    double v_stock_asset;
    double v_repo_asset;
    double v_nav_asset;
    double v_stock_asset_ratio;
    int v_close_posi_flag;
    double v_close_ratio_level_one;
    double v_close_ratio_level_two;
    double v_close_ratio_level_three;
    char v_remark_info[256];
    double v_pd_share;
    double v_begin_asset_value;
    double v_hk_thrgh_stock_asset;
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
    v_moni_role_type=0;
    v_moni_value_flag=0;
    v_moni_value_type=0;
    strcpy(v_moni_set_status, " ");
    strcpy(v_moni_result_status, " ");
    v_sort_type=1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_row_id=0;
    strcpy(v_pd_no_str, " ");
    strcpy(v_exch_group_no_str, " ");
    v_warn_posi_value=0;
    v_warn_trig_oper_type=0;
    v_close_posi_value=0;
    v_close_trig_oper_type=0;
    v_appd_value=0;
    v_appd_trig_oper_type=0;
    v_begin_moni_date=0;
    v_begin_moni_value=0;
    v_max_moni_value=0;
    v_curr_moni_value=0;
    v_curr_result_moni_value=0;
    strcpy(v_contrs_stock_code, " ");
    v_contrs_exch_no=0;
    v_contrs_max_moni_value=0;
    v_contrs_curr_moni_value=0;
    v_contrs_result_moni_value=0;
    v_moni_result_value=0;
    v_cash_asset=0;
    v_fund_asset=0;
    v_bond_asset=0;
    v_stock_asset=0;
    v_repo_asset=0;
    v_nav_asset=0;
    v_stock_asset_ratio=0;
    v_close_posi_flag=0;
    v_close_ratio_level_one=0;
    v_close_ratio_level_two=0;
    v_close_ratio_level_three=0;
    strcpy(v_remark_info, " ");
    v_pd_share=0;
    v_begin_asset_value=0;
    v_hk_thrgh_stock_asset=0;
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
    v_moni_role_type = lpInBizMsg->GetInt32(LDBIZ_MONI_ROLE_TYPE_INT);
    v_moni_value_flag = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_FLAG_INT);
    v_moni_value_type = lpInBizMsg->GetInt32(LDBIZ_MONI_VALUE_TYPE_INT);
    strncpy(v_moni_set_status, lpInBizMsg->GetString(LDBIZ_MONI_SET_STATUS_STR),2);
    v_moni_set_status[2] = '\0';
    strncpy(v_moni_result_status, lpInBizMsg->GetString(LDBIZ_MONI_RESULT_STATUS_STR),2);
    v_moni_result_status[2] = '\0';
    v_sort_type = lpInBizMsg->GetInt32(LDBIZ_SORT_TYPE_INT);

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

    //set @业务控制串//="111";
    //[事务_公共_公共接口_获取操作员操作权限串]
    //调用过程[事务_风控证券_风控_查询所有账户风险监控设置]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.65", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_MONI_ROLE_TYPE_INT,v_moni_role_type);
    lpTSCall1Req1->SetInt32(LDBIZ_MONI_VALUE_FLAG_INT,v_moni_value_flag);
    lpTSCall1Req1->SetInt32(LDBIZ_MONI_VALUE_TYPE_INT,v_moni_value_type);
    lpTSCall1Req1->SetString(LDBIZ_MONI_SET_STATUS_STR,v_moni_set_status);
    lpTSCall1Req1->SetString(LDBIZ_MONI_RESULT_STATUS_STR,v_moni_result_status);
    lpTSCall1Req1->SetInt32(LDBIZ_SORT_TYPE_INT,v_sort_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.65]subcall timed out!");
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

//逻辑_风控证券_风控_新增预订单信息表
int LD_CALL_MODE fnFunc50(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int v_order_dir;
    double v_order_price;
    double v_order_qty;
    int v_order_batch_no;
    int v_price_type;
    char v_order_oper_way[3];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
    int v_init_date;
    char v_sys_config_str[65];
    char v_co_busi_config_str[65];
    char v_exgp_busi_config_str[65];
    int v_stock_code_no;
    int v_stock_type;
    int v_asset_type;
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
    int v_busi_opor_no;
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
    v_order_dir=0;
    v_order_price=0;
    v_order_qty=0;
    v_order_batch_no=0;
    v_price_type=0;
    strcpy(v_order_oper_way, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_row_id=0;
    v_init_date=0;
    strcpy(v_sys_config_str, " ");
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_exgp_busi_config_str, " ");
    v_stock_code_no=0;
    v_stock_type=0;
    v_asset_type=0;
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
    v_busi_opor_no=0;
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
    v_order_dir = lpInBizMsg->GetInt32(LDBIZ_ORDER_DIR_INT);
    v_order_price = lpInBizMsg->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
    v_order_qty = lpInBizMsg->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
    v_order_batch_no = lpInBizMsg->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_price_type = lpInBizMsg->GetInt32(LDBIZ_PRICE_TYPE_INT);
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


    // set @业务操作员编号# = @操作员编号#;
    v_busi_opor_no = v_opor_no;

    // if @订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-融券回购》 or @订单方向# = 《订单方向-融资买入》   then
    if (v_order_dir == 1 || v_order_dir == 4 || v_order_dir == 5  )
    {
        //调用过程[事务_公共_公共接口_计算证券订单费用]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.203", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
        lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req2->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req2->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req2->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
        lpTSCall1Req2->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
        lpTSCall1Req2->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
        lpTSCall1Req2->SetInt32(LDBIZ_NET_PRICE_FLAG_INT,v_net_price_flag);
        lpTSCall1Req2->SetDouble(LDBIZ_PAR_VALUE_FLOAT,v_par_value);
        lpTSCall1Req2->SetInt32(LDBIZ_BOND_RATE_TYPE_INT,v_bond_rate_type);
        lpTSCall1Req2->SetDouble(LDBIZ_BOND_ACCR_INTRST_FLOAT,v_bond_accr_intrst);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.203]subcall timed out!");
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
        v_trade_commis = lpTSCall1Ans2->GetDouble(LDBIZ_TRADE_COMMIS_FLOAT);
        v_all_fee = lpTSCall1Ans2->GetDouble(LDBIZ_ALL_FEE_FLOAT);
        v_stamp_tax = lpTSCall1Ans2->GetDouble(LDBIZ_STAMP_TAX_FLOAT);
        v_trans_fee = lpTSCall1Ans2->GetDouble(LDBIZ_TRANS_FEE_FLOAT);
        v_brkage_fee = lpTSCall1Ans2->GetDouble(LDBIZ_BRKAGE_FEE_FLOAT);
        v_SEC_charges = lpTSCall1Ans2->GetDouble(LDBIZ_SEC_CHARGES_FLOAT);
        v_other_fee = lpTSCall1Ans2->GetDouble(LDBIZ_OTHER_FEE_FLOAT);
        v_other_commis = lpTSCall1Ans2->GetDouble(LDBIZ_OTHER_COMMIS_FLOAT);
        v_trade_tax = lpTSCall1Ans2->GetDouble(LDBIZ_TRADE_TAX_FLOAT);
        v_trade_cost_fee = lpTSCall1Ans2->GetDouble(LDBIZ_TRADE_COST_FEE_FLOAT);
        v_trade_system_use_fee = lpTSCall1Ans2->GetDouble(LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
        v_stock_settle_fee = lpTSCall1Ans2->GetDouble(LDBIZ_STOCK_SETTLE_FEE_FLOAT);
        v_order_frozen_amt = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_FROZEN_AMT_FLOAT);

    // end if;
    }

    //调用过程[事务_风控证券_风控_新增预订单信息表]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("rksecuT.4.66", 0);
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
    lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req3->SetString(LDBIZ_EXCH_CRNCY_TYPE_STR,v_exch_crncy_type);
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req3->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req3->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
    lpTSCall1Req3->SetDouble(LDBIZ_ORDER_PRICE_FLOAT,v_order_price);
    lpTSCall1Req3->SetDouble(LDBIZ_ORDER_QTY_FLOAT,v_order_qty);
    lpTSCall1Req3->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
    lpTSCall1Req3->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.66]subcall timed out!");
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

//逻辑_风控证券_风控_删除预订单信息表
int LD_CALL_MODE fnFunc51(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int v_order_batch_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
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
    v_order_batch_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
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
    v_order_batch_no = lpInBizMsg->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;

    //调用过程[事务_风控证券_风控_删除预订单信息表]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("rksecuT.4.67", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.67]subcall timed out!");
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


END:
    //对输出参数进行赋值处理
    lpOutBizMsg->SetString(LDBIZ_ERROR_CODE_STR,v_error_code);
    lpOutBizMsg->SetString(LDBIZ_ERROR_INFO_STR,v_error_info);
    if (iRet == -1)
    {
        //调用错误翻译过程
        //调用过程[事务_公共_公共接口_获取错误信息]
        //组织事务请求
        if(lpTSCall1Ans1)
        {
          lpTSCall1Ans1->FreeMsg();
          lpTSCall1Ans1=NULL;
        }
        lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req1->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req1->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
        if (lpTSCall1Ans1)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans1->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans1->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans1->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans1->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans1->GetString(LDBIZ_ERROR_DEAL_STR));
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
    return iRet;
}

//逻辑_风控证券_风控_联合汇总检查客户风险
int LD_CALL_MODE fnFunc52(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int v_order_batch_no;
    int64 v_row_id;
    int v_trig_stage_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_compli_trig_id;
    int v_risk_rule_type;
    char v_compli_rules_remark[256];
    double v_numer_value;
    double v_dino_value;
    int v_trig_type;
    char v_risk_rule_value_str[256];
    int v_client_risk_rule_id;
    char v_risk_rule_action[33];
    char v_remark_info[256];
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
    v_order_batch_no=0;
    v_row_id=0;
    v_trig_stage_type=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_compli_trig_id=0;
    v_risk_rule_type=0;
    strcpy(v_compli_rules_remark, " ");
    v_numer_value=0;
    v_dino_value=0;
    v_trig_type=0;
    strcpy(v_risk_rule_value_str, " ");
    v_client_risk_rule_id=0;
    strcpy(v_risk_rule_action, " ");
    strcpy(v_remark_info, " ");
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
    v_order_batch_no = lpInBizMsg->GetInt32(LDBIZ_ORDER_BATCH_NO_INT);
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_trig_stage_type = lpInBizMsg->GetInt32(LDBIZ_TRIG_STAGE_TYPE_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //公共子系统检查，检查状态、身份、权限等
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

    //调用过程[事务_风控证券_风控_联合汇总检查客户风险]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("rksecuT.4.68", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ORDER_BATCH_NO_INT,v_order_batch_no);
    lpTSCall1Req1->SetInt32(LDBIZ_TRIG_STAGE_TYPE_INT,v_trig_stage_type);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.68]subcall timed out!");
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
    v_compli_trig_id = lpTSCall1Ans1->GetInt64(LDBIZ_COMPLI_TRIG_ID_INT64);
    v_risk_rule_type = lpTSCall1Ans1->GetInt32(LDBIZ_RISK_RULE_TYPE_INT);
    strcpy(v_compli_rules_remark, lpTSCall1Ans1->GetString(LDBIZ_COMPLI_RULES_REMARK_STR));
    v_numer_value = lpTSCall1Ans1->GetDouble(LDBIZ_NUMER_VALUE_FLOAT);
    v_dino_value = lpTSCall1Ans1->GetDouble(LDBIZ_DINO_VALUE_FLOAT);
    v_trig_type = lpTSCall1Ans1->GetInt32(LDBIZ_TRIG_TYPE_INT);
    strcpy(v_risk_rule_value_str, lpTSCall1Ans1->GetString(LDBIZ_RISK_RULE_VALUE_STR_STR));
    v_client_risk_rule_id = lpTSCall1Ans1->GetInt32(LDBIZ_CLIENT_RISK_RULE_ID_INT);
    strcpy(v_risk_rule_action, lpTSCall1Ans1->GetString(LDBIZ_RISK_RULE_ACTION_STR));
    strcpy(v_remark_info, lpTSCall1Ans1->GetString(LDBIZ_REMARK_INFO_STR));


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
    lpOutBizMsg->SetInt64(LDBIZ_COMPLI_TRIG_ID_INT64,v_compli_trig_id);
    lpOutBizMsg->SetInt32(LDBIZ_RISK_RULE_TYPE_INT,v_risk_rule_type);
    lpOutBizMsg->SetString(LDBIZ_COMPLI_RULES_REMARK_STR,v_compli_rules_remark);
    lpOutBizMsg->SetDouble(LDBIZ_NUMER_VALUE_FLOAT,v_numer_value);
    lpOutBizMsg->SetDouble(LDBIZ_DINO_VALUE_FLOAT,v_dino_value);
    lpOutBizMsg->SetInt32(LDBIZ_TRIG_TYPE_INT,v_trig_type);
    lpOutBizMsg->SetString(LDBIZ_RISK_RULE_VALUE_STR_STR,v_risk_rule_value_str);
    lpOutBizMsg->SetInt32(LDBIZ_CLIENT_RISK_RULE_ID_INT,v_client_risk_rule_id);
    lpOutBizMsg->SetString(LDBIZ_RISK_RULE_ACTION_STR,v_risk_rule_action);
    lpOutBizMsg->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
    if(lpTSCall1Ans2)
        lpTSCall1Ans2->FreeMsg();
    return iRet;
}

//逻辑_风控证券_风控_新增预指令信息表
int LD_CALL_MODE fnFunc53(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
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
    int v_stock_code_no;
    char v_stock_code[7];
    int v_comm_dir;
    double v_limit_actual_price;
    double v_comm_qty;
    int v_comm_batch_no;
    int v_comm_executor;
    double v_comm_limit_price;
    int v_price_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_co_comm_appr_oper;
    char v_exgp_busi_config_str[65];
    char v_crncy_type[4];
    double v_buy_ref_rate;
    double v_sell_ref_rate;
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
    char v_busi_ctrl_str[65];
    int v_order_dir;
    double v_order_qty;
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
    int v_busi_opor_no;
    double v_pre_limit_actual_price;
    double v_order_price;
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
    v_stock_code_no=0;
    strcpy(v_stock_code, " ");
    v_comm_dir=0;
    v_limit_actual_price=0;
    v_comm_qty=0;
    v_comm_batch_no=0;
    v_comm_executor=0;
    v_comm_limit_price=0;
    v_price_type=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_row_id=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_co_comm_appr_oper=0;
    strcpy(v_exgp_busi_config_str, " ");
    strcpy(v_crncy_type, "CNY");
    v_buy_ref_rate=0;
    v_sell_ref_rate=0;
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
    strcpy(v_busi_ctrl_str, " ");
    v_order_dir=0;
    v_order_qty=0;
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
    v_busi_opor_no=0;
    v_pre_limit_actual_price=0;
    v_order_price=0;
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
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    strncpy(v_stock_code, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR),6);
    v_stock_code[6] = '\0';
    v_comm_dir = lpInBizMsg->GetInt32(LDBIZ_COMM_DIR_INT);
    v_limit_actual_price = lpInBizMsg->GetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
    v_comm_qty = lpInBizMsg->GetDouble(LDBIZ_COMM_QTY_FLOAT);
    v_comm_batch_no = lpInBizMsg->GetInt32(LDBIZ_COMM_BATCH_NO_INT);
    v_comm_executor = lpInBizMsg->GetInt32(LDBIZ_COMM_EXECUTOR_INT);
    v_comm_limit_price = lpInBizMsg->GetDouble(LDBIZ_COMM_LIMIT_PRICE_FLOAT);
    v_price_type = lpInBizMsg->GetInt32(LDBIZ_PRICE_TYPE_INT);

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

    // set @业务控制串# = "11111";
    strcpy(v_busi_ctrl_str,"11111");

    // set @订单方向# = @指令方向#;
    v_order_dir = v_comm_dir;

    // set @订单数量# = @指令数量#;
    v_order_qty = v_comm_qty;
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


    // set @业务操作员编号# = @操作员编号#;
    v_busi_opor_no = v_opor_no;
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

    // set @订单价格# = @指令实际限价#;
    v_order_price = v_limit_actual_price;

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

    //调用过程[事务_风控证券_风控_新增预指令信息表]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("rksecuT.4.69", 0);
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
    lpTSCall1Req4->SetInt32(LDBIZ_COMM_DIR_INT,v_comm_dir);
    lpTSCall1Req4->SetDouble(LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,v_limit_actual_price);
    lpTSCall1Req4->SetDouble(LDBIZ_COMM_QTY_FLOAT,v_comm_qty);
    lpTSCall1Req4->SetDouble(LDBIZ_ALL_FEE_FLOAT,v_all_fee);
    lpTSCall1Req4->SetInt32(LDBIZ_COMM_BATCH_NO_INT,v_comm_batch_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[rksecuT.4.69]subcall timed out!");
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
    return iRet;
}

