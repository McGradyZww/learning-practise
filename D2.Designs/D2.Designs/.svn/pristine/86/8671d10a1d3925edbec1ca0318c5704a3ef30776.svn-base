/**

**/

#ifndef __TS_SUBCALL_INTERFACE_H__
#define __TS_SUBCALL_INTERFACE_H__

#include "module_interface.h"

struct ITS_Subcall_interface : public IUnKnown
{
	//	请求  应答  超时时间(单位ms)
	//	返回	0： 成功	<0: 系统级错误	>0: 业务层错误
	virtual int LD_CALL_MODE SubCall(IFastMessage* lpReqMsg, IFastMessage** lppAnsMsg, int iTimeout) = 0;
};

#endif
