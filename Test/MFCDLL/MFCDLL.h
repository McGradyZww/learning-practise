// MFCDLL.h : MFCDLL DLL ����ͷ�ļ�
//

#pragma once
#include <afxwin.h>
#include <string>
using namespace std;
#ifndef __AFXWIN_H__
	#error "�ڰ������ļ�֮ǰ������stdafx.h�������� PCH �ļ�"
#endif

#include "resource.h"		// ������

extern "C"
{
	_declspec(dllexport) int AlertMessageBox(const wstring& szMessage);
	
}
int AlertMessageBox(const wstring& szMessage)
{
	AfxMessageBox(_T("MFC��Ϣ:") + CString(szMessage.c_str()));
	return 0;
}

// CMFCDLLApp
// �йش���ʵ�ֵ���Ϣ������� MFCDLL.cpp
//

class CMFCDLLApp : public CWinApp
{
public:
	CMFCDLLApp();

// ��д
public:
	virtual BOOL InitInstance();

	DECLARE_MESSAGE_MAP()
};
