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
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.1");
        bizFuncInfo->lpFunc = fnFunc0;
    }
    else if (iFunIndex==1)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.2");
        bizFuncInfo->lpFunc = fnFunc1;
    }
    else if (iFunIndex==2)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.3");
        bizFuncInfo->lpFunc = fnFunc2;
    }
    else if (iFunIndex==3)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.5");
        bizFuncInfo->lpFunc = fnFunc3;
    }
    else if (iFunIndex==4)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.6");
        bizFuncInfo->lpFunc = fnFunc4;
    }
    else if (iFunIndex==5)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.7");
        bizFuncInfo->lpFunc = fnFunc5;
    }
    else if (iFunIndex==6)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.8");
        bizFuncInfo->lpFunc = fnFunc6;
    }
    else if (iFunIndex==7)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.9");
        bizFuncInfo->lpFunc = fnFunc7;
    }
    else if (iFunIndex==8)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.10");
        bizFuncInfo->lpFunc = fnFunc8;
    }
    else if (iFunIndex==9)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.11");
        bizFuncInfo->lpFunc = fnFunc9;
    }
    else if (iFunIndex==10)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.12");
        bizFuncInfo->lpFunc = fnFunc10;
    }
    else if (iFunIndex==11)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.13");
        bizFuncInfo->lpFunc = fnFunc11;
    }
    else if (iFunIndex==12)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.31");
        bizFuncInfo->lpFunc = fnFunc12;
    }
    else if (iFunIndex==13)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.71");
        bizFuncInfo->lpFunc = fnFunc13;
    }
    else if (iFunIndex==14)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.72");
        bizFuncInfo->lpFunc = fnFunc14;
    }
    else if (iFunIndex==15)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.81");
        bizFuncInfo->lpFunc = fnFunc15;
    }
    else if (iFunIndex==16)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.82");
        bizFuncInfo->lpFunc = fnFunc16;
    }
    else if (iFunIndex==17)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.90");
        bizFuncInfo->lpFunc = fnFunc17;
    }
    else if (iFunIndex==18)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.91");
        bizFuncInfo->lpFunc = fnFunc18;
    }
    else if (iFunIndex==19)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.92");
        bizFuncInfo->lpFunc = fnFunc19;
    }
    else if (iFunIndex==20)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.93");
        bizFuncInfo->lpFunc = fnFunc20;
    }
    else if (iFunIndex==21)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.94");
        bizFuncInfo->lpFunc = fnFunc21;
    }
    else if (iFunIndex==22)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.95");
        bizFuncInfo->lpFunc = fnFunc22;
    }
    else if (iFunIndex==23)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.96");
        bizFuncInfo->lpFunc = fnFunc23;
    }
    else if (iFunIndex==24)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.97");
        bizFuncInfo->lpFunc = fnFunc24;
    }
    else if (iFunIndex==25)
    {
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.9.98");
        bizFuncInfo->lpFunc = fnFunc25;
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
    return "20190712";
}

//逻辑_产品证券_持仓运维_核对内部证券持仓记录
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
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_query_row_id;
    int v_tmp_asset_acco_no;
    int64 v_row_id;
    int v_co_no;
    int v_pd_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    double v_curr_qty;
    double v_avail_qty;
    double v_out_impawn_qty;
    int v_pass_no;
    char v_out_acco[33];
    char v_asac_busi_config_str[65];
    char v_last_error_code[33];
    int v_exch_group_no;
    int v_default_exch_group_no;
    char v_stock_code[7];
    char v_stock_name[65];
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
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_query_row_id=0;
    v_tmp_asset_acco_no=0;
    v_row_id=0;
    v_co_no=0;
    v_pd_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_curr_qty=0;
    v_avail_qty=0;
    v_out_impawn_qty=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_asac_busi_config_str, " ");
    strcpy(v_last_error_code, "0");
    v_exch_group_no=0;
    v_default_exch_group_no=0;
    strcpy(v_stock_code, " ");
    strcpy(v_stock_name, " ");
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


    // set @查询记录序号# = 0;
    v_query_row_id = 0;

    // set @临时_资产账户编号# = 0;
    v_tmp_asset_acco_no = 0;
    // loop_label:loop
    while (true)
    {

        //调用过程[事务_产品证券_持仓运维_获取内部证券持仓记录]
        //组织事务请求
        if(lpTSCall1Ans1)
        {
          lpTSCall1Ans1->FreeMsg();
          lpTSCall1Ans1=NULL;
        }
        lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.1", 0);
        lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req1->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req1->SetInt64(LDBIZ_QUERY_ROW_ID_INT64,v_query_row_id);
        glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 15000);
        if(!lpTSCall1Ans1)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.1]subcall timed out!");
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
        v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
        v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
        v_stock_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
        v_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        v_curr_qty = lpTSCall1Ans1->GetDouble(LDBIZ_CURR_QTY_FLOAT);
        v_avail_qty = lpTSCall1Ans1->GetDouble(LDBIZ_AVAIL_QTY_FLOAT);
        v_out_impawn_qty = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_IMPAWN_QTY_FLOAT);


        // if @错误编码# <> "0" then
        if (strcmp(v_error_code , "0")!=0)
        {

            // set @错误编码# = "0";
            strcpy(v_error_code,"0");

            // set @错误信息# = " ";
            strcpy(v_error_info," ");
            // leave loop_label;
            break;

        }
        // else
        else
        {


            // set @查询记录序号# = @记录序号#;
            v_query_row_id = v_row_id;

            // if @资产账户编号# <> @临时_资产账户编号# then
            if (v_asset_acco_no != v_tmp_asset_acco_no)
            {

                // set @临时_资产账户编号# = @资产账户编号#;
                v_tmp_asset_acco_no = v_asset_acco_no;
                //调用过程[事务_产品_公共接口_检查和获取同步资产账户信息]
                //组织事务请求
                if(lpTSCall1Ans2)
                {
                  lpTSCall1Ans2->FreeMsg();
                  lpTSCall1Ans2=NULL;
                }
                lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("prodT.6.9", 0);
                lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
                if(!lpTSCall1Ans2)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.9]subcall timed out!");
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
                v_pass_no = lpTSCall1Ans2->GetInt32(LDBIZ_PASS_NO_INT);
                strcpy(v_out_acco, lpTSCall1Ans2->GetString(LDBIZ_OUT_ACCO_STR));
                strcpy(v_asac_busi_config_str, lpTSCall1Ans2->GetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR));


                // if @错误编码# <> "0" then
                if (strcmp(v_error_code , "0")!=0)
                {

                    // set @前错误编码# = @错误编码#;
                    strcpy(v_last_error_code,v_error_code);

                    // set @错误编码# = "0";
                    strcpy(v_error_code,"0");

                    // set @错误信息# = " ";
                    strcpy(v_error_info," ");
                }
                // else
                else
                {


                    // set @前错误编码# = "0";
                    strcpy(v_last_error_code,"0");
                    //调用过程[事务_公共_公共接口_检查和获取同步内部核对所需公共信息]
                    //组织事务请求
                    if(lpTSCall1Ans3)
                    {
                      lpTSCall1Ans3->FreeMsg();
                      lpTSCall1Ans3=NULL;
                    }
                    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.24.58", 0);
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
                    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
                    if(!lpTSCall1Ans3)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.58]subcall timed out!");
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
                    v_exch_group_no = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
                    strcpy(v_co_busi_config_str, lpTSCall1Ans3->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));


                    // if @错误编码# <> "0" then
                    if (strcmp(v_error_code , "0")!=0)
                    {

                        // set @前错误编码# = @错误编码#;
                        strcpy(v_last_error_code,v_error_code);

                        // set @错误编码# = "0";
                        strcpy(v_error_code,"0");

                        // set @错误信息# = " ";
                        strcpy(v_error_info," ");
                    // end if;
                    }

                    //默认交易组从产品库获取 set @默认交易组编号// = @交易组编号//;
                    //调用过程[事务_产品_公共接口_获取资产账户默认交易组编号]
                    //组织事务请求
                    if(lpTSCall1Ans4)
                    {
                      lpTSCall1Ans4->FreeMsg();
                      lpTSCall1Ans4=NULL;
                    }
                    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("prodT.6.47", 0);
                    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
                    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                    lpTSCall1Req4->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
                    if(!lpTSCall1Ans4)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.47]subcall timed out!");
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
                    v_default_exch_group_no = lpTSCall1Ans4->GetInt32(LDBIZ_DEFAULT_EXCH_GROUP_NO_INT);

                // end if;
                }

            // end if;
            }


            // if @前错误编码# = "0" then
            if (strcmp(v_last_error_code , "0")==0)
            {
                //调用过程[事务_公共_公共接口_检查和获取同步内部核对所需证券代码编号信息]
                //组织事务请求
                if(lpTSCall1Ans5)
                {
                  lpTSCall1Ans5->FreeMsg();
                  lpTSCall1Ans5=NULL;
                }
                lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pubT.24.59", 0);
                lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req5->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
                if(!lpTSCall1Ans5)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.59]subcall timed out!");
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
                strcpy(v_stock_code, lpTSCall1Ans5->GetString(LDBIZ_STOCK_CODE_STR));
                strcpy(v_stock_name, lpTSCall1Ans5->GetString(LDBIZ_STOCK_NAME_STR));
                v_stock_type = lpTSCall1Ans5->GetInt32(LDBIZ_STOCK_TYPE_INT);
                v_asset_type = lpTSCall1Ans5->GetInt32(LDBIZ_ASSET_TYPE_INT);


                // if @错误编码# <> "0" then
                if (strcmp(v_error_code , "0")!=0)
                {

                    // set @错误编码# = "0";
                    strcpy(v_error_code,"0");

                    // set @错误信息# = " ";
                    strcpy(v_error_info," ");
                }
                // else
                else
                {

                    //调用过程[事务_产品证券_持仓运维_转入内部证券持仓核对记录]
                    //组织事务请求
                    if(lpTSCall1Ans6)
                    {
                      lpTSCall1Ans6->FreeMsg();
                      lpTSCall1Ans6=NULL;
                    }
                    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.2", 0);
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
                    lpTSCall1Req6->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                    lpTSCall1Req6->SetInt32(LDBIZ_DEFAULT_EXCH_GROUP_NO_INT,v_default_exch_group_no);
                    lpTSCall1Req6->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
                    lpTSCall1Req6->SetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR,v_asac_busi_config_str);
                    lpTSCall1Req6->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
                    lpTSCall1Req6->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
                    lpTSCall1Req6->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                    lpTSCall1Req6->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                    lpTSCall1Req6->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                    lpTSCall1Req6->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
                    lpTSCall1Req6->SetString(LDBIZ_STOCK_NAME_STR,v_stock_name);
                    lpTSCall1Req6->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
                    lpTSCall1Req6->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
                    lpTSCall1Req6->SetDouble(LDBIZ_CURR_QTY_FLOAT,v_curr_qty);
                    lpTSCall1Req6->SetDouble(LDBIZ_AVAIL_QTY_FLOAT,v_avail_qty);
                    lpTSCall1Req6->SetDouble(LDBIZ_OUT_IMPAWN_QTY_FLOAT,v_out_impawn_qty);
                    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 15000);
                    if(!lpTSCall1Ans6)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.2]subcall timed out!");
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


                    // if @错误编码# <> "0" then
                    if (strcmp(v_error_code , "0")!=0)
                    {

                        // set @错误编码# = "0";
                        strcpy(v_error_code,"0");

                        // set @错误信息# = " ";
                        strcpy(v_error_info," ");
                    // end if;
                    }

                // end if;
                }

            // end if;
            }

        // end if;
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

//逻辑_产品证券_持仓运维_查询资产账户内外持仓差异记录
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
    char v_co_no_str[2049];
    char v_pd_no_str[2049];
    int v_asset_acco_no;
    char v_stock_code_str[4097];
    char v_exch_no_str[2049];
    int v_is_contain;
    int v_pass_no;
    char v_out_acco[33];
    char v_deal_flag_query_str[2049];
    int v_filter_diff_cond;
    int v_asset_sync_flag;
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
    int v_exch_no;
    int v_stock_acco_no;
    char v_stock_acco[17];
    int v_stock_code_no;
    char v_stock_code[7];
    char v_stock_name[65];
    double v_out_cost_price;
    double v_acco_curr_qty;
    double v_acco_avail_qty;
    double v_out_curr_qty;
    double v_out_enable_qty;
    double v_acco_curr_qty_diff;
    double v_acco_avail_qty_diff;
    double v_out_impawn_qty;
    int v_deal_flag;
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
    strcpy(v_co_no_str, " ");
    strcpy(v_pd_no_str, " ");
    v_asset_acco_no=0;
    strcpy(v_stock_code_str, " ");
    strcpy(v_exch_no_str, " ");
    v_is_contain=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_deal_flag_query_str, " ");
    v_filter_diff_cond=0;
    v_asset_sync_flag=0;
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
    v_exch_no=0;
    v_stock_acco_no=0;
    strcpy(v_stock_acco, " ");
    v_stock_code_no=0;
    strcpy(v_stock_code, " ");
    strcpy(v_stock_name, " ");
    v_out_cost_price=0;
    v_acco_curr_qty=0;
    v_acco_avail_qty=0;
    v_out_curr_qty=0;
    v_out_enable_qty=0;
    v_acco_curr_qty_diff=0;
    v_acco_avail_qty_diff=0;
    v_out_impawn_qty=0;
    v_deal_flag=0;
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
    strncpy(v_co_no_str, lpInBizMsg->GetString(LDBIZ_CO_NO_STR_STR),2048);
    v_co_no_str[2048] = '\0';
    strncpy(v_pd_no_str, lpInBizMsg->GetString(LDBIZ_PD_NO_STR_STR),2048);
    v_pd_no_str[2048] = '\0';
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strncpy(v_stock_code_str, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR_STR),4096);
    v_stock_code_str[4096] = '\0';
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_is_contain = lpInBizMsg->GetInt32(LDBIZ_IS_CONTAIN_INT);
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    strncpy(v_out_acco, lpInBizMsg->GetString(LDBIZ_OUT_ACCO_STR),32);
    v_out_acco[32] = '\0';
    strncpy(v_deal_flag_query_str, lpInBizMsg->GetString(LDBIZ_DEAL_FLAG_QUERY_STR_STR),2048);
    v_deal_flag_query_str[2048] = '\0';
    v_filter_diff_cond = lpInBizMsg->GetInt32(LDBIZ_FILTER_DIFF_COND_INT);
    v_asset_sync_flag = lpInBizMsg->GetInt32(LDBIZ_ASSET_SYNC_FLAG_INT);
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

    //调用过程[事务_产品证券_持仓运维_查询资产账户内外持仓差异记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.3", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetString(LDBIZ_CO_NO_STR_STR,v_co_no_str);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR_STR,v_stock_code_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_IS_CONTAIN_INT,v_is_contain);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req1->SetString(LDBIZ_DEAL_FLAG_QUERY_STR_STR,v_deal_flag_query_str);
    lpTSCall1Req1->SetInt32(LDBIZ_FILTER_DIFF_COND_INT,v_filter_diff_cond);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_SYNC_FLAG_INT,v_asset_sync_flag);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.3]subcall timed out!");
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

//逻辑_产品证券_持仓运维_处理资产账户内外持仓差异记录
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
    int64 v_row_id;
    int v_sync_deal_type;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_co_no;
    int v_asset_acco_no;
    char v_out_acco[33];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_exch_no;
    int v_stock_code_no;
    int v_valid_flag;
    char v_busi_config_str[65];
    char v_deal_info[256];
    int v_pd_no;
    int v_exch_group_no;
    int v_stock_acco_no;
    double v_occur_qty;
    int v_asset_sync_flag;
    int64 v_asac_posi_id;
    int v_asac_stock_type;
    int v_asac_asset_type;
    int v_asac_invest_type;
    double v_asac_begin_qty;
    double v_asac_curr_qty;
    double v_asac_pre_settle_qty;
    double v_asac_frozen_qty;
    double v_asac_unfroz_qty;
    double v_asac_posi_qty_check_diff;
    double v_asac_cost_amt;
    double v_asac_realize_pandl;
    double v_asac_intrst_cost_amt;
    double v_asac_intrst_pandl;
    int v_asac_update_times;
    int64 v_exgp_posi_id;
    int v_exch_group_stock_type;
    int v_exch_group_asset_type;
    int v_exgp_invest_type;
    double v_exch_group_begin_qty;
    double v_exgp_curr_qty;
    double v_exgp_pre_settle_qty;
    double v_exgp_frozen_qty;
    double v_exgp_unfroz_qty;
    double v_exgp_posi_qty_check_diff;
    double v_exgp_cost_amt;
    double v_exgp_realize_pandl;
    double v_exgp_intrst_cost_amt;
    double v_exgp_intrst_pandl;
    int v_exch_group_update_times;
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
    v_row_id=0;
    v_sync_deal_type=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_co_no=0;
    v_asset_acco_no=0;
    strcpy(v_out_acco, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_exch_no=0;
    v_stock_code_no=0;
    v_valid_flag=0;
    strcpy(v_busi_config_str, " ");
    strcpy(v_deal_info, " ");
    v_pd_no=0;
    v_exch_group_no=0;
    v_stock_acco_no=0;
    v_occur_qty=0;
    v_asset_sync_flag=0;
    v_asac_posi_id=0;
    v_asac_stock_type=0;
    v_asac_asset_type=0;
    v_asac_invest_type=0;
    v_asac_begin_qty=0;
    v_asac_curr_qty=0;
    v_asac_pre_settle_qty=0;
    v_asac_frozen_qty=0;
    v_asac_unfroz_qty=0;
    v_asac_posi_qty_check_diff=0;
    v_asac_cost_amt=0;
    v_asac_realize_pandl=0;
    v_asac_intrst_cost_amt=0;
    v_asac_intrst_pandl=0;
    v_asac_update_times=0;
    v_exgp_posi_id=0;
    v_exch_group_stock_type=0;
    v_exch_group_asset_type=0;
    v_exgp_invest_type=0;
    v_exch_group_begin_qty=0;
    v_exgp_curr_qty=0;
    v_exgp_pre_settle_qty=0;
    v_exgp_frozen_qty=0;
    v_exgp_unfroz_qty=0;
    v_exgp_posi_qty_check_diff=0;
    v_exgp_cost_amt=0;
    v_exgp_realize_pandl=0;
    v_exgp_intrst_cost_amt=0;
    v_exgp_intrst_pandl=0;
    v_exch_group_update_times=0;
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
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_sync_deal_type = lpInBizMsg->GetInt32(LDBIZ_SYNC_DEAL_TYPE_INT);

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

    //调用过程[事务_产品证券_持仓运维_获取资产账户内外持仓差异数据]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.10", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.10]subcall timed out!");
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
    v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans1->GetString(LDBIZ_OUT_ACCO_STR));

    //调用过程[事务_公共_公共接口_判断债券是否兑付]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.31", 0);
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
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req2->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.31]subcall timed out!");
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
    strcpy(v_co_busi_config_str, lpTSCall1Ans2->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));
    v_valid_flag = lpTSCall1Ans2->GetInt32(LDBIZ_VALID_FLAG_INT);

    //调用过程[事务_产品_公共接口_获取资产账户业务控制串]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("prodT.6.31", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.31]subcall timed out!");
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
    strcpy(v_busi_config_str, lpTSCall1Ans3->GetString(LDBIZ_BUSI_CONFIG_STR_STR));

    //有效标志为1,说明债券还未到期,有效标志为0,说明债券已兑付

    // set @处理信息#=" ";
    strcpy(v_deal_info," ");
    //调用过程[事务_产品证券_持仓运维_处理资产账户内外持仓差异记录]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.4", 0);
    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req4->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req4->SetInt32(LDBIZ_SYNC_DEAL_TYPE_INT,v_sync_deal_type);
    lpTSCall1Req4->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req4->SetInt32(LDBIZ_VALID_FLAG_INT,v_valid_flag);
    lpTSCall1Req4->SetString(LDBIZ_BUSI_CONFIG_STR_STR,v_busi_config_str);
    lpTSCall1Req4->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.4]subcall timed out!");
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
    v_pd_no = lpTSCall1Ans4->GetInt32(LDBIZ_PD_NO_INT);
    v_exch_group_no = lpTSCall1Ans4->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_asset_acco_no = lpTSCall1Ans4->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpTSCall1Ans4->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans4->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_stock_code_no = lpTSCall1Ans4->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_occur_qty = lpTSCall1Ans4->GetDouble(LDBIZ_OCCUR_QTY_FLOAT);
    v_asset_sync_flag = lpTSCall1Ans4->GetInt32(LDBIZ_ASSET_SYNC_FLAG_INT);
    v_asac_posi_id = lpTSCall1Ans4->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
    v_asac_stock_type = lpTSCall1Ans4->GetInt32(LDBIZ_ASAC_STOCK_TYPE_INT);
    v_asac_asset_type = lpTSCall1Ans4->GetInt32(LDBIZ_ASAC_ASSET_TYPE_INT);
    v_asac_invest_type = lpTSCall1Ans4->GetInt32(LDBIZ_ASAC_INVEST_TYPE_INT);
    v_asac_begin_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_BEGIN_QTY_FLOAT);
    v_asac_curr_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT);
    v_asac_pre_settle_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_PRE_SETTLE_QTY_FLOAT);
    v_asac_frozen_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
    v_asac_unfroz_qty = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
    v_asac_posi_qty_check_diff = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_POSI_QTY_CHECK_DIFF_FLOAT);
    v_asac_cost_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
    v_asac_realize_pandl = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
    v_asac_intrst_cost_amt = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
    v_asac_intrst_pandl = lpTSCall1Ans4->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
    v_asac_update_times = lpTSCall1Ans4->GetInt32(LDBIZ_ASAC_UPDATE_TIMES_INT);
    v_exgp_posi_id = lpTSCall1Ans4->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
    v_exch_group_stock_type = lpTSCall1Ans4->GetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT);
    v_exch_group_asset_type = lpTSCall1Ans4->GetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT);
    v_exgp_invest_type = lpTSCall1Ans4->GetInt32(LDBIZ_EXGP_INVEST_TYPE_INT);
    v_exch_group_begin_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT);
    v_exgp_curr_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT);
    v_exgp_pre_settle_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT);
    v_exgp_frozen_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
    v_exgp_unfroz_qty = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
    v_exgp_posi_qty_check_diff = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT);
    v_exgp_cost_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
    v_exgp_realize_pandl = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
    v_exgp_intrst_cost_amt = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
    v_exgp_intrst_pandl = lpTSCall1Ans4->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
    v_exch_group_update_times = lpTSCall1Ans4->GetInt32(LDBIZ_EXCH_GROUP_UPDATE_TIMES_INT);


    // if (@变动数量# <> 0 or @资产账户持仓核对差额#<>0 or @同步处理方式# = 2) and (@资产是否同步#=《资产是否同步-同步资金同步持仓》 or @资产是否同步#=《资产是否同步-不同步资金同步持仓》) then
    if ((v_occur_qty != 0 || v_asac_posi_qty_check_diff!=0 || v_sync_deal_type == 2) && (v_asset_sync_flag==1 || v_asset_sync_flag==4))
    {

        // set @更新次数# = @交易组更新次数#;
        v_update_times = v_exch_group_update_times;

        // [主动推送][secu.pdexgpposi][证券主推_产品持仓_交易组持仓主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.80", 0);
        lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT,v_exch_group_stock_type);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT,v_exch_group_asset_type);
        lpPubMsg->SetInt32(LDBIZ_EXGP_INVEST_TYPE_INT,v_exgp_invest_type);
        lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT,v_exch_group_begin_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT,v_exgp_curr_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT,v_exgp_pre_settle_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT,v_exgp_posi_qty_check_diff);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("secu.pdexgpposi", lpPubMsg);


        // set @更新次数# = @资产账户更新次数#;
        v_update_times = v_asac_update_times;

        // [主动推送][secu.pdasacposi][证券主推_产品持仓_资产账户持仓主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.81", 0);
        lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetInt32(LDBIZ_ASAC_STOCK_TYPE_INT,v_asac_stock_type);
        lpPubMsg->SetInt32(LDBIZ_ASAC_ASSET_TYPE_INT,v_asac_asset_type);
        lpPubMsg->SetInt32(LDBIZ_ASAC_INVEST_TYPE_INT,v_asac_invest_type);
        lpPubMsg->SetDouble(LDBIZ_ASAC_BEGIN_QTY_FLOAT,v_asac_begin_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT,v_asac_curr_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_PRE_SETTLE_QTY_FLOAT,v_asac_pre_settle_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_ASAC_POSI_QTY_CHECK_DIFF_FLOAT,v_asac_posi_qty_check_diff);
        lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
        lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("secu.pdasacposi", lpPubMsg);

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
    lpOutBizMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpOutBizMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpOutBizMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
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

//逻辑_产品证券_持仓运维_转入估值外部证券持仓
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
    int v_pass_no;
    char v_out_acco[33];
    int v_exch_no;
    char v_stock_acco[17];
    char v_stock_code[7];
    double v_out_cost_price;
    double v_out_curr_qty;
    double v_out_enable_qty;
    double v_out_frozen_qty;
    double v_out_unfroz_qty;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_co_no;
    int v_pd_no;
    int v_asset_acco_no;
    char v_asac_busi_config_str[65];
    int v_record_count;
    int v_default_exch_group_no;
    int v_exch_group_no;
    char v_target_code[7];
    int v_stock_code_no;
    int v_stock_type;
    int v_asset_type;
    char v_stock_name[65];
    int v_bond_qty_unit_set;
    double v_sh_hk_settle_sell_rate;
    double v_sz_hksettle_sell_rate;
    double v_pboc_rate;
    int v_target_code_no;
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
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    strcpy(v_stock_acco, " ");
    strcpy(v_stock_code, " ");
    v_out_cost_price=0;
    v_out_curr_qty=0;
    v_out_enable_qty=0;
    v_out_frozen_qty=0;
    v_out_unfroz_qty=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_co_no=0;
    v_pd_no=0;
    v_asset_acco_no=0;
    strcpy(v_asac_busi_config_str, " ");
    v_record_count=0;
    v_default_exch_group_no=0;
    v_exch_group_no=0;
    strcpy(v_target_code, " ");
    v_stock_code_no=0;
    v_stock_type=0;
    v_asset_type=0;
    strcpy(v_stock_name, " ");
    v_bond_qty_unit_set=0;
    v_sh_hk_settle_sell_rate=0;
    v_sz_hksettle_sell_rate=0;
    v_pboc_rate=0;
    v_target_code_no=0;
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
    strncpy(v_out_acco, lpInBizMsg->GetString(LDBIZ_OUT_ACCO_STR),32);
    v_out_acco[32] = '\0';
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    strncpy(v_stock_acco, lpInBizMsg->GetString(LDBIZ_STOCK_ACCO_STR),16);
    v_stock_acco[16] = '\0';
    strncpy(v_stock_code, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR),6);
    v_stock_code[6] = '\0';
    v_out_cost_price = lpInBizMsg->GetDouble(LDBIZ_OUT_COST_PRICE_FLOAT);
    v_out_curr_qty = lpInBizMsg->GetDouble(LDBIZ_OUT_CURR_QTY_FLOAT);
    v_out_enable_qty = lpInBizMsg->GetDouble(LDBIZ_OUT_ENABLE_QTY_FLOAT);
    v_out_frozen_qty = lpInBizMsg->GetDouble(LDBIZ_OUT_FROZEN_QTY_FLOAT);
    v_out_unfroz_qty = lpInBizMsg->GetDouble(LDBIZ_OUT_UNFROZ_QTY_FLOAT);

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


    // [检查正常返回][@证券代码#=("SHXGED") or @证券代码#=("SZXGED")]
    if (strcmp(v_stock_code,("SHXGED"))==0 || strcmp(v_stock_code,("SZXGED"))==0)
    {
        strcpy(v_error_code, "0");
        strcpy(v_error_info, " ");
        goto END;
    }

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

    //调用过程[事务_产品_公共接口_检查和获取同步外部账号信息]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.6.8", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.8]subcall timed out!");
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
    v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strcpy(v_asac_busi_config_str, lpTSCall1Ans1->GetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR));
    v_record_count = lpTSCall1Ans1->GetInt32(LDBIZ_RECORD_COUNT_INT);
    v_default_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_DEFAULT_EXCH_GROUP_NO_INT);


    // if @记录个数# = 5 then
    if (v_record_count == 5)
    {
        //调用过程[事务_产品证券_账户_获取港股通代码股东市场编号]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.502", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req2->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
        lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.502]subcall timed out!");
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

    // end if;
    }

    //调用过程[事务_公共_公共接口_检查和获取同步所需公共信息]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.24.57", 0);
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
    lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req3->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req3->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.57]subcall timed out!");
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
    v_exch_group_no = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    strcpy(v_co_busi_config_str, lpTSCall1Ans3->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));
    strcpy(v_target_code, lpTSCall1Ans3->GetString(LDBIZ_TARGET_CODE_STR));
    v_stock_code_no = lpTSCall1Ans3->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_stock_type = lpTSCall1Ans3->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans3->GetInt32(LDBIZ_ASSET_TYPE_INT);
    strcpy(v_stock_name, lpTSCall1Ans3->GetString(LDBIZ_STOCK_NAME_STR));
    v_bond_qty_unit_set = lpTSCall1Ans3->GetInt32(LDBIZ_BOND_QTY_UNIT_SET_INT);
    v_sh_hk_settle_sell_rate = lpTSCall1Ans3->GetDouble(LDBIZ_SH_HK_SETTLE_SELL_RATE_FLOAT);
    v_sz_hksettle_sell_rate = lpTSCall1Ans3->GetDouble(LDBIZ_SZ_HKSETTLE_SELL_RATE_FLOAT);
    v_pboc_rate = lpTSCall1Ans3->GetDouble(LDBIZ_PBOC_RATE_FLOAT);
    v_target_code_no = lpTSCall1Ans3->GetInt32(LDBIZ_TARGET_CODE_NO_INT);


    // if @标的代码# <> " " then
    if (strcmp(v_target_code , " ")!=0)
    {

        // set @证券代码# = @标的代码#;
        strcpy(v_stock_code,v_target_code);
    // end if;
    }


    // if @证券类型#>20 and @证券类型#<50 then
    if (v_stock_type>20 && v_stock_type<50)
    {

        // if (@债券数量单位配置#=《债券数量单位配置-沪市(手)，深市(手)》) or (@债券数量单位配置#=《债券数量单位配置-沪市(手)，深市(张)》 and @市场编号#=《市场编号-上海证券交易所》) or (@债券数量单位配置#=《债券数量单位配置-沪市(张)，深市(手)》 and @市场编号#=《市场编号-深圳证券交易所》) then
        if ((v_bond_qty_unit_set==2) || (v_bond_qty_unit_set==3 && v_exch_no==1) || (v_bond_qty_unit_set==4 && v_exch_no==2))
        {

            // set @外部当前数量#=@外部当前数量#*10;
            v_out_curr_qty=v_out_curr_qty*10;

            // set @外部可用数量#=@外部可用数量#*10;
            v_out_enable_qty=v_out_enable_qty*10;

            // set @外部冻结数量#=@外部冻结数量#*10;
            v_out_frozen_qty=v_out_frozen_qty*10;

            // set @外部解冻数量#=@外部解冻数量#*10;
            v_out_unfroz_qty=v_out_unfroz_qty*10;
        // end if;
        }

    // end if;
    }

    //调用过程[事务_产品证券_持仓运维_转入估值外部证券持仓]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.5", 0);
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
    lpTSCall1Req4->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req4->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req4->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req4->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
    lpTSCall1Req4->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req4->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req4->SetString(LDBIZ_STOCK_NAME_STR,v_stock_name);
    lpTSCall1Req4->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req4->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpTSCall1Req4->SetDouble(LDBIZ_OUT_COST_PRICE_FLOAT,v_out_cost_price);
    lpTSCall1Req4->SetDouble(LDBIZ_OUT_CURR_QTY_FLOAT,v_out_curr_qty);
    lpTSCall1Req4->SetDouble(LDBIZ_OUT_ENABLE_QTY_FLOAT,v_out_enable_qty);
    lpTSCall1Req4->SetDouble(LDBIZ_OUT_FROZEN_QTY_FLOAT,v_out_frozen_qty);
    lpTSCall1Req4->SetDouble(LDBIZ_OUT_UNFROZ_QTY_FLOAT,v_out_unfroz_qty);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.5]subcall timed out!");
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

//逻辑_产品证券_持仓运维_查询估值外部证券持仓
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
    char v_pd_no_str[2049];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
    int v_create_date;
    int v_create_time;
    int v_update_date;
    int v_update_time;
    int v_init_date;
    int v_pd_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    int v_exch_no;
    int v_stock_acco_no;
    char v_stock_acco[17];
    int v_stock_code_no;
    char v_stock_code[7];
    char v_stock_name[65];
    double v_out_cost_price;
    double v_out_curr_qty;
    double v_out_enable_qty;
    double v_out_frozen_qty;
    double v_out_unfroz_qty;
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
    strcpy(v_pd_no_str, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_row_id=0;
    v_create_date=0;
    v_create_time=0;
    v_update_date=0;
    v_update_time=0;
    v_init_date=0;
    v_pd_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    v_stock_acco_no=0;
    strcpy(v_stock_acco, " ");
    v_stock_code_no=0;
    strcpy(v_stock_code, " ");
    strcpy(v_stock_name, " ");
    v_out_cost_price=0;
    v_out_curr_qty=0;
    v_out_enable_qty=0;
    v_out_frozen_qty=0;
    v_out_unfroz_qty=0;
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
    strncpy(v_pd_no_str, lpInBizMsg->GetString(LDBIZ_PD_NO_STR_STR),2048);
    v_pd_no_str[2048] = '\0';

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.19", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.19]subcall timed out!");
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

    //调用过程[事务_产品证券_持仓运维_查询估值外部证券持仓]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.6", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.6]subcall timed out!");
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

//逻辑_产品证券_持仓运维_查询外部证券持仓
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
    char v_pd_no_str[2049];
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
    int v_init_date;
    int v_pd_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    int v_exch_no;
    int v_stock_acco_no;
    char v_stock_acco[17];
    int v_stock_code_no;
    char v_stock_code[7];
    char v_stock_name[65];
    double v_out_cost_price;
    double v_out_curr_qty;
    double v_out_enable_qty;
    double v_out_frozen_qty;
    double v_out_unfroz_qty;
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
    strcpy(v_pd_no_str, " ");
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
    v_init_date=0;
    v_pd_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    v_stock_acco_no=0;
    strcpy(v_stock_acco, " ");
    v_stock_code_no=0;
    strcpy(v_stock_code, " ");
    strcpy(v_stock_name, " ");
    v_out_cost_price=0;
    v_out_curr_qty=0;
    v_out_enable_qty=0;
    v_out_frozen_qty=0;
    v_out_unfroz_qty=0;
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
    strncpy(v_pd_no_str, lpInBizMsg->GetString(LDBIZ_PD_NO_STR_STR),2048);
    v_pd_no_str[2048] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.19", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.19]subcall timed out!");
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

    //调用过程[事务_产品证券_持仓运维_查询外部证券持仓]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.7", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.7]subcall timed out!");
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

//逻辑_产品证券_持仓运维_同步内外差异
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
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_row_id;
    int64 v_curr_row_id;
    int v_target_co_no;
    int v_target_pd_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    int v_exch_no;
    int v_stock_acco_no;
    char v_stock_acco[17];
    int v_stock_code_no;
    char v_stock_code[7];
    char v_stock_name[65];
    double v_out_cost_price;
    double v_out_curr_qty;
    double v_out_enable_qty;
    char v_asac_busi_config_str[65];
    int v_record_count;
    int v_default_exch_group_no;
    int v_exch_group_no;
    char v_target_code[7];
    int v_stock_type;
    int v_asset_type;
    int v_bond_qty_unit_set;
    double v_sh_hk_settle_sell_rate;
    double v_sz_hksettle_sell_rate;
    double v_pboc_rate;
    int v_target_code_no;
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
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_row_id=0;
    v_curr_row_id=0;
    v_target_co_no=0;
    v_target_pd_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    v_exch_no=0;
    v_stock_acco_no=0;
    strcpy(v_stock_acco, " ");
    v_stock_code_no=0;
    strcpy(v_stock_code, " ");
    strcpy(v_stock_name, " ");
    v_out_cost_price=0;
    v_out_curr_qty=0;
    v_out_enable_qty=0;
    strcpy(v_asac_busi_config_str, " ");
    v_record_count=0;
    v_default_exch_group_no=0;
    v_exch_group_no=0;
    strcpy(v_target_code, " ");
    v_stock_type=0;
    v_asset_type=0;
    v_bond_qty_unit_set=0;
    v_sh_hk_settle_sell_rate=0;
    v_sz_hksettle_sell_rate=0;
    v_pboc_rate=0;
    v_target_code_no=0;
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

    //调用过程[事务_公共_公共接口_检查系统状态身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.19", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.19]subcall timed out!");
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


    // set @记录序号#=0;
    v_row_id=0;
    // loop_label:loop
    while (true)
    {

        //调用过程[事务_产品证券_持仓运维_获取外部数据]
        //组织事务请求
        if(lpTSCall1Ans1)
        {
          lpTSCall1Ans1->FreeMsg();
          lpTSCall1Ans1=NULL;
        }
        lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.9", 0);
        lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpTSCall1Req1->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
        if(!lpTSCall1Ans1)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.9]subcall timed out!");
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
        v_curr_row_id = lpTSCall1Ans1->GetInt64(LDBIZ_CURR_ROW_ID_INT64);
        v_init_date = lpTSCall1Ans1->GetInt32(LDBIZ_INIT_DATE_INT);
        v_target_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_TARGET_CO_NO_INT);
        v_target_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_TARGET_PD_NO_INT);
        v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans1->GetInt32(LDBIZ_PASS_NO_INT);
        strcpy(v_out_acco, lpTSCall1Ans1->GetString(LDBIZ_OUT_ACCO_STR));
        v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
        v_stock_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
        strcpy(v_stock_acco, lpTSCall1Ans1->GetString(LDBIZ_STOCK_ACCO_STR));
        v_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        strcpy(v_stock_code, lpTSCall1Ans1->GetString(LDBIZ_STOCK_CODE_STR));
        strcpy(v_stock_name, lpTSCall1Ans1->GetString(LDBIZ_STOCK_NAME_STR));
        v_out_cost_price = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_COST_PRICE_FLOAT);
        v_out_curr_qty = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_CURR_QTY_FLOAT);
        v_out_enable_qty = lpTSCall1Ans1->GetDouble(LDBIZ_OUT_ENABLE_QTY_FLOAT);


        // set @机构编号#=@目标机构编号#;
        v_co_no=v_target_co_no;

        // set @产品编号#=@目标产品编号#;
        v_pd_no=v_target_pd_no;

        // set @记录序号#=@当前记录序号#;
        v_row_id=v_curr_row_id;

        // if @记录序号#=0 then
        if (v_row_id==0)
        {
            // leave loop_label;
            break;

        // end if;
        }

        //调用过程[事务_产品_公共接口_检查和获取同步外部账号信息]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("prodT.6.8", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
        lpTSCall1Req2->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
        lpTSCall1Req2->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.8]subcall timed out!");
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
        v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans2->GetInt32(LDBIZ_PD_NO_INT);
        v_asset_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        strcpy(v_asac_busi_config_str, lpTSCall1Ans2->GetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR));
        v_record_count = lpTSCall1Ans2->GetInt32(LDBIZ_RECORD_COUNT_INT);
        v_default_exch_group_no = lpTSCall1Ans2->GetInt32(LDBIZ_DEFAULT_EXCH_GROUP_NO_INT);


        // if @记录个数# = 5 then
        if (v_record_count == 5)
        {
            //调用过程[事务_产品证券_账户_获取港股通代码股东市场编号]
            //组织事务请求
            if(lpTSCall1Ans3)
            {
              lpTSCall1Ans3->FreeMsg();
              lpTSCall1Ans3=NULL;
            }
            lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdsecuT.1.502", 0);
            lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
            lpTSCall1Req3->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
            lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
            if(!lpTSCall1Ans3)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.1.502]subcall timed out!");
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

        // end if;
        }

        //调用过程[事务_公共_公共接口_检查和获取同步所需公共信息]
        //组织事务请求
        if(lpTSCall1Ans4)
        {
          lpTSCall1Ans4->FreeMsg();
          lpTSCall1Ans4=NULL;
        }
        lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pubT.24.57", 0);
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
        lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req4->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
        lpTSCall1Req4->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
        if(!lpTSCall1Ans4)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.57]subcall timed out!");
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
        v_exch_group_no = lpTSCall1Ans4->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        strcpy(v_co_busi_config_str, lpTSCall1Ans4->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));
        strcpy(v_target_code, lpTSCall1Ans4->GetString(LDBIZ_TARGET_CODE_STR));
        v_stock_code_no = lpTSCall1Ans4->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        v_stock_type = lpTSCall1Ans4->GetInt32(LDBIZ_STOCK_TYPE_INT);
        v_asset_type = lpTSCall1Ans4->GetInt32(LDBIZ_ASSET_TYPE_INT);
        strcpy(v_stock_name, lpTSCall1Ans4->GetString(LDBIZ_STOCK_NAME_STR));
        v_bond_qty_unit_set = lpTSCall1Ans4->GetInt32(LDBIZ_BOND_QTY_UNIT_SET_INT);
        v_sh_hk_settle_sell_rate = lpTSCall1Ans4->GetDouble(LDBIZ_SH_HK_SETTLE_SELL_RATE_FLOAT);
        v_sz_hksettle_sell_rate = lpTSCall1Ans4->GetDouble(LDBIZ_SZ_HKSETTLE_SELL_RATE_FLOAT);
        v_pboc_rate = lpTSCall1Ans4->GetDouble(LDBIZ_PBOC_RATE_FLOAT);
        v_target_code_no = lpTSCall1Ans4->GetInt32(LDBIZ_TARGET_CODE_NO_INT);

        //默认交易组从产品库获取set @默认交易组编号// = @交易组编号//;

        // if @标的代码# <> " " then
        if (strcmp(v_target_code , " ")!=0)
        {

            // set @证券代码# = @标的代码#;
            strcpy(v_stock_code,v_target_code);
        // end if;
        }


        // if @标的代码# <> " "  and  (@证券类型# = 《证券类型-债券回购》 or  @证券类型# = 《证券类型-回购标准券》)  then
        if (strcmp(v_target_code , " ")!=0  &&  (v_stock_type == 26 ||  v_stock_type == 27) )
        {

           // if @标的代码# = "888880" then
           if (strcmp(v_target_code , "888880")==0)
           {

              // set @证券名称# = "新标准券";
              strcpy(v_stock_name,"新标准券");

           }
           // elseif @标的代码# =  "131990"  then
           else if (strcmp(v_target_code ,  "131990" )==0)
           {

              // set @证券名称# = "标准券";
              strcpy(v_stock_name,"标准券");
           // end if;
           }


           // set @证券类型# = 《证券类型-回购标准券》;
           v_stock_type = 27;

           // set @资产类型# = 《资产类型-回购资产》;
           v_asset_type = 43;

           // set @证券代码编号# = @标的代码编号#;
           v_stock_code_no = v_target_code_no;
        // end if;
        }


        // if @证券类型#>20 and @证券类型#<50 then
        if (v_stock_type>20 && v_stock_type<50)
        {

            // if (@债券数量单位配置#=《债券数量单位配置-沪市(手)，深市(手)》) or (@债券数量单位配置#=《债券数量单位配置-沪市(手)，深市(张)》 and @市场编号#=《市场编号-上海证券交易所》) or (@债券数量单位配置#=《债券数量单位配置-沪市(张)，深市(手)》 and @市场编号#=《市场编号-深圳证券交易所》) then
            if ((v_bond_qty_unit_set==2) || (v_bond_qty_unit_set==3 && v_exch_no==1) || (v_bond_qty_unit_set==4 && v_exch_no==2))
            {

                // set @外部当前数量#=@外部当前数量#*10;
                v_out_curr_qty=v_out_curr_qty*10;

                // set @外部可用数量#=@外部可用数量#*10;
                v_out_enable_qty=v_out_enable_qty*10;
            // end if;
            }

        // end if;
        }

        //调用过程[事务_产品证券_持仓运维_同步内外差异]
        //组织事务请求
        if(lpTSCall1Ans5)
        {
          lpTSCall1Ans5->FreeMsg();
          lpTSCall1Ans5=NULL;
        }
        lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.8", 0);
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
        lpTSCall1Req5->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req5->SetInt32(LDBIZ_DEFAULT_EXCH_GROUP_NO_INT,v_default_exch_group_no);
        lpTSCall1Req5->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
        lpTSCall1Req5->SetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR,v_asac_busi_config_str);
        lpTSCall1Req5->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
        lpTSCall1Req5->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
        lpTSCall1Req5->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req5->SetString(LDBIZ_STOCK_ACCO_STR,v_stock_acco);
        lpTSCall1Req5->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpTSCall1Req5->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpTSCall1Req5->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
        lpTSCall1Req5->SetString(LDBIZ_STOCK_NAME_STR,v_stock_name);
        lpTSCall1Req5->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req5->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
        lpTSCall1Req5->SetDouble(LDBIZ_OUT_COST_PRICE_FLOAT,v_out_cost_price);
        lpTSCall1Req5->SetDouble(LDBIZ_OUT_CURR_QTY_FLOAT,v_out_curr_qty);
        lpTSCall1Req5->SetDouble(LDBIZ_OUT_ENABLE_QTY_FLOAT,v_out_enable_qty);
        glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
        if(!lpTSCall1Ans5)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.8]subcall timed out!");
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

//逻辑_产品证券_持仓运维_同步债券质押差异数据
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

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.19", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.19]subcall timed out!");
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

        //调用过程[事务_产品证券_持仓运维_同步债券质押差异数据]
        //组织事务请求
        if(lpTSCall1Ans1)
        {
          lpTSCall1Ans1->FreeMsg();
          lpTSCall1Ans1=NULL;
        }
        lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.16", 0);
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
        glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 15000);
        if(!lpTSCall1Ans1)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.16]subcall timed out!");
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

//逻辑_产品证券_持仓运维_清除外部持仓记录差异记录
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

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;

    //调用过程[事务_公共_公共接口_检查系统状态身份]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.19", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.19]subcall timed out!");
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

    //调用过程[事务_产品证券_持仓运维_清除外部持仓记录差异记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.17", 0);
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
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.17]subcall timed out!");
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

//逻辑_产品证券_持仓运维_核对内部债券质押记录
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
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_query_row_id;
    int v_tmp_asset_acco_no;
    int64 v_row_id;
    int v_co_no;
    int v_pd_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    double v_curr_qty;
    double v_avail_qty;
    int v_pass_no;
    char v_out_acco[33];
    char v_asac_busi_config_str[65];
    char v_last_error_code[33];
    int v_exch_group_no;
    int v_default_exch_group_no;
    char v_stock_code[7];
    char v_stock_name[65];
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
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_query_row_id=0;
    v_tmp_asset_acco_no=0;
    v_row_id=0;
    v_co_no=0;
    v_pd_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_curr_qty=0;
    v_avail_qty=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_asac_busi_config_str, " ");
    strcpy(v_last_error_code, "0");
    v_exch_group_no=0;
    v_default_exch_group_no=0;
    strcpy(v_stock_code, " ");
    strcpy(v_stock_name, " ");
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


    // set @查询记录序号# = 0;
    v_query_row_id = 0;

    // set @临时_资产账户编号# = 0;
    v_tmp_asset_acco_no = 0;
    // loop_label:loop
    while (true)
    {

        //调用过程[事务_产品证券_持仓运维_获取内部债券质押记录]
        //组织事务请求
        if(lpTSCall1Ans1)
        {
          lpTSCall1Ans1->FreeMsg();
          lpTSCall1Ans1=NULL;
        }
        lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.11", 0);
        lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req1->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req1->SetInt64(LDBIZ_QUERY_ROW_ID_INT64,v_query_row_id);
        glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
        if(!lpTSCall1Ans1)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.11]subcall timed out!");
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
        v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
        v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
        v_stock_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
        v_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        v_curr_qty = lpTSCall1Ans1->GetDouble(LDBIZ_CURR_QTY_FLOAT);
        v_avail_qty = lpTSCall1Ans1->GetDouble(LDBIZ_AVAIL_QTY_FLOAT);


        // if @错误编码# <> "0" then
        if (strcmp(v_error_code , "0")!=0)
        {

            // set @错误编码# = "0";
            strcpy(v_error_code,"0");

            // set @错误信息# = " ";
            strcpy(v_error_info," ");
            // leave loop_label;
            break;

        }
        // else
        else
        {


            // set @查询记录序号# = @记录序号#;
            v_query_row_id = v_row_id;

            // if @资产账户编号# <> @临时_资产账户编号# then
            if (v_asset_acco_no != v_tmp_asset_acco_no)
            {

                // set @临时_资产账户编号# = @资产账户编号#;
                v_tmp_asset_acco_no = v_asset_acco_no;
                //调用过程[事务_产品_公共接口_检查和获取同步资产账户信息]
                //组织事务请求
                if(lpTSCall1Ans2)
                {
                  lpTSCall1Ans2->FreeMsg();
                  lpTSCall1Ans2=NULL;
                }
                lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("prodT.6.9", 0);
                lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
                if(!lpTSCall1Ans2)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.9]subcall timed out!");
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
                v_pass_no = lpTSCall1Ans2->GetInt32(LDBIZ_PASS_NO_INT);
                strcpy(v_out_acco, lpTSCall1Ans2->GetString(LDBIZ_OUT_ACCO_STR));
                strcpy(v_asac_busi_config_str, lpTSCall1Ans2->GetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR));


                // if @错误编码# <> "0" then
                if (strcmp(v_error_code , "0")!=0)
                {

                    // set @前错误编码# = @错误编码#;
                    strcpy(v_last_error_code,v_error_code);

                    // set @错误编码# = "0";
                    strcpy(v_error_code,"0");

                    // set @错误信息# = " ";
                    strcpy(v_error_info," ");
                }
                // else
                else
                {


                    // set @前错误编码# = "0";
                    strcpy(v_last_error_code,"0");
                    //调用过程[事务_公共_公共接口_检查和获取同步内部核对所需公共信息]
                    //组织事务请求
                    if(lpTSCall1Ans3)
                    {
                      lpTSCall1Ans3->FreeMsg();
                      lpTSCall1Ans3=NULL;
                    }
                    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.24.58", 0);
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
                    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
                    if(!lpTSCall1Ans3)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.58]subcall timed out!");
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
                    v_exch_group_no = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
                    strcpy(v_co_busi_config_str, lpTSCall1Ans3->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));


                    // if @错误编码# <> "0" then
                    if (strcmp(v_error_code , "0")!=0)
                    {

                        // set @前错误编码# = @错误编码#;
                        strcpy(v_last_error_code,v_error_code);

                        // set @错误编码# = "0";
                        strcpy(v_error_code,"0");

                        // set @错误信息# = " ";
                        strcpy(v_error_info," ");
                    // end if;
                    }

                    //默认交易组从产品库获取 set @默认交易组编号// = @交易组编号//;
                    //调用过程[事务_产品_公共接口_获取资产账户默认交易组编号]
                    //组织事务请求
                    if(lpTSCall1Ans4)
                    {
                      lpTSCall1Ans4->FreeMsg();
                      lpTSCall1Ans4=NULL;
                    }
                    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("prodT.6.47", 0);
                    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
                    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                    lpTSCall1Req4->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
                    if(!lpTSCall1Ans4)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.47]subcall timed out!");
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
                    v_default_exch_group_no = lpTSCall1Ans4->GetInt32(LDBIZ_DEFAULT_EXCH_GROUP_NO_INT);

                // end if;
                }

            // end if;
            }


            // if @前错误编码# = "0" then
            if (strcmp(v_last_error_code , "0")==0)
            {
                //调用过程[事务_公共_公共接口_检查和获取同步内部核对所需证券代码编号信息]
                //组织事务请求
                if(lpTSCall1Ans5)
                {
                  lpTSCall1Ans5->FreeMsg();
                  lpTSCall1Ans5=NULL;
                }
                lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pubT.24.59", 0);
                lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req5->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
                if(!lpTSCall1Ans5)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.59]subcall timed out!");
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
                strcpy(v_stock_code, lpTSCall1Ans5->GetString(LDBIZ_STOCK_CODE_STR));
                strcpy(v_stock_name, lpTSCall1Ans5->GetString(LDBIZ_STOCK_NAME_STR));
                v_stock_type = lpTSCall1Ans5->GetInt32(LDBIZ_STOCK_TYPE_INT);
                v_asset_type = lpTSCall1Ans5->GetInt32(LDBIZ_ASSET_TYPE_INT);


                // if @错误编码# <> "0" then
                if (strcmp(v_error_code , "0")!=0)
                {

                    // set @错误编码# = "0";
                    strcpy(v_error_code,"0");

                    // set @错误信息# = " ";
                    strcpy(v_error_info," ");
                }
                // else
                else
                {

                    //调用过程[事务_产品证券_持仓运维_转入内部债券质押核对记录]
                    //组织事务请求
                    if(lpTSCall1Ans6)
                    {
                      lpTSCall1Ans6->FreeMsg();
                      lpTSCall1Ans6=NULL;
                    }
                    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.12", 0);
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
                    lpTSCall1Req6->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                    lpTSCall1Req6->SetInt32(LDBIZ_DEFAULT_EXCH_GROUP_NO_INT,v_default_exch_group_no);
                    lpTSCall1Req6->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
                    lpTSCall1Req6->SetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR,v_asac_busi_config_str);
                    lpTSCall1Req6->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
                    lpTSCall1Req6->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
                    lpTSCall1Req6->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                    lpTSCall1Req6->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                    lpTSCall1Req6->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                    lpTSCall1Req6->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
                    lpTSCall1Req6->SetString(LDBIZ_STOCK_NAME_STR,v_stock_name);
                    lpTSCall1Req6->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
                    lpTSCall1Req6->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
                    lpTSCall1Req6->SetDouble(LDBIZ_CURR_QTY_FLOAT,v_curr_qty);
                    lpTSCall1Req6->SetDouble(LDBIZ_AVAIL_QTY_FLOAT,v_avail_qty);
                    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
                    if(!lpTSCall1Ans6)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.12]subcall timed out!");
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


                    // if @错误编码# <> "0" then
                    if (strcmp(v_error_code , "0")!=0)
                    {

                        // set @错误编码# = "0";
                        strcpy(v_error_code,"0");

                        // set @错误信息# = " ";
                        strcpy(v_error_info," ");
                    // end if;
                    }

                // end if;
                }

            // end if;
            }

        // end if;
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

//逻辑_产品证券_持仓运维_查询资产账户内外债券质押差异记录
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
    char v_co_no_str[2049];
    int v_pd_no;
    int v_asset_acco_no;
    int v_pass_no;
    char v_out_acco[33];
    char v_deal_flag_query_str[2049];
    int v_filter_diff_cond;
    int v_asset_sync_flag;
    int64 v_row_id;
    int v_row_count;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    int v_co_no;
    int v_exch_group_no;
    int v_exch_no;
    int v_stock_acco_no;
    char v_stock_acco[17];
    int v_stock_code_no;
    char v_stock_code[7];
    char v_stock_name[65];
    double v_acco_curr_qty;
    double v_acco_avail_qty;
    double v_out_begin_qty;
    double v_out_curr_qty;
    double v_out_enable_qty;
    double v_acco_avail_qty_diff;
    int v_deal_flag;
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
    strcpy(v_co_no_str, " ");
    v_pd_no=0;
    v_asset_acco_no=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_deal_flag_query_str, " ");
    v_filter_diff_cond=0;
    v_asset_sync_flag=0;
    v_row_id=0;
    v_row_count=-1;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    v_co_no=0;
    v_exch_group_no=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    strcpy(v_stock_acco, " ");
    v_stock_code_no=0;
    strcpy(v_stock_code, " ");
    strcpy(v_stock_name, " ");
    v_acco_curr_qty=0;
    v_acco_avail_qty=0;
    v_out_begin_qty=0;
    v_out_curr_qty=0;
    v_out_enable_qty=0;
    v_acco_avail_qty_diff=0;
    v_deal_flag=0;
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
    strncpy(v_co_no_str, lpInBizMsg->GetString(LDBIZ_CO_NO_STR_STR),2048);
    v_co_no_str[2048] = '\0';
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    strncpy(v_out_acco, lpInBizMsg->GetString(LDBIZ_OUT_ACCO_STR),32);
    v_out_acco[32] = '\0';
    strncpy(v_deal_flag_query_str, lpInBizMsg->GetString(LDBIZ_DEAL_FLAG_QUERY_STR_STR),2048);
    v_deal_flag_query_str[2048] = '\0';
    v_filter_diff_cond = lpInBizMsg->GetInt32(LDBIZ_FILTER_DIFF_COND_INT);
    v_asset_sync_flag = lpInBizMsg->GetInt32(LDBIZ_ASSET_SYNC_FLAG_INT);
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

    //调用过程[事务_产品证券_持仓运维_查询资产账户内外债券质押差异记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.13", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetString(LDBIZ_CO_NO_STR_STR,v_co_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req1->SetString(LDBIZ_DEAL_FLAG_QUERY_STR_STR,v_deal_flag_query_str);
    lpTSCall1Req1->SetInt32(LDBIZ_FILTER_DIFF_COND_INT,v_filter_diff_cond);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_SYNC_FLAG_INT,v_asset_sync_flag);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.13]subcall timed out!");
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

//逻辑_产品证券_持仓运维_处理资产账户内外债券质押差异记录
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
    int64 v_row_id;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_co_no;
    int v_asset_acco_no;
    char v_out_acco[33];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_stock_code_no;
    int v_sh_standard_stock_code_no;
    int v_sz_standard_stock_code_no;
    double v_impawn_ratio;
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
    v_row_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_co_no=0;
    v_asset_acco_no=0;
    strcpy(v_out_acco, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_stock_code_no=0;
    v_sh_standard_stock_code_no=0;
    v_sz_standard_stock_code_no=0;
    v_impawn_ratio=0;
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

    //调用过程[事务_产品证券_持仓运维_获取资产账户内外债券质押差异记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.15", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.15]subcall timed out!");
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
    v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);
    v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strcpy(v_out_acco, lpTSCall1Ans1->GetString(LDBIZ_OUT_ACCO_STR));

    //调用过程[事务_公共_公共接口_检查系统状态权限身份获取标准券代码编号]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.40", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req2->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.40]subcall timed out!");
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
    strcpy(v_co_busi_config_str, lpTSCall1Ans2->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));
    v_sh_standard_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_SH_STANDARD_STOCK_CODE_NO_INT);
    v_sz_standard_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_SZ_STANDARD_STOCK_CODE_NO_INT);
    v_impawn_ratio = lpTSCall1Ans2->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);

    //调用过程[事务_产品证券_持仓运维_处理资产账户内外债券质押差异记录]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.14", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req3->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req3->SetInt32(LDBIZ_SH_STANDARD_STOCK_CODE_NO_INT,v_sh_standard_stock_code_no);
    lpTSCall1Req3->SetInt32(LDBIZ_SZ_STANDARD_STOCK_CODE_NO_INT,v_sz_standard_stock_code_no);
    lpTSCall1Req3->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.14]subcall timed out!");
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
    lpOutBizMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpOutBizMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpOutBizMsg->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
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

//逻辑_产品证券_持仓运维_重算债券质押标准券数量
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
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int64 v_query_row_id;
    int64 v_row_id;
    int v_exch_no;
    int v_stock_code_no;
    char v_target_code[7];
    int v_target_code_no;
    double v_impawn_ratio;
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
    v_query_row_id=0;
    v_row_id=0;
    v_exch_no=0;
    v_stock_code_no=0;
    strcpy(v_target_code, " ");
    v_target_code_no=0;
    v_impawn_ratio=0;
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


    // set @查询记录序号# = 0;
    v_query_row_id = 0;
    // loop_label:loop
    while (true)
    {

      //调用过程[事务_产品证券_持仓运维_获取债券质押信息]
      //组织事务请求
      if(lpTSCall1Ans1)
      {
        lpTSCall1Ans1->FreeMsg();
        lpTSCall1Ans1=NULL;
      }
      lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.31", 0);
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
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.31]subcall timed out!");
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
      v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
      v_stock_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_STOCK_CODE_NO_INT);


      // if @错误编码# <> "0" then
      if (strcmp(v_error_code , "0")!=0)
      {

         // set @错误编码# = "0";
         strcpy(v_error_code,"0");

         // set @错误信息# = " ";
         strcpy(v_error_info," ");
         // leave loop_label;
         break;

      }
      // else
      else
      {


         // set @查询记录序号#=@记录序号#;
         v_query_row_id=v_row_id;
         //调用过程[事务_公共_公共接口_获取编号债券质押比例]
         //组织事务请求
         if(lpTSCall1Ans2)
         {
           lpTSCall1Ans2->FreeMsg();
           lpTSCall1Ans2=NULL;
         }
         lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.104", 0);
         lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
         lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
         lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
         lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
         lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
         lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
         lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
         lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
         lpTSCall1Req2->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
         glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
         if(!lpTSCall1Ans2)  //  超时错误
         {
             lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
             lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.104]subcall timed out!");
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
         strcpy(v_target_code, lpTSCall1Ans2->GetString(LDBIZ_TARGET_CODE_STR));
         v_target_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_TARGET_CODE_NO_INT);
         v_impawn_ratio = lpTSCall1Ans2->GetDouble(LDBIZ_IMPAWN_RATIO_FLOAT);

         //调用过程[事务_产品证券_持仓运维_更新债券质押比例]
         //组织事务请求
         if(lpTSCall1Ans3)
         {
           lpTSCall1Ans3->FreeMsg();
           lpTSCall1Ans3=NULL;
         }
         lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.32", 0);
         lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
         lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
         lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
         lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
         lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
         lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
         lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
         lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
         lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
         lpTSCall1Req3->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
         lpTSCall1Req3->SetInt32(LDBIZ_TARGET_CODE_NO_INT,v_target_code_no);
         lpTSCall1Req3->SetDouble(LDBIZ_IMPAWN_RATIO_FLOAT,v_impawn_ratio);
         glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
         if(!lpTSCall1Ans3)  //  超时错误
         {
             lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
             lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.32]subcall timed out!");
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

      // end if;
      }

    // end loop;
    }

    //调用过程[事务_产品证券_持仓运维_重算债券质押标准券数量]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.33", 0);
    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.33]subcall timed out!");
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

//逻辑_产品证券_持仓运维_查询资产账户持仓
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
    int v_pd_no;
    int v_asset_acco_no;
    char v_exch_no_str[2049];
    int v_stock_acco_no;
    char v_stock_code_no_str[4097];
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
    int v_init_date;
    int v_exch_no;
    int v_stock_code_no;
    int v_invest_type;
    double v_begin_qty;
    double v_curr_qty;
    double v_frozen_qty;
    double v_unfroz_qty;
    double v_cost_amt;
    double v_realize_pandl;
    double v_intrst_cost_amt;
    double v_intrst_pandl;
    double v_pre_settle_qty;
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
    strcpy(v_exch_no_str, " ");
    v_stock_acco_no=0;
    strcpy(v_stock_code_no_str, " ");
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
    v_init_date=0;
    v_exch_no=0;
    v_stock_code_no=0;
    v_invest_type=0;
    v_begin_qty=0;
    v_curr_qty=0;
    v_frozen_qty=0;
    v_unfroz_qty=0;
    v_cost_amt=0;
    v_realize_pandl=0;
    v_intrst_cost_amt=0;
    v_intrst_pandl=0;
    v_pre_settle_qty=0;
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
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strncpy(v_stock_code_no_str, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_NO_STR_STR),4096);
    v_stock_code_no_str[4096] = '\0';
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

    //调用过程[事务_产品证券_持仓运维_查询资产账户持仓]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.71", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_NO_STR_STR,v_stock_code_no_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.71]subcall timed out!");
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

//逻辑_产品证券_持仓运维_查询历史资产账户持仓
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
    int v_begin_date;
    int v_end_date;
    int v_co_no;
    int v_pd_no;
    int v_asset_acco_no;
    char v_exch_no_str[2049];
    int v_stock_acco_no;
    char v_stock_code_no_str[4097];
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
    int v_init_date;
    int v_exch_no;
    int v_stock_code_no;
    int v_invest_type;
    double v_begin_qty;
    double v_curr_qty;
    double v_frozen_qty;
    double v_unfroz_qty;
    double v_cost_amt;
    double v_realize_pandl;
    double v_intrst_cost_amt;
    double v_intrst_pandl;
    int v_record_count;
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
    v_asset_acco_no=0;
    strcpy(v_exch_no_str, " ");
    v_stock_acco_no=0;
    strcpy(v_stock_code_no_str, " ");
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
    v_init_date=0;
    v_exch_no=0;
    v_stock_code_no=0;
    v_invest_type=0;
    v_begin_qty=0;
    v_curr_qty=0;
    v_frozen_qty=0;
    v_unfroz_qty=0;
    v_cost_amt=0;
    v_realize_pandl=0;
    v_intrst_cost_amt=0;
    v_intrst_pandl=0;
    v_record_count=0;
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
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strncpy(v_stock_code_no_str, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_NO_STR_STR),4096);
    v_stock_code_no_str[4096] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;


    // [检查报错返回][@开始日期#>@结束日期#][254][@开始日期#,@结束日期#]
    if (v_begin_date>v_end_date)
    {
        strcpy(v_error_code, "pdsecuL.9.72.254");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","开始日期=",v_begin_date,"结束日期=",v_end_date);
        iRet = -1;
        goto END;
    }


    // [获取日期差值][@开始日期#][@结束日期#][@记录个数#]
    v_record_count = DiffDays(v_begin_date,v_end_date);


    // [检查报错返回][@记录个数#>30][255][@开始日期#,@结束日期#]
    if (v_record_count>30)
    {
        strcpy(v_error_code, "pdsecuL.9.72.255");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","开始日期=",v_begin_date,"结束日期=",v_end_date);
        iRet = -1;
        goto END;
    }

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

    //调用过程[事务_产品证券_持仓运维_查询历史资产账户持仓]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.72", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_NO_STR_STR,v_stock_code_no_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.72]subcall timed out!");
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

//逻辑_产品证券_持仓运维_查询资产账户持仓流水
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
    char v_co_no_str[2049];
    char v_pd_no_str[2049];
    char v_asset_acco_no_str[2049];
    char v_busi_flag_str[2049];
    char v_exch_no_str[2049];
    int v_stock_acco_no;
    char v_stock_code_no_str[4097];
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
    int v_oper_menu_no;
    char v_oper_func_code[17];
    int v_init_date;
    int v_co_no;
    int v_pd_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_code_no;
    int v_busi_flag;
    double v_occur_qty;
    double v_occur_end_qty;
    char v_jour_occur_field[2049];
    char v_jour_after_occur_info[2049];
    char v_oper_remark_info[256];
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
    strcpy(v_co_no_str, " ");
    strcpy(v_pd_no_str, " ");
    strcpy(v_asset_acco_no_str, " ");
    strcpy(v_busi_flag_str, " ");
    strcpy(v_exch_no_str, " ");
    v_stock_acco_no=0;
    strcpy(v_stock_code_no_str, " ");
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
    v_oper_menu_no=0;
    strcpy(v_oper_func_code, " ");
    v_init_date=0;
    v_co_no=0;
    v_pd_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_code_no=0;
    v_busi_flag=0;
    v_occur_qty=0;
    v_occur_end_qty=0;
    strcpy(v_jour_occur_field, " ");
    strcpy(v_jour_after_occur_info, " ");
    strcpy(v_oper_remark_info, " ");
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
    strncpy(v_co_no_str, lpInBizMsg->GetString(LDBIZ_CO_NO_STR_STR),2048);
    v_co_no_str[2048] = '\0';
    strncpy(v_pd_no_str, lpInBizMsg->GetString(LDBIZ_PD_NO_STR_STR),2048);
    v_pd_no_str[2048] = '\0';
    strncpy(v_asset_acco_no_str, lpInBizMsg->GetString(LDBIZ_ASSET_ACCO_NO_STR_STR),2048);
    v_asset_acco_no_str[2048] = '\0';
    strncpy(v_busi_flag_str, lpInBizMsg->GetString(LDBIZ_BUSI_FLAG_STR_STR),2048);
    v_busi_flag_str[2048] = '\0';
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strncpy(v_stock_code_no_str, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_NO_STR_STR),4096);
    v_stock_code_no_str[4096] = '\0';
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

    //调用过程[事务_产品证券_持仓运维_查询资产账户持仓流水]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.81", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req1->SetString(LDBIZ_CO_NO_STR_STR,v_co_no_str);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_ACCO_NO_STR_STR,v_asset_acco_no_str);
    lpTSCall1Req1->SetString(LDBIZ_BUSI_FLAG_STR_STR,v_busi_flag_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_NO_STR_STR,v_stock_code_no_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.81]subcall timed out!");
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

//逻辑_产品证券_持仓运维_查询历史资产账户持仓流水
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
    int v_begin_date;
    int v_end_date;
    char v_co_no_str[2049];
    char v_pd_no_str[2049];
    char v_asset_acco_no_str[2049];
    char v_busi_flag_str[2049];
    char v_exch_no_str[2049];
    int v_stock_acco_no;
    char v_stock_code_no_str[4097];
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
    int v_oper_menu_no;
    char v_oper_func_code[17];
    int v_init_date;
    int v_co_no;
    int v_pd_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_code_no;
    int v_busi_flag;
    double v_occur_qty;
    double v_occur_end_qty;
    char v_jour_occur_field[2049];
    char v_jour_after_occur_info[2049];
    char v_oper_remark_info[256];
    int v_record_count;
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
    strcpy(v_co_no_str, " ");
    strcpy(v_pd_no_str, " ");
    strcpy(v_asset_acco_no_str, " ");
    strcpy(v_busi_flag_str, " ");
    strcpy(v_exch_no_str, " ");
    v_stock_acco_no=0;
    strcpy(v_stock_code_no_str, " ");
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
    v_oper_menu_no=0;
    strcpy(v_oper_func_code, " ");
    v_init_date=0;
    v_co_no=0;
    v_pd_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_code_no=0;
    v_busi_flag=0;
    v_occur_qty=0;
    v_occur_end_qty=0;
    strcpy(v_jour_occur_field, " ");
    strcpy(v_jour_after_occur_info, " ");
    strcpy(v_oper_remark_info, " ");
    v_record_count=0;
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
    strncpy(v_co_no_str, lpInBizMsg->GetString(LDBIZ_CO_NO_STR_STR),2048);
    v_co_no_str[2048] = '\0';
    strncpy(v_pd_no_str, lpInBizMsg->GetString(LDBIZ_PD_NO_STR_STR),2048);
    v_pd_no_str[2048] = '\0';
    strncpy(v_asset_acco_no_str, lpInBizMsg->GetString(LDBIZ_ASSET_ACCO_NO_STR_STR),2048);
    v_asset_acco_no_str[2048] = '\0';
    strncpy(v_busi_flag_str, lpInBizMsg->GetString(LDBIZ_BUSI_FLAG_STR_STR),2048);
    v_busi_flag_str[2048] = '\0';
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strncpy(v_stock_code_no_str, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_NO_STR_STR),4096);
    v_stock_code_no_str[4096] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;


    // [检查报错返回][@开始日期#>@结束日期#][254][@开始日期#,@结束日期#]
    if (v_begin_date>v_end_date)
    {
        strcpy(v_error_code, "pdsecuL.9.82.254");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","开始日期=",v_begin_date,"结束日期=",v_end_date);
        iRet = -1;
        goto END;
    }


    // [获取日期差值][@开始日期#][@结束日期#][@记录个数#]
    v_record_count = DiffDays(v_begin_date,v_end_date);


    // [检查报错返回][@记录个数#>30][255][@开始日期#,@结束日期#]
    if (v_record_count>30)
    {
        strcpy(v_error_code, "pdsecuL.9.82.255");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","开始日期=",v_begin_date,"结束日期=",v_end_date);
        iRet = -1;
        goto END;
    }

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

    //调用过程[事务_产品证券_持仓运维_查询历史资产账户持仓流水]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.82", 0);
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
    lpTSCall1Req1->SetString(LDBIZ_CO_NO_STR_STR,v_co_no_str);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_ACCO_NO_STR_STR,v_asset_acco_no_str);
    lpTSCall1Req1->SetString(LDBIZ_BUSI_FLAG_STR_STR,v_busi_flag_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_NO_STR_STR,v_stock_code_no_str);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.82]subcall timed out!");
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

//逻辑_产品证券_持仓运维_自动处理内外持仓差异记录
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
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_co_no_str[2049];
    char v_pd_no_str[2049];
    int v_asset_acco_no;
    char v_stock_code_str[4097];
    char v_exch_no_str[2049];
    int v_is_contain;
    int v_pass_no;
    char v_out_acco[33];
    char v_deal_flag_query_str[2049];
    int v_filter_diff_cond;
    int v_asset_sync_flag;
    int64 v_row_id;
    int v_row_count;
    int v_sync_req_type;
    int v_auto_sync_type;
    int v_co_no;
    char v_sys_name[65];
    char v_sys_status[3];
    int v_init_date;
    char v_no_exch_date_str[2049];
    int v_allow_next_init_time;
    char v_sys_config_str[65];
    char v_client_version[17];
    char v_manage_ver[17];
    char v_admin_ver[17];
    char v_update_addr[256];
    char v_dnload_addr[256];
    int v_total_fail_count;
    int64 v_query_row_id;
    int v_tmp_asset_acco_no;
    int v_pd_no;
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    double v_curr_qty;
    double v_avail_qty;
    double v_out_impawn_qty;
    char v_asac_busi_config_str[65];
    char v_last_error_code[33];
    int v_exch_group_no;
    char v_co_busi_config_str[65];
    int v_default_exch_group_no;
    char v_stock_code[7];
    char v_stock_name[65];
    int v_stock_type;
    int v_asset_type;
    char v_stock_acco[17];
    double v_out_cost_price;
    double v_acco_curr_qty;
    double v_acco_avail_qty;
    double v_out_curr_qty;
    double v_out_enable_qty;
    double v_acco_curr_qty_diff;
    double v_acco_avail_qty_diff;
    int v_deal_flag;
    char v_remark_info[256];
    int64 v_tmp_row_id;
    int v_tmp_co_no;
    int v_batch_deal_range;
    int v_sync_deal_type;
    int v_valid_flag;
    char v_busi_config_str[65];
    char v_deal_info[256];
    double v_occur_qty;
    int64 v_asac_posi_id;
    int v_asac_stock_type;
    int v_asac_asset_type;
    int v_asac_invest_type;
    double v_asac_begin_qty;
    double v_asac_curr_qty;
    double v_asac_pre_settle_qty;
    double v_asac_frozen_qty;
    double v_asac_unfroz_qty;
    double v_asac_posi_qty_check_diff;
    double v_asac_cost_amt;
    double v_asac_realize_pandl;
    double v_asac_intrst_cost_amt;
    double v_asac_intrst_pandl;
    int v_asac_update_times;
    int64 v_exgp_posi_id;
    int v_exch_group_stock_type;
    int v_exch_group_asset_type;
    int v_exgp_invest_type;
    double v_exch_group_begin_qty;
    double v_exgp_curr_qty;
    double v_exgp_pre_settle_qty;
    double v_exgp_frozen_qty;
    double v_exgp_unfroz_qty;
    double v_exgp_posi_qty_check_diff;
    double v_exgp_cost_amt;
    double v_exgp_realize_pandl;
    double v_exgp_intrst_cost_amt;
    double v_exgp_intrst_pandl;
    int v_exch_group_update_times;
    int v_update_times;
    char v_log_error_code[33];
    char v_log_error_info[256];

    IGroup* lpAutoSyncMsg=NULL;
    IGroup* lpDiffMsg=NULL;
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
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_co_no_str, " ");
    strcpy(v_pd_no_str, " ");
    v_asset_acco_no=0;
    strcpy(v_stock_code_str, " ");
    strcpy(v_exch_no_str, " ");
    v_is_contain=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_deal_flag_query_str, " ");
    v_filter_diff_cond=0;
    v_asset_sync_flag=0;
    v_row_id=0;
    v_row_count=-1;
    v_sync_req_type=0;
    v_auto_sync_type=0;
    v_co_no=0;
    strcpy(v_sys_name, " ");
    strcpy(v_sys_status, "0");
    v_init_date=0;
    strcpy(v_no_exch_date_str, " ");
    v_allow_next_init_time=0;
    strcpy(v_sys_config_str, " ");
    strcpy(v_client_version, " ");
    strcpy(v_manage_ver, " ");
    strcpy(v_admin_ver, " ");
    strcpy(v_update_addr, " ");
    strcpy(v_dnload_addr, " ");
    v_total_fail_count=0;
    v_query_row_id=0;
    v_tmp_asset_acco_no=0;
    v_pd_no=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_curr_qty=0;
    v_avail_qty=0;
    v_out_impawn_qty=0;
    strcpy(v_asac_busi_config_str, " ");
    strcpy(v_last_error_code, "0");
    v_exch_group_no=0;
    strcpy(v_co_busi_config_str, " ");
    v_default_exch_group_no=0;
    strcpy(v_stock_code, " ");
    strcpy(v_stock_name, " ");
    v_stock_type=0;
    v_asset_type=0;
    strcpy(v_stock_acco, " ");
    v_out_cost_price=0;
    v_acco_curr_qty=0;
    v_acco_avail_qty=0;
    v_out_curr_qty=0;
    v_out_enable_qty=0;
    v_acco_curr_qty_diff=0;
    v_acco_avail_qty_diff=0;
    v_deal_flag=0;
    strcpy(v_remark_info, " ");
    v_tmp_row_id=0;
    v_tmp_co_no=0;
    v_batch_deal_range=0;
    v_sync_deal_type=0;
    v_valid_flag=0;
    strcpy(v_busi_config_str, " ");
    strcpy(v_deal_info, " ");
    v_occur_qty=0;
    v_asac_posi_id=0;
    v_asac_stock_type=0;
    v_asac_asset_type=0;
    v_asac_invest_type=0;
    v_asac_begin_qty=0;
    v_asac_curr_qty=0;
    v_asac_pre_settle_qty=0;
    v_asac_frozen_qty=0;
    v_asac_unfroz_qty=0;
    v_asac_posi_qty_check_diff=0;
    v_asac_cost_amt=0;
    v_asac_realize_pandl=0;
    v_asac_intrst_cost_amt=0;
    v_asac_intrst_pandl=0;
    v_asac_update_times=0;
    v_exgp_posi_id=0;
    v_exch_group_stock_type=0;
    v_exch_group_asset_type=0;
    v_exgp_invest_type=0;
    v_exch_group_begin_qty=0;
    v_exgp_curr_qty=0;
    v_exgp_pre_settle_qty=0;
    v_exgp_frozen_qty=0;
    v_exgp_unfroz_qty=0;
    v_exgp_posi_qty_check_diff=0;
    v_exgp_cost_amt=0;
    v_exgp_realize_pandl=0;
    v_exgp_intrst_cost_amt=0;
    v_exgp_intrst_pandl=0;
    v_exch_group_update_times=0;
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

    //后台轮询接口暂不校验密码。
    //[事务_公共_公共接口_检查系统状态权限身份]

    // set @机构编号串#=" ";
    strcpy(v_co_no_str," ");

    // set @产品编号串#=" ";
    strcpy(v_pd_no_str," ");

    // set @资产账户编号#=0;
    v_asset_acco_no=0;

    // set @证券代码串#=" ";
    strcpy(v_stock_code_str," ");

    // set @市场编号串#=" ";
    strcpy(v_exch_no_str," ");

    // set @是否包含#=1;
    v_is_contain=1;

    // set @通道编号#=0;
    v_pass_no=0;

    // set @外部账号#=" ";
    strcpy(v_out_acco," ");

    // set @处理标志查询串#="2;3";
    strcpy(v_deal_flag_query_str,"2;3");

    // set @过滤差额条件#=1;
    v_filter_diff_cond=1;

    // set @资产是否同步#=0;
    v_asset_sync_flag=0;

    // set @记录序号#=0;
    v_row_id=0;

    // set @指定行数#=-1;
    v_row_count=-1;

    // set @同步请求类型#=1;
    v_sync_req_type=1;

    // set @运维端自动同步类型#=0;
    v_auto_sync_type=0;

    // set @机构编号#=0;
    v_co_no=0;
    //调用过程[事务_公共_基础_获取系统信息]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.3.4", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.3.4]subcall timed out!");
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
    v_row_id = lpTSCall1Ans0->GetInt64(LDBIZ_ROW_ID_INT64);
    strcpy(v_sys_name, lpTSCall1Ans0->GetString(LDBIZ_SYS_NAME_STR));
    strcpy(v_sys_status, lpTSCall1Ans0->GetString(LDBIZ_SYS_STATUS_STR));
    v_init_date = lpTSCall1Ans0->GetInt32(LDBIZ_INIT_DATE_INT);
    strcpy(v_no_exch_date_str, lpTSCall1Ans0->GetString(LDBIZ_NO_EXCH_DATE_STR_STR));
    v_allow_next_init_time = lpTSCall1Ans0->GetInt32(LDBIZ_ALLOW_NEXT_INIT_TIME_INT);
    strcpy(v_sys_config_str, lpTSCall1Ans0->GetString(LDBIZ_SYS_CONFIG_STR_STR));
    strcpy(v_client_version, lpTSCall1Ans0->GetString(LDBIZ_CLIENT_VERSION_STR));
    strcpy(v_manage_ver, lpTSCall1Ans0->GetString(LDBIZ_MANAGE_VER_STR));
    strcpy(v_admin_ver, lpTSCall1Ans0->GetString(LDBIZ_ADMIN_VER_STR));
    strcpy(v_update_addr, lpTSCall1Ans0->GetString(LDBIZ_UPDATE_ADDR_STR));
    strcpy(v_dnload_addr, lpTSCall1Ans0->GetString(LDBIZ_DNLOAD_ADDR_STR));

    //调用过程[事务_公共_基础数据同步_查询自动同步内部核对设置]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.28.109", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.28.109]subcall timed out!");
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
    v_total_fail_count = lpTSCall1Ans1->GetInt32(LDBIZ_TOTAL_FAIL_COUNT_INT);


    // if @未处理记录数# >0     then
    if (v_total_fail_count >0    )
    {

        // set @查询记录序号# = 0;
        v_query_row_id = 0;

        // set @临时_资产账户编号# = 0;
        v_tmp_asset_acco_no = 0;
        // loop_label:loop
        while (true)
        {

        //调用过程[事务_产品证券_持仓运维_获取内部证券持仓记录]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.1", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req2->SetInt64(LDBIZ_QUERY_ROW_ID_INT64,v_query_row_id);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 15000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.1]subcall timed out!");
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
        v_asset_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_exch_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_NO_INT);
        v_stock_acco_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
        v_stock_code_no = lpTSCall1Ans2->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
        v_curr_qty = lpTSCall1Ans2->GetDouble(LDBIZ_CURR_QTY_FLOAT);
        v_avail_qty = lpTSCall1Ans2->GetDouble(LDBIZ_AVAIL_QTY_FLOAT);
        v_out_impawn_qty = lpTSCall1Ans2->GetDouble(LDBIZ_OUT_IMPAWN_QTY_FLOAT);


        // if @错误编码# <> "0" then
        if (strcmp(v_error_code , "0")!=0)
        {

            // set @错误编码# = "0";
            strcpy(v_error_code,"0");

            // set @错误信息# = " ";
            strcpy(v_error_info," ");
            // leave loop_label;
            break;

        }
        // else
        else
        {


            // set @查询记录序号# = @记录序号#;
            v_query_row_id = v_row_id;

            // if @资产账户编号# <> @临时_资产账户编号# then
            if (v_asset_acco_no != v_tmp_asset_acco_no)
            {

                // set @临时_资产账户编号# = @资产账户编号#;
                v_tmp_asset_acco_no = v_asset_acco_no;
                //调用过程[事务_产品_公共接口_检查和获取同步资产账户信息]
                //组织事务请求
                if(lpTSCall1Ans3)
                {
                  lpTSCall1Ans3->FreeMsg();
                  lpTSCall1Ans3=NULL;
                }
                lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("prodT.6.9", 0);
                lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
                if(!lpTSCall1Ans3)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.9]subcall timed out!");
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
                strcpy(v_out_acco, lpTSCall1Ans3->GetString(LDBIZ_OUT_ACCO_STR));
                strcpy(v_asac_busi_config_str, lpTSCall1Ans3->GetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR));


                // if @错误编码# <> "0" then
                if (strcmp(v_error_code , "0")!=0)
                {

                    // set @前错误编码# = @错误编码#;
                    strcpy(v_last_error_code,v_error_code);

                    // set @错误编码# = "0";
                    strcpy(v_error_code,"0");

                    // set @错误信息# = " ";
                    strcpy(v_error_info," ");
                }
                // else
                else
                {


                    // set @前错误编码# = "0";
                    strcpy(v_last_error_code,"0");
                    //调用过程[事务_公共_公共接口_检查和获取同步内部核对所需公共信息]
                    //组织事务请求
                    if(lpTSCall1Ans4)
                    {
                      lpTSCall1Ans4->FreeMsg();
                      lpTSCall1Ans4=NULL;
                    }
                    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pubT.24.58", 0);
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
                    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
                    if(!lpTSCall1Ans4)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.58]subcall timed out!");
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
                    v_exch_group_no = lpTSCall1Ans4->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
                    strcpy(v_co_busi_config_str, lpTSCall1Ans4->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));


                    // if @错误编码# <> "0" then
                    if (strcmp(v_error_code , "0")!=0)
                    {

                        // set @前错误编码# = @错误编码#;
                        strcpy(v_last_error_code,v_error_code);

                        // set @错误编码# = "0";
                        strcpy(v_error_code,"0");

                        // set @错误信息# = " ";
                        strcpy(v_error_info," ");
                    // end if;
                    }

                    //默认交易组从产品库获取 set @默认交易组编号// = @交易组编号//;
                    //调用过程[事务_产品_公共接口_获取资产账户默认交易组编号]
                    //组织事务请求
                    if(lpTSCall1Ans5)
                    {
                      lpTSCall1Ans5->FreeMsg();
                      lpTSCall1Ans5=NULL;
                    }
                    lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("prodT.6.47", 0);
                    lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
                    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                    lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                    lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                    lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                    lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                    lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                    lpTSCall1Req5->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                    glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
                    if(!lpTSCall1Ans5)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.47]subcall timed out!");
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
                    v_default_exch_group_no = lpTSCall1Ans5->GetInt32(LDBIZ_DEFAULT_EXCH_GROUP_NO_INT);

                // end if;
                }

            // end if;
            }


            // if @前错误编码# = "0" then
            if (strcmp(v_last_error_code , "0")==0)
            {
                //调用过程[事务_公共_公共接口_检查和获取同步内部核对所需证券代码编号信息]
                //组织事务请求
                if(lpTSCall1Ans6)
                {
                  lpTSCall1Ans6->FreeMsg();
                  lpTSCall1Ans6=NULL;
                }
                lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("pubT.24.59", 0);
                lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req6->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
                if(!lpTSCall1Ans6)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.59]subcall timed out!");
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
                strcpy(v_stock_code, lpTSCall1Ans6->GetString(LDBIZ_STOCK_CODE_STR));
                strcpy(v_stock_name, lpTSCall1Ans6->GetString(LDBIZ_STOCK_NAME_STR));
                v_stock_type = lpTSCall1Ans6->GetInt32(LDBIZ_STOCK_TYPE_INT);
                v_asset_type = lpTSCall1Ans6->GetInt32(LDBIZ_ASSET_TYPE_INT);


                // if @错误编码# <> "0" then
                if (strcmp(v_error_code , "0")!=0)
                {

                    // set @错误编码# = "0";
                    strcpy(v_error_code,"0");

                    // set @错误信息# = " ";
                    strcpy(v_error_info," ");
                }
                // else
                else
                {

                    //调用过程[事务_产品证券_持仓运维_转入内部证券持仓核对记录]
                    //组织事务请求
                    if(lpTSCall1Ans7)
                    {
                      lpTSCall1Ans7->FreeMsg();
                      lpTSCall1Ans7=NULL;
                    }
                    lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.2", 0);
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
                    lpTSCall1Req7->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                    lpTSCall1Req7->SetInt32(LDBIZ_DEFAULT_EXCH_GROUP_NO_INT,v_default_exch_group_no);
                    lpTSCall1Req7->SetString(LDBIZ_CO_BUSI_CONFIG_STR_STR,v_co_busi_config_str);
                    lpTSCall1Req7->SetString(LDBIZ_ASAC_BUSI_CONFIG_STR_STR,v_asac_busi_config_str);
                    lpTSCall1Req7->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
                    lpTSCall1Req7->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
                    lpTSCall1Req7->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                    lpTSCall1Req7->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                    lpTSCall1Req7->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                    lpTSCall1Req7->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
                    lpTSCall1Req7->SetString(LDBIZ_STOCK_NAME_STR,v_stock_name);
                    lpTSCall1Req7->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
                    lpTSCall1Req7->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
                    lpTSCall1Req7->SetDouble(LDBIZ_CURR_QTY_FLOAT,v_curr_qty);
                    lpTSCall1Req7->SetDouble(LDBIZ_AVAIL_QTY_FLOAT,v_avail_qty);
                    lpTSCall1Req7->SetDouble(LDBIZ_OUT_IMPAWN_QTY_FLOAT,v_out_impawn_qty);
                    glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 15000);
                    if(!lpTSCall1Ans7)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.2]subcall timed out!");
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


                    // if @错误编码# <> "0" then
                    if (strcmp(v_error_code , "0")!=0)
                    {

                        // set @错误编码# = "0";
                        strcpy(v_error_code,"0");

                        // set @错误信息# = " ";
                        strcpy(v_error_info," ");
                    // end if;
                    }

                // end if;
                }

            // end if;
            }

        // end if;
        }

        // end loop;
        }

    // end if;
    }

    //调用过程[事务_公共_基础数据同步_查询自动同步设置表]
    //组织事务请求
    if(lpTSCall1Ans8)
    {
      lpTSCall1Ans8->FreeMsg();
      lpTSCall1Ans8=NULL;
    }
    lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("pubT.28.201", 0);
    lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req8->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpTSCall1Req8->SetInt32(LDBIZ_AUTO_SYNC_TYPE_INT,v_auto_sync_type);
    lpTSCall1Req8->SetInt32(LDBIZ_SYNC_REQ_TYPE_INT,v_sync_req_type);
    glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
    if(!lpTSCall1Ans8)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.28.201]subcall timed out!");
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


    // [获取结果集][lpAutoSyncMsg]
    lpAutoSyncMsg=lpTSCall1Ans8->GetGroup(LDTAG_NO_RESULTSET);

    //调用过程[事务_产品证券_持仓运维_查询资产账户内外持仓差异记录]
    //组织事务请求
    if(lpTSCall1Ans9)
    {
      lpTSCall1Ans9->FreeMsg();
      lpTSCall1Ans9=NULL;
    }
    lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.3", 0);
    lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req9->SetString(LDBIZ_CO_NO_STR_STR,v_co_no_str);
    lpTSCall1Req9->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpTSCall1Req9->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req9->SetString(LDBIZ_STOCK_CODE_STR_STR,v_stock_code_str);
    lpTSCall1Req9->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req9->SetInt32(LDBIZ_IS_CONTAIN_INT,v_is_contain);
    lpTSCall1Req9->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req9->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req9->SetString(LDBIZ_DEAL_FLAG_QUERY_STR_STR,v_deal_flag_query_str);
    lpTSCall1Req9->SetInt32(LDBIZ_FILTER_DIFF_COND_INT,v_filter_diff_cond);
    lpTSCall1Req9->SetInt32(LDBIZ_ASSET_SYNC_FLAG_INT,v_asset_sync_flag);
    lpTSCall1Req9->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req9->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
    if(!lpTSCall1Ans9)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.3]subcall timed out!");
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


    // [获取结果集][lpDiffMsg]
    lpDiffMsg=lpTSCall1Ans9->GetGroup(LDTAG_NO_RESULTSET);


    // [遍历结果集开始][lpDiffMsg]
    iRecordCount = lpDiffMsg->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpDiffMsg->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            v_row_id = lpRecord->GetInt64(LDBIZ_ROW_ID_INT64);
            v_init_date = lpRecord->GetInt32(LDBIZ_INIT_DATE_INT);
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
            v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
            v_pass_no = lpRecord->GetInt32(LDBIZ_PASS_NO_INT);
            strcpy(v_out_acco, lpRecord->GetString(LDBIZ_OUT_ACCO_STR));
            v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
            v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
            strcpy(v_stock_acco, lpRecord->GetString(LDBIZ_STOCK_ACCO_STR));
            v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
            strcpy(v_stock_code, lpRecord->GetString(LDBIZ_STOCK_CODE_STR));
            strcpy(v_stock_name, lpRecord->GetString(LDBIZ_STOCK_NAME_STR));
            v_out_cost_price = lpRecord->GetDouble(LDBIZ_OUT_COST_PRICE_FLOAT);
            v_acco_curr_qty = lpRecord->GetDouble(LDBIZ_ACCO_CURR_QTY_FLOAT);
            v_acco_avail_qty = lpRecord->GetDouble(LDBIZ_ACCO_AVAIL_QTY_FLOAT);
            v_out_curr_qty = lpRecord->GetDouble(LDBIZ_OUT_CURR_QTY_FLOAT);
            v_out_enable_qty = lpRecord->GetDouble(LDBIZ_OUT_ENABLE_QTY_FLOAT);
            v_acco_curr_qty_diff = lpRecord->GetDouble(LDBIZ_ACCO_CURR_QTY_DIFF_FLOAT);
            v_acco_avail_qty_diff = lpRecord->GetDouble(LDBIZ_ACCO_AVAIL_QTY_DIFF_FLOAT);
            v_out_impawn_qty = lpRecord->GetDouble(LDBIZ_OUT_IMPAWN_QTY_FLOAT);
            v_deal_flag = lpRecord->GetInt32(LDBIZ_DEAL_FLAG_INT);
            v_asset_sync_flag = lpRecord->GetInt32(LDBIZ_ASSET_SYNC_FLAG_INT);
            strcpy(v_remark_info, lpRecord->GetString(LDBIZ_REMARK_INFO_STR));


        // set @临时_记录序号# = @记录序号#;
        v_tmp_row_id = v_row_id;

        // set @临时_机构编号# = @机构编号#;
        v_tmp_co_no = v_co_no;
        // int rowCnt=0;
        int rowCnt=0;


       // [嵌套遍历结果集开始][lpAutoSyncMsg][rowCnt]
       rowCnt= lpAutoSyncMsg->GetRecordCount();
       for (int i = 0; i < rowCnt;i++) 
       {
           IRecord* lpRecord =lpAutoSyncMsg->GetRecord(i);
           if(lpRecord)
           {

             // v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
             v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);


            // set @批量处理范围#=lpRecord->GetInt32(LDBIZ_POSI_BATCH_DEAL_RANGE_INT);
            v_batch_deal_range=lpRecord->GetInt32(LDBIZ_POSI_BATCH_DEAL_RANGE_INT);
            //0未处理 ，1 内部数据 2内部和未处理

            // if @临时_机构编号# = @机构编号#  && (@批量处理范围# =2 || (@处理标志# = 2 && @批量处理范围# =0 ) || (@处理标志# = 3 && @批量处理范围# =1 ) )  then
            if (v_tmp_co_no == v_co_no  && (v_batch_deal_range ==2 || (v_deal_flag == 2 && v_batch_deal_range ==0 ) || (v_deal_flag == 3 && v_batch_deal_range ==1 )) )
            {

                // set  @记录序号#=@临时_记录序号#;
                 v_row_id=v_tmp_row_id;

                // set @同步处理方式#=2;
                v_sync_deal_type=2;
                //调用过程[事务_产品证券_持仓运维_获取资产账户内外持仓差异数据]
                //组织事务请求
                if(lpTSCall1Ans10)
                {
                  lpTSCall1Ans10->FreeMsg();
                  lpTSCall1Ans10=NULL;
                }
                lpTSCall1Req10=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.10", 0);
                lpTSCall1Req10->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req10->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req10->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req10->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req10->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req10->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req10->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req10->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req10->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
                glpTSSubcallSerives->SubCall(lpTSCall1Req10, &lpTSCall1Ans10, 5000);
                if(!lpTSCall1Ans10)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.10]subcall timed out!");
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
                v_exch_no = lpTSCall1Ans10->GetInt32(LDBIZ_EXCH_NO_INT);
                v_stock_code_no = lpTSCall1Ans10->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
                v_asset_acco_no = lpTSCall1Ans10->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
                strcpy(v_out_acco, lpTSCall1Ans10->GetString(LDBIZ_OUT_ACCO_STR));

               //[事务_公共_公共接口_检查系统状态权限身份]
                //调用过程[事务_公共_公共接口_判断债券是否兑付]
                //组织事务请求
                if(lpTSCall1Ans11)
                {
                  lpTSCall1Ans11->FreeMsg();
                  lpTSCall1Ans11=NULL;
                }
                lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("pubT.24.31", 0);
                lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req11->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
                lpTSCall1Req11->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                lpTSCall1Req11->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                lpTSCall1Req11->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
                glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
                if(!lpTSCall1Ans11)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.31]subcall timed out!");
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
                v_init_date = lpTSCall1Ans11->GetInt32(LDBIZ_INIT_DATE_INT);
                strcpy(v_co_busi_config_str, lpTSCall1Ans11->GetString(LDBIZ_CO_BUSI_CONFIG_STR_STR));
                v_valid_flag = lpTSCall1Ans11->GetInt32(LDBIZ_VALID_FLAG_INT);

                //调用过程[事务_产品_公共接口_获取资产账户业务控制串]
                //组织事务请求
                if(lpTSCall1Ans12)
                {
                  lpTSCall1Ans12->FreeMsg();
                  lpTSCall1Ans12=NULL;
                }
                lpTSCall1Req12=glpFastMsgFactory->CreateFastMessage("prodT.6.31", 0);
                lpTSCall1Req12->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req12->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req12->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req12->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req12->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req12->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req12->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req12->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req12->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                glpTSSubcallSerives->SubCall(lpTSCall1Req12, &lpTSCall1Ans12, 5000);
                if(!lpTSCall1Ans12)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.31]subcall timed out!");
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
                strcpy(v_busi_config_str, lpTSCall1Ans12->GetString(LDBIZ_BUSI_CONFIG_STR_STR));

               //有效标志为1,说明债券还未到期,有效标志为0,说明债券已兑付

                // set @处理信息#="自动同步处理";
                strcpy(v_deal_info,"自动同步处理");
                //调用过程[事务_产品证券_持仓运维_处理资产账户内外持仓差异记录]
                //组织事务请求
                if(lpTSCall1Ans13)
                {
                  lpTSCall1Ans13->FreeMsg();
                  lpTSCall1Ans13=NULL;
                }
                lpTSCall1Req13=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.4", 0);
                lpTSCall1Req13->SetInt32(LDTAG_PRIORITY, iPriority);
                lpTSCall1Req13->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                lpTSCall1Req13->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                lpTSCall1Req13->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                lpTSCall1Req13->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                lpTSCall1Req13->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                lpTSCall1Req13->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                lpTSCall1Req13->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                lpTSCall1Req13->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
                lpTSCall1Req13->SetInt32(LDBIZ_SYNC_DEAL_TYPE_INT,v_sync_deal_type);
                lpTSCall1Req13->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
                lpTSCall1Req13->SetInt32(LDBIZ_VALID_FLAG_INT,v_valid_flag);
                lpTSCall1Req13->SetString(LDBIZ_BUSI_CONFIG_STR_STR,v_busi_config_str);
                lpTSCall1Req13->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
                glpTSSubcallSerives->SubCall(lpTSCall1Req13, &lpTSCall1Ans13, 5000);
                if(!lpTSCall1Ans13)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.4]subcall timed out!");
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
                v_co_no = lpTSCall1Ans13->GetInt32(LDBIZ_CO_NO_INT);
                v_pd_no = lpTSCall1Ans13->GetInt32(LDBIZ_PD_NO_INT);
                v_exch_group_no = lpTSCall1Ans13->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
                v_asset_acco_no = lpTSCall1Ans13->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
                v_exch_no = lpTSCall1Ans13->GetInt32(LDBIZ_EXCH_NO_INT);
                v_stock_acco_no = lpTSCall1Ans13->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
                v_stock_code_no = lpTSCall1Ans13->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
                v_occur_qty = lpTSCall1Ans13->GetDouble(LDBIZ_OCCUR_QTY_FLOAT);
                v_asset_sync_flag = lpTSCall1Ans13->GetInt32(LDBIZ_ASSET_SYNC_FLAG_INT);
                v_asac_posi_id = lpTSCall1Ans13->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
                v_asac_stock_type = lpTSCall1Ans13->GetInt32(LDBIZ_ASAC_STOCK_TYPE_INT);
                v_asac_asset_type = lpTSCall1Ans13->GetInt32(LDBIZ_ASAC_ASSET_TYPE_INT);
                v_asac_invest_type = lpTSCall1Ans13->GetInt32(LDBIZ_ASAC_INVEST_TYPE_INT);
                v_asac_begin_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_BEGIN_QTY_FLOAT);
                v_asac_curr_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT);
                v_asac_pre_settle_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_PRE_SETTLE_QTY_FLOAT);
                v_asac_frozen_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
                v_asac_unfroz_qty = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
                v_asac_posi_qty_check_diff = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_POSI_QTY_CHECK_DIFF_FLOAT);
                v_asac_cost_amt = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
                v_asac_realize_pandl = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
                v_asac_intrst_cost_amt = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
                v_asac_intrst_pandl = lpTSCall1Ans13->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
                v_asac_update_times = lpTSCall1Ans13->GetInt32(LDBIZ_ASAC_UPDATE_TIMES_INT);
                v_exgp_posi_id = lpTSCall1Ans13->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
                v_exch_group_stock_type = lpTSCall1Ans13->GetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT);
                v_exch_group_asset_type = lpTSCall1Ans13->GetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT);
                v_exgp_invest_type = lpTSCall1Ans13->GetInt32(LDBIZ_EXGP_INVEST_TYPE_INT);
                v_exch_group_begin_qty = lpTSCall1Ans13->GetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT);
                v_exgp_curr_qty = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT);
                v_exgp_pre_settle_qty = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT);
                v_exgp_frozen_qty = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
                v_exgp_unfroz_qty = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
                v_exgp_posi_qty_check_diff = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT);
                v_exgp_cost_amt = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
                v_exgp_realize_pandl = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
                v_exgp_intrst_cost_amt = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
                v_exgp_intrst_pandl = lpTSCall1Ans13->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
                v_exch_group_update_times = lpTSCall1Ans13->GetInt32(LDBIZ_EXCH_GROUP_UPDATE_TIMES_INT);


                // if (@变动数量# <> 0 or @资产账户持仓核对差额#<>0 or @同步处理方式# = 2) and (@资产是否同步#=《资产是否同步-同步资金同步持仓》 or @资产是否同步#=《资产是否同步-不同步资金同步持仓》) then
                if ((v_occur_qty != 0 || v_asac_posi_qty_check_diff!=0 || v_sync_deal_type == 2) && (v_asset_sync_flag==1 || v_asset_sync_flag==4))
                {

                    // set @更新次数# = @交易组更新次数#;
                    v_update_times = v_exch_group_update_times;

                    // [主动推送][secu.pdexgpposi][证券主推_产品持仓_交易组持仓主推消息]
                    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.80", 0);
                    lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
                    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
                    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                    lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                    lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT,v_exch_group_stock_type);
                    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT,v_exch_group_asset_type);
                    lpPubMsg->SetInt32(LDBIZ_EXGP_INVEST_TYPE_INT,v_exgp_invest_type);
                    lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT,v_exch_group_begin_qty);
                    lpPubMsg->SetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT,v_exgp_curr_qty);
                    lpPubMsg->SetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT,v_exgp_pre_settle_qty);
                    lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
                    lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
                    lpPubMsg->SetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT,v_exgp_posi_qty_check_diff);
                    lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
                    lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
                    lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
                    lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
                    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
                    glpPubSub_Interface->PubTopics("secu.pdexgpposi", lpPubMsg);


                    // set @更新次数# = @资产账户更新次数#;
                    v_update_times = v_asac_update_times;

                    // [主动推送][secu.pdasacposi][证券主推_产品持仓_资产账户持仓主推消息]
                    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.81", 0);
                    lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
                    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
                    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                    lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
                    lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
                    lpPubMsg->SetInt32(LDBIZ_ASAC_STOCK_TYPE_INT,v_asac_stock_type);
                    lpPubMsg->SetInt32(LDBIZ_ASAC_ASSET_TYPE_INT,v_asac_asset_type);
                    lpPubMsg->SetInt32(LDBIZ_ASAC_INVEST_TYPE_INT,v_asac_invest_type);
                    lpPubMsg->SetDouble(LDBIZ_ASAC_BEGIN_QTY_FLOAT,v_asac_begin_qty);
                    lpPubMsg->SetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT,v_asac_curr_qty);
                    lpPubMsg->SetDouble(LDBIZ_ASAC_PRE_SETTLE_QTY_FLOAT,v_asac_pre_settle_qty);
                    lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
                    lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
                    lpPubMsg->SetDouble(LDBIZ_ASAC_POSI_QTY_CHECK_DIFF_FLOAT,v_asac_posi_qty_check_diff);
                    lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
                    lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
                    lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
                    lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
                    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
                    glpPubSub_Interface->PubTopics("secu.pdasacposi", lpPubMsg);

               // end if;
               }

           // end if;
           }


    // [遍历结果集结束][lpAutoSyncMsg]
        }
    }


    // [遍历结果集结束][lpDiffMsg]
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

//逻辑_产品证券_持仓运维_查询通道内外持仓差异记录
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
    char v_co_no_str[2049];
    char v_pd_no_str[2049];
    int v_asset_acco_no;
    char v_stock_code_str[4097];
    char v_exch_no_str[2049];
    int v_is_contain;
    int v_pass_no;
    char v_out_acco[33];
    char v_deal_flag_query_str[2049];
    int v_query_pass_no;
    int v_filter_diff_cond;
    int v_asset_sync_flag;
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
    int v_exch_no;
    int v_stock_acco_no;
    char v_stock_acco[17];
    int v_stock_code_no;
    char v_stock_code[7];
    char v_stock_name[65];
    double v_out_cost_price;
    double v_acco_curr_qty;
    double v_acco_avail_qty;
    double v_out_curr_qty;
    double v_out_enable_qty;
    double v_acco_curr_qty_diff;
    double v_acco_avail_qty_diff;
    double v_sys_avail_qty_diff;
    double v_out_impawn_qty;
    int v_deal_flag;
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
    strcpy(v_co_no_str, " ");
    strcpy(v_pd_no_str, " ");
    v_asset_acco_no=0;
    strcpy(v_stock_code_str, " ");
    strcpy(v_exch_no_str, " ");
    v_is_contain=0;
    v_pass_no=0;
    strcpy(v_out_acco, " ");
    strcpy(v_deal_flag_query_str, " ");
    v_query_pass_no=0;
    v_filter_diff_cond=0;
    v_asset_sync_flag=0;
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
    v_exch_no=0;
    v_stock_acco_no=0;
    strcpy(v_stock_acco, " ");
    v_stock_code_no=0;
    strcpy(v_stock_code, " ");
    strcpy(v_stock_name, " ");
    v_out_cost_price=0;
    v_acco_curr_qty=0;
    v_acco_avail_qty=0;
    v_out_curr_qty=0;
    v_out_enable_qty=0;
    v_acco_curr_qty_diff=0;
    v_acco_avail_qty_diff=0;
    v_sys_avail_qty_diff=0;
    v_out_impawn_qty=0;
    v_deal_flag=0;
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
    strncpy(v_co_no_str, lpInBizMsg->GetString(LDBIZ_CO_NO_STR_STR),2048);
    v_co_no_str[2048] = '\0';
    strncpy(v_pd_no_str, lpInBizMsg->GetString(LDBIZ_PD_NO_STR_STR),2048);
    v_pd_no_str[2048] = '\0';
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strncpy(v_stock_code_str, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR_STR),4096);
    v_stock_code_str[4096] = '\0';
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_is_contain = lpInBizMsg->GetInt32(LDBIZ_IS_CONTAIN_INT);
    v_pass_no = lpInBizMsg->GetInt32(LDBIZ_PASS_NO_INT);
    strncpy(v_out_acco, lpInBizMsg->GetString(LDBIZ_OUT_ACCO_STR),32);
    v_out_acco[32] = '\0';
    strncpy(v_deal_flag_query_str, lpInBizMsg->GetString(LDBIZ_DEAL_FLAG_QUERY_STR_STR),2048);
    v_deal_flag_query_str[2048] = '\0';
    v_query_pass_no = lpInBizMsg->GetInt32(LDBIZ_QUERY_PASS_NO_INT);
    v_filter_diff_cond = lpInBizMsg->GetInt32(LDBIZ_FILTER_DIFF_COND_INT);
    v_asset_sync_flag = lpInBizMsg->GetInt32(LDBIZ_ASSET_SYNC_FLAG_INT);
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

    //调用过程[事务_产品证券_持仓运维_查询通道内外持仓差异记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.83", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetString(LDBIZ_CO_NO_STR_STR,v_co_no_str);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_STR_STR,v_pd_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_STR_STR,v_stock_code_str);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_IS_CONTAIN_INT,v_is_contain);
    lpTSCall1Req1->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
    lpTSCall1Req1->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
    lpTSCall1Req1->SetString(LDBIZ_DEAL_FLAG_QUERY_STR_STR,v_deal_flag_query_str);
    lpTSCall1Req1->SetInt32(LDBIZ_QUERY_PASS_NO_INT,v_query_pass_no);
    lpTSCall1Req1->SetInt32(LDBIZ_FILTER_DIFF_COND_INT,v_filter_diff_cond);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_SYNC_FLAG_INT,v_asset_sync_flag);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.83]subcall timed out!");
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

//逻辑_产品证券_持仓运维_查询所有交易组持仓
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
    int v_stock_acco_no;
    char v_stock_type_str[2049];
    char v_stock_code_no_str[4097];
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
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_code_no;
    int v_stock_type;
    int v_invest_type;
    double v_begin_qty;
    double v_curr_qty;
    double v_pre_settle_qty;
    double v_frozen_qty;
    double v_unfroz_qty;
    double v_posi_qty_check_diff;
    double v_cost_amt;
    double v_realize_pandl;
    double v_intrst_cost_amt;
    double v_intrst_pandl;
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_stock_acco_str[2049];
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
    v_stock_acco_no=0;
    strcpy(v_stock_type_str, " ");
    strcpy(v_stock_code_no_str, " ");
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
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_code_no=0;
    v_stock_type=0;
    v_invest_type=0;
    v_begin_qty=0;
    v_curr_qty=0;
    v_pre_settle_qty=0;
    v_frozen_qty=0;
    v_unfroz_qty=0;
    v_posi_qty_check_diff=0;
    v_cost_amt=0;
    v_realize_pandl=0;
    v_intrst_cost_amt=0;
    v_intrst_pandl=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_stock_acco_str, " ");
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
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strncpy(v_stock_type_str, lpInBizMsg->GetString(LDBIZ_STOCK_TYPE_STR_STR),2048);
    v_stock_type_str[2048] = '\0';
    strncpy(v_stock_code_no_str, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_NO_STR_STR),4096);
    v_stock_code_no_str[4096] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
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

    //set @业务控制串// = "001";
    //[事务_公共_公共接口_检查系统状态查询权限身份获取操作员权限串]
    //set @机构编号// = @操作员机构编号//;
    //调用过程[事务_产品证券_公共接口_获取注销股东代码串]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.4.116", 0);
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
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.4.116]subcall timed out!");
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
    strcpy(v_stock_acco_str, lpTSCall1Ans1->GetString(LDBIZ_STOCK_ACCO_STR_STR));

    //调用过程[事务_产品证券_持仓运维_查询所有交易组持仓]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.9.84", 0);
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
    lpTSCall1Req2->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_TYPE_STR_STR,v_stock_type_str);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_CODE_NO_STR_STR,v_stock_code_no_str);
    lpTSCall1Req2->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req2->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req2->SetString(LDBIZ_STOCK_ACCO_STR_STR,v_stock_acco_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.9.84]subcall timed out!");
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

//逻辑_产品证券_持仓运维_调整资产账户持仓成本
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
    int v_pd_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    int v_invest_type;
    double v_occur_cost_amt;
    double v_occur_intrst_amt;
    char v_oper_remark_info[256];
    int v_co_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_stock_type;
    int v_asset_type;
    char v_asset_acco_status[3];
    int64 v_asac_posi_id;
    int v_asac_stock_type;
    int v_asac_asset_type;
    int v_asac_invest_type;
    double v_asac_begin_qty;
    double v_asac_curr_qty;
    double v_asac_pre_settle_qty;
    double v_asac_frozen_qty;
    double v_asac_unfroz_qty;
    double v_asac_posi_qty_check_diff;
    double v_asac_cost_amt;
    double v_asac_realize_pandl;
    double v_asac_intrst_cost_amt;
    double v_asac_intrst_pandl;
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
    v_pd_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_invest_type=0;
    v_occur_cost_amt=0;
    v_occur_intrst_amt=0;
    strcpy(v_oper_remark_info, " ");
    v_co_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_stock_type=0;
    v_asset_type=0;
    strcpy(v_asset_acco_status, "0");
    v_asac_posi_id=0;
    v_asac_stock_type=0;
    v_asac_asset_type=0;
    v_asac_invest_type=0;
    v_asac_begin_qty=0;
    v_asac_curr_qty=0;
    v_asac_pre_settle_qty=0;
    v_asac_frozen_qty=0;
    v_asac_unfroz_qty=0;
    v_asac_posi_qty_check_diff=0;
    v_asac_cost_amt=0;
    v_asac_realize_pandl=0;
    v_asac_intrst_cost_amt=0;
    v_asac_intrst_pandl=0;
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
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_invest_type = lpInBizMsg->GetInt32(LDBIZ_INVEST_TYPE_INT);
    v_occur_cost_amt = lpInBizMsg->GetDouble(LDBIZ_OCCUR_COST_AMT_FLOAT);
    v_occur_intrst_amt = lpInBizMsg->GetDouble(LDBIZ_OCCUR_INTRST_AMT_FLOAT);
    strncpy(v_oper_remark_info, lpInBizMsg->GetString(LDBIZ_OPER_REMARK_INFO_STR),255);
    v_oper_remark_info[255] = '\0';
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;
    IFastMessage* lpTSCall1Req3 = NULL;
    IFastMessage* lpTSCall1Ans3 = NULL;


    // [检查报错返回][@变动成本金额# = 0 and @变动利息金额# = 0][618][@变动成本金额#,@变动利息金额#]
    if (v_occur_cost_amt == 0 && v_occur_intrst_amt == 0)
    {
        strcpy(v_error_code, "pdsecuL.9.93.618");
        snprintf(v_error_info, sizeof(v_error_info), "%s%032.6f%s%032.6f","变动成本金额=",v_occur_cost_amt,"变动利息金额=",v_occur_intrst_amt);
        iRet = -1;
        goto END;
    }

    //调用过程[事务_公共_公共接口_检查系统状态权限身份操作员产品操作权限代码信息]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.12", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req0->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.12]subcall timed out!");
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
    v_stock_type = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_TYPE_INT);
    v_asset_type = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_TYPE_INT);


    // set @资产账户状态# = 0;
    strcpy(v_asset_acco_status,"0");

    // set @操作员机构编号# = @机构编号#;
    v_opor_co_no = v_co_no;
    //调用过程[事务_产品_公共接口_检查资产账户状态]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("prodT.6.2", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_ASSET_ACCO_STATUS_STR,v_asset_acco_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.2]subcall timed out!");
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

    //调用过程[事务_产品证券_持仓_调整资产账户持仓成本]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pdsecuT.3.56", 0);
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
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req2->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_TYPE_INT,v_asset_type);
    lpTSCall1Req2->SetInt32(LDBIZ_INVEST_TYPE_INT,v_invest_type);
    lpTSCall1Req2->SetDouble(LDBIZ_OCCUR_COST_AMT_FLOAT,v_occur_cost_amt);
    lpTSCall1Req2->SetDouble(LDBIZ_OCCUR_INTRST_AMT_FLOAT,v_occur_intrst_amt);
    lpTSCall1Req2->SetString(LDBIZ_OPER_REMARK_INFO_STR,v_oper_remark_info);
    lpTSCall1Req2->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.3.56]subcall timed out!");
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
    v_asac_posi_id = lpTSCall1Ans2->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
    v_asac_stock_type = lpTSCall1Ans2->GetInt32(LDBIZ_ASAC_STOCK_TYPE_INT);
    v_asac_asset_type = lpTSCall1Ans2->GetInt32(LDBIZ_ASAC_ASSET_TYPE_INT);
    v_asac_invest_type = lpTSCall1Ans2->GetInt32(LDBIZ_ASAC_INVEST_TYPE_INT);
    v_asac_begin_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_BEGIN_QTY_FLOAT);
    v_asac_curr_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT);
    v_asac_pre_settle_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_PRE_SETTLE_QTY_FLOAT);
    v_asac_frozen_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
    v_asac_unfroz_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
    v_asac_posi_qty_check_diff = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_POSI_QTY_CHECK_DIFF_FLOAT);
    v_asac_cost_amt = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
    v_asac_realize_pandl = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
    v_asac_intrst_cost_amt = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
    v_asac_intrst_pandl = lpTSCall1Ans2->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
    v_update_times = lpTSCall1Ans2->GetInt32(LDBIZ_UPDATE_TIMES_INT);


    // [主动推送][secu.pdasacposi][证券主推_产品持仓_资产账户持仓主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.81", 0);
    lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpPubMsg->SetInt32(LDBIZ_ASAC_STOCK_TYPE_INT,v_asac_stock_type);
    lpPubMsg->SetInt32(LDBIZ_ASAC_ASSET_TYPE_INT,v_asac_asset_type);
    lpPubMsg->SetInt32(LDBIZ_ASAC_INVEST_TYPE_INT,v_asac_invest_type);
    lpPubMsg->SetDouble(LDBIZ_ASAC_BEGIN_QTY_FLOAT,v_asac_begin_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT,v_asac_curr_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_PRE_SETTLE_QTY_FLOAT,v_asac_pre_settle_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_POSI_QTY_CHECK_DIFF_FLOAT,v_asac_posi_qty_check_diff);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
    lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("secu.pdasacposi", lpPubMsg);


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

//逻辑_产品证券_持仓运维_冻结资产账户持仓
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
    int v_pd_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    double v_occur_qty;
    int v_expire_date;
    int v_is_change_exch_group_posi;
    int v_exch_group_no;
    char v_oper_remark_info[256];
    int v_co_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_tmp_exch_no;
    int v_tmp_pd_no;
    int v_stock_type;
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_asset_acco_status[3];
    int64 v_asac_posi_id;
    int v_asac_stock_type;
    int v_asac_asset_type;
    int v_asac_invest_type;
    double v_asac_begin_qty;
    double v_asac_curr_qty;
    double v_asac_pre_settle_qty;
    double v_asac_frozen_qty;
    double v_asac_unfroz_qty;
    double v_asac_posi_qty_check_diff;
    double v_asac_cost_amt;
    double v_asac_realize_pandl;
    double v_asac_intrst_cost_amt;
    double v_asac_intrst_pandl;
    int v_asac_update_times;
    int64 v_exgp_posi_id;
    int v_exch_group_stock_type;
    int v_exch_group_asset_type;
    int v_exgp_invest_type;
    double v_exch_group_begin_qty;
    double v_exgp_curr_qty;
    double v_exgp_pre_settle_qty;
    double v_exgp_frozen_qty;
    double v_exgp_unfroz_qty;
    double v_exgp_posi_qty_check_diff;
    double v_exgp_cost_amt;
    double v_exgp_realize_pandl;
    double v_exgp_intrst_cost_amt;
    double v_exgp_intrst_pandl;
    int v_exch_group_update_times;
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
    v_pd_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_occur_qty=0;
    v_expire_date=0;
    v_is_change_exch_group_posi=0;
    v_exch_group_no=0;
    strcpy(v_oper_remark_info, " ");
    v_co_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_tmp_exch_no=0;
    v_tmp_pd_no=0;
    v_stock_type=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_asset_acco_status, "0");
    v_asac_posi_id=0;
    v_asac_stock_type=0;
    v_asac_asset_type=0;
    v_asac_invest_type=0;
    v_asac_begin_qty=0;
    v_asac_curr_qty=0;
    v_asac_pre_settle_qty=0;
    v_asac_frozen_qty=0;
    v_asac_unfroz_qty=0;
    v_asac_posi_qty_check_diff=0;
    v_asac_cost_amt=0;
    v_asac_realize_pandl=0;
    v_asac_intrst_cost_amt=0;
    v_asac_intrst_pandl=0;
    v_asac_update_times=0;
    v_exgp_posi_id=0;
    v_exch_group_stock_type=0;
    v_exch_group_asset_type=0;
    v_exgp_invest_type=0;
    v_exch_group_begin_qty=0;
    v_exgp_curr_qty=0;
    v_exgp_pre_settle_qty=0;
    v_exgp_frozen_qty=0;
    v_exgp_unfroz_qty=0;
    v_exgp_posi_qty_check_diff=0;
    v_exgp_cost_amt=0;
    v_exgp_realize_pandl=0;
    v_exgp_intrst_cost_amt=0;
    v_exgp_intrst_pandl=0;
    v_exch_group_update_times=0;
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
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_occur_qty = lpInBizMsg->GetDouble(LDBIZ_OCCUR_QTY_FLOAT);
    v_expire_date = lpInBizMsg->GetInt32(LDBIZ_EXPIRE_DATE_INT);
    v_is_change_exch_group_posi = lpInBizMsg->GetInt32(LDBIZ_IS_CHANGE_EXCH_GROUP_POSI_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    strncpy(v_oper_remark_info, lpInBizMsg->GetString(LDBIZ_OPER_REMARK_INFO_STR),255);
    v_oper_remark_info[255] = '\0';
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);

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


    // [检查报错返回][@变动数量# <= 0][636][@变动数量#]
    if (v_occur_qty <= 0)
    {
        strcpy(v_error_code, "pdsecuL.9.94.636");
        snprintf(v_error_info, sizeof(v_error_info), "%s%018.2f","变动数量=",v_occur_qty);
        iRet = -1;
        goto END;
    }


    // if @是否调整交易组持仓# = 《是否调整交易组持仓-是》 and @交易组编号#<>0 then
    if (v_is_change_exch_group_posi == 1 && v_exch_group_no!=0)
    {

        // set @临时_市场编号# = @市场编号#;
        v_tmp_exch_no = v_exch_no;

        // set @临时_产品编号# = @产品编号#;
        v_tmp_pd_no = v_pd_no;

        // set @市场编号# = 0;
        v_exch_no = 0;

        // set @证券类型# = 0;
        v_stock_type = 0;
        //调用过程[事务_公共_公共接口_检查系统状态权限身份交易组操作权限]
        //组织事务请求
        if(lpTSCall1Ans0)
        {
          lpTSCall1Ans0->FreeMsg();
          lpTSCall1Ans0=NULL;
        }
        lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.4", 0);
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
        lpTSCall1Req0->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpTSCall1Req0->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req0->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
        glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
        if(!lpTSCall1Ans0)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.4]subcall timed out!");
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


        // [检查报错返回][@产品编号# <> @临时_产品编号#][14][@产品编号#,@临时_产品编号#]
        if (v_pd_no != v_tmp_pd_no)
        {
            strcpy(v_error_code, "pdsecuL.9.94.14");
            snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","产品编号=",v_pd_no,"临时_产品编号=",v_pd_no);
            iRet = -1;
            goto END;
        }


        // set @市场编号# = @临时_市场编号#;
        v_exch_no = v_tmp_exch_no;
    }
    // else
    else
    {

        //调用过程[事务_公共_公共接口_检查系统状态权限身份操作员产品操作权限]
        //组织事务请求
        if(lpTSCall1Ans1)
        {
          lpTSCall1Ans1->FreeMsg();
          lpTSCall1Ans1=NULL;
        }
        lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.24.10", 0);
        lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req1->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
        lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpTSCall1Req1->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
        glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
        if(!lpTSCall1Ans1)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.10]subcall timed out!");
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

    // end if;
    }


    // [检查报错返回][@到期日期# < @初始化日期#][260][@到期日期#,@初始化日期#]
    if (v_expire_date < v_init_date)
    {
        strcpy(v_error_code, "pdsecuL.9.94.260");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","到期日期=",v_expire_date,"初始化日期=",v_init_date);
        iRet = -1;
        goto END;
    }


    // set @资产账户状态# = 0;
    strcpy(v_asset_acco_status,"0");
    //调用过程[事务_产品_公共接口_检查资产账户状态]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("prodT.6.2", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetString(LDBIZ_ASSET_ACCO_STATUS_STR,v_asset_acco_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.2]subcall timed out!");
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
    v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);

    //调用过程[事务_产品证券_持仓_冻结资产账户持仓]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdsecuT.3.52", 0);
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
    lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req3->SetDouble(LDBIZ_OCCUR_QTY_FLOAT,v_occur_qty);
    lpTSCall1Req3->SetInt32(LDBIZ_EXPIRE_DATE_INT,v_expire_date);
    lpTSCall1Req3->SetInt32(LDBIZ_IS_CHANGE_EXCH_GROUP_POSI_INT,v_is_change_exch_group_posi);
    lpTSCall1Req3->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_REMARK_INFO_STR,v_oper_remark_info);
    lpTSCall1Req3->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.3.52]subcall timed out!");
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
    v_asac_posi_id = lpTSCall1Ans3->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
    v_asac_stock_type = lpTSCall1Ans3->GetInt32(LDBIZ_ASAC_STOCK_TYPE_INT);
    v_asac_asset_type = lpTSCall1Ans3->GetInt32(LDBIZ_ASAC_ASSET_TYPE_INT);
    v_asac_invest_type = lpTSCall1Ans3->GetInt32(LDBIZ_ASAC_INVEST_TYPE_INT);
    v_asac_begin_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_BEGIN_QTY_FLOAT);
    v_asac_curr_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT);
    v_asac_pre_settle_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_PRE_SETTLE_QTY_FLOAT);
    v_asac_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
    v_asac_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
    v_asac_posi_qty_check_diff = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_POSI_QTY_CHECK_DIFF_FLOAT);
    v_asac_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
    v_asac_realize_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
    v_asac_intrst_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
    v_asac_intrst_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
    v_asac_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_ASAC_UPDATE_TIMES_INT);
    v_exgp_posi_id = lpTSCall1Ans3->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
    v_exch_group_stock_type = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT);
    v_exch_group_asset_type = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT);
    v_exgp_invest_type = lpTSCall1Ans3->GetInt32(LDBIZ_EXGP_INVEST_TYPE_INT);
    v_exch_group_begin_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT);
    v_exgp_curr_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT);
    v_exgp_pre_settle_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT);
    v_exgp_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
    v_exgp_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
    v_exgp_posi_qty_check_diff = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT);
    v_exgp_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
    v_exgp_realize_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
    v_exgp_intrst_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
    v_exgp_intrst_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
    v_exch_group_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_UPDATE_TIMES_INT);


    // if @是否调整交易组持仓# = 《是否调整交易组持仓-是》 then
    if (v_is_change_exch_group_posi == 1)
    {

        // set @更新次数# = @交易组更新次数#;
        v_update_times = v_exch_group_update_times;

        // [主动推送][secu.pdexgpposi][证券主推_产品持仓_交易组持仓主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.80", 0);
        lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT,v_exch_group_stock_type);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT,v_exch_group_asset_type);
        lpPubMsg->SetInt32(LDBIZ_EXGP_INVEST_TYPE_INT,v_exgp_invest_type);
        lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT,v_exch_group_begin_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT,v_exgp_curr_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT,v_exgp_pre_settle_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT,v_exgp_posi_qty_check_diff);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("secu.pdexgpposi", lpPubMsg);

    // end if;
    }


    // set @更新次数# = @资产账户更新次数#;
    v_update_times = v_asac_update_times;

    // [主动推送][secu.pdasacposi][证券主推_产品持仓_资产账户持仓主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.81", 0);
    lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpPubMsg->SetInt32(LDBIZ_ASAC_STOCK_TYPE_INT,v_asac_stock_type);
    lpPubMsg->SetInt32(LDBIZ_ASAC_ASSET_TYPE_INT,v_asac_asset_type);
    lpPubMsg->SetInt32(LDBIZ_ASAC_INVEST_TYPE_INT,v_asac_invest_type);
    lpPubMsg->SetDouble(LDBIZ_ASAC_BEGIN_QTY_FLOAT,v_asac_begin_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT,v_asac_curr_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_PRE_SETTLE_QTY_FLOAT,v_asac_pre_settle_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_POSI_QTY_CHECK_DIFF_FLOAT,v_asac_posi_qty_check_diff);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
    lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("secu.pdasacposi", lpPubMsg);


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

//逻辑_产品证券_持仓运维_解冻资产账户持仓
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
    int v_pd_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    double v_occur_qty;
    int v_is_change_exch_group_posi;
    int v_exch_group_no;
    int v_expire_date;
    char v_oper_remark_info[256];
    int v_co_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_tmp_exch_no;
    int v_tmp_pd_no;
    int v_stock_type;
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_asset_acco_status[3];
    int64 v_asac_posi_id;
    int v_asac_stock_type;
    int v_asac_asset_type;
    int v_asac_invest_type;
    double v_asac_begin_qty;
    double v_asac_curr_qty;
    double v_asac_pre_settle_qty;
    double v_asac_frozen_qty;
    double v_asac_unfroz_qty;
    double v_asac_posi_qty_check_diff;
    double v_asac_cost_amt;
    double v_asac_realize_pandl;
    double v_asac_intrst_cost_amt;
    double v_asac_intrst_pandl;
    int v_asac_update_times;
    int64 v_exgp_posi_id;
    int v_exch_group_stock_type;
    int v_exch_group_asset_type;
    int v_exgp_invest_type;
    double v_exch_group_begin_qty;
    double v_exgp_curr_qty;
    double v_exgp_pre_settle_qty;
    double v_exgp_frozen_qty;
    double v_exgp_unfroz_qty;
    double v_exgp_posi_qty_check_diff;
    double v_exgp_cost_amt;
    double v_exgp_realize_pandl;
    double v_exgp_intrst_cost_amt;
    double v_exgp_intrst_pandl;
    int v_exch_group_update_times;
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
    v_pd_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_occur_qty=0;
    v_is_change_exch_group_posi=0;
    v_exch_group_no=0;
    v_expire_date=0;
    strcpy(v_oper_remark_info, " ");
    v_co_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_tmp_exch_no=0;
    v_tmp_pd_no=0;
    v_stock_type=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_asset_acco_status, "0");
    v_asac_posi_id=0;
    v_asac_stock_type=0;
    v_asac_asset_type=0;
    v_asac_invest_type=0;
    v_asac_begin_qty=0;
    v_asac_curr_qty=0;
    v_asac_pre_settle_qty=0;
    v_asac_frozen_qty=0;
    v_asac_unfroz_qty=0;
    v_asac_posi_qty_check_diff=0;
    v_asac_cost_amt=0;
    v_asac_realize_pandl=0;
    v_asac_intrst_cost_amt=0;
    v_asac_intrst_pandl=0;
    v_asac_update_times=0;
    v_exgp_posi_id=0;
    v_exch_group_stock_type=0;
    v_exch_group_asset_type=0;
    v_exgp_invest_type=0;
    v_exch_group_begin_qty=0;
    v_exgp_curr_qty=0;
    v_exgp_pre_settle_qty=0;
    v_exgp_frozen_qty=0;
    v_exgp_unfroz_qty=0;
    v_exgp_posi_qty_check_diff=0;
    v_exgp_cost_amt=0;
    v_exgp_realize_pandl=0;
    v_exgp_intrst_cost_amt=0;
    v_exgp_intrst_pandl=0;
    v_exch_group_update_times=0;
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
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_stock_code_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_occur_qty = lpInBizMsg->GetDouble(LDBIZ_OCCUR_QTY_FLOAT);
    v_is_change_exch_group_posi = lpInBizMsg->GetInt32(LDBIZ_IS_CHANGE_EXCH_GROUP_POSI_INT);
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_expire_date = lpInBizMsg->GetInt32(LDBIZ_EXPIRE_DATE_INT);
    strncpy(v_oper_remark_info, lpInBizMsg->GetString(LDBIZ_OPER_REMARK_INFO_STR),255);
    v_oper_remark_info[255] = '\0';
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);

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


    // [检查报错返回][@变动数量# <= 0][636][@变动数量#]
    if (v_occur_qty <= 0)
    {
        strcpy(v_error_code, "pdsecuL.9.95.636");
        snprintf(v_error_info, sizeof(v_error_info), "%s%018.2f","变动数量=",v_occur_qty);
        iRet = -1;
        goto END;
    }


    // if @是否调整交易组持仓# = 《是否调整交易组持仓-是》 and @交易组编号#<>0 then
    if (v_is_change_exch_group_posi == 1 && v_exch_group_no!=0)
    {

        // set @临时_市场编号# = @市场编号#;
        v_tmp_exch_no = v_exch_no;

        // set @临时_产品编号# = @产品编号#;
        v_tmp_pd_no = v_pd_no;

        // set @市场编号# = 0;
        v_exch_no = 0;

        // set @证券类型# = 0;
        v_stock_type = 0;
        //调用过程[事务_公共_公共接口_检查系统状态权限身份交易组操作权限]
        //组织事务请求
        if(lpTSCall1Ans0)
        {
          lpTSCall1Ans0->FreeMsg();
          lpTSCall1Ans0=NULL;
        }
        lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.4", 0);
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
        lpTSCall1Req0->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpTSCall1Req0->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req0->SetInt32(LDBIZ_STOCK_TYPE_INT,v_stock_type);
        lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
        glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
        if(!lpTSCall1Ans0)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.4]subcall timed out!");
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


        // [检查报错返回][@产品编号# <> @临时_产品编号#][14][@产品编号#,@临时_产品编号#]
        if (v_pd_no != v_tmp_pd_no)
        {
            strcpy(v_error_code, "pdsecuL.9.95.14");
            snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","产品编号=",v_pd_no,"临时_产品编号=",v_pd_no);
            iRet = -1;
            goto END;
        }


        // set @市场编号# = @临时_市场编号#;
        v_exch_no = v_tmp_exch_no;
    }
    // else
    else
    {

        //调用过程[事务_公共_公共接口_检查系统状态权限身份操作员产品操作权限]
        //组织事务请求
        if(lpTSCall1Ans1)
        {
          lpTSCall1Ans1->FreeMsg();
          lpTSCall1Ans1=NULL;
        }
        lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.24.10", 0);
        lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req1->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
        lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpTSCall1Req1->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
        glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
        if(!lpTSCall1Ans1)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.10]subcall timed out!");
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

    // end if;
    }


    // [检查报错返回][@到期日期# < @初始化日期#][260][@到期日期#,@初始化日期#]
    if (v_expire_date < v_init_date)
    {
        strcpy(v_error_code, "pdsecuL.9.95.260");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d%s%d","到期日期=",v_expire_date,"初始化日期=",v_init_date);
        iRet = -1;
        goto END;
    }


    // set @资产账户状态# = 0;
    strcpy(v_asset_acco_status,"0");
    //调用过程[事务_产品_公共接口_检查资产账户状态]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("prodT.6.2", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetString(LDBIZ_ASSET_ACCO_STATUS_STR,v_asset_acco_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.2]subcall timed out!");
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
    v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);

    //调用过程[事务_产品证券_持仓_解冻资产账户持仓]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdsecuT.3.54", 0);
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
    lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req3->SetDouble(LDBIZ_OCCUR_QTY_FLOAT,v_occur_qty);
    lpTSCall1Req3->SetInt32(LDBIZ_EXPIRE_DATE_INT,v_expire_date);
    lpTSCall1Req3->SetInt32(LDBIZ_IS_CHANGE_EXCH_GROUP_POSI_INT,v_is_change_exch_group_posi);
    lpTSCall1Req3->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_REMARK_INFO_STR,v_oper_remark_info);
    lpTSCall1Req3->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.3.54]subcall timed out!");
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
    v_asac_posi_id = lpTSCall1Ans3->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
    v_asac_stock_type = lpTSCall1Ans3->GetInt32(LDBIZ_ASAC_STOCK_TYPE_INT);
    v_asac_asset_type = lpTSCall1Ans3->GetInt32(LDBIZ_ASAC_ASSET_TYPE_INT);
    v_asac_invest_type = lpTSCall1Ans3->GetInt32(LDBIZ_ASAC_INVEST_TYPE_INT);
    v_asac_begin_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_BEGIN_QTY_FLOAT);
    v_asac_curr_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT);
    v_asac_pre_settle_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_PRE_SETTLE_QTY_FLOAT);
    v_asac_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
    v_asac_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
    v_asac_posi_qty_check_diff = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_POSI_QTY_CHECK_DIFF_FLOAT);
    v_asac_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
    v_asac_realize_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
    v_asac_intrst_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
    v_asac_intrst_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
    v_asac_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_ASAC_UPDATE_TIMES_INT);
    v_exgp_posi_id = lpTSCall1Ans3->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
    v_exch_group_stock_type = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT);
    v_exch_group_asset_type = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT);
    v_exgp_invest_type = lpTSCall1Ans3->GetInt32(LDBIZ_EXGP_INVEST_TYPE_INT);
    v_exch_group_begin_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT);
    v_exgp_curr_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT);
    v_exgp_pre_settle_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT);
    v_exgp_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
    v_exgp_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
    v_exgp_posi_qty_check_diff = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT);
    v_exgp_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
    v_exgp_realize_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
    v_exgp_intrst_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
    v_exgp_intrst_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
    v_exch_group_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_UPDATE_TIMES_INT);


    // if @是否调整交易组持仓# = 《是否调整交易组持仓-是》 then
    if (v_is_change_exch_group_posi == 1)
    {

        // set @更新次数# = @交易组更新次数#;
        v_update_times = v_exch_group_update_times;

        // [主动推送][secu.pdexgpposi][证券主推_产品持仓_交易组持仓主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.80", 0);
        lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT,v_exch_group_stock_type);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT,v_exch_group_asset_type);
        lpPubMsg->SetInt32(LDBIZ_EXGP_INVEST_TYPE_INT,v_exgp_invest_type);
        lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT,v_exch_group_begin_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT,v_exgp_curr_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT,v_exgp_pre_settle_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT,v_exgp_posi_qty_check_diff);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("secu.pdexgpposi", lpPubMsg);

    // end if;
    }


    // set @更新次数# = @资产账户更新次数#;
    v_update_times = v_asac_update_times;

    // [主动推送][secu.pdasacposi][证券主推_产品持仓_资产账户持仓主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.81", 0);
    lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpPubMsg->SetInt32(LDBIZ_ASAC_STOCK_TYPE_INT,v_asac_stock_type);
    lpPubMsg->SetInt32(LDBIZ_ASAC_ASSET_TYPE_INT,v_asac_asset_type);
    lpPubMsg->SetInt32(LDBIZ_ASAC_INVEST_TYPE_INT,v_asac_invest_type);
    lpPubMsg->SetDouble(LDBIZ_ASAC_BEGIN_QTY_FLOAT,v_asac_begin_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT,v_asac_curr_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_PRE_SETTLE_QTY_FLOAT,v_asac_pre_settle_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_POSI_QTY_CHECK_DIFF_FLOAT,v_asac_posi_qty_check_diff);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
    lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("secu.pdasacposi", lpPubMsg);


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

//逻辑_产品证券_持仓运维_查询资产账户持仓冻结解冻流水
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
    int v_pd_no;
    int v_asset_acco_no;
    char v_exch_no_str[2049];
    int v_stock_acco_no;
    char v_stock_code_no_str[4097];
    int v_frozen_type;
    char v_jour_status[3];
    int64 v_row_id;
    int v_row_count;
    int v_co_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_create_date;
    int v_create_time;
    int v_update_date;
    int v_update_time;
    int v_oper_menu_no;
    char v_oper_func_code[17];
    int v_init_date;
    int v_exch_no;
    int v_stock_code_no;
    double v_occur_qty;
    int v_expire_date;
    char v_oper_remark_info[256];
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
    v_pd_no=0;
    v_asset_acco_no=0;
    strcpy(v_exch_no_str, " ");
    v_stock_acco_no=0;
    strcpy(v_stock_code_no_str, " ");
    v_frozen_type=0;
    strcpy(v_jour_status, "0");
    v_row_id=0;
    v_row_count=-1;
    v_co_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_create_date=0;
    v_create_time=0;
    v_update_date=0;
    v_update_time=0;
    v_oper_menu_no=0;
    strcpy(v_oper_func_code, " ");
    v_init_date=0;
    v_exch_no=0;
    v_stock_code_no=0;
    v_occur_qty=0;
    v_expire_date=0;
    strcpy(v_oper_remark_info, " ");
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
    v_pd_no = lpInBizMsg->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpInBizMsg->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    strncpy(v_exch_no_str, lpInBizMsg->GetString(LDBIZ_EXCH_NO_STR_STR),2048);
    v_exch_no_str[2048] = '\0';
    v_stock_acco_no = lpInBizMsg->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    strncpy(v_stock_code_no_str, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_NO_STR_STR),4096);
    v_stock_code_no_str[4096] = '\0';
    v_frozen_type = lpInBizMsg->GetInt32(LDBIZ_FROZEN_TYPE_INT);
    strncpy(v_jour_status, lpInBizMsg->GetString(LDBIZ_JOUR_STATUS_STR),2);
    v_jour_status[2] = '\0';
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    v_row_count = lpInBizMsg->GetInt32(LDBIZ_ROW_COUNT_INT);
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;
    IFastMessage* lpTSCall1Req2 = NULL;
    IFastMessage* lpTSCall1Ans2 = NULL;


    // set @业务控制串# = "010";
    strcpy(v_busi_ctrl_str,"010");
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


    // if @操作员机构编号# = 9999 then
    if (v_opor_co_no == 9999)
    {

    // set @产品编号权限串# = " ";
    strcpy(v_pd_no_rights_str," ");
    // end if;
    }

    //调用过程[事务_产品证券_持仓_查询资产账户持仓冻结解冻流水]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.3.84", 0);
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
    lpTSCall1Req1->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_EXCH_NO_STR_STR,v_exch_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req1->SetString(LDBIZ_STOCK_CODE_NO_STR_STR,v_stock_code_no_str);
    lpTSCall1Req1->SetInt32(LDBIZ_FROZEN_TYPE_INT,v_frozen_type);
    lpTSCall1Req1->SetString(LDBIZ_JOUR_STATUS_STR,v_jour_status);
    lpTSCall1Req1->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req1->SetInt32(LDBIZ_ROW_COUNT_INT,v_row_count);
    lpTSCall1Req1->SetString(LDBIZ_PD_NO_RIGHTS_STR_STR,v_pd_no_rights_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.3.84]subcall timed out!");
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

//逻辑_产品证券_持仓运维_取消冻结资产账户持仓
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
    int64 v_row_id;
    char v_oper_remark_info[256];
    int v_co_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_oper_func_code[17];
    int v_pd_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    int v_frozen_type;
    char v_jour_status[3];
    double v_occur_qty;
    int v_expire_date;
    int v_is_change_exch_group_posi;
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_asset_acco_status[3];
    int64 v_asac_posi_id;
    int v_asac_stock_type;
    int v_asac_asset_type;
    int v_asac_invest_type;
    double v_asac_begin_qty;
    double v_asac_curr_qty;
    double v_asac_pre_settle_qty;
    double v_asac_frozen_qty;
    double v_asac_unfroz_qty;
    double v_asac_posi_qty_check_diff;
    double v_asac_cost_amt;
    double v_asac_realize_pandl;
    double v_asac_intrst_cost_amt;
    double v_asac_intrst_pandl;
    int v_asac_update_times;
    int v_exch_group_no;
    int64 v_exgp_posi_id;
    int v_exch_group_stock_type;
    int v_exch_group_asset_type;
    int v_exgp_invest_type;
    double v_exch_group_begin_qty;
    double v_exgp_curr_qty;
    double v_exgp_pre_settle_qty;
    double v_exgp_frozen_qty;
    double v_exgp_unfroz_qty;
    double v_exgp_posi_qty_check_diff;
    double v_exgp_cost_amt;
    double v_exgp_realize_pandl;
    double v_exgp_intrst_cost_amt;
    double v_exgp_intrst_pandl;
    int v_exch_group_update_times;
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
    v_row_id=0;
    strcpy(v_oper_remark_info, " ");
    v_co_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_oper_func_code, " ");
    v_pd_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_frozen_type=0;
    strcpy(v_jour_status, "0");
    v_occur_qty=0;
    v_expire_date=0;
    v_is_change_exch_group_posi=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_asset_acco_status, "0");
    v_asac_posi_id=0;
    v_asac_stock_type=0;
    v_asac_asset_type=0;
    v_asac_invest_type=0;
    v_asac_begin_qty=0;
    v_asac_curr_qty=0;
    v_asac_pre_settle_qty=0;
    v_asac_frozen_qty=0;
    v_asac_unfroz_qty=0;
    v_asac_posi_qty_check_diff=0;
    v_asac_cost_amt=0;
    v_asac_realize_pandl=0;
    v_asac_intrst_cost_amt=0;
    v_asac_intrst_pandl=0;
    v_asac_update_times=0;
    v_exch_group_no=0;
    v_exgp_posi_id=0;
    v_exch_group_stock_type=0;
    v_exch_group_asset_type=0;
    v_exgp_invest_type=0;
    v_exch_group_begin_qty=0;
    v_exgp_curr_qty=0;
    v_exgp_pre_settle_qty=0;
    v_exgp_frozen_qty=0;
    v_exgp_unfroz_qty=0;
    v_exgp_posi_qty_check_diff=0;
    v_exgp_cost_amt=0;
    v_exgp_realize_pandl=0;
    v_exgp_intrst_cost_amt=0;
    v_exgp_intrst_pandl=0;
    v_exch_group_update_times=0;
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
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    strncpy(v_oper_remark_info, lpInBizMsg->GetString(LDBIZ_OPER_REMARK_INFO_STR),255);
    v_oper_remark_info[255] = '\0';
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);

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

    //调用过程[事务_产品证券_持仓_获取资产账户持仓冻结解冻流水]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pdsecuT.3.83", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.3.83]subcall timed out!");
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
    strcpy(v_oper_func_code, lpTSCall1Ans0->GetString(LDBIZ_OPER_FUNC_CODE_STR));
    v_co_no = lpTSCall1Ans0->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans0->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_stock_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_frozen_type = lpTSCall1Ans0->GetInt32(LDBIZ_FROZEN_TYPE_INT);
    strcpy(v_jour_status, lpTSCall1Ans0->GetString(LDBIZ_JOUR_STATUS_STR));
    v_occur_qty = lpTSCall1Ans0->GetDouble(LDBIZ_OCCUR_QTY_FLOAT);
    v_expire_date = lpTSCall1Ans0->GetInt32(LDBIZ_EXPIRE_DATE_INT);
    v_is_change_exch_group_posi = lpTSCall1Ans0->GetInt32(LDBIZ_IS_CHANGE_EXCH_GROUP_POSI_INT);


    // [检查报错返回][@冻结解冻类型# <> 《冻结解冻类型-冻结》][251][@冻结解冻类型#]
    if (v_frozen_type != 1)
    {
        strcpy(v_error_code, "pdsecuL.9.97.251");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d","冻结解冻类型=",v_frozen_type);
        iRet = -1;
        goto END;
    }


    // [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#]
    if (strcmp(v_jour_status , "1")!=0)
    {
        strcpy(v_error_code, "pdsecuL.9.97.253");
        snprintf(v_error_info, sizeof(v_error_info), "%s%s","流水状态=",v_jour_status);
        iRet = -1;
        goto END;
    }

    //调用过程[事务_公共_公共接口_检查系统状态权限身份操作员产品操作权限]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.24.10", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.10]subcall timed out!");
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


    // set @资产账户状态# = 0;
    strcpy(v_asset_acco_status,"0");
    //调用过程[事务_产品_公共接口_检查资产账户状态]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("prodT.6.2", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetString(LDBIZ_ASSET_ACCO_STATUS_STR,v_asset_acco_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.2]subcall timed out!");
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
    v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);

    //调用过程[事务_产品证券_持仓_取消冻结资产账户持仓]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdsecuT.3.53", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req3->SetDouble(LDBIZ_OCCUR_QTY_FLOAT,v_occur_qty);
    lpTSCall1Req3->SetInt32(LDBIZ_FROZEN_TYPE_INT,v_frozen_type);
    lpTSCall1Req3->SetInt32(LDBIZ_IS_CHANGE_EXCH_GROUP_POSI_INT,v_is_change_exch_group_posi);
    lpTSCall1Req3->SetString(LDBIZ_OPER_REMARK_INFO_STR,v_oper_remark_info);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.3.53]subcall timed out!");
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
    v_asac_posi_id = lpTSCall1Ans3->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
    v_asac_stock_type = lpTSCall1Ans3->GetInt32(LDBIZ_ASAC_STOCK_TYPE_INT);
    v_asac_asset_type = lpTSCall1Ans3->GetInt32(LDBIZ_ASAC_ASSET_TYPE_INT);
    v_asac_invest_type = lpTSCall1Ans3->GetInt32(LDBIZ_ASAC_INVEST_TYPE_INT);
    v_asac_begin_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_BEGIN_QTY_FLOAT);
    v_asac_curr_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT);
    v_asac_pre_settle_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_PRE_SETTLE_QTY_FLOAT);
    v_asac_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
    v_asac_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
    v_asac_posi_qty_check_diff = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_POSI_QTY_CHECK_DIFF_FLOAT);
    v_asac_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
    v_asac_realize_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
    v_asac_intrst_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
    v_asac_intrst_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
    v_asac_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_ASAC_UPDATE_TIMES_INT);
    v_exch_group_no = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_exgp_posi_id = lpTSCall1Ans3->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
    v_exch_group_stock_type = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT);
    v_exch_group_asset_type = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT);
    v_exgp_invest_type = lpTSCall1Ans3->GetInt32(LDBIZ_EXGP_INVEST_TYPE_INT);
    v_exch_group_begin_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT);
    v_exgp_curr_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT);
    v_exgp_pre_settle_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT);
    v_exgp_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
    v_exgp_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
    v_exgp_posi_qty_check_diff = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT);
    v_exgp_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
    v_exgp_realize_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
    v_exgp_intrst_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
    v_exgp_intrst_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
    v_exch_group_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_UPDATE_TIMES_INT);


    // if @是否调整交易组持仓# = 《是否调整交易组持仓-是》 then
    if (v_is_change_exch_group_posi == 1)
    {

        // set @更新次数# = @交易组更新次数#;
        v_update_times = v_exch_group_update_times;

        // [主动推送][secu.pdexgpposi][证券主推_产品持仓_交易组持仓主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.80", 0);
        lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT,v_exch_group_stock_type);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT,v_exch_group_asset_type);
        lpPubMsg->SetInt32(LDBIZ_EXGP_INVEST_TYPE_INT,v_exgp_invest_type);
        lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT,v_exch_group_begin_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT,v_exgp_curr_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT,v_exgp_pre_settle_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT,v_exgp_posi_qty_check_diff);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("secu.pdexgpposi", lpPubMsg);

    // end if;
    }


    // set @更新次数# = @资产账户更新次数#;
    v_update_times = v_asac_update_times;

    // [主动推送][secu.pdasacposi][证券主推_产品持仓_资产账户持仓主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.81", 0);
    lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpPubMsg->SetInt32(LDBIZ_ASAC_STOCK_TYPE_INT,v_asac_stock_type);
    lpPubMsg->SetInt32(LDBIZ_ASAC_ASSET_TYPE_INT,v_asac_asset_type);
    lpPubMsg->SetInt32(LDBIZ_ASAC_INVEST_TYPE_INT,v_asac_invest_type);
    lpPubMsg->SetDouble(LDBIZ_ASAC_BEGIN_QTY_FLOAT,v_asac_begin_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT,v_asac_curr_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_PRE_SETTLE_QTY_FLOAT,v_asac_pre_settle_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_POSI_QTY_CHECK_DIFF_FLOAT,v_asac_posi_qty_check_diff);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
    lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("secu.pdasacposi", lpPubMsg);


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

//逻辑_产品证券_持仓运维_取消解冻资产账户持仓
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
    char v_oper_remark_info[256];
    int v_co_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_oper_func_code[17];
    int v_pd_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    int v_frozen_type;
    char v_jour_status[3];
    double v_occur_qty;
    int v_expire_date;
    int v_is_change_exch_group_posi;
    int v_init_date;
    char v_co_busi_config_str[65];
    char v_asset_acco_status[3];
    int64 v_asac_posi_id;
    int v_asac_stock_type;
    int v_asac_asset_type;
    int v_asac_invest_type;
    double v_asac_begin_qty;
    double v_asac_curr_qty;
    double v_asac_pre_settle_qty;
    double v_asac_frozen_qty;
    double v_asac_unfroz_qty;
    double v_asac_posi_qty_check_diff;
    double v_asac_cost_amt;
    double v_asac_realize_pandl;
    double v_asac_intrst_cost_amt;
    double v_asac_intrst_pandl;
    int v_asac_update_times;
    int v_exch_group_no;
    int64 v_exgp_posi_id;
    int v_exch_group_stock_type;
    int v_exch_group_asset_type;
    int v_exgp_invest_type;
    double v_exch_group_begin_qty;
    double v_exgp_curr_qty;
    double v_exgp_pre_settle_qty;
    double v_exgp_frozen_qty;
    double v_exgp_unfroz_qty;
    double v_exgp_posi_qty_check_diff;
    double v_exgp_cost_amt;
    double v_exgp_realize_pandl;
    double v_exgp_intrst_cost_amt;
    double v_exgp_intrst_pandl;
    int v_exch_group_update_times;
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
    v_row_id=0;
    strcpy(v_oper_remark_info, " ");
    v_co_no=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_oper_func_code, " ");
    v_pd_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_frozen_type=0;
    strcpy(v_jour_status, "0");
    v_occur_qty=0;
    v_expire_date=0;
    v_is_change_exch_group_posi=0;
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    strcpy(v_asset_acco_status, "0");
    v_asac_posi_id=0;
    v_asac_stock_type=0;
    v_asac_asset_type=0;
    v_asac_invest_type=0;
    v_asac_begin_qty=0;
    v_asac_curr_qty=0;
    v_asac_pre_settle_qty=0;
    v_asac_frozen_qty=0;
    v_asac_unfroz_qty=0;
    v_asac_posi_qty_check_diff=0;
    v_asac_cost_amt=0;
    v_asac_realize_pandl=0;
    v_asac_intrst_cost_amt=0;
    v_asac_intrst_pandl=0;
    v_asac_update_times=0;
    v_exch_group_no=0;
    v_exgp_posi_id=0;
    v_exch_group_stock_type=0;
    v_exch_group_asset_type=0;
    v_exgp_invest_type=0;
    v_exch_group_begin_qty=0;
    v_exgp_curr_qty=0;
    v_exgp_pre_settle_qty=0;
    v_exgp_frozen_qty=0;
    v_exgp_unfroz_qty=0;
    v_exgp_posi_qty_check_diff=0;
    v_exgp_cost_amt=0;
    v_exgp_realize_pandl=0;
    v_exgp_intrst_cost_amt=0;
    v_exgp_intrst_pandl=0;
    v_exch_group_update_times=0;
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
    v_row_id = lpInBizMsg->GetInt64(LDBIZ_ROW_ID_INT64);
    strncpy(v_oper_remark_info, lpInBizMsg->GetString(LDBIZ_OPER_REMARK_INFO_STR),255);
    v_oper_remark_info[255] = '\0';
    v_co_no = lpInBizMsg->GetInt32(LDBIZ_CO_NO_INT);

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

    //调用过程[事务_产品证券_持仓_获取资产账户持仓冻结解冻流水]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pdsecuT.3.83", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.3.83]subcall timed out!");
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
    strcpy(v_oper_func_code, lpTSCall1Ans0->GetString(LDBIZ_OPER_FUNC_CODE_STR));
    v_co_no = lpTSCall1Ans0->GetInt32(LDBIZ_CO_NO_INT);
    v_pd_no = lpTSCall1Ans0->GetInt32(LDBIZ_PD_NO_INT);
    v_asset_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
    v_exch_no = lpTSCall1Ans0->GetInt32(LDBIZ_EXCH_NO_INT);
    v_stock_acco_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
    v_stock_code_no = lpTSCall1Ans0->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
    v_frozen_type = lpTSCall1Ans0->GetInt32(LDBIZ_FROZEN_TYPE_INT);
    strcpy(v_jour_status, lpTSCall1Ans0->GetString(LDBIZ_JOUR_STATUS_STR));
    v_occur_qty = lpTSCall1Ans0->GetDouble(LDBIZ_OCCUR_QTY_FLOAT);
    v_expire_date = lpTSCall1Ans0->GetInt32(LDBIZ_EXPIRE_DATE_INT);
    v_is_change_exch_group_posi = lpTSCall1Ans0->GetInt32(LDBIZ_IS_CHANGE_EXCH_GROUP_POSI_INT);


    // [检查报错返回][@冻结解冻类型# <> 《冻结解冻类型-解冻》][251][@冻结解冻类型#]
    if (v_frozen_type != 2)
    {
        strcpy(v_error_code, "pdsecuL.9.98.251");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d","冻结解冻类型=",v_frozen_type);
        iRet = -1;
        goto END;
    }


    // [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#]
    if (strcmp(v_jour_status , "1")!=0)
    {
        strcpy(v_error_code, "pdsecuL.9.98.253");
        snprintf(v_error_info, sizeof(v_error_info), "%s%s","流水状态=",v_jour_status);
        iRet = -1;
        goto END;
    }

    //调用过程[事务_公共_公共接口_检查系统状态权限身份操作员产品操作权限]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pubT.24.10", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.10]subcall timed out!");
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


    // set @资产账户状态# = 0;
    strcpy(v_asset_acco_status,"0");
    //调用过程[事务_产品_公共接口_检查资产账户状态]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("prodT.6.2", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req2->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req2->SetString(LDBIZ_ASSET_ACCO_STATUS_STR,v_asset_acco_status);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.2]subcall timed out!");
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
    v_co_no = lpTSCall1Ans2->GetInt32(LDBIZ_CO_NO_INT);

    //调用过程[事务_产品证券_持仓_取消解冻资产账户持仓]
    //组织事务请求
    if(lpTSCall1Ans3)
    {
      lpTSCall1Ans3->FreeMsg();
      lpTSCall1Ans3=NULL;
    }
    lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdsecuT.3.55", 0);
    lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req3->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpTSCall1Req3->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpTSCall1Req3->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpTSCall1Req3->SetDouble(LDBIZ_OCCUR_QTY_FLOAT,v_occur_qty);
    lpTSCall1Req3->SetInt32(LDBIZ_FROZEN_TYPE_INT,v_frozen_type);
    lpTSCall1Req3->SetInt32(LDBIZ_IS_CHANGE_EXCH_GROUP_POSI_INT,v_is_change_exch_group_posi);
    lpTSCall1Req3->SetString(LDBIZ_OPER_REMARK_INFO_STR,v_oper_remark_info);
    glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
    if(!lpTSCall1Ans3)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.3.55]subcall timed out!");
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
    v_asac_posi_id = lpTSCall1Ans3->GetInt64(LDBIZ_ASAC_POSI_ID_INT64);
    v_asac_stock_type = lpTSCall1Ans3->GetInt32(LDBIZ_ASAC_STOCK_TYPE_INT);
    v_asac_asset_type = lpTSCall1Ans3->GetInt32(LDBIZ_ASAC_ASSET_TYPE_INT);
    v_asac_invest_type = lpTSCall1Ans3->GetInt32(LDBIZ_ASAC_INVEST_TYPE_INT);
    v_asac_begin_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_BEGIN_QTY_FLOAT);
    v_asac_curr_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT);
    v_asac_pre_settle_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_PRE_SETTLE_QTY_FLOAT);
    v_asac_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT);
    v_asac_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT);
    v_asac_posi_qty_check_diff = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_POSI_QTY_CHECK_DIFF_FLOAT);
    v_asac_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_COST_AMT_FLOAT);
    v_asac_realize_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT);
    v_asac_intrst_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT);
    v_asac_intrst_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT);
    v_asac_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_ASAC_UPDATE_TIMES_INT);
    v_exch_group_no = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_exgp_posi_id = lpTSCall1Ans3->GetInt64(LDBIZ_EXGP_POSI_ID_INT64);
    v_exch_group_stock_type = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT);
    v_exch_group_asset_type = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT);
    v_exgp_invest_type = lpTSCall1Ans3->GetInt32(LDBIZ_EXGP_INVEST_TYPE_INT);
    v_exch_group_begin_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT);
    v_exgp_curr_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT);
    v_exgp_pre_settle_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT);
    v_exgp_frozen_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT);
    v_exgp_unfroz_qty = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT);
    v_exgp_posi_qty_check_diff = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT);
    v_exgp_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_COST_AMT_FLOAT);
    v_exgp_realize_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT);
    v_exgp_intrst_cost_amt = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT);
    v_exgp_intrst_pandl = lpTSCall1Ans3->GetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT);
    v_exch_group_update_times = lpTSCall1Ans3->GetInt32(LDBIZ_EXCH_GROUP_UPDATE_TIMES_INT);


    // if @是否调整交易组持仓# = 《是否调整交易组持仓-是》 then
    if (v_is_change_exch_group_posi == 1)
    {

        // set @更新次数# = @交易组更新次数#;
        v_update_times = v_exch_group_update_times;

        // [主动推送][secu.pdexgpposi][证券主推_产品持仓_交易组持仓主推消息]
        lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.80", 0);
        lpPubMsg->SetInt64(LDBIZ_EXGP_POSI_ID_INT64,v_exgp_posi_id);
        lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
        lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_STOCK_TYPE_INT,v_exch_group_stock_type);
        lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_ASSET_TYPE_INT,v_exch_group_asset_type);
        lpPubMsg->SetInt32(LDBIZ_EXGP_INVEST_TYPE_INT,v_exgp_invest_type);
        lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_BEGIN_QTY_FLOAT,v_exch_group_begin_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_CURR_QTY_FLOAT,v_exgp_curr_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_PRE_SETTLE_QTY_FLOAT,v_exgp_pre_settle_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_FROZEN_QTY_FLOAT,v_exgp_frozen_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_UNFROZ_QTY_FLOAT,v_exgp_unfroz_qty);
        lpPubMsg->SetDouble(LDBIZ_EXGP_POSI_QTY_CHECK_DIFF_FLOAT,v_exgp_posi_qty_check_diff);
        lpPubMsg->SetDouble(LDBIZ_EXGP_COST_AMT_FLOAT,v_exgp_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_REALIZE_PANDL_FLOAT,v_exgp_realize_pandl);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_COST_AMT_FLOAT,v_exgp_intrst_cost_amt);
        lpPubMsg->SetDouble(LDBIZ_EXGP_INTRST_PANDL_FLOAT,v_exgp_intrst_pandl);
        lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
        glpPubSub_Interface->PubTopics("secu.pdexgpposi", lpPubMsg);

    // end if;
    }


    // set @更新次数# = @资产账户更新次数#;
    v_update_times = v_asac_update_times;

    // [主动推送][secu.pdasacposi][证券主推_产品持仓_资产账户持仓主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.81", 0);
    lpPubMsg->SetInt64(LDBIZ_ASAC_POSI_ID_INT64,v_asac_posi_id);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
    lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
    lpPubMsg->SetInt32(LDBIZ_ASAC_STOCK_TYPE_INT,v_asac_stock_type);
    lpPubMsg->SetInt32(LDBIZ_ASAC_ASSET_TYPE_INT,v_asac_asset_type);
    lpPubMsg->SetInt32(LDBIZ_ASAC_INVEST_TYPE_INT,v_asac_invest_type);
    lpPubMsg->SetDouble(LDBIZ_ASAC_BEGIN_QTY_FLOAT,v_asac_begin_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_CURR_QTY_FLOAT,v_asac_curr_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_PRE_SETTLE_QTY_FLOAT,v_asac_pre_settle_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_FROZEN_QTY_FLOAT,v_asac_frozen_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_UNFROZ_QTY_FLOAT,v_asac_unfroz_qty);
    lpPubMsg->SetDouble(LDBIZ_ASAC_POSI_QTY_CHECK_DIFF_FLOAT,v_asac_posi_qty_check_diff);
    lpPubMsg->SetDouble(LDBIZ_ASAC_COST_AMT_FLOAT,v_asac_cost_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_REALIZE_PANDL_FLOAT,v_asac_realize_pandl);
    lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_COST_AMT_FLOAT,v_asac_intrst_cost_amt);
    lpPubMsg->SetDouble(LDBIZ_ASAC_INTRST_PANDL_FLOAT,v_asac_intrst_pandl);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("secu.pdasacposi", lpPubMsg);


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

