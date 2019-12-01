#include <Include/ld_db_interface.h>
#include <Include/modules_id.h>
#include <Include/tag_def.h>
#include <Include/ts_subcall_interface.h>
#include <Include/fastmsg_factory_interface.h>
#include <Include/subpub_interface.h>
#include "LdHqstructnew.h"
#include <Include/comexport.h>
#include <Include/biz_tag_def.h>
#include <pub/ldstring.h>
#include <pub/lddate.h>
#include <math.h>

ITS_Subcall_interface* glpTSSubcallSerives = NULL;
IFastmsgFactory_Interface* glpFastMsgFactory = NULL;
IPubSub_interface* glpPubSub_Interface = NULL;
IUnKnown* glpProcessor=NULL;

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

    IUnKnown* lpPubSubInt = NULL;
    IUnKnown* lpPubSubSvr = lpContainer->GetMouleByName(MODULE_PUBSUBSVR);
    if(lpPubSubSvr)
    {
        lpPubSubSvr->QueryInterface(MODULE_PUBSUBINT, &lpPubSubInt);
        glpPubSub_Interface=(IPubSub_interface*)lpPubSubInt;
    }
	glpProcessor=lpProcessor;
    return;
}
API_EXPORT void LD_CALL_MODE Onunload()
{

    return;
}

API_EXPORT void LD_CALL_MODE Onstart()
{
	//IFastMessage* lpFastMsg = NULL;
	//lpFastMsg = glpFastMsgFactory->CreateFastMessage("LMWS.push.1", 0);
	//glpPubSub_Interface->SubTopics(glpProcessor, "quote.realtime", lpFastMsg);	
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
        strcpy(bizFuncInfo->szFuncName, "dcL.2.1");//行情-订阅
        bizFuncInfo->lpFunc = fnFunc0;
    }
    else if (iFunIndex==1)
    {
        strcpy(bizFuncInfo->szFuncName, "dcL.2.2");//行情-初始化
        bizFuncInfo->lpFunc = fnFunc1;
    }
    else if (iFunIndex==2)
    {
        strcpy(bizFuncInfo->szFuncName, "pubL.16.5");//行情-处理
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
    return "20190122";
}

//逻辑_订阅
int LD_CALL_MODE fnFunc0(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect)
{

    return 0;
}


//逻辑__初始化证券代码信息
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
    int v_exch_no;
    char v_stock_code[7];
    char v_stock_name[65];
    char v_pinyin_short[17];
    double v_up_limit_price;
    double v_down_limit_price;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    int64 v_row_id;
    char v_log_error_code[17];
    char v_log_error_info[256];
	
    double v_last_price;
    double v_pre_close_price;
    char v_stop_status[3];
    double v_today_open_price;
    double v_today_close_price;
    double v_today_max_price;
    double v_today_min_price;
    double v_buy_price_1;
    double v_buy_qty_1;
    double v_buy_price_2;
    double v_buy_qty_2;
    double v_buy_price_3;
    double v_buy_qty_3;
    double v_buy_price_4;
    double v_buy_qty_4;
    double v_buy_price_5;
    double v_buy_qty_5;
    double v_sell_price_1;
    double v_sell_qty_1;
    double v_sell_price_2;
    double v_sell_qty_2;
    double v_sell_price_3;
    double v_sell_qty_3;
    double v_sell_price_4;
    double v_sell_qty_4;
    double v_sell_price_5;
    double v_sell_qty_5;
    double v_strike_qty;
    double v_strike_amt;


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
    v_exch_no=0;
    strcpy(v_stock_code, " ");
    strcpy(v_stock_name, " ");
    strcpy(v_pinyin_short, " ");
    v_up_limit_price=0;
    v_down_limit_price=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    v_row_id=0;
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

	CStockLevelRealTimeData* lpStockReal;
	int iStockRealLen;
	lpStockReal=(CStockLevelRealTimeData*)lpInBizMsg->GetRawData(LDBIZ_QUOT_PRICE_INFO_STR, &iStockRealLen);
	
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
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    strncpy(v_stock_code, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR),6);
    v_stock_code[6] = '\0';
    strncpy(v_stock_name, lpInBizMsg->GetString(LDBIZ_STOCK_NAME_STR),64);
    v_stock_name[64] = '\0';
    strncpy(v_pinyin_short, lpInBizMsg->GetString(LDBIZ_PINYIN_SHORT_STR),16);
    v_pinyin_short[16] = '\0';

    v_last_price = ((double)lpStockReal->m_stockLevelRealTime.m_lNewPrice);
    v_pre_close_price = ((double)lpStockReal->m_lPrevClose)/1000;
    sprintf(v_stop_status, "%d", lpStockReal->m_lStopFlag);
    v_stop_status[2] = '\0';
    v_up_limit_price = ((double)lpStockReal->m_lUpPrice)/1000;
    v_down_limit_price = ((double)lpStockReal->m_lDownPrice)/1000;
    v_today_open_price = ((double)lpStockReal->m_stockLevelRealTime.m_lOpen)/1000;
    v_today_close_price = v_last_price;
    v_today_max_price = ((double)lpStockReal->m_stockLevelRealTime.m_lMaxPrice)/1000;
    v_today_min_price = ((double)lpStockReal->m_stockLevelRealTime.m_lMinPrice)/1000;
    v_buy_price_1 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyPrice1)/1000;
    v_buy_qty_1 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyCount1);

    v_buy_price_2 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyPrice2)/1000;
    v_buy_qty_2 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyCount2);

    v_buy_price_3 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyPrice3)/1000;
    v_buy_qty_3 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyCount3);

    v_buy_price_4 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyPrice4)/1000;
    v_buy_qty_4 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyCount4);

    v_buy_price_5 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyPrice5)/1000;
    v_buy_qty_5 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyCount5);


    v_sell_price_1 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellPrice1)/1000;
    v_sell_qty_1 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellCount1);

    v_sell_price_2 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellPrice2)/1000;
    v_sell_qty_2 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellCount2);

    v_sell_price_3 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellPrice3)/1000;
    v_sell_qty_3 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellCount3);

    v_sell_price_4 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellPrice4)/1000;
    v_sell_qty_4 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellCount4);

    v_sell_price_5 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellPrice5)/1000;
    v_sell_qty_5 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellCount5);


    v_strike_qty = ((double)lpStockReal->m_stockLevelRealTime.m_lTotal);
    v_strike_amt = ((double)lpStockReal->m_stockLevelRealTime.m_fAvgPrice);

	
    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;

    //调用过程[事务_公共_证券行情服务_初始化证券代码信息]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.16.1", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req0->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req0->SetString(LDBIZ_STOCK_NAME_STR,v_stock_name);
    lpTSCall1Req0->SetString(LDBIZ_PINYIN_SHORT_STR,v_pinyin_short);
    lpTSCall1Req0->SetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT,v_up_limit_price);
    lpTSCall1Req0->SetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT,v_down_limit_price);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "subcall timed out!");
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
    lpOutBizMsg->SetInt64(LDBIZ_ROW_ID_INT64,v_row_id);
ENDSYS:
    if(lpTSCall1Ans0)
        lpTSCall1Ans0->FreeMsg();
    if(lpTSCall1Ans1)
        lpTSCall1Ans1->FreeMsg();
	
    return iRet;
}

//逻辑__更新证券代码行情
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
    int v_exch_no;
	int v_price_unit;
    char v_stock_code[7];
    double v_last_price;
    double v_pre_close_price;
    char v_stop_status[3];
    double v_up_limit_price;
    double v_down_limit_price;
    double v_today_open_price;
    double v_today_close_price;
    double v_today_max_price;
    double v_today_min_price;
    double v_buy_price_1;
    double v_buy_qty_1;
    double v_buy_price_2;
    double v_buy_qty_2;
    double v_buy_price_3;
    double v_buy_qty_3;
    double v_buy_price_4;
    double v_buy_qty_4;
    double v_buy_price_5;
    double v_buy_qty_5;
    double v_sell_price_1;
    double v_sell_qty_1;
    double v_sell_price_2;
    double v_sell_qty_2;
    double v_sell_price_3;
    double v_sell_qty_3;
    double v_sell_price_4;
    double v_sell_qty_4;
    double v_sell_price_5;
    double v_sell_qty_5;
    double v_strike_qty;
    double v_strike_amt;
    char v_error_code[33];
    char v_error_info[256];
    int v_error_level;
    char v_error_deal[1025];
    char v_error_prompt[256];
    char v_log_error_code[17];
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
    v_exch_no=0;
	v_price_unit = 0;
    strcpy(v_stock_code, " ");
    v_last_price=0;
    v_pre_close_price=0;
    strcpy(v_stop_status, "0");
    v_up_limit_price=0;
    v_down_limit_price=0;
    v_today_open_price=0;
    v_today_close_price=0;
    v_today_max_price=0;
    v_today_min_price=0;
    v_buy_price_1=0;
    v_buy_qty_1=0;
    v_buy_price_2=0;
    v_buy_qty_2=0;
    v_buy_price_3=0;
    v_buy_qty_3=0;
    v_buy_price_4=0;
    v_buy_qty_4=0;
    v_buy_price_5=0;
    v_buy_qty_5=0;
    v_sell_price_1=0;
    v_sell_qty_1=0;
    v_sell_price_2=0;
    v_sell_qty_2=0;
    v_sell_price_3=0;
    v_sell_qty_3=0;
    v_sell_price_4=0;
    v_sell_qty_4=0;
    v_sell_price_5=0;
    v_sell_qty_5=0;
    v_strike_qty=0;
    v_strike_amt=0;
    strcpy(v_error_code, "0");
    strcpy(v_error_info, " ");
    v_error_level=0;
    strcpy(v_error_deal, " ");
    strcpy(v_error_prompt, " ");
    strcpy(v_log_error_code, "0");
    strcpy(v_log_error_info, " ");

	CStockLevelRealTimeData* lpStockReal;
	int iStockRealLen;
	lpStockReal=(CStockLevelRealTimeData*)lpInBizMsg->GetRawData(LDBIZ_QUOT_PRICE_INFO_STR, &iStockRealLen);
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
    v_exch_no = lpInBizMsg->GetInt32(LDBIZ_EXCH_NO_INT);
    strncpy(v_stock_code, lpInBizMsg->GetString(LDBIZ_STOCK_CODE_STR),6);
    v_stock_code[6] = '\0';   
	v_price_unit = lpStockReal->m_nPriceUnit;
	if(v_price_unit<=0)
	{
		v_price_unit = 1000;
	}
    v_last_price = ((double)lpStockReal->m_stockLevelRealTime.m_lNewPrice)/v_price_unit;
    v_pre_close_price = ((double)lpStockReal->m_lPrevClose)/v_price_unit;
    sprintf(v_stop_status, "%d", lpStockReal->m_lStopFlag);
    v_stop_status[2] = '\0';
    v_up_limit_price = ((double)lpStockReal->m_lUpPrice)/v_price_unit;
    v_down_limit_price = ((double)lpStockReal->m_lDownPrice)/v_price_unit;
    v_today_open_price = ((double)lpStockReal->m_stockLevelRealTime.m_lOpen)/v_price_unit;
    v_today_close_price = v_last_price;
    v_today_max_price = ((double)lpStockReal->m_stockLevelRealTime.m_lMaxPrice)/v_price_unit;
    v_today_min_price = ((double)lpStockReal->m_stockLevelRealTime.m_lMinPrice)/v_price_unit;
    v_buy_price_1 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyPrice1)/v_price_unit;
    v_buy_qty_1 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyCount1);

    v_buy_price_2 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyPrice2)/v_price_unit;
    v_buy_qty_2 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyCount2);

    v_buy_price_3 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyPrice3)/v_price_unit;
    v_buy_qty_3 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyCount3);

    v_buy_price_4 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyPrice4)/v_price_unit;
    v_buy_qty_4 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyCount4);

    v_buy_price_5 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyPrice5)/v_price_unit;
    v_buy_qty_5 = ((double)lpStockReal->m_stockLevelRealTime.m_lBuyCount5);


    v_sell_price_1 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellPrice1)/v_price_unit;
    v_sell_qty_1 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellCount1);

    v_sell_price_2 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellPrice2)/v_price_unit;
    v_sell_qty_2 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellCount2);

    v_sell_price_3 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellPrice3)/v_price_unit;
    v_sell_qty_3 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellCount3);

    v_sell_price_4 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellPrice4)/v_price_unit;
    v_sell_qty_4 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellCount4);

    v_sell_price_5 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellPrice5)/v_price_unit;
    v_sell_qty_5 = ((double)lpStockReal->m_stockLevelRealTime.m_lSellCount5);

    v_strike_qty = ((double)lpStockReal->m_stockLevelRealTime.m_lTotal);
    v_strike_amt = ((double)lpStockReal->m_stockLevelRealTime.m_fAvgPrice); //成交金额

    IFastMessage* lpTSCall1Req0 = NULL;
    IFastMessage* lpTSCall1Ans0 = NULL;
    IFastMessage* lpTSCall1Req1 = NULL;
    IFastMessage* lpTSCall1Ans1 = NULL;


    // if @最新价# = 0 then
    if (v_last_price <0.00001)
    {

      // set @最新价# = @昨收盘价#;
      v_last_price = v_pre_close_price;
    // end if;
    }

    //调用过程[事务_公共_证券行情服务_更新证券代码行情]
    //组织事务请求
    if(lpTSCall1Ans0)
    {
      lpTSCall1Ans0->FreeMsg();
      lpTSCall1Ans0=NULL;
    }
    lpTSCall1Req0=glpFastMsgFactory->CreateFastMessage("pubT.16.2", 0);
    lpTSCall1Req0->SetInt32(LDTAG_PRIORITY, iPriority);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_CO_NO_INT,v_opor_co_no);
    lpTSCall1Req0->SetInt32(LDBIZ_OPOR_NO_INT,v_opor_no);
    lpTSCall1Req0->SetString(LDBIZ_OPER_MAC_STR,v_oper_mac);
    lpTSCall1Req0->SetString(LDBIZ_OPER_IP_ADDR_STR,v_oper_ip_addr);
    lpTSCall1Req0->SetString(LDBIZ_OPER_INFO_STR,v_oper_info);
    lpTSCall1Req0->SetString(LDBIZ_OPER_WAY_STR,v_oper_way);
    lpTSCall1Req0->SetString(LDBIZ_FUNC_CODE_STR,v_func_code);
    lpTSCall1Req0->SetInt32(LDBIZ_EXCH_NO_INT,v_exch_no);
    lpTSCall1Req0->SetString(LDBIZ_STOCK_CODE_STR,v_stock_code);
    lpTSCall1Req0->SetDouble(LDBIZ_LAST_PRICE_FLOAT,v_last_price);
    lpTSCall1Req0->SetDouble(LDBIZ_PRE_CLOSE_PRICE_FLOAT,v_pre_close_price);
    lpTSCall1Req0->SetString(LDBIZ_STOP_STATUS_STR,v_stop_status);
    lpTSCall1Req0->SetDouble(LDBIZ_UP_LIMIT_PRICE_FLOAT,v_up_limit_price);
    lpTSCall1Req0->SetDouble(LDBIZ_DOWN_LIMIT_PRICE_FLOAT,v_down_limit_price);
    lpTSCall1Req0->SetDouble(LDBIZ_TODAY_OPEN_PRICE_FLOAT,v_today_open_price);
    lpTSCall1Req0->SetDouble(LDBIZ_TODAY_CLOSE_PRICE_FLOAT,v_today_close_price);
    lpTSCall1Req0->SetDouble(LDBIZ_TODAY_MAX_PRICE_FLOAT,v_today_max_price);
    lpTSCall1Req0->SetDouble(LDBIZ_TODAY_MIN_PRICE_FLOAT,v_today_min_price);
    lpTSCall1Req0->SetDouble(LDBIZ_BUY_PRICE_1_FLOAT,v_buy_price_1);
    lpTSCall1Req0->SetDouble(LDBIZ_BUY_QTY_1_FLOAT,v_buy_qty_1);
    lpTSCall1Req0->SetDouble(LDBIZ_BUY_PRICE_2_FLOAT,v_buy_price_2);
    lpTSCall1Req0->SetDouble(LDBIZ_BUY_QTY_2_FLOAT,v_buy_qty_2);
    lpTSCall1Req0->SetDouble(LDBIZ_BUY_PRICE_3_FLOAT,v_buy_price_3);
    lpTSCall1Req0->SetDouble(LDBIZ_BUY_QTY_3_FLOAT,v_buy_qty_3);
    lpTSCall1Req0->SetDouble(LDBIZ_BUY_PRICE_4_FLOAT,v_buy_price_4);
    lpTSCall1Req0->SetDouble(LDBIZ_BUY_QTY_4_FLOAT,v_buy_qty_4);
    lpTSCall1Req0->SetDouble(LDBIZ_BUY_PRICE_5_FLOAT,v_buy_price_5);
    lpTSCall1Req0->SetDouble(LDBIZ_BUY_QTY_5_FLOAT,v_buy_qty_5);
    lpTSCall1Req0->SetDouble(LDBIZ_SELL_PRICE_1_FLOAT,v_sell_price_1);
    lpTSCall1Req0->SetDouble(LDBIZ_SELL_QTY_1_FLOAT,v_sell_qty_1);
    lpTSCall1Req0->SetDouble(LDBIZ_SELL_PRICE_2_FLOAT,v_sell_price_2);
    lpTSCall1Req0->SetDouble(LDBIZ_SELL_QTY_2_FLOAT,v_sell_qty_2);
    lpTSCall1Req0->SetDouble(LDBIZ_SELL_PRICE_3_FLOAT,v_sell_price_3);
    lpTSCall1Req0->SetDouble(LDBIZ_SELL_QTY_3_FLOAT,v_sell_qty_3);
    lpTSCall1Req0->SetDouble(LDBIZ_SELL_PRICE_4_FLOAT,v_sell_price_4);
    lpTSCall1Req0->SetDouble(LDBIZ_SELL_QTY_4_FLOAT,v_sell_qty_4);
    lpTSCall1Req0->SetDouble(LDBIZ_SELL_PRICE_5_FLOAT,v_sell_price_5);
    lpTSCall1Req0->SetDouble(LDBIZ_SELL_QTY_5_FLOAT,v_sell_qty_5);
    lpTSCall1Req0->SetDouble(LDBIZ_STRIKE_QTY_FLOAT,v_strike_qty);
    lpTSCall1Req0->SetDouble(LDBIZ_STRIKE_AMT_FLOAT,v_strike_amt);
    glpTSSubcallSerives->SubCall(lpTSCall1Req0, &lpTSCall1Ans0, 5000);
	
    if(!lpTSCall1Ans0)  //  超时错误
    {
        lpOutBizMsg->SetInt32(LDTAG_ERRORNO, -1);
        lpOutBizMsg->SetString(LDTAG_ERRORINFO, "subcall timed out!");
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

