/**
**/
#ifndef __CONTAINER_INTERFACE__
#define __CONTAINER_INTERFACE__

#include <Include/module_interface.h>		//	模块接口
#include <Include/log_interface.h>			//	日志接口
#include <Include/config_interface.h>		//	配置接口

struct Icontainer_interface : public IUnKnown
{
	//	根据名字获得各个模块的主接口！！
	virtual IUnKnown* LD_CALL_MODE GetMouleByName(MODULE_SID sid) = 0;
	virtual int LD_CALL_MODE Init(const char* lpIdentityName, int iMemberNo, ILog_interface* lpLogInt, ICfgSvr* lpCfgSvr, IRCfgNode* lpCfgNode) = 0;
	virtual int LD_CALL_MODE LoadAllModules() = 0;
	virtual int LD_CALL_MODE InitAllModules() = 0;
	virtual int LD_CALL_MODE StartAllModules()= 0;
	virtual int LD_CALL_MODE StopAllModules() = 0;
	virtual int LD_CALL_MODE AboutToExit()    = 0;
	virtual void  LD_CALL_MODE OnManager(IFastMessage* lpInReq, IFastMessage* lpOutAns)=0;
};
#endif
