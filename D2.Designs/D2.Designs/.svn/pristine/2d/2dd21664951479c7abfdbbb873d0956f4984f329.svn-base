/**
	单例
**/
#ifndef __LD_T2SDK_INTERFACE__
#define __LD_T2SDK_INTERFACE__

#include "module_interface.h"
#include "./Modules/T2sdk_service/t2sdk_interface.h"


struct IT2sdk_interface : public Imodule_interface
{
	//发送与接收业务消息：请求报文(lpRequestMsg)和应答报文(lpResponseMsg)都由上层调用者来申请和释放。
	virtual int LD_CALL_MODE SendRecvFastMsg(IBizMessage* lpRequestMsg, IBizMessage** lpResponseMsg, unsigned uiTimeout = 5000) = 0;
	//获取具体的错误信息
	virtual MODULE_SID LD_CALL_MODE GetErrorMsg(int nErrorCode) = 0;
	//获取BizMsg
	virtual IBizMessage* LD_CALL_MODE GetNewBizMsg() = 0;
	//获取t2打包器packer
	virtual IF2Packer* LD_CALL_MODE GetNewPacker() = 0;
	//释放t2解包器packer
	virtual IF2UnPacker* LD_CALL_MODE GetNewUnPacker(void * lpBuffer, unsigned int iLen) = 0;
};

#endif