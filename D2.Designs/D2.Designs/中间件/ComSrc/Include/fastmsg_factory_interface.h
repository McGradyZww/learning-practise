/**
	提供消息服务
**/
#ifndef __FASTMSG_MODULE_INTERFACE__
#define __FASTMSG_MODULE_INTERFACE__

#include <Include/fastmsg_interface.h>

struct IFastmsgFactory_Interface : public Imodule_interface
{
	//	具体接口待定！！
	virtual IFastMessage* LD_CALL_MODE CreateFastMessage(const char* lpFunc, int iPacketType) = 0;
	virtual int   LD_CALL_MODE GetTemplateFileVer() = 0;
	virtual char* LD_CALL_MODE GetTemplateBuff(int &iLen) = 0;
};

#endif
