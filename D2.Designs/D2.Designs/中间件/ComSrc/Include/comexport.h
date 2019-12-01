#ifndef __TS_STORE_DEAL_H__
#define __TS_STORE_DEAL_H__

#include <Include/com_interface.h>

//导出接口
#ifdef __cplusplus
extern "C" {
#endif
	API_EXPORT void LD_CALL_MODE Onload(char*, Icontainer_interface* lpContainer);
	API_EXPORT void LD_CALL_MODE Onunload();
	API_EXPORT void LD_CALL_MODE Onstart();
	API_EXPORT void LD_CALL_MODE Onstop();
	API_EXPORT int LD_CALL_MODE QueryInterface(int iFunIndex, LPBIZ_FUNC_INFO bizFuncInfo);
	API_EXPORT const char* LD_CALL_MODE GetLibVersion();
	
#ifdef __cplusplus
}
#endif

#endif