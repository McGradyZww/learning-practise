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
        strcpy(bizFuncInfo->szFuncName, "pdsecuL.4.1");
        bizFuncInfo->lpFunc = fnFunc0;
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
    return "20190719";
}

//逻辑_产品证券_公共接口_注销交易组
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
    int v_exch_group_no;
    int v_is_transfer_capital_posi;
    char v_oper_remark_info[256];
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int v_co_no;
    int v_tmp_co_no;
    char v_exch_group_status[3];
    char v_crncy_type[4];
    int v_init_date;
    char v_co_busi_config_str[65];
    int v_pd_no;
    int v_default_exch_group_no;
    int v_record_count;
    char v_asset_acco_no_str[2049];
    char v_default_exch_group_no_str[2049];
    char v_exch_group_code[33];
    char v_exch_group_name[65];
    int v_default_group_flag;
    double v_exch_group_begin_NAV;
    double v_exch_group_pd_share;
    int v_update_times;
    int64 v_row_id;
    int v_oper_rights;
    int v_exch_group_update_times;
    int v_push_type;
    char v_abolish_status[3];
    int64 v_posi_id;
    int v_asset_acco_no;
    int v_exch_no;
    int v_stock_acco_no;
    int v_stock_code_no;
    double v_strike_qty;
    double v_strike_price;
    double v_fair_price;
    int v_strike_date;
    int v_release_date;
    char v_log_error_code[33];
    char v_log_error_info[256];

    IGroup* lpMainMsg1=NULL;
    int iRecordCount = 0;
    IGroup* lpMainMsg2=NULL;
    IGroup* lpMainMsg3=NULL;
    IGroup* lpMainMsg4=NULL;
    IGroup* lpMainMsg5=NULL;
    IGroup* lpMainMsg6=NULL;

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
    v_exch_group_no=0;
    v_is_transfer_capital_posi=0;
    strcpy(v_oper_remark_info, " ");
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_co_no=0;
    v_tmp_co_no=0;
    strcpy(v_exch_group_status, "0");
    strcpy(v_crncy_type, "CNY");
    v_init_date=0;
    strcpy(v_co_busi_config_str, " ");
    v_pd_no=0;
    v_default_exch_group_no=0;
    v_record_count=0;
    strcpy(v_asset_acco_no_str, " ");
    strcpy(v_default_exch_group_no_str, " ");
    strcpy(v_exch_group_code, " ");
    strcpy(v_exch_group_name, " ");
    v_default_group_flag=0;
    v_exch_group_begin_NAV=0;
    v_exch_group_pd_share=0;
    v_update_times=1;
    v_row_id=0;
    v_oper_rights=0;
    v_exch_group_update_times=0;
    v_push_type=0;
    strcpy(v_abolish_status, "0");
    v_posi_id=0;
    v_asset_acco_no=0;
    v_exch_no=0;
    v_stock_acco_no=0;
    v_stock_code_no=0;
    v_strike_qty=0;
    v_strike_price=0;
    v_fair_price=0;
    v_strike_date=0;
    v_release_date=0;
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
    v_exch_group_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
    v_is_transfer_capital_posi = lpInBizMsg->GetInt32(LDBIZ_IS_TRANSFER_CAPITAL_POSI_INT);
    strncpy(v_oper_remark_info, lpInBizMsg->GetString(LDBIZ_OPER_REMARK_INFO_STR),255);
    v_oper_remark_info[255] = '\0';

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


    // set @机构编号# = @操作员机构编号#;
    v_co_no = v_opor_co_no;

    // set @临时_机构编号# = @交易组编号# / 10000;
    v_tmp_co_no = v_exch_group_no / 10000;

    // [检查报错返回][@临时_机构编号# <> @操作员机构编号#][50][@交易组编号#]
    if (v_tmp_co_no != v_opor_co_no)
    {
        strcpy(v_error_code, "pdsecuL.4.1.50");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d","交易组编号=",v_exch_group_no);
        iRet = -1;
        goto END;
    }


    // set @交易组状态# = 《交易组状态-注销》;
    strcpy(v_exch_group_status,"3");

    // set @本币币种# = "CNY";
    strcpy(v_crncy_type,"CNY");
    //调用过程[事务_公共_公共接口_检查系统状态权限身份交易组状态获取默认交易组编号]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.24.21", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    lpTSCall1Req0->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req0->SetString(LDBIZ_EXCH_GROUP_STATUS_STR,v_exch_group_status);
    lpTSCall1Req0->SetString(LDBIZ_OPOR_PWD_STR,v_opor_pwd);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.24.21]subcall timed out!");
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
    v_pd_no = lpTSCall1Ans0->GetInt32(LDBIZ_PD_NO_INT);
    v_default_exch_group_no = lpTSCall1Ans0->GetInt32(LDBIZ_DEFAULT_EXCH_GROUP_NO_INT);

    //先判断该交易组是否有待交收金额、待交收数量以及是否还有正逆回购,记录个数为0表示允许注销该交易组,否则不允许
    //调用过程[事务_产品证券_公共接口_判断交易组能否注销]
    //组织事务请求
    if(lpTSCall1Ans1)
    {
      lpTSCall1Ans1->FreeMsg();
      lpTSCall1Ans1=NULL;
    }
    lpTSCall1Req1=glpFastMsgFactory->CreateFastMessage("pdsecuT.4.3", 0);
    lpTSCall1Req1->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req1->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req1->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req1->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req1->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req1->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req1->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req1->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpTSCall1Req1->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req1, &lpTSCall1Ans1, 5000);
    if(!lpTSCall1Ans1)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.4.3]subcall timed out!");
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


    // [检查报错返回][@记录个数#>0][83][@交易组编号#]
    if (v_record_count>0)
    {
        strcpy(v_error_code, "pdsecuL.4.1.83");
        snprintf(v_error_info, sizeof(v_error_info), "%s%d","交易组编号=",v_exch_group_no);
        iRet = -1;
        goto END;
    }

    //判断是否将资金持仓转移至默认交易组

    // if @是否转移资金持仓#=1 then
    if (v_is_transfer_capital_posi==1)
    {
      //调用过程[事务_产品_公共接口_获取资产账户默认交易组关系]
      //组织事务请求
      if(lpTSCall1Ans2)
      {
        lpTSCall1Ans2->FreeMsg();
        lpTSCall1Ans2=NULL;
      }
      lpTSCall1Req2=glpFastMsgFactory->CreateFastMessage("prodT.6.48", 0);
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
      glpTSSubcallSerives->SubCall(lpTSCall1Req2, &lpTSCall1Ans2, 5000);
      if(!lpTSCall1Ans2)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[prodT.6.48]subcall timed out!");
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
      strcpy(v_asset_acco_no_str, lpTSCall1Ans2->GetString(LDBIZ_ASSET_ACCO_NO_STR_STR));
      strcpy(v_default_exch_group_no_str, lpTSCall1Ans2->GetString(LDBIZ_DEFAULT_EXCH_GROUP_NO_STR_STR));

      //资金转移,持仓转移
      //调用过程[事务_产品证券_公共接口_注销交易组转移资金持仓]
      //组织事务请求
      if(lpTSCall1Ans3)
      {
        lpTSCall1Ans3->FreeMsg();
        lpTSCall1Ans3=NULL;
      }
      lpTSCall1Req3=glpFastMsgFactory->CreateFastMessage("pdsecuT.4.4", 0);
      lpTSCall1Req3->SetInt32(LDTAG_PRIORITY, iPriority);
      lpTSCall1Req3->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
      lpTSCall1Req3->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
      lpTSCall1Req3->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
      lpTSCall1Req3->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
      lpTSCall1Req3->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
      lpTSCall1Req3->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
      lpTSCall1Req3->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
      lpTSCall1Req3->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
      lpTSCall1Req3->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
      lpTSCall1Req3->SetInt32(LDBIZ_DEFAULT_EXCH_GROUP_NO_INT,v_default_exch_group_no);
      lpTSCall1Req3->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
      lpTSCall1Req3->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
      lpTSCall1Req3->SetString(LDBIZ_ASSET_ACCO_NO_STR_STR,v_asset_acco_no_str);
      lpTSCall1Req3->SetString(LDBIZ_DEFAULT_EXCH_GROUP_NO_STR_STR,v_default_exch_group_no_str);
      glpTSSubcallSerives->SubCall(lpTSCall1Req3, &lpTSCall1Ans3, 5000);
      if(!lpTSCall1Ans3)  //  超时错误
      {
          lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
          lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.4.4]subcall timed out!");
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

    //elseif @是否转移资金持仓//=0 then
      //不转移 需回退资产账户及产品级的资金。
      //[事务_产品证券_公共接口_注销交易组回退资产账户资金持仓]
     // [事务_产品_公共接口_注销回退产品资金]
    // end if;
    }

    //调用过程[事务_公共_用户客户端_更新交易组状态]
    //组织事务请求
    if(lpTSCall1Ans4)
    {
      lpTSCall1Ans4->FreeMsg();
      lpTSCall1Ans4=NULL;
    }
    lpTSCall1Req4=glpFastMsgFactory->CreateFastMessage("pubT.19.56", 0);
    lpTSCall1Req4->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req4->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req4->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req4->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req4->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req4->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req4->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req4->SetInt32(LDBIZ_INIT_DATE_INT,v_init_date);
    lpTSCall1Req4->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpTSCall1Req4->SetString(LDBIZ_EXCH_GROUP_STATUS_STR,v_exch_group_status);
    lpTSCall1Req4->SetString(LDBIZ_OPER_REMARK_INFO_STR,v_oper_remark_info);
    lpTSCall1Req4->SetInt32(LDBIZ_MENU_NO_INT,v_menu_no);
    glpTSSubcallSerives->SubCall(lpTSCall1Req4, &lpTSCall1Ans4, 5000);
    if(!lpTSCall1Ans4)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pubT.19.56]subcall timed out!");
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
    strcpy(v_exch_group_code, lpTSCall1Ans4->GetString(LDBIZ_EXCH_GROUP_CODE_STR));
    strcpy(v_exch_group_name, lpTSCall1Ans4->GetString(LDBIZ_EXCH_GROUP_NAME_STR));
    v_default_group_flag = lpTSCall1Ans4->GetInt32(LDBIZ_DEFAULT_GROUP_FLAG_INT);
    v_exch_group_begin_NAV = lpTSCall1Ans4->GetDouble(LDBIZ_EXCH_GROUP_BEGIN_NAV_FLOAT);
    v_exch_group_pd_share = lpTSCall1Ans4->GetDouble(LDBIZ_EXCH_GROUP_PD_SHARE_FLOAT);
    v_update_times = lpTSCall1Ans4->GetInt32(LDBIZ_UPDATE_TIMES_INT);
    v_row_id = lpTSCall1Ans4->GetInt64(LDBIZ_ROW_ID_INT64);
    v_oper_rights = lpTSCall1Ans4->GetInt32(LDBIZ_OPER_RIGHTS_INT);
    v_exch_group_update_times = lpTSCall1Ans4->GetInt32(LDBIZ_EXCH_GROUP_UPDATE_TIMES_INT);


    // [主动推送][user.exchgroup][用户主推_用户_交易组信息主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.200", 0);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetString(LDBIZ_EXCH_GROUP_CODE_STR,v_exch_group_code);
    lpPubMsg->SetString(LDBIZ_EXCH_GROUP_NAME_STR,v_exch_group_name);
    lpPubMsg->SetString(LDBIZ_EXCH_GROUP_STATUS_STR,v_exch_group_status);
    lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_BEGIN_NAV_FLOAT,v_exch_group_begin_NAV);
    lpPubMsg->SetDouble(LDBIZ_EXCH_GROUP_PD_SHARE_FLOAT,v_exch_group_pd_share);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("user.exchgroup", lpPubMsg);

    //修改操作员所属交易组 注销标志。主推

    // set @主推类型# =1;
    v_push_type =1;

    // set @注销标志# =1;
    strcpy(v_abolish_status,"1");

    // set @更新次数# =@交易组更新次数#;
    v_update_times =v_exch_group_update_times;

    // [主动推送][user.oporexgprights][用户主推_操作员交易组_操作员交易组权限主推消息]
    lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.206", 0);
    lpPubMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
    lpPubMsg->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
    lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
    lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
    lpPubMsg->SetString(LDBIZ_ABOLISH_STATUS_STR,v_abolish_status);
    lpPubMsg->SetInt32(LDBIZ_OPER_RIGHTS_INT,v_oper_rights);
    lpPubMsg->SetInt32(LDBIZ_PUSH_TYPE_INT,v_push_type);
    lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
    glpPubSub_Interface->PubTopics("user.oporexgprights", lpPubMsg);

    //调用过程[事务_产品证券_公共接口_查询交易组大宗持仓]
    //组织事务请求
    if(lpTSCall1Ans5)
    {
      lpTSCall1Ans5->FreeMsg();
      lpTSCall1Ans5=NULL;
    }
    lpTSCall1Req5=glpFastMsgFactory->CreateFastMessage("pdsecuT.4.113", 0);
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
    glpTSSubcallSerives->SubCall(lpTSCall1Req5, &lpTSCall1Ans5, 5000);
    if(!lpTSCall1Ans5)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.4.113]subcall timed out!");
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


    // [获取结果集][lpMainMsg1]
    lpMainMsg1=lpTSCall1Ans5->GetGroup(LDTAG_NO_RESULTSET);


    // [遍历结果集开始][lpMainMsg1]
    iRecordCount = lpMainMsg1->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpMainMsg1->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            v_posi_id = lpRecord->GetInt64(LDBIZ_POSI_ID_INT64);
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
            v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
            v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
            v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
            v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
            v_strike_qty = lpRecord->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
            v_strike_price = lpRecord->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
            v_fair_price = lpRecord->GetDouble(LDBIZ_FAIR_PRICE_FLOAT);
            v_strike_date = lpRecord->GetInt32(LDBIZ_STRIKE_DATE_INT);
            v_release_date = lpRecord->GetInt32(LDBIZ_RELEASE_DATE_INT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


         // [主动推送][secu.pdblocktradeposi][证券主推_产品持仓_大宗交易持仓主推消息]
         lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.83", 0);
         lpPubMsg->SetInt64(LDBIZ_POSI_ID_INT64,v_posi_id);
         lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
         lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
         lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
         lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
         lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
         lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
         lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
         lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
         lpPubMsg->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
         lpPubMsg->SetDouble(LDBIZ_FAIR_PRICE_FLOAT,v_fair_price);
         lpPubMsg->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
         lpPubMsg->SetInt32(LDBIZ_RELEASE_DATE_INT,v_release_date);
         lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
         glpPubSub_Interface->PubTopics("secu.pdblocktradeposi", lpPubMsg);


    // [遍历结果集结束][lpMainMsg1]
        }
    }

    //set @交易组编号// = @默认交易组编号//;
    //调用过程[事务_产品证券_公共接口_查询默认交易组大宗持仓]
    //组织事务请求
    if(lpTSCall1Ans6)
    {
      lpTSCall1Ans6->FreeMsg();
      lpTSCall1Ans6=NULL;
    }
    lpTSCall1Req6=glpFastMsgFactory->CreateFastMessage("pdsecuT.4.117", 0);
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
    lpTSCall1Req6->SetString(LDBIZ_DEFAULT_EXCH_GROUP_NO_STR_STR,v_default_exch_group_no_str);
    glpTSSubcallSerives->SubCall(lpTSCall1Req6, &lpTSCall1Ans6, 5000);
    if(!lpTSCall1Ans6)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "[pdsecuT.4.117]subcall timed out!");
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


    // [获取结果集][lpMainMsg2]
    lpMainMsg2=lpTSCall1Ans6->GetGroup(LDTAG_NO_RESULTSET);


    // [遍历结果集开始][lpMainMsg2]
    iRecordCount = lpMainMsg2->GetRecordCount();
    for (int i = 0; i < iRecordCount;i++) 
    {
        IRecord* lpRecord =lpMainMsg2->GetRecord(i);
        if(lpRecord)
        {

            //获取记录字段值
            v_posi_id = lpRecord->GetInt64(LDBIZ_POSI_ID_INT64);
            v_co_no = lpRecord->GetInt32(LDBIZ_CO_NO_INT);
            v_pd_no = lpRecord->GetInt32(LDBIZ_PD_NO_INT);
            v_exch_group_no = lpRecord->GetInt32(LDBIZ_EXCH_GROUP_NO_INT);
            v_asset_acco_no = lpRecord->GetInt32(LDBIZ_ASSET_ACCO_NO_INT);
            v_exch_no = lpRecord->GetInt32(LDBIZ_EXCH_NO_INT);
            v_stock_acco_no = lpRecord->GetInt32(LDBIZ_STOCK_ACCO_NO_INT);
            v_stock_code_no = lpRecord->GetInt32(LDBIZ_STOCK_CODE_NO_INT);
            v_strike_qty = lpRecord->GetDouble(LDBIZ_STRIKE_QTY_FLOAT);
            v_strike_price = lpRecord->GetDouble(LDBIZ_STRIKE_PRICE_FLOAT);
            v_fair_price = lpRecord->GetDouble(LDBIZ_FAIR_PRICE_FLOAT);
            v_strike_date = lpRecord->GetInt32(LDBIZ_STRIKE_DATE_INT);
            v_release_date = lpRecord->GetInt32(LDBIZ_RELEASE_DATE_INT);
            v_update_times = lpRecord->GetInt32(LDBIZ_UPDATE_TIMES_INT);


         // [主动推送][secu.pdblocktradeposi][证券主推_产品持仓_大宗交易持仓主推消息]
         lpPubMsg = glpFastMsgFactory->CreateFastMessage("pushL.2.83", 0);
         lpPubMsg->SetInt64(LDBIZ_POSI_ID_INT64,v_posi_id);
         lpPubMsg->SetInt32(LDBIZ_CO_NO_INT,v_co_no);
         lpPubMsg->SetInt32(LDBIZ_PD_NO_INT,v_pd_no);
         lpPubMsg->SetInt32(LDBIZ_EXCH_GROUP_NO_INT,v_exch_group_no);
         lpPubMsg->SetInt32(LDBIZ_ASSET_ACCO_NO_INT,v_asset_acco_no);
         lpPubMsg->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
         lpPubMsg->SetInt32(LDBIZ_STOCK_ACCO_NO_INT,v_stock_acco_no);
         lpPubMsg->SetInt32(LDBIZ_STOCK_CODE_NO_INT,v_stock_code_no);
         lpPubMsg->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
         lpPubMsg->SetDouble(LDBIZ_STRIKE_PRICE_FLOAT,v_strike_price);
         lpPubMsg->SetDouble(LDBIZ_FAIR_PRICE_FLOAT,v_fair_price);
         lpPubMsg->SetInt32(LDBIZ_STRIKE_DATE_INT,v_strike_date);
         lpPubMsg->SetInt32(LDBIZ_RELEASE_DATE_INT,v_release_date);
         lpPubMsg->SetInt32(LDBIZ_UPDATE_TIMES_INT,v_update_times);
         glpPubSub_Interface->PubTopics("secu.pdblocktradeposi", lpPubMsg);


    // [遍历结果集结束][lpMainMsg2]
        }
    }

    //产品、资产账户、交易组资金主推，资产账户、交易组持仓主推。
    //if @是否转移资金持仓//=0 then
        //set @更新次数// = @产品更新次数//;
        //[主动推送][prod.prodcapital][产品主推_产品资金_产品资金主推消息]
         //交易组注销涉及到的资帐资金。
     //    [事务_产品证券_公共接口_查询交易组资金信息]
       //  [获取结果集][lpMainMsg3]
       //  [遍历结果集开始][lpMainMsg3]
       //       [主动推送][secu.pdexgpcapital][证券主推_产品资金_交易组资金主推消息]
      //   [遍历结果集结束][lpMainMsg3]
      //   [事务_产品证券_公共接口_查询交易组持仓信息]
     //    [获取结果集][lpMainMsg4]
      //   [遍历结果集开始][lpMainMsg4]
       //       [主动推送][secu.pdexgpposi][证券主推_产品持仓_交易组持仓主推消息]
        // [遍历结果集结束][lpMainMsg4]
        // [事务_产品证券_公共接口_查询资产账户资金信息]
       //  [获取结果集][lpMainMsg5]
        // [遍历结果集开始][lpMainMsg5]
       //       [主动推送][secu.pdasaccapital][证券主推_产品资金_资产账户资金主推消息]
        // [遍历结果集结束][lpMainMsg5]
       //  [事务_产品证券_公共接口_查询资产账户持仓信息]
       //  [获取结果集][lpMainMsg6]
        // [遍历结果集开始][lpMainMsg6]
       //       [主动推送][secu.pdasacposi][证券主推_产品持仓_资产账户持仓主推消息]
       //  [遍历结果集结束][lpMainMsg6]
    //end if;

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

