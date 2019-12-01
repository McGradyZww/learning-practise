#ifndef __LD_V2_SDK_H__
#define __LD_V2_SDK_H__

#ifdef _WIN32
	#if !defined( LD_CALL_MODE )
	#define LD_CALL_MODE		__stdcall
	#endif
#else
	#define LD_CALL_MODE
#endif

struct ICallBack
{
	virtual int LD_CALL_MODE OnConnected()=0;
	virtual int LD_CALL_MODE OnDisConnected()=0;
	virtual int LD_CALL_MODE OnAsynAnswer(int hSend, IFastMsg* lpMsg)=0;
	
}
struct ILDconnection_interface
{
	virtual int LD_CALL_MODE Init(const char* lpCfgFile, ICallBack* lpCallBack)=0;
	virtual int LD_CALL_MODE ConnectSvr()=0;
	virtual int LD_CALL_MODE ReConnect()=0;
	virtual int LD_CALL_MODE DisConnect()=0;
	//	返回：发送句柄，应答返回时对应回调中的hSend
	virtual int LD_CALL_MODE AsynSend(IFastMsg* lpMsg)=0;
	virtual int LD_CALL_MODE SendRecv(IFastMsg* lpInReqMsg, IFastMsg* lpOutAnsMsg, int TimeOut)=0;
};

#ifdef __cplusplus
extern "C"
{
#endif

ILDconnection_interface* LD_CALL_MODE CreateConnection()
IFastMsg* LD_CALL_MODE CreateFastMsg()

#ifdef __cplusplus
}
#endif

#endif	//	ifndef __LD_V2_SDK_H__
