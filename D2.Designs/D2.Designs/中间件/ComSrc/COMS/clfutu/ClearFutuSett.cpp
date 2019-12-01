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
        strcpy(bizFuncInfo->szFuncName, "clfutuL.3.31");
        bizFuncInfo->lpFunc = fnFunc0;
    }
    else if (iFunIndex==1)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.3.45");
        bizFuncInfo->lpFunc = fnFunc1;
    }
    else if (iFunIndex==2)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.3.46");
        bizFuncInfo->lpFunc = fnFunc2;
    }
    else if (iFunIndex==3)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.3.47");
        bizFuncInfo->lpFunc = fnFunc3;
    }
    else if (iFunIndex==4)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.3.105");
        bizFuncInfo->lpFunc = fnFunc4;
    }
    else if (iFunIndex==5)
    {
        strcpy(bizFuncInfo->szFuncName, "clfutuL.3.104");
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
    return "20190709";
}

//逻辑_清算期货_结算_结算处理
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
    int v_qry_no;
    int v_deliv_flag;
    int64 v_row_id;
    int v_co_no;
    int v_pd_no;
    int v_exch_group_no;
    int v_futu_acco_no;
    int v_pass_no;
    int v_asset_acco_no;
    int v_exch_no;
    int v_contrc_code_no;
    int v_contrc_type;
    double v_curr_qty;
    int v_lngsht_type;
    int v_hedge_type;
    int v_margin_pref;
    char v_comb_code[7];
    char v_contrc_code[7];
    char v_contrc_name[65];
    int v_contrc_unit;
    int v_capit_reback_days;
    int v_posi_reback_days;
    int v_expire_date;
    int v_begin_deli_date;
    int v_end_deli_date;
    double v_deli_price;
    int v_comb_type;
    char v_comb_name[65];
    double v_sett_price;
    double v_pre_settle_price;
    char v_deal_info[256];
    double v_fee_qty;
    double v_fee_price;
    int v_contrc_dir;
    int v_order_dir;
    char v_crncy_type[4];
    char v_exch_crncy_type[4];
    double v_exch_rate;
    double v_rece_margin;
    double v_out_rece_margin;
    char v_remark_info[256];
    char v_out_acco[33];
    double v_posi_amt;
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
    v_qry_no=0;
    v_deliv_flag=0;
    v_row_id=0;
    v_co_no=0;
    v_pd_no=0;
    v_exch_group_no=0;
    v_futu_acco_no=0;
    v_pass_no=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_contrc_code_no=0;
    v_contrc_type=0;
    v_curr_qty=0;
    v_lngsht_type=0;
    v_hedge_type=0;
    v_margin_pref=0;
    strcpy(v_comb_code, " ");
    strcpy(v_contrc_code, " ");
    strcpy(v_contrc_name, " ");
    v_contrc_unit=0;
    v_capit_reback_days=0;
    v_posi_reback_days=0;
    v_expire_date=0;
    v_begin_deli_date=0;
    v_end_deli_date=0;
    v_deli_price=0;
    v_comb_type=0;
    strcpy(v_comb_name, " ");
    v_sett_price=0;
    v_pre_settle_price=0;
    strcpy(v_deal_info, " ");
    v_fee_qty=0;
    v_fee_price=0;
    v_contrc_dir=0;
    v_order_dir=0;
    strcpy(v_crncy_type, "CNY");
    strcpy(v_exch_crncy_type, "CNY");
    v_exch_rate=0;
    v_rece_margin=0;
    v_out_rece_margin=0;
    strcpy(v_remark_info, " ");
    strcpy(v_out_acco, " ");
    v_posi_amt=0;
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
    IFastMessage* lpTSCall1Req15 = NULL;
    IFastMessage* lpTSCall1Ans15 = NULL;
    IFastMessage* lpTSCall1Req16 = NULL;
    IFastMessage* lpTSCall1Ans16 = NULL;

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

    //清算处理流程只处理成交的费用计算、平仓盈亏计算以及持仓变化，并对此相应的资金与持仓变化入账；
    //结算处理流程则根据持仓记录，生成持仓组合，以用于计算保证金；同时根据持仓记录进行盯市盈亏计算，生成结算待入账记录；
    //根据期货持仓处理盯市盈亏和生成组合数据
    //结算准备,对清算持仓表的数据,更新应收保证金,结算价,优惠参数等

    // set @查询序号# = 0;
    v_qry_no = 0;
    // loop_label:loop
    while (true)
    {


        // set @交割标志# = 0;
        v_deliv_flag = 0;
        //调用过程[事务_清算期货_结算_获取清算持仓]
        //组织事务请求
        if(lpTSCall1Ans1)
        {
          lpTSCall1Ans1->FreeMsg();
          lpTSCall1Ans1=NULL;
        }
        lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clfutuT.3.3", 0);
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
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.3.3]subcall timed out!");
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
        v_co_no = lpTSCall1Ans1->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans1->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        v_futu_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
        v_pass_no = lpTSCall1Ans1->GetInt32(LDBIZ_PASS_NO_INT);
        v_asset_acco_no = lpTSCall1Ans1->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_exch_no = lpTSCall1Ans1->GetInt32(LDBIZ_EXCH_NO_INT);
        v_contrc_code_no = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        v_contrc_type = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_curr_qty = lpTSCall1Ans1->GetDouble(LDBIZ_CURR_QTY_FLOAT);
        v_lngsht_type = lpTSCall1Ans1->GetInt32(LDBIZ_LNGSHT_TYPE_INT);
        v_hedge_type = lpTSCall1Ans1->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_margin_pref = lpTSCall1Ans1->GetInt32(LDBIZ_MARGIN_PREF_INT);
        strcpy(v_comb_code, lpTSCall1Ans1->GetString(LDBIZ_COMB_CODE_STR));


        // if @记录序号# = 0 then
        if (v_row_id == 0)
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


            // set @查询序号# = @记录序号#;
            v_qry_no = v_row_id;
        // end if;
        }

        //调用过程[事务_公共_清算接口_获取代码编号合约代码属性]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.26.65", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.65]subcall timed out!");
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
        v_exch_no = lpTSCall1Ans2->GetInt32(LDBIZ_EXCH_NO_INT);
        strcpy(v_contrc_code, lpTSCall1Ans2->GetString(LDBIZ_CONTRC_CODE_STR));
        strcpy(v_contrc_name, lpTSCall1Ans2->GetString(LDBIZ_CONTRC_NAME_STR));
        v_contrc_type = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        v_margin_pref = lpTSCall1Ans2->GetInt32(LDBIZ_MARGIN_PREF_INT);
        v_contrc_unit = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_UNIT_INT);
        v_capit_reback_days = lpTSCall1Ans2->GetInt32(LDBIZ_CAPIT_REBACK_DAYS_INT);
        v_posi_reback_days = lpTSCall1Ans2->GetInt32(LDBIZ_POSI_REBACK_DAYS_INT);
        v_expire_date = lpTSCall1Ans2->GetInt32(LDBIZ_EXPIRE_DATE_INT);
        v_begin_deli_date = lpTSCall1Ans2->GetInt32(LDBIZ_BEGIN_DELI_DATE_INT);
        v_end_deli_date = lpTSCall1Ans2->GetInt32(LDBIZ_END_DELI_DATE_INT);
        v_deli_price = lpTSCall1Ans2->GetDouble(LDBIZ_DELI_PRICE_FLOAT);


         // if @保证金优惠# ＝ 《保证金优惠-优惠》 then
         if (v_margin_pref == 1)
         {
              //获取期货持仓优惠组合信息
              //调用过程[事务_公共_清算接口_获取保证金优惠组合编码]
              //组织事务请求
              if(lpTSCall1Ans3)
              {
                lpTSCall1Ans3->FreeMsg();
                lpTSCall1Ans3=NULL;
              }
              lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pubT.26.64", 0);
              lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
              lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
              lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
              lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
              lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
              lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
              lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
              lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
              lpTSCall1Req3->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
              lpTSCall1Req3->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
              lpTSCall1Req3->SetString(LDBIZ_CONTRC_CODE_STR,v_contrc_code);
              glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
              if(!lpTSCall1Ans3)  //  超时错误
              {
                  lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                  lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.64]subcall timed out!");
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
              strcpy(v_comb_code, lpTSCall1Ans3->GetString(LDBIZ_COMB_CODE_STR));
              v_comb_type = lpTSCall1Ans3->GetInt32(LDBIZ_COMB_TYPE_INT);


              // if @错误编码# <> "0" then
              if (strcmp(v_error_code , "0")!=0)
              {

                  // set @组合编码# = " ";
                  strcpy(v_comb_code," ");

                  // set @组合类型# = @合约类型#;
                  v_comb_type = v_contrc_type;

                  // set @组合名称# = @合约名称#;
                  strcpy(v_comb_name,v_contrc_name);
              // end if;
              }

        }
        // else
        else
        {


            // set @组合编码# = " ";
            strcpy(v_comb_code," ");
        // end if;
        }

         //获取期货合约代码的结算价
         //调用过程[事务_公共_清算接口_获取期货结算价]
         //组织事务请求
         if(lpTSCall1Ans4)
         {
           lpTSCall1Ans4->FreeMsg();
           lpTSCall1Ans4=NULL;
         }
         lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pubT.26.66", 0);
         lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
         lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
         lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
         lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
         lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
         lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
         lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
         lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
         lpTSCall1Req4->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
         lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
         glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
         if(!lpTSCall1Ans4)  //  超时错误
         {
             lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
             lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.66]subcall timed out!");
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
         v_sett_price = lpTSCall1Ans4->GetDouble(LDBIZ_SETT_PRICE_FLOAT);
         v_pre_settle_price = lpTSCall1Ans4->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);


          // if @错误编码# <> "0" then
          if (strcmp(v_error_code , "0")!=0)
          {

              // set @处理信息# = concat("结算获取结算价失败: 错误编码=", @错误编码#,"错误信息=", @错误信息#);
              snprintf(v_deal_info,sizeof(v_deal_info),"%s%s%s%s","结算获取结算价失败: 错误编码=",v_error_code,"错误信息=",v_error_info);
              //调用过程[事务_清算期货_清算_记录处理信息]
              //组织事务请求
              if(lpTSCall1Ans5)
              {
                lpTSCall1Ans5->FreeMsg();
                lpTSCall1Ans5=NULL;
              }
              lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("clfutuT.2.81", 0);
              lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
              lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
              lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
              lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
              lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
              lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
              lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
              lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
              lpTSCall1Req5->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
              lpTSCall1Req5->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
              glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
              if(!lpTSCall1Ans5)  //  超时错误
              {
                  lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                  lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.81]subcall timed out!");
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

          // end if;
          }

          //如果到期日期、开始交割日、结束交割日三者相等，则是现金交割

          // if  (@初始化日期# = @到期日期#) and (@到期日期# = @开始交割日#) and (@开始交割日# = @结束交割日#) then
          if ( (v_init_date == v_expire_date) && (v_expire_date == v_begin_deli_date) && (v_begin_deli_date == v_end_deli_date))
          {
              //调用过程[事务_公共_清算接口_获取合约交割参数记录]
              //组织事务请求
              if(lpTSCall1Ans6)
              {
                lpTSCall1Ans6->FreeMsg();
                lpTSCall1Ans6=NULL;
              }
              lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("pubT.26.63", 0);
              lpTSCall1Req6->SetInt32(LDTAG_PRIORITY, iPriority);
              lpTSCall1Req6->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
              lpTSCall1Req6->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
              lpTSCall1Req6->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
              lpTSCall1Req6->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
              lpTSCall1Req6->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
              lpTSCall1Req6->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
              lpTSCall1Req6->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
              lpTSCall1Req6->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
              lpTSCall1Req6->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
              glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
              if(!lpTSCall1Ans6)  //  超时错误
              {
                  lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                  lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.63]subcall timed out!");
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
              v_deli_price = lpTSCall1Ans6->GetDouble(LDBIZ_DELI_PRICE_FLOAT);


                // if @错误编码# <> "0" then
                if (strcmp(v_error_code , "0")!=0)
                {

                  // set @错误编码#=“0";
                  strcpy(v_error_code,"0");

                  // set @错误信息#=“ ";
                  strcpy(v_error_info," ");

                  // set @结算价#=@交割价#;
                  v_sett_price=v_deli_price;

                  // set @交割标志# = 1;
                  v_deliv_flag = 1;
               }
               // else
               else
               {


                  // set @交割标志# = 1;
                  v_deliv_flag = 1;
               // end if;
               }


              // set @结算价#=@交割价#;
              v_sett_price=v_deli_price;

              // set @交割标志# = 1;
              v_deliv_flag = 1;
          // end if;
          }

          //获取清算持仓保证金

          // set @费用数量# = @当前数量#;
          v_fee_qty = v_curr_qty;

          // set @费用价格# = @结算价#;
          v_fee_price = v_sett_price;

          // set @开平方向# = 《开平方向-开仓》;
          v_contrc_dir = 1;

          // set @订单方向# = @多空类型#;
          v_order_dir = v_lngsht_type;
          //调用过程[事务_公共_清算接口_计算期货清算保证金]
          //组织事务请求
          if(lpTSCall1Ans7)
          {
            lpTSCall1Ans7->FreeMsg();
            lpTSCall1Ans7=NULL;
          }
          lpTSCall1Req7=glpFastMsgFactory->CreateFastMessage("pubT.26.67", 0);
          lpTSCall1Req7->SetInt32(LDTAG_PRIORITY, iPriority);
          lpTSCall1Req7->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
          lpTSCall1Req7->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
          lpTSCall1Req7->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
          lpTSCall1Req7->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
          lpTSCall1Req7->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
          lpTSCall1Req7->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
          lpTSCall1Req7->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
          lpTSCall1Req7->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
          lpTSCall1Req7->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
          lpTSCall1Req7->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpTSCall1Req7->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
          lpTSCall1Req7->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
          lpTSCall1Req7->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
          lpTSCall1Req7->SetInt32(LDBIZ_ORDER_DIR_INT,v_order_dir);
          lpTSCall1Req7->SetInt32(LDBIZ_CONTRC_DIR_INT,v_contrc_dir);
          lpTSCall1Req7->SetDouble(LDBIZ_FEE_QTY_FLOAT,v_fee_qty);
          lpTSCall1Req7->SetDouble(LDBIZ_FEE_PRICE_FLOAT,v_fee_price);
          lpTSCall1Req7->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
          lpTSCall1Req7->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
          glpTSSubcallSerives->SubCall(lpTSCall1Req7, &lpTSCall1Ans7, 5000);
          if(!lpTSCall1Ans7)  //  超时错误
          {
              lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
              lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.26.67]subcall timed out!");
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
          strcpy(v_crncy_type, lpTSCall1Ans7->GetString(LDBIZ_CRNCY_TYPE_STR));
          strcpy(v_exch_crncy_type, lpTSCall1Ans7->GetString(LDBIZ_EXCH_CRNCY_TYPE_STR));
          v_exch_rate = lpTSCall1Ans7->GetDouble(LDBIZ_EXCH_RATE_FLOAT);
          v_rece_margin = lpTSCall1Ans7->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
          v_out_rece_margin = lpTSCall1Ans7->GetDouble(LDBIZ_OUT_RECE_MARGIN_FLOAT);


          // if @错误编码# <> "0" then
          if (strcmp(v_error_code , "0")!=0)
          {

              // set @处理信息# = concat("结算计算保证金失败: 错误编码=", @错误编码#,"错误信息=", @错误信息#);
              snprintf(v_deal_info,sizeof(v_deal_info),"%s%s%s%s","结算计算保证金失败: 错误编码=",v_error_code,"错误信息=",v_error_info);
              //调用过程[事务_清算期货_清算_记录处理信息]
              //组织事务请求
              if(lpTSCall1Ans8)
              {
                lpTSCall1Ans8->FreeMsg();
                lpTSCall1Ans8=NULL;
              }
              lpTSCall1Req8=glpFastMsgFactory->CreateFastMessage("clfutuT.2.81", 0);
              lpTSCall1Req8->SetInt32(LDTAG_PRIORITY, iPriority);
              lpTSCall1Req8->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
              lpTSCall1Req8->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
              lpTSCall1Req8->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
              lpTSCall1Req8->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
              lpTSCall1Req8->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
              lpTSCall1Req8->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
              lpTSCall1Req8->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
              lpTSCall1Req8->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
              lpTSCall1Req8->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
              glpTSSubcallSerives->SubCall(lpTSCall1Req8, &lpTSCall1Ans8, 5000);
              if(!lpTSCall1Ans8)  //  超时错误
              {
                  lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                  lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.81]subcall timed out!");
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

          // end if;
          }

          //调用过程[事务_清算期货_结算_更新持仓保证金]
          //组织事务请求
          if(lpTSCall1Ans9)
          {
            lpTSCall1Ans9->FreeMsg();
            lpTSCall1Ans9=NULL;
          }
          lpTSCall1Req9=glpFastMsgFactory->CreateFastMessage("clfutuT.3.2", 0);
          lpTSCall1Req9->SetInt32(LDTAG_PRIORITY, iPriority);
          lpTSCall1Req9->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
          lpTSCall1Req9->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
          lpTSCall1Req9->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
          lpTSCall1Req9->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
          lpTSCall1Req9->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
          lpTSCall1Req9->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
          lpTSCall1Req9->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
          lpTSCall1Req9->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
          lpTSCall1Req9->SetInt32(LDBIZ_MARGIN_PREF_INT,v_margin_pref);
          lpTSCall1Req9->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
          lpTSCall1Req9->SetDouble(LDBIZ_SETT_PRICE_FLOAT,v_sett_price);
          lpTSCall1Req9->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
          lpTSCall1Req9->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
          lpTSCall1Req9->SetInt32(LDBIZ_DELIV_FLAG_INT,v_deliv_flag);
          glpTSSubcallSerives->SubCall(lpTSCall1Req9, &lpTSCall1Ans9, 5000);
          if(!lpTSCall1Ans9)  //  超时错误
          {
              lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
              lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.3.2]subcall timed out!");
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

              // set @处理信息# = concat("结算更新保证金失败: 错误编码=", @错误编码#,"错误信息=", @错误信息#);
              snprintf(v_deal_info,sizeof(v_deal_info),"%s%s%s%s","结算更新保证金失败: 错误编码=",v_error_code,"错误信息=",v_error_info);
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

          // end if;
          }


          // set @备注信息# = "结算更新持仓属性";
          strcpy(v_remark_info,"结算更新持仓属性");
          //调用过程[事务_产品期货_清算接口_更新持仓结算价应收保证金]
          //组织事务请求
          if(lpTSCall1Ans11)
          {
            lpTSCall1Ans11->FreeMsg();
            lpTSCall1Ans11=NULL;
          }
          lpTSCall1Req11=glpFastMsgFactory->CreateFastMessage("pdfutuT.5.76", 0);
          lpTSCall1Req11->SetInt32(LDTAG_PRIORITY, iPriority);
          lpTSCall1Req11->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
          lpTSCall1Req11->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
          lpTSCall1Req11->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
          lpTSCall1Req11->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
          lpTSCall1Req11->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
          lpTSCall1Req11->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
          lpTSCall1Req11->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
          lpTSCall1Req11->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
          lpTSCall1Req11->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
          lpTSCall1Req11->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
          lpTSCall1Req11->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
          lpTSCall1Req11->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
          lpTSCall1Req11->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
          lpTSCall1Req11->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
          lpTSCall1Req11->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
          lpTSCall1Req11->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
          lpTSCall1Req11->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
          lpTSCall1Req11->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
          lpTSCall1Req11->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
          lpTSCall1Req11->SetDouble(LDBIZ_SETT_PRICE_FLOAT,v_sett_price);
          lpTSCall1Req11->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
          lpTSCall1Req11->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
          glpTSSubcallSerives->SubCall(lpTSCall1Req11, &lpTSCall1Ans11, 5000);
          if(!lpTSCall1Ans11)  //  超时错误
          {
              lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
              lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdfutuT.5.76]subcall timed out!");
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


          // if @错误编码# <> "0" then
          if (strcmp(v_error_code , "0")!=0)
          {

              // set @处理信息# = concat("结算更新账户持仓结算价应收保证金失败: 错误编码=", @错误编码#,"错误信息=", @错误信息#);
              snprintf(v_deal_info,sizeof(v_deal_info),"%s%s%s%s","结算更新账户持仓结算价应收保证金失败: 错误编码=",v_error_code,"错误信息=",v_error_info);
              //调用过程[事务_清算期货_清算_记录处理信息]
              //组织事务请求
              if(lpTSCall1Ans12)
              {
                lpTSCall1Ans12->FreeMsg();
                lpTSCall1Ans12=NULL;
              }
              lpTSCall1Req12=glpFastMsgFactory->CreateFastMessage("clfutuT.2.81", 0);
              lpTSCall1Req12->SetInt32(LDTAG_PRIORITY, iPriority);
              lpTSCall1Req12->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
              lpTSCall1Req12->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
              lpTSCall1Req12->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
              lpTSCall1Req12->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
              lpTSCall1Req12->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
              lpTSCall1Req12->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
              lpTSCall1Req12->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
              lpTSCall1Req12->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
              lpTSCall1Req12->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
              glpTSSubcallSerives->SubCall(lpTSCall1Req12, &lpTSCall1Ans12, 5000);
              if(!lpTSCall1Ans12)  //  超时错误
              {
                  lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                  lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.81]subcall timed out!");
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

          // end if;
          }

    // end loop;
    }

    //逐条对清算持仓表的数据进行结算

    // set @查询序号# = 0;
    v_qry_no = 0;
    // loop_label:loop
    while (true)
    {

        //调用过程[事务_清算期货_结算_更新获取清算持仓]
        //组织事务请求
        if(lpTSCall1Ans13)
        {
          lpTSCall1Ans13->FreeMsg();
          lpTSCall1Ans13=NULL;
        }
        lpTSCall1Req13=glpFastMsgFactory->CreateFastMessage("clfutuT.3.1", 0);
        lpTSCall1Req13->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req13->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req13->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req13->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req13->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req13->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req13->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req13->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req13->SetInt32(LDBIZ_QRY_NO_INT,v_qry_no);
        glpTSSubcallSerives->SubCall(lpTSCall1Req13, &lpTSCall1Ans13, 5000);
        if(!lpTSCall1Ans13)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.3.1]subcall timed out!");
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
        v_co_no = lpTSCall1Ans13->GetInt32(LDBIZ_CO_NO_INT);
        v_pd_no = lpTSCall1Ans13->GetInt32(LDBIZ_PD_NO_INT);
        v_exch_group_no = lpTSCall1Ans13->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
        strcpy(v_out_acco, lpTSCall1Ans13->GetString(LDBIZ_OUT_ACCO_STR));
        v_futu_acco_no = lpTSCall1Ans13->GetInt32(LDBIZ_FUTU_ACCO_NO_INT);
        v_contrc_unit = lpTSCall1Ans13->GetInt32(LDBIZ_CONTRC_UNIT_INT);
        v_posi_amt = lpTSCall1Ans13->GetDouble(LDBIZ_POSI_AMT_FLOAT);
        v_rece_margin = lpTSCall1Ans13->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        v_pass_no = lpTSCall1Ans13->GetInt32(LDBIZ_PASS_NO_INT);
        v_asset_acco_no = lpTSCall1Ans13->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
        v_exch_no = lpTSCall1Ans13->GetInt32(LDBIZ_EXCH_NO_INT);
        v_contrc_code_no = lpTSCall1Ans13->GetInt32(LDBIZ_CONTRC_CODE_NO_INT);
        v_contrc_type = lpTSCall1Ans13->GetInt32(LDBIZ_CONTRC_TYPE_INT);
        strcpy(v_comb_code, lpTSCall1Ans13->GetString(LDBIZ_COMB_CODE_STR));
        v_curr_qty = lpTSCall1Ans13->GetDouble(LDBIZ_CURR_QTY_FLOAT);
        v_sett_price = lpTSCall1Ans13->GetDouble(LDBIZ_SETT_PRICE_FLOAT);
        v_lngsht_type = lpTSCall1Ans13->GetInt32(LDBIZ_LNGSHT_TYPE_INT);
        v_hedge_type = lpTSCall1Ans13->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_deliv_flag = lpTSCall1Ans13->GetInt32(LDBIZ_DELIV_FLAG_INT);
        v_margin_pref = lpTSCall1Ans13->GetInt32(LDBIZ_MARGIN_PREF_INT);


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


            // set @查询序号# = @记录序号#;
            v_qry_no = v_row_id;
        // end if;
        }

        //调用过程[事务_清算期货_结算_结算处理]
        //组织事务请求
        if(lpTSCall1Ans14)
        {
          lpTSCall1Ans14->FreeMsg();
          lpTSCall1Ans14=NULL;
        }
        lpTSCall1Req14=glpFastMsgFactory->CreateFastMessage("clfutuT.3.31", 0);
        lpTSCall1Req14->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req14->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req14->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req14->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req14->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req14->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req14->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req14->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req14->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
        lpTSCall1Req14->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
        lpTSCall1Req14->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
        lpTSCall1Req14->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
        lpTSCall1Req14->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
        lpTSCall1Req14->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
        lpTSCall1Req14->SetInt32(LDBIZ_PASS_NO_INT,v_pass_no);
        lpTSCall1Req14->SetString(LDBIZ_OUT_ACCO_STR,v_out_acco);
        lpTSCall1Req14->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
        lpTSCall1Req14->SetInt32(LDBIZ_FUTU_ACCO_NO_INT,v_futu_acco_no);
        lpTSCall1Req14->SetInt32(LDBIZ_CONTRC_CODE_NO_INT,v_contrc_code_no);
        lpTSCall1Req14->SetInt32(LDBIZ_CONTRC_TYPE_INT,v_contrc_type);
        lpTSCall1Req14->SetInt32(LDBIZ_CONTRC_UNIT_INT,v_contrc_unit);
        lpTSCall1Req14->SetInt32(LDBIZ_MARGIN_PREF_INT,v_margin_pref);
        lpTSCall1Req14->SetString(LDBIZ_COMB_CODE_STR,v_comb_code);
        lpTSCall1Req14->SetInt32(LDBIZ_LNGSHT_TYPE_INT,v_lngsht_type);
        lpTSCall1Req14->SetInt32(LDBIZ_HEDGE_TYPE_INT,v_hedge_type);
        lpTSCall1Req14->SetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT,v_pre_settle_price);
        lpTSCall1Req14->SetDouble(LDBIZ_SETT_PRICE_FLOAT,v_sett_price);
        lpTSCall1Req14->SetDouble(LDBIZ_CURR_QTY_FLOAT,v_curr_qty);
        lpTSCall1Req14->SetDouble(LDBIZ_POSI_AMT_FLOAT,v_posi_amt);
        lpTSCall1Req14->SetDouble(LDBIZ_RECE_MARGIN_FLOAT,v_rece_margin);
        lpTSCall1Req14->SetInt32(LDBIZ_COMB_TYPE_INT,v_comb_type);
        lpTSCall1Req14->SetInt32(LDBIZ_DELIV_FLAG_INT,v_deliv_flag);
        glpTSSubcallSerives->SubCall(lpTSCall1Req14, &lpTSCall1Ans14, 5000);
        if(!lpTSCall1Ans14)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.3.31]subcall timed out!");
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


        // if @错误编码# <> "0" then
        if (strcmp(v_error_code , "0")!=0)
        {

            // set @处理信息# = concat("结算处理失败: 错误编码=", @错误编码#,"错误信息=", @错误信息#);
            snprintf(v_deal_info,sizeof(v_deal_info),"%s%s%s%s","结算处理失败: 错误编码=",v_error_code,"错误信息=",v_error_info);
            //调用过程[事务_清算期货_清算_记录处理信息]
            //组织事务请求
            if(lpTSCall1Ans15)
            {
              lpTSCall1Ans15->FreeMsg();
              lpTSCall1Ans15=NULL;
            }
            lpTSCall1Req15=glpFastMsgFactory->CreateFastMessage("clfutuT.2.81", 0);
            lpTSCall1Req15->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req15->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req15->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req15->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req15->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req15->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req15->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req15->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req15->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
            lpTSCall1Req15->SetString(LDBIZ_DEAL_INFO_STR,v_deal_info);
            glpTSSubcallSerives->SubCall(lpTSCall1Req15, &lpTSCall1Ans15, 5000);
            if(!lpTSCall1Ans15)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.2.81]subcall timed out!");
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
        if(lpTSCall1Ans16)
        {
          lpTSCall1Ans16->FreeMsg();
          lpTSCall1Ans16=NULL;
        }
        lpTSCall1Req16=glpFastMsgFactory->CreateFastMessage("pubT.24.154", 0);
        lpTSCall1Req16->SetInt32(LDTAG_PRIORITY, iPriority);
        strcpy(v_log_error_code, v_error_code);
        strcpy(v_log_error_info, v_error_info);
        lpTSCall1Req16->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req16->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req16->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req16->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req16->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req16->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req16->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req16->SetString(LDBIZ_LOG_ERROR_CODE_STR,v_log_error_code);
        lpTSCall1Req16->SetString(LDBIZ_LOG_ERROR_INFO_STR,v_log_error_info);
        glpTSSubcallSerives->SubCall(lpTSCall1Req16, &lpTSCall1Ans16, 5000);
        if (lpTSCall1Ans16)
        {
        //获取输出参数值
            strcpy(v_error_code, lpTSCall1Ans16->GetString(LDBIZ_ERROR_CODE_STR));
            strcpy(v_error_info, lpTSCall1Ans16->GetString(LDBIZ_ERROR_INFO_STR));
            strcpy(v_error_prompt, lpTSCall1Ans16->GetString(LDBIZ_ERROR_PROMPT_STR));
            v_error_level = lpTSCall1Ans16->GetInt32(LDBIZ_ERROR_LEVEL_INT);
            strcpy(v_error_deal, lpTSCall1Ans16->GetString(LDBIZ_ERROR_DEAL_STR));
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
    if(lpTSCall1Ans15)
        lpTSCall1Ans15->FreeMsg();
    if(lpTSCall1Ans16)
        lpTSCall1Ans16->FreeMsg();
    return iRet;
}

//逻辑_清算期货_结算_查询待入账记录
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
    int v_lngsht_type;
    int v_hedge_type;
    double v_curr_qty;
    double v_pre_settle_price;
    double v_sett_price;
    double v_pre_entry_amt;
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
    v_lngsht_type=0;
    v_hedge_type=0;
    v_curr_qty=0;
    v_pre_settle_price=0;
    v_sett_price=0;
    v_pre_entry_amt=0;
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

    //调用过程[事务_清算期货_结算_查询待入账记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clfutuT.3.45", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.3.45]subcall timed out!");
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

//逻辑_清算期货_结算_入账处理
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
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_record_count;
    char v_deal_info[256];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_ctrl_flag;
    int64 v_query_row_id;
    int v_arrive_date;
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
    int v_contrc_dir;
    int v_lngsht_type;
    int v_hedge_type;
    double v_order_price;
    double v_order_qty;
    double v_pre_settle_price;
    double v_sett_price;
    double v_pre_entry_qty;
    double v_pre_entry_amt;
    double v_rece_margin;
    char v_comb_code[7];
    double v_sett_capt_margin;
    double v_sett_marked_pandl;
    int v_busi_flag;
    char v_entry_status[3];
    char v_undo_status[3];
    int64 v_entry_money_jour_no;
    int64 v_entry_posi_jour_no;
    int64 v_deli_jour_no;
    char v_tmp_error_info[256];
    double v_occur_amt;
    double v_occur_qty;
    char v_remark_info[256];
    double v_open_amount;
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
    v_row_id=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_record_count=0;
    strcpy(v_deal_info, " ");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_ctrl_flag=0;
    v_query_row_id=0;
    v_arrive_date=0;
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
    v_contrc_dir=0;
    v_lngsht_type=0;
    v_hedge_type=0;
    v_order_price=0;
    v_order_qty=0;
    v_pre_settle_price=0;
    v_sett_price=0;
    v_pre_entry_qty=0;
    v_pre_entry_amt=0;
    v_rece_margin=0;
    strcpy(v_comb_code, " ");
    v_sett_capt_margin=0;
    v_sett_marked_pandl=0;
    v_busi_flag=0;
    strcpy(v_entry_status, "0");
    strcpy(v_undo_status, "0");
    v_entry_money_jour_no=0;
    v_entry_posi_jour_no=0;
    v_deli_jour_no=0;
    strcpy(v_tmp_error_info, " ");
    v_occur_amt=0;
    v_occur_qty=0;
    strcpy(v_remark_info, " ");
    v_open_amount=0;
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


    // set @控制标志# = 2;
    v_ctrl_flag = 2;

    // if @记录序号# > 0 then
    if (v_row_id > 0)
    {

        // set @查询记录序号#=@记录序号#;
        v_query_row_id=v_row_id;

        // set @控制标志# = 1;
        v_ctrl_flag = 1;
    }
    // else
    else
    {


        // set @查询记录序号#=0;
        v_query_row_id=0;
    // end if;
    }


    // set @到账日期#=0;
    v_arrive_date=0;
    //再处理账户系统登记日结算数据
    // loop_label:loop
    while (true)
    {

        //调用过程[事务_清算期货_结算_更新获取待入账记录]
        //组织事务请求
        if(lpTSCall1Ans1)
        {
          lpTSCall1Ans1->FreeMsg();
          lpTSCall1Ans1=NULL;
        }
        lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clfutuT.3.43", 0);
        lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req1->SetInt64(LDBIZ_QUERY_ROW_ID_INT64,v_query_row_id);
        lpTSCall1Req1->SetInt32(LDBIZ_CTRL_FLAG_INT,v_ctrl_flag);
        glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
        if(!lpTSCall1Ans1)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.3.43]subcall timed out!");
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
        v_init_date = lpTSCall1Ans1->GetInt32(LDBIZ_INIT_DATE_INT);
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
        v_contrc_dir = lpTSCall1Ans1->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_lngsht_type = lpTSCall1Ans1->GetInt32(LDBIZ_LNGSHT_TYPE_INT);
        v_hedge_type = lpTSCall1Ans1->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_order_price = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans1->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_pre_settle_price = lpTSCall1Ans1->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
        v_sett_price = lpTSCall1Ans1->GetDouble(LDBIZ_SETT_PRICE_FLOAT);
        v_pre_entry_qty = lpTSCall1Ans1->GetDouble(LDBIZ_PRE_ENTRY_QTY_FLOAT);
        v_pre_entry_amt = lpTSCall1Ans1->GetDouble(LDBIZ_PRE_ENTRY_AMT_FLOAT);
        v_rece_margin = lpTSCall1Ans1->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_comb_code, lpTSCall1Ans1->GetString(LDBIZ_COMB_CODE_STR));
        v_sett_capt_margin = lpTSCall1Ans1->GetDouble(LDBIZ_SETT_CAPT_MARGIN_FLOAT);
        v_sett_marked_pandl = lpTSCall1Ans1->GetDouble(LDBIZ_SETT_MARKED_PANDL_FLOAT);
        v_busi_flag = lpTSCall1Ans1->GetInt32(LDBIZ_BUSI_FLAG_INT);
        strcpy(v_entry_status, lpTSCall1Ans1->GetString(LDBIZ_ENTRY_STATUS_STR));
        strcpy(v_undo_status, lpTSCall1Ans1->GetString(LDBIZ_UNDO_STATUS_STR));
        v_entry_money_jour_no = lpTSCall1Ans1->GetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
        v_entry_posi_jour_no = lpTSCall1Ans1->GetInt64(LDBIZ_ENTRY_POSI_JOUR_NO_INT64);
        v_deli_jour_no = lpTSCall1Ans1->GetInt64(LDBIZ_DELI_JOUR_NO_INT64);


        // if @记录个数# = 0 then
        if (v_record_count == 0)
        {

            // set @错误编码# = "0";
            strcpy(v_error_code,"0");

            // set @错误信息# = " ";
            strcpy(v_error_info," ");
            // leave loop_label;
            break;

        // end if;
        }


        // set @临时_错误信息#="";
        strcpy(v_tmp_error_info,"");
        //期货资金入账处理，包括成交清算、费用入账、盯市盈亏入账、占用保证金入账
        //盯市盈亏入账时，调用单独的事务_产品期货_清算接口_期货盯市盈亏入账处理，其他调用事务_产品期货_清算接口_清算资金入账处理
       // if (@待入账金额// <> 0)  then

            // set @变动金额# = @待入账金额#;
            v_occur_amt = v_pre_entry_amt;

            // set @变动数量# = @待入账数量#;
            v_occur_qty = v_pre_entry_qty;

            // set @备注信息#="清算期货结算入账处理！";
            strcpy(v_remark_info,"清算期货结算入账处理！");
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

                // set @入账状态# = 《入账状态-未入账》;
                strcpy(v_entry_status,"2");
                //调用过程[事务_清算期货_结算_更新待入账记录入账状态]
                //组织事务请求
                if(lpTSCall1Ans3)
                {
                  lpTSCall1Ans3->FreeMsg();
                  lpTSCall1Ans3=NULL;
                }
                lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("clfutuT.3.40", 0);
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
                lpTSCall1Req3->SetString(LDBIZ_ENTRY_STATUS_STR,v_entry_status);
                glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
                if(!lpTSCall1Ans3)  //  超时错误
                {
                    lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                    lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.3.40]subcall timed out!");
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
            }
            // else
            else
            {


                // if @业务标志# = 《业务标志-期货盯市盈亏》 then
                if (v_busi_flag == 3001007)
                {

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
                    if(lpTSCall1Ans4)
                    {
                      lpTSCall1Ans4->FreeMsg();
                      lpTSCall1Ans4=NULL;
                    }
                    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("prodT.7.2", 0);
                    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
                    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
                    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
                    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
                    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
                    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
                    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
                    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
                    lpTSCall1Req4->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
                    lpTSCall1Req4->SetInt32(LDBIZ_ARRIVE_DATE_INT,v_arrive_date);
                    lpTSCall1Req4->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
                    lpTSCall1Req4->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
                    lpTSCall1Req4->SetInt32(LDBIZ_BUSI_FLAG_INT,v_busi_flag);
                    lpTSCall1Req4->SetDouble(LDBIZ_OCCUR_AMT_FLOAT,v_occur_amt);
                    lpTSCall1Req4->SetDouble(LDBIZ_CURR_AMT_FLOAT,v_curr_amt);
                    lpTSCall1Req4->SetDouble(LDBIZ_FROZEN_AMT_FLOAT,v_frozen_amt);
                    lpTSCall1Req4->SetDouble(LDBIZ_UNFROZ_AMT_FLOAT,v_unfroz_amt);
                    lpTSCall1Req4->SetDouble(LDBIZ_TOTAL_RECE_AMT_FLOAT,v_total_rece_amt);
                    lpTSCall1Req4->SetDouble(LDBIZ_TOTAL_PAYAB_AMT_FLOAT,v_total_payab_amt);
                    lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
                    lpTSCall1Req4->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
                    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 30000);
                    if(!lpTSCall1Ans4)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.7.2]subcall timed out!");
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

                // end if;
                }

            // end if;
            }

        //end if;

        // if @控制标志# = 1 then
        if (v_ctrl_flag == 1)
        {
            // leave loop_label;
            break;

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

//逻辑_清算期货_结算_入账回滚处理
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
    int v_qry_no;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_init_date;
    char v_co_busi_config_str[65];
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
    int v_tmp_busi_flag;
    int v_arrive_date;
    double v_sett_fee;
    double v_capt_margin;
    double v_occur_amt;
    double v_occur_qty;
    char v_remark_info[256];
    double v_open_amount;
    int64 v_entry_exgp_posi_jour_no;
    int64 v_entry_asac_posi_jour_no;
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
    v_tmp_busi_flag=0;
    v_arrive_date=0;
    v_sett_fee=0;
    v_capt_margin=0;
    v_occur_amt=0;
    v_occur_qty=0;
    strcpy(v_remark_info, " ");
    v_open_amount=0;
    v_entry_exgp_posi_jour_no=0;
    v_entry_asac_posi_jour_no=0;
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

    //调用过程[事务_清算期货_结算_更新获取回滚待入账记录]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("clfutuT.3.44", 0);
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
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.3.44]subcall timed out!");
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
    v_init_date = lpTSCall1Ans1->GetInt32(LDBIZ_INIT_DATE_INT);
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
    //盯市盈亏入账时，调用单独的事务_产品期货_清算接口_期货盯市盈亏入账处理，其他调用事务_产品期货_清算接口_清算资金入账处理

    // if (@待入账金额# <> 0) then
    if ((v_pre_entry_amt != 0))
    {

        // set @变动金额# = @待入账金额#;
        v_occur_amt = v_pre_entry_amt;

        // set @变动数量# = @待入账数量#;
        v_occur_qty = v_pre_entry_qty;

        // set @备注信息# = "回滚结算入账资金持仓入账！";
        strcpy(v_remark_info,"回滚结算入账资金持仓入账！");
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

            // set @临时_错误编码# = @错误编码#;
            strcpy(v_tmp_error_code,v_error_code);

            // set @临时_错误信息# = @错误信息#;
            strcpy(v_tmp_error_info,v_error_info);

            // set @回滚状态# = 《回滚状态-未回滚》;
            strcpy(v_undo_status,"2");
            //调用过程[事务_清算期货_结算_更新待入账记录回滚状态]
            //组织事务请求
            if(lpTSCall1Ans3)
            {
              lpTSCall1Ans3->FreeMsg();
              lpTSCall1Ans3=NULL;
            }
            lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("clfutuT.3.41", 0);
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
            lpTSCall1Req3->SetString(LDBIZ_UNDO_STATUS_STR,v_undo_status);
            glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
            if(!lpTSCall1Ans3)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.3.41]subcall timed out!");
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

            // set @变动金额#=@待入账金额#;
            v_occur_amt=v_pre_entry_amt;
            //调用过程[事务_产品_清算接口_产品资金入账]
            //组织事务请求
            if(lpTSCall1Ans4)
            {
              lpTSCall1Ans4->FreeMsg();
              lpTSCall1Ans4=NULL;
            }
            lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("prodT.7.2", 0);
            lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
            lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
            lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
            lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
            lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
            lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
            lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
            lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
            lpTSCall1Req4->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
            lpTSCall1Req4->SetInt32(LDBIZ_ARRIVE_DATE_INT,v_arrive_date);
            lpTSCall1Req4->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
            lpTSCall1Req4->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
            lpTSCall1Req4->SetInt32(LDBIZ_BUSI_FLAG_INT,v_busi_flag);
            lpTSCall1Req4->SetDouble(LDBIZ_OCCUR_AMT_FLOAT,v_occur_amt);
            lpTSCall1Req4->SetDouble(LDBIZ_CURR_AMT_FLOAT,v_curr_amt);
            lpTSCall1Req4->SetDouble(LDBIZ_FROZEN_AMT_FLOAT,v_frozen_amt);
            lpTSCall1Req4->SetDouble(LDBIZ_UNFROZ_AMT_FLOAT,v_unfroz_amt);
            lpTSCall1Req4->SetDouble(LDBIZ_TOTAL_RECE_AMT_FLOAT,v_total_rece_amt);
            lpTSCall1Req4->SetDouble(LDBIZ_TOTAL_PAYAB_AMT_FLOAT,v_total_payab_amt);
            lpTSCall1Req4->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
            lpTSCall1Req4->SetString(LDBIZ_REMARK_INFO_STR,v_remark_info);
            glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 30000);
            if(!lpTSCall1Ans4)  //  超时错误
            {
                lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.7.2]subcall timed out!");
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

//逻辑_清算期货_结算_结算处理定时任务
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

    //调用过程[事务_公共_公共接口_完成计划任务]
    //组织事务请求
    if(lpTSCall1Ans2)
    {
      lpTSCall1Ans2->FreeMsg();
      lpTSCall1Ans2=NULL;
    }
    lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("pubT.24.152", 0);
    lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req2->SetInt32(LDBIZ_TASK_NO_INT,v_task_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
    if(!lpTSCall1Ans2)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.152]subcall timed out!");
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
    strcpy(v_task_strike_status, lpTSCall1Ans2->GetString(LDBIZ_TASK_STRIKE_STATUS_STR));


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
    return iRet;
}

//逻辑_清算期货_结算_入账处理定时任务
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
    int v_ctrl_flag;
    int64 v_query_row_id;
    int64 v_row_id;
    int v_record_count;
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
    int v_contrc_dir;
    int v_lngsht_type;
    int v_hedge_type;
    double v_order_price;
    double v_order_qty;
    double v_pre_settle_price;
    double v_sett_price;
    double v_pre_entry_qty;
    double v_pre_entry_amt;
    double v_rece_margin;
    char v_comb_code[7];
    double v_sett_capt_margin;
    double v_sett_marked_pandl;
    int v_busi_flag;
    char v_entry_status[3];
    char v_undo_status[3];
    int64 v_entry_money_jour_no;
    int64 v_entry_posi_jour_no;
    int64 v_deli_jour_no;
    int64 v_entry_jour_no;
    char v_tmp_error_info[256];
    double v_capt_margin;
    double v_occur_amt;
    double v_occur_qty;
    char v_remark_info[256];
    double v_open_amount;
    int64 v_entry_exgp_posi_jour_no;
    int64 v_entry_asac_posi_jour_no;
    char v_deal_info[256];
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
    v_ctrl_flag=0;
    v_query_row_id=0;
    v_row_id=0;
    v_record_count=0;
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
    v_contrc_dir=0;
    v_lngsht_type=0;
    v_hedge_type=0;
    v_order_price=0;
    v_order_qty=0;
    v_pre_settle_price=0;
    v_sett_price=0;
    v_pre_entry_qty=0;
    v_pre_entry_amt=0;
    v_rece_margin=0;
    strcpy(v_comb_code, " ");
    v_sett_capt_margin=0;
    v_sett_marked_pandl=0;
    v_busi_flag=0;
    strcpy(v_entry_status, "0");
    strcpy(v_undo_status, "0");
    v_entry_money_jour_no=0;
    v_entry_posi_jour_no=0;
    v_deli_jour_no=0;
    v_entry_jour_no=0;
    strcpy(v_tmp_error_info, " ");
    v_capt_margin=0;
    v_occur_amt=0;
    v_occur_qty=0;
    strcpy(v_remark_info, " ");
    v_open_amount=0;
    v_entry_exgp_posi_jour_no=0;
    v_entry_asac_posi_jour_no=0;
    strcpy(v_deal_info, " ");
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


    // set @控制标志# = 2;
    v_ctrl_flag = 2;

    // set @查询记录序号#=0;
    v_query_row_id=0;
    //处理期货清算结算待入账记录表数据
    // loop_label:loop
    while (true)
    {

        //调用过程[事务_清算期货_结算_更新获取待入账记录]
        //组织事务请求
        if(lpTSCall1Ans2)
        {
          lpTSCall1Ans2->FreeMsg();
          lpTSCall1Ans2=NULL;
        }
        lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("clfutuT.3.43", 0);
        lpTSCall1Req2->SetInt32(LDTAG_PRIORITY, iPriority);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
        lpTSCall1Req2->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
        lpTSCall1Req2->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
        lpTSCall1Req2->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
        lpTSCall1Req2->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
        lpTSCall1Req2->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
        lpTSCall1Req2->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
        lpTSCall1Req2->SetInt64(LDBIZ_QUERY_ROW_ID_INT64,v_query_row_id);
        lpTSCall1Req2->SetInt32(LDBIZ_CTRL_FLAG_INT,v_ctrl_flag);
        glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
        if(!lpTSCall1Ans2)  //  超时错误
        {
            lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
            lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.3.43]subcall timed out!");
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
        v_record_count = lpTSCall1Ans2->GetInt32(LDBIZ_RECORD_COUNT_INT);
        v_init_date = lpTSCall1Ans2->GetInt32(LDBIZ_INIT_DATE_INT);
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
        v_contrc_dir = lpTSCall1Ans2->GetInt32(LDBIZ_CONTRC_DIR_INT);
        v_lngsht_type = lpTSCall1Ans2->GetInt32(LDBIZ_LNGSHT_TYPE_INT);
        v_hedge_type = lpTSCall1Ans2->GetInt32(LDBIZ_HEDGE_TYPE_INT);
        v_order_price = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_PRICE_FLOAT);
        v_order_qty = lpTSCall1Ans2->GetDouble(LDBIZ_ORDER_QTY_FLOAT);
        v_pre_settle_price = lpTSCall1Ans2->GetDouble(LDBIZ_PRE_SETTLE_PRICE_FLOAT);
        v_sett_price = lpTSCall1Ans2->GetDouble(LDBIZ_SETT_PRICE_FLOAT);
        v_pre_entry_qty = lpTSCall1Ans2->GetDouble(LDBIZ_PRE_ENTRY_QTY_FLOAT);
        v_pre_entry_amt = lpTSCall1Ans2->GetDouble(LDBIZ_PRE_ENTRY_AMT_FLOAT);
        v_rece_margin = lpTSCall1Ans2->GetDouble(LDBIZ_RECE_MARGIN_FLOAT);
        strcpy(v_comb_code, lpTSCall1Ans2->GetString(LDBIZ_COMB_CODE_STR));
        v_sett_capt_margin = lpTSCall1Ans2->GetDouble(LDBIZ_SETT_CAPT_MARGIN_FLOAT);
        v_sett_marked_pandl = lpTSCall1Ans2->GetDouble(LDBIZ_SETT_MARKED_PANDL_FLOAT);
        v_busi_flag = lpTSCall1Ans2->GetInt32(LDBIZ_BUSI_FLAG_INT);
        strcpy(v_entry_status, lpTSCall1Ans2->GetString(LDBIZ_ENTRY_STATUS_STR));
        strcpy(v_undo_status, lpTSCall1Ans2->GetString(LDBIZ_UNDO_STATUS_STR));
        v_entry_money_jour_no = lpTSCall1Ans2->GetInt64(LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
        v_entry_posi_jour_no = lpTSCall1Ans2->GetInt64(LDBIZ_ENTRY_POSI_JOUR_NO_INT64);
        v_deli_jour_no = lpTSCall1Ans2->GetInt64(LDBIZ_DELI_JOUR_NO_INT64);


        // if @错误编码# = "0" then
        if (strcmp(v_error_code , "0")==0)
        {

            // set @入账流水号#=@记录序号#;
            v_entry_jour_no=v_row_id;

            // set @临时_错误信息#="";
            strcpy(v_tmp_error_info,"");
            //期货资金入账处理，包括成交清算、费用入账、盯市盈亏入账、占用保证金入账
            //盯市盈亏入账时，调用单独的事务_产品期货_清算接口_期货盯市盈亏入账处理，其他调用事务_产品期货_清算接口_清算资金入账处理

            // if (@待入账金额# <> 0)  then
            if ((v_pre_entry_amt != 0) )
            {

                // set @占用保证金#=@清算占用保证金#;
                v_capt_margin=v_sett_capt_margin;

                // set @变动金额# = @待入账金额#;
                v_occur_amt = v_pre_entry_amt;

                // set @变动数量# = @待入账数量#;
                v_occur_qty = v_pre_entry_qty;

                // set @备注信息# = "结算入账定时任务资金入账！";
                strcpy(v_remark_info,"结算入账定时任务资金入账！");
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

                    // set @处理信息# = concat("错误编码=", @错误编码#,"错误信息=", @错误信息#);
                    snprintf(v_deal_info,sizeof(v_deal_info),"%s%s%s%s","错误编码=",v_error_code,"错误信息=",v_error_info);

                    // set @入账状态# = 《入账状态-未入账》;
                    strcpy(v_entry_status,"2");
                    //调用过程[事务_清算期货_结算_更新待入账记录入账状态]
                    //组织事务请求
                    if(lpTSCall1Ans4)
                    {
                      lpTSCall1Ans4->FreeMsg();
                      lpTSCall1Ans4=NULL;
                    }
                    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("clfutuT.3.40", 0);
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
                    lpTSCall1Req4->SetString(LDBIZ_ENTRY_STATUS_STR,v_entry_status);
                    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
                    if(!lpTSCall1Ans4)  //  超时错误
                    {
                        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
                        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[clfutuT.3.40]subcall timed out!");
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
    if(lpTSCall1Ans5)
    {
      lpTSCall1Ans5->FreeMsg();
      lpTSCall1Ans5=NULL;
    }
    lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pubT.24.152", 0);
    lpTSCall1Req5->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req5->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req5->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req5->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req5->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req5->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req5->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req5->SetInt32(LDBIZ_TASK_NO_INT,v_task_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
    if(!lpTSCall1Ans5)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.152]subcall timed out!");
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
    strcpy(v_task_strike_status, lpTSCall1Ans5->GetString(LDBIZ_TASK_STRIKE_STATUS_STR));


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
    return iRet;
}

