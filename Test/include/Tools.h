#ifndef _TOOLS_H_
#define _TOOLS_H_

#include <windows.h>
#include <minwindef.h>
#include <WinBase.h>

inline WCHAR* UTF82WChar(const char* pszSource, WCHAR* ptszTarget, int nTargetLen)
{
	if (NULL != pszSource)
	{
		::MultiByteToWideChar(CP_UTF8, NULL, pszSource, strlen(pszSource), ptszTarget, nTargetLen);
	}
	return ptszTarget;
}
inline char* WCharToChar(const WCHAR* ptszSource, char* pszTarget, int nTargetLen)
{
	if (NULL != ptszSource)
	{
		::WideCharToMultiByte(CP_ACP, NULL, ptszSource, wcslen(ptszSource), pszTarget, nTargetLen, NULL, NULL);
	}
	return pszTarget;
}
inline char* UTF82Char(const char* pszSource, char* pszTarget, int nTargetLen)
{
	WCHAR wszTemp[256] = L"";
	UTF82WChar(pszSource, wszTemp, sizeof(wszTemp));
	WCharToChar(wszTemp, pszTarget, nTargetLen);
	return pszTarget;
}
inline char* WCHAR2UTF8(const WCHAR* ptszSource, char* pszTarget, int nTargetLen)
{
	if (NULL != ptszSource)
	{
		::WideCharToMultiByte(CP_UTF8, NULL, ptszSource, wcslen(ptszSource), pszTarget, nTargetLen, NULL, NULL);
	}
	return pszTarget;
}
inline WCHAR* CHARToWCHAR(const char* pszSource, WCHAR* ptszTarget, int nTargetLen)
{
	if (NULL != pszSource)
	{
		::MultiByteToWideChar(CP_ACP, 0, pszSource, strlen(pszSource), ptszTarget, nTargetLen);
	}
	return ptszTarget;
}
inline char* CharToUTF8(const char* ptszSource, char* pszTarget, int nTargetLen)
{
	WCHAR wszTemp[256] = L"";
	CHARToWCHAR(ptszSource, wszTemp, sizeof(wszTemp));
	WCHAR2UTF8(wszTemp, pszTarget, nTargetLen);
	return pszTarget;
}
inline char* CharToTChar(const char* pszSource, char* pszTarget)
{
	if (NULL != pszSource)
	{
		WCHAR ptszTarget[512] = L"";
		int nTargetLen = sizeof(ptszTarget);
		::MultiByteToWideChar(CP_UTF8, NULL, pszSource, strlen(pszSource), ptszTarget, nTargetLen);
		::WideCharToMultiByte(CP_ACP, NULL, ptszTarget, wcslen(ptszTarget), pszTarget, nTargetLen, NULL, NULL);
	}
	return pszTarget;
}

#endif