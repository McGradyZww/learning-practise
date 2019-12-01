#ifndef __SERVICE_INTERFACE_H__
#define __SERVICE_INTERFACE_H__

#include "module_interface.h"
#include "fastmsg_interface.h"

struct Iservice_interface : public Imodule_interface
{
	virtual int  LD_CALL_MODE PostMsg(IFastMessage*, Iservice_interface* lpSvrFrom) = 0;
	virtual int  LD_CALL_MODE SetUpModule(Iservice_interface* )=0;
	virtual int  LD_CALL_MODE SetDownModule(Iservice_interface* )=0;
	virtual int  LD_CALL_MODE SetIdentity(const char* lpIdentityNmae, const char* lpNodeName, int iMemberNo) = 0;
};

#endif
