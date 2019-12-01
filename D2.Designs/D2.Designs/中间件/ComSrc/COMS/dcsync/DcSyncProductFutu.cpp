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
        strcpy(bizFuncInfo->szFuncName, "dcsyncL.4.12");
        bizFuncInfo->lpFunc = fnFunc0;
    }
    else if (iFunIndex==1)
    {
        strcpy(bizFuncInfo->szFuncName, "dcsyncL.4.13");
        bizFuncInfo->lpFunc = fnFunc1;
    }
    else if (iFunIndex==2)
    {
        strcpy(bizFuncInfo->szFuncName, "dcsyncL.4.14");
        bizFuncInfo->lpFunc = fnFunc2;
    }
    else if (iFunIndex==3)
    {
        strcpy(bizFuncInfo->szFuncName, "dcsyncL.4.15");
        bizFuncInfo->lpFunc = fnFunc3;
    }
    else if (iFunIndex==4)
    {
        strcpy(bizFuncInfo->szFuncName, "dcsyncL.4.16");
        bizFuncInfo->lpFunc = fnFunc4;
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

//逻辑_数据同步_产品期货同步_同步交易组资金表
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
    int64 v_row_id;
    int v_ctrl_flag;
    int v_effect_row_count;
    int v_row_count;
    char v_qry_table[256];
    int v_update_date;
    int v_update_time;
    int v_mach_date;
    int v_mach_time;
    char v_sync_field1[10001];
    char v_sync_field2[10001];
    char v_sync_field3[10001];
    char v_sync_field4[10001];
    char v_sync_field5[10001];
    char v_sync_field6[10001];
    char v_sync_field7[10001];
    char v_sync_field8[10001];
    char v_sync_field9[10001];
    char v_sync_field10[10001];
    char v_sync_field11[10001];
    char v_sync_field12[10001];
    char v_sync_field13[10001];
    char v_sync_field14[10001];
    char v_sync_field15[10001];
    char v_sync_field16[10001];
    char v_sync_field17[10001];
    char v_sync_field18[10001];
    char v_sync_field19[10001];
    char v_sync_field20[10001];
    char v_sync_field21[10001];
    char v_sync_field22[10001];
    char v_sync_field23[10001];
    char v_sync_field24[10001];
    char v_sync_field25[10001];
    char v_sync_field26[10001];
    char v_sync_field27[10001];
    char v_sync_field28[10001];
    char v_sync_field29[10001];
    char v_sync_field30[10001];
    char v_sync_field31[10001];
    char v_sync_field32[10001];
    char v_sync_field33[10001];
    char v_sync_field34[10001];
    char v_sync_field35[10001];
    char v_sync_field36[10001];
    char v_sync_field37[10001];
    char v_sync_field38[10001];
    char v_sync_field39[10001];
    char v_sync_field40[10001];
    char v_sync_field41[10001];
    char v_sync_field42[10001];
    char v_sync_field43[10001];
    char v_sync_field44[10001];
    char v_sync_field45[10001];
    char v_sync_field46[10001];
    char v_sync_field47[10001];
    char v_sync_field48[10001];
    char v_sync_field49[10001];
    char v_sync_field50[10001];
    char v_sync_field51[10001];
    char v_sync_field52[10001];
    char v_sync_field53[10001];
    char v_sync_field54[10001];
    char v_sync_field55[10001];
    char v_sync_field56[10001];
    char v_sync_field57[10001];
    char v_sync_field58[10001];
    char v_sync_field59[10001];
    char v_sync_field60[10001];
    char v_sync_field61[10001];
    char v_sync_field62[10001];
    char v_sync_field63[10001];
    char v_sync_field64[10001];
    char v_sync_field65[10001];
    char v_sync_field66[10001];
    char v_sync_field67[10001];
    char v_sync_field68[10001];
    char v_sync_field69[10001];
    char v_sync_field70[10001];
    char v_sync_field71[10001];
    char v_sync_field72[10001];
    char v_sync_field73[10001];
    char v_sync_field74[10001];
    char v_sync_field75[10001];
    char v_sync_field76[10001];
    char v_sync_field77[10001];
    char v_sync_field78[10001];
    char v_sync_field79[10001];
    char v_sync_field80[10001];
    char v_sync_field81[10001];
    char v_sync_field82[10001];
    char v_sync_field83[10001];
    char v_sync_field84[10001];
    char v_sync_field85[10001];
    char v_sync_field86[10001];
    char v_sync_field87[10001];
    char v_sync_field88[10001];
    char v_sync_field89[10001];
    char v_sync_field90[10001];
    char v_sync_field91[10001];
    char v_sync_field92[10001];
    char v_sync_field93[10001];
    char v_sync_field94[10001];
    char v_sync_field95[10001];
    char v_sync_field96[10001];
    char v_sync_field97[10001];
    char v_sync_field98[10001];
    char v_sync_field99[10001];
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
    v_ctrl_flag=0;
    v_effect_row_count=0;
    v_row_count=-1;
    strcpy(v_qry_table, " ");
    v_update_date=0;
    v_update_time=0;
    v_mach_date=0;
    v_mach_time=0;
    strcpy(v_sync_field1, " ");
    strcpy(v_sync_field2, " ");
    strcpy(v_sync_field3, " ");
    strcpy(v_sync_field4, " ");
    strcpy(v_sync_field5, " ");
    strcpy(v_sync_field6, " ");
    strcpy(v_sync_field7, " ");
    strcpy(v_sync_field8, " ");
    strcpy(v_sync_field9, " ");
    strcpy(v_sync_field10, " ");
    strcpy(v_sync_field11, " ");
    strcpy(v_sync_field12, " ");
    strcpy(v_sync_field13, " ");
    strcpy(v_sync_field14, " ");
    strcpy(v_sync_field15, " ");
    strcpy(v_sync_field16, " ");
    strcpy(v_sync_field17, " ");
    strcpy(v_sync_field18, " ");
    strcpy(v_sync_field19, " ");
    strcpy(v_sync_field20, " ");
    strcpy(v_sync_field21, " ");
    strcpy(v_sync_field22, " ");
    strcpy(v_sync_field23, " ");
    strcpy(v_sync_field24, " ");
    strcpy(v_sync_field25, " ");
    strcpy(v_sync_field26, " ");
    strcpy(v_sync_field27, " ");
    strcpy(v_sync_field28, " ");
    strcpy(v_sync_field29, " ");
    strcpy(v_sync_field30, " ");
    strcpy(v_sync_field31, " ");
    strcpy(v_sync_field32, " ");
    strcpy(v_sync_field33, " ");
    strcpy(v_sync_field34, " ");
    strcpy(v_sync_field35, " ");
    strcpy(v_sync_field36, " ");
    strcpy(v_sync_field37, " ");
    strcpy(v_sync_field38, " ");
    strcpy(v_sync_field39, " ");
    strcpy(v_sync_field40, " ");
    strcpy(v_sync_field41, " ");
    strcpy(v_sync_field42, " ");
    strcpy(v_sync_field43, " ");
    strcpy(v_sync_field44, " ");
    strcpy(v_sync_field45, " ");
    strcpy(v_sync_field46, " ");
    strcpy(v_sync_field47, " ");
    strcpy(v_sync_field48, " ");
    strcpy(v_sync_field49, " ");
    strcpy(v_sync_field50, " ");
    strcpy(v_sync_field51, " ");
    strcpy(v_sync_field52, " ");
    strcpy(v_sync_field53, " ");
    strcpy(v_sync_field54, " ");
    strcpy(v_sync_field55, " ");
    strcpy(v_sync_field56, " ");
    strcpy(v_sync_field57, " ");
    strcpy(v_sync_field58, " ");
    strcpy(v_sync_field59, " ");
    strcpy(v_sync_field60, " ");
    strcpy(v_sync_field61, " ");
    strcpy(v_sync_field62, " ");
    strcpy(v_sync_field63, " ");
    strcpy(v_sync_field64, " ");
    strcpy(v_sync_field65, " ");
    strcpy(v_sync_field66, " ");
    strcpy(v_sync_field67, " ");
    strcpy(v_sync_field68, " ");
    strcpy(v_sync_field69, " ");
    strcpy(v_sync_field70, " ");
    strcpy(v_sync_field71, " ");
    strcpy(v_sync_field72, " ");
    strcpy(v_sync_field73, " ");
    strcpy(v_sync_field74, " ");
    strcpy(v_sync_field75, " ");
    strcpy(v_sync_field76, " ");
    strcpy(v_sync_field77, " ");
    strcpy(v_sync_field78, " ");
    strcpy(v_sync_field79, " ");
    strcpy(v_sync_field80, " ");
    strcpy(v_sync_field81, " ");
    strcpy(v_sync_field82, " ");
    strcpy(v_sync_field83, " ");
    strcpy(v_sync_field84, " ");
    strcpy(v_sync_field85, " ");
    strcpy(v_sync_field86, " ");
    strcpy(v_sync_field87, " ");
    strcpy(v_sync_field88, " ");
    strcpy(v_sync_field89, " ");
    strcpy(v_sync_field90, " ");
    strcpy(v_sync_field91, " ");
    strcpy(v_sync_field92, " ");
    strcpy(v_sync_field93, " ");
    strcpy(v_sync_field94, " ");
    strcpy(v_sync_field95, " ");
    strcpy(v_sync_field96, " ");
    strcpy(v_sync_field97, " ");
    strcpy(v_sync_field98, " ");
    strcpy(v_sync_field99, " ");
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
    IFastMessage* lpTSCall1Req4 = NULL;
    IFastMessage* lpTSCall1Ans4 = NULL;


    // set @记录序号#=0;
    v_row_id=0;

    // set @控制标志#=1;
    v_ctrl_flag=1;

    // set @影响行数#=0;
    v_effect_row_count=0;

    // set @指定行数#=200;
    v_row_count=200;
    //set @更新日期//=@更新日期//;
    //set @更新时间//=@更新时间//;

    // set @查询表名#="tb_pdfuca_exgp_capit";
    strcpy(v_qry_table,"tb_pdfuca_exgp_capit");
    //调用过程[事务_产品期货_同步接口_获取同步时间]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pdfutuT.15.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetString(LDBIZ_QRY_TABLE_STR,v_qry_table);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.15.1]subcall timed out!");
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
    v_update_date = lpTSCall1Ans0->GetInt32(LDBIZ_UPDATE_DATE_INT);
    v_update_time = lpTSCall1Ans0->GetInt32(LDBIZ_UPDATE_TIME_INT);
    v_mach_date = lpTSCall1Ans0->GetInt32(LDBIZ_MACH_DATE_INT);
    v_mach_time = lpTSCall1Ans0->GetInt32(LDBIZ_MACH_TIME_INT);


    // [while循环开始][@控制标志#]
    while (v_ctrl_flag)
    {

       //调用过程[事务_产品期货_同步接口_同步交易组资金表]
       //组织事务请求
       if(lpTSCall1Ans1)
       {
         lpTSCall1Ans1->FreeMsg();
         lpTSCall1Ans1=NULL;
       }
       lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdfutuT.15.12", 0);
       lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
       lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
       lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
       lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
       lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
       lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
       lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
       lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
       lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
       lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
       lpTSCall1Req1->SetInt32(LDBIZ_CTRL_FLAG_INT,v_ctrl_flag);
       lpTSCall1Req1->SetInt32(LDBIZ_UPDATE_DATE_INT,v_update_date);
       lpTSCall1Req1->SetInt32(LDBIZ_UPDATE_TIME_INT,v_update_time);
       glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
       if(!lpTSCall1Ans1)  //  超时错误
       {
           lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
           lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.15.12]subcall timed out!");
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
       strcpy(v_sync_field1, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD1_STR));
       strcpy(v_sync_field2, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD2_STR));
       strcpy(v_sync_field3, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD3_STR));
       strcpy(v_sync_field4, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD4_STR));
       strcpy(v_sync_field5, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD5_STR));
       strcpy(v_sync_field6, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD6_STR));
       strcpy(v_sync_field7, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD7_STR));
       strcpy(v_sync_field8, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD8_STR));
       strcpy(v_sync_field9, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD9_STR));
       strcpy(v_sync_field10, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD10_STR));
       strcpy(v_sync_field11, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD11_STR));
       strcpy(v_sync_field12, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD12_STR));
       strcpy(v_sync_field13, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD13_STR));
       strcpy(v_sync_field14, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD14_STR));
       strcpy(v_sync_field15, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD15_STR));
       strcpy(v_sync_field16, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD16_STR));
       strcpy(v_sync_field17, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD17_STR));
       strcpy(v_sync_field18, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD18_STR));
       strcpy(v_sync_field19, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD19_STR));
       strcpy(v_sync_field20, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD20_STR));
       strcpy(v_sync_field21, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD21_STR));
       strcpy(v_sync_field22, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD22_STR));
       strcpy(v_sync_field23, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD23_STR));
       strcpy(v_sync_field24, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD24_STR));
       strcpy(v_sync_field25, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD25_STR));
       strcpy(v_sync_field26, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD26_STR));
       strcpy(v_sync_field27, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD27_STR));
       strcpy(v_sync_field28, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD28_STR));
       strcpy(v_sync_field29, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD29_STR));
       strcpy(v_sync_field30, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD30_STR));
       strcpy(v_sync_field31, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD31_STR));
       strcpy(v_sync_field32, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD32_STR));
       strcpy(v_sync_field33, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD33_STR));
       strcpy(v_sync_field34, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD34_STR));
       strcpy(v_sync_field35, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD35_STR));
       strcpy(v_sync_field36, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD36_STR));
       strcpy(v_sync_field37, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD37_STR));
       strcpy(v_sync_field38, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD38_STR));
       strcpy(v_sync_field39, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD39_STR));
       strcpy(v_sync_field40, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD40_STR));
       strcpy(v_sync_field41, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD41_STR));
       strcpy(v_sync_field42, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD42_STR));
       strcpy(v_sync_field43, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD43_STR));
       strcpy(v_sync_field44, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD44_STR));
       strcpy(v_sync_field45, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD45_STR));
       strcpy(v_sync_field46, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD46_STR));
       strcpy(v_sync_field47, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD47_STR));
       strcpy(v_sync_field48, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD48_STR));
       strcpy(v_sync_field49, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD49_STR));
       strcpy(v_sync_field50, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD50_STR));
       strcpy(v_sync_field51, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD51_STR));
       strcpy(v_sync_field52, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD52_STR));
       strcpy(v_sync_field53, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD53_STR));
       strcpy(v_sync_field54, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD54_STR));
       strcpy(v_sync_field55, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD55_STR));
       strcpy(v_sync_field56, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD56_STR));
       strcpy(v_sync_field57, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD57_STR));
       strcpy(v_sync_field58, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD58_STR));
       strcpy(v_sync_field59, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD59_STR));
       strcpy(v_sync_field60, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD60_STR));
       strcpy(v_sync_field61, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD61_STR));
       strcpy(v_sync_field62, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD62_STR));
       strcpy(v_sync_field63, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD63_STR));
       strcpy(v_sync_field64, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD64_STR));
       strcpy(v_sync_field65, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD65_STR));
       strcpy(v_sync_field66, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD66_STR));
       strcpy(v_sync_field67, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD67_STR));
       strcpy(v_sync_field68, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD68_STR));
       strcpy(v_sync_field69, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD69_STR));
       strcpy(v_sync_field70, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD70_STR));
       strcpy(v_sync_field71, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD71_STR));
       strcpy(v_sync_field72, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD72_STR));
       strcpy(v_sync_field73, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD73_STR));
       strcpy(v_sync_field74, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD74_STR));
       strcpy(v_sync_field75, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD75_STR));
       strcpy(v_sync_field76, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD76_STR));
       strcpy(v_sync_field77, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD77_STR));
       strcpy(v_sync_field78, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD78_STR));
       strcpy(v_sync_field79, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD79_STR));
       strcpy(v_sync_field80, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD80_STR));
       strcpy(v_sync_field81, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD81_STR));
       strcpy(v_sync_field82, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD82_STR));
       strcpy(v_sync_field83, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD83_STR));
       strcpy(v_sync_field84, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD84_STR));
       strcpy(v_sync_field85, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD85_STR));
       strcpy(v_sync_field86, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD86_STR));
       strcpy(v_sync_field87, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD87_STR));
       strcpy(v_sync_field88, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD88_STR));
       strcpy(v_sync_field89, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD89_STR));
       strcpy(v_sync_field90, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD90_STR));
       strcpy(v_sync_field91, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD91_STR));
       strcpy(v_sync_field92, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD92_STR));
       strcpy(v_sync_field93, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD93_STR));
       strcpy(v_sync_field94, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD94_STR));
       strcpy(v_sync_field95, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD95_STR));
       strcpy(v_sync_field96, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD96_STR));
       strcpy(v_sync_field97, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD97_STR));
       strcpy(v_sync_field98, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD98_STR));
       strcpy(v_sync_field99, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD99_STR));

       //调用过程[事务_数据同步_产品期货同步_同步交易组资金表]
       //组织事务请求
       if(lpTSCall1Ans2)
       {
         lpTSCall1Ans2->FreeMsg();
         lpTSCall1Ans2=NULL;
       }
       lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("dcsyncT.4.12", 0);
       lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
       lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
       lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
       lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
       lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
       lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
       lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
       lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD1_STR,v_sync_field1);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD2_STR,v_sync_field2);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD3_STR,v_sync_field3);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD4_STR,v_sync_field4);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD5_STR,v_sync_field5);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD6_STR,v_sync_field6);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD7_STR,v_sync_field7);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD8_STR,v_sync_field8);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD9_STR,v_sync_field9);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD10_STR,v_sync_field10);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD11_STR,v_sync_field11);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD12_STR,v_sync_field12);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD13_STR,v_sync_field13);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD14_STR,v_sync_field14);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD15_STR,v_sync_field15);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD16_STR,v_sync_field16);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD17_STR,v_sync_field17);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD18_STR,v_sync_field18);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD19_STR,v_sync_field19);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD20_STR,v_sync_field20);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD21_STR,v_sync_field21);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD22_STR,v_sync_field22);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD23_STR,v_sync_field23);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD24_STR,v_sync_field24);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD25_STR,v_sync_field25);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD26_STR,v_sync_field26);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD27_STR,v_sync_field27);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD28_STR,v_sync_field28);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD29_STR,v_sync_field29);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD30_STR,v_sync_field30);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD31_STR,v_sync_field31);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD32_STR,v_sync_field32);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD33_STR,v_sync_field33);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD34_STR,v_sync_field34);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD35_STR,v_sync_field35);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD36_STR,v_sync_field36);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD37_STR,v_sync_field37);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD38_STR,v_sync_field38);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD39_STR,v_sync_field39);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD40_STR,v_sync_field40);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD41_STR,v_sync_field41);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD42_STR,v_sync_field42);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD43_STR,v_sync_field43);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD44_STR,v_sync_field44);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD45_STR,v_sync_field45);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD46_STR,v_sync_field46);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD47_STR,v_sync_field47);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD48_STR,v_sync_field48);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD49_STR,v_sync_field49);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD50_STR,v_sync_field50);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD51_STR,v_sync_field51);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD52_STR,v_sync_field52);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD53_STR,v_sync_field53);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD54_STR,v_sync_field54);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD55_STR,v_sync_field55);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD56_STR,v_sync_field56);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD57_STR,v_sync_field57);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD58_STR,v_sync_field58);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD59_STR,v_sync_field59);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD60_STR,v_sync_field60);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD61_STR,v_sync_field61);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD62_STR,v_sync_field62);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD63_STR,v_sync_field63);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD64_STR,v_sync_field64);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD65_STR,v_sync_field65);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD66_STR,v_sync_field66);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD67_STR,v_sync_field67);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD68_STR,v_sync_field68);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD69_STR,v_sync_field69);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD70_STR,v_sync_field70);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD71_STR,v_sync_field71);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD72_STR,v_sync_field72);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD73_STR,v_sync_field73);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD74_STR,v_sync_field74);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD75_STR,v_sync_field75);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD76_STR,v_sync_field76);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD77_STR,v_sync_field77);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD78_STR,v_sync_field78);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD79_STR,v_sync_field79);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD80_STR,v_sync_field80);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD81_STR,v_sync_field81);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD82_STR,v_sync_field82);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD83_STR,v_sync_field83);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD84_STR,v_sync_field84);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD85_STR,v_sync_field85);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD86_STR,v_sync_field86);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD87_STR,v_sync_field87);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD88_STR,v_sync_field88);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD89_STR,v_sync_field89);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD90_STR,v_sync_field90);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD91_STR,v_sync_field91);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD92_STR,v_sync_field92);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD93_STR,v_sync_field93);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD94_STR,v_sync_field94);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD95_STR,v_sync_field95);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD96_STR,v_sync_field96);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD97_STR,v_sync_field97);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD98_STR,v_sync_field98);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD99_STR,v_sync_field99);
       glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
       if(!lpTSCall1Ans2)  //  超时错误
       {
           lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
           lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[dcsyncT.4.12]subcall timed out!");
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


       // [得到最大同步序号][@同步字段1#][@影响行数#][@记录序号#]
       GetMaxRowIDFun(v_sync_field1, &v_effect_row_count, &v_row_id);


        // if @影响行数#+1<200  then
        if (v_effect_row_count+1<200 )
        {

          // set @控制标志#=0;
          v_ctrl_flag=0;
        // end if;
        }


        // if @控制标志#=0 then
        if (v_ctrl_flag==0)
        {
          //完了测试方便,暂时先用这个功能

            // set @更新日期#=@机器日期#;
            v_update_date=v_mach_date;

            // set @更新时间#=@机器时间#;
            v_update_time=v_mach_time;
           //调用过程[事务_产品期货_同步接口_更新同步时间]
           //组织事务请求
           if(lpTSCall1Ans3)
           {
             lpTSCall1Ans3->FreeMsg();
             lpTSCall1Ans3=NULL;
           }
           lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdfutuT.15.2", 0);
           lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
           lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
           lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
           lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
           lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
           lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
           lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
           lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
           lpTSCall1Req3->SetString(LDBIZ_QRY_TABLE_STR,v_qry_table);
           lpTSCall1Req3->SetInt32(LDBIZ_UPDATE_DATE_INT,v_update_date);
           lpTSCall1Req3->SetInt32(LDBIZ_UPDATE_TIME_INT,v_update_time);
           glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
           if(!lpTSCall1Ans3)  //  超时错误
           {
               lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
               lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.15.2]subcall timed out!");
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
           v_mach_date = lpTSCall1Ans3->GetInt32(LDBIZ_MACH_DATE_INT);
           v_mach_time = lpTSCall1Ans3->GetInt32(LDBIZ_MACH_TIME_INT);

       // end if;
       }


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

//逻辑_数据同步_产品期货同步_同步交易组资产表
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
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
    int v_ctrl_flag;
    int v_effect_row_count;
    int v_row_count;
    char v_qry_table[256];
    int v_update_date;
    int v_update_time;
    int v_mach_date;
    int v_mach_time;
    char v_sync_field1[10001];
    char v_sync_field2[10001];
    char v_sync_field3[10001];
    char v_sync_field4[10001];
    char v_sync_field5[10001];
    char v_sync_field6[10001];
    char v_sync_field7[10001];
    char v_sync_field8[10001];
    char v_sync_field9[10001];
    char v_sync_field10[10001];
    char v_sync_field11[10001];
    char v_sync_field12[10001];
    char v_sync_field13[10001];
    char v_sync_field14[10001];
    char v_sync_field15[10001];
    char v_sync_field16[10001];
    char v_sync_field17[10001];
    char v_sync_field18[10001];
    char v_sync_field19[10001];
    char v_sync_field20[10001];
    char v_sync_field21[10001];
    char v_sync_field22[10001];
    char v_sync_field23[10001];
    char v_sync_field24[10001];
    char v_sync_field25[10001];
    char v_sync_field26[10001];
    char v_sync_field27[10001];
    char v_sync_field28[10001];
    char v_sync_field29[10001];
    char v_sync_field30[10001];
    char v_sync_field31[10001];
    char v_sync_field32[10001];
    char v_sync_field33[10001];
    char v_sync_field34[10001];
    char v_sync_field35[10001];
    char v_sync_field36[10001];
    char v_sync_field37[10001];
    char v_sync_field38[10001];
    char v_sync_field39[10001];
    char v_sync_field40[10001];
    char v_sync_field41[10001];
    char v_sync_field42[10001];
    char v_sync_field43[10001];
    char v_sync_field44[10001];
    char v_sync_field45[10001];
    char v_sync_field46[10001];
    char v_sync_field47[10001];
    char v_sync_field48[10001];
    char v_sync_field49[10001];
    char v_sync_field50[10001];
    char v_sync_field51[10001];
    char v_sync_field52[10001];
    char v_sync_field53[10001];
    char v_sync_field54[10001];
    char v_sync_field55[10001];
    char v_sync_field56[10001];
    char v_sync_field57[10001];
    char v_sync_field58[10001];
    char v_sync_field59[10001];
    char v_sync_field60[10001];
    char v_sync_field61[10001];
    char v_sync_field62[10001];
    char v_sync_field63[10001];
    char v_sync_field64[10001];
    char v_sync_field65[10001];
    char v_sync_field66[10001];
    char v_sync_field67[10001];
    char v_sync_field68[10001];
    char v_sync_field69[10001];
    char v_sync_field70[10001];
    char v_sync_field71[10001];
    char v_sync_field72[10001];
    char v_sync_field73[10001];
    char v_sync_field74[10001];
    char v_sync_field75[10001];
    char v_sync_field76[10001];
    char v_sync_field77[10001];
    char v_sync_field78[10001];
    char v_sync_field79[10001];
    char v_sync_field80[10001];
    char v_sync_field81[10001];
    char v_sync_field82[10001];
    char v_sync_field83[10001];
    char v_sync_field84[10001];
    char v_sync_field85[10001];
    char v_sync_field86[10001];
    char v_sync_field87[10001];
    char v_sync_field88[10001];
    char v_sync_field89[10001];
    char v_sync_field90[10001];
    char v_sync_field91[10001];
    char v_sync_field92[10001];
    char v_sync_field93[10001];
    char v_sync_field94[10001];
    char v_sync_field95[10001];
    char v_sync_field96[10001];
    char v_sync_field97[10001];
    char v_sync_field98[10001];
    char v_sync_field99[10001];
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
    v_ctrl_flag=0;
    v_effect_row_count=0;
    v_row_count=-1;
    strcpy(v_qry_table, " ");
    v_update_date=0;
    v_update_time=0;
    v_mach_date=0;
    v_mach_time=0;
    strcpy(v_sync_field1, " ");
    strcpy(v_sync_field2, " ");
    strcpy(v_sync_field3, " ");
    strcpy(v_sync_field4, " ");
    strcpy(v_sync_field5, " ");
    strcpy(v_sync_field6, " ");
    strcpy(v_sync_field7, " ");
    strcpy(v_sync_field8, " ");
    strcpy(v_sync_field9, " ");
    strcpy(v_sync_field10, " ");
    strcpy(v_sync_field11, " ");
    strcpy(v_sync_field12, " ");
    strcpy(v_sync_field13, " ");
    strcpy(v_sync_field14, " ");
    strcpy(v_sync_field15, " ");
    strcpy(v_sync_field16, " ");
    strcpy(v_sync_field17, " ");
    strcpy(v_sync_field18, " ");
    strcpy(v_sync_field19, " ");
    strcpy(v_sync_field20, " ");
    strcpy(v_sync_field21, " ");
    strcpy(v_sync_field22, " ");
    strcpy(v_sync_field23, " ");
    strcpy(v_sync_field24, " ");
    strcpy(v_sync_field25, " ");
    strcpy(v_sync_field26, " ");
    strcpy(v_sync_field27, " ");
    strcpy(v_sync_field28, " ");
    strcpy(v_sync_field29, " ");
    strcpy(v_sync_field30, " ");
    strcpy(v_sync_field31, " ");
    strcpy(v_sync_field32, " ");
    strcpy(v_sync_field33, " ");
    strcpy(v_sync_field34, " ");
    strcpy(v_sync_field35, " ");
    strcpy(v_sync_field36, " ");
    strcpy(v_sync_field37, " ");
    strcpy(v_sync_field38, " ");
    strcpy(v_sync_field39, " ");
    strcpy(v_sync_field40, " ");
    strcpy(v_sync_field41, " ");
    strcpy(v_sync_field42, " ");
    strcpy(v_sync_field43, " ");
    strcpy(v_sync_field44, " ");
    strcpy(v_sync_field45, " ");
    strcpy(v_sync_field46, " ");
    strcpy(v_sync_field47, " ");
    strcpy(v_sync_field48, " ");
    strcpy(v_sync_field49, " ");
    strcpy(v_sync_field50, " ");
    strcpy(v_sync_field51, " ");
    strcpy(v_sync_field52, " ");
    strcpy(v_sync_field53, " ");
    strcpy(v_sync_field54, " ");
    strcpy(v_sync_field55, " ");
    strcpy(v_sync_field56, " ");
    strcpy(v_sync_field57, " ");
    strcpy(v_sync_field58, " ");
    strcpy(v_sync_field59, " ");
    strcpy(v_sync_field60, " ");
    strcpy(v_sync_field61, " ");
    strcpy(v_sync_field62, " ");
    strcpy(v_sync_field63, " ");
    strcpy(v_sync_field64, " ");
    strcpy(v_sync_field65, " ");
    strcpy(v_sync_field66, " ");
    strcpy(v_sync_field67, " ");
    strcpy(v_sync_field68, " ");
    strcpy(v_sync_field69, " ");
    strcpy(v_sync_field70, " ");
    strcpy(v_sync_field71, " ");
    strcpy(v_sync_field72, " ");
    strcpy(v_sync_field73, " ");
    strcpy(v_sync_field74, " ");
    strcpy(v_sync_field75, " ");
    strcpy(v_sync_field76, " ");
    strcpy(v_sync_field77, " ");
    strcpy(v_sync_field78, " ");
    strcpy(v_sync_field79, " ");
    strcpy(v_sync_field80, " ");
    strcpy(v_sync_field81, " ");
    strcpy(v_sync_field82, " ");
    strcpy(v_sync_field83, " ");
    strcpy(v_sync_field84, " ");
    strcpy(v_sync_field85, " ");
    strcpy(v_sync_field86, " ");
    strcpy(v_sync_field87, " ");
    strcpy(v_sync_field88, " ");
    strcpy(v_sync_field89, " ");
    strcpy(v_sync_field90, " ");
    strcpy(v_sync_field91, " ");
    strcpy(v_sync_field92, " ");
    strcpy(v_sync_field93, " ");
    strcpy(v_sync_field94, " ");
    strcpy(v_sync_field95, " ");
    strcpy(v_sync_field96, " ");
    strcpy(v_sync_field97, " ");
    strcpy(v_sync_field98, " ");
    strcpy(v_sync_field99, " ");
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
    IFastMessage* lpTSCall1Req4 = NULL;
    IFastMessage* lpTSCall1Ans4 = NULL;


    // set @记录序号#=0;
    v_row_id=0;

    // set @控制标志#=1;
    v_ctrl_flag=1;

    // set @影响行数#=0;
    v_effect_row_count=0;

    // set @指定行数#=200;
    v_row_count=200;
    //set @更新日期//=@更新日期//;
    //set @更新时间//=@更新时间//;

    // set @查询表名#="tb_pdfuca_exgp_asset";
    strcpy(v_qry_table,"tb_pdfuca_exgp_asset");
    //调用过程[事务_产品期货_同步接口_获取同步时间]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pdfutuT.15.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetString(LDBIZ_QRY_TABLE_STR,v_qry_table);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.15.1]subcall timed out!");
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
    v_update_date = lpTSCall1Ans0->GetInt32(LDBIZ_UPDATE_DATE_INT);
    v_update_time = lpTSCall1Ans0->GetInt32(LDBIZ_UPDATE_TIME_INT);
    v_mach_date = lpTSCall1Ans0->GetInt32(LDBIZ_MACH_DATE_INT);
    v_mach_time = lpTSCall1Ans0->GetInt32(LDBIZ_MACH_TIME_INT);


    // [while循环开始][@控制标志#]
    while (v_ctrl_flag)
    {

       //调用过程[事务_产品期货_同步接口_同步交易组资产表]
       //组织事务请求
       if(lpTSCall1Ans1)
       {
         lpTSCall1Ans1->FreeMsg();
         lpTSCall1Ans1=NULL;
       }
       lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdfutuT.15.13", 0);
       lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
       lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
       lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
       lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
       lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
       lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
       lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
       lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
       lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
       lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
       lpTSCall1Req1->SetInt32(LDBIZ_CTRL_FLAG_INT,v_ctrl_flag);
       lpTSCall1Req1->SetInt32(LDBIZ_UPDATE_DATE_INT,v_update_date);
       lpTSCall1Req1->SetInt32(LDBIZ_UPDATE_TIME_INT,v_update_time);
       glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
       if(!lpTSCall1Ans1)  //  超时错误
       {
           lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
           lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.15.13]subcall timed out!");
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
       strcpy(v_sync_field1, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD1_STR));
       strcpy(v_sync_field2, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD2_STR));
       strcpy(v_sync_field3, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD3_STR));
       strcpy(v_sync_field4, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD4_STR));
       strcpy(v_sync_field5, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD5_STR));
       strcpy(v_sync_field6, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD6_STR));
       strcpy(v_sync_field7, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD7_STR));
       strcpy(v_sync_field8, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD8_STR));
       strcpy(v_sync_field9, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD9_STR));
       strcpy(v_sync_field10, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD10_STR));
       strcpy(v_sync_field11, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD11_STR));
       strcpy(v_sync_field12, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD12_STR));
       strcpy(v_sync_field13, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD13_STR));
       strcpy(v_sync_field14, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD14_STR));
       strcpy(v_sync_field15, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD15_STR));
       strcpy(v_sync_field16, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD16_STR));
       strcpy(v_sync_field17, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD17_STR));
       strcpy(v_sync_field18, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD18_STR));
       strcpy(v_sync_field19, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD19_STR));
       strcpy(v_sync_field20, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD20_STR));
       strcpy(v_sync_field21, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD21_STR));
       strcpy(v_sync_field22, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD22_STR));
       strcpy(v_sync_field23, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD23_STR));
       strcpy(v_sync_field24, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD24_STR));
       strcpy(v_sync_field25, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD25_STR));
       strcpy(v_sync_field26, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD26_STR));
       strcpy(v_sync_field27, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD27_STR));
       strcpy(v_sync_field28, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD28_STR));
       strcpy(v_sync_field29, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD29_STR));
       strcpy(v_sync_field30, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD30_STR));
       strcpy(v_sync_field31, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD31_STR));
       strcpy(v_sync_field32, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD32_STR));
       strcpy(v_sync_field33, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD33_STR));
       strcpy(v_sync_field34, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD34_STR));
       strcpy(v_sync_field35, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD35_STR));
       strcpy(v_sync_field36, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD36_STR));
       strcpy(v_sync_field37, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD37_STR));
       strcpy(v_sync_field38, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD38_STR));
       strcpy(v_sync_field39, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD39_STR));
       strcpy(v_sync_field40, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD40_STR));
       strcpy(v_sync_field41, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD41_STR));
       strcpy(v_sync_field42, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD42_STR));
       strcpy(v_sync_field43, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD43_STR));
       strcpy(v_sync_field44, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD44_STR));
       strcpy(v_sync_field45, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD45_STR));
       strcpy(v_sync_field46, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD46_STR));
       strcpy(v_sync_field47, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD47_STR));
       strcpy(v_sync_field48, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD48_STR));
       strcpy(v_sync_field49, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD49_STR));
       strcpy(v_sync_field50, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD50_STR));
       strcpy(v_sync_field51, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD51_STR));
       strcpy(v_sync_field52, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD52_STR));
       strcpy(v_sync_field53, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD53_STR));
       strcpy(v_sync_field54, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD54_STR));
       strcpy(v_sync_field55, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD55_STR));
       strcpy(v_sync_field56, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD56_STR));
       strcpy(v_sync_field57, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD57_STR));
       strcpy(v_sync_field58, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD58_STR));
       strcpy(v_sync_field59, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD59_STR));
       strcpy(v_sync_field60, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD60_STR));
       strcpy(v_sync_field61, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD61_STR));
       strcpy(v_sync_field62, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD62_STR));
       strcpy(v_sync_field63, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD63_STR));
       strcpy(v_sync_field64, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD64_STR));
       strcpy(v_sync_field65, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD65_STR));
       strcpy(v_sync_field66, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD66_STR));
       strcpy(v_sync_field67, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD67_STR));
       strcpy(v_sync_field68, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD68_STR));
       strcpy(v_sync_field69, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD69_STR));
       strcpy(v_sync_field70, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD70_STR));
       strcpy(v_sync_field71, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD71_STR));
       strcpy(v_sync_field72, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD72_STR));
       strcpy(v_sync_field73, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD73_STR));
       strcpy(v_sync_field74, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD74_STR));
       strcpy(v_sync_field75, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD75_STR));
       strcpy(v_sync_field76, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD76_STR));
       strcpy(v_sync_field77, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD77_STR));
       strcpy(v_sync_field78, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD78_STR));
       strcpy(v_sync_field79, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD79_STR));
       strcpy(v_sync_field80, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD80_STR));
       strcpy(v_sync_field81, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD81_STR));
       strcpy(v_sync_field82, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD82_STR));
       strcpy(v_sync_field83, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD83_STR));
       strcpy(v_sync_field84, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD84_STR));
       strcpy(v_sync_field85, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD85_STR));
       strcpy(v_sync_field86, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD86_STR));
       strcpy(v_sync_field87, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD87_STR));
       strcpy(v_sync_field88, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD88_STR));
       strcpy(v_sync_field89, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD89_STR));
       strcpy(v_sync_field90, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD90_STR));
       strcpy(v_sync_field91, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD91_STR));
       strcpy(v_sync_field92, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD92_STR));
       strcpy(v_sync_field93, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD93_STR));
       strcpy(v_sync_field94, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD94_STR));
       strcpy(v_sync_field95, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD95_STR));
       strcpy(v_sync_field96, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD96_STR));
       strcpy(v_sync_field97, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD97_STR));
       strcpy(v_sync_field98, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD98_STR));
       strcpy(v_sync_field99, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD99_STR));

       //调用过程[事务_数据同步_产品期货同步_同步交易组资产表]
       //组织事务请求
       if(lpTSCall1Ans2)
       {
         lpTSCall1Ans2->FreeMsg();
         lpTSCall1Ans2=NULL;
       }
       lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("dcsyncT.4.13", 0);
       lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
       lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
       lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
       lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
       lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
       lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
       lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
       lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD1_STR,v_sync_field1);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD2_STR,v_sync_field2);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD3_STR,v_sync_field3);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD4_STR,v_sync_field4);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD5_STR,v_sync_field5);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD6_STR,v_sync_field6);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD7_STR,v_sync_field7);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD8_STR,v_sync_field8);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD9_STR,v_sync_field9);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD10_STR,v_sync_field10);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD11_STR,v_sync_field11);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD12_STR,v_sync_field12);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD13_STR,v_sync_field13);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD14_STR,v_sync_field14);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD15_STR,v_sync_field15);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD16_STR,v_sync_field16);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD17_STR,v_sync_field17);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD18_STR,v_sync_field18);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD19_STR,v_sync_field19);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD20_STR,v_sync_field20);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD21_STR,v_sync_field21);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD22_STR,v_sync_field22);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD23_STR,v_sync_field23);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD24_STR,v_sync_field24);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD25_STR,v_sync_field25);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD26_STR,v_sync_field26);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD27_STR,v_sync_field27);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD28_STR,v_sync_field28);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD29_STR,v_sync_field29);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD30_STR,v_sync_field30);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD31_STR,v_sync_field31);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD32_STR,v_sync_field32);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD33_STR,v_sync_field33);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD34_STR,v_sync_field34);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD35_STR,v_sync_field35);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD36_STR,v_sync_field36);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD37_STR,v_sync_field37);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD38_STR,v_sync_field38);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD39_STR,v_sync_field39);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD40_STR,v_sync_field40);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD41_STR,v_sync_field41);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD42_STR,v_sync_field42);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD43_STR,v_sync_field43);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD44_STR,v_sync_field44);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD45_STR,v_sync_field45);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD46_STR,v_sync_field46);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD47_STR,v_sync_field47);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD48_STR,v_sync_field48);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD49_STR,v_sync_field49);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD50_STR,v_sync_field50);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD51_STR,v_sync_field51);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD52_STR,v_sync_field52);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD53_STR,v_sync_field53);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD54_STR,v_sync_field54);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD55_STR,v_sync_field55);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD56_STR,v_sync_field56);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD57_STR,v_sync_field57);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD58_STR,v_sync_field58);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD59_STR,v_sync_field59);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD60_STR,v_sync_field60);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD61_STR,v_sync_field61);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD62_STR,v_sync_field62);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD63_STR,v_sync_field63);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD64_STR,v_sync_field64);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD65_STR,v_sync_field65);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD66_STR,v_sync_field66);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD67_STR,v_sync_field67);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD68_STR,v_sync_field68);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD69_STR,v_sync_field69);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD70_STR,v_sync_field70);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD71_STR,v_sync_field71);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD72_STR,v_sync_field72);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD73_STR,v_sync_field73);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD74_STR,v_sync_field74);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD75_STR,v_sync_field75);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD76_STR,v_sync_field76);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD77_STR,v_sync_field77);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD78_STR,v_sync_field78);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD79_STR,v_sync_field79);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD80_STR,v_sync_field80);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD81_STR,v_sync_field81);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD82_STR,v_sync_field82);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD83_STR,v_sync_field83);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD84_STR,v_sync_field84);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD85_STR,v_sync_field85);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD86_STR,v_sync_field86);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD87_STR,v_sync_field87);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD88_STR,v_sync_field88);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD89_STR,v_sync_field89);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD90_STR,v_sync_field90);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD91_STR,v_sync_field91);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD92_STR,v_sync_field92);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD93_STR,v_sync_field93);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD94_STR,v_sync_field94);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD95_STR,v_sync_field95);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD96_STR,v_sync_field96);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD97_STR,v_sync_field97);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD98_STR,v_sync_field98);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD99_STR,v_sync_field99);
       glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
       if(!lpTSCall1Ans2)  //  超时错误
       {
           lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
           lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[dcsyncT.4.13]subcall timed out!");
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


       // [得到最大同步序号][@同步字段1#][@影响行数#][@记录序号#]
       GetMaxRowIDFun(v_sync_field1, &v_effect_row_count, &v_row_id);


        // if @影响行数#+1<200  then
        if (v_effect_row_count+1<200 )
        {

          // set @控制标志#=0;
          v_ctrl_flag=0;
        // end if;
        }


        // if @控制标志#=0 then
        if (v_ctrl_flag==0)
        {
          //完了测试方便,暂时先用这个功能

            // set @更新日期#=@机器日期#;
            v_update_date=v_mach_date;

            // set @更新时间#=@机器时间#;
            v_update_time=v_mach_time;
           //调用过程[事务_产品期货_同步接口_更新同步时间]
           //组织事务请求
           if(lpTSCall1Ans3)
           {
             lpTSCall1Ans3->FreeMsg();
             lpTSCall1Ans3=NULL;
           }
           lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdfutuT.15.2", 0);
           lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
           lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
           lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
           lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
           lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
           lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
           lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
           lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
           lpTSCall1Req3->SetString(LDBIZ_QRY_TABLE_STR,v_qry_table);
           lpTSCall1Req3->SetInt32(LDBIZ_UPDATE_DATE_INT,v_update_date);
           lpTSCall1Req3->SetInt32(LDBIZ_UPDATE_TIME_INT,v_update_time);
           glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
           if(!lpTSCall1Ans3)  //  超时错误
           {
               lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
               lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.15.2]subcall timed out!");
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
           v_mach_date = lpTSCall1Ans3->GetInt32(LDBIZ_MACH_DATE_INT);
           v_mach_time = lpTSCall1Ans3->GetInt32(LDBIZ_MACH_TIME_INT);

       // end if;
       }


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

//逻辑_数据同步_产品期货同步_同步资产账户资金表
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
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
    int v_ctrl_flag;
    int v_effect_row_count;
    int v_row_count;
    char v_qry_table[256];
    int v_update_date;
    int v_update_time;
    int v_mach_date;
    int v_mach_time;
    char v_sync_field1[10001];
    char v_sync_field2[10001];
    char v_sync_field3[10001];
    char v_sync_field4[10001];
    char v_sync_field5[10001];
    char v_sync_field6[10001];
    char v_sync_field7[10001];
    char v_sync_field8[10001];
    char v_sync_field9[10001];
    char v_sync_field10[10001];
    char v_sync_field11[10001];
    char v_sync_field12[10001];
    char v_sync_field13[10001];
    char v_sync_field14[10001];
    char v_sync_field15[10001];
    char v_sync_field16[10001];
    char v_sync_field17[10001];
    char v_sync_field18[10001];
    char v_sync_field19[10001];
    char v_sync_field20[10001];
    char v_sync_field21[10001];
    char v_sync_field22[10001];
    char v_sync_field23[10001];
    char v_sync_field24[10001];
    char v_sync_field25[10001];
    char v_sync_field26[10001];
    char v_sync_field27[10001];
    char v_sync_field28[10001];
    char v_sync_field29[10001];
    char v_sync_field30[10001];
    char v_sync_field31[10001];
    char v_sync_field32[10001];
    char v_sync_field33[10001];
    char v_sync_field34[10001];
    char v_sync_field35[10001];
    char v_sync_field36[10001];
    char v_sync_field37[10001];
    char v_sync_field38[10001];
    char v_sync_field39[10001];
    char v_sync_field40[10001];
    char v_sync_field41[10001];
    char v_sync_field42[10001];
    char v_sync_field43[10001];
    char v_sync_field44[10001];
    char v_sync_field45[10001];
    char v_sync_field46[10001];
    char v_sync_field47[10001];
    char v_sync_field48[10001];
    char v_sync_field49[10001];
    char v_sync_field50[10001];
    char v_sync_field51[10001];
    char v_sync_field52[10001];
    char v_sync_field53[10001];
    char v_sync_field54[10001];
    char v_sync_field55[10001];
    char v_sync_field56[10001];
    char v_sync_field57[10001];
    char v_sync_field58[10001];
    char v_sync_field59[10001];
    char v_sync_field60[10001];
    char v_sync_field61[10001];
    char v_sync_field62[10001];
    char v_sync_field63[10001];
    char v_sync_field64[10001];
    char v_sync_field65[10001];
    char v_sync_field66[10001];
    char v_sync_field67[10001];
    char v_sync_field68[10001];
    char v_sync_field69[10001];
    char v_sync_field70[10001];
    char v_sync_field71[10001];
    char v_sync_field72[10001];
    char v_sync_field73[10001];
    char v_sync_field74[10001];
    char v_sync_field75[10001];
    char v_sync_field76[10001];
    char v_sync_field77[10001];
    char v_sync_field78[10001];
    char v_sync_field79[10001];
    char v_sync_field80[10001];
    char v_sync_field81[10001];
    char v_sync_field82[10001];
    char v_sync_field83[10001];
    char v_sync_field84[10001];
    char v_sync_field85[10001];
    char v_sync_field86[10001];
    char v_sync_field87[10001];
    char v_sync_field88[10001];
    char v_sync_field89[10001];
    char v_sync_field90[10001];
    char v_sync_field91[10001];
    char v_sync_field92[10001];
    char v_sync_field93[10001];
    char v_sync_field94[10001];
    char v_sync_field95[10001];
    char v_sync_field96[10001];
    char v_sync_field97[10001];
    char v_sync_field98[10001];
    char v_sync_field99[10001];
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
    v_ctrl_flag=0;
    v_effect_row_count=0;
    v_row_count=-1;
    strcpy(v_qry_table, " ");
    v_update_date=0;
    v_update_time=0;
    v_mach_date=0;
    v_mach_time=0;
    strcpy(v_sync_field1, " ");
    strcpy(v_sync_field2, " ");
    strcpy(v_sync_field3, " ");
    strcpy(v_sync_field4, " ");
    strcpy(v_sync_field5, " ");
    strcpy(v_sync_field6, " ");
    strcpy(v_sync_field7, " ");
    strcpy(v_sync_field8, " ");
    strcpy(v_sync_field9, " ");
    strcpy(v_sync_field10, " ");
    strcpy(v_sync_field11, " ");
    strcpy(v_sync_field12, " ");
    strcpy(v_sync_field13, " ");
    strcpy(v_sync_field14, " ");
    strcpy(v_sync_field15, " ");
    strcpy(v_sync_field16, " ");
    strcpy(v_sync_field17, " ");
    strcpy(v_sync_field18, " ");
    strcpy(v_sync_field19, " ");
    strcpy(v_sync_field20, " ");
    strcpy(v_sync_field21, " ");
    strcpy(v_sync_field22, " ");
    strcpy(v_sync_field23, " ");
    strcpy(v_sync_field24, " ");
    strcpy(v_sync_field25, " ");
    strcpy(v_sync_field26, " ");
    strcpy(v_sync_field27, " ");
    strcpy(v_sync_field28, " ");
    strcpy(v_sync_field29, " ");
    strcpy(v_sync_field30, " ");
    strcpy(v_sync_field31, " ");
    strcpy(v_sync_field32, " ");
    strcpy(v_sync_field33, " ");
    strcpy(v_sync_field34, " ");
    strcpy(v_sync_field35, " ");
    strcpy(v_sync_field36, " ");
    strcpy(v_sync_field37, " ");
    strcpy(v_sync_field38, " ");
    strcpy(v_sync_field39, " ");
    strcpy(v_sync_field40, " ");
    strcpy(v_sync_field41, " ");
    strcpy(v_sync_field42, " ");
    strcpy(v_sync_field43, " ");
    strcpy(v_sync_field44, " ");
    strcpy(v_sync_field45, " ");
    strcpy(v_sync_field46, " ");
    strcpy(v_sync_field47, " ");
    strcpy(v_sync_field48, " ");
    strcpy(v_sync_field49, " ");
    strcpy(v_sync_field50, " ");
    strcpy(v_sync_field51, " ");
    strcpy(v_sync_field52, " ");
    strcpy(v_sync_field53, " ");
    strcpy(v_sync_field54, " ");
    strcpy(v_sync_field55, " ");
    strcpy(v_sync_field56, " ");
    strcpy(v_sync_field57, " ");
    strcpy(v_sync_field58, " ");
    strcpy(v_sync_field59, " ");
    strcpy(v_sync_field60, " ");
    strcpy(v_sync_field61, " ");
    strcpy(v_sync_field62, " ");
    strcpy(v_sync_field63, " ");
    strcpy(v_sync_field64, " ");
    strcpy(v_sync_field65, " ");
    strcpy(v_sync_field66, " ");
    strcpy(v_sync_field67, " ");
    strcpy(v_sync_field68, " ");
    strcpy(v_sync_field69, " ");
    strcpy(v_sync_field70, " ");
    strcpy(v_sync_field71, " ");
    strcpy(v_sync_field72, " ");
    strcpy(v_sync_field73, " ");
    strcpy(v_sync_field74, " ");
    strcpy(v_sync_field75, " ");
    strcpy(v_sync_field76, " ");
    strcpy(v_sync_field77, " ");
    strcpy(v_sync_field78, " ");
    strcpy(v_sync_field79, " ");
    strcpy(v_sync_field80, " ");
    strcpy(v_sync_field81, " ");
    strcpy(v_sync_field82, " ");
    strcpy(v_sync_field83, " ");
    strcpy(v_sync_field84, " ");
    strcpy(v_sync_field85, " ");
    strcpy(v_sync_field86, " ");
    strcpy(v_sync_field87, " ");
    strcpy(v_sync_field88, " ");
    strcpy(v_sync_field89, " ");
    strcpy(v_sync_field90, " ");
    strcpy(v_sync_field91, " ");
    strcpy(v_sync_field92, " ");
    strcpy(v_sync_field93, " ");
    strcpy(v_sync_field94, " ");
    strcpy(v_sync_field95, " ");
    strcpy(v_sync_field96, " ");
    strcpy(v_sync_field97, " ");
    strcpy(v_sync_field98, " ");
    strcpy(v_sync_field99, " ");
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
    IFastMessage* lpTSCall1Req4 = NULL;
    IFastMessage* lpTSCall1Ans4 = NULL;


    // set @记录序号#=0;
    v_row_id=0;

    // set @控制标志#=1;
    v_ctrl_flag=1;

    // set @影响行数#=0;
    v_effect_row_count=0;

    // set @指定行数#=200;
    v_row_count=200;
    //set @更新日期//=@更新日期//;
    //set @更新时间//=@更新时间//;

    // set @查询表名#="tb_pdfuca_asac_capit";
    strcpy(v_qry_table,"tb_pdfuca_asac_capit");
    //调用过程[事务_产品期货_同步接口_获取同步时间]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pdfutuT.15.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetString(LDBIZ_QRY_TABLE_STR,v_qry_table);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.15.1]subcall timed out!");
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
    v_update_date = lpTSCall1Ans0->GetInt32(LDBIZ_UPDATE_DATE_INT);
    v_update_time = lpTSCall1Ans0->GetInt32(LDBIZ_UPDATE_TIME_INT);
    v_mach_date = lpTSCall1Ans0->GetInt32(LDBIZ_MACH_DATE_INT);
    v_mach_time = lpTSCall1Ans0->GetInt32(LDBIZ_MACH_TIME_INT);


    // [while循环开始][@控制标志#]
    while (v_ctrl_flag)
    {

       //调用过程[事务_产品期货_同步接口_同步资产账户资金表]
       //组织事务请求
       if(lpTSCall1Ans1)
       {
         lpTSCall1Ans1->FreeMsg();
         lpTSCall1Ans1=NULL;
       }
       lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdfutuT.15.14", 0);
       lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
       lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
       lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
       lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
       lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
       lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
       lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
       lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
       lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
       lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
       lpTSCall1Req1->SetInt32(LDBIZ_CTRL_FLAG_INT,v_ctrl_flag);
       lpTSCall1Req1->SetInt32(LDBIZ_UPDATE_DATE_INT,v_update_date);
       lpTSCall1Req1->SetInt32(LDBIZ_UPDATE_TIME_INT,v_update_time);
       glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
       if(!lpTSCall1Ans1)  //  超时错误
       {
           lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
           lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.15.14]subcall timed out!");
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
       strcpy(v_sync_field1, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD1_STR));
       strcpy(v_sync_field2, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD2_STR));
       strcpy(v_sync_field3, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD3_STR));
       strcpy(v_sync_field4, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD4_STR));
       strcpy(v_sync_field5, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD5_STR));
       strcpy(v_sync_field6, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD6_STR));
       strcpy(v_sync_field7, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD7_STR));
       strcpy(v_sync_field8, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD8_STR));
       strcpy(v_sync_field9, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD9_STR));
       strcpy(v_sync_field10, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD10_STR));
       strcpy(v_sync_field11, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD11_STR));
       strcpy(v_sync_field12, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD12_STR));
       strcpy(v_sync_field13, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD13_STR));
       strcpy(v_sync_field14, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD14_STR));
       strcpy(v_sync_field15, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD15_STR));
       strcpy(v_sync_field16, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD16_STR));
       strcpy(v_sync_field17, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD17_STR));
       strcpy(v_sync_field18, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD18_STR));
       strcpy(v_sync_field19, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD19_STR));
       strcpy(v_sync_field20, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD20_STR));
       strcpy(v_sync_field21, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD21_STR));
       strcpy(v_sync_field22, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD22_STR));
       strcpy(v_sync_field23, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD23_STR));
       strcpy(v_sync_field24, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD24_STR));
       strcpy(v_sync_field25, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD25_STR));
       strcpy(v_sync_field26, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD26_STR));
       strcpy(v_sync_field27, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD27_STR));
       strcpy(v_sync_field28, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD28_STR));
       strcpy(v_sync_field29, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD29_STR));
       strcpy(v_sync_field30, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD30_STR));
       strcpy(v_sync_field31, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD31_STR));
       strcpy(v_sync_field32, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD32_STR));
       strcpy(v_sync_field33, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD33_STR));
       strcpy(v_sync_field34, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD34_STR));
       strcpy(v_sync_field35, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD35_STR));
       strcpy(v_sync_field36, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD36_STR));
       strcpy(v_sync_field37, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD37_STR));
       strcpy(v_sync_field38, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD38_STR));
       strcpy(v_sync_field39, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD39_STR));
       strcpy(v_sync_field40, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD40_STR));
       strcpy(v_sync_field41, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD41_STR));
       strcpy(v_sync_field42, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD42_STR));
       strcpy(v_sync_field43, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD43_STR));
       strcpy(v_sync_field44, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD44_STR));
       strcpy(v_sync_field45, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD45_STR));
       strcpy(v_sync_field46, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD46_STR));
       strcpy(v_sync_field47, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD47_STR));
       strcpy(v_sync_field48, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD48_STR));
       strcpy(v_sync_field49, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD49_STR));
       strcpy(v_sync_field50, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD50_STR));
       strcpy(v_sync_field51, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD51_STR));
       strcpy(v_sync_field52, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD52_STR));
       strcpy(v_sync_field53, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD53_STR));
       strcpy(v_sync_field54, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD54_STR));
       strcpy(v_sync_field55, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD55_STR));
       strcpy(v_sync_field56, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD56_STR));
       strcpy(v_sync_field57, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD57_STR));
       strcpy(v_sync_field58, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD58_STR));
       strcpy(v_sync_field59, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD59_STR));
       strcpy(v_sync_field60, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD60_STR));
       strcpy(v_sync_field61, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD61_STR));
       strcpy(v_sync_field62, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD62_STR));
       strcpy(v_sync_field63, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD63_STR));
       strcpy(v_sync_field64, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD64_STR));
       strcpy(v_sync_field65, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD65_STR));
       strcpy(v_sync_field66, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD66_STR));
       strcpy(v_sync_field67, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD67_STR));
       strcpy(v_sync_field68, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD68_STR));
       strcpy(v_sync_field69, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD69_STR));
       strcpy(v_sync_field70, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD70_STR));
       strcpy(v_sync_field71, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD71_STR));
       strcpy(v_sync_field72, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD72_STR));
       strcpy(v_sync_field73, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD73_STR));
       strcpy(v_sync_field74, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD74_STR));
       strcpy(v_sync_field75, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD75_STR));
       strcpy(v_sync_field76, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD76_STR));
       strcpy(v_sync_field77, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD77_STR));
       strcpy(v_sync_field78, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD78_STR));
       strcpy(v_sync_field79, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD79_STR));
       strcpy(v_sync_field80, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD80_STR));
       strcpy(v_sync_field81, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD81_STR));
       strcpy(v_sync_field82, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD82_STR));
       strcpy(v_sync_field83, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD83_STR));
       strcpy(v_sync_field84, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD84_STR));
       strcpy(v_sync_field85, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD85_STR));
       strcpy(v_sync_field86, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD86_STR));
       strcpy(v_sync_field87, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD87_STR));
       strcpy(v_sync_field88, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD88_STR));
       strcpy(v_sync_field89, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD89_STR));
       strcpy(v_sync_field90, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD90_STR));
       strcpy(v_sync_field91, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD91_STR));
       strcpy(v_sync_field92, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD92_STR));
       strcpy(v_sync_field93, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD93_STR));
       strcpy(v_sync_field94, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD94_STR));
       strcpy(v_sync_field95, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD95_STR));
       strcpy(v_sync_field96, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD96_STR));
       strcpy(v_sync_field97, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD97_STR));
       strcpy(v_sync_field98, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD98_STR));
       strcpy(v_sync_field99, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD99_STR));

       //调用过程[事务_数据同步_产品期货同步_同步资产账户资金表]
       //组织事务请求
       if(lpTSCall1Ans2)
       {
         lpTSCall1Ans2->FreeMsg();
         lpTSCall1Ans2=NULL;
       }
       lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("dcsyncT.4.14", 0);
       lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
       lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
       lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
       lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
       lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
       lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
       lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
       lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD1_STR,v_sync_field1);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD2_STR,v_sync_field2);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD3_STR,v_sync_field3);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD4_STR,v_sync_field4);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD5_STR,v_sync_field5);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD6_STR,v_sync_field6);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD7_STR,v_sync_field7);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD8_STR,v_sync_field8);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD9_STR,v_sync_field9);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD10_STR,v_sync_field10);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD11_STR,v_sync_field11);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD12_STR,v_sync_field12);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD13_STR,v_sync_field13);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD14_STR,v_sync_field14);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD15_STR,v_sync_field15);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD16_STR,v_sync_field16);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD17_STR,v_sync_field17);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD18_STR,v_sync_field18);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD19_STR,v_sync_field19);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD20_STR,v_sync_field20);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD21_STR,v_sync_field21);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD22_STR,v_sync_field22);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD23_STR,v_sync_field23);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD24_STR,v_sync_field24);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD25_STR,v_sync_field25);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD26_STR,v_sync_field26);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD27_STR,v_sync_field27);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD28_STR,v_sync_field28);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD29_STR,v_sync_field29);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD30_STR,v_sync_field30);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD31_STR,v_sync_field31);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD32_STR,v_sync_field32);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD33_STR,v_sync_field33);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD34_STR,v_sync_field34);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD35_STR,v_sync_field35);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD36_STR,v_sync_field36);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD37_STR,v_sync_field37);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD38_STR,v_sync_field38);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD39_STR,v_sync_field39);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD40_STR,v_sync_field40);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD41_STR,v_sync_field41);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD42_STR,v_sync_field42);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD43_STR,v_sync_field43);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD44_STR,v_sync_field44);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD45_STR,v_sync_field45);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD46_STR,v_sync_field46);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD47_STR,v_sync_field47);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD48_STR,v_sync_field48);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD49_STR,v_sync_field49);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD50_STR,v_sync_field50);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD51_STR,v_sync_field51);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD52_STR,v_sync_field52);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD53_STR,v_sync_field53);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD54_STR,v_sync_field54);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD55_STR,v_sync_field55);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD56_STR,v_sync_field56);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD57_STR,v_sync_field57);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD58_STR,v_sync_field58);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD59_STR,v_sync_field59);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD60_STR,v_sync_field60);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD61_STR,v_sync_field61);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD62_STR,v_sync_field62);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD63_STR,v_sync_field63);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD64_STR,v_sync_field64);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD65_STR,v_sync_field65);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD66_STR,v_sync_field66);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD67_STR,v_sync_field67);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD68_STR,v_sync_field68);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD69_STR,v_sync_field69);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD70_STR,v_sync_field70);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD71_STR,v_sync_field71);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD72_STR,v_sync_field72);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD73_STR,v_sync_field73);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD74_STR,v_sync_field74);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD75_STR,v_sync_field75);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD76_STR,v_sync_field76);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD77_STR,v_sync_field77);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD78_STR,v_sync_field78);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD79_STR,v_sync_field79);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD80_STR,v_sync_field80);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD81_STR,v_sync_field81);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD82_STR,v_sync_field82);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD83_STR,v_sync_field83);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD84_STR,v_sync_field84);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD85_STR,v_sync_field85);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD86_STR,v_sync_field86);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD87_STR,v_sync_field87);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD88_STR,v_sync_field88);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD89_STR,v_sync_field89);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD90_STR,v_sync_field90);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD91_STR,v_sync_field91);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD92_STR,v_sync_field92);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD93_STR,v_sync_field93);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD94_STR,v_sync_field94);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD95_STR,v_sync_field95);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD96_STR,v_sync_field96);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD97_STR,v_sync_field97);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD98_STR,v_sync_field98);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD99_STR,v_sync_field99);
       glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
       if(!lpTSCall1Ans2)  //  超时错误
       {
           lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
           lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[dcsyncT.4.14]subcall timed out!");
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


       // [得到最大同步序号][@同步字段1#][@影响行数#][@记录序号#]
       GetMaxRowIDFun(v_sync_field1, &v_effect_row_count, &v_row_id);


        // if @影响行数#+1<200  then
        if (v_effect_row_count+1<200 )
        {

          // set @控制标志#=0;
          v_ctrl_flag=0;
        // end if;
        }


        // if @控制标志#=0 then
        if (v_ctrl_flag==0)
        {
          //完了测试方便,暂时先用这个功能

            // set @更新日期#=@机器日期#;
            v_update_date=v_mach_date;

            // set @更新时间#=@机器时间#;
            v_update_time=v_mach_time;
           //调用过程[事务_产品期货_同步接口_更新同步时间]
           //组织事务请求
           if(lpTSCall1Ans3)
           {
             lpTSCall1Ans3->FreeMsg();
             lpTSCall1Ans3=NULL;
           }
           lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdfutuT.15.2", 0);
           lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
           lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
           lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
           lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
           lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
           lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
           lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
           lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
           lpTSCall1Req3->SetString(LDBIZ_QRY_TABLE_STR,v_qry_table);
           lpTSCall1Req3->SetInt32(LDBIZ_UPDATE_DATE_INT,v_update_date);
           lpTSCall1Req3->SetInt32(LDBIZ_UPDATE_TIME_INT,v_update_time);
           glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
           if(!lpTSCall1Ans3)  //  超时错误
           {
               lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
               lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.15.2]subcall timed out!");
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
           v_mach_date = lpTSCall1Ans3->GetInt32(LDBIZ_MACH_DATE_INT);
           v_mach_time = lpTSCall1Ans3->GetInt32(LDBIZ_MACH_TIME_INT);

       // end if;
       }


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

//逻辑_数据同步_产品期货同步_同步交易组持仓表
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
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
    int v_ctrl_flag;
    int v_effect_row_count;
    int v_row_count;
    char v_qry_table[256];
    int v_update_date;
    int v_update_time;
    int v_mach_date;
    int v_mach_time;
    char v_sync_field1[10001];
    char v_sync_field2[10001];
    char v_sync_field3[10001];
    char v_sync_field4[10001];
    char v_sync_field5[10001];
    char v_sync_field6[10001];
    char v_sync_field7[10001];
    char v_sync_field8[10001];
    char v_sync_field9[10001];
    char v_sync_field10[10001];
    char v_sync_field11[10001];
    char v_sync_field12[10001];
    char v_sync_field13[10001];
    char v_sync_field14[10001];
    char v_sync_field15[10001];
    char v_sync_field16[10001];
    char v_sync_field17[10001];
    char v_sync_field18[10001];
    char v_sync_field19[10001];
    char v_sync_field20[10001];
    char v_sync_field21[10001];
    char v_sync_field22[10001];
    char v_sync_field23[10001];
    char v_sync_field24[10001];
    char v_sync_field25[10001];
    char v_sync_field26[10001];
    char v_sync_field27[10001];
    char v_sync_field28[10001];
    char v_sync_field29[10001];
    char v_sync_field30[10001];
    char v_sync_field31[10001];
    char v_sync_field32[10001];
    char v_sync_field33[10001];
    char v_sync_field34[10001];
    char v_sync_field35[10001];
    char v_sync_field36[10001];
    char v_sync_field37[10001];
    char v_sync_field38[10001];
    char v_sync_field39[10001];
    char v_sync_field40[10001];
    char v_sync_field41[10001];
    char v_sync_field42[10001];
    char v_sync_field43[10001];
    char v_sync_field44[10001];
    char v_sync_field45[10001];
    char v_sync_field46[10001];
    char v_sync_field47[10001];
    char v_sync_field48[10001];
    char v_sync_field49[10001];
    char v_sync_field50[10001];
    char v_sync_field51[10001];
    char v_sync_field52[10001];
    char v_sync_field53[10001];
    char v_sync_field54[10001];
    char v_sync_field55[10001];
    char v_sync_field56[10001];
    char v_sync_field57[10001];
    char v_sync_field58[10001];
    char v_sync_field59[10001];
    char v_sync_field60[10001];
    char v_sync_field61[10001];
    char v_sync_field62[10001];
    char v_sync_field63[10001];
    char v_sync_field64[10001];
    char v_sync_field65[10001];
    char v_sync_field66[10001];
    char v_sync_field67[10001];
    char v_sync_field68[10001];
    char v_sync_field69[10001];
    char v_sync_field70[10001];
    char v_sync_field71[10001];
    char v_sync_field72[10001];
    char v_sync_field73[10001];
    char v_sync_field74[10001];
    char v_sync_field75[10001];
    char v_sync_field76[10001];
    char v_sync_field77[10001];
    char v_sync_field78[10001];
    char v_sync_field79[10001];
    char v_sync_field80[10001];
    char v_sync_field81[10001];
    char v_sync_field82[10001];
    char v_sync_field83[10001];
    char v_sync_field84[10001];
    char v_sync_field85[10001];
    char v_sync_field86[10001];
    char v_sync_field87[10001];
    char v_sync_field88[10001];
    char v_sync_field89[10001];
    char v_sync_field90[10001];
    char v_sync_field91[10001];
    char v_sync_field92[10001];
    char v_sync_field93[10001];
    char v_sync_field94[10001];
    char v_sync_field95[10001];
    char v_sync_field96[10001];
    char v_sync_field97[10001];
    char v_sync_field98[10001];
    char v_sync_field99[10001];
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
    v_ctrl_flag=0;
    v_effect_row_count=0;
    v_row_count=-1;
    strcpy(v_qry_table, " ");
    v_update_date=0;
    v_update_time=0;
    v_mach_date=0;
    v_mach_time=0;
    strcpy(v_sync_field1, " ");
    strcpy(v_sync_field2, " ");
    strcpy(v_sync_field3, " ");
    strcpy(v_sync_field4, " ");
    strcpy(v_sync_field5, " ");
    strcpy(v_sync_field6, " ");
    strcpy(v_sync_field7, " ");
    strcpy(v_sync_field8, " ");
    strcpy(v_sync_field9, " ");
    strcpy(v_sync_field10, " ");
    strcpy(v_sync_field11, " ");
    strcpy(v_sync_field12, " ");
    strcpy(v_sync_field13, " ");
    strcpy(v_sync_field14, " ");
    strcpy(v_sync_field15, " ");
    strcpy(v_sync_field16, " ");
    strcpy(v_sync_field17, " ");
    strcpy(v_sync_field18, " ");
    strcpy(v_sync_field19, " ");
    strcpy(v_sync_field20, " ");
    strcpy(v_sync_field21, " ");
    strcpy(v_sync_field22, " ");
    strcpy(v_sync_field23, " ");
    strcpy(v_sync_field24, " ");
    strcpy(v_sync_field25, " ");
    strcpy(v_sync_field26, " ");
    strcpy(v_sync_field27, " ");
    strcpy(v_sync_field28, " ");
    strcpy(v_sync_field29, " ");
    strcpy(v_sync_field30, " ");
    strcpy(v_sync_field31, " ");
    strcpy(v_sync_field32, " ");
    strcpy(v_sync_field33, " ");
    strcpy(v_sync_field34, " ");
    strcpy(v_sync_field35, " ");
    strcpy(v_sync_field36, " ");
    strcpy(v_sync_field37, " ");
    strcpy(v_sync_field38, " ");
    strcpy(v_sync_field39, " ");
    strcpy(v_sync_field40, " ");
    strcpy(v_sync_field41, " ");
    strcpy(v_sync_field42, " ");
    strcpy(v_sync_field43, " ");
    strcpy(v_sync_field44, " ");
    strcpy(v_sync_field45, " ");
    strcpy(v_sync_field46, " ");
    strcpy(v_sync_field47, " ");
    strcpy(v_sync_field48, " ");
    strcpy(v_sync_field49, " ");
    strcpy(v_sync_field50, " ");
    strcpy(v_sync_field51, " ");
    strcpy(v_sync_field52, " ");
    strcpy(v_sync_field53, " ");
    strcpy(v_sync_field54, " ");
    strcpy(v_sync_field55, " ");
    strcpy(v_sync_field56, " ");
    strcpy(v_sync_field57, " ");
    strcpy(v_sync_field58, " ");
    strcpy(v_sync_field59, " ");
    strcpy(v_sync_field60, " ");
    strcpy(v_sync_field61, " ");
    strcpy(v_sync_field62, " ");
    strcpy(v_sync_field63, " ");
    strcpy(v_sync_field64, " ");
    strcpy(v_sync_field65, " ");
    strcpy(v_sync_field66, " ");
    strcpy(v_sync_field67, " ");
    strcpy(v_sync_field68, " ");
    strcpy(v_sync_field69, " ");
    strcpy(v_sync_field70, " ");
    strcpy(v_sync_field71, " ");
    strcpy(v_sync_field72, " ");
    strcpy(v_sync_field73, " ");
    strcpy(v_sync_field74, " ");
    strcpy(v_sync_field75, " ");
    strcpy(v_sync_field76, " ");
    strcpy(v_sync_field77, " ");
    strcpy(v_sync_field78, " ");
    strcpy(v_sync_field79, " ");
    strcpy(v_sync_field80, " ");
    strcpy(v_sync_field81, " ");
    strcpy(v_sync_field82, " ");
    strcpy(v_sync_field83, " ");
    strcpy(v_sync_field84, " ");
    strcpy(v_sync_field85, " ");
    strcpy(v_sync_field86, " ");
    strcpy(v_sync_field87, " ");
    strcpy(v_sync_field88, " ");
    strcpy(v_sync_field89, " ");
    strcpy(v_sync_field90, " ");
    strcpy(v_sync_field91, " ");
    strcpy(v_sync_field92, " ");
    strcpy(v_sync_field93, " ");
    strcpy(v_sync_field94, " ");
    strcpy(v_sync_field95, " ");
    strcpy(v_sync_field96, " ");
    strcpy(v_sync_field97, " ");
    strcpy(v_sync_field98, " ");
    strcpy(v_sync_field99, " ");
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
    IFastMessage* lpTSCall1Req4 = NULL;
    IFastMessage* lpTSCall1Ans4 = NULL;


    // set @记录序号#=0;
    v_row_id=0;

    // set @控制标志#=1;
    v_ctrl_flag=1;

    // set @影响行数#=0;
    v_effect_row_count=0;

    // set @指定行数#=200;
    v_row_count=200;
    //set @更新日期//=@更新日期//;
    //set @更新时间//=@更新时间//;

    // set @查询表名#="tb_pdfupo_exgp_posi";
    strcpy(v_qry_table,"tb_pdfupo_exgp_posi");
    //调用过程[事务_产品期货_同步接口_获取同步时间]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pdfutuT.15.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetString(LDBIZ_QRY_TABLE_STR,v_qry_table);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.15.1]subcall timed out!");
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
    v_update_date = lpTSCall1Ans0->GetInt32(LDBIZ_UPDATE_DATE_INT);
    v_update_time = lpTSCall1Ans0->GetInt32(LDBIZ_UPDATE_TIME_INT);
    v_mach_date = lpTSCall1Ans0->GetInt32(LDBIZ_MACH_DATE_INT);
    v_mach_time = lpTSCall1Ans0->GetInt32(LDBIZ_MACH_TIME_INT);


    // [while循环开始][@控制标志#]
    while (v_ctrl_flag)
    {

       //调用过程[事务_产品期货_同步接口_同步交易组持仓表]
       //组织事务请求
       if(lpTSCall1Ans1)
       {
         lpTSCall1Ans1->FreeMsg();
         lpTSCall1Ans1=NULL;
       }
       lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdfutuT.15.15", 0);
       lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
       lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
       lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
       lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
       lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
       lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
       lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
       lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
       lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
       lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
       lpTSCall1Req1->SetInt32(LDBIZ_CTRL_FLAG_INT,v_ctrl_flag);
       lpTSCall1Req1->SetInt32(LDBIZ_UPDATE_DATE_INT,v_update_date);
       lpTSCall1Req1->SetInt32(LDBIZ_UPDATE_TIME_INT,v_update_time);
       glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
       if(!lpTSCall1Ans1)  //  超时错误
       {
           lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
           lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.15.15]subcall timed out!");
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
       strcpy(v_sync_field1, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD1_STR));
       strcpy(v_sync_field2, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD2_STR));
       strcpy(v_sync_field3, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD3_STR));
       strcpy(v_sync_field4, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD4_STR));
       strcpy(v_sync_field5, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD5_STR));
       strcpy(v_sync_field6, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD6_STR));
       strcpy(v_sync_field7, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD7_STR));
       strcpy(v_sync_field8, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD8_STR));
       strcpy(v_sync_field9, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD9_STR));
       strcpy(v_sync_field10, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD10_STR));
       strcpy(v_sync_field11, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD11_STR));
       strcpy(v_sync_field12, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD12_STR));
       strcpy(v_sync_field13, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD13_STR));
       strcpy(v_sync_field14, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD14_STR));
       strcpy(v_sync_field15, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD15_STR));
       strcpy(v_sync_field16, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD16_STR));
       strcpy(v_sync_field17, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD17_STR));
       strcpy(v_sync_field18, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD18_STR));
       strcpy(v_sync_field19, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD19_STR));
       strcpy(v_sync_field20, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD20_STR));
       strcpy(v_sync_field21, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD21_STR));
       strcpy(v_sync_field22, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD22_STR));
       strcpy(v_sync_field23, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD23_STR));
       strcpy(v_sync_field24, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD24_STR));
       strcpy(v_sync_field25, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD25_STR));
       strcpy(v_sync_field26, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD26_STR));
       strcpy(v_sync_field27, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD27_STR));
       strcpy(v_sync_field28, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD28_STR));
       strcpy(v_sync_field29, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD29_STR));
       strcpy(v_sync_field30, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD30_STR));
       strcpy(v_sync_field31, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD31_STR));
       strcpy(v_sync_field32, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD32_STR));
       strcpy(v_sync_field33, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD33_STR));
       strcpy(v_sync_field34, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD34_STR));
       strcpy(v_sync_field35, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD35_STR));
       strcpy(v_sync_field36, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD36_STR));
       strcpy(v_sync_field37, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD37_STR));
       strcpy(v_sync_field38, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD38_STR));
       strcpy(v_sync_field39, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD39_STR));
       strcpy(v_sync_field40, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD40_STR));
       strcpy(v_sync_field41, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD41_STR));
       strcpy(v_sync_field42, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD42_STR));
       strcpy(v_sync_field43, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD43_STR));
       strcpy(v_sync_field44, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD44_STR));
       strcpy(v_sync_field45, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD45_STR));
       strcpy(v_sync_field46, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD46_STR));
       strcpy(v_sync_field47, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD47_STR));
       strcpy(v_sync_field48, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD48_STR));
       strcpy(v_sync_field49, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD49_STR));
       strcpy(v_sync_field50, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD50_STR));
       strcpy(v_sync_field51, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD51_STR));
       strcpy(v_sync_field52, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD52_STR));
       strcpy(v_sync_field53, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD53_STR));
       strcpy(v_sync_field54, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD54_STR));
       strcpy(v_sync_field55, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD55_STR));
       strcpy(v_sync_field56, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD56_STR));
       strcpy(v_sync_field57, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD57_STR));
       strcpy(v_sync_field58, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD58_STR));
       strcpy(v_sync_field59, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD59_STR));
       strcpy(v_sync_field60, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD60_STR));
       strcpy(v_sync_field61, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD61_STR));
       strcpy(v_sync_field62, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD62_STR));
       strcpy(v_sync_field63, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD63_STR));
       strcpy(v_sync_field64, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD64_STR));
       strcpy(v_sync_field65, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD65_STR));
       strcpy(v_sync_field66, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD66_STR));
       strcpy(v_sync_field67, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD67_STR));
       strcpy(v_sync_field68, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD68_STR));
       strcpy(v_sync_field69, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD69_STR));
       strcpy(v_sync_field70, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD70_STR));
       strcpy(v_sync_field71, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD71_STR));
       strcpy(v_sync_field72, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD72_STR));
       strcpy(v_sync_field73, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD73_STR));
       strcpy(v_sync_field74, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD74_STR));
       strcpy(v_sync_field75, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD75_STR));
       strcpy(v_sync_field76, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD76_STR));
       strcpy(v_sync_field77, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD77_STR));
       strcpy(v_sync_field78, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD78_STR));
       strcpy(v_sync_field79, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD79_STR));
       strcpy(v_sync_field80, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD80_STR));
       strcpy(v_sync_field81, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD81_STR));
       strcpy(v_sync_field82, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD82_STR));
       strcpy(v_sync_field83, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD83_STR));
       strcpy(v_sync_field84, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD84_STR));
       strcpy(v_sync_field85, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD85_STR));
       strcpy(v_sync_field86, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD86_STR));
       strcpy(v_sync_field87, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD87_STR));
       strcpy(v_sync_field88, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD88_STR));
       strcpy(v_sync_field89, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD89_STR));
       strcpy(v_sync_field90, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD90_STR));
       strcpy(v_sync_field91, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD91_STR));
       strcpy(v_sync_field92, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD92_STR));
       strcpy(v_sync_field93, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD93_STR));
       strcpy(v_sync_field94, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD94_STR));
       strcpy(v_sync_field95, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD95_STR));
       strcpy(v_sync_field96, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD96_STR));
       strcpy(v_sync_field97, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD97_STR));
       strcpy(v_sync_field98, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD98_STR));
       strcpy(v_sync_field99, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD99_STR));

       //调用过程[事务_数据同步_产品期货同步_同步交易组持仓表]
       //组织事务请求
       if(lpTSCall1Ans2)
       {
         lpTSCall1Ans2->FreeMsg();
         lpTSCall1Ans2=NULL;
       }
       lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("dcsyncT.4.15", 0);
       lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
       lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
       lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
       lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
       lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
       lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
       lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
       lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD1_STR,v_sync_field1);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD2_STR,v_sync_field2);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD3_STR,v_sync_field3);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD4_STR,v_sync_field4);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD5_STR,v_sync_field5);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD6_STR,v_sync_field6);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD7_STR,v_sync_field7);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD8_STR,v_sync_field8);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD9_STR,v_sync_field9);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD10_STR,v_sync_field10);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD11_STR,v_sync_field11);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD12_STR,v_sync_field12);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD13_STR,v_sync_field13);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD14_STR,v_sync_field14);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD15_STR,v_sync_field15);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD16_STR,v_sync_field16);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD17_STR,v_sync_field17);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD18_STR,v_sync_field18);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD19_STR,v_sync_field19);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD20_STR,v_sync_field20);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD21_STR,v_sync_field21);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD22_STR,v_sync_field22);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD23_STR,v_sync_field23);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD24_STR,v_sync_field24);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD25_STR,v_sync_field25);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD26_STR,v_sync_field26);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD27_STR,v_sync_field27);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD28_STR,v_sync_field28);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD29_STR,v_sync_field29);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD30_STR,v_sync_field30);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD31_STR,v_sync_field31);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD32_STR,v_sync_field32);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD33_STR,v_sync_field33);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD34_STR,v_sync_field34);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD35_STR,v_sync_field35);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD36_STR,v_sync_field36);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD37_STR,v_sync_field37);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD38_STR,v_sync_field38);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD39_STR,v_sync_field39);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD40_STR,v_sync_field40);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD41_STR,v_sync_field41);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD42_STR,v_sync_field42);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD43_STR,v_sync_field43);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD44_STR,v_sync_field44);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD45_STR,v_sync_field45);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD46_STR,v_sync_field46);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD47_STR,v_sync_field47);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD48_STR,v_sync_field48);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD49_STR,v_sync_field49);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD50_STR,v_sync_field50);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD51_STR,v_sync_field51);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD52_STR,v_sync_field52);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD53_STR,v_sync_field53);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD54_STR,v_sync_field54);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD55_STR,v_sync_field55);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD56_STR,v_sync_field56);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD57_STR,v_sync_field57);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD58_STR,v_sync_field58);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD59_STR,v_sync_field59);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD60_STR,v_sync_field60);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD61_STR,v_sync_field61);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD62_STR,v_sync_field62);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD63_STR,v_sync_field63);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD64_STR,v_sync_field64);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD65_STR,v_sync_field65);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD66_STR,v_sync_field66);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD67_STR,v_sync_field67);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD68_STR,v_sync_field68);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD69_STR,v_sync_field69);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD70_STR,v_sync_field70);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD71_STR,v_sync_field71);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD72_STR,v_sync_field72);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD73_STR,v_sync_field73);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD74_STR,v_sync_field74);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD75_STR,v_sync_field75);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD76_STR,v_sync_field76);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD77_STR,v_sync_field77);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD78_STR,v_sync_field78);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD79_STR,v_sync_field79);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD80_STR,v_sync_field80);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD81_STR,v_sync_field81);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD82_STR,v_sync_field82);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD83_STR,v_sync_field83);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD84_STR,v_sync_field84);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD85_STR,v_sync_field85);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD86_STR,v_sync_field86);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD87_STR,v_sync_field87);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD88_STR,v_sync_field88);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD89_STR,v_sync_field89);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD90_STR,v_sync_field90);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD91_STR,v_sync_field91);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD92_STR,v_sync_field92);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD93_STR,v_sync_field93);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD94_STR,v_sync_field94);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD95_STR,v_sync_field95);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD96_STR,v_sync_field96);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD97_STR,v_sync_field97);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD98_STR,v_sync_field98);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD99_STR,v_sync_field99);
       glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
       if(!lpTSCall1Ans2)  //  超时错误
       {
           lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
           lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[dcsyncT.4.15]subcall timed out!");
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


       // [得到最大同步序号][@同步字段1#][@影响行数#][@记录序号#]
       GetMaxRowIDFun(v_sync_field1, &v_effect_row_count, &v_row_id);


        // if @影响行数#+1<200  then
        if (v_effect_row_count+1<200 )
        {

          // set @控制标志#=0;
          v_ctrl_flag=0;
        // end if;
        }


        // if @控制标志#=0 then
        if (v_ctrl_flag==0)
        {
          //完了测试方便,暂时先用这个功能

            // set @更新日期#=@机器日期#;
            v_update_date=v_mach_date;

            // set @更新时间#=@机器时间#;
            v_update_time=v_mach_time;
           //调用过程[事务_产品期货_同步接口_更新同步时间]
           //组织事务请求
           if(lpTSCall1Ans3)
           {
             lpTSCall1Ans3->FreeMsg();
             lpTSCall1Ans3=NULL;
           }
           lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdfutuT.15.2", 0);
           lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
           lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
           lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
           lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
           lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
           lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
           lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
           lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
           lpTSCall1Req3->SetString(LDBIZ_QRY_TABLE_STR,v_qry_table);
           lpTSCall1Req3->SetInt32(LDBIZ_UPDATE_DATE_INT,v_update_date);
           lpTSCall1Req3->SetInt32(LDBIZ_UPDATE_TIME_INT,v_update_time);
           glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
           if(!lpTSCall1Ans3)  //  超时错误
           {
               lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
               lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.15.2]subcall timed out!");
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
           v_mach_date = lpTSCall1Ans3->GetInt32(LDBIZ_MACH_DATE_INT);
           v_mach_time = lpTSCall1Ans3->GetInt32(LDBIZ_MACH_TIME_INT);

       // end if;
       }


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

//逻辑_数据同步_产品期货同步_同步资产账户持仓表
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
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
    int v_ctrl_flag;
    int v_effect_row_count;
    int v_row_count;
    char v_qry_table[256];
    int v_update_date;
    int v_update_time;
    int v_mach_date;
    int v_mach_time;
    char v_sync_field1[10001];
    char v_sync_field2[10001];
    char v_sync_field3[10001];
    char v_sync_field4[10001];
    char v_sync_field5[10001];
    char v_sync_field6[10001];
    char v_sync_field7[10001];
    char v_sync_field8[10001];
    char v_sync_field9[10001];
    char v_sync_field10[10001];
    char v_sync_field11[10001];
    char v_sync_field12[10001];
    char v_sync_field13[10001];
    char v_sync_field14[10001];
    char v_sync_field15[10001];
    char v_sync_field16[10001];
    char v_sync_field17[10001];
    char v_sync_field18[10001];
    char v_sync_field19[10001];
    char v_sync_field20[10001];
    char v_sync_field21[10001];
    char v_sync_field22[10001];
    char v_sync_field23[10001];
    char v_sync_field24[10001];
    char v_sync_field25[10001];
    char v_sync_field26[10001];
    char v_sync_field27[10001];
    char v_sync_field28[10001];
    char v_sync_field29[10001];
    char v_sync_field30[10001];
    char v_sync_field31[10001];
    char v_sync_field32[10001];
    char v_sync_field33[10001];
    char v_sync_field34[10001];
    char v_sync_field35[10001];
    char v_sync_field36[10001];
    char v_sync_field37[10001];
    char v_sync_field38[10001];
    char v_sync_field39[10001];
    char v_sync_field40[10001];
    char v_sync_field41[10001];
    char v_sync_field42[10001];
    char v_sync_field43[10001];
    char v_sync_field44[10001];
    char v_sync_field45[10001];
    char v_sync_field46[10001];
    char v_sync_field47[10001];
    char v_sync_field48[10001];
    char v_sync_field49[10001];
    char v_sync_field50[10001];
    char v_sync_field51[10001];
    char v_sync_field52[10001];
    char v_sync_field53[10001];
    char v_sync_field54[10001];
    char v_sync_field55[10001];
    char v_sync_field56[10001];
    char v_sync_field57[10001];
    char v_sync_field58[10001];
    char v_sync_field59[10001];
    char v_sync_field60[10001];
    char v_sync_field61[10001];
    char v_sync_field62[10001];
    char v_sync_field63[10001];
    char v_sync_field64[10001];
    char v_sync_field65[10001];
    char v_sync_field66[10001];
    char v_sync_field67[10001];
    char v_sync_field68[10001];
    char v_sync_field69[10001];
    char v_sync_field70[10001];
    char v_sync_field71[10001];
    char v_sync_field72[10001];
    char v_sync_field73[10001];
    char v_sync_field74[10001];
    char v_sync_field75[10001];
    char v_sync_field76[10001];
    char v_sync_field77[10001];
    char v_sync_field78[10001];
    char v_sync_field79[10001];
    char v_sync_field80[10001];
    char v_sync_field81[10001];
    char v_sync_field82[10001];
    char v_sync_field83[10001];
    char v_sync_field84[10001];
    char v_sync_field85[10001];
    char v_sync_field86[10001];
    char v_sync_field87[10001];
    char v_sync_field88[10001];
    char v_sync_field89[10001];
    char v_sync_field90[10001];
    char v_sync_field91[10001];
    char v_sync_field92[10001];
    char v_sync_field93[10001];
    char v_sync_field94[10001];
    char v_sync_field95[10001];
    char v_sync_field96[10001];
    char v_sync_field97[10001];
    char v_sync_field98[10001];
    char v_sync_field99[10001];
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
    v_ctrl_flag=0;
    v_effect_row_count=0;
    v_row_count=-1;
    strcpy(v_qry_table, " ");
    v_update_date=0;
    v_update_time=0;
    v_mach_date=0;
    v_mach_time=0;
    strcpy(v_sync_field1, " ");
    strcpy(v_sync_field2, " ");
    strcpy(v_sync_field3, " ");
    strcpy(v_sync_field4, " ");
    strcpy(v_sync_field5, " ");
    strcpy(v_sync_field6, " ");
    strcpy(v_sync_field7, " ");
    strcpy(v_sync_field8, " ");
    strcpy(v_sync_field9, " ");
    strcpy(v_sync_field10, " ");
    strcpy(v_sync_field11, " ");
    strcpy(v_sync_field12, " ");
    strcpy(v_sync_field13, " ");
    strcpy(v_sync_field14, " ");
    strcpy(v_sync_field15, " ");
    strcpy(v_sync_field16, " ");
    strcpy(v_sync_field17, " ");
    strcpy(v_sync_field18, " ");
    strcpy(v_sync_field19, " ");
    strcpy(v_sync_field20, " ");
    strcpy(v_sync_field21, " ");
    strcpy(v_sync_field22, " ");
    strcpy(v_sync_field23, " ");
    strcpy(v_sync_field24, " ");
    strcpy(v_sync_field25, " ");
    strcpy(v_sync_field26, " ");
    strcpy(v_sync_field27, " ");
    strcpy(v_sync_field28, " ");
    strcpy(v_sync_field29, " ");
    strcpy(v_sync_field30, " ");
    strcpy(v_sync_field31, " ");
    strcpy(v_sync_field32, " ");
    strcpy(v_sync_field33, " ");
    strcpy(v_sync_field34, " ");
    strcpy(v_sync_field35, " ");
    strcpy(v_sync_field36, " ");
    strcpy(v_sync_field37, " ");
    strcpy(v_sync_field38, " ");
    strcpy(v_sync_field39, " ");
    strcpy(v_sync_field40, " ");
    strcpy(v_sync_field41, " ");
    strcpy(v_sync_field42, " ");
    strcpy(v_sync_field43, " ");
    strcpy(v_sync_field44, " ");
    strcpy(v_sync_field45, " ");
    strcpy(v_sync_field46, " ");
    strcpy(v_sync_field47, " ");
    strcpy(v_sync_field48, " ");
    strcpy(v_sync_field49, " ");
    strcpy(v_sync_field50, " ");
    strcpy(v_sync_field51, " ");
    strcpy(v_sync_field52, " ");
    strcpy(v_sync_field53, " ");
    strcpy(v_sync_field54, " ");
    strcpy(v_sync_field55, " ");
    strcpy(v_sync_field56, " ");
    strcpy(v_sync_field57, " ");
    strcpy(v_sync_field58, " ");
    strcpy(v_sync_field59, " ");
    strcpy(v_sync_field60, " ");
    strcpy(v_sync_field61, " ");
    strcpy(v_sync_field62, " ");
    strcpy(v_sync_field63, " ");
    strcpy(v_sync_field64, " ");
    strcpy(v_sync_field65, " ");
    strcpy(v_sync_field66, " ");
    strcpy(v_sync_field67, " ");
    strcpy(v_sync_field68, " ");
    strcpy(v_sync_field69, " ");
    strcpy(v_sync_field70, " ");
    strcpy(v_sync_field71, " ");
    strcpy(v_sync_field72, " ");
    strcpy(v_sync_field73, " ");
    strcpy(v_sync_field74, " ");
    strcpy(v_sync_field75, " ");
    strcpy(v_sync_field76, " ");
    strcpy(v_sync_field77, " ");
    strcpy(v_sync_field78, " ");
    strcpy(v_sync_field79, " ");
    strcpy(v_sync_field80, " ");
    strcpy(v_sync_field81, " ");
    strcpy(v_sync_field82, " ");
    strcpy(v_sync_field83, " ");
    strcpy(v_sync_field84, " ");
    strcpy(v_sync_field85, " ");
    strcpy(v_sync_field86, " ");
    strcpy(v_sync_field87, " ");
    strcpy(v_sync_field88, " ");
    strcpy(v_sync_field89, " ");
    strcpy(v_sync_field90, " ");
    strcpy(v_sync_field91, " ");
    strcpy(v_sync_field92, " ");
    strcpy(v_sync_field93, " ");
    strcpy(v_sync_field94, " ");
    strcpy(v_sync_field95, " ");
    strcpy(v_sync_field96, " ");
    strcpy(v_sync_field97, " ");
    strcpy(v_sync_field98, " ");
    strcpy(v_sync_field99, " ");
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
    IFastMessage* lpTSCall1Req4 = NULL;
    IFastMessage* lpTSCall1Ans4 = NULL;


    // set @记录序号#=0;
    v_row_id=0;

    // set @控制标志#=1;
    v_ctrl_flag=1;

    // set @影响行数#=0;
    v_effect_row_count=0;

    // set @指定行数#=200;
    v_row_count=200;
    //set @更新日期//=@更新日期//;
    //set @更新时间//=@更新时间//;

    // set @查询表名#="tb_pdfupo_asac_posi";
    strcpy(v_qry_table,"tb_pdfupo_asac_posi");
    //调用过程[事务_产品期货_同步接口_获取同步时间]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pdfutuT.15.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetString(LDBIZ_QRY_TABLE_STR,v_qry_table);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.15.1]subcall timed out!");
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
    v_update_date = lpTSCall1Ans0->GetInt32(LDBIZ_UPDATE_DATE_INT);
    v_update_time = lpTSCall1Ans0->GetInt32(LDBIZ_UPDATE_TIME_INT);
    v_mach_date = lpTSCall1Ans0->GetInt32(LDBIZ_MACH_DATE_INT);
    v_mach_time = lpTSCall1Ans0->GetInt32(LDBIZ_MACH_TIME_INT);


    // [while循环开始][@控制标志#]
    while (v_ctrl_flag)
    {

       //调用过程[事务_产品期货_同步接口_同步资产账户持仓表]
       //组织事务请求
       if(lpTSCall1Ans1)
       {
         lpTSCall1Ans1->FreeMsg();
         lpTSCall1Ans1=NULL;
       }
       lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdfutuT.15.16", 0);
       lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
       lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
       lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
       lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
       lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
       lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
       lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
       lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
       lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
       lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
       lpTSCall1Req1->SetInt32(LDBIZ_CTRL_FLAG_INT,v_ctrl_flag);
       lpTSCall1Req1->SetInt32(LDBIZ_UPDATE_DATE_INT,v_update_date);
       lpTSCall1Req1->SetInt32(LDBIZ_UPDATE_TIME_INT,v_update_time);
       glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
       if(!lpTSCall1Ans1)  //  超时错误
       {
           lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
           lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.15.16]subcall timed out!");
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
       strcpy(v_sync_field1, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD1_STR));
       strcpy(v_sync_field2, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD2_STR));
       strcpy(v_sync_field3, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD3_STR));
       strcpy(v_sync_field4, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD4_STR));
       strcpy(v_sync_field5, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD5_STR));
       strcpy(v_sync_field6, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD6_STR));
       strcpy(v_sync_field7, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD7_STR));
       strcpy(v_sync_field8, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD8_STR));
       strcpy(v_sync_field9, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD9_STR));
       strcpy(v_sync_field10, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD10_STR));
       strcpy(v_sync_field11, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD11_STR));
       strcpy(v_sync_field12, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD12_STR));
       strcpy(v_sync_field13, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD13_STR));
       strcpy(v_sync_field14, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD14_STR));
       strcpy(v_sync_field15, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD15_STR));
       strcpy(v_sync_field16, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD16_STR));
       strcpy(v_sync_field17, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD17_STR));
       strcpy(v_sync_field18, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD18_STR));
       strcpy(v_sync_field19, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD19_STR));
       strcpy(v_sync_field20, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD20_STR));
       strcpy(v_sync_field21, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD21_STR));
       strcpy(v_sync_field22, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD22_STR));
       strcpy(v_sync_field23, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD23_STR));
       strcpy(v_sync_field24, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD24_STR));
       strcpy(v_sync_field25, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD25_STR));
       strcpy(v_sync_field26, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD26_STR));
       strcpy(v_sync_field27, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD27_STR));
       strcpy(v_sync_field28, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD28_STR));
       strcpy(v_sync_field29, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD29_STR));
       strcpy(v_sync_field30, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD30_STR));
       strcpy(v_sync_field31, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD31_STR));
       strcpy(v_sync_field32, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD32_STR));
       strcpy(v_sync_field33, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD33_STR));
       strcpy(v_sync_field34, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD34_STR));
       strcpy(v_sync_field35, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD35_STR));
       strcpy(v_sync_field36, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD36_STR));
       strcpy(v_sync_field37, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD37_STR));
       strcpy(v_sync_field38, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD38_STR));
       strcpy(v_sync_field39, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD39_STR));
       strcpy(v_sync_field40, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD40_STR));
       strcpy(v_sync_field41, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD41_STR));
       strcpy(v_sync_field42, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD42_STR));
       strcpy(v_sync_field43, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD43_STR));
       strcpy(v_sync_field44, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD44_STR));
       strcpy(v_sync_field45, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD45_STR));
       strcpy(v_sync_field46, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD46_STR));
       strcpy(v_sync_field47, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD47_STR));
       strcpy(v_sync_field48, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD48_STR));
       strcpy(v_sync_field49, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD49_STR));
       strcpy(v_sync_field50, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD50_STR));
       strcpy(v_sync_field51, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD51_STR));
       strcpy(v_sync_field52, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD52_STR));
       strcpy(v_sync_field53, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD53_STR));
       strcpy(v_sync_field54, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD54_STR));
       strcpy(v_sync_field55, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD55_STR));
       strcpy(v_sync_field56, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD56_STR));
       strcpy(v_sync_field57, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD57_STR));
       strcpy(v_sync_field58, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD58_STR));
       strcpy(v_sync_field59, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD59_STR));
       strcpy(v_sync_field60, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD60_STR));
       strcpy(v_sync_field61, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD61_STR));
       strcpy(v_sync_field62, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD62_STR));
       strcpy(v_sync_field63, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD63_STR));
       strcpy(v_sync_field64, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD64_STR));
       strcpy(v_sync_field65, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD65_STR));
       strcpy(v_sync_field66, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD66_STR));
       strcpy(v_sync_field67, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD67_STR));
       strcpy(v_sync_field68, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD68_STR));
       strcpy(v_sync_field69, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD69_STR));
       strcpy(v_sync_field70, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD70_STR));
       strcpy(v_sync_field71, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD71_STR));
       strcpy(v_sync_field72, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD72_STR));
       strcpy(v_sync_field73, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD73_STR));
       strcpy(v_sync_field74, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD74_STR));
       strcpy(v_sync_field75, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD75_STR));
       strcpy(v_sync_field76, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD76_STR));
       strcpy(v_sync_field77, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD77_STR));
       strcpy(v_sync_field78, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD78_STR));
       strcpy(v_sync_field79, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD79_STR));
       strcpy(v_sync_field80, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD80_STR));
       strcpy(v_sync_field81, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD81_STR));
       strcpy(v_sync_field82, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD82_STR));
       strcpy(v_sync_field83, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD83_STR));
       strcpy(v_sync_field84, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD84_STR));
       strcpy(v_sync_field85, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD85_STR));
       strcpy(v_sync_field86, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD86_STR));
       strcpy(v_sync_field87, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD87_STR));
       strcpy(v_sync_field88, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD88_STR));
       strcpy(v_sync_field89, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD89_STR));
       strcpy(v_sync_field90, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD90_STR));
       strcpy(v_sync_field91, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD91_STR));
       strcpy(v_sync_field92, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD92_STR));
       strcpy(v_sync_field93, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD93_STR));
       strcpy(v_sync_field94, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD94_STR));
       strcpy(v_sync_field95, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD95_STR));
       strcpy(v_sync_field96, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD96_STR));
       strcpy(v_sync_field97, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD97_STR));
       strcpy(v_sync_field98, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD98_STR));
       strcpy(v_sync_field99, lpTSCall1Ans1->GetString(LDBIZ_SYNC_FIELD99_STR));

       //调用过程[事务_数据同步_产品期货同步_同步资产账户持仓表]
       //组织事务请求
       if(lpTSCall1Ans2)
       {
         lpTSCall1Ans2->FreeMsg();
         lpTSCall1Ans2=NULL;
       }
       lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("dcsyncT.4.16", 0);
       lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
       lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
       lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
       lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
       lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
       lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
       lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
       lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD1_STR,v_sync_field1);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD2_STR,v_sync_field2);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD3_STR,v_sync_field3);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD4_STR,v_sync_field4);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD5_STR,v_sync_field5);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD6_STR,v_sync_field6);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD7_STR,v_sync_field7);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD8_STR,v_sync_field8);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD9_STR,v_sync_field9);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD10_STR,v_sync_field10);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD11_STR,v_sync_field11);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD12_STR,v_sync_field12);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD13_STR,v_sync_field13);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD14_STR,v_sync_field14);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD15_STR,v_sync_field15);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD16_STR,v_sync_field16);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD17_STR,v_sync_field17);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD18_STR,v_sync_field18);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD19_STR,v_sync_field19);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD20_STR,v_sync_field20);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD21_STR,v_sync_field21);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD22_STR,v_sync_field22);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD23_STR,v_sync_field23);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD24_STR,v_sync_field24);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD25_STR,v_sync_field25);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD26_STR,v_sync_field26);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD27_STR,v_sync_field27);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD28_STR,v_sync_field28);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD29_STR,v_sync_field29);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD30_STR,v_sync_field30);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD31_STR,v_sync_field31);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD32_STR,v_sync_field32);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD33_STR,v_sync_field33);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD34_STR,v_sync_field34);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD35_STR,v_sync_field35);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD36_STR,v_sync_field36);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD37_STR,v_sync_field37);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD38_STR,v_sync_field38);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD39_STR,v_sync_field39);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD40_STR,v_sync_field40);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD41_STR,v_sync_field41);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD42_STR,v_sync_field42);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD43_STR,v_sync_field43);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD44_STR,v_sync_field44);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD45_STR,v_sync_field45);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD46_STR,v_sync_field46);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD47_STR,v_sync_field47);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD48_STR,v_sync_field48);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD49_STR,v_sync_field49);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD50_STR,v_sync_field50);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD51_STR,v_sync_field51);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD52_STR,v_sync_field52);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD53_STR,v_sync_field53);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD54_STR,v_sync_field54);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD55_STR,v_sync_field55);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD56_STR,v_sync_field56);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD57_STR,v_sync_field57);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD58_STR,v_sync_field58);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD59_STR,v_sync_field59);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD60_STR,v_sync_field60);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD61_STR,v_sync_field61);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD62_STR,v_sync_field62);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD63_STR,v_sync_field63);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD64_STR,v_sync_field64);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD65_STR,v_sync_field65);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD66_STR,v_sync_field66);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD67_STR,v_sync_field67);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD68_STR,v_sync_field68);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD69_STR,v_sync_field69);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD70_STR,v_sync_field70);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD71_STR,v_sync_field71);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD72_STR,v_sync_field72);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD73_STR,v_sync_field73);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD74_STR,v_sync_field74);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD75_STR,v_sync_field75);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD76_STR,v_sync_field76);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD77_STR,v_sync_field77);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD78_STR,v_sync_field78);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD79_STR,v_sync_field79);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD80_STR,v_sync_field80);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD81_STR,v_sync_field81);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD82_STR,v_sync_field82);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD83_STR,v_sync_field83);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD84_STR,v_sync_field84);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD85_STR,v_sync_field85);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD86_STR,v_sync_field86);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD87_STR,v_sync_field87);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD88_STR,v_sync_field88);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD89_STR,v_sync_field89);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD90_STR,v_sync_field90);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD91_STR,v_sync_field91);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD92_STR,v_sync_field92);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD93_STR,v_sync_field93);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD94_STR,v_sync_field94);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD95_STR,v_sync_field95);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD96_STR,v_sync_field96);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD97_STR,v_sync_field97);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD98_STR,v_sync_field98);
       lpTSCall1Req2->SetString(LDBIZ_SYNC_FIELD99_STR,v_sync_field99);
       glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
       if(!lpTSCall1Ans2)  //  超时错误
       {
           lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
           lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[dcsyncT.4.16]subcall timed out!");
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


       // [得到最大同步序号][@同步字段1#][@影响行数#][@记录序号#]
       GetMaxRowIDFun(v_sync_field1, &v_effect_row_count, &v_row_id);


        // if @影响行数#+1<200  then
        if (v_effect_row_count+1<200 )
        {

          // set @控制标志#=0;
          v_ctrl_flag=0;
        // end if;
        }


        // if @控制标志#=0 then
        if (v_ctrl_flag==0)
        {
          //完了测试方便,暂时先用这个功能

            // set @更新日期#=@机器日期#;
            v_update_date=v_mach_date;

            // set @更新时间#=@机器时间#;
            v_update_time=v_mach_time;
           //调用过程[事务_产品期货_同步接口_更新同步时间]
           //组织事务请求
           if(lpTSCall1Ans3)
           {
             lpTSCall1Ans3->FreeMsg();
             lpTSCall1Ans3=NULL;
           }
           lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdfutuT.15.2", 0);
           lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
           lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
           lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
           lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
           lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
           lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
           lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
           lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
           lpTSCall1Req3->SetString(LDBIZ_QRY_TABLE_STR,v_qry_table);
           lpTSCall1Req3->SetInt32(LDBIZ_UPDATE_DATE_INT,v_update_date);
           lpTSCall1Req3->SetInt32(LDBIZ_UPDATE_TIME_INT,v_update_time);
           glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
           if(!lpTSCall1Ans3)  //  超时错误
           {
               lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
               lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.15.2]subcall timed out!");
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
           v_mach_date = lpTSCall1Ans3->GetInt32(LDBIZ_MACH_DATE_INT);
           v_mach_time = lpTSCall1Ans3->GetInt32(LDBIZ_MACH_TIME_INT);

       // end if;
       }


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

