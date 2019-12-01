#include "MFCComFunc.h"
#include "Tools.h"
//#include "../MFCDLL/MFCDLL.h"
using namespace CLRTestDLL;


CLRMFCComFunc::CLRMFCComFunc(void)
{
}
CLRMFCComFunc::~CLRMFCComFunc(void)
{
}
#ifdef __cplusplus_cli
CLRMFCComFunc::!CLRMFCComFunc(void)
{
}
#else
void CLRMFCComFunc::Dispose()
{
}
#endif

int CLRMFCComFunc::AlertMFCMessageBox(String_GCPtr msg, String_GCPtr dllPath)
{
	//AlertMessageBox(StringTool::String2WString(msg));

	std::wstring wspath = StringTool::String2WString(dllPath);
	char szTemp[255] = {0};
	WCharToChar(wspath.c_str(), szTemp, 255);
	if (!pAlertMessageBox)
	{
		HINSTANCE hInstance = LoadLibraryA(szTemp);
		if (hInstance)
		{
			pAlertMessageBox = (AlertMessageBoxFunc)GetProcAddress(hInstance, "AlertMessageBox");
		}	
	}
	if (pAlertMessageBox)
	{
		pAlertMessageBox(StringTool::String2WString(msg));
	}
	return 0;
}