// MFCDLL.h : MFCDLL DLL 的主头文件
//

#pragma once
#include <afxwin.h>
#include <string>
using namespace std;
#ifndef __AFXWIN_H__
	#error "在包含此文件之前包含“stdafx.h”以生成 PCH 文件"
#endif

#include "resource.h"		// 主符号

extern "C"
{
	_declspec(dllexport) int AlertMessageBox(const wstring& szMessage);
	
}
int AlertMessageBox(const wstring& szMessage)
{
	AfxMessageBox(_T("MFC消息:") + CString(szMessage.c_str()));
	return 0;
}

// CMFCDLLApp
// 有关此类实现的信息，请参阅 MFCDLL.cpp
//

class CMFCDLLApp : public CWinApp
{
public:
	CMFCDLLApp();

// 重写
public:
	virtual BOOL InitInstance();

	DECLARE_MESSAGE_MAP()
};
