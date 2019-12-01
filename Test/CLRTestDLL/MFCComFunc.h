#pragma once
#include <windows.h>
#include <minwindef.h>
#include <WinBase.h>
#include "Myclr.h"

typedef int(__stdcall *AlertMessageBoxFunc)(const std::wstring& szMessage);
AlertMessageBoxFunc pAlertMessageBox = NULL;

void GetExeDirectory(TCHAR sRootDir[MAX_PATH])
{
	HMODULE hMod = GetModuleHandle(L"MFCDLL.dll");
	if (hMod != NULL)
	{
		GetModuleFileName(hMod, sRootDir, sizeof(sRootDir) / sizeof(TCHAR) - 1);
	}

}


namespace CLRTestDLL
{
#ifdef __cplusplus_cli
	public ref class CLRMFCComFunc
#else
	public __gc class CLRMFCComFunc
#endif
	{
		// TODO:  在此处添加此类的方法。
	public:
		CLRMFCComFunc(void);
		virtual ~CLRMFCComFunc(void);
#ifdef __cplusplus_cli
		!CLRMFCComFunc(void);
#else
		virtual void Dispose();
#endif

		static int AlertMFCMessageBox(String_GCPtr msg, String_GCPtr dllPath);
	};
}



