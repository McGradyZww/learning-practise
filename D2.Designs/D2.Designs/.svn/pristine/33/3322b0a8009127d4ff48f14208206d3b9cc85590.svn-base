/**
	允许创建多实例
	//	心跳的约定：
		侦听端配置心跳时间，而连接端通过协调获得彼此的心跳
**/

#ifndef __LD_COMM_INTERFACE__
#define __LD_COMM_INTERFACE__
#include <OS_Independen/basetypes.h>
#include "callback_interface.h"

//	通信接口
//	发送和接收的一个报文长度不能超出16M！！
struct IComm_interface : public Imodule_interface
{
	/**
		以下三函数，线程不安全！！所有的通道必须在启动之前全部加入!
	**/
	//	返回通道ID，调用者必须记住自己的通道ID，在后续发送数据时用到
	//	返回： <0   加入通道失败  >=0:分配的通道号，调用者必须记住本通道号
	virtual int LD_CALL_MODE AddTcpPassiveChannel(char* lpLocalAddr, uint16 wPort, int iHBTime, int iMaxAllowedConnections, ICallBack_interface* lpChannel) = 0;
	virtual int LD_CALL_MODE AddTcpActiveChannel(char* lpPeerAddr, uint16 wPort, BOOL bReConnect, ICallBack_interface* lpChannel) = 0;
	virtual int LD_CALL_MODE AddUdpChannel(char* lpLocalAddr, uint16 wPort, ICallBack_interface* lpChannel) = 0;

	virtual int LD_CALL_MODE SetHBTime(int iChannelID, int iHBTime) = 0;
	/**
		以下2发送函数中的 iChannelID 来自于加入通道时的返回值
		而dwConnectID则来自于在连接建立时的回调，对于ActiveChannel类型的通道，dwConnectID可以取任意值
	**/
	//	调用通信模块的数据发送功能，数据接收在回调中
	//	iDataLen 最大不能超出16M，否则，调用会报错
	//	返回值：已经成功发送的字节数， >=0  正常， <0: 发送失败
	virtual int LD_CALL_MODE SendData(int iChannelID, uint32 dwConnectID, char* lpData, int iDataLen) = 0;
	//	仅对udp通道有效（未实现）
	virtual int LD_CALL_MODE SendUdpData(int iChannelID, char* lpData, int iDataLen, sockaddr_in* lpTo) = 0;
	//	一些统计功能
	
};



#endif
