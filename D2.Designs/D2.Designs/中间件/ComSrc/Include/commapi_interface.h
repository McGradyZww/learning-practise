#ifndef __COMMAPI_INTERFACE_H__
#define __COMMAPI_INTERFACE_H__

#include <Include/ldcomm_interface.h>

/*
///�������Ͷ���
#ifdef _WIN32
	#define _WINSOCKAPI_ // ��ֹwindows.h����winsock.h
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
	///�ӿڲ�ѯ

	virtual unsigned long  LD_CALL_MODE QueryInterface( MODULE_SID iid, IUnKnown **lppObj ) = 0;
	///����
	virtual unsigned long  LD_CALL_MODE AddRef() = 0;
	///������
	virtual unsigned long  LD_CALL_MODE Release() =  0;
	
	virtual ~IUnKnown(){}
};

//	���в���Ĺ����ӿ�
struct Imodule_interface : public IUnKnown
{
	//	����I_OK���ɹ� I_NONE:ʧ��
	virtual int  LD_CALL_MODE OnInit(void)=0;
	//	����I_OK���ɹ� I_NONE:ʧ��
	virtual void LD_CALL_MODE OnExit(void)=0;
	//	����I_OK���ɹ� I_NONE:ʧ��
	virtual int  LD_CALL_MODE OnStart(void)=0;
	//	����I_OK���ɹ� I_NONE:ʧ��
	virtual void LD_CALL_MODE OnStop(void)=0;
	virtual int  LD_CALL_MODE SetConfig(const char * lpPath, void * lpConfig)=0;
	virtual int  LD_CALL_MODE SetDependService(MODULE_SID iid, IUnKnown * lpService)=0;
	//	���ر������������������Ľӿ�ID������ID����һ����һ���մ�""������ʾ�����£�
	//  ���أ� "aaa\0bbb\0ccc\0\0"����ʾ������Ϊ��aaa  bbb  ccc���������
	virtual MODULE_SID  LD_CALL_MODE GetDependService()=0;
	virtual MODULE_SID  LD_CALL_MODE GetSID()=0;
	//	 ���������ֹͣʱ��������ϵ	����������ֹͣ������ǰ��������������ֹͣǰ�÷���
	virtual MODULE_SID  LD_CALL_MODE GetPreStartService()=0;
	virtual MODULE_SID  LD_CALL_MODE GetPreStopService()=0;
};
struct ICallBack_interface : public IUnKnown
{

	//	�ص������ϸ������·���ֵ�ĺ��巵�أ�
	//	-1:		��ʾͨ�Ų㣬�ϲ㷢�����ش�����Ҫ�ر�����
	//	==0:	��ʾͨ�Ų㣬����һ���������ģ��ϲ��Ѿ��ɹ�����ͨ�Ų���Զ��������ݣ��ұ�������������lpFullLen����
	//	1:		��ʾͨ�Ų�, Ŀǰ�����ݣ�������һ���������ģ� �����ϲ��Ѿ�֪���������ĳ���(��lpFullLen������������)
	//	2:		��ʾͨ�Ų�, Ŀǰ�����ݣ�������һ���������ģ� �ϲ㻹�޷��жϳ���
	virtual int LD_CALL_MODE onRecv(int iChannelID, uint32 dwConnectID, char* lpRecvData, int iRecvLen, int* lpFullLen) = 0;
	
	//	���������ص���һ����˵��������������ģ����Լ򵥵Ŀ�ʵ�֣�����0
	virtual int LD_CALL_MODE onDisconnected(int iChannelID, uint32 dwConnectID) = 0;
	virtual int LD_CALL_MODE onConnected(int iChannelID, uint32 dwConnectID) = 0;
	virtual int LD_CALL_MODE onSent(int iChannelID, uint32 dwConnectID, int iSentLen) = 0;
	
	virtual void LD_CALL_MODE NeedHeartbeat(int iChannelID, uint32 dwConnectID) = 0;
};


struct IComm_interface : public Imodule_interface
{

	//	����ͨ��ID�������߱����ס�Լ���ͨ��ID���ں�����������ʱ�õ�
	//	���أ� <0   ����ͨ��ʧ��  >=0:�����ͨ���ţ������߱����ס��ͨ����
	virtual int LD_CALL_MODE AddTcpPassiveChannel(char* lpLocalAddr, uint16 wPort, int iMaxAllowedConnections, ICallBack_interface* lpChannel) = 0;
	virtual int LD_CALL_MODE AddTcpActiveChannel(char* lpPeerAddr, uint16 wPort, BOOL bReConnect, ICallBack_interface* lpChannel) = 0;
	virtual int LD_CALL_MODE AddUdpChannel(char* lpLocalAddr, uint16 wPort, ICallBack_interface* lpChannel) = 0;

	
		����2���ͺ����е� iChannelID �����ڼ���ͨ��ʱ�ķ���ֵ
		��dwConnectID�������������ӽ���ʱ�Ļص�������ActiveChannel���͵�ͨ����dwConnectID����ȡ����ֵ
	
	//	����ͨ��ģ������ݷ��͹��ܣ����ݽ����ڻص���
	virtual int LD_CALL_MODE SendData(int iChannelID, uint32 dwConnectID, char* lpData, int iDataLen) = 0;
	//	����udpͨ����Ч��δʵ�֣�
	virtual int LD_CALL_MODE SendUdpData(int iChannelID, char* lpData, int iDataLen, sockaddr_in* lpTo) = 0;
	//	һЩͳ�ƹ���
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
