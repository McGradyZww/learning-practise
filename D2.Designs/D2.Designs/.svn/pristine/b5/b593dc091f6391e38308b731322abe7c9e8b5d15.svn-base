#ifndef __COMMAPI_INTERFACE_H__
#define __COMMAPI_INTERFACE_H__

#include <Include/ldcomm_interface.h>

/*
///整形类型定义
#ifdef _WIN32
	#define _WINSOCKAPI_ // 禁止windows.h包含winsock.h
	#include <windows.h>
	#include <winsock2.h>
	typedef char				int8;
	typedef short				int16;
	typedef int					int32;
	typedef __int64				int64;
	typedef unsigned char		uint8;
	typedef unsigned short		uint16;
	typedef unsigned int		uint32;
	typedef unsigned __int64	uint64;
#else
	#include <sys/types.h>
	#if defined(__linux__)
	#include <stdint.h>
	#endif
	typedef int8_t				int8;
	typedef int16_t				int16;
	typedef int32_t				int32;
	typedef int64_t				int64;
	typedef uint8_t				uint8;
	typedef uint16_t			uint16;
	typedef uint32_t			uint32;
	typedef uint64_t			uint64;
	typedef int     BOOL;
#endif

#define MODULE_SID  const char *
#ifdef _WIN32
  #if !defined( LD_CALL_MODE )
	#define LD_CALL_MODE		__stdcall
  #endif
  #ifdef BUILDING_DLL
    #define API_EXPORT __declspec(dllexport)
  #else
    #define API_EXPORT __declspec(dllimport)
  #endif
  #define DLLLOCAL
#else
  #define LD_CALL_MODE
  #define API_EXPORT __attribute__ ((visibility("default")))
  #define DLLLOCAL __attribute__ ((visibility("hidden")))
#endif

struct IUnKnown
{
	///接口查询

	virtual unsigned long  LD_CALL_MODE QueryInterface( MODULE_SID iid, IUnKnown **lppObj ) = 0;
	///引用
	virtual unsigned long  LD_CALL_MODE AddRef() = 0;
	///解引用
	virtual unsigned long  LD_CALL_MODE Release() =  0;
	
	virtual ~IUnKnown(){}
};

//	所有插件的公共接口
struct Imodule_interface : public IUnKnown
{
	//	返回I_OK：成功 I_NONE:失败
	virtual int  LD_CALL_MODE OnInit(void)=0;
	//	返回I_OK：成功 I_NONE:失败
	virtual void LD_CALL_MODE OnExit(void)=0;
	//	返回I_OK：成功 I_NONE:失败
	virtual int  LD_CALL_MODE OnStart(void)=0;
	//	返回I_OK：成功 I_NONE:失败
	virtual void LD_CALL_MODE OnStop(void)=0;
	virtual int  LD_CALL_MODE SetConfig(const char * lpPath, void * lpConfig)=0;
	virtual int  LD_CALL_MODE SetDependService(MODULE_SID iid, IUnKnown * lpService)=0;
	//	返回本插件依赖的其他插件的接口ID。所有ID串在一起，以一个空串""结束，示例如下：
	//  返回： "aaa\0bbb\0ccc\0\0"，表示依赖名为：aaa  bbb  ccc的三个插件
	virtual MODULE_SID  LD_CALL_MODE GetDependService()=0;
	virtual MODULE_SID  LD_CALL_MODE GetSID()=0;
	//	 获得启动和停止时的依赖关系	在启动或者停止本服务前，必须先启动或停止前置服务
	virtual MODULE_SID  LD_CALL_MODE GetPreStartService()=0;
	virtual MODULE_SID  LD_CALL_MODE GetPreStopService()=0;
};
struct ICallBack_interface : public IUnKnown
{

	//	回调必须严格按照如下返回值的含义返回：
	//	-1:		提示通信层，上层发生严重错误，需要关闭连接
	//	==0:	提示通信层，这是一个完整报文，上层已经成功处理，通信层可以丢弃该数据，且报文完整长度由lpFullLen给出
	//	1:		提示通信层, 目前的数据，还不是一个完整报文， 但是上层已经知道完整报文长度(由lpFullLen给出完整长度)
	//	2:		提示通信层, 目前的数据，还不是一个完整报文， 上层还无法判断长度
	virtual int LD_CALL_MODE onRecv(int iChannelID, uint32 dwConnectID, char* lpRecvData, int iRecvLen, int* lpFullLen) = 0;
	
	//	以下三个回调，一般来说，调用者无需关心，可以简单的空实现，返回0
	virtual int LD_CALL_MODE onDisconnected(int iChannelID, uint32 dwConnectID) = 0;
	virtual int LD_CALL_MODE onConnected(int iChannelID, uint32 dwConnectID) = 0;
	virtual int LD_CALL_MODE onSent(int iChannelID, uint32 dwConnectID, int iSentLen) = 0;
	
	virtual void LD_CALL_MODE NeedHeartbeat(int iChannelID, uint32 dwConnectID) = 0;
};


struct IComm_interface : public Imodule_interface
{

	//	返回通道ID，调用者必须记住自己的通道ID，在后续发送数据时用到
	//	返回： <0   加入通道失败  >=0:分配的通道号，调用者必须记住本通道号
	virtual int LD_CALL_MODE AddTcpPassiveChannel(char* lpLocalAddr, uint16 wPort, int iMaxAllowedConnections, ICallBack_interface* lpChannel) = 0;
	virtual int LD_CALL_MODE AddTcpActiveChannel(char* lpPeerAddr, uint16 wPort, BOOL bReConnect, ICallBack_interface* lpChannel) = 0;
	virtual int LD_CALL_MODE AddUdpChannel(char* lpLocalAddr, uint16 wPort, ICallBack_interface* lpChannel) = 0;

	
		以下2发送函数中的 iChannelID 来自于加入通道时的返回值
		而dwConnectID则来自于在连接建立时的回调，对于ActiveChannel类型的通道，dwConnectID可以取任意值
	
	//	调用通信模块的数据发送功能，数据接收在回调中
	virtual int LD_CALL_MODE SendData(int iChannelID, uint32 dwConnectID, char* lpData, int iDataLen) = 0;
	//	仅对udp通道有效（未实现）
	virtual int LD_CALL_MODE SendUdpData(int iChannelID, char* lpData, int iDataLen, sockaddr_in* lpTo) = 0;
	//	一些统计功能
};
*/
#ifdef __cplusplus
extern "C" { 
#endif

API_EXPORT IComm_interface * LD_CALL_MODE GetCommImplInstance();
API_EXPORT int 	LD_CALL_MODE StartCommImpl();
API_EXPORT int 	LD_CALL_MODE StopCommImpl();
API_EXPORT void LD_CALL_MODE DestroyCommImpl();

#ifdef __cplusplus
}
#endif

#endif
